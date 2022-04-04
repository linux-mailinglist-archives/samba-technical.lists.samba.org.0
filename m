Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B27A4F11C1
	for <lists+samba-technical@lfdr.de>; Mon,  4 Apr 2022 11:13:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=CYd71ljJP417W+wO1dYywMELH2IPCk0zF4zds6dwnf0=; b=zolGW7OiuSaaI/6SKOLRZoEU2C
	1IPquV60jSxTxZpKHxA4PwV/zh4brStkzwl1Z0Yrxo/9OEK6P1lD5neZDzGTBWOwyCsJnxNhwA5tC
	Lcr/nVxxBEszL9mmwXt0eZauso08nxyEyAsrMT24rhrJUmKbM2YLoOkBJ04n9ODAptWDelV72rTPB
	gUDteZdN74S6cK7cZcP7//J86Kxvj4dp2cvbnpxFmcbfRru0i9ewuOxSDd84IgiDtKVIOgu1ATTdR
	sKG+IP3pLpWQLxKd0iV7Z/Vu9WLbc5quOQgoHE5HNMW0/4wJcAyBRWEd56fxLTCnEMDAgD/n3BkkC
	Bu7qI39w==;
Received: from ip6-localhost ([::1]:30966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbIlR-009lQl-G5; Mon, 04 Apr 2022 09:12:45 +0000
Received: from mailhopper2.bazuin.nl ([92.66.229.69]:57496) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbIlI-009lQb-NG
 for samba-technical@lists.samba.org; Mon, 04 Apr 2022 09:12:39 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1649668344.96547@9clIHopU5lfkcxDnWZqmZA
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: A5CEC122734.A85A3
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id A5CEC122734;
 Mon,  4 Apr 2022 11:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20220103; t=1649063544;
 bh=CYd71ljJP417W+wO1dYywMELH2IPCk0zF4zds6dwnf0=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=1HEphdaWARYsJLCXZDkZNVs4dEI08NjPAGSSqIP4KzWxvX+3sTnKswvgWtEdkj/Gj
 uVuAB42ZHpnBWWnFoiGU8DCDOpHjRzhgc19hy1/nKYkOzIW4MqUz2WFcOPSDwDuMd3
 /ZQZri0EAsKau59AWg9R+2loaOfbPQxPbK/lhELw61g8l3s2fPwcwOdm0Dov5vG7ei
 Y445HiA53gKFPQAVSL1HP2d1LTySVlFcqGHPRaS1B0tRbT/z8SWfYk9sCjSBPC5KrM
 rl7pVpURICvKHgWXB2vZnRtAG1EOKmkcES31ja9himCVhYGvS8vreE4es7f9XZn+5d
 FUuXzeysqzCZQ==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 7744018C2444;
 Mon,  4 Apr 2022 11:12:30 +0200 (CEST)
Subject: RE: Offline question - waf install recompiles another 4k files after
 waf build built its own 4k?
To: =?windows-1252?Q?Kees_van_Vloten?= <keesvanvloten@gmail.com>
Date: Mon, 4 Apr 2022 11:12:30 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <03946334-dac7-96b0-405c-b24c4f2acb3b@gmail.com>
References: <03946334-dac7-96b0-405c-b24c4f2acb3b@gmail.com>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdhIBBuUZoexbnyiRoeeZZmndYAp1A==
Message-Id: <vmime.624ab67e.2c4b.6323897232149b5e@ms249-lin-003.rotterdam.bazuin.nl>
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
Cc: "=?windows-1252?Q?samba-technical=40lists.samba.org?="
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Kees,=20

On 4.16.. And why the delay, well.=20
I'm was hitting exact same problems as Michael.=20
Current part is one i could not figure out and he is going strong.=20
Love what is going on so far, also, i had a week off, and im behind
so im reading all messages currently.=20

Im also soon testing again here and where i can, i chip in.=20
First catch up on my regular work.=20

Greetz,=20

Louis



> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens Kees=20
> van Vloten via samba-technical
> Verzonden: donderdag 31 maart 2022 9:52
> Aan: Stefan Metzmacher via samba-technical
> Onderwerp: Offline question - waf install recompiles another=20
> 4k files after waf build built its own 4k=3F
>=20
> Hi Stefan,
>=20
> I am following the discussion on samba-technical around building=20
> packages for Debian, which you take part in as Samba team-member.
>=20
> I am quite suprised that no one has pointed a Louis'=20
> packaging work so=20
> far. He is doing exactly the same a what Michael wants to=20
> achieve, or am=20
> I completely mistaken=3F
>=20
> Louis has not jumped in himself, but he is having some family matters=20
> lately (which is probably why his 4.16.0 packages are delayed).
>=20
> - Kees
>=20
>=20
>=20


