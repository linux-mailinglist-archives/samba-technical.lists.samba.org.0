Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C04DFEA220
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2019 17:55:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=lNInmEhxU9AXJlnTc4dJhw9zeRR4kEfEC/fqgsKsevM=; b=nNZQOrrRe3xzyE5SuSoQq2ZgdZ
	0hH6wR0VydDH7UedgLm4MrABOtxgpstCJj23JVgssFVuyh3p9ucsn7vjOCO6qpOVV/sd3+enYMeBZ
	niyrIzXiv192yFzcigAvSJ5yjg45jG02KCEK0ApV/TAd9TxfxFk+J7bB+ln9ejXi8hdgH0AjENXYq
	m+jWgVTZWr/y51GqDurqC7A/t0joyntS0ey/iMbubfIV/x1lxOPZhepiDue+QeC5lTuiw2PJN0CC7
	N76zzCl/0mFZLMBzEX4/2WgPdQCUTnHFpmJ8vFAF1YEWIGG2DrIuFxVwxsj40k24ledkPvX5SkAUj
	o6CNAvmA==;
Received: from localhost ([::1]:40510 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPrFx-003hUu-48; Wed, 30 Oct 2019 16:55:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21430) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPrFr-003hTM-Kj
 for samba-technical@lists.samba.org; Wed, 30 Oct 2019 16:55:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=lNInmEhxU9AXJlnTc4dJhw9zeRR4kEfEC/fqgsKsevM=; b=pg0vU0edbyWR09ZZBRyslU+LwT
 R17+nuWCjxGHSkn0aKhRyXGG/UnLc36AZ5mvr9jrNDGXuGBZ3Xh+O8GDxxxA2txoaPi7x1Rv/qyos
 VGbv0qppk1ewpniqKxtv0Ym01wK2hOSDPuFi35XtLgRWZ4zfQ65XpIk0pFmIBvGO/olG8Dudzd6aB
 JDHGIlcW8Wk46AVRUcLlMa6YsuIMwFECm3FdDjqF2g3WAmOF6yjD0n89mbxLGoSYMX4r80H6ae6Vl
 AwBujoAI102DCw5TTxdMZApLN/zDkSCZ1joU9ABn2JsdY2R+wBd8sVeth121gonVm/JKo3FUPPqai
 ohRQuRtQosaNvoGK0RIQxNj53tz6Vada7VWFxCmKzA329UzctaTfCAFUlwP/svBSyd9Fj4aEciy98
 VrI+6zVkK8vvMHmx41MTeqweHHoVqv5lqSFs79ikx+Zh4ghsM+0NejwtJkJXYow5a60OUEPsEqN9U
 DOk0nzYVWV3+Uck70d8em4de;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPrFo-0003Ic-Rr; Wed, 30 Oct 2019 16:55:29 +0000
Date: Wed, 30 Oct 2019 18:55:26 +0200
To: Steve French <smfrench@gmail.com>
Subject: Re: Samba build error on Fedora 31 can't find 'nsl'
Message-ID: <20191030165526.GB32459@onega.vda.li>
References: <CAH2r5msEjOuWumbKQce6ucn6pM2K1CW7iyEwuzj_611E5R7C5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5msEjOuWumbKQce6ucn6pM2K1CW7iyEwuzj_611E5R7C5w@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 30 loka 2019, Steve French via samba-technical wrote:
> Doing a clean build of Samba on Fedora 31 (master from jra's branch of
> a few months ago) I get this error (worked on Ubuntu) not finding
> 'nsl' but the package is installed
> 
> ./configure --without-ad-dc --with-system-mitkrb5 ; make
> 
> [144/144] Creating bin/default/lib/krb5_wrap/krb5samba.vscript
> [145/147] Compiling lib/replace/cwrap.c
> [146/147] Compiling lib/replace/replace.c
> [147/147] Linking bin/default/lib/replace/libreplace-samba4.so
> /usr/bin/ld: cannot find -lnsl
> collect2: error: ld returned 1 exit status
> 
> 
> # yum whatprovides '*nsl'
> Last metadata expiration check: 0:46:54 ago on Wed 30 Oct 2019 10:30:46 AM CDT.
> libnsl-2.30-5.fc31.i686 : Legacy support library for NIS
> Repo        : fedora
> Matched from:
> Provide    : libnsl = 2.30-5.fc31
> 
> Package libnsl-2.30-5.fc31.x86_64 is already installed.

Please use libnsl2-devel.

See https://bugzilla.samba.org/show_bug.cgi?id=13238

-- 
/ Alexander Bokovoy

