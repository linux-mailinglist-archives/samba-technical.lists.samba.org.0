Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 622E817C027
	for <lists+samba-technical@lfdr.de>; Fri,  6 Mar 2020 15:24:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=7el5CN39DSxgZttLRubAo0YIB1sD5SLyn9E56WCh/MA=; b=wl6WXsnZ74kL4BA/8ZazV180bY
	ew/bax4QhUuBwnJ5ZZn2Dud6N8NmiwHbtseppiSQ02AUR8yxbjvkCK3kz7bB6TNZv91z5aNXO1CHq
	vls8b+QDmvZEPE6PdWhtCUSbQQooRAYkMevkcYTLwvx2hcXmOikO50mBiXg6Fv/8cKE2UWtkqc2U5
	1Z4b9R8CZyhxD+BbIXGtxBJTC2ZoLRSHFKaAlnAHU3poA1+jr8MMjfQEXt2sFZHHXeZP8H2gWDO2E
	x/OFuK3pNImGTvaf8NfKoKUkCj9YmNsDemO3MDzmF2ajL3mZdCKGn6mClvpnkiCabg5mKzmDd+xBt
	X0Ucutgw==;
Received: from localhost ([::1]:28658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jADtu-00FIqV-OT; Fri, 06 Mar 2020 14:24:30 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:39501) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jADtp-00FIqO-84
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 14:24:27 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1jADto-0006J6-Q4; Fri, 06 Mar 2020 15:24:24 +0100
Received: by intern.sernet.de
 id 1jADto-000658-Lr; Fri, 06 Mar 2020 15:24:24 +0100
Received: from bjacke by pell.sernet.de with local (Exim 4.90_1)
 (envelope-from <bjacke@sernet.de>) id 1jADto-0005YW-HO
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 15:24:24 +0100
Date: Fri, 6 Mar 2020 15:24:24 +0100
To: samba-technical@lists.samba.org
Subject: add supportedLDAPPolicies to rootdse
Message-ID: <20200306142424.GA21238@sernet.de>
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

review and push appreciated ...

Bj=F6rn

--Nq2Wo0NMKNjxTN9z
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0001-ad-provision-add-supportedLDAPPolicies-to-rootdse.patch"
Content-Transfer-Encoding: quoted-printable

=46rom cd31b9d4750de17f9d6e95ea0214d4e2caa5759f Mon Sep 17 00:00:00 2001
=46rom: =3D?UTF-8?q?Bj=3DC3=3DB6rn=3D20Jacke?=3D <bjacke@samba.org>
Date: Fri, 6 Mar 2020 15:18:44 +0100
Subject: [PATCH] ad/provision: add supportedLDAPPolicies to rootdse

Signed-off-by: Bjoern Jacke <bjacke@samba.org>
---
 source4/setup/provision_rootdse_add.ldif | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/source4/setup/provision_rootdse_add.ldif b/source4/setup/provi=
sion_rootdse_add.ldif
index 70390d292170..dd22e5867a9c 100644
--- a/source4/setup/provision_rootdse_add.ldif
+++ b/source4/setup/provision_rootdse_add.ldif
@@ -6,18 +6,18 @@ defaultNamingContext: ${DOMAINDN}
 rootDomainNamingContext: ${ROOTDN}
 configurationNamingContext: ${CONFIGDN}
 schemaNamingContext: ${SCHEMADN}
-#supportedLDAPPolicies: MaxPoolThreads
-#supportedLDAPPolicies: MaxDatagramRecv
-#supportedLDAPPolicies: MaxReceiveBuffer
-#supportedLDAPPolicies: InitRecvTimeout
-#supportedLDAPPolicies: MaxConnections
-#supportedLDAPPolicies: MaxConnIdleTime
-#supportedLDAPPolicies: MaxPageSize
-#supportedLDAPPolicies: MaxQueryDuration
-#supportedLDAPPolicies: MaxTempTableSize
-#supportedLDAPPolicies: MaxResultSetSize
-#supportedLDAPPolicies: MaxNotificationPerConn
-#supportedLDAPPolicies: MaxValRange
+supportedLDAPPolicies: MaxPoolThreads
+supportedLDAPPolicies: MaxDatagramRecv
+supportedLDAPPolicies: MaxReceiveBuffer
+supportedLDAPPolicies: InitRecvTimeout
+supportedLDAPPolicies: MaxConnections
+supportedLDAPPolicies: MaxConnIdleTime
+supportedLDAPPolicies: MaxPageSize
+supportedLDAPPolicies: MaxQueryDuration
+supportedLDAPPolicies: MaxTempTableSize
+supportedLDAPPolicies: MaxResultSetSize
+supportedLDAPPolicies: MaxNotificationPerConn
+supportedLDAPPolicies: MaxValRange
 supportedLDAPVersion: 2
 supportedLDAPVersion: 3
 isSynchronized: FALSE
--=20
2.17.1


--Nq2Wo0NMKNjxTN9z--

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRTh3WYB8ykhrzLAI8xQwafzsNCPwUCXmJdFQAKCRAxQwafzsNC
P5omAQDpfkINE5jT2e4d7DnlOGz8JWydQT6Rodb6movYTXdm1wD+JKnb2ndKxNPB
1F8h5UR0V84Go0pv4pGVk8TtiOfMkwk=
=nDxX
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--

