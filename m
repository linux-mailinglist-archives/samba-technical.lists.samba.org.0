Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C813FB34C9A
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:49:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=kwt9GwDKdKbWfXjCS+P0KCEr39rZN+WWgufwE0zSUM0=; b=3J8/gGNtaB1tXyoADjob7cEev7
	M3LyE6Iu3XYdzp5pQr3ota6UliuZRBHBQ5ceQD6Snm/7hcfAa0mqxdnFVtuwbSUNuVtoWK72JlYNM
	zGWNgcBkWMkK7QKXwYg7j1GcpGdK3MZgSn6fANJlTLwQxC47MSCkEgGoy05f7FcBsA6EeEKaQx4HX
	ewoYrQ+PeF/Ey4Rrsqt6CF4x5OPOz1O6JiaG6T/KfFfiG6ECHrfycCeKpLtx+85Sk7wFlZ18NSN+G
	ltY+verYGsV03ctE7xsz0CeZg0L0p8SFelgfyBMqCEYjla/SriGpeKDlYsdZwR64bI23UUo5N6htR
	dnXksiRw==;
Received: from ip6-localhost ([::1]:28704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe7g-000Ns8-P2; Mon, 25 Aug 2025 20:49:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49510) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe6F-000NJg-Rm
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=kwt9GwDKdKbWfXjCS+P0KCEr39rZN+WWgufwE0zSUM0=; b=PASJKTEHDT3qJxJFbKY2bCnOr1
 z+Q6bD+pzXNehIRDfG7qqO+iM5HNy4OfhOgRIOmJiRd9w0J0ihZy87QNwZQrrTRK833DGz4OPDGHn
 KXDzAdI5ebtqTa4G6eoEh7V2ZfFrZZJsVNtyZ9N7DzhSoEmn/DWP92X/80LyHqu/B1lzlqPJGnL39
 jTApGqMatX10Plkd/ZHo4BrPZr/+8eA2iC+S20TN1vDPBAMZsm+N+D17fdy1vReCL19TvL4tVb750
 ZUQo/36iFhhrD+nqA/bn+r96oBaLjrH5OAcU8gHRXB78Ju++ywuYqvZnZVLI7fc6VmKu1SRHjSD4l
 TLVq3nw0snJIlFbBvNcPbXZeHgoJw9a6psU7i4WAdl5GX7INDLW8/0P2s3/iRc8F4G7gQecitpTOS
 6Y2Nofr0eKTH088fgzzreNf71VXHWA3nIM2Y1RFnYeOjNmYCRLc27IOPRPgBpK3zJcSYTiXfZLYu3
 K7sRsELOywnzfbHk4lAE6IIf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe6B-000kL8-2g; Mon, 25 Aug 2025 20:47:28 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 034/142] smb: client: limit the range of
 info->receive_credit_target
Date: Mon, 25 Aug 2025 22:39:55 +0200
Message-ID: <52664b62bf651170b13b2a88f7d157c2fec777b5.1756139607.git.metze@samba.org>
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

This simplifies further changes...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 8 +++++++-
 fs/smb/client/smbdirect.h | 2 +-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index b1ecfdbbc67d..e567fdc6e223 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -456,6 +456,7 @@ static bool process_negotiation_response(
 		return false;
 	}
 	info->receive_credit_target = le16_to_cpu(packet->credits_requested);
+	info->receive_credit_target = min_t(u16, info->receive_credit_target, sp->recv_credit_max);
 
 	if (packet->credits_granted == 0) {
 		log_rdma_event(ERR, "error: credits_granted==0\n");
@@ -560,9 +561,10 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	struct smbdirect_recv_io *response =
 		container_of(wc->wr_cqe, struct smbdirect_recv_io, cqe);
 	struct smbdirect_socket *sc = response->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct smbd_connection *info =
 		container_of(sc, struct smbd_connection, socket);
-	int old_recv_credit_target;
+	u16 old_recv_credit_target;
 	int data_length = 0;
 	bool negotiate_done = false;
 
@@ -623,6 +625,10 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		old_recv_credit_target = info->receive_credit_target;
 		info->receive_credit_target =
 			le16_to_cpu(data_transfer->credits_requested);
+		info->receive_credit_target =
+			min_t(u16, info->receive_credit_target, sp->recv_credit_max);
+		info->receive_credit_target =
+			max_t(u16, info->receive_credit_target, 1);
 		if (le16_to_cpu(data_transfer->credits_granted)) {
 			atomic_add(le16_to_cpu(data_transfer->credits_granted),
 				&sc->send_io.credits.count);
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 693876f2d836..6f18e4742502 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -54,7 +54,7 @@ struct smbd_connection {
 	enum keep_alive_status keep_alive_requested;
 	int protocol;
 	atomic_t receive_credits;
-	int receive_credit_target;
+	u16 receive_credit_target;
 
 	/* Memory registrations */
 	/* Maximum number of RDMA read/write outstanding on this connection */
-- 
2.43.0


