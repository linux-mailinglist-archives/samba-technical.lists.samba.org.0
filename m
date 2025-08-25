Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 733A8B34C7E
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:47:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=W7BCf1FH5/ehSVjUInzEVRfJSINq0jXrwiFZs1mDCY4=; b=Ufro0Ryq2xPAgGm5OZoWi2ybw/
	iFUl/JxPz7FcE2W0FSnKaakMZmEYFB99SZWEDMmGF+JmHWfo6kUXneKLj1ekUiESB4bJH7q9Bya3I
	xPKrTYTXgLzFonAe0+wXMC8vpYCYp2pE+XTM0D117LCDN+Ok0biA6g+wWAfne78MX17D+wLbBQY+P
	L0DXBkgfeJ9oikrDEK4laWBc61gXQnBePt5RE0ZeOwxG2ijMYidsPrI8tfkPSxn5xHdzW2Q2rvISH
	cpLNIHWppQ7RItoNuM3qS+a0lSGw+HvSlblF0GrH/0+x7O7fyVDUkzKBFBd2HDW5Zo0qCpvxq2wus
	vBBQCFZw==;
Received: from ip6-localhost ([::1]:23516 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe67-000NAs-6q; Mon, 25 Aug 2025 20:47:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58374) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe4u-000Mko-NJ
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:46:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=W7BCf1FH5/ehSVjUInzEVRfJSINq0jXrwiFZs1mDCY4=; b=YhEHs0OElTCI3o0LYDsfm4qi2p
 2AuQsFiCDTKYlLPy3i48QEyWz9l6gHstB/kL36lNxXHED1M6dFOs2NN3EzRvcCK0koTuEEW0VllWT
 yZdICnyAVkO+IrZT0eVtsQ8tDdb2visTmQ5SvkUFEhC6pl/hnIGdyJdUKDlD+d/NoiW9cLofFA/HU
 1xKYSTrr62jxtjRWJT19NY88/EonmwbXztCe6DYPlSQ5R3WTNIb/KpK8BBjNOWhgLivuhLLqw0q0u
 BAnLARddoYhEwas6Bf8q0y+0btETsSCRDsuzAQsDQqkqMn0SqAu8YvlYdPLRAriOkNV/vRp9Y5gg/
 KOySPoq5l5IjBjZe9a3rnDENW96LBv/Jjac/T0sW1W48Qbxunh91Qjkm+IP+FMvwHFOaWft52vWQ9
 XfAodKof7BMfODYodTLTLCc5LMt5bJXuBpczFo2pCy2HilP7xB5h7jYiMcGMXrDpYi0C1hB9dN+LX
 lb/TLIZ6eYxU/P+Jk6yucp1f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe4p-000k00-0t; Mon, 25 Aug 2025 20:46:04 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 025/142] smb: client: make use of
 smbdirect_socket.disconnect_work
Date: Mon, 25 Aug 2025 22:39:46 +0200
Message-ID: <8fefc9e5e71a4a4626e7a6d8b2db512312fd334f.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 12 +++++++-----
 fs/smb/client/smbdirect.h |  1 -
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index ded912e904f0..58db3e7d4de3 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -157,9 +157,8 @@ do {									\
 
 static void smbd_disconnect_rdma_work(struct work_struct *work)
 {
-	struct smbd_connection *info =
-		container_of(work, struct smbd_connection, disconnect_work);
-	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, disconnect_work);
 
 	switch (sc->status) {
 	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
@@ -196,7 +195,9 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 
 static void smbd_disconnect_rdma_connection(struct smbd_connection *info)
 {
-	queue_work(info->workqueue, &info->disconnect_work);
+	struct smbdirect_socket *sc = &info->socket;
+
+	queue_work(info->workqueue, &sc->disconnect_work);
 }
 
 /* Upcall from RDMA CM */
@@ -1655,6 +1656,8 @@ static struct smbd_connection *_smbd_get_connection(
 	info->initiator_depth = 1;
 	info->responder_resources = SMBD_CM_RESPONDER_RESOURCES;
 
+	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
+
 	rc = smbd_ia_open(info, dstaddr, port);
 	if (rc) {
 		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
@@ -1800,7 +1803,6 @@ static struct smbd_connection *_smbd_get_connection(
 
 	init_waitqueue_head(&info->wait_post_send);
 
-	INIT_WORK(&info->disconnect_work, smbd_disconnect_rdma_work);
 	INIT_WORK(&info->post_send_credits_work, smbd_post_send_credits);
 	info->new_credits_offered = 0;
 	spin_lock_init(&info->lock_new_credits_offered);
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index f250241d2d24..1c63188664df 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -45,7 +45,6 @@ enum keep_alive_status {
 struct smbd_connection {
 	struct smbdirect_socket socket;
 
-	struct work_struct disconnect_work;
 	struct work_struct post_send_credits_work;
 
 	spinlock_t lock_new_credits_offered;
-- 
2.43.0


