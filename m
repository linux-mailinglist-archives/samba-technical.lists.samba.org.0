Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EE94F132287
	for <lists+samba-technical@lfdr.de>; Tue,  7 Jan 2020 10:35:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=+L/eVW8PVHR8gRSuy8QydW4gHr/EIB/+LPPN7uYTIxY=; b=E43K1kDYck6u9Hsv9yePs4HNr/
	cPKp4j7kufN96y8MwIGyaw80bnQFDqhjnRFsRjvnHwA8s7Z6x2qgmKtMJgNXseKMu0Q16D9hyIjrB
	VVatkaqF9Giyr30G4P93yZt0eJWITLhyR2knUOFBoU7fogt5/Z0j6u9b7eeqMQPJFfn1xp3Ev5Tea
	vH44H5OYN1ve3vjispE1Tf9A4Iy7Jq0BVyIxWbFQiBKW9WXH/FrkLuZu7OQrCwZnaag2rrtZ3Fq5D
	Ornjro+Dxw3YLaejZbxO3nEsnKMDt40ZL07Rj8Av5whDVMGQ7wRt2W+HfLFZ1dXy228RRmaSFJx8i
	E+OV3jug==;
Received: from localhost ([::1]:54960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iolFC-002bjx-DM; Tue, 07 Jan 2020 09:33:46 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:41611) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iolF7-002bjq-RF
 for samba-technical@lists.samba.org; Tue, 07 Jan 2020 09:33:44 +0000
Received: from intern.SerNet.DE by mail.SerNet.DE with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1iolF7-0000ni-8H; Tue, 07 Jan 2020 10:33:41 +0100
Received: by intern.sernet.de
 id 1iolF7-0000us-3P; Tue, 07 Jan 2020 10:33:41 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>) id 1iolF6-00020h-W3
 for samba-technical@lists.samba.org; Tue, 07 Jan 2020 10:33:40 +0100
Date: Tue, 7 Jan 2020 10:33:40 +0100
To: samba-technical@lists.samba.org
Subject: [PATCH] docs-xml/winbindnssinfo: clarify interaction with idmap_ad
 etc.
Message-ID: <20200107093340.GA7605@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Content-Disposition: inline
X-Q: Die Schriftsteller koennen nicht so schnell schreiben, wie die
 Regierungen Kriege machen; denn das Schreiben verlangt Denkarbeit. - Brecht
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
From: =?utf-8?q?Bj=C3=B6rn_JACKE_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?iso-8859-1?Q?Bj=F6rn?= JACKE <bj@SerNet.DE>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--DKU6Jbt7q3WqK7+M
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

review and eventually push appreciated...

Thanks
Bj=F6rn

--Nq2Wo0NMKNjxTN9z
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-docs-xml-winbindnssinfo-clarify-interaction-with-idm.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 950a0de101cf3e4faa0fe3ff3f7c2ee2095932d9 Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Jacke?=3D <bjacke@samba.org>
Date: Tue, 7 Jan 2020 10:21:18 +0100
Subject: [PATCH] docs-xml/winbindnssinfo: clarify interaction with idmap_ad
 etc.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14122
RN: docs: clarify interaction between winbind nss info and idmap backend

Signed-off-by: Bjoern Jacke <bjacke@samba.org>
---
 docs-xml/smbdotconf/winbind/winbindnssinfo.xml | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/docs-xml/smbdotconf/winbind/winbindnssinfo.xml b/docs-xml/smbd=
otconf/winbind/winbindnssinfo.xml
index d8347442a8da..e6d17c256a15 100644
--- a/docs-xml/smbdotconf/winbind/winbindnssinfo.xml
+++ b/docs-xml/smbdotconf/winbind/winbindnssinfo.xml
@@ -22,11 +22,10 @@
 			Domain Controller does support the Microsoft "Services for Unix" (SFU)
 			LDAP schema, winbind can retrieve the login shell and the home
 			directory attributes directly from your Directory Server. For SFU 3.0 o=
r 3.5 simply choose
-			"sfu", if you use SFU 2.0 please choose "sfu20". Note that
-			retrieving UID and GID from your ADS-Server requires to
-			use <parameter moreinfo=3D"none">idmap config DOMAIN:backend</parameter=
> =3D ad
-			as well. The primary group membership is currently
-			always calculated via the "primaryGroupID" LDAP attribute.
+			"sfu", if you use SFU 2.0 please choose "sfu20".</para>
+			<para>Note that for the idmap backend <refentrytitle>idmap_ad</refentry=
title>
+			you need to configure those settings in the idmap configuration section.
+			Make sure to consult the documentation of the idmap backend that you ar=
e using.
 			</para>
 		</listitem>
 	</itemizedlist>
--=20
2.17.1


--Nq2Wo0NMKNjxTN9z--

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXhRQcAAKCRAxQwafzsNC
PwTmAP4yDMrxqpYNtYV6cvW+gscKtinmOL2X+HGOQCdUIgdvYgEAoVD45nyWBmAI
RKmayAE3lLoU06hNhjhKsaz6V1pdUAw=
=CUar
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--

