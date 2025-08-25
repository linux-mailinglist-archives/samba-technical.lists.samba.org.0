Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB98B34D38
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=A4ULFBRLD9davKya2gTn7SSKhqEMJROGRGOjwwKIHC4=; b=s6LbfHASxrpQDbh8Pf2a/O+RsT
	CCyAGJp0y5IPyv18CqUcYtYxGlzSKLUDEZWWQXDC2uT0rB9N8X0qtz1dnz6fddjAtoBY6n+jbSQL8
	ofzV0iipINBh/6Q0dbZ4cKHN1gaqXcI6qd88Fsyo/tvWeZ+oq49T8cuSVJsqOfgIsJP6y77CFrLoU
	BX9YFQyDSsy3UmDTOAGoXYLdiDMgv8t5fzpXAWhz8DK73Tq1eBxNS/qo6sXC6+F458jrItpI9Vl6U
	rPkyMTn3kntk/BkuQ/5D7TUU6RNnoRStFG3c2K0jLhriDHayEjMqDRNAse0lBlbCXPZqEKcWbS0o3
	LXYOiFSA==;
Received: from ip6-localhost ([::1]:52444 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeIk-000SNM-5F; Mon, 25 Aug 2025 21:00:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54588) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeF9-000Qvq-3G
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=A4ULFBRLD9davKya2gTn7SSKhqEMJROGRGOjwwKIHC4=; b=ymhI99WYeCEiScAaTMhp/miyRn
 Nm86dtlCA30mDHw6FMK1nG1vEJ9YSboKf2hZNWcbkzdXMNiFzkqeWstSmeefXi8vwdLH/pi5+2/tL
 5QGnfldsbRCY5t46heyqzcD2O2YaiJpgDXveqdW8xWJXCdqP713slpIv2eDaCfCvNc7XKGtcjUPMI
 NPahi0ibbRlhqIpj/wlITxGALSNE3DcK5/25kk8H93di531orMUS0E/694rhaXJyI8kBlTIqe7I0Y
 oAb3l1pwJLOysdSV1ah6fONB15610a7y9gno82GVwC2VbI14bCwD1Y39Z7vmrmna2pW/mwcY7PJTH
 5ssfjM1sZF4YnHtXGsbc4mneZut/wrAUQLdYt9NDAp+V22eVA1b3whv5KT4tno5PWPzKvGxQyMMuo
 LI2/YVZY23412Y7m09L7cH9Uld1YkW8sDJ6EhUsHBZAanPiLuysY7D0qOtTSzM5W13tU5VMf+acIL
 PnT9ihot1ydcyteCIaJjrcYV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeF6-000mC6-30; Mon, 25 Aug 2025 20:56:41 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 089/142] smb: server: don't use delayed_work for
 post_recv_credits_work
Date: Mon, 25 Aug 2025 22:40:50 +0200
Message-ID: <74b9647b882ec7749f5a8ea65ab1a61d51d90c72.1756139607.git.metze@samba.org>
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

If we are using a hardcoded delay of 0 there's no point in
using delayed_work it only adds confusion.

The client also uses a normal work_struct and now
it is easier to move it to the common smbdirect_socket.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 5e773da90316..85e0d2ea37ec 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -112,7 +112,7 @@ struct smb_direct_transport {
 	wait_queue_head_t	wait_send_pending;
 	atomic_t		send_pending;
 
-	struct delayed_work	post_recv_credits_work;
+	struct work_struct	post_recv_credits_work;
 	struct work_struct	send_immediate_work;
 	struct work_struct	disconnect_work;
 
@@ -330,8 +330,8 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	spin_lock_init(&t->lock_new_recv_credits);
 
-	INIT_DELAYED_WORK(&t->post_recv_credits_work,
-			  smb_direct_post_recv_credits);
+	INIT_WORK(&t->post_recv_credits_work,
+		  smb_direct_post_recv_credits);
 	INIT_WORK(&t->send_immediate_work, smb_direct_send_immediate_work);
 	INIT_WORK(&t->disconnect_work, smb_direct_disconnect_rdma_work);
 
@@ -364,7 +364,7 @@ static void free_transport(struct smb_direct_transport *t)
 		   atomic_read(&t->send_pending) == 0);
 
 	cancel_work_sync(&t->disconnect_work);
-	cancel_delayed_work_sync(&t->post_recv_credits_work);
+	cancel_work_sync(&t->post_recv_credits_work);
 	cancel_work_sync(&t->send_immediate_work);
 
 	if (sc->ib.qp) {
@@ -578,8 +578,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			wake_up(&t->wait_send_credits);
 
 		if (is_receive_credit_post_required(receive_credits, avail_recvmsg_count))
-			mod_delayed_work(smb_direct_wq,
-					 &t->post_recv_credits_work, 0);
+			queue_work(smb_direct_wq, &t->post_recv_credits_work);
 
 		if (data_length) {
 			enqueue_reassembly(t, recvmsg, (int)data_length);
@@ -743,8 +742,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 		st->count_avail_recvmsg += queue_removed;
 		if (is_receive_credit_post_required(st->recv_credits, st->count_avail_recvmsg)) {
 			spin_unlock(&st->receive_credit_lock);
-			mod_delayed_work(smb_direct_wq,
-					 &st->post_recv_credits_work, 0);
+			queue_work(smb_direct_wq, &st->post_recv_credits_work);
 		} else {
 			spin_unlock(&st->receive_credit_lock);
 		}
@@ -771,7 +769,7 @@ static int smb_direct_read(struct ksmbd_transport *t, char *buf,
 static void smb_direct_post_recv_credits(struct work_struct *work)
 {
 	struct smb_direct_transport *t = container_of(work,
-		struct smb_direct_transport, post_recv_credits_work.work);
+		struct smb_direct_transport, post_recv_credits_work);
 	struct smbdirect_recv_io *recvmsg;
 	int receive_credits, credits = 0;
 	int ret;
@@ -1676,7 +1674,7 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 		goto out_err;
 	}
 
-	smb_direct_post_recv_credits(&t->post_recv_credits_work.work);
+	smb_direct_post_recv_credits(&t->post_recv_credits_work);
 	return 0;
 out_err:
 	put_recvmsg(t, recvmsg);
-- 
2.43.0


