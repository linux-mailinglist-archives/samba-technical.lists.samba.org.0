Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C07B921B45C
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jul 2020 13:58:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Tjm3/zlL+I+V1ZwnziLcsY1YznZ/1A+bxl+HrRXH8so=; b=VezjW/YrlpRZV5OXTCULeulOZ1
	ujJk0GSngqKOEme+mDTUxDZNPgmRfxAaNjL/g2aCdXLnYrbX6JWXUAKk03GKWDeP4K9DD8mgl4PjD
	xD1Ycra2poziq+yoKSQgaw5a7plkRGQN+fWKH1HW/TtPczDS1rgSK60/F4q3+DmYZIPUkrSl9xr8+
	J2FMJKNWhGLwUf2i2kHXcd6grOFDMXMrhObVknEWGEUvhkdSVprbgjXjNcJZXXx79SRQpbUyLoV0/
	PM117qObVCgjpcJMOabEwnofG5JwFuHvxv44Q+GEb+8Uw9xvMaI9ZA/1seJ4SQ+jpOX32mUx6doL+
	gSfJgHSQ==;
Received: from localhost ([::1]:30264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jtrfx-006dvQ-BO; Fri, 10 Jul 2020 11:58:45 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:42667) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jtrfr-006dvJ-CH
 for samba-technical@lists.samba.org; Fri, 10 Jul 2020 11:58:41 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 for samba-technical@lists.samba.org
 id 1jtrfq-000845-SY; Fri, 10 Jul 2020 13:58:38 +0200
Received: by intern.sernet.de
 id 1jtrfq-0000aq-PX; Fri, 10 Jul 2020 13:58:38 +0200
Received: from bjacke by pell.sernet.de with local (Exim 4.93)
 (envelope-from <bjacke@sernet.de>) id 1jtrfq-006f04-ND
 for samba-technical@lists.samba.org; Fri, 10 Jul 2020 13:58:38 +0200
Date: Fri, 10 Jul 2020 13:58:38 +0200
To: samba-technical@lists.samba.org
Subject: PATCH: fix compile error with xlc on AIX
Message-ID: <20200710115838.GA1587460@sernet.de>
Mail-Followup-To: samba-technical@lists.samba.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

please review and push eventually...

Thanks
Björn

--Nq2Wo0NMKNjxTN9z
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-libsmb-fix-build-with-xlc-on-AIX.patch"
Content-Transfer-Encoding: quoted-printable

=46rom cf0994c69bc89cc73009541bf087d264478501f4 Mon Sep 17 00:00:00 2001
=46rom: Bjoern Jacke <bj@sernet.de>
Date: Fri, 10 Jul 2020 11:48:51 +0000
Subject: [PATCH] libsmb: fix build with xlc on AIX

xlc complains:

1506-067 (S) A struct or union can only be assigned to a compatible type.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=3D14438

Signed-off-by: Bjoern Jacke <bjacke@samba.org>

---
 source3/libsmb/libsmb_stat.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/source3/libsmb/libsmb_stat.c b/source3/libsmb/libsmb_stat.c
index 790934bd565..8abc6043030 100644
--- a/source3/libsmb/libsmb_stat.c
+++ b/source3/libsmb/libsmb_stat.c
@@ -102,18 +102,24 @@ void setup_stat(struct stat *st,
 	}
=20
 	st->st_dev =3D dev;
-	st->st_atim =3D access_time_ts;
-	st->st_ctim =3D change_time_ts;
-	st->st_mtim =3D write_time_ts;
+	st->st_atim.tv_sec =3D access_time_ts.tv_sec;
+	st->st_atim.tv_nsec =3D access_time_ts.tv_nsec;
+	st->st_ctim.tv_sec =3D change_time_ts.tv_sec;
+	st->st_ctim.tv_nsec =3D change_time_ts.tv_nsec;
+	st->st_mtim.tv_sec =3D write_time_ts.tv_sec;
+	st->st_mtim.tv_nsec =3D write_time_ts.tv_nsec;
 }
=20
 void setup_stat_from_stat_ex(const struct stat_ex *stex,
 			     const char *fname,
 			     struct stat *st)
 {
-	st->st_atim =3D stex->st_ex_atime;
-	st->st_ctim =3D stex->st_ex_ctime;
-	st->st_mtim =3D stex->st_ex_mtime;
+	st->st_atim.tv_sec =3D stex->st_ex_atime.tv_sec;
+	st->st_atim.tv_nsec =3D stex->st_ex_atime.tv_nsec;
+	st->st_ctim.tv_sec =3D stex->st_ex_ctime.tv_sec;
+	st->st_ctim.tv_nsec =3D stex->st_ex_ctime.tv_nsec;
+	st->st_mtim.tv_sec =3D stex->st_ex_mtime.tv_sec;
+	st->st_mtim.tv_nsec =3D stex->st_ex_mtime.tv_nsec;
=20
 	st->st_mode =3D stex->st_ex_mode;
 	st->st_size =3D stex->st_ex_size;
--=20
2.20.2


--Nq2Wo0NMKNjxTN9z--

