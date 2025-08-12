Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B4BB22E05
	for <lists+samba-technical@lfdr.de>; Tue, 12 Aug 2025 18:45:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=p7Hg42irhIchcCUCKuFHg2sA0bBPKfC/YqnwJzAjRKE=; b=NR1y7IOJ8JvIwx7fIb49p1fbLQ
	WWNAQaPPQbxkdQMDZAUnO5qHpkgjzjhsCCou55rPCWT5Mmw40BLkYW2UsRQE1mZ1gWF5OLB0UHWT7
	XIYWnHlIZt2ifw4cMd++DlsAzI17YxBP0ERZDS0qwBSIlnxMj1fQZ+Nw/YlqZKQaQ3Z2o1uJhvfG7
	0vsJdSKnP5R057pr0wiK3/wAK7T/aO7VXvZ8tB1rejLm0ELAdjBT/7FRvDxydc4tuVfZqeM6COBZT
	ynzxTn0o5gkjcTDEFjIVIVRcytIC0hmU3/TordF3wv4PtGLNww+rJzfNo86KszAvOCS1XE1aMd/qn
	QkAfa52Q==;
Received: from ip6-localhost ([::1]:27128 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uls7x-00Ev0A-HR; Tue, 12 Aug 2025 16:45:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64242) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uls7s-00Ev03-Fa
 for samba-technical@lists.samba.org; Tue, 12 Aug 2025 16:45:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=p7Hg42irhIchcCUCKuFHg2sA0bBPKfC/YqnwJzAjRKE=; b=Zw6AIbuCdYcskyU5Y9KpS9Ef0l
 UGZicHgwKyZERj0EX25whj7oDZNB5RiP86I+hXuz6XXKtWVmSLcemV/nGzdE7LNIa5YAJytv2/Tig
 yANLs0ylOuiZHodJAje/mDvNb3oqWD6HV94xeQvjekSj27D9oF8XOf0sSqXZ29O5zLXez+jHWdlq/
 z/vhcUOuWZ3vHjWxbWYC4m5zzJAspH/caudwJPCNrSxkjeoJTtGQ/6mm3dRpB7CSdnIdn5p2ge7n7
 xW093bPxnMogkorwIWvieiJ3/PR3gaOBn1goBNW/k62vq60U5vAyAAohJbhqBjGh+pRhQtK/FtL3R
 JJn1MTUrtcorBPomOpfCYXVJ03PZLHY9vIn/WUGJOEBUjG7a32PsYM/cLJpQUwNxQHfzJzzR/PH6K
 +rJXyrCQAIa1oVwm8XK5LEfG5/EPMXuVJAfU1/kNaINsVBRrlxFgXj7aIHINKQ0L8twc5NARxkAzv
 LQnMpawNf4HeYZ0hfKKqQdxk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uls7r-002SeY-0f; Tue, 12 Aug 2025 16:45:27 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: client: don't wait for info->send_pending == 0 on error
Date: Tue, 12 Aug 2025 18:45:06 +0200
Message-ID: <20250812164506.29170-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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

We already called ib_drain_qp() before and that makes sure
send_done() was called with IB_WC_WR_FLUSH_ERR, but
didn't called atomic_dec_and_test(&sc->send_io.pending.count)

So we may never reach the info->send_pending == 0 condition.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: 5349ae5e05fa ("smb: client: let send_done() cleanup before calling smbd_disconnect_rdma_connection()")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index fe7e138704fc..5f32a967f553 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1402,10 +1402,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	log_rdma_event(INFO, "cancelling idle timer\n");
 	cancel_delayed_work_sync(&info->idle_timer_work);
 
-	log_rdma_event(INFO, "wait for all send posted to IB to finish\n");
-	wait_event(info->wait_send_pending,
-		atomic_read(&info->send_pending) == 0);
-
 	/* It's not possible for upper layer to get to reassembly */
 	log_rdma_event(INFO, "drain the reassembly queue\n");
 	do {
@@ -2055,7 +2051,11 @@ int smbd_send(struct TCP_Server_Info *server,
 	 */
 
 	wait_event(info->wait_send_pending,
-		atomic_read(&info->send_pending) == 0);
+		atomic_read(&info->send_pending) == 0 ||
+		sc->status != SMBDIRECT_SOCKET_CONNECTED);
+
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED && rc == 0)
+		rc = -EAGAIN;
 
 	return rc;
 }
-- 
2.43.0


