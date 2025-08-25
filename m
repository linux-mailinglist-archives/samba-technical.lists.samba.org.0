Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CBDB34C51
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:43:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qILDkUkeLcVNZlyX80a+XatELZsjB73tpMiwDQpttXY=; b=bP/sZhw2SgEQFNtpxj94/txUri
	WkqmyBs1c/aIWJUjIdmKpCOQaldSRn7zpslQechD6rThZ8cHSkrMvCH20aFXodXbAUMnlhj4No6qj
	6/2TMMsEm27ONlDts5IESH2nguPCNVrbq5K4mUqbiYeCk7sXsATRAcmuEGTWklykZM0Mlm4m4mIIY
	MWU1I0NQAgoeqRW3GhaIrnlX1DtAsqMKcouUzk6vFNBsr7Fdgt4CuOK2mY7cZ8hIu5FFHpl+7uc3O
	+IYYJBnTb3YXZdz1nQX7QxPJJVbiC4xevgVENh8WAi2YB1LOkUwN+bia7LXZeWsNQ5t44g3pvvbkV
	4rX9PDvw==;
Received: from ip6-localhost ([::1]:59150 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe2c-000Ljn-Pk; Mon, 25 Aug 2025 20:43:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35600) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe23-000Laq-9s
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:43:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=qILDkUkeLcVNZlyX80a+XatELZsjB73tpMiwDQpttXY=; b=oDeMS1dvxsBQwnTfSZyPDQ7Uni
 t5Kw28Gigw3ilBhRG0VLwmbrOZGDBhYMXZrk+Icdd2XthfVYrNDLhQu4EaaF9FdY17t+2BCujr5L8
 i2BMwitHbFmXyS5AWEVn1tO2wlfQ1bceJvRQWiv19zHzchYV3K4P+Th5Z52praVjjiX1/+ar929AS
 oPhxkrnRjf4EZXNH+b7gH9m4fd8+s7BQN22r6LLPi5Pfps/FXlOqTP6fKJmQb+ECAak7JmlHfm0Rm
 Z1AyvvX8kYys27exkvVVE9z897CKIMIYG8P494BYCi1JuoBsQlgt4y0X/h5Zh9GIEBOGidpCq1MCH
 ANwj0QAaHc0oS5nA/3zKVU1Lfn2dXpxniKXrTlwVhLIrvcEIuIV1mzFtMusrgzD+gskqfGlziQJ8P
 mGPOL45WdJKHitV7NgqElkP++b++hWS0hcOA+XZNrT3j8WEAOsdE0TDp2MN6yDu9ZAC1LvCAeojjE
 UmClZx8K5/ow5jq3put0BQlU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe21-000jRr-2x; Mon, 25 Aug 2025 20:43:10 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 007/142] smb: smbdirect: introduce
 smbdirect_socket.rw_io.credits
Date: Mon, 25 Aug 2025 22:39:28 +0200
Message-ID: <7517f6b194ded09f77e25f2e77933c2393a638a3.1756139607.git.metze@samba.org>
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

This will be used by the server to manage the state
for RDMA read/write requests.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index ef6f330ba7d4..001193799e16 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -129,6 +129,27 @@ struct smbdirect_socket {
 			bool full_packet_received;
 		} reassembly;
 	} recv_io;
+
+	/*
+	 * The state for RDMA read/write requests on the server
+	 */
+	struct {
+		/*
+		 * The credit state for the send side
+		 */
+		struct {
+			/*
+			 * The maximum number of rw credits
+			 */
+			size_t max;
+			/*
+			 * The number of pages per credit
+			 */
+			size_t num_pages;
+			atomic_t count;
+			wait_queue_head_t wait_queue;
+		} credits;
+	} rw_io;
 };
 
 static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
@@ -151,6 +172,9 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_LIST_HEAD(&sc->recv_io.reassembly.list);
 	spin_lock_init(&sc->recv_io.reassembly.lock);
 	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
+
+	atomic_set(&sc->rw_io.credits.count, 0);
+	init_waitqueue_head(&sc->rw_io.credits.wait_queue);
 }
 
 struct smbdirect_send_io {
-- 
2.43.0


