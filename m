Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A617C048
	for <lists+samba-technical@lfdr.de>; Fri,  6 Mar 2020 15:32:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=JNiUfhasizlHwAB1rcDjnG2JKijp4LqKKfzr7Lp3wDY=; b=rNQGRz1djrZKhRAvR29iSqlWkz
	N7lUzRHmdIw7QhL9ZYvrU70hC4S73VazBBXQtIgsFyQ3p7tIMnyTHFea/GKk7cVtyUPyhyIQLPkud
	49U62798Id3gEKI/LNaq3oF+mogVGimVv4gOgP64QnwAJpaW0SrhUT2412V7utmQCIMahGqi6Uvu5
	TUrEe/nqepJqbDpYRLbZQ9/8hLrww39QiT8YVH3tpKyfeS2DHFRIAHiiYRSBbbVqiRzWogG/TyT3i
	PACcPda5ByTF8mE8BnPW6oso3jPZ7oCjNJHvk7BZCzBNI+S/WyG73UJrYhriRuZ8EEOShJeOPI33c
	eOb7auDQ==;
Received: from localhost ([::1]:29404 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jAE10-00FIww-QW; Fri, 06 Mar 2020 14:31:50 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:56877) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jAE0w-00FIwp-CD
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 14:31:48 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1jAE0w-0006ld-4z; Fri, 06 Mar 2020 15:31:46 +0100
Received: by intern.sernet.de
 id 1jAE0w-0006BM-1P; Fri, 06 Mar 2020 15:31:46 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>) id 1jAE0v-0005cz-TU
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 15:31:45 +0100
Date: Fri, 6 Mar 2020 15:31:45 +0100
To: samba-technical@lists.samba.org
Subject: ad/provision: add OID 1.2.840.113556.1.4.2237 to supportedCapabilities
Message-ID: <20200306143145.GA21545@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Bn2rw/3z4jIqBvZU"
Content-Disposition: inline
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


--Bn2rw/3z4jIqBvZU
Content-Type: multipart/mixed; boundary="sm4nu43k4a2Rpi4c"
Content-Disposition: inline


--sm4nu43k4a2Rpi4c
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

review and push appreciated ...

Bj=F6rn

--sm4nu43k4a2Rpi4c
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-ad-provision-add-OID-1.2.840.113556.1.4.2237-to-supp.patch"
Content-Transfer-Encoding: quoted-printable

=46rom ccee20525ac2bd45e757d72c744b7945e4d6ceaf Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Jacke?=3D <bjacke@samba.org>
Date: Fri, 6 Mar 2020 15:27:24 +0100
Subject: [PATCH] ad/provision: add OID 1.2.840.113556.1.4.2237 to
 supportedCapabilities

supportedCapabilities: 1.2.840.113556.1.4.2237
(LDAP_CAP_ACTIVE_DIRECTORY_W8_OID) means our LDAP server is Windows Server =
2012
or better

Signed-off-by: Bjoern Jacke <bjacke@samba.org>
---
 source4/setup/provision_rootdse_add.ldif | 1 +
 1 file changed, 1 insertion(+)

diff --git a/source4/setup/provision_rootdse_add.ldif b/source4/setup/provi=
sion_rootdse_add.ldif
index dd22e5867a9c..9902037a65ef 100644
--- a/source4/setup/provision_rootdse_add.ldif
+++ b/source4/setup/provision_rootdse_add.ldif
@@ -27,3 +27,4 @@ supportedCapabilities: 1.2.840.113556.1.4.1670
 supportedCapabilities: 1.2.840.113556.1.4.1791
 supportedCapabilities: 1.2.840.113556.1.4.1935
 supportedCapabilities: 1.2.840.113556.1.4.2080
+supportedCapabilities: 1.2.840.113556.1.4.2237
--=20
2.17.1


--sm4nu43k4a2Rpi4c--

--Bn2rw/3z4jIqBvZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXmJe0QAKCRAxQwafzsNC
P/yWAP9wGlMkAtx5lLCloT+N+TgtZD7BeUFwIyyAjlhjqZRA9QD+LycBRRj/1hij
1z69R0Lc/VeSRFdA6gHuvzmep6MyMAE=
=4yo/
-----END PGP SIGNATURE-----

--Bn2rw/3z4jIqBvZU--

