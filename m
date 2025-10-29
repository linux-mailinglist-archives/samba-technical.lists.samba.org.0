Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 48695C1AC3E
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:37:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uVDVs9P3LlRAqEn6fgRwtXdI1/hMX8L0Yb+OP0uZzV0=; b=H6nad7k8DMGgNgfA9CTXwPTp9j
	iCgw8Jl3pauj/yjyNEi4j9w8Qu5cUzqyAj/9JQy4A0/meVWam/ji7GprxBa0ttJFAq471Z9di/TS8
	N5cmYC0LOaNM36R4CCrqlyjVaSPcVY0G8NM4uWThzZFM/LQNJIAOL7XP4BriwOSRjd8/+vHDRuKTA
	IkaB7QWXmdU1LJowrgMk7w6MTf83OX6gOENq7/eWKoNAtmXHbfaaeqage4ZhH/dSP+jATvPJ4C4xv
	Wbgd8DvYzzbKVjsr4XBAlaKwgNr7MmrBLSvP/6S9ZRxhJ1fb68hvbivH1Klq1nYMQfdep5rpwLMi8
	zBjj9tQg==;
Received: from ip6-localhost ([::1]:50116 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6MO-0099lv-6u; Wed, 29 Oct 2025 13:37:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42248) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ds-0096wq-Hc
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:28:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=uVDVs9P3LlRAqEn6fgRwtXdI1/hMX8L0Yb+OP0uZzV0=; b=3BCF+Qe0k0a67oFKScMROkZVoq
 wZlGjajHE9THpfuDwv6UMsdnABsgkCr/qkJzH+9z6COMecy2q1nJ9Jv4Lw7Az4AOmyzhEYsRLEe0x
 Noec2/4ZQsYJtpMWIijs253QpDlDSSBBQEKgnQgsKWVVfFtYNP0dXVIIaTLWDN7tizwa6F5EDxmYZ
 opQQ+plU32Yc1lCQMhVsBB5Mn66d+E8LFo67x5xPhrKsUCmHPZD/9JDV0OnfOmh4BTYfXLlLa0NW/
 /az2ucjeswzywNvrs6k4IK5CejdBx7RrzgrvP54RA+hk5z2sFqoFHXehRbSbpfPWw9a62H9jioFby
 rQJxIsjfezjehwzOWoFGxRjG7Uf8s3wsWq3ZjFVIu++OtmHSENs5kJm4Nk2f+HKNRa3IKWh4MgI5h
 g5zvRS4XpOHwisG19Z8fji4GmWTCjbTsR+grkiQMskPV2xPY1r2L8JYQ13W5D1tYVzPocgWXx3dIS
 f4McNmhrbqyK9r0ZVhYY9uQ4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Dq-00Bc4b-0E; Wed, 29 Oct 2025 13:28:18 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 059/127] smb: client: make use of
 smbdirect_connection_wake_up_all()
Date: Wed, 29 Oct 2025 14:20:37 +0100
Message-ID: <ce6994d4e7d84bff8cf139c64ba6f023f70d5851.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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
index 08192d69617b..c6f2bb5fc262 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -213,22 +213,6 @@ do {									\
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
@@ -285,7 +269,7 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 	 * Wake up all waiters in all wait queues
 	 * in order to notice the broken connection.
 	 */
-	smbd_disconnect_wake_up_all(sc);
+	smbdirect_connection_wake_up_all(sc);
 }
 
 static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
@@ -347,7 +331,7 @@ static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 	 * Wake up all waiters in all wait queues
 	 * in order to notice the broken connection.
 	 */
-	smbd_disconnect_wake_up_all(sc);
+	smbdirect_connection_wake_up_all(sc);
 
 	queue_work(sc->workqueue, &sc->disconnect_work);
 }
@@ -1655,7 +1639,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	 * Most likely this was already called via
 	 * smbd_disconnect_rdma_work(), but call it again...
 	 */
-	smbd_disconnect_wake_up_all(sc);
+	smbdirect_connection_wake_up_all(sc);
 
 	log_rdma_event(INFO, "cancelling recv_io.posted.refill_work\n");
 	disable_work_sync(&sc->recv_io.posted.refill_work);
-- 
2.43.0


