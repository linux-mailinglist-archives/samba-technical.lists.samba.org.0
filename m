Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E9EB34C9C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:49:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=HWy1icnb0qPGeGU2AdITnFC8gqAaesYL3/AP3Uovbvs=; b=oFvN3w4i+2zKLcwxBvePIZMbJh
	RamfCdjaINeCkUZIVfH8xXIFixKKh2CrznK1PYyjnZS4yNzS5ul6X5sPvf/nk72yywgq62KLhd/gm
	iM58fuaceIOkN+g7lDUbRzs4T4Q2fbvSSvgDNkZEKHR4qWaGxOVpsihZHTZyATh+T1q9BzU8/sBpg
	oDq1rmLAYZxAkEAItlKEmr2tRrHIUwGcedt1cZSQYn6LkEzzZl0lkmrqVC1UpXNd3EkPqKftG9Avh
	HXgTeVKWNObmQydh1+kWFFky86XpC0oBPiKQ9W7fA7LORwA4VdF7NeY94MS473taMznOdTtn2baDw
	SwdXmWzQ==;
Received: from ip6-localhost ([::1]:51836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe7w-000Nv8-Uw; Mon, 25 Aug 2025 20:49:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49206) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe6O-000NNg-3u
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:47:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=HWy1icnb0qPGeGU2AdITnFC8gqAaesYL3/AP3Uovbvs=; b=awGpvwUs71xQ5CPgxAb0TEtEET
 KuHQZU2ooxDoKjHxiNJLxKgyV6xAMM+jHEywKKYary2C6qAJ9BU/IM/rG4sYuoO4mRwMtlouzYsht
 JNsnrDBkO1LTCW5GJQYIScuKNG1Y5F+aRFi7OPEy1pAFlZ5I5yRQSa3deHMTYdcL5DZ3k+1pq896e
 oGgnAkTLagfL5HmpTQm5O6Fb8YGc/6CWkP4Pt01IbPhnRHvnCWMAz+xo337rj93WYODuCzcDVte62
 sDygIdCHXjFOVns8UvAqdOBP84cYLjR26+2XICqF9CdFehDlfShviGuc8ne5gTi6EPY14/Oe3eVia
 TD88MozpNoNzesSXReVRengZxTuvCNyZU8XL9KmwpbNpUrJmywkxWtvxIhabI+sFeZIEzmj9xF/Yh
 WjlTuZ7pn3rrYXDRQFyBdcPEAzX/YzIcx5wuH1k88W+rMztqHz8GYL68WnYvqE9RpT2yaphC+Xu0M
 v3kkknkzbPQ0plPLPSh86FrQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe6L-000kMc-2q; Mon, 25 Aug 2025 20:47:38 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 035/142] smb: client: count the number of posted recv_io
 messages in order to calculated credits
Date: Mon, 25 Aug 2025 22:39:56 +0200
Message-ID: <3ed035f8387b1ff63ec960b39421b422412aac02.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

(At least for me) the logic maintaining the count of posted
recv_io messages and the count of granted credits is much easier
to understand.

From there we can easily calculate the number of new_credits we'll
grant to the peer in outgoing send_io messages.

This will simplify the move to common logic that can be
shared between client and server in the following patches.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 30 ++++++++++++++----------------
 fs/smb/client/smbdirect.h |  4 +---
 2 files changed, 15 insertions(+), 19 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index e567fdc6e223..d68d95d1ef37 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -465,6 +465,7 @@ static bool process_negotiation_response(
 	atomic_set(&sc->send_io.credits.count, le16_to_cpu(packet->credits_granted));
 
 	atomic_set(&info->receive_credits, 0);
+	atomic_set(&info->receive_posted, 0);
 
 	if (le32_to_cpu(packet->preferred_send_size) > sp->max_recv_size) {
 		log_rdma_event(ERR, "error: preferred_send_size=%d\n",
@@ -506,7 +507,6 @@ static bool process_negotiation_response(
 
 static void smbd_post_send_credits(struct work_struct *work)
 {
-	int ret = 0;
 	int rc;
 	struct smbdirect_recv_io *response;
 	struct smbd_connection *info =
@@ -534,14 +534,10 @@ static void smbd_post_send_credits(struct work_struct *work)
 				break;
 			}
 
-			ret++;
+			atomic_inc(&info->receive_posted);
 		}
 	}
 
-	spin_lock(&info->lock_new_credits_offered);
-	info->new_credits_offered += ret;
-	spin_unlock(&info->lock_new_credits_offered);
-
 	/* Promptly send an immediate packet as defined in [MS-SMBD] 3.1.1.1 */
 	info->send_immediate = true;
 	if (atomic_read(&info->receive_credits) <
@@ -621,6 +617,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 				sc->recv_io.reassembly.full_packet_received = true;
 		}
 
+		atomic_dec(&info->receive_posted);
 		atomic_dec(&info->receive_credits);
 		old_recv_credit_target = info->receive_credit_target;
 		info->receive_credit_target =
@@ -921,10 +918,16 @@ static int manage_credits_prior_sending(struct smbd_connection *info)
 {
 	int new_credits;
 
-	spin_lock(&info->lock_new_credits_offered);
-	new_credits = info->new_credits_offered;
-	info->new_credits_offered = 0;
-	spin_unlock(&info->lock_new_credits_offered);
+	if (atomic_read(&info->receive_credits) >= info->receive_credit_target)
+		return 0;
+
+	new_credits = atomic_read(&info->receive_posted);
+	if (new_credits == 0)
+		return 0;
+
+	new_credits -= atomic_read(&info->receive_credits);
+	if (new_credits <= 0)
+		return 0;
 
 	return new_credits;
 }
@@ -1133,10 +1136,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 					    DMA_TO_DEVICE);
 	mempool_free(request, sc->send_io.mem.pool);
 
-	/* roll back receive credits and credits to be offered */
-	spin_lock(&info->lock_new_credits_offered);
-	info->new_credits_offered += new_credits;
-	spin_unlock(&info->lock_new_credits_offered);
+	/* roll back the granted receive credits */
 	atomic_sub(new_credits, &info->receive_credits);
 
 err_alloc:
@@ -1822,8 +1822,6 @@ static struct smbd_connection *_smbd_get_connection(
 	init_waitqueue_head(&info->wait_post_send);
 
 	INIT_WORK(&info->post_send_credits_work, smbd_post_send_credits);
-	info->new_credits_offered = 0;
-	spin_lock_init(&info->lock_new_credits_offered);
 
 	rc = smbd_negotiate(info);
 	if (rc) {
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 6f18e4742502..b5eeea4ddcf1 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -46,9 +46,7 @@ struct smbd_connection {
 	struct smbdirect_socket socket;
 
 	struct work_struct post_send_credits_work;
-
-	spinlock_t lock_new_credits_offered;
-	int new_credits_offered;
+	atomic_t receive_posted;
 
 	/* dynamic connection parameters defined in [MS-SMBD] 3.1.1.1 */
 	enum keep_alive_status keep_alive_requested;
-- 
2.43.0


