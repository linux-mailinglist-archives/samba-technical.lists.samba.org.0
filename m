Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0464EB34DB0
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZvZ9nYGC0Z7vo2Ez/qv/mhp8FFPaQPquVU1UHY94L4c=; b=wv6CTVBtKQG4pkcNlZBfLNoPo8
	ay4VgDdpkHCC2LHS8Ytcyv8OVtvDb/gJ8mORFVjJD8hiXJSl+UC3lEKdYUmvc0/f80lSJva8q9iE+
	Z83YW/97eZsoJ1JquyZ9RtKo50Ves+fBB5FW64qXjl1r35YGeCNtK4JR4lDBmxPpQy7RGr9XfZUDm
	d7ZvGA8mrn3yHr6tXxXBhhE9CRZxpegtVAqgwEr9wYykSvPLiwuxf4JWv5MpoQYeiYs20+rCi2O3/
	oS/LOqii27frPvfq/POe75qazB7qrMoCixjOwd2UEkmU1i6g/oSbIG5Zc+rZIvqC3T5+0nr9BABwA
	OAc29Cfg==;
Received: from ip6-localhost ([::1]:28128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeRy-000WXm-KN; Mon, 25 Aug 2025 21:09:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35292) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeNP-000UQE-3V
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:05:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ZvZ9nYGC0Z7vo2Ez/qv/mhp8FFPaQPquVU1UHY94L4c=; b=O0hNVgu0sobCpeM0ShLVrAHHic
 x85D1nbTy+yGMIui+n/MuAnlMfs9YYiqwpP+LqhocwTWj8QX+nf4WFBDG6xxWeVJ2hHsb2y2ExEDd
 FfembwCvP6aWMYjvfVt4IUCfSdbh4bfNQGUUwft8a+0BTAqgbZjNXdMFVCGLtj6BZ1bvsnCB7dTlP
 8pgymlS6pVgBZCY4l3jn8tA/3/8/LSMsEdAhuc7aO+EuYzoS1TGGYYJ/Hzgr5tXcpsZA+MBmkVcRP
 8iuEDO0lye764uhRG1SjPQZXB7nkd+EvIoP9IwT33j+wT/y4WpvMb54bYLr4IfqLq2gVF+mzU8HNL
 YKDMzIF/69sAq95GLFWJwhYI1KZYgqT/80Vg2/WLM866IQMEr3sqXQ8FyJWsWdlPzYo58cbYASEqQ
 etWFJRP7L2ODj11Ja8LBjLCYnim4yhunLBzBaO/QDexjEiIl6Vsi1s1a3LTvJD1pQzXv3fGbzsHI3
 m2CdQAcQZFFC7xwHvhWFENEN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeNK-000ntB-1Z; Mon, 25 Aug 2025 21:05:10 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 140/142] smb: server: pass struct smbdirect_socket to
 smb_direct_post_send_data()
Date: Mon, 25 Aug 2025 22:41:41 +0200
Message-ID: <d7ee120110dbd9a2830808babdb2468299f0ed54.1756139608.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 289325640a04..7f7c31326226 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -135,7 +135,7 @@ static inline int get_buf_page_count(void *buf, int size)
 
 static void smb_direct_destroy_pools(struct smbdirect_socket *sc);
 static void smb_direct_post_recv_credits(struct work_struct *work);
-static int smb_direct_post_send_data(struct smb_direct_transport *t,
+static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
 				     struct kvec *iov, int niov,
 				     int remaining_data_length);
@@ -269,13 +269,11 @@ static void smb_direct_send_immediate_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
 		container_of(work, struct smbdirect_socket, idle.immediate_work);
-	struct smb_direct_transport *t =
-		container_of(sc, struct smb_direct_transport, socket);
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return;
 
-	smb_direct_post_send_data(t, NULL, NULL, 0, 0);
+	smb_direct_post_send_data(sc, NULL, NULL, 0, 0);
 }
 
 static void smb_direct_idle_connection_timer(struct work_struct *work)
@@ -1142,12 +1140,11 @@ static int post_sendmsg(struct smbdirect_socket *sc,
 	return smb_direct_post_send(sc, &msg->wr);
 }
 
-static int smb_direct_post_send_data(struct smb_direct_transport *t,
+static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 				     struct smbdirect_send_batch *send_ctx,
 				     struct kvec *iov, int niov,
 				     int remaining_data_length)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	int i, j, ret;
 	struct smbdirect_send_io *msg;
 	int data_length;
@@ -1241,7 +1238,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 			if (i > start) {
 				remaining_data_length -=
 					(buflen - iov[i].iov_len);
-				ret = smb_direct_post_send_data(st, &send_ctx,
+				ret = smb_direct_post_send_data(sc, &send_ctx,
 								&iov[start], i - start,
 								remaining_data_length);
 				if (ret)
@@ -1259,7 +1256,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 						min_t(int, max_iov_size,
 						      buflen - max_iov_size * j);
 					remaining_data_length -= vec.iov_len;
-					ret = smb_direct_post_send_data(st, &send_ctx, &vec, 1,
+					ret = smb_direct_post_send_data(sc, &send_ctx, &vec, 1,
 									remaining_data_length);
 					if (ret)
 						goto done;
@@ -1275,7 +1272,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 			if (i == niovs) {
 				/* send out all remaining vecs */
 				remaining_data_length -= buflen;
-				ret = smb_direct_post_send_data(st, &send_ctx,
+				ret = smb_direct_post_send_data(sc, &send_ctx,
 								&iov[start], i - start,
 								remaining_data_length);
 				if (ret)
-- 
2.43.0


