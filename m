Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C6229289A
	for <lists+samba-technical@lfdr.de>; Mon, 19 Oct 2020 15:51:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ouXmQZ3oHfmxCh167xIDyhNQKG588w0tcRjdY+glEKw=; b=U9GpFIJH6btCOinCAC0zYQG/45
	9DkXRQ6DA5aDSw9nj2Zy6rEKdTd2Tpgnf8Dp1F7OSuRHeSbCsYizxGEd0SZDCxzFQZ0miMhVyfTNn
	8ud9xB5PtB9CSW+6nW7zWWgE9EG9nNA/PEbPJudtS/tRAePYTCI2Mp7gvXVNKoKco92uZlF9+Y99a
	ats93LM8OhZqO2kutgM5efc01o0nJ443vXzTaejJSgwyKNFXPY+9DrfDZeWKL0vwalWM7XQvJydSP
	zKgcFBY+aV60nnxnxoIottlEsExwoN+NJES/3vAGU01IId7qF7nMb9OsktFNwVBqo3sueK7NKKs6X
	+AIydwDg==;
Received: from ip6-localhost ([::1]:45512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kUVYk-00Cijr-VF; Mon, 19 Oct 2020 13:50:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60604) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUVYe-00Cijk-GP
 for samba-technical@lists.samba.org; Mon, 19 Oct 2020 13:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ouXmQZ3oHfmxCh167xIDyhNQKG588w0tcRjdY+glEKw=; b=tTNKgD9iTY+NU9Ni5KbgXlHM1X
 j4xPMBNW0edgsfqFoLaBAOMHWu57ObkEFOHf1AB6qfpDxNxiHJ/LPv/eLTCAvAvSAg0quB3RSurU8
 ECxs7hAu6m3DbgckwruCQ7iscEa6t25vYLvNO6sINtu58IJ3Hvjrt7XQFYSZz/iX6uMjTTzWrHT+c
 wHuJDomNhg0FqNHGJ5cY8BgME0kwnOUqjht+5DHb8skbTIyGIv87nh7SLMAp5l8hr3ojvnRberFpl
 6dXhTfEkHLIcqNzS1gHg7gZAtrI63PSZ9G4AF9TIIvbAtCgvf6z1zRxmewSnEhC4Q1Kgx4JxI6L/f
 DBZwV/L9Ka2OXUhv3Sg2BfxaAALpr35Q0iusjomKu5ZeIgvmR48lYebNmVZNjMEivIphYx4GQh82O
 6e7f3GAYeBIqdupWr7BHoHVjuxW9a35G1msqr+cz5kNDOXKL9OFpMDnFWPkpqb15xK112EwrBqxnA
 sSmsimviKDVY5Q3ovOZm1sv1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kUVYd-0004PB-Jk; Mon, 19 Oct 2020 13:50:39 +0000
Subject: Re: Clarification around the DCO
To: Andrew Bartlett <abartlet@samba.org>,
 James Bottomley <James.Bottomley@HansenPartnership.com>,
 "Bradley M. Kuhn" <bkuhn@sfconservancy.org>, samba-technical@lists.samba.org
References: <a4f34abf8b943b01e0f982e21fe1518009fcc556.camel@HansenPartnership.com>
 <20201017004357.GA360279@jeremy-acer> <20201017005611.GB360279@jeremy-acer>
 <20201017023840.GA344206@ebb.org>
 <5e8a6736aafa2e4a593af2ee79451cc62a283818.camel@HansenPartnership.com>
 <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
Message-ID: <d6e7b5e0-dec2-c408-0ada-eab57b53bf13@samba.org>
Date: Mon, 19 Oct 2020 15:50:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <2b13b0dee1ce4ef9b21825ee38feeca8855747dc.camel@samba.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="kjQNbjW6X00r8vHXtHeS16zrftayqA5bm"
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--kjQNbjW6X00r8vHXtHeS16zrftayqA5bm
Content-Type: multipart/mixed; boundary="TssubzIETSf4hWwv1jCEVuzqbHIXCrzDu"

--TssubzIETSf4hWwv1jCEVuzqbHIXCrzDu
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Am 10/19/20 um 12:00 AM schrieb Andrew Bartlett via samba-technical:
> That is all well and good, but the way this is playing out here is
> really awful.
>=20
> It would be one thing if somebody, perhaps you, came to our project
> politely suggesting 'have you considered the benefits of'...

To me it seems this is just what James did.

*scratches head*

-slow

--=20
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46


--TssubzIETSf4hWwv1jCEVuzqbHIXCrzDu--

--kjQNbjW6X00r8vHXtHeS16zrftayqA5bm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE+uLGCIokJSBRxVnkqh6bcSY5nkYFAl+Nma4ACgkQqh6bcSY5
nkaBJQ//f4gtOsrSFtp0glnjaxVqNTzyaYB5JkMwKQhhLRWbX2Zc23Q0uA0MdK+I
DT/HbtJcIYQqvPM+47riO8iV0mJVOuCSRrJX3h4Z+bSdifBM+koAPl91oGT28gR4
hkEJHotHrNN+EhWYWB7WiTIGeYhBtcyzMdBVSrASmvXHVK8DKddx+473GtZ8osoZ
Xowqd9Qek6eYybwQ5yNuWm0YdL2/6joCKWdNBymjJ6Da2C4rBIcfcqTzHf7fMnmO
Pzva7C2Aifqz6vGOuSMzkasnOIT3Dg8EqcLeG3jUvUJs8cuJVSuY7svm7SAEfWE4
KOiiR9Ev4YuQKs+sn/LLv+uXDsHUuvFZY62uft5aYFdodjAZw62rhpSqvHCDOZrd
lWCzZy+CnqluINbNrV806HRC9H9qRAM9z6uzqSgs42MF+Sqx5VjM7nqLBhBrNxfH
EicumFCzZgipAHGElQN/uSj43yADAqj+zZSeckWAhkYhwD7Jaww15GJXvw7qb+Vz
f7y6P1YRUuvJBvvOZJYfEZPFiHDBc5ZbCLK0O8c+a3K4SKMvYzOsy4sE83YZYhrg
pnsDzb31gkR/DIIHxe40lngnAgg16EOaL1sOtXWaTyQs5ujTyzYVWhdjlvX8Lo95
ZgIp6NBdJZ51+TrG61OtAxZJ6EAQ2rlxdjUvto6bGb84J65ec4E=
=zWaF
-----END PGP SIGNATURE-----

--kjQNbjW6X00r8vHXtHeS16zrftayqA5bm--

