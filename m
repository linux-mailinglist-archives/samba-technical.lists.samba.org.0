Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9307D5B3E72
	for <lists+samba-technical@lfdr.de>; Fri,  9 Sep 2022 20:01:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=SGjvm/44/GvQtSmmvYBmmiqcH5Xq4zYyN98NpraAGn4=; b=HS3Ym3FvnUM/2I9v6R1kIqVaSn
	TA2bI3znEoCIRjqJi9kyihuEgnjGo4zRgGepUC31zbH/hPh7JZUVjbMu4xuZezKGufFACFqKyBHyD
	YdnXSngDzELaJyfSpmHfy95tL5XNlVNTb/LnbSS3kgXFzsKYw/Wx/DtXdjTecyDrh1XgBzKnQOc75
	xRP8hH7vuFdwJD60fUH+bl7mVxCIlAwtIpWbvNCZcuKJtv+nlOtbwiBkGhN4yDsd+m+E1l+M7bxcJ
	TIi+lpSGiiqvkHmwwGOrq1JciByb07ZcliLadPfDB17Z4K6pJYjxwAN1r3QqG8EvRnO0nNce9+dD4
	PrIckYMA==;
Received: from ip6-localhost ([::1]:31828 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWiIn-000F03-9M; Fri, 09 Sep 2022 18:00:29 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:34653) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWiIg-000Ezq-AC
 for samba-technical@lists.samba.org; Fri, 09 Sep 2022 18:00:26 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 3C785408E9
 for <samba-technical@lists.samba.org>; Fri,  9 Sep 2022 21:00:20 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 11EAC12D;
 Fri,  9 Sep 2022 21:00:20 +0300 (MSK)
Received: (nullmailer pid 1890267 invoked by uid 1000);
 Fri, 09 Sep 2022 18:00:18 -0000
To: samba-technical@lists.samba.org
Subject: various spelling fixes (round2)
Date: Fri,  9 Sep 2022 21:00:07 +0300
Message-Id: <20220909180007.1890214-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This includes mostly the code parts, not comments -
there are lots of mistakes in comments too. These
are mostly user-visible stuff (incl. the manpage fix).

The first hunk should probably be dropped (I just
remember fixing this already).

Do whatever you want with this. Remembering previous
attempts to fix something in samba I don't have much
hope for this one either.  Just in cass it is useful:

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>

diff --git a/bootstrap/config.py b/bootstrap/config.py
index a00b253ae77..84330a2106a 100644
--- a/bootstrap/config.py
+++ b/bootstrap/config.py
@@ -127,5 +127,5 @@ PKGS = [
     ('pkg-config', 'pkgconfig'),
     ('procps', 'procps-ng'),  # required for the free cmd in tests
-    ('lsb-release', 'lsb-release'),  # we need lsb_relase to show info
+    ('lsb-release', 'lsb-release'),  # we need lsb_release to show info
     ('', 'rpcgen'),  # required for test
     # refer: https://fedoraproject.org/wiki/Changes/SunRPCRemoval
diff --git a/ctdb/common/system.c b/ctdb/common/system.c
index 08dc68284fd..05a95647233 100644
--- a/ctdb/common/system.c
+++ b/ctdb/common/system.c
@@ -158,5 +158,5 @@ bool ctdb_sys_check_iface_exists(const char *iface)
 	ifnis = if_nameindex();
 	if (ifnis == NULL) {
-		DBG_ERR("Failed to retrieve inteface list\n");
+		DBG_ERR("Failed to retrieve interface list\n");
 		return false;
 	}
diff --git a/source3/smbd/msdfs.c b/source3/smbd/msdfs.c
index 4819df35837..c30326234ae 100644
--- a/source3/smbd/msdfs.c
+++ b/source3/smbd/msdfs.c
@@ -950,5 +950,5 @@ static NTSTATUS dfs_path_lookup(TALLOC_CTX *ctx,
 		removed_components--;
 		if (p == NULL && removed_components != 0) {
-			DBG_ERR("Component missmatch. path = %s, "
+			DBG_ERR("Component mismatch. path = %s, "
 				"%zu components left\n",
 				canon_dfspath,
diff --git a/source3/smbd/smbXsrv_client.c b/source3/smbd/smbXsrv_client.c
index d7a6fa35bf0..14d00f4aca1 100644
--- a/source3/smbd/smbXsrv_client.c
+++ b/source3/smbd/smbXsrv_client.c
@@ -1243,5 +1243,5 @@ static void smbXsrv_client_connection_drop_loop(struct tevent_req *subreq)
 		struct GUID_txt_buf buf1, buf2;
 
-		DBG_WARNING("client's client_guid [%s] != droped guid [%s]\n",
+		DBG_WARNING("client's client_guid [%s] != dropped guid [%s]\n",
 			    GUID_buf_string(&client->global->client_guid,
 					    &buf1),
@@ -1258,5 +1258,5 @@ static void smbXsrv_client_connection_drop_loop(struct tevent_req *subreq)
 	{
 		DBG_WARNING("client's initial connect time [%s] (%llu) != "
-			"droped initial connect time [%s] (%llu)\n",
+			"dropped initial connect time [%s] (%llu)\n",
 			nt_time_string(talloc_tos(),
 				       client->global->initial_connect_time),
diff --git a/source3/winbindd/wb_sids2xids.c b/source3/winbindd/wb_sids2xids.c
index 179a51f81e4..9a3507ba702 100644
--- a/source3/winbindd/wb_sids2xids.c
+++ b/source3/winbindd/wb_sids2xids.c
@@ -234,5 +234,5 @@ static void wb_sids2xids_idmap_setup_done(struct tevent_req *subreq)
 		sid_copy(&domain_sid, &state->sids[i]);
 		sid_split_rid(&domain_sid, &rid);
-		D_DEBUG("%"PRIu32": Splitted SID %s into domain SID %s and RID %"PRIu32"\n",
+		D_DEBUG("%"PRIu32": Split SID %s into domain SID %s and RID %"PRIu32"\n",
 			i,
 			dom_sid_str_buf(&state->sids[i], &buf0),
diff --git a/source4/torture/smb2/ea.c b/source4/torture/smb2/ea.c
index becacaed77e..2467610f688 100644
--- a/source4/torture/smb2/ea.c
+++ b/source4/torture/smb2/ea.c
@@ -92,5 +92,5 @@ static bool torture_smb2_acl_xattr(struct torture_context *tctx,
 	status = smb2_setinfo_file(tree, &sfinfo);
 	torture_assert_ntstatus_ok_goto(tctx, status, ret, done,
-					"Setting EA should faild\n");
+					"Setting EA should fail\n");
 
 	/*
diff --git a/source4/torture/smb2/session.c b/source4/torture/smb2/session.c
index 92f9e638ff4..fe2beafbe9b 100644
--- a/source4/torture/smb2/session.c
+++ b/source4/torture/smb2/session.c
@@ -2755,5 +2755,5 @@ static bool test_session_bind_negative_smb210s(struct torture_context *tctx, str
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -2786,5 +2786,5 @@ static bool test_session_bind_negative_smb210d(struct torture_context *tctx, str
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -2818,5 +2818,5 @@ static bool test_session_bind_negative_smb2to3s(struct torture_context *tctx, st
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -2863,5 +2863,5 @@ static bool test_session_bind_negative_smb2to3d(struct torture_context *tctx, st
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -2909,5 +2909,5 @@ static bool test_session_bind_negative_smb3to2s(struct torture_context *tctx, st
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -2960,5 +2960,5 @@ static bool test_session_bind_negative_smb3to2d(struct torture_context *tctx, st
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -4549,5 +4549,5 @@ static bool test_session_bind_negative_smb3signH2XtoGs(struct torture_context *t
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -4609,5 +4609,5 @@ static bool test_session_bind_negative_smb3signH2XtoGd(struct torture_context *t
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -4789,5 +4789,5 @@ static bool test_session_bind_negative_smb3signGtoH2Xs(struct torture_context *t
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -4855,5 +4855,5 @@ static bool test_session_bind_negative_smb3signGtoH2Xd(struct torture_context *t
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test SMB 2.10 if encrytion is required");
+			     "Can't test SMB 2.10 if encryption is required");
 	}
 
@@ -5067,5 +5067,5 @@ static bool test_session_signing_hmac_sha_256(struct torture_context *tctx, stru
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test signing only if encrytion is required");
+			     "Can't test signing only if encryption is required");
 	}
 
@@ -5111,5 +5111,5 @@ static bool test_session_signing_aes_128_cmac(struct torture_context *tctx, stru
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test signing only if encrytion is required");
+			     "Can't test signing only if encryption is required");
 	}
 
@@ -5155,5 +5155,5 @@ static bool test_session_signing_aes_128_gmac(struct torture_context *tctx, stru
 	if (encrypted) {
 		torture_skip(tctx,
-			     "Can't test signing only if encrytion is required");
+			     "Can't test signing only if encryption is required");
 	}
 
diff --git a/docs-xml/manpages/vfs_fruit.8.xml b/docs-xml/manpages/vfs_fruit.8.xml
index 4caf308a612..6950898a7d1 100644
--- a/docs-xml/manpages/vfs_fruit.8.xml
+++ b/docs-xml/manpages/vfs_fruit.8.xml
@@ -399,7 +399,7 @@
 	      on-disk file identifier to have the semantics of HFS+ Catalog Node
 	      Identifier (CNID). Samba provides File-IDs based on a file's inode
 	      number which gets recycled across file creation and deletion and
-	      can therefor not be used for Mac client. Returning a file identifier of
+	      can therefore not be used for Mac client. Returning a file identifier of
 	      zero causes the Mac client to stop using and trusting the file id
 	      returned from the server.</para>
 	      <para>The default is <emphasis>yes</emphasis>.</para>

