Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAEBB34C63
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Zb6gTdOo3PGEqJtIe5GOgjpoBu5JolByNmjXIVTR9WA=; b=ZEPQCTCBu+y2pf25uXU6eXByNP
	mEMEdr2GRgW4ChdGZ+c+Si42seer6wywmL2i7+Y9dx7w6lTfkcOitM6SmZ3aMzsL10xfANrsA4TgQ
	BFn3q9DmGaEcjY+uSYU8q9aEUs7/nRH9zysoqIqHK4eZ8lxOP93N+DYBBVJr5h3yEvpOzvYgTwbYM
	11g+0hMsmo5pi2lkTxZE2za8nO40PcngPp5ijADmBEilZ2ymHPPsubctlLl5lQ+xmM23GUQAJ2F/h
	w5LaGdwBXkALQp93yy9/JxkiXvmRDy90M32T+XqgT+1YA0ikeWkhEdQA2t4wNg607v9RyWsoZ52PJ
	3URoipXw==;
Received: from ip6-localhost ([::1]:37694 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe3n-000MET-Te; Mon, 25 Aug 2025 20:45:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45720) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3A-000M3S-Ld
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:44:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Zb6gTdOo3PGEqJtIe5GOgjpoBu5JolByNmjXIVTR9WA=; b=utLjKQkru7eYvjmaRwuW3POwI2
 4Ofe+H8qAjeRj9OCGhnGwXGkY3CyW3GFqums98/S2EIGfe4aTXMpetBNnqMPfS7i+WhNLxB+6RK7u
 abefyFKI8V5sVgAB/19V2cR1CsBNeicQoDWQ6wOGsFL6d7q+oOvEkKUM9PVViJZSvyp6IZsXQX+cY
 aRQ21vYZ+XF0/KUOz8L3jgAt92udm9+d37nH4IRvjIvbWVh9KKAVe6AqnAoa3eAkklhYar7KWqJnR
 gfbwWxaldMMCpdb8YT0+pdeqrhQwFm5GlvmRBpEDzgqdflZT3QNs1xA9tPR5hOv/nSqjZoKATQdK8
 itTdgVXTfFqcMIHhvN0U1EfZHJQWY5rJj5oCXdTg8/omDjgMCFIFeNyr5MvdPjuQO5OkdgUN/pM5i
 E3ZENGRFGfNrggOaUDeEDPTSymTrFYfnr+VA2rJIeKsSykphzyXshhTy8dcFwtiXEukxXW00or3yS
 ezkEDFihSjrbYrQ2G7s8nfIU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe35-000jcs-2Q; Mon, 25 Aug 2025 20:44:15 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 014/142] smb: smbdirect: introduce
 smbdirect_socket.statistics
Date: Mon, 25 Aug 2025 22:39:35 +0200
Message-ID: <b77a2ad958e810525f4cb2f816659ddf6284c09a.1756139607.git.metze@samba.org>
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

These will be used by the client and maybe shared code in future.

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
index fade09dfc63d..5df0143ccd6a 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -188,6 +188,17 @@ struct smbdirect_socket {
 			wait_queue_head_t wait_queue;
 		} credits;
 	} rw_io;
+
+	/*
+	 * For debug purposes
+	 */
+	struct {
+		u64 get_receive_buffer;
+		u64 put_receive_buffer;
+		u64 enqueue_reassembly_queue;
+		u64 dequeue_reassembly_queue;
+		u64 send_empty;
+	} statistics;
 };
 
 static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
-- 
2.43.0


