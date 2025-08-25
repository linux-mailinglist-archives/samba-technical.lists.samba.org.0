Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3AFB34D60
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:03:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=VwUEqN1NOJEAdy1qIlzB3AZzAcYMazrUJtv7MsYCOes=; b=d1nJBzy7nRWb6NyvgJ1pdsvfbP
	/rxDcKQZnSM5+LSqRa7D1vC6vI7eblKND0NuKamiVqPmLTisyTBHyxn4K2EVH4BgDdwAIu/0Tyykz
	mxGfj6F3bWv5IoAbnzeFZL0dHLuxhZ7TpTxryzBwb1BO4enZw+NAYjXe/gmuhR3aFQHP36DIS7NVq
	HZGqFNeUkSzoYbH/k9dU6A/XwCipMA6QfQXyl8Cx9XdsP7joU/CMVQ8h965MsqBlMQ4WpV3dwGll1
	XP2C7K8SSWPAZ3mU91NjQsgQ1wcEQ38DjSagYr13MzVQMNiRoS/ZnFn/W17uWE5WFLqUk2WxCX5/O
	q2yrlDXg==;
Received: from ip6-localhost ([::1]:44966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeL8-000TME-H9; Mon, 25 Aug 2025 21:02:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63472) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGx-000Rfn-I1
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=VwUEqN1NOJEAdy1qIlzB3AZzAcYMazrUJtv7MsYCOes=; b=e21ZaTRw7yGPbcttEX6+eaveUJ
 /jrxhc0UqY8F0YV0jsKhou8qVMDt4dov6ni+QV/LWxDj+8R4U9wjWRodDfpAtrTka0bm180CtrFLJ
 IumFlE6j9eAicuy43wxE816plyjHtr5OYQ2mgMNfD6HVhr01tVI4kh9f9hUufV+kFwiFHlSMeHtH3
 YuQwHmrB+Jh5lyweIfH/KAvuETv8Hd/fyDw7mzp9muxKx3iQ2XDM4NyI4waGjuDmvzX4pkhKknXZ/
 +C+CQnsgQG55rWy2q+yy0fCL5Mi102HoGUFy8FSkLeT4WPfQzkEw26wWTaYvqEaIP3EOQT8MNCAiR
 FJZFMU9jFpM2pYC0ecTxfoTSb+XgvDpUGrwp+ebDPmRAZ8xbjdf58sxeix3ijIgw3J+kAVIAT1t5M
 I/700bxj0j0RSXCSiQqsOWgnQ+D5C2UmCFvrqRV6TvOu7GjHIyp27Ph7zb1fSflAwsNIg4XDfK7gJ
 eTE20hmjp59GE4atcVM2cB5k;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGu-000mZc-21; Mon, 25 Aug 2025 20:58:33 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 101/142] smb: server: make use
 smbdirect_socket.rw_io.credits
Date: Mon, 25 Aug 2025 22:41:02 +0200
Message-ID: <7daf578be05451bd64fea934cdaf6e5a65854c0f.1756139607.git.metze@samba.org>
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

This will allow to us to have functions moved into
common code in future (even if it's only used by the server).

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 44 +++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index cca926ad2677..f04a3d1d0395 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -98,11 +98,6 @@ struct smb_direct_transport {
 
 	spinlock_t		lock_new_recv_credits;
 	int			new_recv_credits;
-	int			max_rw_credits;
-	int			pages_per_rw_credit;
-	atomic_t		rw_credits;
-
-	wait_queue_head_t	wait_rw_credits;
 
 	struct work_struct	post_recv_credits_work;
 	struct work_struct	send_immediate_work;
@@ -324,8 +319,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	sc->ib.dev = sc->rdma.cm_id->device;
 
-	init_waitqueue_head(&t->wait_rw_credits);
-
 	spin_lock_init(&t->receive_credit_lock);
 
 	spin_lock_init(&t->lock_new_recv_credits);
@@ -956,14 +949,21 @@ static int wait_for_send_credits(struct smb_direct_transport *t,
 
 static int wait_for_rw_credits(struct smb_direct_transport *t, int credits)
 {
-	return wait_for_credits(t, &t->wait_rw_credits, &t->rw_credits, credits);
+	struct smbdirect_socket *sc = &t->socket;
+
+	return wait_for_credits(t,
+				&sc->rw_io.credits.wait_queue,
+				&sc->rw_io.credits.count,
+				credits);
 }
 
 static int calc_rw_credits(struct smb_direct_transport *t,
 			   char *buf, unsigned int len)
 {
+	struct smbdirect_socket *sc = &t->socket;
+
 	return DIV_ROUND_UP(get_buf_page_count(buf, len),
-			    t->pages_per_rw_credit);
+			    sc->rw_io.credits.num_pages);
 }
 
 static int smb_direct_create_header(struct smb_direct_transport *t,
@@ -1441,8 +1441,8 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 		smb_direct_free_rdma_rw_msg(t, msg,
 					    is_read ? DMA_FROM_DEVICE : DMA_TO_DEVICE);
 	}
-	atomic_add(credits_needed, &t->rw_credits);
-	wake_up(&t->wait_rw_credits);
+	atomic_add(credits_needed, &sc->rw_io.credits.count);
+	wake_up(&sc->rw_io.credits.wait_queue);
 	return ret;
 }
 
@@ -1720,9 +1720,9 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	 * MR invalidation.
 	 */
 	sp->max_read_write_size = smb_direct_max_read_write_size;
-	t->pages_per_rw_credit = smb_direct_get_max_fr_pages(t);
-	t->max_rw_credits = DIV_ROUND_UP(sp->max_read_write_size,
-					 (t->pages_per_rw_credit - 1) *
+	sc->rw_io.credits.num_pages = smb_direct_get_max_fr_pages(t);
+	sc->rw_io.credits.max = DIV_ROUND_UP(sp->max_read_write_size,
+					 (sc->rw_io.credits.num_pages - 1) *
 					 PAGE_SIZE);
 
 	max_sge_per_wr = min_t(unsigned int, device->attrs.max_send_sge,
@@ -1730,9 +1730,9 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	max_sge_per_wr = max_t(unsigned int, max_sge_per_wr,
 			       max_send_sges);
 	wrs_per_credit = max_t(unsigned int, 4,
-			       DIV_ROUND_UP(t->pages_per_rw_credit,
+			       DIV_ROUND_UP(sc->rw_io.credits.num_pages,
 					    max_sge_per_wr) + 1);
-	max_rw_wrs = t->max_rw_credits * wrs_per_credit;
+	max_rw_wrs = sc->rw_io.credits.max * wrs_per_credit;
 
 	max_send_wrs = smb_direct_send_credit_target + max_rw_wrs;
 	if (max_send_wrs > device->attrs.max_cqe ||
@@ -1766,7 +1766,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	t->new_recv_credits = 0;
 
 	sp->send_credit_target = smb_direct_send_credit_target;
-	atomic_set(&t->rw_credits, t->max_rw_credits);
+	atomic_set(&sc->rw_io.credits.count, sc->rw_io.credits.max);
 
 	sp->max_send_size = smb_direct_max_send_size;
 	sp->max_recv_size = smb_direct_max_receive_size;
@@ -1777,7 +1777,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	cap->max_send_sge = max_sge_per_wr;
 	cap->max_recv_sge = SMBDIRECT_RECV_IO_MAX_SGE;
 	cap->max_inline_data = 0;
-	cap->max_rdma_ctxs = t->max_rw_credits;
+	cap->max_rdma_ctxs = sc->rw_io.credits.max;
 	return 0;
 }
 
@@ -1911,11 +1911,11 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 	pages_per_rw = DIV_ROUND_UP(sp->max_read_write_size, PAGE_SIZE) + 1;
 	if (pages_per_rw > sc->ib.dev->attrs.max_sgl_rd) {
 		ret = ib_mr_pool_init(sc->ib.qp, &sc->ib.qp->rdma_mrs,
-				      t->max_rw_credits, IB_MR_TYPE_MEM_REG,
-				      t->pages_per_rw_credit, 0);
+				      sc->rw_io.credits.max, IB_MR_TYPE_MEM_REG,
+				      sc->rw_io.credits.num_pages, 0);
 		if (ret) {
-			pr_err("failed to init mr pool count %d pages %d\n",
-			       t->max_rw_credits, t->pages_per_rw_credit);
+			pr_err("failed to init mr pool count %zu pages %zu\n",
+			       sc->rw_io.credits.max, sc->rw_io.credits.num_pages);
 			goto err;
 		}
 	}
-- 
2.43.0


