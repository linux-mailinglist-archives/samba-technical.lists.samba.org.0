Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B97D309886
	for <lists+samba-technical@lfdr.de>; Sat, 30 Jan 2021 22:44:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=Wzelok3Kz7iVjRiDHvWgR6YEpoSbBEqEl6TILK0jHek=; b=SGefHAQS2awl30J37NU5LRTZUV
	Sk8R4TRGHuCffE36GymEGXtnjAzJEg7cACmsyWEt8vZ/lO6V184qCSoxJMxQ1IbO20CSoR/aEH5pz
	Ds5/Fb+HdfASts/ak0OpEJyeoRtqhNLSG0+QO32JZRWxyglrLv5iS/Wt2NKGcSi8v/L/Kc+ZMf3wR
	Q2MAYsIMJofnk/pCWJYgaCo6L6AqjDq7evC2ZUgYuopQkuDIQPJIqsg3t0XqQjdGpBVVacdc6pTYl
	jQVNT33s+0dQa8IVLzMWy4iMLZKi0MB12DbE8/llGcixH2U+GmrpodfGo4L/JOtx+w92CS0JGboK8
	GQAji0KQ==;
Received: from ip6-localhost ([::1]:53864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l5y1Q-0080P6-7U; Sat, 30 Jan 2021 21:43:12 +0000
Received: from highcountry.snowyriver.sapphiresunday.org
 ([65.103.240.56]:41366 helo=prancingpony.middleearth.sapphiresunday.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l5y1J-0080Oz-L9
 for samba-technical@lists.samba.org; Sat, 30 Jan 2021 21:43:08 +0000
Received: from localhost (unknown [127.0.0.1])
 by prancingpony.middleearth.sapphiresunday.org (Postfix) with ESMTP id
 11C0B140E45
 for <samba-technical@lists.samba.org>; Sat, 30 Jan 2021 21:25:00 +0000 (UTC)
Received: from prancingpony.middleearth.sapphiresunday.org ([127.0.0.1])
 by localhost (prancingpony.middleearth.sapphiresunday.org [127.0.0.1])
 (amavisd-new, port 10024)
 with ESMTP id vKQ3xHCZvzeI for <samba-technical@lists.samba.org>;
 Sat, 30 Jan 2021 14:24:58 -0700 (MST)
Received: from Mithrandir.MiddleEarth.SapphireSunday.org (unknown
 [IPv6:2001:470:c062:1:663e:e441:a799:ff37])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by prancingpony.middleearth.sapphiresunday.org (Postfix) with ESMTPSA id
 362E2140E16
 for <samba-technical@lists.samba.org>; Sat, 30 Jan 2021 14:24:58 -0700 (MST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=middleearth.sapphiresunday.org; s=default; t=1612041898;
 x=1612646698; bh=Wzelok3Kz7iVjRiDHvWgR6YEpoSbBEqEl6TILK0jHek=;
 h=To:From:Subject:Message-ID:Date:User-Agent:MIME-Version:
 Content-Type;
 b=mVRxmfEubzivAfUyzqC1KqqyTvyGm0j1RXiBdQPI3Z4wdcTRoYwqrDsEV/mIEQUoj
 NDB/nLjJaG7tsQS5JnJKXSKRI/0B6Dk4SOdmjQyavDrpJ2ThnnUSD++qaKkXwNEz+b
 qbCn6Wdm0LrLjvSJhr1OamexhQfyh3CmvLyFzDkI=
To: samba-technical <samba-technical@lists.samba.org>
Subject: [PATCH] [virusfilter-vfs] update for talloc changes
Message-ID: <18d7764e-06c0-9d1a-999d-98396681a69c@middleearth.sapphiresunday.org>
Date: Sat, 30 Jan 2021 14:24:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------B7D986E618ACB51D0CDB87B7"
Content-Language: en-US
X-Warn: EHLO/HELO not verified: Remote host 65.103.240.56
 (highcountry.snowyriver.sapphiresunday.org) incorrectly presented itself as
 prancingpony.middleearth.sapphiresunday.org
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
From: "Trever L. Adams via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Trever L. Adams" <trever@middleearth.sapphiresunday.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------B7D986E618ACB51D0CDB87B7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I believe I saw a warning about this posted a bit back. Recent talloc
changes break this module. Attached is a patch that resolves the issue
for me.

Thank you.

Trever


--------------B7D986E618ACB51D0CDB87B7
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-virusfilter-vfs-update-for-talloc-changes.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-virusfilter-vfs-update-for-talloc-changes.patch"

From 6a6c123247cbeed2fd83ef0b61fcadbd07f2ed79 Mon Sep 17 00:00:00 2001
From: Trever L. Adams <trever.adams@gmail.com>
Date: Sat, 30 Jan 2021 14:17:03 -0700
Subject: [PATCH] [virusfilter-vfs] update for talloc changes

---
 source3/modules/vfs_virusfilter.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/source3/modules/vfs_virusfilter.c b/source3/modules/vfs_virusfilter.c
index dc3f040363d..d0255daccf9 100644
--- a/source3/modules/vfs_virusfilter.c
+++ b/source3/modules/vfs_virusfilter.c
@@ -268,7 +268,8 @@ static int virusfilter_vfs_connect(
 	infected_file_command = lp_parm_const_string(
 		snum, "virusfilter", "infected file command", NULL);
 	config->infected_file_command = talloc_strdup(config, infected_file_command);
-	if (config->infected_file_command == NULL) {
+	if (config->infected_file_command == NULL
+	    && infected_file_command != NULL) {
 		DBG_ERR("virusfilter-vfs: out of memory!\n");
 		return -1;
 	}
@@ -276,7 +277,8 @@ static int virusfilter_vfs_connect(
 	scan_error_command = lp_parm_const_string(
 		snum, "virusfilter", "scan error command", NULL);
 	config->scan_error_command = talloc_strdup(config, scan_error_command);
-	if (config->scan_error_command == NULL) {
+	if (config->scan_error_command == NULL
+	    && scan_error_command != NULL) {
 		DBG_ERR("virusfilter-vfs: out of memory!\n");
 		return -1;
 	}
@@ -291,7 +293,7 @@ static int virusfilter_vfs_connect(
 		snum, "virusfilter", "quarantine directory",
 		tmp ? tmp : "/tmp/.quarantine");
 	config->quarantine_dir = talloc_strdup(config, quarantine_dir);
-	if (config->quarantine_dir == NULL) {
+	if (config->quarantine_dir == NULL && quarantine_dir != NULL) {
 		DBG_ERR("virusfilter-vfs: out of memory!\n");
 		return -1;
 	}
@@ -312,7 +314,7 @@ static int virusfilter_vfs_connect(
 		snum, "virusfilter", "quarantine prefix",
 		VIRUSFILTER_DEFAULT_QUARANTINE_PREFIX);
 	config->quarantine_prefix = talloc_strdup(config, quarantine_prefix);
-	if (config->quarantine_prefix == NULL) {
+	if (config->quarantine_prefix == NULL && quarantine_prefix != NULL) {
 		DBG_ERR("virusfilter-vfs: out of memory!\n");
 		return -1;
 	}
@@ -321,7 +323,7 @@ static int virusfilter_vfs_connect(
 		snum, "virusfilter", "quarantine suffix",
 		VIRUSFILTER_DEFAULT_QUARANTINE_SUFFIX);
 	config->quarantine_suffix = talloc_strdup(config, quarantine_suffix);
-	if (config->quarantine_suffix == NULL) {
+	if (config->quarantine_suffix == NULL && quarantine_suffix != NULL) {
 		DBG_ERR("virusfilter-vfs: out of memory!\n");
 		return -1;
 	}
@@ -359,7 +361,7 @@ static int virusfilter_vfs_connect(
 		snum, "virusfilter", "rename prefix",
 		VIRUSFILTER_DEFAULT_RENAME_PREFIX);
 	config->rename_prefix = talloc_strdup(config, rename_prefix);
-	if (config->rename_prefix == NULL) {
+	if (config->rename_prefix == NULL && rename_prefix != NULL) {
 		DBG_ERR("virusfilter-vfs: out of memory!\n");
 		return -1;
 	}
@@ -368,7 +370,7 @@ static int virusfilter_vfs_connect(
 		snum, "virusfilter", "rename suffix",
 		VIRUSFILTER_DEFAULT_RENAME_SUFFIX);
 	config->rename_suffix = talloc_strdup(config, rename_suffix);
-	if (config->rename_suffix == NULL) {
+	if (config->rename_suffix == NULL && rename_suffix != NULL) {
 		DBG_ERR("virusfilter-vfs: out of memory!\n");
 		return -1;
 	}
@@ -411,7 +413,7 @@ static int virusfilter_vfs_connect(
 	socket_path = lp_parm_const_string(
 		snum, "virusfilter", "socket path", NULL);
 	config->socket_path = talloc_strdup(config, socket_path);
-	if (config->socket_path == NULL) {
+	if (config->socket_path == NULL && socket_path != NULL) {
 		DBG_ERR("virusfilter-vfs: out of memory!\n");
 		return -1;
 	}
-- 
2.29.2


--------------B7D986E618ACB51D0CDB87B7--

