Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3321251F1B7
	for <lists+samba-technical@lfdr.de>; Sun,  8 May 2022 22:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=eRry+1r4fXz2n3UvIzCm0O8WAyj8yiwT34F7cY6AGU4=; b=Ov7/pvEtKaV84P4NBS1i8iJdgh
	qzPLxfZznUX3EReAZ44Pg2kRvx59C8QqZZ8YkXVsYWbJUQLkBo7sll9P76BlfcONAwZobEdGuXTpE
	pos8tjgzpDGHDn384IO4Y0Rsx2+r4Zqon/jFAglkrsmxmwl5M1NooeKWVLW6qwvrAIqvnTXAOvGHe
	KqqGSlMqoBbn3NitwnZkgqVzdDw6bNCFn4+Dgk5PLTZ1glmUMBY51xGUo84ZkT+J5S5/58XbkSKLw
	CSAYYEehnooDfRQ7Nr6fZijpIOD5KhLo0s0h6lIkAItRj/AowsBGNVg3pvyVJS4btA2a4WVrUT9gg
	uODqoI6A==;
Received: from ip6-localhost ([::1]:27896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nnnu6-006oo0-NN; Sun, 08 May 2022 20:53:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28208) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nnnu1-006onq-FX
 for samba-technical@lists.samba.org; Sun, 08 May 2022 20:53:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=eRry+1r4fXz2n3UvIzCm0O8WAyj8yiwT34F7cY6AGU4=; b=ttQfTjwPnI6Ku4lnFVtCGORaIZ
 xHfwdwo0FcGbjJjhIjiqDRzJyyj0bNkpxHeYKphik32ACUZCHD0U7Mv9D9gNiXaM8Wf/NpQ4RRZ/A
 qbmjHIK+0LNtj6nt6gonhHC2xwkOHMmgdlCsIwKMIG0mp8uzEnlWQeSi+T+sDTiv9Ic+BrFvXXAm8
 1j0nxWJYALjUhDZBhtvMUQtGfqLep3Ex76pd16S7r8YpHhJf+37NicG5XXfDoPCZjUmhUVxGVx3A7
 AM+V8mpskzSCEtNY33v2fHibJ/5jhu4FuddlguMsvlm3EWFG4IaziS9ag5Wx3m5nlXRnU4K7F7Haa
 VEdTRUh6vg3n9+3AXC2Hem8MJi4j6bSggGky3yGiUHe0/7EWHKgm0/qByBM8zx5yv1PSYCvkMppmg
 6o1ZP95X/i/Yy/wPE+0hXffZjtvMwauvvDFAGZozcTHOe5g5efTcmUkSgZ8n/e6po2Fp0j6Pg7dct
 CUOOn89rPfklGNa1NYk97P98;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nnntz-004y3n-W1; Sun, 08 May 2022 20:53:16 +0000
Message-ID: <61faf7be6359dfb8a87445041b2b1ccac23d147e.camel@samba.org>
Subject: Re: waf, PYTHONHASHSEED & -I order on other architectures
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Mon, 09 May 2022 08:53:12 +1200
In-Reply-To: <76a4f905-6f2a-18f4-7c9d-f9846681ec01@msgid.tls.msk.ru>
References: <76a4f905-6f2a-18f4-7c9d-f9846681ec01@msgid.tls.msk.ru>
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

On Sat, 2022-04-09 at 09:41 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
> 
> I'm having a build failure of samba on sparc64.  It fails due to
> finding
> wrong include for <gssapi/gssapi.h>, as it has already seen before
> due to
> PYTHONHASHSEED not being set, having python hashes in random order so
> -I
> includes were unpredictable.
> 
> The good -I order is this:
> 
>   -Ithird_party/heimdal/lib/gssapi
>   -Ithird_party/heimdal/lib
> 
> the bad is:
> 
>   -Ithird_party/heimdal/lib
>   -Ithird_party/heimdal/lib/gssapi
> 
> (I picked up only the -I options for dirs where <gssapi/gssapi.h>
> exists).
> 
> This is stable on sparc64, all builds of samba-4.16 are failing due
> to
> this very issue.
> 
> How to work around this?

I agree that at this point there is a bug, but nobody has had the time
to work out the missing dependencies or get into the guts of waf to get
a more proper solution.  

Yes, setting PYTHONHASHSEED thing is a great paper-over, but just locks
in the order per-arch allowing reproducible debugging, not a real fix.

Perhaps change PYTHONHASHSEED until the order gets right and lock that
in for now?  (Barf!)

It would be worth working with upstream Heimdal to determine if the
ambiguous headers are really needed. 

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


