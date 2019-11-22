Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35BE4107B09
	for <lists+samba-technical@lfdr.de>; Sat, 23 Nov 2019 00:02:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=o9njnqTB2a5D4VYFyy6vxmysPo2czKFnlEfFHTXoZ7Y=; b=ju7ZbarR3Mb/64byTbJEW0bvb9
	NzMQiK7jO+lxhYhVEodq7DiZg+saMLJpkt1tOCdnFHMAvHEKoE/QPoMlQ2Aw8iPmn4/a2/yxjgAck
	LXMhkTIGMYJI9hJxlGDMlG4/T0F8DFNkAX6qxjSYFepB4TdFbemUKLEfPmegtLBJYTsCclvqZHY/H
	NwoMeCFsqZi1LOcHXd/9LNUzoQjhs7hT7w9tVAKwf2g2S7ZY7UU0Trcg9j7cy54bwvQtsXYJk+MyT
	EfYxmkRase+4BDpHdL+KWotQvv9Xk5R1mdBnUyzJ9bwhXVEMCLQhgV3qi1zF/FNiHZujJwC8hNMcI
	4NrLHFNg==;
Received: from localhost ([::1]:62424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iYHvx-002AHv-BG; Fri, 22 Nov 2019 23:01:49 +0000
Received: from camel.birch.relay.mailchannels.net ([23.83.209.29]:47153) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iYHvr-002AHo-M2
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 23:01:46 +0000
X-Sender-Id: dreamhost|x-authsender|nico@cryptonector.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
 by relay.mailchannels.net (Postfix) with ESMTP id 3AD313C0C0C;
 Fri, 22 Nov 2019 22:45:41 +0000 (UTC)
Received: from pdx1-sub0-mail-a3.g.dreamhost.com
 (100-96-14-7.trex.outbound.svc.cluster.local [100.96.14.7])
 (Authenticated sender: dreamhost)
 by relay.mailchannels.net (Postfix) with ESMTPA id 801AF3C0FE6;
 Fri, 22 Nov 2019 22:45:40 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|nico@cryptonector.com
Received: from pdx1-sub0-mail-a3.g.dreamhost.com ([TEMPUNAVAIL].
 [64.90.62.162]) (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384)
 by 0.0.0.0:2500 (trex/5.18.5); Fri, 22 Nov 2019 22:45:41 +0000
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|nico@cryptonector.com
X-MailChannels-Auth-Id: dreamhost
X-Oafish-Stop: 22f4a266532a0783_1574462740852_726097635
X-MC-Loop-Signature: 1574462740852:1219900066
X-MC-Ingress-Time: 1574462740852
Received: from pdx1-sub0-mail-a3.g.dreamhost.com (localhost [127.0.0.1])
 by pdx1-sub0-mail-a3.g.dreamhost.com (Postfix) with ESMTP id 2219582418;
 Fri, 22 Nov 2019 14:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=cryptonector.com; h=date
 :from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=cryptonector.com; bh=xHVDTPFKIfRtHv
 Dj6yQyRuX+ack=; b=sKRW2JcohJaX4jwv6DGIG3QNtfddM79/3Lcv17IJVy8npl
 soxA2XSAbH81j4FCrO8riI5WQZsKf2scRD0OnB+IAuN1+8QDlt9SkcCzdUzna7cV
 Rm3vtJ4OqB15fwaOV4eFRWPsFbN0WCOFkOx/Q4NwkAmJ20+b3J5m+55wmUc20=
Received: from localhost (sdzac10-108-1-nat.nje.twosigma.com [8.2.105.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: nico@cryptonector.com)
 by pdx1-sub0-mail-a3.g.dreamhost.com (Postfix) with ESMTPSA id EFD2E8241B;
 Fri, 22 Nov 2019 14:45:31 -0800 (PST)
Date: Fri, 22 Nov 2019 16:45:28 -0600
X-DH-BACKEND: pdx1-sub0-mail-a3
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: [kitten] Checking the transited list of a kerberos ticket in a
 transitive cross-realm trust situation...
Message-ID: <20191122224526.GA28614@localhost>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22f96c93-0217-0b2b-d7e1-684f9269fba4@samba.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Nico Williams via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Williams <nico@cryptonector.com>
Cc: "heimdal-discuss@sics.se" <heimdal-discuss@sics.se>,
 Viktor Dukhovni <viktor1dane@dukhovni.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Greg Hudson <ghudson@MIT.EDU>, "krbdev@mit.edu Dev List" <krbdev@mit.edu>,
 kitten@ietf.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Nov 22, 2019 at 11:24:44AM +0100, Stefan Metzmacher wrote:
> > Correspondingly and symmetrically, the right way to request some
> > behavior on the side where the credential is available, is to associate
> > that request with the desired_name for which the credential is acquired.
> 
> So you mean we need to pass an explicit desired_name to
> gss_acquire_cred_from() and use gss_set_name_attribute() calls
> (for no_transit_check and iterate_acceptor_keytab) on that desired_name
> before?

Oh, wait, right.  That's not going to work when you want a default
credential.

Alright.  I've got a nasty cold and can't think straight, and deadlines
to meet to boot too.  I'll respond more thoughtfully some time next
week.

Nico
-- 

