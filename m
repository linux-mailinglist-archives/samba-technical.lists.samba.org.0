Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE6816A3D3
	for <lists+samba-technical@lfdr.de>; Mon, 24 Feb 2020 11:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RREw0qETCmdYAzIDXt2d6bEu39B5KaSwf3xY2VjxFY0=; b=sMlb/mOEulZXhx0N2iADKQDObi
	hm+Lf3UGAg67uqUMRpk+YccM5iAp9iBGFJpCCWDfTVCd200fqU8uYCV2X0dE8aQOzfuaSaJXUcgMa
	SNFUBoQNgyMfBhPd21dzKLyK1d3gAmK4/kXPrIKRFgLNpyLlFHWAKZ0pvv7m0ow77z2tJ3xAssBRf
	sZkDCmjG283GS8uiBaIU/qOpf4fonAlicypt5sxzDS4R/SH4s6/ZsvhRA6tRZ5y4U7KNYRbcIToXx
	UE4WXkADmF2HH4VnjFdmMxdZh5pbSgqiIT9sF4dbAJPlVrhlTlkScl0V2L0h6s2HGQlZWnh3+Rxzn
	dtS4H2dg==;
Received: from localhost ([::1]:63292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6Auf-00BLEr-EM; Mon, 24 Feb 2020 10:24:33 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:42599) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6Aua-00BLEk-Gk
 for samba-technical@lists.samba.org; Mon, 24 Feb 2020 10:24:30 +0000
Received: by mail-lj1-x22a.google.com with SMTP id d10so9434722ljl.9
 for <samba-technical@lists.samba.org>; Mon, 24 Feb 2020 02:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RREw0qETCmdYAzIDXt2d6bEu39B5KaSwf3xY2VjxFY0=;
 b=DnHV97qXO1WAiVgOzQ5u5D28xZvtWFMSm3gZOR9Iiy2vuAHHpbo8Ap+WK/z8TtwnBV
 Ks8AyKc0zo224GIGNepKhJnorqR7wGP12C0ZfPnXI2EYomlskAbcICUOHtLOhh1Qb8XZ
 LPrrvueuVD8VBmmk8d7dMwpxA1uAzlcRU68gMR2410mSbnQE8Npsu5DKRP29f9QMb3x4
 +kuZJILGHffsULuk4gFlF0pZsIFya6S5/HTWlmZ3ojgR1nMTvT0PtEiqdd/8/3CkzC0c
 UyS8mACpjhzb1bH4qGJwgv9Uh93o2w1RBrgZIuVkxHR8yd5oBwZMk3VK2PKIILma3otu
 0nEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RREw0qETCmdYAzIDXt2d6bEu39B5KaSwf3xY2VjxFY0=;
 b=Vaoef1csRpAP8uHFhvqdvUf9PaglNGIdDdtIHqWaiCYMWuzkp1mJq9N8b5FcSBnpUN
 b12KalkPtztoQxS2TQuuBgilOSO3Qb01SRdAKZgh2TXjmlfZwRLqpbUze0R+PDhHbf9y
 3VaRE+8O7z40XytSLwTqFYJxbSLrccQty8WRSkJRncIz+kWhhKiSJMRjGlZyXn5sc2M2
 oHNBCSkHVw8Rg9V868rE02PtqjJPUjBhT9EateHSPUllfQyCFX7wTpA+cYvPYyCVLan4
 imV8iQD0/L0IKQyx9GJfojgGpxN7Ai5cYAqvg+Sf+flMkrw6Owt1IcUMwBGfVL9Usr6i
 si4w==
X-Gm-Message-State: APjAAAUkRz42EjOty4F3HQNhekAcmwQb66XopuwxcU1B/UiwBzntnpQU
 xWRtxMJHmO5LkgPq9MyewMLcBFJdQ7aXF4sg+wsp4eIq
X-Google-Smtp-Source: APXvYqyAEfa1HZF0efA2Q3Qm9CN3yHDSrbgzSDl2PfqSjl25fc81NGI5MA6bPtvepJ5kVAJg1Od7y0n1WdSoXg4X3O4=
X-Received: by 2002:a05:651c:d4:: with SMTP id
 20mr29392682ljr.269.1582539867135; 
 Mon, 24 Feb 2020 02:24:27 -0800 (PST)
MIME-Version: 1.0
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
In-Reply-To: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
Date: Mon, 24 Feb 2020 11:24:15 +0100
Message-ID: <CAC-fF8RQvdtcBjfZn+hg_HNeSpH+AmnZ=V5QFaT77=aTZ6qpBw@mail.gmail.com>
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: Dario Lesca <d.lesca@solinos.it>
Content-Type: text/plain; charset="UTF-8"
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
From: Isaac Boukris via samba-technical <samba-technical@lists.samba.org>
Reply-To: Isaac Boukris <iboukris@gmail.com>
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Dario

On Sun, Feb 23, 2020 at 11:58 AM Dario Lesca via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Hi, I'm doing some tests samba DC 4.12.rc3  MIT Kerberos  + Bind DNS +
> Dhcpd script  on Fedora 32 beta.
>
> All work fine except this issue:
>
> The dhcp for a workstation "win10a.fedora.loc" NOT joined to domain
> work great, name and reverse are added to Samba Bind DNS.
>
> At this point I have Join the WS to domain without problem, I can login
> on it with domain account and access to other network resource (win10b,
> centos8 member server, ecc).
>
> But after this join, some time (10/15 minutes) into syslog I get this
> error:
>
> named[718]: client @0x7f128c3e5eb0 192.168.122.103#54566: update
> 'fedora.loc/IN' denied

Not sure related, but I noticed dns errors sometimes related to
kerberos when forwradable is not set by default. Try looking in
kerberos packet capture, and try adding "forwardable = true" to the
libdefaults section of all krb5.conf files (including the one in
private dir), see if it makes any difference.

