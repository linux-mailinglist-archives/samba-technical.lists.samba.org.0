Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A273524B0F3
	for <lists+samba-technical@lfdr.de>; Thu, 20 Aug 2020 10:20:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=u4R2eTqB0yDaOPl98qCgsmd42YA1P/AfH3HgYe/xHOM=; b=IQ9Clu9Ck/tn6EEukqRJgcD+SS
	ZpfquLv6ViD7UdTbpc/DRsyNGhalZAecJ0hkNiQMQtJghKHrKaYD3Rn5SiO5lT7KGEIawCzuHTV8h
	ACgM4buEgAeMw4x6Rvj8FCRBi8jGLmphT8oDAGgNEqrFpu/yVcQka5BBH/gICipHDEsg4p3PLtBBd
	2LIYJpIeIM9YTWSSrT9Z3N1tem4LqqBubZzYoDs816RmP+XfZuWVAyZVox9sL6IWbqs83W6roX4an
	udTJCrUCz9YdL+iZATLAWiMCmsnog8nJauR8OEcnasLIFue2CPF/T9rsnLyGzengZRrV4CDrUUIzO
	0ybiTrMg==;
Received: from localhost ([::1]:64520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8fo8-00EOF3-4I; Thu, 20 Aug 2020 08:20:24 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:48666) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8fnv-00EODY-A4
 for samba-technical@lists.samba.org; Thu, 20 Aug 2020 08:20:13 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1598515375.75772@KQpo/n3qBaPlsiWB+AmpmQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 381E211F01C.A5B7A
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 381E211F01C
 for <samba-technical@lists.samba.org>; Thu, 20 Aug 2020 10:02:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1597910574;
 bh=n2E5TunZ9IBtevRWxGp4f3UkXs6vAiMIbJuBXDRRkaI=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=SBn2d783/pdB1MztZud+wLG4rPrW7K4FSrf7va8/JInSDOTsY6jIHq8Ysq6r7J/K7
 zL+uF5GTN/3j0nhA6xoaESZbU37QYP3LH1VVKoLEqcn4bkdrSn4bnosaewirwkphhD
 Wg7HbX6RJjUIIHu9F29u9k15/K5MIc60P93CVbfx6ZGl2TVRe+NhnlpoGTZN4nK8q/
 b7TniQn8Pz97drY2ZAKNpvwCL/k6y0hFZoZ4fRxmqfZ13MCQMdOSIW98iGTq/Fd6tP
 UVqdZ9qUdTS2MFV+fforiBoaijbqCmn1Fw1a8Xv8ln+2eAueOxhztQ/oQBXs6CXNzO
 y/uSCACwOKFhA==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id D9CB73AF8C
 for <samba-technical@lists.samba.org>; Thu, 20 Aug 2020 10:02:35 +0200 (CEST)
Subject: RE: "auto" for Kerberos, a history
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Thu, 20 Aug 2020 10:02:35 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <775998ab-6432-2007-7849-19e4c5ced421@samba.org>
References: <239bf247-b000-511c-cf12-d83a037e3c83@samba.org>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdZ2yEN0t6TG6ryjSZmkpOZ/sj4s1g==
Message-Id: <vmime.5f3e2e1b.780b.3b8560bd3192184b@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> >> The idea (when this was written) was to at least try=20
> Kerberos, rather
> >> than continuing to default to NTLM only.=A0 (And on the flip side, to
> >> continue to work in the many - at the time - networks where AD was
> >> functioning only with NTLM).
> >>
> >> Andrew Bartlett
> >>
> > Why not just set the default to 'yes' and if this fails,=20
> fall back to NTLM, this is what 'auto' seems to mean. To me,=20
> 'auto' is confusing and to top it off, it doesn't seem
> > to be documented anywhere.
>=20
> yes means no fallback to NTLM,
>=20
> Should we use "disabled", "if_available", "required"
> instead of "no", "auto", "yes"=3F
>=20
> metze
>=20


Yes Metze, that looks/reads it way better in my opinion.

I would like to see it like this and we only need disable/required, but this looks clear to me.=20

-k required/yes  (enforces Kerberos auth)=20
-k auto =09     (when its not defined as parameter)
-k disabled/no   (enforces NTLM auth)=20

So if you just look now at a parameter like this, its way better to read/understand.
What it does.=20
Way better to understand that only : -k KERBEROS

I vote for
> Should we use "disabled", "if_available", "required"
Or both as shown above.=20


Greetz,=20

Louis


