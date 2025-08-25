Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6248CB34C69
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:45:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lj6uQaiLT3HZmkLlwrZYpoMhUZU7Lbqo9P/Gonl3d1U=; b=mjiUpHEkSpVZgqh52IYk96nOSA
	YHj9vrstihKJsIo10Ux8qPs6MumXhT/IQSf0COd968sFoafnx6WNxYsfS8JndvSPR1ofl9sq3w+8P
	mJ8GEwnUD+GCf+utnxfH9Vij0LwufjmH32cXllZbSIbD/1/eFmDf9QoYdXdA7LfYTLS4IlsBCy0TB
	3srSAg45VB74heH8r4lN6e8nlfSPlhCYdVO7MjSECrTWviBIQVvLge3ZiBb79ppRa0h5cU8++90Sq
	V5gC3g4P0VQBSNIecj2A0HlHYDovKcwa2ZJZ1oJxKE8De+dFAigHnCeL74ROtbRGT/+eBG5rfgkRf
	O7/IY2pw==;
Received: from ip6-localhost ([::1]:52296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe4Q-000MSg-33; Mon, 25 Aug 2025 20:45:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29484) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3R-000M9l-Iy
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:44:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=lj6uQaiLT3HZmkLlwrZYpoMhUZU7Lbqo9P/Gonl3d1U=; b=DoFwW3c8S4z6nJlYreeOtSk+BR
 5JZLURu4jU7/nVP899IzmgHLopr/a/pZWl/Xbv1XgiDIsWpJIs8k4VHcWtSEdyfRThGAV83EC5uJS
 XwoP0V10hqdfyCoGyGxY6X2yUiAZl7ydxOEArB4j2x/HX1aAnp+RfHh95oJas4BMPWJSn1Nf1oNKj
 8CbvvFuT+JFgaxcg8ASmlHnwxplmopdDKKITASfE/UtYQuRThhKPBfwVf5lMPVfL9mbaEhYTp23NX
 +IzjTryTqFeIbpOXI6HvYFkPhEHx1y27i6RtaCYkpdKYge2ScH83P9NQPJZSC+p8hgOX2MZUWTbch
 prg765Z9SHOoFne6zRAjGEzH6Yf0A4Hj7S1TONO/i6GmxAjKZYJFQPnYJf740CunyZD0CrtyEkaBT
 9y5c6lfyYR4IzgrKEqXvhDdPSubcBejLK4Pw4jlyCBaoOHDvW17Hx0zf9DD4RKJNuSPpY3G04GDcl
 +B3egArdt84L4Y+ABRh4AnW/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3N-000jfn-1A; Mon, 25 Aug 2025 20:44:34 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 016/142] smb: smbdirect: introduce struct smbdirect_mr_io
Date: Mon, 25 Aug 2025 22:39:37 +0200
Message-ID: <f1ce60434ddbe74319e74c5691f0b606620f1cf1.1756139607.git.metze@samba.org>
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

This will be used by the client in order to maintain
memory registrations.

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
index c4e37c156f46..588501a0a706 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -301,6 +301,32 @@ struct smbdirect_recv_io {
 	u8 packet[];
 };
 
+enum smbdirect_mr_state {
+	SMBDIRECT_MR_READY,
+	SMBDIRECT_MR_REGISTERED,
+	SMBDIRECT_MR_INVALIDATED,
+	SMBDIRECT_MR_ERROR
+};
+
+struct smbdirect_mr_io {
+	struct smbdirect_socket *socket;
+	struct ib_cqe cqe;
+
+	struct list_head list;
+
+	enum smbdirect_mr_state state;
+	struct ib_mr *mr;
+	struct sg_table sgt;
+	enum dma_data_direction dir;
+	union {
+		struct ib_reg_wr wr;
+		struct ib_send_wr inv_wr;
+	};
+
+	bool need_invalidate;
+	struct completion invalidate_done;
+};
+
 struct smbdirect_rw_io {
 	struct smbdirect_socket *socket;
 	struct ib_cqe cqe;
-- 
2.43.0


