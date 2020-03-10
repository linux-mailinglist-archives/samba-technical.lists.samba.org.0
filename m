Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C61217F789
	for <lists+samba-technical@lfdr.de>; Tue, 10 Mar 2020 13:36:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0JiPECwevrM0zTn8+X0gy/F7vZlSuKv2bAWwVgCI3uw=; b=s1FjlXBE3Td1hAesGhKvBlBOrs
	x43KmCCPJsR3DxUR4cEeH117OxSlAE00x2QF8sC3BfaNLKVCZLCGgWvMIx6wW4Y6THBLs8QJIQ6a4
	+5o1z0kBEfARHbSfGMwqfCxl8Q9CeBb01bJKf8B4++NiVpwp21rJ9ZT5KDjWfJIXL9uv8O+S54QNv
	n1uWP0hjjh10f9WlbPlacEANKXNAcvILTyUwc3tN0MTsABM0n/4myLIOTVNMpEMymcHZ/uaAnpe7R
	WE2i1UTXs0otVTD0nPcUaIEUC4n/l+mTTvOUuca8r20mWDj+MhMZULrl8nnl/bGNTdfS6rvnDxtvI
	5oBV7OhA==;
Received: from ip6-localhost ([::1]:47854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBe7p-00FkpU-9n; Tue, 10 Mar 2020 12:36:45 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:37076) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBe7j-00FkpN-Ic
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 12:36:41 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1584448600.67274@HlFyy4YMAMHjrC8JNoS/uw
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 1BA6111F431.A7043
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 1BA6111F431;
 Tue, 10 Mar 2020 13:36:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1583843797;
 bh=0JiPECwevrM0zTn8+X0gy/F7vZlSuKv2bAWwVgCI3uw=;
 h=Subject:From:To:Date:In-Reply-To:References:From;
 b=l3amqfToxnW/oSLMkrNprcDZk1fD5XLbItHDmvRrgaPQFDkkNy8WwiD3jeYj/VcSW
 ap5y28X5LJR4SzNZ1hB2UXVi+kmjUZWEbxfXLl1gWEHXDVDUzlJZHqViZfApWQvP2z
 16dPHIJODLgz6IXSNMZdMa0glObqeeOmEfVKjXVPX7pX1s6AvUka6O1cIxaqcRHZc3
 +CALoyuAAZroQAvsYe3KkkY5yd5Qa5X8scAZWDhI39Y0zgyitpoEnN6GQ/8CZEHrMQ
 UtF30LSVMeJCoP8RteeyQEWlQlO61jNOj1Z2bTMDZkOpliANteJe9vrqfraZSjzU/Z
 Hm3csj/eIrArQ==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id D2F173AF8C;
 Tue, 10 Mar 2020 13:36:30 +0100 (CET)
Subject: RE: [Announce] Samba 4.11.7 Available for Download
To: =?windows-1252?Q?Stefan_Metzmacher?= <metze@samba.org>, 
 =?windows-1252?Q?samba-technical=40lists.samba.org?=
 <samba-technical@lists.samba.org>
Date: Tue, 10 Mar 2020 13:36:30 +0100
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0a8e9035-62b6-776c-6547-8ca70919b4d7@samba.org>
References: <vmime.5e677069.403d.5e6bdcdf7b71b479@ms249-lin-003.rotterdam.bazuin.nl>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: AdX22IYrdfbAu4FrSGmGTY7wpHZ8PQ==
Message-Id: <vmime.5e6789ce.1774.49cd70a24e9d9bae@ms249-lin-003.rotterdam.bazuin.nl>
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

Hai=20

COOL, Thanks Metze, for the quick work.=20

:-) =20

Greetz,=20

Louis

=20

> -----Oorspronkelijk bericht-----
> Van: Stefan Metzmacher [mailto:metze@samba.org]=20
> Verzonden: dinsdag 10 maart 2020 13:36
> Aan: L.P.H. van Belle; samba-technical@lists.samba.org
> Onderwerp: Re: [Announce] Samba 4.11.7 Available for Download
>=20
> Am 10.03.20 um 11:48 schrieb L.P.H. van Belle via samba-technical:
> >=20
> > Where is LDB 2.09=3F=20
> > I dont see it here.=20
> > https://download.samba.org/pub/ldb/=3FC=3DM;O=3DD=20
>=20
> Should be there now...
>=20
> metze
>=20
>=20


