Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D18E854BD6
	for <lists+samba-technical@lfdr.de>; Wed, 14 Feb 2024 15:47:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=t9PEY6YZXeVt79pFHPYRNLM2fX31gxYwfX/yfwVfC28=; b=dcIJ+K7YcrP2y+pPNQTYviPOpm
	L30qvb9e83BErItqC38ua8TDK4nIddY+24wJmu6yNwhoygT1G6IfR+0km3qFKq91UAOwFk5fTcck/
	C85LNkYa6/92b86X5K/tjbNLgguaUflxxjH89Jydf5w17pGM3KPrUGXGbw8fB2hq1OWMov2C4pTdR
	bLwbMSkznBQ+s4gBPP9RpaA9mY6KxBxcnGnGiZ+qFbL5mrCfarmfQ7ANUS9Y+sA3qRbn/TKC8af5a
	r+a1imgbCdhhQfCEwDbF86ebxaVM/cmkOwok2hprBdU5xKxclU73SfWBh9fT5cBNKxvFS3yPihqDv
	6IesuyYw==;
Received: from ip6-localhost ([::1]:36336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1raGXR-008TJa-5t; Wed, 14 Feb 2024 14:47:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49994) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raGXM-008TJT-Jn
 for samba-technical@lists.samba.org; Wed, 14 Feb 2024 14:47:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=t9PEY6YZXeVt79pFHPYRNLM2fX31gxYwfX/yfwVfC28=; b=ob4R4d2TJYsvW4YUgJQpUdoRXq
 Iz/r6wBJr5uX14KpfAsk3aTMep2PvXvbRZ1QZBrq9CQbNa1RNfTGaUpQDI34tGUcx81N0+AJrGdiP
 mUGAOFeF+ErTiU12MLqE3kiTT3RoxQggJZMzG+HJKBxTOf+lepj3bYb94iiBH/TmCPlPHojzASBQg
 iRRXD/nUQ9kOZ8yLi/ckjVsYLfD/tzzVyA8jkGJ0BN328q76Fetk9oHzRZrtEMf4/cmLkMLaV0uR6
 7CWXejSsqn9PIM6r3r8+3v1jCeembkZufQaogisGek/hKeIzUUhRJ8z+/3+dJ1Py8rAvoJFLRT/4G
 MCMKP9pooihQ+uwwxCkOhhIVXfk4Wx8rcLaoIdFOJJewyeNZ2yAJT54/OP8VhvAOTN1LKyl6lo9ze
 wnfUFu0uzMaQheXjgEx+VGps6Ecd8aJyF9uLYJ89fE50/R+KzvNQBrxBDbylrsvhnj7avJYkJMQ6g
 Ju2CATHlKHLwP9nDitGNJrP9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1raGXI-00D2uN-1h; Wed, 14 Feb 2024 14:46:56 +0000
Date: Wed, 14 Feb 2024 14:46:53 +0000
To: Michael Tokarev <mjt@tls.msk.ru>,
 Michael Tokarev via samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Subject: Re: Looking to once again re-bundle LDB
In-Reply-To: <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
References: <7fb8e63cdc9de2c284cffc792c458df3b017c392.camel@samba.org>
 <2272182.vFx2qVVIhK@magrathea>
 <28b2669c5d1834b15eddbfcda3c976a83def8b92.camel@samba.org>
 <16f5f6dd-cc2e-44e5-acb9-9308768a3e1d@tls.msk.ru>
Message-ID: <C44D3455-ED69-4750-8E67-6B140B582934@samba.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 14 February 2024 13=2E09=2E21 UTC, Michael Tokarev via samba-technical <=
samba-technical@lists=2Esamba=2Eorg> wrote:
>14=2E02=2E2024 03:45, Andrew Bartlett via samba-technical:
>=2E=2E=2E
>
>>>> We would change the ldb modules dir to have the version string in it,
>>>> so that modules are not installed for the wrong version=2E
>>>=20
>>> Sounds good=2E
>>=20
>> I've chickened out of this small aspect=2E
>>=20
>> It would mean a repackage of sssd for every single Samba version (well,
>> LDB version, but they change pretty often), and that would make Samba
>> security releases more painful, not less=2E
>
>If ldb interface changes in the next version, it becomes incompatible wit=
h
>existing sssd=2E  Moving ldb modules into version-specific subdir makes i=
t
>explicit, - user gets more friendly error message (at the very least,
>something like "can't find modules") instead of a crash=2E
>
>If, on the other hand, the version-specific subdir is changed in every
>release no matter if the interface actually changed or not, that will be
>more difficult indeed for no visible gain=2E
>
>I don't think there will be real issues either way, - we'll sort it out
>one way or another=2E  It's already impossible to provide "more recent
>samba" to older release of a distribution without either breaking sssd
>or providing sssd together with the new samba, it just has to be made
>more explicit in the downstream packages=2E
>
>BTW, there's also freeipa now, but I don't know if that one is possible
>to use with samba compiled with (bundled) heimdal, - last time I come
>across this (someone else mentioned it, I haven't looked myself), they
>required samba built with MIT Kerberos=2E
>
>Thanks,
>
>/mjt
>

We do rebuilds of the whole stack in Fedora if bots detect samba ABI had c=
hanged=2E So for us it is not a problem=2E

FreeIPA only supports MIT Kerberos for the server side and SSSD provides K=
erberos pre-authentication modules to MIT Kerberos soi it is also best to b=
e built against MIT version=2E
--=20
Alexander Bokovoy 

