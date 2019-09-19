Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E96FDB7467
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 09:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=W/5ZVsW5hW8NrpmqLyQd/LZ4AP+ZdudsFG16iQrHvw4=; b=SxnRQcJU9YFUbftcX4CgtYPKkF
	gTcYfA4pWTw+AEzs0UII30bWPlevDqlvfM3DvyFeRygXQz+Qytn4/XbbQBalfYJg8APIvKm3w1jj2
	Bxei0qaHg8R7UzWkrumsW2ewWsj+r/eSQTla9pij74b+rqoTFOJyzuwXBlNcctme8EmkknP1tGkfQ
	gEMc0MgEUvQd2uPjKJvG2MVsrBMTaK0D/pTmQq6QvI1LOa0wtKbjEBtrjEL5siXoYG5qJS4QlKwi7
	WSL3zPzkDHdEviFGJc0RzVrrawMgU6DbSkGH74XKe3XJVgfYWbl9ywi0kCoCBecfotvUZYI0sCClw
	TMKFUfDg==;
Received: from localhost ([::1]:63670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iArAn-006o9F-VN; Thu, 19 Sep 2019 07:48:18 +0000
Received: from rs07.intra2net.com ([85.214.138.66]:32842) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iArAj-006o98-2p
 for samba-technical@lists.samba.org; Thu, 19 Sep 2019 07:48:15 +0000
Received: from mail.m.i2n (unknown [172.17.128.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by rs07.intra2net.com (Postfix) with ESMTPS id A6A84150015B
 for <samba-technical@lists.samba.org>; Thu, 19 Sep 2019 09:48:07 +0200 (CEST)
Received: from localhost (mail.m.i2n [127.0.0.1])
 by localhost (Postfix) with ESMTP id 67E8477A
 for <samba-technical@lists.samba.org>; Thu, 19 Sep 2019 09:48:07 +0200 (CEST)
Received: from drift.m.i2n (drift.m.i2n [172.16.1.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: smtp-auth-user)
 by mail.m.i2n (Postfix) with ESMTPSA id 9598A2E6;
 Thu, 19 Sep 2019 09:48:05 +0200 (CEST)
Date: Thu, 19 Sep 2019 09:48:04 +0200
To: samba-technical@lists.samba.org
Subject: [PATCH] fix --disable-python
Message-ID: <20190919074804.GA23412@drift.m.i2n>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7iMSBzlTiPOCCT2k"
Content-Disposition: inline
X-Sent-From-My: toaster
User-Agent: Mutt/1.11.2 (2019-01-07)
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
From: Philipp Gesang via samba-technical <samba-technical@lists.samba.org>
Reply-To: Philipp Gesang <philipp.gesang@intra2net.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--7iMSBzlTiPOCCT2k
Content-Type: multipart/mixed; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline


--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey,

while packaging 4.11 I noticed that the samba-gpupdate script
would end up being installed despite --disable-python. Attached
is a patch that fixes this.

FWIW the CI run:
https://gitlab.com/samba-team/devel/samba/pipelines/83109693

Thank you,
Philipp

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-s4-scripting-make-samba-gpupdate-heed-disable-python.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 6d338d516077a34fd39321a830f1f7eab89caec1 Mon Sep 17 00:00:00 2001
=46rom: Philipp Gesang <philipp.gesang@intra2net.com>
Date: Thu, 19 Sep 2019 09:03:45 +0200
Subject: [PATCH] s4:scripting: make samba-gpupdate heed --disable-python

Signed-off-by: Philipp Gesang <philipp.gesang@intra2net.com>
---
 source4/scripting/wscript_build | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/source4/scripting/wscript_build b/source4/scripting/wscript_bu=
ild
index 31c395d3e4b..c5883f1fc8c 100644
--- a/source4/scripting/wscript_build
+++ b/source4/scripting/wscript_build
@@ -5,8 +5,9 @@ from samba_utils import MODE_755
 sbin_files =3D ''
 if bld.CONFIG_SET('AD_DC_BUILD_IS_ENABLED'):
     sbin_files =3D 'bin/samba_downgrade_db bin/samba_dnsupdate bin/samba_s=
pnupdate bin/samba_upgradedns bin/samba_kcc '
-sbin_files +=3D 'bin/samba-gpupdate'
-man_files =3D 'man/samba-gpupdate.8'
+if not bld.env.disable_python:
+    sbin_files +=3D 'bin/samba-gpupdate'
+    man_files =3D 'man/samba-gpupdate.8'
=20
 if sbin_files:
     bld.INSTALL_FILES('${SBINDIR}',
--=20
2.21.0


--FCuugMFkClbJLl1L--

--7iMSBzlTiPOCCT2k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEc8fuSIDXOZ07wD2Q8S2brBeKCUwFAl2DMrEACgkQ8S2brBeK
CUw3Jg//eUv4LVaHJw4N/pEXxRjbuu+533w4OtWhuBcOOZ8BaOY0QaO0XxXfpf94
sR02GDYIjYfTyM+nK1y19rkFSDnvm3Ys8a3TjrAtsgtSAsumfIiIZzAEXuA9Zu2l
xJLmvlKTr++PvYeNg2BL8A56KbA7TPaOe6VYqgmgXPI1S0vMw1BeC7BN/7I8hr59
nhxYp6LihKpfpbtmadhWpzZ1WS8vLgkYaNpNj/k8IgwYulOXBCjLGv4cCA5jX7p3
cdbj6g3YMY0/NhK8ZjHQrYLLVvwnN49IYomcERpWLXJPwHMWpzd62wWmo3amNYSX
UK0WcU/jaFOgK3nSqAzSXEQcAEH/Bz/7LHJM/05RvzwYig4ALH+AJ5bsE6C44E3A
DCGq4NzLJ5JYFwxVvpMIJEbEJXLh8W0eFB7IDhofZEPhi22PE4rxlhN9RQvrfNQ+
EOfJzVX4RzoMgdGao9J8wQH0mLU/f68PYlhoEBqaI1rCC/7BZq+j8ERB6RFMglaL
sLIdUA04Tn6zmx78CD4FeErGVOMBES6BAsi9ld2u0NskS2jbFoHh6p8weUgcIqUU
UC0mbcLfuyabXNsyD7xJiAS4YajOlSczXc0ZfCfujjTXqgRYrl8oMLkwZJRvsLG5
vSyp7PwI6f2oASS3U/ufEjiVGl81pdfhxhl8sa6ToaKiMNUFok0=
=WJaI
-----END PGP SIGNATURE-----

--7iMSBzlTiPOCCT2k--

