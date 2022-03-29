Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30DE74EA4C4
	for <lists+samba-technical@lfdr.de>; Tue, 29 Mar 2022 03:50:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=McH4GCc2nwv3NYo5FD7suzHDMnnVy3Zg0/DQQYvPUFE=; b=S7fFrNQ1W0b1QyYF/rMuXhUEz+
	LiSOVnKVJHYsH5+olGNf6Vw9QoOWzy/AcMkzhnT+Y/wNmgaaCdAPoD48rtD4zq4bOztC4IllXXCak
	JbSVpDgUEYBto+HpuUb4lG7jfIPEZp1wZ+ECn198Sg6JOECO7qcCDK5GXoz2ft+hVe696wytu2fEe
	IMhwEhCQrzxrv03BCLvw7m7vsLtoVOU+QOJKMjNY47s32wQUuD5+ZdvG1M3Rb+SrqdvNknoVZpIsn
	rq8a6XL2OqAl1IvMOPywBF2GD8deaeubAqmLjGwmQYhS4pN5bg6UMSjbkiISdSFyv/Vd1diVApfWu
	BJ6sWvzQ==;
Received: from ip6-localhost ([::1]:23906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZ0zP-006BA7-Cv; Tue, 29 Mar 2022 01:49:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37980) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nZ0zJ-006B9x-TK
 for samba-technical@lists.samba.org; Tue, 29 Mar 2022 01:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=McH4GCc2nwv3NYo5FD7suzHDMnnVy3Zg0/DQQYvPUFE=; b=TOoAqql7vgORmqWRzzOV6kDx5B
 BmBXnqCXith2Q7lJYFZ1mAQo0Bt7SPeXfZ8RIljd/uLoGN374CtAorhQ86il2oj7C51N5BG6WdTyz
 7idK04ArkCLs0+k8wOo4f+3JpLeAMB24xUTzDCPk7n08OLJVLezYk/JwbDPV0mLh3BoJUPZkLlTXP
 iz5/E6TTH5IqkuFVZvTTFRFLkDrxIEnbIm5aZC1sP/0GRqjHBVVibtYnwwhlfDHQbWGd7zDx/NgMJ
 hFQZPE3ZWe2QLJoX+gNJiLk8I9sOEN8/XmyRBQy4Myr2yP23AU3amr8XUNl+CxkOSOxUzqZxnRJdd
 sgrx45kGbowThqFIo6siOTRvV8nsik6qWk9RhoPlZBd1GoGtRElk4DasW44Wp/Pb2V8Qe7542knR+
 +/APSZD+OUfKXoJ6tVUSQWuA5KGsZ3pCpGuC4H2IjTNv0Xhv0rs/3J1vno1UnvDQkOFOTkXeXVtGE
 6IBVNwvcLj1q6U+NGt2Sz5qF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nZ0zI-0046KP-Dn; Tue, 29 Mar 2022 01:49:37 +0000
Message-ID: <dd5cc07df7125de729cb5eca87ec4f0d101974dc.camel@samba.org>
Subject: Re: heimdal headers ordering (gssapi/gssapi.h, crypto-headers.h)
To: Michael Tokarev <mjt@tls.msk.ru>, Stefan Metzmacher <metze@samba.org>, 
 samba-technical <samba-technical@lists.samba.org>
Date: Tue, 29 Mar 2022 14:49:32 +1300
In-Reply-To: <7980f215-2192-5caf-b436-e5cf781ffb87@msgid.tls.msk.ru>
References: <412176a7-bbb3-1937-357d-5325ec4f5d2d@msgid.tls.msk.ru>
 <bffcbec6-8e6c-e076-ff0a-2ce00047fe04@samba.org>
 <9d28aabc-dd1c-d2c9-fb7d-db05ab40a6f1@msgid.tls.msk.ru>
 <4fe2488cc85607e4fa9de85f7ab644b75ce00a84.camel@samba.org>
 <7980f215-2192-5caf-b436-e5cf781ffb87@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2022-03-28 at 12:53 +0300, Michael Tokarev via samba-technical
wrote:
> 28.03.2022 11:21, Andrew Bartlett wrote:
> > On Mon, 2022-03-28 at 11:13 +0300, Michael Tokarev wrote:
> > > It'd be very nice to have this fixed inside waf too :)
> 
> If not fixing it in waf, but at least waf can check if
> PYTHONHASHSEED is set and refuse to run if it is not.
> This will save a lot of grief like in that bugreport,
> like I encountered too, and like another bugreport
> against upstream heimdal with proposals to fix their
> headers.. :)

https://gitlab.com/samba-team/samba/-/merge_requests/2463

> > Just so you know how that works, like the other 'third_party'
> > components, to do that we would need to work it with upstream, then
> > import a new version.
> 
> Is waf also an external tool?  Okay... :)  Anyway, it can
> be patched in samba locally just to prevent this from
> happening. :)  Hopefully there will be less issues now
> once we release 4.16 in debian (and I hope to address
> this very issue in the next debian stable upload too).

So, waf is a tool to build build systems.  The core of waf is a
third_party library that we consume, and then we provide scripts that
run as part of it (the wscript files and scripts under wafsamba).

So some things we fix in our use of waf, others like how dependencies
are ordered etc we need to fix upstream first, lest we end up
maintaining our own version of waf forever.

Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


