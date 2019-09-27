Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F235C0862
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 17:14:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ImbLNPWV9ORbzqhbmcF0FCZp5/xJSpSYVPnjztIGdAY=; b=nh9ff+VeOcgXcQLJjPktQwZHuW
	PqrzCMTcfb84q2Xp7ILXcsfEXENfi32vqFGyjl2Ph32PW/dY3LykAA8AFxXuCKP9I2Ia0zkAdkdGq
	jZeINgUtKjj3AXGynfh+8EHaBX/yXSgVUQCndGTpuNkudEc7FGzdqi6BvTmnZ58OUsH9AU+52Zz7/
	bjb44+l2D3cQXPBdJ4+ya1z9gcc6vr3LqfZYfv0uEti8G8ryIfd3N9FNsFhLpIalsg3afsRk5dfhE
	FIDhON+4hFKx7k15oao1kJkoJj7bS6Fdh4EQmuwkoOuERLUUwiIAtDNWntyvLtu5zj3fPt9qOllqe
	dfdmJokA==;
Received: from localhost ([::1]:50978 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDrvc-00998q-Jx; Fri, 27 Sep 2019 15:13:04 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:57848
 helo=outgoing.mit.edu) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iDrvY-00998Q-1H
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 15:13:02 +0000
Received: from [18.30.8.89] ([18.30.8.89]) (authenticated bits=0)
 (User authenticated as ghudson@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x8RF1JEA029640
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT);
 Fri, 27 Sep 2019 11:01:22 -0400
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
To: Stefan Metzmacher <metze=40samba.org@dmarc.ietf.org>, kitten@ietf.org,
 Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>,
 "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>
References: <f33d5f68-1fdc-c1bc-c702-70b054880bb4@samba.org>
 <649fa812-aacf-80b6-1976-a719eca60fc2@mit.edu>
 <33c431f5-c36b-c321-de3f-65977d8aa898@samba.org>
 <007c29e8-02b9-4f48-f67e-881cb0985d64@mit.edu>
 <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <d50c2b41-d0de-b47a-b47b-781fe4b1abe3@samba.org>
Openpgp: preference=signencrypt
Message-ID: <bfaf6ce7-5cb1-8d42-5b49-11b5e1c0b18f@mit.edu>
Date: Fri, 27 Sep 2019 11:01:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <d50c2b41-d0de-b47a-b47b-781fe4b1abe3@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 18.9.28.11
 (outgoing-auth-1.mit.edu) incorrectly presented itself as outgoing.mit.edu
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Greg Hudson via samba-technical <samba-technical@lists.samba.org>
Reply-To: Greg Hudson <ghudson@mit.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/25/19 4:09 AM, Stefan Metzmacher wrote:
> I just realized that verifying the PAC gains no additional protection.
> As the client realm, client principal and transited fields is
> in the encrypted part of the ticket, which is encrypted with the machine
> trust password.

I don't think this follows.  It's true that the PAC, client principal,
and transited list are all coming from the service's KDC with integrity
protection, but the question is to what degree the KDC is vouching for
that information.

If the TRANSITED-POLICY-CHECKED flag is not set in the ticket, the
service should assume that the KDC applied no policy to the transit
path.  In practice, the DISABLE-TRANSITED-CHECK request flag, together
with MS-KILE 3.1.5.4, means that it is easy to get most KDCs not to
apply policy.  Without policy controls, any realm in the transitive
closure of cross-realm keys can issue tickets for clients in any other
realm (except perhaps the service realm itself).

The PAC contents, on the other hand, may be subject to policy controls.

> I implemented GSS_KRB5_CRED_NO_TRANSIT_CHECK_X for
> MIT, Heimdal (both upstream and Samba) and make use of
> it in Samba.
[...]
> So we need to push it Heimdal first in order to avoid
> conflicts later.

From past discussions I would not expect the Heimdal project to take
action on a patch in an email attachment sent to the discussion list.  I
would suggest making a pull request at
https://github.com/heimdal/heimdal .

