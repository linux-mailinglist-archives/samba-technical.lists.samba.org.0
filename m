Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DD4C86687
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:02:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/hBu2ti3SKIvUnNd5nMLk5GywAqbNJsZRr1OcWEr/7g=; b=Qgo9eBPobMr4/zY2ieM8KMuEn+
	SEWDR2ezCIVeqwMpcIgeDFPXydoOqUw0d3YZfvGhFN4/gHKvdILmL6ozB3sWPPriNeF7vnCh/Tzyu
	mA1fBjngBvURhWyhi+IsA5O7Pb+gOGIKysPRXMsmLndTwX0lJxm8SiiJ1vOIrHX+nU+eI2hJNhg3S
	mOWe9On2g/MiX7LI8wmk6ef/kYzmMQbJKyHCkggpPuMVqxmxss23YA8VwoWwtBkySNQrtlj76Uasv
	TLXqF6M2m561njgABAyObpYN7q3eEFDLjXgdyosUMrHy2OkvvwB9Ic8sUoqWp3kKuJjl8QC2hboSl
	7kI16qwg==;
Received: from ip6-localhost ([::1]:26398 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxMX-00D84h-5M; Tue, 25 Nov 2025 18:02:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64212) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJL-00D77I-8Q
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/hBu2ti3SKIvUnNd5nMLk5GywAqbNJsZRr1OcWEr/7g=; b=rl0Fn6UX+b9VSV2B5Slva1nZU6
 qS9HaLcJix2wpCWsEciTZbPwKQdjyZjo7rWHxpV3bPo/Tf6SqM/9BE1qgeAQkHPYAMWm95Jmnkixj
 6EgtnQHnhAEzpopKAIuUidfSM0GJHNszpqA1zLBtDmsgx/LrobsZR3u2D8bWDadvevHlxr5wFAw1l
 eYOnbC+Byi+k8P5nDvoCVSFLrdzV6tMEjpQ6Zz/gB4rGi0P7SBKnIFGviieA6VG8OihwvyXcjK/f0
 3aQgYlxXCIBsRYCZfQcjcuPRYzWvvHisxn9yciPXNlw7mSQHGCLvl6dcFmL9jyb+3MbiQ8SChoYyp
 j74m6nMc7nY3fWeAN62o6oIIz1VT7yYzXgkWQoLlglQntZVoW0Ofqg7XS/ING5Tj33MDGwQ6QdeL7
 6a4sqKC3TSdWhTItefuCBKvJF3UrD/2Gq1lFrrJK1uf76hjWOjrHqkHNH/TAHkFEJZL5Ew+ecZ+Zg
 7XvUMHv9ZEsWE1gSwkKJEJsT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJH-00Fcn2-1o; Tue, 25 Nov 2025 17:58:40 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 020/145] smb: smbdirect: introduce
 smbdirect_frwr_is_supported()
Date: Tue, 25 Nov 2025 18:54:26 +0100
Message-ID: <52ba53092030ce29c102e80b089c45d80bd6ee79.1764091285.git.metze@samba.org>
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

This will replace frwr_is_supported() on the client and
rdma_frwr_is_supported() on the server.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index cd7192584820..c064cbcb6b5c 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -6,6 +6,22 @@
 
 #include "smbdirect_internal.h"
 
+__maybe_unused /* this is temporary while this file is included in others */
+static bool smbdirect_frwr_is_supported(const struct ib_device_attr *attrs)
+{
+	/*
+	 * Test if FRWR (Fast Registration Work Requests) is supported on the
+	 * device This implementation requires FRWR on RDMA read/write return
+	 * value: true if it is supported
+	 */
+
+	if (!(attrs->device_cap_flags & IB_DEVICE_MEM_MGT_EXTENSIONS))
+		return false;
+	if (attrs->max_fast_reg_page_list_len == 0)
+		return false;
+	return true;
+}
+
 static void smbdirect_socket_cleanup_work(struct work_struct *work);
 
 __maybe_unused /* this is temporary while this file is included in others */
-- 
2.43.0


