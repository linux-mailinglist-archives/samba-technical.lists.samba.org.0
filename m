Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6766C1AC84
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:38:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=V+FFBxArbo21Cd1+L6rEQqlYekt/GGgHyQFuMb14eAY=; b=cZc2o4hiAR/pWHaUE/Dl/Fq++E
	+FJQqGNkGCRO02xbv7MPolikNr2RGslZFZCV0Kl4dYNYSLaZ4AV4YhSZ60cuN+T5WROj233p32RZJ
	XNi5HFalwoDZxmyGtvYXoBD7TWz5nZ6w10TLBbMqSBYLKh9w7yNE5IsbIdovug7ieIkyYZZ/NwS/n
	Ze3OulcOVYX6ui2O8oXDZYdZJFZNjymc9N9m/iV+B3Tl806+4Mla9FmtOfx6RQCflzWNZLkxpbFrx
	Ck92NO44PWQxwiPys/Wt8OiOcrM6tKXd8XxE8wHJBeVtb7qEE6CP7yz0y35CHQkdcPghD2CjKLsxJ
	5KFuzocQ==;
Received: from ip6-localhost ([::1]:40270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Nq-009AIo-Ly; Wed, 29 Oct 2025 13:38:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52576) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6EM-00976R-9v
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=V+FFBxArbo21Cd1+L6rEQqlYekt/GGgHyQFuMb14eAY=; b=dgCaeW1I5P9X6PZdcO1169+pfP
 iioQt9obPO8rq1lDsCBbsJMZpCGHP68+b+kVbUhdP3R3gxM88pXV13xPlymcpis8AhJ353aZ7Ymek
 yOMF7jrhv7aahKUDoKcsiT/mQcMU3x/fQysVhM+P9NGzCDtM/NdCzoI/oBjeSRqdz+Uf3gsjF8v1v
 ItM+wxTYFnRPxLsKhX8EcrjEuxdJ9ICZfjM9g0Pr0RAOQ7ZXag3sA/d3DdIojjuI8DnRXz5q5wtEl
 rQCca5fJF7Zg1pg4E5caur6MFHXIPzl+q6qtuxg2Qh7isR9otm8lFtuG+hU6xm2opE/uuHaiJrXkH
 Xml9ZmrB9siIk2k9xye5Ui/AGL6oKMiMs1O4DUlO250r3zipNTa5/nlkj1T6FpxWA1fULNaXG+2Hk
 b4bqUCIv5K3q3vc/9gw9nDcMJ2U4IGI6C62kflgsYyUkH5V5o63SnLt09JhWLT7XjQtxD9g8Ro1GP
 gQUOimYnCzgf9+0J91vu0p9B;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6EI-00Bc9K-2Z; Wed, 29 Oct 2025 13:28:46 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 064/127] smb: client: make use of
 smbdirect_connection_idle_timer_work()
Date: Wed, 29 Oct 2025 14:20:42 +0100
Message-ID: <f6616b76e34975c9a133cd97b591e598d9152397.1761742839.git.metze@samba.org>
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

This is basically a copy of idle_connection_timer().

Note smbdirect_socket_prepare_create() already calls INIT_DELAYED_WORK().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index cf2f63696f85..e61f41fd020b 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1339,35 +1339,6 @@ static void send_immediate_empty_message(struct work_struct *work)
 	smbd_post_send_empty(sc);
 }
 
-/* Implement idle connection timer [MS-SMBD] 3.1.6.2 */
-static void idle_connection_timer(struct work_struct *work)
-{
-	struct smbdirect_socket *sc =
-		container_of(work, struct smbdirect_socket, idle.timer_work.work);
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-
-	if (sc->idle.keepalive != SMBDIRECT_KEEPALIVE_NONE) {
-		log_keep_alive(ERR,
-			"error status sc->idle.keepalive=%d\n",
-			sc->idle.keepalive);
-		smbdirect_connection_schedule_disconnect(sc, -ETIMEDOUT);
-		return;
-	}
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
-		return;
-
-	/*
-	 * Now use the keepalive timeout (instead of keepalive interval)
-	 * in order to wait for a response
-	 */
-	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
-	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
-			 msecs_to_jiffies(sp->keepalive_timeout_msec));
-	log_keep_alive(INFO, "schedule send of empty idle message\n");
-	queue_work(sc->workqueue, &sc->idle.immediate_work);
-}
-
 /*
  * Destroy the transport and related RDMA and memory resources
  * Need to go through all the pending counters and make sure on one is using
@@ -1771,7 +1742,6 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 
 	INIT_WORK(&sc->idle.immediate_work, send_immediate_empty_message);
-	INIT_DELAYED_WORK(&sc->idle.timer_work, idle_connection_timer);
 	/*
 	 * start with the negotiate timeout and SMBDIRECT_KEEPALIVE_PENDING
 	 * so that the timer will cause a disconnect.
-- 
2.43.0


