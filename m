Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A5B108B54
	for <lists+samba-technical@lfdr.de>; Mon, 25 Nov 2019 11:04:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=mpYompxwXnHoAOPDiZu/y3OxNjdgpnrOfBgAd4M9ol8=; b=WOeSj3tMuFEgpiDf9XFb3mEslU
	H4oxJ+UZnL9DUk479EEa3V3uHMKLsiW6827n/a6PXOpcSjOa9i29+hxpY6wlK1rLXG68hkFcH77nE
	zIFb1xst4n1noRfIkOFcNfywcxhJs6VNGIGUNCLehiz4wsjTDzKXHd1m5xjOfWKIAchTeYrGFjp3q
	QZCk/ikOXqLtEIUohX8P3v0WS6gV4vJa0rvs6kHEf+0pD9iZB8zaZm8X5+iTamS+1Ccxw6MWYqjNn
	6aBnkSIFnCPc//e0HeWntyxD5j81qG+9VXo36bEmdDuIknjTx6HtLpRvbpnzZ5BF6WxhJV/JRBzTY
	4l4G5e6g==;
Received: from localhost ([::1]:47242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZBDn-002JQU-6g; Mon, 25 Nov 2019 10:03:55 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:59404) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZBDh-002JQL-Hl; Mon, 25 Nov 2019 10:03:51 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1575281021.70833@HE0kyE/IIv05zCR63IKTIg
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 8B37412139A.A4F3A
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 8B37412139A;
 Mon, 25 Nov 2019 11:03:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1574676220;
 bh=fQa4PK7aVfsPKBRiRo2gWrpqyUV/PpmFU/jGmQtpwNE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=KER9FXOnCl8n1H+xwR20VGtat3bIv6uJ9re3/gyOaTQb9hQxkGMDImj8s5LfilFcg
 LuT5/8K07TxjeC+/7UjB77mi0yO4MA7lAnqIPvI0nZJ4B4FLx4gAmS5VIhvhLFk1b6
 wDLdNlIybyHVSZxqXn2rRi+VpI9yYge+p5cJtPbFROY6Kan8Cc3hYQRBe7DYZjHkPi
 QOKXpsw06YILHZCGT1QR2vok0b2TDUJ1NBX/2xuGSpuHdAiuiCf0uS84tzYx/LCE7Q
 /gWa5TqjgvCNH2NwdKvRZeNbD4qblTLCNx9zpUrZFnaSVh2V8l3YjVt4+WPGNSFsGZ
 f4oMTviwp6sBw==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id DF1853AF8C;
 Mon, 25 Nov 2019 11:03:37 +0100 (CET)
Subject: RE: [Samba] Samba4 - Printer Drivers install fails
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Mon, 25 Nov 2019 11:03:37 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <vmime.5ddb9009.4e21.3dc2fa3f4bbb3e19@ms249-lin-003.rotterdam.bazuin.nl>
References: <50e04d6f-b0ec-e4c9-445e-4224ac9af22c@openevents.fr>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdWjae7KlTeVFU20SYa6y3jtoJrCRgAC5y3w
Message-Id: <vmime.5ddba6f9.28bf.50f5facf45252c09@ms249-lin-003.rotterdam.bazuin.nl>
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
Cc: "=?windows-1252?Q?samba=40lists.samba.org?=" <samba@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai,=20

Im looking into this printer driver problem, and yes, its a bug..=20
Now this part of the logs.

move_driver_file_to_download_area: Unable to rename [x64/{7B0F67E9-8A50-45EF-A926-F9EF3D271299}/install_nbomx_xl_noredist] to [x64/3/Install_NBOMX_XL_NoRedist]: NT_STATUS_OBJECT_NAME_NOT_FOUND
Nov 25 10:35:16 print1 smbd[732]: [2019/11/25 10:35:16.901490,  0] ../../source3/rpc_server/spoolss/srv_spoolss_nt.c:8621(_spoolss_AddPrinterDriverEx)
Nov 25 10:35:16 print1 smbd[732]:   _spoolss_AddPrinterDriverEx: move_driver_to_download_area failed - WERR_APP_INIT_FAILURE


Unable to rename [x64/{7B0F67E9-8A50-45EF-A926-F9EF3D271299}/install_nbomx_xl_noredist

This line,  the GUID folder exist, but "install_nbomx_xl_noredist" is not be be found.=20

Im wondering, why a "Section" : [Install_NBOMX_XL_NoRedist]  from the .inf file seen as file/folder.=20
That is why the rename errors out.=20
..

; Install Sections
;

[Install_NBOMX_XL_NoRedist]

PrintProcessor=3D"XeroxV5Print,x5print.dll"

Which is the only thing i found with : install_nbomx_xl_noredist in it.=20

I'll see if there is an bugreport, if not i'll make one.=20


Greetz,=20

Louis




=20

> -----Oorspronkelijk bericht-----
> Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
> L.P.H. van Belle via samba
> Verzonden: maandag 25 november 2019 9:26
> Aan: samba@lists.samba.org
> Onderwerp: Re: [Samba] Samba4 - Printer Drivers install fails
>=20
> No worries, i tested the 4.11.2, so not needed for you to test also.=20
>=20
> Greetz,=20
>=20
> Louis
>=20
>=20
> > -----Oorspronkelijk bericht-----
> > Van: samba [mailto:samba-bounces@lists.samba.org] Namens=20
> > Julien TEHERY via samba
> > Verzonden: maandag 25 november 2019 9:23
> > Aan: samba@lists.samba.org
> > Onderwerp: Re: [Samba] Samba4 - Printer Drivers install fails
> >=20
> > Le 25/11/2019 =E0 09:15, L.P.H. van Belle via samba a =E9crit=A0:
> > > I tested Friday also with a W7 pc.
> > > Not working, im try to see what i can do today on this problem.
> > >
> > > Greetz,
> > >
> > > Louis
> >=20
> > Hi Louis,
> >=20
> > Thanks for your help. I'm still investigating on it, but=20
> > sadly i cannot=20
> > upgrade to 4.11 as those servers cannot reach external=20
> > repositories for=20
> > security reasons (those servers belong to a client which=20
> only accepts=20
> > ubuntu oficial repositories..)
> >=20
> >=20
> >=20
> > --=20
> > To unsubscribe from this list go to the following URL and read the
> > instructions:  https://lists.samba.org/mailman/options/samba
> >=20
> >=20
>=20
>=20
> --=20
> To unsubscribe from this list go to the following URL and read the
> instructions:  https://lists.samba.org/mailman/options/samba
>=20
>=20


