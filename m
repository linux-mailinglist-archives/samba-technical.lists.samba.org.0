Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A9986146E4B
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jan 2020 17:27:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=jHV6vjf4FzryyV7vW/2pOcTQap+xZIAHbMWsB8K4lJM=; b=ZM+IcmQd0j9+78E8a1Lg3+UzCd
	Isc9q3oMTfMjxTs49THhw2TH2OgzH5TzQs0fupfLvXJ0xiW1yXUVZU+IcBUfKmCjqXf/KqBAL2CrM
	K/fNw1YgvG8N+RWvB5oh7VhpVAsVSBMTmyfOwEPhv0tYqtD+iwXbNuBv1Boj1us4cvxLhk4I4c6eZ
	PRNOb1W0T2UNGoSbO7k95HTEpZJOsJ2ZPYSp+8dSuxcAms1L2tFeZ1YQFbqAPlK/V5uNFF4f7dUBW
	WS6Ws6mjU2c1d8Bx0PUG/UcTfFrf2xUxWrCLdNOLD2W6cAmoy9KFKvM4YAOYc7oEsll/VgEKh3v/H
	TV4a/9EA==;
Received: from localhost ([::1]:28024 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iufJN-004QkM-RN; Thu, 23 Jan 2020 16:26:29 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:57122
 helo=outgoing.mit.edu) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iufJF-004QkD-Th
 for samba-technical@lists.samba.org; Thu, 23 Jan 2020 16:26:24 +0000
Received: from [18.30.9.159] ([18.30.9.159]) (authenticated bits=0)
 (User authenticated as ghudson@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 00NGFWAd005533
 (version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NOT);
 Thu, 23 Jan 2020 11:15:34 -0500
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
To: Stefan Metzmacher <metze=40samba.org@dmarc.ietf.org>,
 Nico Williams <nico@cryptonector.com>
References: <69d80d24-d461-1652-3cfb-e55d90d31fbf@samba.org>
 <ec067a72-313e-1878-33a0-a3259d2979d5@mit.edu>
 <1503578184.3428.19.camel@redhat.com>
 <db882372-aa1d-e58e-4c94-a268539bd2ee@samba.org>
 <1503596189.3428.26.camel@redhat.com>
 <F363B51E-FDF7-4C91-9ABD-B623B5CE97BC@dukhovni.org>
 <8f68cfb0-2d6b-d86f-4ff0-a9282aa0bf55@samba.org>
 <cb0d7433-9e23-5bce-4e06-1213bf88cade@samba.org>
 <20191121223908.GC26241@localhost>
 <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
 <20191122224526.GA28614@localhost>
 <8b72197d-2fcc-5b4f-4392-12d53d1ec624@samba.org>
 <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
Openpgp: preference=signencrypt
Message-ID: <3d693bdd-9a4c-7135-318e-593e18e52cd0@mit.edu>
Date: Thu, 23 Jan 2020 11:15:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5bcc2951-afdf-0849-5c16-f542afe214a1@samba.org>
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
Cc: kitten@ietf.org, "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>,
 Samba Technical <samba-technical@lists.samba.org>,
 "krbdev@mit.edu Dev List" <krbdev@mit.edu>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 1/23/20 6:25 AM, Stefan Metzmacher wrote:
> it would be great if we could make some progress here...

Does this need to be an application flag, or can it be in the krb5.conf
realm configuration?  Presumably people are currently working around
this by setting [capaths] on the server; a realm variable would simplify
this workaround by not requiring specific knowledge of the domain geometry.

I reviewed the thread, and it sounds like the current understanding is
that AD applies a transited check (of sorts) to cross-realm tickets, but
 doesn't say so by setting the transit-policy-checked flag in the
ticket.  From the upstream point of view the server's realm
configuration is in a better position to know that the realm is an AD
realm than the server application; perhaps that is not true from Samba's
point of view, but I thought I would check.

