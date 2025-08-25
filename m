Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E7BB34C55
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=avpXg+3zxWxFK1KwidziCd4CJjjfXRYVUt4jeexiKW4=; b=tml1DCbkxQ9puBY9KRgoOtHTFm
	SVxkZiKTOQH6OaiJ8W+wgsvjyThOdZ9IqrOxlzQRZDx/JquJn8IaaORMxmgZfnaQTlaydwbXzqzsh
	XLhHHHqH0jsp+9DX9Pgbf1aXTa7z0jGAvFzmWmjtOoBiBRaDytzjKRNJH/qHBRSRZo+aJOVP+YE80
	97eg7b2D3pcEtXTp2OUxCBgzM3CbYhzBOgC4oRSwaV7/FBOdYg6PYRBQEg4h1yjqhzVpeujqM9KPU
	0uajhxQdP2ZMXQCQplxK2a3NkluRRbM6DpXJA81oAghCIsw6gRqq/5fJjH2jVciNjkVRU0hzlq0LV
	jFJuwB6Q==;
Received: from ip6-localhost ([::1]:36670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe30-000Lu9-E7; Mon, 25 Aug 2025 20:44:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43312) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2M-000Lhz-Cv
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=avpXg+3zxWxFK1KwidziCd4CJjjfXRYVUt4jeexiKW4=; b=nG2Lx/8Pm5Vw38M6w5JdBkIWQ3
 dOibJJTYsg4mL4HJrlKpHeM1sZRbCnNCTX7ZFaigCGSheT19ufryrBnkrMyoHL6pmDsY9gnfd3brg
 Wi3z0S91ZyZ0rDeyglQohcPK95usjrpfzT69BlRDGUDgaYdBM/yCCBAUojS4Rbdwf2YLJUEgXbVZ7
 QTA7ATICEi/UZU4FUDGKfhr2h1oUO5Ro9HhGxX36ubX/nsVIM4XqaUmXGQQ3pRObGMwLHN+gyII2/
 7JZoRfVVBlPu9OijRmrHc5HxGYycIYGKKv+4xhQ2NckXg1x+PKoCwCvDShOYpBbRu57MGI/7ZJ2Ax
 qwqBAGYoSnJq2vvx+AS/AztbztG4z/x3m5nOrHYckokgntM1e7bv1fx0kqTauqJPvvD43bjS8FN1o
 +sMSJQacR0bKDJ8A7ZmGCZc3wQU6yffsCUzAGgy1UwaSM3ClDR6E/Ce0gr/ke7Yab6mIf2H9/ZKZ3
 3MafPQQl9vrvoi1erfziGQ1z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2K-000jTu-0o; Mon, 25 Aug 2025 20:43:28 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 009/142] smb: smbdirect: introduce
 smbdirect_socket.recv_io.{posted, credits}
Date: Mon, 25 Aug 2025 22:39:30 +0200
Message-ID: <c21ba1ceab590332c45898ebddeae31b8ca5b1fa.1756139607.git.metze@samba.org>
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

This will be used by client and server soon in order to maintain
the state of posted recv_io messages and granted credits.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index ff7b9f20b1ac..09834e8db853 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -105,6 +105,23 @@ struct smbdirect_socket {
 			spinlock_t lock;
 		} free;
 
+		/*
+		 * The state for posted recv_io messages
+		 * and the refill work struct.
+		 */
+		struct {
+			atomic_t count;
+			struct work_struct refill_work;
+		} posted;
+
+		/*
+		 * The credit state for the recv side
+		 */
+		struct {
+			u16 target;
+			atomic_t count;
+		} credits;
+
 		/*
 		 * The list of arrived non-empty smbdirect_recv_io
 		 * structures
@@ -171,6 +188,10 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_LIST_HEAD(&sc->recv_io.free.list);
 	spin_lock_init(&sc->recv_io.free.lock);
 
+	atomic_set(&sc->recv_io.posted.count, 0);
+
+	atomic_set(&sc->recv_io.credits.count, 0);
+
 	INIT_LIST_HEAD(&sc->recv_io.reassembly.list);
 	spin_lock_init(&sc->recv_io.reassembly.lock);
 	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
-- 
2.43.0


