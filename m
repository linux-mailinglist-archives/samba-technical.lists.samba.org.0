Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7122185FB33
	for <lists+samba-technical@lfdr.de>; Thu, 22 Feb 2024 15:25:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=42apMZ+Uv8kGDFJAZeqsYdDeqISQDW92Pzrqb5ZTLhY=; b=ASn6v/dQdIIe8PwQtW30q9gPZ3
	rISneSImOZqGlsr2SR/1tTQyUQsfltrmkqOU5HItw+SyI3ZggFX17H8ou1wm5YbNz9kH9+Cw0RHqM
	op0Br0x5OAdmNnyyElMB5yE0O8qKNDEEKw2A+2HPlGHqyDSlz6BAUPLpYW9wZ+yoGB76m7FZSmN1X
	GZcwxQtiqfMs4Ev8JfZlg+wJS3qxWR5GNamfDNw0M6X59LoJN0oE5JVszIF3nRJOCbPg4Fu1ce5ll
	dx/eiQ3Yt4H7AJi7wQ12zwI/xVM/88wRI6jupTyNmVx87zMUewnrQDYIhc53jcgl14f9jSBdzo5bV
	5cPQazNg==;
Received: from ip6-localhost ([::1]:61936 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rdA0U-009BOU-VT; Thu, 22 Feb 2024 14:25:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49678) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rdA0P-009BOI-Vh
 for samba-technical@lists.samba.org; Thu, 22 Feb 2024 14:25:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=42apMZ+Uv8kGDFJAZeqsYdDeqISQDW92Pzrqb5ZTLhY=; b=ERG/F3r32XeHQuJNb+96KQ63Mn
 LrLaDJP5PHpRvYeQZznaD0IUf3O7b22beYlFgupFIbsMkrvA8c3bkk+4Hw+48J23bKJtauevCDPdL
 M0gO4xUcbcOYurpMU7g98TkUsVjdSGB2CjBnEaKa3dN8MxUFZPlfmc37DdUkQfZEMPZEc9TOGkuhF
 s/J9VLmW5atKgw5Ep2HS1zTVk1eYRRnI27URtUHN55RtY91h5uqECFX3FtgASdIQi8hAoeoEU3Fc9
 3NUgYYG/O770C81pMtcjfR/wFbQJggpkmzTsKd2jq4DkNwFNUiPAm9VxtjWX7b9eWNLErmKzU4lZH
 CBRpC04g1xQvj5gMPjOO/eXixuQc4KxG6QYIMWbHSHg39HNMuIlnp/B2ge5pfHNJTMrrOqhB9NH+8
 pht57shbUyI7ECWWvE/rStR2Gci+9Yoxbv2olh5E68hMeBbdQQWU7zYl624aVXt+WqhLL920I1ljy
 5MDxSAPp6bZYN43t7V1J6Q2U;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rdA0O-00ELY2-2p; Thu, 22 Feb 2024 14:24:57 +0000
To: samba-technical@lists.samba.org, dmulder@samba.org
Subject: Re: [MS-GPOL] 3.2.5.1.4 Site Search
Date: Thu, 22 Feb 2024 15:24:55 +0100
Message-ID: <1856287.25eIC5XRat@magrathea>
In-Reply-To: <2749431.QOukoFCf94@magrathea>
References: <4365205.UPlyArG6xL@magrathea> <3472529.sQuhbGJ8Bu@magrathea>
 <2749431.QOukoFCf94@magrathea>
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
Cc: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 20 February 2024 17:50:09 CET Andreas Schneider via samba-
technical wrote:
> On Tuesday, 20 February 2024 14:52:05 CET Andreas Schneider wrote:
> > On Monday, 19 February 2024 17:52:59 CET Andreas Schneider via
> > samba-technical
> >=20
> > wrote:
> > > Hi,
> > >=20
> > > "[MS-GPOL] 3.2.5.1.4 Site Search" wants to know the site of the clien=
t.
> > >=20
> > > Details:
> > >=20
> > > https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-gpol/
> > > c2ce6870-c863-40b0-94c1-73cf53b6e634
> > >=20
> > > In order to do that, it does a netr_DsRGetSiteName() on the local
> > > machine
> > > to the local rpc_server. If you sniff the network traffic, on the DC =
you
> > > can see that the clients rpc_server does a CLAP query:
> > >=20
> > > bin/ldbsearch --use-kerberos=3Dno -H ldap://win-dc01.earth.milkyway.s=
ite -
> > > UAdministrator%Secret007! -b '' --scope=3Dbase
> > > '(&(DnsDomain=3DEARTH.MILKYWAY.SITE.)(Host=3DSAMBA1))(NtVer=3D0x20000=
016)'
> > > Netlogon # record 1
> > > dn:
> > > Netlogon::
> > > EwBcAFwAVwBJAE4ALQBEAEMAMAAxAAAAAABFAEEAUgBUAEgAAABsfosaQV2fQrJLMfR
> > > xuNCLAAAAAAAAAAAAAAAAAAAAAAVlYXJ0aAhtaWxreXdheQRzaXRlAMBGCFdJTi1EQzAx=
wEY
> > > KO
> > > K
> > > jA ffMDAAMAAAD/////
> > >=20
> > > # returned 1 records
> > > # 1 entries
> > > # 0 referrals
> > >=20
> > > I think this is actually the same as:
> > >=20
> > >=20
> > > $ wbinfo --dsgetdcname=3Dearth.milkyway.site
> > > \\WIN-DC01.earth.milkyway.site
> > > \\192.168.56.10
> > > 1
> > > 1a8b7e6c-5d41-429f-b24b-31f471b8d08b
> > > earth.milkyway.site
> > > earth.milkyway.site
> > > 0xe003f3fd
> > > Default-First-Site-Name
> > > Default-First-Site-Name
> > >=20
> > >=20
> > > As samba-gpupdate is written in Python, the question is how to do a
> > > dsgetdcname() from Python? Could someone give some pointers?
> >=20
> > librpc/ndr/ndr_nbt.c has ndr_pull_netlogon_samlogon_response()
> >=20
> > However there is no unpack function available in
> >=20
> > bin/default/librpc/gen_ndr/py_nbt.c for that. I can find the union etc.
> > but
> > the unpack seems to be missing. How do I get that?
>=20
> With the help of G=FCnther I got it working in python. However I have a
> etlogon_samlogon_response_union now, how do I get a
> NETLOGON_SAM_LOGON_RESPONSE_Type out of that now?
>=20
> samlogon_response.ntver gives me the union level, how do I convert the
> samlogon_response.data to NETLOGON_SAM_LOGON_RESPONSE?

I figured it out in the meantime. It isn't really clear how this works from=
=20
looking at the code, but ntver is the union level and that needs to be set=
=20
correctly.

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



