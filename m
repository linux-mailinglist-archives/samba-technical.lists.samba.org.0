Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3BC1AAA2
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:27:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=K22/MaNUFQMtuynkcFYrSuOsdhjg8smb1dCQfW679i4=; b=FeEIpN+PW9qn29EzaZx2RXg0xz
	nJZhMjxxjNHLa910CAUPprhxRiWMuWEnzXrapp+yj8P2vQCIX8LhGEkqUpbKsAc9Fhl3m61bMvlJa
	VF6FBLsCSDSYiK9zZz6W9tl+pNU4pGQpBE3cd95/fk7/STDQX6GBHEQzdsl3efpKfo/JTz+YoaXEO
	+tMfvX+5uYiEG5OGNpTKAixIrPwm72zVO76/QmE0GKWNWLOrYWBnBoe8duaqOrsh0iZzrbP2n5dFh
	pntDLnjXkLVMWZXDCsr5NsxwzNrWrvkdQtWpjLG5y4XMxkylZmuXi6fHUmYqhehQU+MkL6Yzb+iGT
	lH0iNRXA==;
Received: from ip6-localhost ([::1]:23574 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Cx-0096ZA-Dq; Wed, 29 Oct 2025 13:27:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31684) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6A1-0095hx-Mv
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=K22/MaNUFQMtuynkcFYrSuOsdhjg8smb1dCQfW679i4=; b=KWVwjW2P7QPGYdndXczp7YOH4T
 dHGhmV4PyNiJo29YyXteZnqqyYgg+VCIy9lVDjHXD0RfNNkfIxC5MFsmLXp+f2oUK2Yod/UDULjT8
 kMTStFyoRGKDn4FHdr9jCDuvJ4Uti271N/Hm/QRRkEnGiVMJVYBEMbR7S/kjHXAynIK+UG/siOsd7
 p/yHq+I71GCtsoeCUIHTu0/d866p6bzwm+1Kr77wjaygs3AN7YaKga3TvQc1OOcM5+2sVFzsrkogq
 JXiHwEuUXnRo0FOBhTtnd5X+tUJWCL1e5bokxO3b862QbrUEfVczWmcODWrF+joyMC5X3Kw3O2YRc
 kkA7Q+k0d1wvdxMcJpzKE551WTwezDopUAYZ4r2KqUcokCkdHJN/MkjH2gPSXTWu68YPMAVFys81F
 XfaI45LU0wb3YipcJ6kUuNgeHKkV8uIfD99y/0QPNmpP1DJTg4w6M5xfmLeoziGQD9PAdkMBeN171
 ShfYJMbpayXBj+eGbwj9npXe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69y-00BbTS-0n; Wed, 29 Oct 2025 13:24:18 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 018/127] smb: smbdirect: introduce smbdirect_socket.{send,
 recv}_io.mem.gfp_mask
Date: Wed, 29 Oct 2025 14:19:56 +0100
Message-ID: <07585615abd50502f1ef6a21d2dac4c04f6026a6.1761742839.git.metze@samba.org>
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

This will allow common code to be split out while still using the
gfp_mask currently used.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 65b21b65596f..a25bf92cfff7 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -150,8 +150,9 @@ struct smbdirect_socket {
 		 * smbdirect_send_io buffers
 		 */
 		struct {
-			struct kmem_cache	*cache;
-			mempool_t		*pool;
+			struct kmem_cache *cache;
+			mempool_t *pool;
+			gfp_t gfp_mask;
 		} mem;
 
 		/*
@@ -204,8 +205,9 @@ struct smbdirect_socket {
 		 * smbdirect_recv_io buffers
 		 */
 		struct {
-			struct kmem_cache	*cache;
-			mempool_t		*pool;
+			struct kmem_cache *cache;
+			mempool_t *pool;
+			gfp_t gfp_mask;
 		} mem;
 
 		/*
@@ -479,6 +481,8 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_DELAYED_WORK(&sc->idle.timer_work, __smbdirect_socket_disabled_work);
 	disable_delayed_work_sync(&sc->idle.timer_work);
 
+	sc->send_io.mem.gfp_mask = GFP_KERNEL;
+
 	atomic_set(&sc->send_io.lcredits.count, 0);
 	init_waitqueue_head(&sc->send_io.lcredits.wait_queue);
 
@@ -489,6 +493,8 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	init_waitqueue_head(&sc->send_io.pending.dec_wait_queue);
 	init_waitqueue_head(&sc->send_io.pending.zero_wait_queue);
 
+	sc->recv_io.mem.gfp_mask = GFP_KERNEL;
+
 	INIT_LIST_HEAD(&sc->recv_io.free.list);
 	spin_lock_init(&sc->recv_io.free.lock);
 
-- 
2.43.0


