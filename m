Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B736CBD250
	for <lists+samba-technical@lfdr.de>; Tue, 24 Sep 2019 21:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=gI7vtCVy0YbTF1hqhi40BG7hd2LSud735myj/WD9mkg=; b=IX9EtA3bj3OUATXcud9y7OEd+S
	W/0xfbhvxoD43yaTIRfTrPKyN1Q2JcasCqwrRGs2pEMT6YTgR+e9hs46ksZeHyY4P58ikLl73wyVa
	GBviYVHtyvi+MaO75vySikK2YR6pqV6YP2rbi1cypthekTRxEPIRqdAJpT37y6ICVGVtD/9VBanbc
	nic0Nt7hRtwE38obQnoM//MWroyBcE/pOW1Sd8PBuMplypFmDhYBJFyuJ01u6rfUQCIbvJKg178EX
	FlIN+768ENjO1GxrNVmZ/PvruNiZVveCCF+3NrXh3VeVmY2zBPN32h1niSVIWMa7oeX8U488b5M89
	KdoxvctA==;
Received: from localhost ([::1]:30676 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iCq5X-008J07-1n; Tue, 24 Sep 2019 19:03:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61304) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCq5T-008J00-3J
 for samba-technical@lists.samba.org; Tue, 24 Sep 2019 19:03:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=gI7vtCVy0YbTF1hqhi40BG7hd2LSud735myj/WD9mkg=; b=G2ihyunTcqP17jLkNDMBFUByU0
 1MLE4PFu80oSveKJbpHujdW6q3NVBHFHeNBn4ecusIyEnnpl0g/7dwyg1/8onfgVlb4HbyPYC1Oz0
 MkGkMWbFwaIYwfo2tH2zvIoLKZdL8bj9KHH69IaNpd+ZSP1bxyFdlSyJLyPOWtaMW2QQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iCq5S-0003mV-8F; Tue, 24 Sep 2019 19:02:58 +0000
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
 <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
 <21a27887-ef4f-2c51-f511-e682f1548a22@samba.org>
Openpgp: id=A3D192CE44EF412517BCED646A739B025C6B98D4
Message-ID: <c5741e7a-74df-b2d4-479a-8d555c0bf0e2@samba.org>
Date: Tue, 24 Sep 2019 21:02:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <21a27887-ef4f-2c51-f511-e682f1548a22@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="1bCKGX6mwMw5W8MBhoDHyhRluNF0Vn2Rq"
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1bCKGX6mwMw5W8MBhoDHyhRluNF0Vn2Rq
Content-Type: multipart/mixed; boundary="gRgzhKq43AD0VvI7Znpj58yc0kMu8hQw3";
 protected-headers="v1"
From: Stefan Metzmacher <metze@samba.org>
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Message-ID: <c5741e7a-74df-b2d4-479a-8d555c0bf0e2@samba.org>
Subject: Re: getpwnam/uid for group with ID_TYPE_BOTH
References: <20190923193911.GA9762@samba.org>
 <62c2ca93-2600-27d9-1697-0d465efed1a9@samba.org>
 <8e2dd85c-37d3-6c65-49f6-28aa5d59018f@samba.org>
 <21a27887-ef4f-2c51-f511-e682f1548a22@samba.org>
In-Reply-To: <21a27887-ef4f-2c51-f511-e682f1548a22@samba.org>

--gRgzhKq43AD0VvI7Znpj58yc0kMu8hQw3
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Rowland,

> Well, it doesn't do that on an actual Unix domain member using the
> winbind rid backend, but then, from my understanding, idmap.ldb is only=

> read on a DC, or am I missing something ?

idmap_rid uses ID_TYPE_BOTH as well as idmap_autorid.
And it should work on a member server just fine and it's a bug that it
doesn't.

metze


--gRgzhKq43AD0VvI7Znpj58yc0kMu8hQw3--

--1bCKGX6mwMw5W8MBhoDHyhRluNF0Vn2Rq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEfFbGo3YXpfgryIw9DbX1YShpvVYFAl2KaFoACgkQDbX1YShp
vVb4BA//bEQ7dJX191+WpjzTM2W5r3h53r/UHbREP0SgHt/L1NzJJgx9X31eOiS6
DvhNTsnEuSitN0CGhP14fR8YPBIna4MuG4STaQ9vktde8CQPht0IJ/Qmdrx1ENj1
SU70hVKMIyLVtrqhZ/WgHeKm/pTBLEboV7V9U9Z2tCc6VQA59AoQ/ttlDj/QIHkR
EvpjKoFR0DkYmcBYtAfTvPOkCBFxxJhpZJJP8XRTeAyRzFD9bCN6vGxOaeeV8DwC
00Ee8h/CWp6CRqbODegXbXEzmZn2dcR1bOF/MEU9a0zjPOf/Rjky7yx2CInecihd
3d/3023bVausNTtlf5ZvfZ4LJdYV2TyoG1xEsJn096SFodXRto4505fvwIS7Z8mF
qOZRq3hteWdCCCudSaCJ14jDheP0rPoTypdzVMhNsS+4ccWfZ+BB0+yE7Lhxe7px
QhOeMwz7y5dkHAiVPmM8EM5aE0O45Smt3PCczlFSolwDLPCPPga1I5/6rUd8e9EV
3DshSL4sCEIP/IDH5xVX1G4Tvy4Jx+TcBVvfENinBE58qd7PotO0EzpkIJ/IGHKc
zC9Bn+pFtVdwBDaa6Q8uWXzVLXNWQUYaTsgmfpeUQB0tFGAWguObz+BaKqBKvD6O
dMxy7BDABIeCOsyQAs/1uZ7W2l7hpdL8n7+isGX+sohsdbfrlB4=
=b0NX
-----END PGP SIGNATURE-----

--1bCKGX6mwMw5W8MBhoDHyhRluNF0Vn2Rq--

