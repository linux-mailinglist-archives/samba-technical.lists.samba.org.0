Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E59DC8662D
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:00:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rMVnQEG7bfqjHcaKD1bp+/4f5YYbvpzN230SAxGyDxs=; b=wX8Rm43EPH/qPeEh42hXG5ca3Z
	FUvqCvrSdBcFNhbEklSCsFnbtU+BeGgPmzhjcjAimwgA2kuTSKvnLIRmoE2zTorf8Y5NJHayjc3rr
	YX4gL08hTjMJhBTTIRjx2Hx3JcRrDwVu4j1bADgSDEjeM1hiophUBKPsbJnycrfOcTXrNftiyIeAF
	tkJXeYnYiQUg5BDehLKsS/4gwaHISaxgUxZJyUHI7D/+TmLdFxWlZhtaC3R3xSDdoh0cyWVGGqjXl
	vpV2pkQtWcOAToTrWGPdvn0PSHCrI1MbURQKSxKsNrolQfplHjpcIvgmOqMCRV1AXkxAINAjztJ55
	6OJmvG0g==;
Received: from ip6-localhost ([::1]:60754 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxL9-00D7dp-H1; Tue, 25 Nov 2025 18:00:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34414) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIs-00D6xJ-38
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=rMVnQEG7bfqjHcaKD1bp+/4f5YYbvpzN230SAxGyDxs=; b=gLlvvbKeMUYZ8mcgGSQtG5BmdD
 20OWWbp6vsmw9yBEYvSqX7OaG4g3oA4Svz3XNpigTXSgd1Cixq6Iw9dJ8Cjw3tc9KMud4E0Iq9Wrq
 inUstQDA4ywkmphn7PEu37XnylEH0SwQYHPh54pvQXhDUKjiAGIIrYHmekMp1PWAScPxJbSJ3mlbM
 Ys3XEVvQWiD/vULwhVoal9Dtw4oXGIg97RhSsO0CVY6h1hBdhvNaPGu/DndMzRvi4lagYcB/jISXK
 XYNm1AjTBCTJfUY/FSw183qCQ+UTZHWAzQuOm/Mo5Ft3GjnpboBGF/gj8gvkVWHnmrJrlzgHrWpL5
 AO7zlw27WoVtT0cJTehlgBv/R/wL3/eppWNZgUiL2nyy4FkJtH/cRD2PyBMKvRZugC+OYxyjQYnuP
 v47f/To5iRxedksr3Rh+b+sUJnsWC+a6jdWGY0q2bexDsf8+y+kC8gXxChjCKkk8K7bxRMYp+Gpq+
 9nmh7uFlGw82cVYntMinLdcT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIp-00Fcib-0Z; Tue, 25 Nov 2025 17:58:11 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 015/145] smb: smbdirect: introduce smbdirect_connection.c
 to be filled
Date: Tue, 25 Nov 2025 18:54:21 +0100
Message-ID: <6e3aa1c7813c9797a1fa5c7dd35ecd7acb406f0f.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Over time smbdirect_connection.c will get more and more functions
which will be included in fs/smb/client/smbdirect.c and
fs/smb/server/transport_rdma.c via
fs/smb/common/smbdirect/smbdirect_all_c_files.c
in order to allow tiny steps in the direction of moving to
a few exported functions from an smbdirect.ko.
That's why __maybe_unused is added for now it will
be removed at the end of the road to common code.

Note the Copyright (C) 2017, Microsoft Corporation is added
as a lot of functions from fs/smb/client/smbdirect.c will
be moved into this file soon and I don't want to forget
about adding it.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_all_c_files.c | 1 +
 fs/smb/common/smbdirect/smbdirect_connection.c  | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_connection.c

diff --git a/fs/smb/common/smbdirect/smbdirect_all_c_files.c b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
index 269d8c28c92e..93098598fbdc 100644
--- a/fs/smb/common/smbdirect/smbdirect_all_c_files.c
+++ b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
@@ -16,3 +16,4 @@
 #error SMBDIRECT_USE_INLINE_C_FILES define needed
 #endif
 #include "smbdirect_socket.c"
+#include "smbdirect_connection.c"
diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
new file mode 100644
index 000000000000..0a96f5db6ff3
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ *   Copyright (C) 2017, Microsoft Corporation.
+ *   Copyright (c) 2025, Stefan Metzmacher
+ */
+
+#include "smbdirect_internal.h"
-- 
2.43.0


