Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1970B17F558
	for <lists+samba-technical@lfdr.de>; Tue, 10 Mar 2020 11:48:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=72MJc+H9JOK4niFTYgrjefv2kkwgGhrB25t3D59uRTw=; b=yqQ38OgEvyNwQNJstMuN0MsYPJ
	aSHUAGbsDD7xrlLj0h0+aJD6SacQkc7HRkyROKik6H2F4f3VaGFE3jrfb6B7/KZjCBxAwxs12pkt3
	ZaRlMtmH2ykap2QFInC/IWdRkYl6SMskC6LpmbGd8YcsooZ/j5Bf1Y9DciWSKppM/8kkZ/8qeBrdt
	EsdSC1cmahkY3LB6rHCblQGlIgD58aWIN0Aufse7FW2OlPFIcNETLEyQjvxcKph4W7EBCGaCD/sjt
	faq7Q4FxYYBTVsVWiHxLNfICr5bFFByK+yqFaXeHZTO02ZWa3fnNFRRgNcrdFg3Y1DEPJejckl9lE
	U3anfyVQ==;
Received: from ip6-localhost ([::1]:19644 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBcQz-00Fgm3-Qx; Tue, 10 Mar 2020 10:48:25 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:59470) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBcQr-00Fgfo-Tn
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 10:48:20 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1584442098.86592@DTq/xesgL0ALVTNrrBj9XQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: C50BF11F431.A7A9E
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id C50BF11F431
 for <samba-technical@lists.samba.org>; Tue, 10 Mar 2020 11:48:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1583837295;
 bh=mB/qIhv7PEBJTuOUb0oTSxSFL90jX7gg4YfyxPslFeg=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=IhOs949P8pOniRZB99N+xfgj4VPcoGhlpgjNxltS2VPXFR4ZFfVnybkULGOtOiE/f
 OTLKwTkLOUpyRUjXIeZ1J6Fi0KQlLm60UuRLj8R0yPcz975aEywBgf3v+V93gGRFxe
 /0WH/Tb/gr9VYwfqH4p3zgDVWoell/W3DjUaftWgzduMMAPbwAVwo3GkH88W0FtvoT
 c0BhidlQL+5pwi/MtISqZFDKU4NKvl4jyBAS26z+2ZhJmV53dRAvd76UST8CYgVMNy
 +tHJfuRmQSiFlX8EPeAbMbo9Dx1B1EYXyhJ/mW/DWwC7XyMsLSku9pd5lJbeZM1YLF
 IAVVCeLyf1Xeg==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id 8B92F3AF8C
 for <samba-technical@lists.samba.org>; Tue, 10 Mar 2020 11:48:09 +0100 (CET)
Subject: RE: [Announce] Samba 4.11.7 Available for Download
To: =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Tue, 10 Mar 2020 11:48:09 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200310102157.GA27623@carrie2>
References: <20200310102157.GA27623@carrie2>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdX2yWMkx/XQgU71TiClRr+tjaqQ3w==
Message-Id: <vmime.5e677069.403d.5e6bdcdf7b71b479@ms249-lin-003.rotterdam.bazuin.nl>
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


Where is LDB 2.09=3F=20
I dont see it here.=20
https://download.samba.org/pub/ldb/=3FC=3DM;O=3DD=20

I cant build 4.11.7 without it.=20

Can anyone upload it or is ldb 2.1.1 compliant with 4.11.7=3F=20


Greetz,=20

Louis


> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Karolin Seeger via samba-technical
> Verzonden: dinsdag 10 maart 2020 11:22
> Aan: samba-announce@lists.samba.org; samba@lists.samba.org;=20
> samba-technical@lists.samba.org
> Onderwerp: [Announce] Samba 4.11.7 Available for Download
>=20
> Release Announcements
> ---------------------
>=20
> This is the latest stable release of the Samba 4.11 release series.
>=20
>=20
> Changes since 4.11.6:
> ---------------------
>=20
> o  Jeremy Allison <jra@samba.org>
>    * BUG 14239: s3: lib: nmblib. Clean up and harden nmb=20
> packet processing.
>    * BUG 14283: s3: VFS: full_audit. Use system session_info=20
> if called from a
>      temporary share definition.
>=20
> o  Andrew Bartlett <abartlet@samba.org>
>    * BUG 14258: dsdb: Correctly handle memory in objectclass_attrs.
>    * BUG 14270: ldb: version 2.0.9, Samba 4.11 and later give=20
> incorrect results
>      for SCOPE_ONE searches.
>=20
> o  Volker Lendecke <vl@samba.org>
>    * BUG 14247: auth: Fix CIDs 1458418 and 1458420 Null=20
> pointer dereferences.
>    * BUG 14285: smbd: Handle EINTR from open(2) properly.
>=20
> o  Stefan Metzmacher <metze@samba.org>
>    * BUG 14247: winbind member (source3) fails local SAM auth=20
> with empty domain
>      name.
>    * BUG 14265: winbindd: Handling missing idmap in getgrgid().
>=20
> o  Andreas Schneider <asn@samba.org>
>    * BUG 14253: lib:util: Log mkdir error on correct debug levels.
>    * BUG 14266: wafsamba: Do not use 'rU' as the 'U' is deprecated in
>      Python 3.9.
>=20
> o  Martin Schwenke <martin@meltin.net>
>    * BUG 14274: ctdb-tcp: Make error handling for outbound connection
>      consistent.
>=20
>=20
> #######################################
> Reporting bugs & Development Discussion
> #######################################
>=20
> Please discuss this release on the samba-technical mailing list or by
> joining the #samba-technical IRC channel on irc.freenode.net.
>=20
> If you do report problems then please try to send high quality
> feedback. If you don't provide vital information to help us track down
> the problem then you will probably be ignored.  All bug reports should
> be filed under the "Samba 4.1 and newer" product in the=20
> project's Bugzilla
> database (https://bugzilla.samba.org/).
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D Our Code, Our Bugs, Our Responsibility.
> =3D=3D The Samba Team
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
>=20
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Download Details
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The uncompressed tarballs and patch files have been signed
> using GnuPG (ID 6F33915B6568B7EA).  The source code can be downloaded
> from:
>=20
>         https://download.samba.org/pub/samba/stable/
>=20
> The release notes are available online at:
>=20
>         https://www.samba.org/samba/history/samba-4.11.7.html
>=20
> Our Code, Our Bugs, Our Responsibility.
> (https://bugzilla.samba.org/)
>=20
>                         --Enjoy
>                         The Samba Team
>=20


