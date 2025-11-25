Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B73C86B1D
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:45:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zoH+4XP8FyGpKdv2ioBMYnBqRm0WPYwl16h+r30AreI=; b=P9OBVggm8/m0xCQ20T/O04AQjd
	sTUuocsKja4MYMOJwsKe54KtOhBO3UvcRAqvZ3ukOdtlhYshY62lmX6HAOiHKMUuESmAHwVDmJyZd
	3PRrVzMEaMOcNLBkJIMMfMYzJH3GJz3kM2L9ex+O6Xfmde0AS94iVtrbj56EpVdHuPeojP1gTI0h0
	EVATFFLVKHlU5N12LoxiF/U10Lj9xKDzZjEhttNAhIWAs8WqvCTKF6bXVT3j2lgtkr6AqzsNOYOXC
	FjwCfnvvuvaPGiwqO6mqV4bUhWBvNWcBZgDAYp8TywzxFOtsEo7l8oRq2Z9+/7M0MzltJFbdJrfgs
	VlJGy4TQ==;
Received: from ip6-localhost ([::1]:52662 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNy2K-00DI95-1K; Tue, 25 Nov 2025 18:45:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64550) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNy2E-00DI8y-FO
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:45:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=zoH+4XP8FyGpKdv2ioBMYnBqRm0WPYwl16h+r30AreI=; b=dzJzxe3o3R7GpvZHlzMcxGh/Sr
 T7TMP7CKHsU6jd0OFO8o2DveIyyd1wXPWKZcUOET06p+ciAzNXDkmNsTfi38hws0smncbl0IWRugQ
 q3QiA4LNdzIcZNz7FIoOK3Yaw0nvzpMeSIXnqQZ0otcsIqUfHpuNZ318ZDRzNPLmi97r64kbgM9MY
 sTnxlqNC99w2FxRR0L9/L4WQg7knncbtbig1gobwrq9tLwRsJmHC5IPaXljdlRdszPr26jM9AaJiU
 hXhl6BTXskHixx0PrHivvvgl8aCmuCDv/sDy2iIgp8tNh286gP3zTMDew9rV3daMG5Tor2teDEiuw
 3HWc1crQM54XaOovCrhf1I6NT98LdEcGf9ITLJV00niHsDQoHYWPzxUxAoR9iXZGgP5WmeXeGw/VE
 YU7IssihGHLqDRk7AgEpBEgSIjkdtYZeL5emz4l5fqnTPPKaD9rKGU3do1WUPweUX/WcIWAtsRI8a
 lQfOn9VdAxNWZrDd6x8KuiOj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxVY-00FeMl-0j; Tue, 25 Nov 2025 18:11:21 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 105/145] smb: server: make use of
 smbdirect_connection_idle_timer_work()
Date: Tue, 25 Nov 2025 18:55:51 +0100
Message-ID: <fbb3d876816e20d09bd4f22cd3aa2e118af9bc39.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is basically a copy of smb_direct_idle_connection_timer().
The only difference is that we had no logging before.

Note smbdirect_socket_prepare_create() already calls INIT_DELAYED_WORK().

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 0b86df43449c..9ebf19c5fa80 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -226,30 +226,6 @@ static void smb_direct_send_immediate_work(struct work_struct *work)
 	smb_direct_post_send_data(sc, NULL, NULL, 0, 0);
 }
 
-static void smb_direct_idle_connection_timer(struct work_struct *work)
-{
-	struct smbdirect_socket *sc =
-		container_of(work, struct smbdirect_socket, idle.timer_work.work);
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-
-	if (sc->idle.keepalive != SMBDIRECT_KEEPALIVE_NONE) {
-		smbdirect_socket_schedule_cleanup(sc, -ETIMEDOUT);
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
-	queue_work(sc->workqueue, &sc->idle.immediate_work);
-}
-
 static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 {
 	struct smb_direct_transport *t;
@@ -292,8 +268,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	sc->ib.dev = sc->rdma.cm_id->device;
 
-	INIT_DELAYED_WORK(&sc->idle.timer_work, smb_direct_idle_connection_timer);
-
 	conn = ksmbd_conn_alloc();
 	if (!conn)
 		goto err;
-- 
2.43.0


