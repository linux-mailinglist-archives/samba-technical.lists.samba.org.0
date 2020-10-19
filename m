Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A762F292430
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 11:02:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=XvY7yhP8z3AlOrdMMr9YF4WvZmOVlDXlCTmjkTPt5nc=; b=KJ0MyJmqhoJig59mfTKDKJqxFX
	8g4hdEmbhpXVWjfdVHxafSeYVF66txao4zpEKtXGFcRkAsoZe9f3dlGjiq+avRMPS7WIBLEAt7Ij+
	qr0l0Ox2J0H6rFtaweCXwptXuTcZ5nuWLfXjQaUZFsjnDrJ0fn8BigCzMiFhXBx3/F4YHFn44wekp
	YifGfe9SQm/3Sfnuu7aNxyzZIiHYx2nwxBHveTBmwN7FMUqKxTCq1VpdXyDDP71u6tXOnAjrzcRDc
	5F1dLZKTH2Q/T+ltut5yKegGPVfd5GG1hHno7cUY0rtX0xUsBF9f2wbcb38yn3v7Y5/OD32laTMAo
	mdCmfI4Q==;
Received: from ip6-localhost ([::1]:32462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUR3M-00CgWR-BV; Mon, 19 Oct 2020 09:02:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17254) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUR3F-00CgWK-8W
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 09:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:Cc:From:To;
 bh=XvY7yhP8z3AlOrdMMr9YF4WvZmOVlDXlCTmjkTPt5nc=; b=rPnw/7oPqNd9JyCi6anDVFPOUj
 +QUy8FU9G2mUZ26i1xeRvdUyFPDgaIMnRxe3DZRxC7KFI9H4ynpwO6EG8B0hCqeOjrXBQm6pqsxnZ
 8fUyOwIwRPq+Ht9rSzYduYfeNXB1yjxROxoFgmW4DUOb20S+iG8tscCWpeO7ivDPSKDz4R/tb8H9/
 cX+uiNwzMNigd5AXrW7DNRQbHMWFiJ9HNt4P/977lN3p2kWipbW6SeJCBR2UpY5AS6Q4HMfcN8ZO7
 kYqvAZP9WIjTYDr9J03IisUH/qD3Aq3rbvY8wk3AYmyBQ731F5ajWQ9AqDVl37gRX0f5xwg3xkriL
 +Jmu1w7A1r/M+HBAJQNNCUO2IsL2myCloc16hZE4D5AMygKp9jjpkQwyyYBY3Ka4TEYBOaEBx6g8K
 xn0ThCdBxkh/7GXRakmitfCEjzTwiBlFoFt8+rQb9xtu670OZK6HUSRlph4HRmp8iO3Gr2QcOIVKZ
 rkI4HKvz4T4IxXJZHxfNVzD8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUR3E-0001t8-EI; Mon, 19 Oct 2020 09:01:56 +0000
Subject: Re: Clarification around the DCO
To: Rowland penny <rpenny@samba.org>
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer> <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
 <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
 <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
 <daeb61f4f70d3e1a2c7f9b111e3ba3c2e247371a.camel@HansenPartnership.com>
 <d1d94535-fd9f-e76c-0d5e-3ce454d12f73@samba.org>
Message-ID: <2207cfb3-b1c3-ac2f-289f-02340c755a47@samba.org>
Date: Mon, 19 Oct 2020 11:01:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <d1d94535-fd9f-e76c-0d5e-3ce454d12f73@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7W0pSgoN3pFoFkU2TOwYiaePuv4HsyAx5"
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7W0pSgoN3pFoFkU2TOwYiaePuv4HsyAx5
Content-Type: multipart/mixed; boundary="JwtJDomW0m1JFS5XK6coYP3adCedvawX9"

--JwtJDomW0m1JFS5XK6coYP3adCedvawX9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10/19/20 um 10:09 AM schrieb Rowland penny via samba-technical:
> So, I bunch of Lawyers and the SFC are trying to dictate to Samba just
> what is in the DCO and what it should be called. The lawyers are only
> kicking up a fuss and dragging Samba into their argument because they
> cannot get their way. Is this a much simpler version of what happened ?=


this seems really harsh and to me it seems James doesn't deserve such a
response in any way. He has been carefully expressing why he's
approaching us and he is not forcing us in any way.

Thanks!
-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--JwtJDomW0m1JFS5XK6coYP3adCedvawX9--

--7W0pSgoN3pFoFkU2TOwYiaePuv4HsyAx5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl+NVgMACgkQqh6bcSY5
nkbliw//QFmpCVm1zIIfKNqRxAA8moptp54BK3pekiw5l/6OQluvGbrxr6wlNcsI
sWNr/y41PzMJsyKDsWgJDjIZkMw54AMbIpmsfJF5/FMFqSfTw5/22rPJ5Z6dyLIZ
4KV08KooE8eKf9JqqOP3obrW0qjLuH2XMihLUpmk0li+iOc2MSerkDr0qmriFv53
ergTN2YNgrGUB1zw7dGRSBYRXj+szTzwVvmYaj8973ndA06l+n8GU147wM4p7SK4
mWYDB4/A4lbSr6FQo8k9dvuMnuICLYEDzbuCuF9wOMOLEm6zG2rbWLhQKrSdiGDg
ouXrrkg7PgpGCaVBCXLH/NSXNvRakEcpQ/m5qx3jSZdvX+rrd5HfgLfkjLrzIIgq
rAY1brAdP4oSmbivGUNahASOO9cH2MzXrE3nKIDU8NOLgDn1FGGtLehynYUS4DlD
Em7Rhn5ChKZgpZ5nlou5v5XTt/yhSj2Tutz2dluDrSGry9vrGP14t4KL9dVZK9pL
B2faCJ+aIvo6NeFPm0pPGksLVGsaPikkRYbRINrvy3L5DergvMJZX5cphw8d9Ftj
drhtZWU1wKTTJxBsWF8wRDrM+RAqmWv9sNV0XD1noC6k1yIE9DGe7X8w6dD4KDdo
8mDKCDQkJo9WyuIggBjEJe5VH72zKGer2B29Q8536HBmMGLmOuE=
=Kw4a
-----END PGP SIGNATURE-----

--7W0pSgoN3pFoFkU2TOwYiaePuv4HsyAx5--

