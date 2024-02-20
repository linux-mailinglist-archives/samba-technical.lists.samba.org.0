Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6090B85C1B4
	for <lists+samba-technical@lfdr.de>; Tue, 20 Feb 2024 17:50:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=kapjAT1YZSAm3Ix6IZlNMY7+XslsWSYeYatZCsHH7TM=; b=D9U3sa3NimxYoXiDl8cTisDzMZ
	FJBtYwk1GgWEB6+79sFH07QbXIYxCx/vYyrzOl6sVCSTPhiL9dYrh4bHamW+lEF57C41QB3M9oN41
	cYkg9UzW5g2mFNpjsMTWXnOoLISAN7IaryAawuL4Vu83EJ/09IxnIdHWY51mJtlEOP99tZ6VsndgV
	U1Rw/9fdMYiVdxYH60ZnIy7qWmW/r1qhrjoVhA7/Saims1O1hPJbHczeqmnlA1LIg09rguvIq6EVJ
	9A3zBxvBrqL8b/gBI9SxtJHRk7ITJjKkzP0xDKYiKfmvusVs3DwQpfCjgMvV0h9eGO3q/RudDIoaU
	4ohRzRZA==;
Received: from ip6-localhost ([::1]:44098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcTJz-0090Ki-Fz; Tue, 20 Feb 2024 16:50:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27402) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcTJq-0090KY-UD
 for samba-technical@lists.samba.org; Tue, 20 Feb 2024 16:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=kapjAT1YZSAm3Ix6IZlNMY7+XslsWSYeYatZCsHH7TM=; b=baAkJ0F8CLx75bBawNVSu3LjN5
 hwsJn94rxOYyJbvVsRbg6KiUk9nFl0UUVg2Rn7LocoVPlAlam9bw13Ug11zWseIoPnaR56CYPxHYX
 NQrFY15dmBhH9xXo8T5I2uF5WCSD+XJ6xXLyFYgOJid+hi3db41b8xo8nQ/4BBr3hiGmufmXgDIKF
 Kx+wMfM6JzQ+33Oo2IfSq1uFSI5qHdPAwzTPoNbPluQ7OvClqgQR1jZ9F8OB1IpGs1DJUxChDfKW3
 QiRm/QXaS8PcZV0eKV3NGUx4UEaHf2DZh5TiNHvwBcVqkvapAzrRj0GaolD5PPR8nhyFIbwYPqNyl
 Z7EZJfNgB+MzpcyyW/3AtKksanXv6rOz4vAt/24Mm49DbLwnOcckSa3sxCPvgoZ+L2IjVtJ9bI0w/
 b2yyJ/UgoJfNuJmaa02/X68Seke9g7e+xmyMqTccycDZu1hOeMP/GwV1DJgUsnrgCFhV/3box9g2A
 46LXjp7CoyCVMXvKq8BteV/A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcTJq-00Dzbj-0K; Tue, 20 Feb 2024 16:50:10 +0000
To: samba-technical@lists.samba.org, dmulder@samba.org
Subject: Re: [MS-GPOL] 3.2.5.1.4 Site Search
Date: Tue, 20 Feb 2024 17:50:09 +0100
Message-ID: <2749431.QOukoFCf94@magrathea>
In-Reply-To: <3472529.sQuhbGJ8Bu@magrathea>
References: <4365205.UPlyArG6xL@magrathea> <3472529.sQuhbGJ8Bu@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 20 February 2024 14:52:05 CET Andreas Schneider wrote:
> On Monday, 19 February 2024 17:52:59 CET Andreas Schneider via
> samba-technical
> wrote:
> > Hi,
> >=20
> > "[MS-GPOL] 3.2.5.1.4 Site Search" wants to know the site of the client.
> >=20
> > Details:
> >=20
> > https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gpol/
> > c2ce6870-c863-40b0-94c1-73cf53b6e634
> >=20
> > In order to do that, it does a netr_DsRGetSiteName() on the local machi=
ne
> > to the local rpc_server. If you sniff the network traffic, on the DC you
> > can see that the clients rpc_server does a CLAP query:
> >=20
> > bin/ldbsearch --use-kerberos=3Dno -H ldap://win-dc01.earth.milkyway.sit=
e -
> > UAdministrator%Secret007! -b '' --scope=3Dbase
> > '(&(DnsDomain=3DEARTH.MILKYWAY.SITE.)(Host=3DSAMBA1))(NtVer=3D0x2000001=
6)'
> > Netlogon # record 1
> > dn:
> > Netlogon::
> > EwBcAFwAVwBJAE4ALQBEAEMAMAAxAAAAAABFAEEAUgBUAEgAAABsfosaQV2fQrJLMfR
> > xuNCLAAAAAAAAAAAAAAAAAAAAAAVlYXJ0aAhtaWxreXdheQRzaXRlAMBGCFdJTi1EQzAxwE=
YKO
> > K
> > jA ffMDAAMAAAD/////
> >=20
> > # returned 1 records
> > # 1 entries
> > # 0 referrals
> >=20
> > I think this is actually the same as:
> >=20
> >=20
> > $ wbinfo --dsgetdcname=3Dearth.milkyway.site
> > \\WIN-DC01.earth.milkyway.site
> > \\192.168.56.10
> > 1
> > 1a8b7e6c-5d41-429f-b24b-31f471b8d08b
> > earth.milkyway.site
> > earth.milkyway.site
> > 0xe003f3fd
> > Default-First-Site-Name
> > Default-First-Site-Name
> >=20
> >=20
> > As samba-gpupdate is written in Python, the question is how to do a
> > dsgetdcname() from Python? Could someone give some pointers?
>=20
> librpc/ndr/ndr_nbt.c has ndr_pull_netlogon_samlogon_response()
>=20
> However there is no unpack function available in
>=20
> bin/default/librpc/gen_ndr/py_nbt.c for that. I can find the union etc. b=
ut
> the unpack seems to be missing. How do I get that?

With the help of G=FCnther I got it working in python. However I have a=20
etlogon_samlogon_response_union now, how do I get a=20
NETLOGON_SAM_LOGON_RESPONSE_Type out of that now?

samlogon_response.ntver gives me the union level, how do I convert the=20
samlogon_response.data to NETLOGON_SAM_LOGON_RESPONSE?



=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



