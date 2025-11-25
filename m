Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F809C8682B
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:12:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nhvs8Ks+L5+0PWdzhox0gnpQcTmxDYOw68mg+HkYe2Q=; b=oG2xr5EZStDi4l12RPmNyIJocj
	jgbsjNnxcVVOrz9IHD9nSC0Pr2pzGC6ccreSW8kCHY8EHqpiflPIv0VsD5qVCDCP5YBuBhKyW3z8E
	Xdp9gz+x8vZW0VdW6b8T1yseyyjleJ9meK38ez+Al0noJpxVJrf+tw9CA/BwkSrGdXxINJ8jm4+r7
	KWmsmKHlt3tvquUetLW0ZHeApw/1RmzhaVmtzZ0j9/Q5D9+4acBnUV2/rYUMhAuTrz4yi/pXRtOaf
	//5+PzaH7DMyAU7B4QbmQVMOlYAgnMsDp15D+ccNApFtddPYym5xWywxeAeLGQB1c+u0ggV3jb04e
	klB+4G9w==;
Received: from ip6-localhost ([::1]:44644 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxWz-00DBVW-LG; Tue, 25 Nov 2025 18:12:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26948) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQr-00D9bV-Mw
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nhvs8Ks+L5+0PWdzhox0gnpQcTmxDYOw68mg+HkYe2Q=; b=PnayvQKUuJHsVAzPeEMwlgoTig
 mKGuFvYelfhaiNyKNAUsfSjWsSJAIkzqTGkvfBiYa3zwTBy5Kl+YdSf+Ua+LQrVygB0GUuxRdHgQS
 5GmJK9L6bqaNTuEQQ/sCWYpJjy3qVD0crVr0AY3rAcVZpGSa7eAtrcNz3BxlROrtPHecI95lTf6c/
 rFlQ0sqzxZWzAHcBOMPsi5BU17I3mLoGO3nZftKZC2CROMkFVkSBHsQOP4g1zkARqpL4RoTXDhKx/
 OpCfzXoZdCU7pInQpgAMMjGvdxCJtkAChQk46KytDGAjni0Ctyp93QF2HhJWBFoMcb0O0m7kk76ev
 GZFx8YcAa39izr6MXHhOxEXQkhRShAr7vvgi7MT5S+W6DiadhPzXGjGdHC7Xi2YKNTVxQXaXw54z6
 eRGe3N2rgCykn625g+8Bzr9VG//3GYKuXTWDUQYvIBSAS5E2V5BVh1VorOiew599tlsL8iPrCFnI2
 /VcMn375O0kyddTxZ3VeGh9i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxNo-00Fdba-0Z; Tue, 25 Nov 2025 18:03:20 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 063/145] smb: client: make use of
 smbdirect_socket_wake_up_all()
Date: Tue, 25 Nov 2025 18:55:09 +0100
Message-ID: <db1ab14841d3d7d108074d16054983bd3e0c6872.1764091285.git.metze@samba.org>
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

This is a superset of smbd_disconnect_wake_up_all() and
calling wake_up_all(&sc->rw_io.credits.wait_queue); in addition
should not matter as it's not used on the client anyway.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 22 +++-------------------
 1 file changed, 3 insertions(+), 19 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 3d3b6fa65781..4dae3d1eb93e 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -216,22 +216,6 @@ do {									\
 #define log_rdma_mr(level, fmt, args...) \
 		log_rdma(level, LOG_RDMA_MR, fmt, ##args)
 
-static void smbd_disconnect_wake_up_all(struct smbdirect_socket *sc)
-{
-	/*
-	 * Wake up all waiters in all wait queues
-	 * in order to notice the broken connection.
-	 */
-	wake_up_all(&sc->status_wait);
-	wake_up_all(&sc->send_io.lcredits.wait_queue);
-	wake_up_all(&sc->send_io.credits.wait_queue);
-	wake_up_all(&sc->send_io.pending.dec_wait_queue);
-	wake_up_all(&sc->send_io.pending.zero_wait_queue);
-	wake_up_all(&sc->recv_io.reassembly.wait_queue);
-	wake_up_all(&sc->mr_io.ready.wait_queue);
-	wake_up_all(&sc->mr_io.cleanup.wait_queue);
-}
-
 static void smbd_disconnect_rdma_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -288,7 +272,7 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 	 * Wake up all waiters in all wait queues
 	 * in order to notice the broken connection.
 	 */
-	smbd_disconnect_wake_up_all(sc);
+	smbdirect_socket_wake_up_all(sc);
 }
 
 static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
@@ -353,7 +337,7 @@ static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 	 * Wake up all waiters in all wait queues
 	 * in order to notice the broken connection.
 	 */
-	smbd_disconnect_wake_up_all(sc);
+	smbdirect_socket_wake_up_all(sc);
 
 	queue_work(sc->workqueue, &sc->disconnect_work);
 }
@@ -1662,7 +1646,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	 * Most likely this was already called via
 	 * smbd_disconnect_rdma_work(), but call it again...
 	 */
-	smbd_disconnect_wake_up_all(sc);
+	smbdirect_socket_wake_up_all(sc);
 
 	log_rdma_event(INFO, "cancelling recv_io.posted.refill_work\n");
 	disable_work_sync(&sc->recv_io.posted.refill_work);
-- 
2.43.0


