Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B56C86928
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:22:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ugm5SqYhsNqqrvCrl73LqlODKQvKqoiTZfF0yJfefk0=; b=af5Rrrua37Iq7xRVREN8Sg/Jgd
	KOyDPBEfCyxWSIcRZepftPcuTLo0lNaoqfY+s/6zjatE741KIScjrrPjaTyM9dUAqQN6PxDT7RDRp
	K8rih6B9o8fTdNX3eAfLfuTvVATN9HuCULoDmt78oZTvtiDvBiB3PqPvc46oGfAPNYw0A8zdEAecW
	8Q8UMv10x4RqNcJsbcqtQ2YVnwWo24v2nlg7cyW1e7EP3NbQTkZb2W4udreoHZbz5B8juMbmuTjUM
	++fbyW1mthDxmcjnID/2MAYc/POoR4lRnMasbtZAy1O5D9B72ubO1obqTzQTMIY96Ku835XzqZ5go
	Dl916EAA==;
Received: from ip6-localhost ([::1]:31044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxfn-00DESr-R1; Tue, 25 Nov 2025 18:21:56 +0000
Received: from hr2.samba.org ([144.76.82.148]:35234) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxcZ-00DDdN-E7
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:20:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ugm5SqYhsNqqrvCrl73LqlODKQvKqoiTZfF0yJfefk0=; b=LD+D11QEy0bdN6s+5op99v1VDE
 1V8CitJXk3FWBPcdG+WjJz5gHeGGVuJVpET16c4SnXApk+1tWlcipVTxezZsfmOAZA53Jqd/8Lpqn
 UPUqWljjKQ+fOBu4iYkK/Dv4zMNPU2ayjS0I4C2w4GkxeCqcOPmdpRNYpb7OtY87nsjwOOSoUP96Q
 F5lsCqUFkS4ZY6AA0YLVHWkDrPO0RdH7ELCHIO9p9D6bPukgnFYcMUBqS8JAA29Y5rK2cPpmYmJjR
 P+a/yjFT/I6MqNuM5fxgm60xaM1QIQTBVwbPgPOdXQmNNd24U0+daQ+/SAVRoEmYIcJXRvM0xc87i
 JpHU7q8JhbQhwMcLZFVFeeK7Yn++8YdSvQSr19X91TlQqXLTAV8PC1SVZB8VXaxeTJh+IBlm4rhzt
 oen5tSEGYiYsaM0BkGtE7suvzlCkhIgQCYzwSRBXdaq957D7bJUvGFeqqqKK8PqlS222KYBsDhI2F
 W3IQ/ErsZJiBK5zmwmVy2xL/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUF-00FeAI-0N; Tue, 25 Nov 2025 18:10:00 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 094/145] smb: client: make use of
 smbdirect_socket_create_kern()/smbdirect_socket_release()
Date: Tue, 25 Nov 2025 18:55:40 +0100
Message-ID: <adc0378ba1b337e8e622047ac6100aa11646575b.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

With this we no longer embed struct smbdirect_socket, which will allow
us to make it private in the following commits.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 30 ++++++++++++++----------------
 fs/smb/client/smbdirect.h |  2 +-
 2 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index cbb6f6762992..1efbc15879f4 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -200,15 +200,13 @@ static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
 void smbd_destroy(struct TCP_Server_Info *server)
 {
 	struct smbd_connection *info = server->smbd_conn;
-	struct smbdirect_socket *sc;
 
 	if (!info) {
 		log_rdma_event(INFO, "rdma session already destroyed\n");
 		return;
 	}
-	sc = &info->socket;
 
-	smbdirect_socket_destroy_sync(sc);
+	smbdirect_socket_release(info->socket);
 
 	destroy_workqueue(info->workqueue);
 	kfree(info);
@@ -288,8 +286,7 @@ static struct smbd_connection *_smbd_get_connection(
 	info->workqueue = create_workqueue(wq_name);
 	if (!info->workqueue)
 		goto create_wq_failed;
-	sc = &info->socket;
-	ret = smbdirect_socket_init_new(net, sc);
+	ret = smbdirect_socket_create_kern(net, &sc);
 	if (ret)
 		goto socket_init_failed;
 	smbdirect_socket_set_logging(sc, NULL, smbd_logging_needed, smbd_logging_vaprintf);
@@ -317,17 +314,14 @@ static struct smbd_connection *_smbd_get_connection(
 		goto connect_failed;
 	}
 
+	info->socket = sc;
 	return info;
 
 connect_failed:
 set_workqueue_failed:
 set_settings_failed:
 set_params_failed:
-	/* At this point, need to a full transport shutdown */
-	server->smbd_conn = info;
-	smbd_destroy(server);
-	return NULL;
-
+	smbdirect_socket_release(sc);
 socket_init_failed:
 	destroy_workqueue(info->workqueue);
 create_wq_failed:
@@ -337,9 +331,13 @@ static struct smbd_connection *_smbd_get_connection(
 
 const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connection *conn)
 {
-	struct smbdirect_socket *sc = &conn->socket;
+	if (unlikely(!conn->socket)) {
+		static const struct smbdirect_socket_parameters zero_params;
+
+		return &zero_params;
+	}
 
-	return smbdirect_socket_get_current_parameters(sc);
+	return smbdirect_socket_get_current_parameters(conn->socket);
 }
 
 struct smbd_connection *smbd_get_connection(
@@ -386,7 +384,7 @@ struct smbd_connection *smbd_get_connection(
  */
 int smbd_recv(struct smbd_connection *info, struct msghdr *msg)
 {
-	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_socket *sc = info->socket;
 
 	if (!smbdirect_connection_is_connected(sc))
 		return -ENOTCONN;
@@ -404,7 +402,7 @@ int smbd_send(struct TCP_Server_Info *server,
 	int num_rqst, struct smb_rqst *rqst_array)
 {
 	struct smbd_connection *info = server->smbd_conn;
-	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_socket *sc = info->socket;
 	const struct smbdirect_socket_parameters *sp = smbd_get_parameters(info);
 	struct smb_rqst *rqst;
 	struct iov_iter iter;
@@ -500,7 +498,7 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 				 struct iov_iter *iter,
 				 bool writing, bool need_invalidate)
 {
-	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_socket *sc = info->socket;
 
 	if (!smbdirect_connection_is_connected(sc))
 		return NULL;
@@ -535,7 +533,7 @@ void smbd_debug_proc_show(struct TCP_Server_Info *server, struct seq_file *m)
 		return;
 	}
 
-	smbdirect_connection_legacy_debug_proc_show(&server->smbd_conn->socket,
+	smbdirect_connection_legacy_debug_proc_show(server->smbd_conn->socket,
 						    server->rdma_readwrite_threshold,
 						    m);
 }
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 3f623a37aedc..35172076f2ee 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -37,7 +37,7 @@ extern int smbd_receive_credit_max;
  * 5. mempools for allocating packets
  */
 struct smbd_connection {
-	struct smbdirect_socket socket;
+	struct smbdirect_socket *socket;
 	struct workqueue_struct *workqueue;
 };
 
-- 
2.43.0


