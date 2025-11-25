Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5B7C86699
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/nmrFopcBFu/CiIRR8O6DD/+7yBidxHrwdPAAiVXnuU=; b=k0rEZeA1ALilEN1yhutQpBPKeb
	zK0sJy2lBUhvOW+4tDXhJ+kvDG+U7pygSSeqAntOoMoCse/MyVXh8K7zdXocgC+A66aTXlkURu8Zi
	kY2NUGT4xDC0Vtij3M/1e1My4Zg+K3g7BmZkOTj6HwYQ85RK0HhlPwPQS7psvFtVVS1VSKddWt89b
	MEdlyyFn28bpICnVOLvi8o3yAIv2h0xwDYzHZ33j8OUiqH94e3SUWIV1Qu2rpXJRIrKeWjizZuNkK
	r2QWp0fPeR4Vw4YeqmzNk8IkqRhzmzKF+kinnNPI4in6oHL2LpLiLpnC3ITJrg83W/ksEwj2WF58X
	TATt8iNA==;
Received: from ip6-localhost ([::1]:61866 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxMd-00D88p-2M; Tue, 25 Nov 2025 18:02:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44182) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJR-00D78s-FW
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:59:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/nmrFopcBFu/CiIRR8O6DD/+7yBidxHrwdPAAiVXnuU=; b=tmb/b9pCooSxYzbdHbp0PgJSWs
 ZYSVw0UdeggjuMH78ZSAxOQO1+d69XvT+BFQHUIyfqXNTjjpbU4RqQSFPmWdiajdnasAS7FBrg84K
 uKLqm/e2E5BuK5xOQqCJiHQv3bbtcglNUuhFrOfHC22CiZhVNpr412yIU+AiBtNxVXMc0Ns1H2iVG
 gQkziWAWC2L2KJHLRpQzlzLL5UDsGnd3/ioPNaFAuI542LIrqdMXecctuQLajiZYAFQrYGXo+mNAT
 0i4g9l1lQIg2j6zYMZm8Trekq8f8POSSK+BE0fSRrmbpsMZH8v8BSPaE1c9+C3kGdlwied+ssjTdp
 TRmEuDz+r3dDEQsP5GI02LNyMDZwG4ZE9LuUmMlDIREqdbJnOccKIs8u/z5kOxb+JfiEBWntCPc6n
 0jq9tMjXUaPGRhbeawb4+goB1+dPlq+6FsSdenqzt9Zz127REYKcXda15lZoz8ojnjqxM9JpKDRsP
 mtbO8L2DbQErHJu5IY6I7xGa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJN-00Fcnz-2y; Tue, 25 Nov 2025 17:58:46 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 021/145] smb: smbdirect: introduce smbdirect_socket.{send,
 recv}_io.mem.gfp_mask
Date: Tue, 25 Nov 2025 18:54:27 +0100
Message-ID: <78c571cb638f0e308a06e1c4d8eba55ebbeccf93.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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
index f56f2b037a69..5564cf9d999f 100644
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
@@ -481,6 +483,8 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_DELAYED_WORK(&sc->idle.timer_work, __smbdirect_socket_disabled_work);
 	disable_delayed_work_sync(&sc->idle.timer_work);
 
+	sc->send_io.mem.gfp_mask = GFP_KERNEL;
+
 	atomic_set(&sc->send_io.lcredits.count, 0);
 	init_waitqueue_head(&sc->send_io.lcredits.wait_queue);
 
@@ -491,6 +495,8 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	init_waitqueue_head(&sc->send_io.pending.dec_wait_queue);
 	init_waitqueue_head(&sc->send_io.pending.zero_wait_queue);
 
+	sc->recv_io.mem.gfp_mask = GFP_KERNEL;
+
 	INIT_LIST_HEAD(&sc->recv_io.free.list);
 	spin_lock_init(&sc->recv_io.free.lock);
 
-- 
2.43.0


