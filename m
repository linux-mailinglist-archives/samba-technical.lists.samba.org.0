Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5D474D21
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 13:33:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Z/q3EMni1t5yyW48gKI8r/bLfvuwdL6BJDfhyBHbOTk=; b=lmYrtix2JgX2FJu+7fsA3MYea/
	RZ6PAU8wwyI3e+9q7H2L7IzVo8DWHydN0PC9DKrevrLnaCjS/HwGSSOuo+KJdIMgDBF66hZbH+B8A
	/BXMevruVDkpNS4WvQuE6ENM9lKme7Cgeu2Npc/Mx97K4xE5noZ8ShdecCVyCsYPuwlbiTpeGBbue
	nbnokmbLD9lOzDje2RNsaTvBM/Kn6OB33uQhcA03qeDOdQpYuxSe33TbywbEvRie5xpvkj/WQuY4N
	vtpu5LPVIOk08AWw+KJPo/wLZyiBSxIpwsOhM9zyffLkE9sYcd4JiNffeLkaiyRLg9Skdwx1hjgSb
	pnMy3rgQ==;
Received: from localhost ([::1]:56172 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqbzC-000Bs1-7P; Thu, 25 Jul 2019 11:32:38 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:56312) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqbz7-000Bru-Md
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 11:32:36 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1564659142.30665@gd/H6vUSBsRd5/efoBuy/g
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 9D09311F30D.A59C9
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 9D09311F30D;
 Thu, 25 Jul 2019 13:32:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1564054340;
 bh=Z/q3EMni1t5yyW48gKI8r/bLfvuwdL6BJDfhyBHbOTk=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=FRaMIzq+u325dOUKkWg0mMjHkfhu5ygP24ZtUzDVyMtNxeNy9w21TpbwZ3Emr263W
 R+1DGBdYeNjwAv3lLIa3RlJzXz8lUVKDcOVDqDUGRaLcK94bRP8yLjzmZ4aRMedcAF
 2qLXT1OvwmVRRMCG97g2wIXkCCZiOeIEhaFLdTkbeyP4b+CbpDAhKuj0Zs/uszT+ey
 YDQNrdAkl+xErOADjJjLdZrCe6NVEUTovqbiM1p8LSPaDJd91Z6cNmH9YEXEWBCT6e
 YL2qH8TBjYi6fDPAZa4eWLDnFXvJ8nH/qDneioj7Iafk2UHlfzyy1utw+gMN4EHgvY
 Efwu+wl1gLmpw==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 607933AF8C;
 Thu, 25 Jul 2019 13:32:20 +0200 (CEST)
Subject: RE: Samba 4.10.6 python3-tdb dependency missing in samba control file
To: =?windows-1252?Q?Yohann=E8s_ALEMU?= <yalemu@tranquil.it>
Date: Thu, 25 Jul 2019 13:32:20 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1731211123.808.1564050474475.JavaMail.zimbra@tranquil.it>
References: <1731211123.808.1564050474475.JavaMail.zimbra@tranquil.it>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdVC3J3faIKnjISTRrymnFBAh7aAXA==
Message-Id: <vmime.5d399344.4265.54706edc217e2d84@ms249-lin-003.rotterdam.bazuin.nl>
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
 <samba-technical@lists.samba.org>,
 =?windows-1252?Q?Denis_Cardon?= <dcardon@tranquil.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai,=20

I noticed one more, im new build is running atm for stretch.=20
Im going a full re-check on the 4.10 packages for all OS-ses atm.=20

For the once who notice this also.=20
The quick for for the current 4.10.6 : apt-get install python-tdb python3-tdb
That keeps you going, then the new build is finished i give a notice again.=20

Thanks again for the report.=20

Greetz,=20

Louis

=20

> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Yohann=E8s ALEMU via samba-technical
> Verzonden: donderdag 25 juli 2019 12:28
> Aan: L.P.H. van Belle via samba-technical
> CC: Denis Cardon
> Onderwerp: Samba 4.10.6 python3-tdb dependency missing in=20
> samba control file
>=20
> Hi Louis,=20
>=20
> We are currently testing samba 4.10.6 using your deb-src.=20
> Thanks a lot for your hard work ! I have noticed there is a=20
> dependency problem in your samba package 4.10.6 : python3-tdb=20
> is missing from the control file, only python-tdb is in=20
> required dependency. After installing on my test machine,=20
> samba-tool is using python3 by default and does a stacktrace=20
> because the module is missing. If you have a github repo for=20
> your deb-src, I can post a pull-request, although it is quite=20
> a trivial fix :-)=20
>=20
> Thanks a lot !=20
>=20
> Yohann=E8s ALEMU, Technicien syst=E8mes et r=E9seaux=20
> Tranquil IT=20
> 12 avenue Jules Verne (B=E2t. A)=20
> 44230 Saint S=E9bastien sur Loire (FRANCE)=20
> tel: +33 (0) 240 975 755=20
> =09
> Retrouvez-nous sur les r=E9seaux :=20
> [ https://twitter.com/TRANQUIL_IT ] [=20
> https://www.linkedin.com/company/3108003/ ] [=20
> https://www.youtube.com/channel/UCl45FZItnoOlXsaWUa3UrTw ]=20
>=20
>=20
>=20
> [ https://www.tranquil.it/qui-sommes-nous/nous-rejoindre/ ] [=20
> https://tranquil.it/ ]=20
>=20
>=20


