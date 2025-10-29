Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB4CC1AE1E
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:46:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=N+dm26HGsmDHJkyCTAFFE7J5g6K/mZTJdw+CJZJm9qY=; b=PhTgSE2bag1tCCohNvY7REYj7B
	S9KvtDGarp42dpeqFCH5MN8UzeGanRXSw8aIViFJ3WrFD05D0OEPWlZXTEePi23OX5x3sg7Eis0Mc
	hRei+NMm3DYjb+c9GJ10pwCr7OsgNtcnzcMXRvfaRrtMAkxXCGdkq5wrs+blGuoGlBZ7uQhROxigu
	1wAwAwKh/3h1WapgDKJhEoQqeiR4zz9jcNcm77SXQfzgycOLENyQW6P8B/ajgv0kB8aYHuFef+28T
	q5nxnthjzghxRSFbQnX5s1cMeC6MmkqIq3hS3oYI8B1iLZU5B+XGcjT+XtOnQFHEpCUtlKo6/68rQ
	n2g7fnSA==;
Received: from ip6-localhost ([::1]:39462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6VW-009D8h-RC; Wed, 29 Oct 2025 13:46:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11386) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Hw-0098Gj-Iz
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=N+dm26HGsmDHJkyCTAFFE7J5g6K/mZTJdw+CJZJm9qY=; b=Tb/vKqtxdR4lKitvf3rQTY20jf
 tQCbdKAnQLELGey9HHLsDdc96Zlj7IpscEyzXj6e4rdzM4tnuSA+rGPwixJ3lIPq4ddvurEK8Ufze
 DGDgq7oM1qT50ETYstt3wWqoFQLc0TiyyCjCyCuDJzLMebHqQmN/ROoaJZGx0fpJNf3wj/xvPWMOX
 peHsXtOj4nELutiNzzd1hVAUbUYsDpbszeCcLGAg7BXbSrUtZu757ooDIP09qLeBEzBZi9H5edd5f
 V3DHB62QyUYimty0WVI7xPldPYBXd3RZpcrcN0Zoxm0kCaJ18b/S0luvpJ5z3F/1AYGfH/iVeyUR2
 mVI9AAWOgy/e0EBSfzjChERc/8kCtsOhI3JViVRXze1pu0jR4arHyPSeACcDyx9XXvDIb3sOmiZQL
 kTYa+c60u/FZ4lU0Cwod2AZswrV5r260Q6y8HhzY19MZHRVt/OL8Ly/2vEF3/iqq9MbjACpQjqWy8
 Li7cGi/n0uUs/uXnX4mg5bzA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Hs-00Bcjl-2R; Wed, 29 Oct 2025 13:32:29 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 099/127] smb: server: make use of
 smbdirect_connection_idle_timer_work()
Date: Wed, 29 Oct 2025 14:21:17 +0100
Message-ID: <a0ae8721b60ffe5644fa4c00489c7d2f588683a2.1761742839.git.metze@samba.org>
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
index fdf8ac7d5d34..886a350819bf 100644
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


