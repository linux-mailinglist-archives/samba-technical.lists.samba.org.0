Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4CD36FEBA
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 18:38:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fie1xUZXyefMfkYQAB185M0Vvvjsdd/DCpvDtmX0Skk=; b=INVm4qTeT7F/RIEztxjLCb9S0n
	t1Pt33cFBz68jnTRUswMd1Mr7iVIyOw/1UpX6sePA0cBIov2VCRoixl4TOG8H0T6f2Tc6YEGh4Jmw
	KV+Hk/nk1a1z2Mp3k1uQ0lFoNwGLicoXmiLFOSGvQejo17aE0yu6LExa53CLBJAnDQ+ruwwSgmx3L
	o1imtsDIibWTEhBuhSU/OV4DT4/aF5tJY/G8Zc4C2B7uLrSNkk+d8d+rqQJKIPgpdeVfbu82BwQ/w
	Zh4mpo76NoWRZicQgCRd4JPEdNHka28PqcRSXRrem7Ex5BvMQTWPFtkf3nzBmyiuYEPXAhStPI4JS
	9rIdBHrQ==;
Received: from ip6-localhost ([::1]:46790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcW8f-00DJiP-2N; Fri, 30 Apr 2021 16:37:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcW8Z-00DJiI-TS
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 16:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=fie1xUZXyefMfkYQAB185M0Vvvjsdd/DCpvDtmX0Skk=; b=FdKoLj4C4gkgcsthDNi6MZa4iG
 kfB3oUnrOoXrDDf2Wy/km16bH5EMFyp+7krVFASqjgOOx1nhCu9LCVeSJBxx0P89SbQMTYb/G3mw+
 05gqc2Hufv2PHHwEmg6cRjfxa1tUkIhWtlPRYeghNwbsrDY5M1yEm6mNy/sQfCrT3Xge6yyAon7nA
 cpgDWcvIxh+59RGoPniWsjAk/yW/kZDGZxm/vAnvKBBM7mxXYCIuJJbbVI9/Fkrhb2dseaoPDZH4k
 0haxMk4z/vtQRN0JvjiRWXzwqvffS+F1fqCWxozSxYH6FVF12sO01xhdVjLp0ZNt8FcV3iuRfR0FV
 sB2tGfhcyVXwdzLuu34Me3YH+wS0YQDFRSnnySWU659DVHACwlXIox1dVSPIUM4RSuIJCLlhvfOiP
 GqIQwV2UtXpA21h7h5MRuaarh0VFabzTyvQFhVJ6h+1tM7okBrnon+WKFQgaFynkBQYdStjcBqR6c
 CAGeZSRfwMEBZ2PXoYjkrZ67;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcW8Y-0003Xa-Es; Fri, 30 Apr 2021 16:37:07 +0000
Date: Fri, 30 Apr 2021 09:37:02 -0700
To: Igor Chudov <nir@basealt.ru>
Subject: Re: Ubuntu's ADSys
Message-ID: <20210430163702.GA977373@jeremy-acer>
References: <YIaZmO3WleOfenUn@pinega.vda.li>
 <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
 <1d705810-cb2b-4012-6431-bf92cd5b213d@samba.org>
 <RCZBSQ.RP64LWX1DB4B@suse.com> <YIrXaNVMOKnOCt+3@pinega.vda.li>
 <aef2178b-28a4-baa0-1b54-8f4c7560fd4f@samba.org>
 <6112d37d-e7f8-e3fa-0c86-15800aa64cee@basealt.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6112d37d-e7f8-e3fa-0c86-15800aa64cee@basealt.ru>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Apr 30, 2021 at 01:07:55PM +0400, Igor Chudov via samba-technical wrote:
>Hi!
>
>Our team is also working on client-side GUI tools for Samba domain: 
>https://github.com/altlinux/admc . I'm working under David's 
>supervision to implement source3 registry (Python) bindings for Samba 
>( https://gitlab.com/NIR-Ginko/samba/-/merge_requests/1/diffs ) in 
>order to merge https://github.com/altlinux/gpupdate/ with Samba.
>
>Any help is appreciated because I'm new to Samba codebase.

We will help as much as we can ! Just ask the questions you
have and we'll see if we can answer them. Thanks for working
on this, it is much appreciated.

