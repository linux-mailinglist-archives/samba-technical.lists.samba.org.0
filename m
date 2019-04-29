Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A26EC6E
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 00:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=SfIY0cGLOJ8t+qpnNIFMnqEXKx0xu5jxLEhdYYsme8A=; b=wf+5DjE/scUTTYTWCmEn1/niln
	iDR2r0iD+lIHLgHso40EFo6II//JpVsdWamu+IvCZyRMu52PvyLFqz8N+KS1Su4Y0RD1zsTh8Qw7v
	K4bwwEUpaPLD4SQTX2GikD+yUotvUod3NWivVCVDj/g4gl0aGQkpczUtfqqMIfVZHaU1Ek+MgAsQy
	U92aYfnM2dNZ9/6OSPniKKqqu7re1ypwvplW/WOdDDKTgAYnYnb6rwVGrn/z0GvfS+D7lYmfGmIhe
	3E/ju7+jobt34bMjWX9wBp4KNMN8sioz6kcGGmrsug+1hv3PqWv+w0WvDTDWR65cthSxiNBlxWqQe
	yyShrbfQ==;
Received: from localhost ([::1]:59578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLEP2-003lK5-2x; Mon, 29 Apr 2019 22:05:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:52848) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLEOy-003lJy-0R
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 22:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=EKSGHDQL9308qmWIil43vd7wW+7+reJmSBsdKPRB1d0=; b=cWuL6kn79X/uoF1qCeJ6qv8/Dz
 beXQwqkIuOA0b8vM2c4qCbio2QKOe/uCtbdIf4jAi4gSnV2WIMJeOxdnFr2AYXYILY3Vl+Vylh5os
 OQCmUBtsT9aj/CXICzzfTbuqMlmPAih3kDM7C7rQWofgDug2UUx90L+u4alClsV2uT/Q=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLEOx-0001J3-CW
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 22:05:31 +0000
Date: Mon, 29 Apr 2019 15:05:27 -0700
To: samba-technical@lists.samba.org
Subject: [PATCH] smbd: Move deadtime default to parameter definition and man
 page
Message-ID: <20190429220526.GA18192@samba.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=patch
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=46rom 0e61ae65dcb59e0ed0f83f5641db6f4163fee5f8 Mon Sep 17 00:00:00 2001
=46rom: Christof Schmitt <cs@samba.org>
Date: Mon, 29 Apr 2019 11:01:44 -0700
Subject: [PATCH] smbd: Move deadtime default to parameter definition and man
 page

The code has a default of one week (10080 minutes) if the parameter is
set to 0. Make this the public default of the parameter, instead of
hiding it in the code. This change also has the code match the
documentation that setting this parameter to 0 disables the check.

Signed-off-by: Christof Schmitt <cs@samba.org>
---
 docs-xml/smbdotconf/tuning/deadtime.xml | 2 +-
 source3/include/local.h                 | 1 -
 source3/param/loadparm.c                | 2 +-
 source3/smbd/conn_idle.c                | 2 +-
 4 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/docs-xml/smbdotconf/tuning/deadtime.xml b/docs-xml/smbdotconf/=
tuning/deadtime.xml
index 7c60b90d097..77e0e5f9324 100644
--- a/docs-xml/smbdotconf/tuning/deadtime.xml
+++ b/docs-xml/smbdotconf/tuning/deadtime.xml
@@ -22,6 +22,6 @@
 		should be performed.</para>
 </description>
=20
-<value type=3D"default">0</value>
+<value type=3D"default">10080</value>
 <value type=3D"example">15</value>
 </samba:parameter>
diff --git a/source3/include/local.h b/source3/include/local.h
index c2be1ff3b7f..62700aace3c 100644
--- a/source3/include/local.h
+++ b/source3/include/local.h
@@ -96,7 +96,6 @@
=20
 /* the following control timings of various actions. Don't change=20
    them unless you know what you are doing. These are all in seconds */
-#define DEFAULT_SMBD_TIMEOUT (60*60*24*7)
 #define SMBD_RELOAD_CHECK (180)
 #define IDLE_CLOSED_TIMEOUT (60)
 #define DPTR_IDLE_TIMEOUT (120)
diff --git a/source3/param/loadparm.c b/source3/param/loadparm.c
index 703460e4c47..5af1621fb9b 100644
--- a/source3/param/loadparm.c
+++ b/source3/param/loadparm.c
@@ -641,7 +641,7 @@ static void init_globals(struct loadparm_context *lp_ct=
x, bool reinit_globals)
 	Globals._disable_spoolss =3D false;
 	Globals.max_smbd_processes =3D 0;/* no limit specified */
 	Globals.username_level =3D 0;
-	Globals.deadtime =3D 0;
+	Globals.deadtime =3D 10080;
 	Globals.getwd_cache =3D true;
 	Globals.large_readwrite =3D true;
 	Globals.max_log_size =3D 5000;
diff --git a/source3/smbd/conn_idle.c b/source3/smbd/conn_idle.c
index 238b7bd7690..920d808862a 100644
--- a/source3/smbd/conn_idle.c
+++ b/source3/smbd/conn_idle.c
@@ -53,7 +53,7 @@ bool conn_idle_all(struct smbd_server_connection *sconn, =
time_t t)
 	conn_lastused_update(sconn, t);
=20
 	if (deadtime <=3D 0) {
-		deadtime =3D DEFAULT_SMBD_TIMEOUT;
+		return false;
 	}
=20
 	for (conn=3Dsconn->connections;conn;conn=3Dconn->next) {
--=20
2.17.0

