Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A98B1DC7D
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 19:34:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=tbKPm5+Qt2HRExZCxY+vslzlfFaU2v72eTeMsgMRd/U=; b=4EcKAlpUR/o6Gci9l2NiqwJeYk
	dgGocWiC2GMJPZLudD+HfnYt7moRSo9/limwxydSn0dpP9hf8trGBGbfQnpUee6wDDbtoFEoWvEIZ
	HhHIdjYNfVWpluGta7BWly1sCWTxHtDNqUPH7fTqq9Ahf5QDbf9GDeoV4LKEAxh/yfz0Wec8jDKML
	VnGAZvuXJa+fBwxmiywFzYyWXRD3V1JJh25bEGjfxT5nnNPIHzhAuXcq63p6ElwQe+cwRm0pkvCi3
	Ymdi+6HA7e3oOYHGBa7QeBNvf/RhfqG8TBwIbiVFKqBjn0VyszOMgEhiBtyoOqyiSG6RVIviLf4jG
	A7SO9+MQ==;
Received: from ip6-localhost ([::1]:31976 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk4Un-00Eael-R1; Thu, 07 Aug 2025 17:33:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36516) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk4Uk-00Eaed-2F
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 17:33:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=tbKPm5+Qt2HRExZCxY+vslzlfFaU2v72eTeMsgMRd/U=; b=wmcAUPgKxNJs+ShcYa1oeVy2r4
 DRVzLjkpBpuoLJKYr4OmWUYUddzlUwEadEuOwFg2iug97ry8x6t4zwp32/Tvcl6op0UG4F47NiGS8
 FW69BDQ8/6NtNhm2MzCi+FpoH3knbrUmL1cH6DxXJd0J2V2et1S/RSFQLkgv0hHnatAyeed7mrz1i
 qkJNTP5Hr34BWz7+i9oIgwBdJk7lHWATCdd/FBO2ZdG7MGPNvbmaDQnbhufoqP5hoGIv+psNIW5Ny
 xtXgIlSEeWMBKqCc2aGm2o3Qn3IfvdlLbmNzF1s6fFejww7+6KDJK11qwXqziDUD/B4GQQ0J03Pq8
 a7LBAxEc0sbshIkdYGcji6oEejZJVYnKS35ReRyu2pwcxyOpj1O0MPyp9JcFC5ilpOBy4SwI679Na
 p4HL/WHZkO0WgtMCby4r89yrLwc+/NZ+XYHUD5ewLs8/n/SaIoUS7uKKTZjwr8O7ib/W98sc0W8oz
 gZh5wRo3K0Z9iOvrNwYwk/GE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk4Uj-001di2-2A; Thu, 07 Aug 2025 17:33:37 +0000
Date: Thu, 7 Aug 2025 20:37:45 +0300
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: new deps for new ldb module (in 4.23)
Message-ID: <aJTkachtlSAw1nIW@toolbx>
References: <732bd60b-7df6-49bb-84da-cabd30e7ccaf@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <732bd60b-7df6-49bb-84da-cabd30e7ccaf@tls.msk.ru>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 07 Aug 2025, Michael Tokarev via samba-technical wrote:
> Hi!
> 
> In debian, we package libldb separately from other samba libraries,
> because libldb is used by other software (sssd).  Up until 4.22
> version, this was possible (*)
> 
> Now, 4.23 introduces a new ldb module - trust_notify.so.  And this
> module depends on numerous other samba libraries:
> 
>   NEEDED               libMESSAGING-private-samba.so.0
>   NEEDED               libMESSAGING-SEND-private-samba.so.0
>   NEEDED               libsamba-hostconfig.so.0
>   NEEDED               libsamba-util.so.0
>   NEEDED               libtevent-util.so.0
>   NEEDED               libdcerpc-binding.so.0
> 
> what this new module is for?  Should it be part of libldb?

It should be part of Samba AD build like many other ldb modules which
link to DSDB_MODULE_HELPERS.

This should be clear from source4/dsdb/samdb/ldb_modules/wscript_build:

    if bld.AD_DC_BUILD_IS_ENABLED():
        bld.PROCESS_SEPARATE_RULE("server")

and source4/dsdb/samdb/ldb_modules/wscript_build_server contains
trust_notify module.

I think what happens is that this module (and others from _server) gets
installed into the same /usr/lib64/samba/ldb/ as the base modules and that
your packaging does not differentiate them.

> 
> This is a more broad question - should libldb be usable by
> its own, without the rest of samba?  It's been a semi-private
> API of samba for quite a while (together with libndr), but
> sssd uses it anyway, and it's been a constant pain to work
> with.

When libldb was moved to be released as a part of samba, it was still
supposed to be usable as a library outside of samba.

I guess we don't have a good test in the selftests that would track this
target. On the other hand, SSSD relies on the same base libraries
(tevent, etc) that samba does and also links to Samba NDR libraries, it
should be ok.

> 
> (*) in 4.22, I had to revert one commit for this to work, -
> 542cf01bfe530 "ldb: User hexchars_upper from replace.h".
> It would be great if this commit is reverted upstream too, --
> if it is somehow desirable to keep libldb usable separately.
> 
> Thanks,
> 
> /mjt
> 

-- 
/ Alexander Bokovoy

