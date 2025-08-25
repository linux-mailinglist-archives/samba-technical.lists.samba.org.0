Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3AB34C6E
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:46:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5BqCYUrpiEon8qgR8F8WUh1vay5qHy1gvlrxclPA6dY=; b=MKbcmsgYByhG5t0fMMsGae+BQm
	HLY/VCVnNtU2PuMY+wD0LSwMkqE+x0zwMUDofmVjl0Llc/lynWPKnsadqabvTx1yzt6iJH5tJWN7k
	IKmUK9kgMELxrgRIXc4Y33dN7nO0sMTlEPBXyFCejfrlDc9uwrOJRvafoyjaU4Zjv3GkkAZ1+DeHI
	BU4lagmT5cBaLvFOGejCe/JTS0xVN5r1ew7byWO0woTj7kDLmfvl31/X8fUJ8yCYFv0wuwBSXbBmw
	A6nx0eaKTgzTqluKgyPhXb9VHDIvtIZvIONpLWByKoftScHxvqiCpNhEv0+4/K7OQBSHO9jnhSt8p
	ZrDQoq7w==;
Received: from ip6-localhost ([::1]:34700 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe4h-000Mbg-C5; Mon, 25 Aug 2025 20:45:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57622) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3i-000MGK-SH
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=5BqCYUrpiEon8qgR8F8WUh1vay5qHy1gvlrxclPA6dY=; b=I4OVhvIFsaE8cvohAWGYIUsrvN
 UD6x+68Pp9iwoCI73qpSt2zuL8NaP4LHM4IOm2LTJwuxVqUBCYbGiJxa9LOjCT3ioFGELNSSd8XT7
 NzDrAn7SvUyu4PpC+c5cpRjqXFuCDZMfKMDeukZR7KSUJ9dJk7MNfbrQlJ3zxyhdl+253mdbWmw/Y
 7C0dOOLtZkfNYTeRM6KRrO9uVEBbR+F0aUF1XTY2xxcFufRv7XZO3oRnxyhtPRDqV3Hnph1yHCVtf
 Rej7lhDi17lhLVkeSl+Zu5vw79mj/DeDC965JH4/kCH8R/ZRu1Di/d2c56+ycQyNHFlDcoIZp1eKz
 V3+p01YH6V0obLhX27w1suM+8bBMr2OYa0DyaSVksW8Y2OQKks0qFdMbLvEMPcCnCIEVAdaaTLyM0
 Us+4UK+lw9QKL1W0/qQpuK+T9V7wz+2YiBe8V46PhhAf3PqMX1P1nRG7wxmwn4KqHk1PncgLqJ3KU
 WT8lR4p3KRaHgSohAcUogGqC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3f-000jkP-36; Mon, 25 Aug 2025 20:44:52 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 018/142] smb: smbdirect: introduce smbdirect_socket.mr_io.*
Date: Mon, 25 Aug 2025 22:39:39 +0200
Message-ID: <5d6750d0fc47f974e356beb43f43d7cd7dc62e6f.1756139607.git.metze@samba.org>
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

This will be used by the client and will allow us to move to
common code...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 588501a0a706..350ccb362718 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -176,6 +176,44 @@ struct smbdirect_socket {
 		} reassembly;
 	} recv_io;
 
+	/*
+	 * The state for Memory registrations on the client
+	 */
+	struct {
+		enum ib_mr_type type;
+
+		/*
+		 * The list of free smbdirect_mr_io
+		 * structures
+		 */
+		struct {
+			struct list_head list;
+			spinlock_t lock;
+		} all;
+
+		/*
+		 * The number of available MRs ready for memory registration
+		 */
+		struct {
+			atomic_t count;
+			wait_queue_head_t wait_queue;
+		} ready;
+
+		/*
+		 * The number of used MRs
+		 */
+		struct {
+			atomic_t count;
+		} used;
+
+		struct work_struct recovery_work;
+
+		/* Used by transport to wait until all MRs are returned */
+		struct {
+			wait_queue_head_t wait_queue;
+		} cleanup;
+	} mr_io;
+
 	/*
 	 * The state for RDMA read/write requests on the server
 	 */
@@ -236,6 +274,13 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 
 	atomic_set(&sc->rw_io.credits.count, 0);
 	init_waitqueue_head(&sc->rw_io.credits.wait_queue);
+
+	spin_lock_init(&sc->mr_io.all.lock);
+	INIT_LIST_HEAD(&sc->mr_io.all.list);
+	atomic_set(&sc->mr_io.ready.count, 0);
+	init_waitqueue_head(&sc->mr_io.ready.wait_queue);
+	atomic_set(&sc->mr_io.used.count, 0);
+	init_waitqueue_head(&sc->mr_io.cleanup.wait_queue);
 }
 
 struct smbdirect_send_io {
-- 
2.43.0


