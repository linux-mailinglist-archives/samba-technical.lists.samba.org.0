Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75322B1CB0F
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:37:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pNm6YCD26g+5a8cfwPiXSQbw6NjKF3azrhMMXQFPv14=; b=TFiqnGqHDjCjNXHQgfCVKCswf6
	5rFgTnpswUtj2MyZ9I5vX+Jur84AK1uEGc4ApBxOZVEdyHtG+kjE56EAVfYkQznHevV0eR33K0dVj
	WCXS0q4kiQQxS7ETLbxyQfNgdLM8XtrW84bgrXOVUGHB7xueze6+7cegGHags9DCGyPTP8zrhhC/w
	T4HiLlXDsM+yyYH2dmXFLYntcLFv6EMizUBpIT4rvHzJ/HxoXi8iJIHNKeokEsRX2pNI7Gxh9ss2S
	4iDXrPjPcSHl3WT9hAWwHKf+wqQ+mXHEy8759QWe66zjjWzA51wV1whLAX5eYSJetEXC7QF6cMOS5
	Xv7rzJiQ==;
Received: from ip6-localhost ([::1]:20176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji55-00ERku-Nz; Wed, 06 Aug 2025 17:37:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26430) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4T-00ERZe-Sh
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:37:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=pNm6YCD26g+5a8cfwPiXSQbw6NjKF3azrhMMXQFPv14=; b=arDByWanDn17VOu9Kx0sQT+orT
 PjJZ6+170+MhS+81bdGNZ8xdfVEMAP3njlbtqPaJmao0lfv4VqlcSvI0x7UHqSW4PgqOyfQ6ZMNQI
 apt8ihK4MiK/x1upF96lsh4ha5xiUBvpVIhYnmMiEky/3rS2acUbSLhFgEDCW8lKBU99hRDfT5UaH
 lfUUsL4ng4fNihko1g4jLMyKnJW3Tcb/6r4d+JyJVUSF+F7amwdy2HbOsTi2GtjFoCD+JmPLo/L+e
 2sGQGugzmwyDkaIAzKNaqh1gQB/U6v7kRJXZvLhOXG1M/XFluHpV2FAeGgIY6jjphKM6915gZT4x4
 i0BZQtAqYbv4R5jUzEwOyY0tVSVdGzypvchONJfsAySC2J2FP0mlpaj9EzQbdsAUWd3V9BITvUAi2
 SuHxKz9a2as6xaBkaxWlRa/fe4mOb+4iy6fwaYcieIxzwen3awBCqoR3635mETrdRw0E1g26S8zIS
 PxOMKz1k0Gz2YZOKKg3TcWem;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4P-001OZG-10; Wed, 06 Aug 2025 17:36:57 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 06/18] smb: smbdirect: add smbdirect_socket.{send,
 recv}_io.mem.{cache, pool}
Date: Wed,  6 Aug 2025 19:35:52 +0200
Message-ID: <dbfc561167f09c006e80c55b5e20c242723403c7.1754501401.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754501401.git.metze@samba.org>
References: <cover.1754501401.git.metze@samba.org>
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

This will be the common location memory caches and pools.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 4660c05c358f..3c4a8d627aa3 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -39,6 +39,20 @@ struct smbdirect_socket {
 
 	struct smbdirect_socket_parameters parameters;
 
+	/*
+	 * The state for posted send buffers
+	 */
+	struct {
+		/*
+		 * Memory pools for preallocating
+		 * smbdirect_send_io buffers
+		 */
+		struct {
+			struct kmem_cache	*cache;
+			mempool_t		*pool;
+		} mem;
+	} send_io;
+
 	/*
 	 * The state for posted receive buffers
 	 */
@@ -52,6 +66,15 @@ struct smbdirect_socket {
 			SMBDIRECT_EXPECT_DATA_TRANSFER = 3,
 		} expected;
 
+		/*
+		 * Memory pools for preallocating
+		 * smbdirect_recv_io buffers
+		 */
+		struct {
+			struct kmem_cache	*cache;
+			mempool_t		*pool;
+		} mem;
+
 		/*
 		 * The list of free smbdirect_recv_io
 		 * structures
-- 
2.43.0


