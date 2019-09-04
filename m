Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C576A7F10
	for <lists+samba-technical@lfdr.de>; Wed,  4 Sep 2019 11:16:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=pHiJtb8N5E322RwRK2Rb1AXvfhW9h0zgLO2ZDCOZ8XA=; b=Cdbo2hK/g56aAUJwCqkBs1ZlP9
	S7MJ+lm6XM4yl7oDM9qPOdd6rt4gTYtv9lAOcAosgqxbt5HkjbuHXMyTwTVT/iOn/CoraNlJNmtfi
	SDInWlS1ta2n/sD7jHR7TM6LAVJ2PMGsSuzDoz687y04jTByRtJnbmv5qAkJuENKiYeHWNT/+yZ73
	im8zrHqSHGp24gxdo0HQkjidF3lqtA+L655ZkDgqBgWAgMZkHw0BG391rnblgV/qATT7FgMgvYJvB
	j0mked877pNcpXdkAB7r0Co5+/aZuTjlECNGsHCLey73d4BtL1tEEtPLkHQUt8j01J4gXfxnHyj4r
	oZP2gAew==;
Received: from localhost ([::1]:45552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5ROA-003Lpx-Va; Wed, 04 Sep 2019 09:15:43 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:44200) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5RO7-003Lpq-8h
 for samba-technical@lists.samba.org; Wed, 04 Sep 2019 09:15:41 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1568193337.50298@oAmTn12NsZR9BK8WiezZag
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 1EF07120506.A611F
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 1EF07120506;
 Wed,  4 Sep 2019 11:15:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1567588536;
 bh=pHiJtb8N5E322RwRK2Rb1AXvfhW9h0zgLO2ZDCOZ8XA=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=KgZZPb4kbYuOFRoDCXko+qfBRDw+nxRyhMn3lByvcSb1Q9kjiWakzOMuKVxpjnyCF
 ZqyF1EClPAm6LobH1aSNwHWrnuzTmkeSi+fFiONs5Z4iHmfZA1xvt3u+/Z7usQ6Yku
 W6cBfsq3Q1K9QFUxsuYGNyG7GfKYQW+Fwcri1wc9EjL3bckvIbNWjNkV0m4ghSCDw2
 ohnddW/wzoD6q3uN3i5WV5rUUYAMs8UUyI0AGmGGhdpIzLDBV1VOHsQS3todFijLXv
 EXrCwLe+amOQUYNQhw6dLYXLX96Wfc28793b8x3Ix2t8gvLmpahYDOmL7fp8hsgpFc
 M/+XSEpJlCXFg==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 8B99D3AF8C;
 Wed,  4 Sep 2019 11:15:32 +0200 (CEST)
Subject: RE: [Announce] Samba 4.11.0rc3 Available for Download
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Wed, 4 Sep 2019 11:15:32 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190903164034.GA2128202@10.4.128.1>
References: <E99FB72BA8824B0FAB212FAE35B48FCC@rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdVjAU0uzxY8MfUSTC2vyKvoYOCX3A==
Message-Id: <vmime.5d6f80b4.1e1b.6bb54cec4bcd19f4@ms249-lin-003.rotterdam.bazuin.nl>
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
Cc: =?windows-1252?Q?Lukas_Slebodnik?= <lslebodn@fedoraproject.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai,

Check again.=20
I see 2.3.0 is uploaded.=20

Greetz,=20

Louis



> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens Lukas=20
> Slebodnik via samba-technical
> Verzonden: dinsdag 3 september 2019 18:41
> Aan: L. van Belle
> CC: Lukas Slebodnik; samba-technical@lists.samba.org
> Onderwerp: Re: [Announce] Samba 4.11.0rc3 Available for Download
>=20
> On (03/09/19 16:26), L. van Belle wrote:
> >Hai,=20
> >
> >Have you looked on the ftp=3F=20
> >The others are also there, see:=20
> >
>=20
> I already did
>=20
> >https://ftp.samba.org/pub/talloc/=3FC=3DM;O=3DD=20
>=20
> My web browser say to me that the latest version
> for talloc is talloc-2.2.0.tar.gz
> And it ass uploaded there on 2019-03-21 10:13
> Which is 6 months old.
>=20
> And talloc-2.2.0 is not a friend with python3.8
> Morever I also checked git repo and the branch
> And I could not see any new tag for talloc there=3F
>=20
> Did I miss something=3F
>=20
> LS
>=20
>=20


