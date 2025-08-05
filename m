Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A269DB1B829
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:13:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=eGMM7NR3iGTzMmcwJ12NL6WktXA2eMw8/ubnp3msImE=; b=Q6JknFKbLcXyEVCBl+twAgca6I
	J+5Vz1gF93sCovA7BiE/6k/nLFPORP/7JoPlWjvDLE0vYNt/xZHpILaiRkqUL+jNsqinSkbjotTxE
	qyrFktoE4n1isf5/LkEjAVoH5EgD0Ot0yoGIgETHhH+dGnu6BF1NAKCMhcfOW2GRUiI+d0yBPcQXD
	2MiF2XwQdDoOEOZbJQrESdLodsHdTFta27Nanef4tB+BzAcEdjr3kViWT/NXg/KKK87KS/LFLhxAe
	9hy3AR0g1mUKMoY5hkOVOOmyR0gdHMrg6Eii+Sog904Ut6A+qwnsk5rl7o2zVhflAmoxQEPu2m+AT
	UfvhFlgQ==;
Received: from ip6-localhost ([::1]:32920 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKIF-00ENQF-GQ; Tue, 05 Aug 2025 16:13:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25348) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKHe-00ENEv-K1
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:13:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=eGMM7NR3iGTzMmcwJ12NL6WktXA2eMw8/ubnp3msImE=; b=Gd3JfTSVhik8dUZPUkhAiel4xz
 OMEAFvDBH7V0MoTzx4S5vL3d5WsYynAmFrE7GpsSCxKorUJ3gxXpRo/HuMiBBbXymxQLqoO50Xjt6
 Y1z122ISxz0pFM2+xd5WKcT4ulrsSTb53pgnyunxn/7MYwKXn1OoX9+PnzhPniOMP6R8PuMDTnp+p
 Ii+xk3/MLjc4/LQLOApF8y3p7JZ3daqG9rhT8t3Z6djgrLmg/az+8cqkA1e19W0my8nBacZDZsNYy
 ttfeKy4seD40Jos/qCXvL6U21OX4iNcVGhOCNJ2V565toF542pMzBdK+rW/LM6cQoj87+J0vjIjBR
 eq0qw0u5gFAuNvuKYLD5Ai8m2sREFeAAQ/Iip9nFtwNNJxJQ2gV1Ig5AYGNqv+VV7WCvR7ZnQra0K
 zY5T7/miFiKxJqwig5GyDauagcwCYtBLfHnx3t3DaKcw94n8VFXc3xd8woG3GM+OatwfFj0vRtfla
 wMTUgqq5rIgniWtozI84t9uu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKHc-0019k3-1H; Tue, 05 Aug 2025 16:13:00 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 08/17] smb: smbdirect: introduce
 smbdirect_socket.recv_io.reassembly.*
Date: Tue,  5 Aug 2025 18:11:36 +0200
Message-ID: <52db88c43dd011e6782ff8a3fbfa7cbde91e646c.1754409478.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754409478.git.metze@samba.org>
References: <cover.1754409478.git.metze@samba.org>
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

This will be used in common between client and server soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 21a58e6078cb..3ae834ca3af1 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -60,6 +60,32 @@ struct smbdirect_socket {
 			struct list_head list;
 			spinlock_t lock;
 		} free;
+
+		/*
+		 * The list of arrived non-empty smbdirect_recv_io
+		 * structures
+		 *
+		 * This represents the reassembly queue.
+		 */
+		struct {
+			struct list_head list;
+			spinlock_t lock;
+			wait_queue_head_t wait_queue;
+			/* total data length of reassembly queue */
+			int data_length;
+			int queue_length;
+			/* the offset to first buffer in reassembly queue */
+			int first_entry_offset;
+			/*
+			 * Indicate if we have received a full packet on the
+			 * connection This is used to identify the first SMBD
+			 * packet of a assembled payload (SMB packet) in
+			 * reassembly queue so we can return a RFC1002 length to
+			 * upper layer to indicate the length of the SMB packet
+			 * received
+			 */
+			bool full_packet_received;
+		} reassembly;
 	} recv_io;
 };
 
-- 
2.43.0


