Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3071B1C59
	for <lists+samba-technical@lfdr.de>; Tue, 21 Apr 2020 05:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=PB4D2YZUXg6bRWALe1gIDQEGUUUlWY4mOm1By1qVI3U=; b=2GsttCvlQnz9RW9kuCGCQUg+k1
	7I+cziizxXwmcvfBTDKIfka/uE9LLLtb+Asmbf/x2k4qOj+Yga8fEkmbp/R4+tiZnwjtUsMcY9hVK
	rO4BynB4QEWPl0t8FoIfunYWl0c72qjMklDFdBGqqZ54u7zwDOtxZev+zI19MjoiLGvBt5ZgWLdgX
	qjKlBRiGnHmP5I6T8fAzWdbUBSV9Bs+XAZDsGx6D9PIsXPXcSPNh6XW2/BSxMnbH0bCrqRlbjQRdP
	vSdaAOIQKlGFLwUfKEsncO4Z6N8Dgiml9sAoWo7NRtTq2SuM+YXVvKmysCFqttGYGCVJRD7jXLKll
	AOWRyChA==;
Received: from localhost ([::1]:57840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jQjA5-001Kl2-5p; Tue, 21 Apr 2020 03:01:25 +0000
Received: from mx.cjr.nz ([51.158.111.142]:14898) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQj9s-001KkO-Ri
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 03:01:17 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id E9A64804DB;
 Tue, 21 Apr 2020 02:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1587437097;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PB4D2YZUXg6bRWALe1gIDQEGUUUlWY4mOm1By1qVI3U=;
 b=sCW72eAj9X+vgmhOfwqOkWMNl1zQ64GHHX9+jq1uPp8aCi91zFN77mMIeM+0Mn5CPnHFbR
 6WNZIK0hdjF+ApjewlxxYgtq+Drgrca0O+HpM8XYpMfmJfprKlGHS8/CuvruyDfb627l3Y
 jHb5Dimpjt4MGVYvZqIyIf+BdNV83JVb5o9OY9iLo8+ogGyPSPZSQ5sMGKwMXsSnek+2k/
 /Uxhtra7lWfqe7Mfm4nQo0XAGSX+ea3U+cHWfTTILCxwHoLcYIT6O1C3YhoB5yF8Yl3+L/
 +bz0501ZpzqDb3yBdpYLLLEURl2ClaSADenMkc4f+xcvMrIEjXxV7SxmxT2wGA==
To: linux-cifs@vger.kernel.org, smfrench@gmail.com,
 samba-technical@lists.samba.org
Subject: [PATCH 2/3] cifs: ensure correct super block for DFS reconnect
Date: Mon, 20 Apr 2020 23:44:23 -0300
Message-Id: <20200421024424.3112-2-pc@cjr.nz>
In-Reply-To: <20200421024424.3112-1-pc@cjr.nz>
References: <20200421024424.3112-1-pc@cjr.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: Paulo Alcantara <pc@cjr.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We could not rely on TCP server pointer to determine which super block
to update the prefix path when reconnecting tcons since it might map
to different tcons that share same TCP connection.

Instead, walk through all cifs super blocks and compare their DFS full
paths with the tcon being updated to.

Signed-off-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
---
 fs/cifs/misc.c | 71 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/fs/cifs/misc.c b/fs/cifs/misc.c
index a456febd4109..2d111b5a670c 100644
--- a/fs/cifs/misc.c
+++ b/fs/cifs/misc.c
@@ -1025,51 +1025,88 @@ int copy_path_name(char *dst, const char *src)
 }
 
 struct super_cb_data {
-	struct TCP_Server_Info *server;
+	void *data;
 	struct super_block *sb;
 };
 
-static void super_cb(struct super_block *sb, void *arg)
+static void tcp_super_cb(struct super_block *sb, void *arg)
 {
-	struct super_cb_data *d = arg;
+	struct super_cb_data *sd = arg;
+	struct TCP_Server_Info *server = sd->data;
 	struct cifs_sb_info *cifs_sb;
 	struct cifs_tcon *tcon;
 
-	if (d->sb)
+	if (sd->sb)
 		return;
 
 	cifs_sb = CIFS_SB(sb);
 	tcon = cifs_sb_master_tcon(cifs_sb);
-	if (tcon->ses->server == d->server)
-		d->sb = sb;
+	if (tcon->ses->server == server)
+		sd->sb = sb;
 }
 
-struct super_block *cifs_get_tcp_super(struct TCP_Server_Info *server)
+static struct super_block *__cifs_get_super(void (*f)(struct super_block *, void *),
+					    void *data)
 {
-	struct super_cb_data d = {
-		.server = server,
+	struct super_cb_data sd = {
+		.data = data,
 		.sb = NULL,
 	};
 
-	iterate_supers_type(&cifs_fs_type, super_cb, &d);
+	iterate_supers_type(&cifs_fs_type, f, &sd);
 
-	if (unlikely(!d.sb))
-		return ERR_PTR(-ENOENT);
+	if (!sd.sb)
+		return ERR_PTR(-EINVAL);
 	/*
 	 * Grab an active reference in order to prevent automounts (DFS links)
 	 * of expiring and then freeing up our cifs superblock pointer while
 	 * we're doing failover.
 	 */
-	cifs_sb_active(d.sb);
-	return d.sb;
+	cifs_sb_active(sd.sb);
+	return sd.sb;
 }
 
-void cifs_put_tcp_super(struct super_block *sb)
+static void __cifs_put_super(struct super_block *sb)
 {
 	if (!IS_ERR_OR_NULL(sb))
 		cifs_sb_deactive(sb);
 }
 
+struct super_block *cifs_get_tcp_super(struct TCP_Server_Info *server)
+{
+	return __cifs_get_super(tcp_super_cb, server);
+}
+
+void cifs_put_tcp_super(struct super_block *sb)
+{
+	__cifs_put_super(sb);
+}
+
+static void tcon_super_cb(struct super_block *sb, void *arg)
+{
+	struct super_cb_data *sd = arg;
+	struct cifs_tcon *tcon = sd->data;
+	struct cifs_sb_info *cifs_sb;
+
+	if (sd->sb)
+		return;
+
+	cifs_sb = CIFS_SB(sb);
+	if (tcon->dfs_path && cifs_sb->origin_fullpath &&
+	    !strcasecmp(tcon->dfs_path, cifs_sb->origin_fullpath))
+		sd->sb = sb;
+}
+
+static inline struct super_block *cifs_get_tcon_super(struct cifs_tcon *tcon)
+{
+	return __cifs_get_super(tcon_super_cb, tcon);
+}
+
+static inline void cifs_put_tcon_super(struct super_block *sb)
+{
+	__cifs_put_super(sb);
+}
+
 int update_super_prepath(struct cifs_tcon *tcon, const char *prefix,
 			 size_t prefix_len)
 {
@@ -1077,7 +1114,7 @@ int update_super_prepath(struct cifs_tcon *tcon, const char *prefix,
 	struct cifs_sb_info *cifs_sb;
 	int rc = 0;
 
-	sb = cifs_get_tcp_super(tcon->ses->server);
+	sb = cifs_get_tcon_super(tcon);
 	if (IS_ERR(sb))
 		return PTR_ERR(sb);
 
@@ -1099,6 +1136,6 @@ int update_super_prepath(struct cifs_tcon *tcon, const char *prefix,
 	cifs_sb->mnt_cifs_flags |= CIFS_MOUNT_USE_PREFIX_PATH;
 
 out:
-	cifs_put_tcp_super(sb);
+	cifs_put_tcon_super(sb);
 	return rc;
 }
-- 
2.26.0


