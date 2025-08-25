Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C022B34C40
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=X+IgLJWutN5KZwrz7YVVcXzmetkmDFKU+K7lOErb8DI=; b=3iAIJZEeI/PMMawqPX+Zn7aVvi
	cIKlyK4ETpfRUrRJjmpxUMCuyseBXeBR/ScHftqF0ps4Tq9caGWdK7VDtwRDPHpjt21rFPrKXvF+J
	xKGDtnqBxoMt/dft/97rSS6rWoGtC3H6UsQUcY/+vMXmYp/JVVh5FNdKkMmjGbtEPyrLfBt1WvkCI
	EXXhlWiB2qhSusswalwSoSsrg0mpg3Rbo03Y8mK9aUwXgOcPB9YpcBC6uAo6LUBy895Ir83ELnF7B
	TV5HHuIo33Rse6V2Z5Bcl5JgPh9NmBFM0jmny/+GYEnIRyD47Xfq2gqJfpxmZa9YkYOuOzY/QEWMA
	xWvszh3Q==;
Received: from ip6-localhost ([::1]:20066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe23-000LXe-C4; Mon, 25 Aug 2025 20:43:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24834) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1c-000LQJ-4c
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:42:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=X+IgLJWutN5KZwrz7YVVcXzmetkmDFKU+K7lOErb8DI=; b=UAeuNGqmMl62LcgLo17+iCTfJV
 FbNK9GRqWOxIrYtXgC/WrGP8HUvdoXmdevGbGP1gntbSpc391YTasyRzuGSABl6SluDVDfxnu2ZZd
 UTwutO76FVrmoMFR8S+ep/r5sBovXSIGaY+2nbhS/dsCQhxbNAZ5a02CBzDJQ6isvuGHOOtVSzxWP
 Qd9zpa7dq0MyQ01aQVGuVIeA7ARuQ+bwzYwDuLKEcaQqN6zvqlOqaPvEncoPZ7/3muIpE7ysAvuNN
 dcmJ1OZifUFdcWIh2NIMFbgE3H2Kfa3KohueFjOfyRKE04OLRcTfMf8QDPQKRe+34FONgYVtnr102
 5jrEDHSauP1UmKVAoS1vfuX2eABB3hjq1FQqpf57Cfp+bwzWX3rLJVEwtlvsRAxfsDcM6o9vxc1Tg
 I8IDLHsxqwkUgvlSM6SyS9SgBhqPZ08X9Bsdm8U0LbxyZyF+ZHOAwEqeZOizKaSJZIVyBfe+269Vj
 qxEkRfV/PWYqNfAffDe4S3yd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1Y-000jL2-0W; Mon, 25 Aug 2025 20:42:40 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 004/142] smb: smbdirect: introduce
 smbdirect_socket.send_io.pending.{count, wait_queue}
Date: Mon, 25 Aug 2025 22:39:25 +0200
Message-ID: <2512d1dd03eec49674f317f9b78fc0bee60c2e60.1756139607.git.metze@samba.org>
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

This will be shared between client and server soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 79eb99ba984e..bfae68177e50 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -54,6 +54,14 @@ struct smbdirect_socket {
 			struct kmem_cache	*cache;
 			mempool_t		*pool;
 		} mem;
+
+		/*
+		 * The state about posted/pending sends
+		 */
+		struct {
+			atomic_t count;
+			wait_queue_head_t wait_queue;
+		} pending;
 	} send_io;
 
 	/*
@@ -123,6 +131,9 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 
 	init_waitqueue_head(&sc->status_wait);
 
+	atomic_set(&sc->send_io.pending.count, 0);
+	init_waitqueue_head(&sc->send_io.pending.wait_queue);
+
 	INIT_LIST_HEAD(&sc->recv_io.free.list);
 	spin_lock_init(&sc->recv_io.free.lock);
 
-- 
2.43.0


