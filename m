Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4326E2E2160
	for <lists+samba-technical@lfdr.de>; Wed, 23 Dec 2020 21:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=x1rzDJk5JMzygAm79mWCcduyiwNgPNc1qwQ76ZY8SKo=; b=ILF9BOcHyRgHWBUWhW+ITh9vLw
	cP8MmXFmZVoc7vjjir6VpPYuDs7/qtP5kjDNMJM8aPXsVZ2drPCFI457+7BYrkm9qJwNI/XtZGolk
	BLepMDt4MF9eluxDTTZkXDrLPd0P8xnWL5w6IzsybCSxFcd6QCspdYAKBD68UNYzMHvzoZzFeG4yL
	YEkqy3hS0uHxL+X3g5anSdlDg5JeYLP82nNZ9QXjnqLCRdegbciyr5J8EDY9tWeP+EIvbfPdy3vVa
	xLRc05vlsVxU+oXEzTtv0QQlqEN6JG56kNKalNixm1FQwiIUWre+2taIICgfRzdk6VT6tJ2tDhF8T
	o9Pj6H8Q==;
Received: from ip6-localhost ([::1]:48090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ksApI-002Gu0-JE; Wed, 23 Dec 2020 20:33:40 +0000
Received: from thermi.consulting ([192.145.47.79]:37578) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ksAp6-002Gtt-PQ
 for samba-technical@lists.samba.org; Wed, 23 Dec 2020 20:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=thermi.consulting;
 s=201909; t=1608754492;
 bh=x1rzDJk5JMzygAm79mWCcduyiwNgPNc1qwQ76ZY8SKo=;
 h=To:From:Subject:Date:MIME-Version:Content-Type;
 b=K4ZaWMi87uC3mKFeFyEwUNfl3m7lv1R0S0rsRvl2Pc+183zN931cBhyUS8pLbGmtF
 zcSlebPdJFyBUMdUrMpA4wW8SI7thOstcCaPHJY6WYWVBvRZ9MmBIrdF4ZFqoTWQA4
 jO1Jli2+GkHiDo6QGEZ4h46gp1UYxf3a6XkNVgSzikXaoH9/DLBxIkBTZdMSK1CjHD
 0ilTwX7ZHodgw5PA2lLexYWyAp5WTqeqgsNdoXeBTAntUeP4UX1xccyBNyR4wiGwMY
 HcvMWXk4K749GrQOT3LKQ8mJ6KTWZpEPIY/FzKKztjwAQ2n0hjNzL3PPD1wYuCXZOh
 bRCczuhv7Y+KA==
To: samba-technical@lists.samba.org
Organization: Noel Kuntze IT- und Unternehmenssicherheit
Subject: TDB restrictions from 2015: Still the case?
Message-ID: <a721c07f-9c68-bed8-29de-7ffe59b10b28@thermi.consulting>
Date: Wed, 23 Dec 2020 21:14:51 +0100
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="6IM9HRcpD7WDS1dMIUzE3d82R8szuc5Eq"
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
From: Noel Kuntze via samba-technical <samba-technical@lists.samba.org>
Reply-To: Noel Kuntze <noel.kuntze@thermi.consulting>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--6IM9HRcpD7WDS1dMIUzE3d82R8szuc5Eq
Content-Type: multipart/mixed; boundary="bmItLwrjvPnbJwBmN87djtP54OvZ0eWCX";
 protected-headers="v1"
From: Noel Kuntze <noel.kuntze@thermi.consulting>
To: samba-technical@lists.samba.org
Message-ID: <a721c07f-9c68-bed8-29de-7ffe59b10b28@thermi.consulting>
Subject: TDB restrictions from 2015: Still the case?

--bmItLwrjvPnbJwBmN87djtP54OvZ0eWCX
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable

Hello list,

I am looking for a replacement for Berkeley DB.
At the moment, I am looking at TDB for that, and I found an email from 20=
15 detailing issues if TDB was used in large scale projects.
The Email from 2015 can be found in the archive[1].

Please let me know if these restrictions are still true today.

Kind regards

Noel

[1] https://lists.samba.org/archive/samba-technical/2015-August/109166.ht=
ml
--=20
Noel Kuntze
IT security consultant

GPG Key ID: 0x0739AD6C
Fingerprint: 3524 93BE B5F7 8E63 1372 AF2D F54E E40B 0739 AD6C


--bmItLwrjvPnbJwBmN87djtP54OvZ0eWCX--

--6IM9HRcpD7WDS1dMIUzE3d82R8szuc5Eq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEENSSTvrX3jmMTcq8t9U7kCwc5rWwFAl/jpTsFAwAAAAAACgkQ9U7kCwc5rWwc
ARAAhD2owU9siHZ0gf8YK0BR6/PV+1RhtCf8inl0QCzvzVBgpH6up0bNGP+gKLHZc5XSDoReOhCS
U5nkOoKPAtpGGxTlUXcJma7ZcYKB+YhqSuEO+GjS20LN2dP/IwiU85Re5i8keoJyowF5oncA/eAz
6ypZbuK/wJnN3VAtX7NtSxesIETjBJrCcL+syltERwpDQFlRgL2YJBHSyWh2o+JxqeDaJmswecJ1
o9dOB3fdM4j9sot65uiS1BTHUf40ZkjFLuX6wK/Rb4o4glvpcLxzaFirQU0L0i2NJAhtezcGcBh8
uO3328jjHlYYjYxUWszfoyLFcdqxHYQMKB6Oo0WbeK2aVFDxlKkUkzX/i1JQLUXqXSaP0gTZKQXy
a+XI8xN8jtLOLXQlplYgu0tE6HvR5/zRRNfakuKxQFOwwjIp1JYAPbR2NguyKd/yetmHo7NArEH1
niAeeymYm5bEMpt6CeDEjGbLNf02ITW1BLf8CJxatSUYNMtiOJ2YjNpneesQMwrBmI0xpTOPCopH
AdnN+l+8DOhyhFmud9tzOaGedKinnurqbPZek5sPBb2bTLImGiH7gpO736H+PrUwAWylMszw6bnU
VomsoZhwPRRlVFZlPsNJ6uozD9wgimZFvpGXxHzwRocWnYq9MCryhA3eAju04uHhgHwTGR23ipah
U1I=
=I86+
-----END PGP SIGNATURE-----

--6IM9HRcpD7WDS1dMIUzE3d82R8szuc5Eq--

