Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A19C1AD37
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=EUkQQFEFroJvP64pNBNXyWbOMTgIpSluXI57acnc+O8=; b=jsszNeSi0pYUPCSXUpoMPYh7OC
	sewEup2Dxk1dO6/OSUMeZw0Yo6k9/Fe9GheiJ59BQv0vbEsVQxKQyVa/JaITJzwqFzLnEU8/DVpsF
	U/AP+ubDQeG1ODaWHT5PY3xu8a45jU38ZRbsiwKo8XQtEug4jqKM5mUic73s489QReTenj+g6Rv4k
	IrMqlsoPpLXxhkxW61omcBT4kCxIFVyrAZMHbrRMhlCVLIQIROgGmjYJER7IZ5b/ccXIeX/6K9Uw8
	luNilW5vHK/EJRDniN9TdtZVIqMRKKZnGd+IKq46CSV4iK5JU7vrom04CNlr30PZLUg2hK/gytnak
	wFef/QOA==;
Received: from ip6-localhost ([::1]:33824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6QQ-009BF4-TT; Wed, 29 Oct 2025 13:41:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36652) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6FM-0097QQ-9R
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=EUkQQFEFroJvP64pNBNXyWbOMTgIpSluXI57acnc+O8=; b=ZgL8Tmbv2c+EcBVbFheiBDM4Uw
 malH5ZJC4M2qiwN3zF34Le2wOU1reCGriK5RM9bFj/G71IAELSMFYieOW82ggTSIA5vZKSYtyPjwB
 tvwGzf26aRk0sNcgplLSxh9m+sZ9c0qjSOjW5tGL8jMAU2gSCQwcPYlzIFYs15zvzJGGUcYVzMk6M
 aXMYfeRTp3g2L9A+19QduFGWpDWNTo6TEcT8r7Z3cbSsYaJ8G1ZYMYWKtjsUYcgP8rSThZhyTer1m
 3N2socqKNa5CkpWv0YS/kttvM2StDZByKsfaN3VjafhS6myrJ8EoP9UrEppBXBheabNEBTTOsAs6J
 zTrVod6x0Po9SlVGiGfpKGJbtGxv8KcNvn9jCIMBkKoy3P2hxvdH17h55++bjExFTXqf4yxkUarNL
 Jef7qhLVdwSCBtmV7QMWPFf4lDWK7R06hjG44PPjTvreFnTOKP0N5+TZ+JS2D8ynHBu+0OM1rsUZQ
 Mep/Db5qEbfKc7dktlbAU1nr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6FL-00BcJN-05; Wed, 29 Oct 2025 13:29:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 075/127] smb: client: make use of
 smbdirect_connection_recv_io_refill_work()
Date: Wed, 29 Oct 2025 14:20:53 +0100
Message-ID: <faf732adc1f79afceaf7dffbdf72ba72dd7317e9.1761742839.git.metze@samba.org>
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

This is basically a copy of smbd_post_send_credits(), but
there are several improvements compared to the existing function:

  We calculate the number of missing posted buffers by getting the
  difference between recv_io.credits.target and recv_io.posted.count.

  Instead of the difference between recv_io.credits.target
  and recv_io.credits.count, because recv_io.credits.count is
  only updated once a message is send to the peer.

  It was not really a problem before, because we have
  a fixed number smbdirect_recv_io buffers, so the
  loop terminated when smbdirect_connection_get_recv_io()
  returns NULL.

  But using recv_io.posted.count makes it easier to
  understand.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 41 +--------------------------------------
 1 file changed, 1 insertion(+), 40 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 9dfee81396c7..41149203e4ff 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -380,45 +380,6 @@ static bool process_negotiation_response(
 	return true;
 }
 
-static void smbd_post_send_credits(struct work_struct *work)
-{
-	int rc;
-	struct smbdirect_recv_io *response;
-	struct smbdirect_socket *sc =
-		container_of(work, struct smbdirect_socket, recv_io.posted.refill_work);
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
-		return;
-	}
-
-	if (sc->recv_io.credits.target >
-		atomic_read(&sc->recv_io.credits.count)) {
-		while (true) {
-			response = smbdirect_connection_get_recv_io(sc);
-			if (!response)
-				break;
-
-			response->first_segment = false;
-			rc = smbdirect_connection_post_recv_io(response);
-			if (rc) {
-				log_rdma_recv(ERR,
-					"post_recv failed rc=%d\n", rc);
-				smbdirect_connection_put_recv_io(response);
-				break;
-			}
-
-			atomic_inc(&sc->recv_io.posted.count);
-		}
-	}
-
-	/* Promptly send an immediate packet as defined in [MS-SMBD] 3.1.1.1 */
-	if (atomic_read(&sc->recv_io.credits.count) <
-		sc->recv_io.credits.target - 1) {
-		log_keep_alive(INFO, "schedule send of an empty message\n");
-		queue_work(sc->workqueue, &sc->idle.immediate_work);
-	}
-}
-
 /* Called from softirq, when recv is done */
 static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 {
@@ -1361,7 +1322,7 @@ static struct smbd_connection *_smbd_get_connection(
 	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
 			 msecs_to_jiffies(sp->negotiate_timeout_msec));
 
-	INIT_WORK(&sc->recv_io.posted.refill_work, smbd_post_send_credits);
+	INIT_WORK(&sc->recv_io.posted.refill_work, smbdirect_connection_recv_io_refill_work);
 
 	rc = smbd_negotiate(sc);
 	if (rc) {
-- 
2.43.0


