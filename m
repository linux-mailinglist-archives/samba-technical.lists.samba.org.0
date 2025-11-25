Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 013A8C865A9
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=g4+55J/IvWXCTgAVKmMhQ8CnIEtqfx1K9xCIW4DKDzE=; b=cRzouQxppzUkWK85F/f8agtW3v
	Z8mdzGCgGH4mc2rN/vqL3MRMsnXJ5tXameum6E14Cw5C9W4wOuN+UfCyvozSCcx9xeuebOyiofnYy
	Dkg2gHOHFryVlDYRYgTz3vct73qx5DtqwcRAGP1lS1oPmY8rbFNjsfr4HKiQlKxBZaIbddhUAuQbZ
	nOVClS0Y8ZCp/glbh/viHptKjhI7eW3NGWL83YdFl5TxGKsfmxUV/IBL3nIXQowvdwhuTs4ahzFEb
	KMIVp1mSvSA/1i62/hNQt1S+U7MGVtcPOdKcmkHQyEMPNd4h5gSq5l8/gq0a1yrUT90dJ0bNf2bKy
	LlBNBaRw==;
Received: from ip6-localhost ([::1]:55328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxIm-00D6pw-51; Tue, 25 Nov 2025 17:58:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61650) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHt-00D6dc-Bp
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:57:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=g4+55J/IvWXCTgAVKmMhQ8CnIEtqfx1K9xCIW4DKDzE=; b=uY5Bgx4I9RQSWUlK8w3OS9MT+q
 pgzr91xIrdbcSYBJEehAsnYXeUQJad8nGrCvVr+A8EcmXvuqfHWI0wiL3MgnwxMe2vBtvSmNZDYM7
 L8c3Y983xL7oZEGJqJPC1hMuTNRtjCiVyR9Btx+zRcj89BOqHf6T+u5COpNYyWLSigNOhU1V2HdYl
 ZNDwqkIt0alEfAmKKlZrsaoMkg3A4AOOZ09Q+6HMkcipVIMUmM85dd3UtNvrYU49fCNCO3L6NzV9U
 +fNMPGj/RTJ03xKaFL/a99vqeqJ/oon2SRoqKVFPMll8p+RKii09wMw50x71QjSfZ9Og5IQjxzFb3
 6Rql4D1DK7LREm2ZyE77cEt7Ga+pA9zYVVTO25E3egiRPs444qlt/gL289lW0WlWVVXCpsRQN4PfT
 WtOFs5K6hlBroVvMFgthZZMdcRjM50y2m8VPsSlypdeVbZgzlyf0f9Erpml54w37X3D6MjRbyN0Fq
 EdIM5dVPW251GlJR65ZoIyPC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHp-00FcUX-0D; Tue, 25 Nov 2025 17:57:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 005/145] smb: smbdirect: introduce smbdirect_all_c_files.c
Date: Tue, 25 Nov 2025 18:54:11 +0100
Message-ID: <80afe8b6fdd1f324728fdee4daef48b496a30b10.1764091285.git.metze@samba.org>
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

This is a very basic start in order to introduce
common functions, which will be shared by client and server.

As a start smbdirect_all_c_files.c will be included in
fs/smb/client/smbdirect.c and fs/smb/server/transport_rdma.c
in order to allow tiny steps in the direction of moving to
a few exported functions from an smbdirect.ko.

Step by step this will include individual c files
with the real functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_all_c_files.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_all_c_files.c

diff --git a/fs/smb/common/smbdirect/smbdirect_all_c_files.c b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
new file mode 100644
index 000000000000..610556fb7931
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (c) 2025, Stefan Metzmacher
+ */
+
+/*
+ * This is a temporary solution in order
+ * to include the common smbdirect functions
+ * into .c files in order to make a transformation
+ * in tiny bisectable steps possible.
+ *
+ * It will be replaced by a smbdirect.ko with
+ * exported public functions at the end.
+ */
+#ifndef SMBDIRECT_USE_INLINE_C_FILES
+#error SMBDIRECT_USE_INLINE_C_FILES define needed
+#endif
-- 
2.43.0


