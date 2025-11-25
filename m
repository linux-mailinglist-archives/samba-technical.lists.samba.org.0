Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C738C865EB
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:59:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+iJTV0wB0cpRbHenev0TKJ/bIph3WMc1RrBAoT/CYqo=; b=zsr+5zrUhHx4c+G2I7ds6/FwGA
	0xNy6roHTAzcK10RxXo/1v4xOKmx9gIP3pc6eTCu4GfcngHy7tiUNT2AJgev69ovOuRGI9kcrxhGW
	4KOS3xNGyVhMe830uiceJukAvgFIl8cDJC1286M8samLzC+Axl3VXFWUcPbUfqg0Ap/UVEgoBdrzu
	FYxpiJvChEReco9pWlTTV+VgeVlMyrmvMtKxHzynMT1iJfkKBP1+7udK+S6j21CPdj95T29eYMtdF
	76UbV1Pwc3dXC8b2hOKeApA5vxHgdHQLE+AzlkXnvbtK6kuutbdKvBt78mG5/NB52VhdHEnEn/poX
	gqRhczNg==;
Received: from ip6-localhost ([::1]:40362 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxJi-00D7Ag-Nv; Tue, 25 Nov 2025 17:59:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43680) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxII-00D6mM-8h
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=+iJTV0wB0cpRbHenev0TKJ/bIph3WMc1RrBAoT/CYqo=; b=N19BBa8Kowuc4cgeDt1IpybrFE
 f3eIL40Bgb8G9gZN/bMK/fOIS6coaBN2z3wqzi549kGHIFj5VPjAxYkXY9WcWHEmZ6GM6HQgHRxn7
 vkefV/+Nnt7HDmrcBbOGej9fQjzJvK3rCTjwBN7zwdewRAG0CRX+eReZ2UIuNN8zyeVbpvgrp/L+J
 9Gd202TWBZe4BuNr3oS04uUsjpb/H1gT5mNZHFsiakwkPTljJj75f2RrOhUWP8rQLjSfG+tPsOH6c
 uOAhpzfclQA8WMtLzYn4clCPJ8fSb2RFQ/tDxW1FTMaUlCUYrO7fgbpwQUTNdqUBJgpzKI7afe0hB
 oMsBAwu7CszbsOlEaHHguIWMQun4GF3kf5qBFk5vUmLxoC+4LzTHRyRakAU5uUovoXEZJln+wr93+
 0Y8L2DmMKtPmaMZrkzHe+Tf5X+EBBBXJXqjIWcGLZJvskTLsvcAPnuKPkBZPC6/ASD6/2Gql7D3sY
 1S3yWsKiG1tHjfbwlHkozzSM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxID-00FcbA-01; Tue, 25 Nov 2025 17:57:33 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 009/145] smb: smbdirect: introduce smbdirect_socket.c to be
 filled
Date: Tue, 25 Nov 2025 18:54:15 +0100
Message-ID: <290632858a823c0c257bb7f92ff694162d1c835b.1764091285.git.metze@samba.org>
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

Over time smbdirect_socket.c will get more and more functions
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
 fs/smb/common/smbdirect/smbdirect_socket.c      | 7 +++++++
 2 files changed, 8 insertions(+)
 create mode 100644 fs/smb/common/smbdirect/smbdirect_socket.c

diff --git a/fs/smb/common/smbdirect/smbdirect_all_c_files.c b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
index 610556fb7931..269d8c28c92e 100644
--- a/fs/smb/common/smbdirect/smbdirect_all_c_files.c
+++ b/fs/smb/common/smbdirect/smbdirect_all_c_files.c
@@ -15,3 +15,4 @@
 #ifndef SMBDIRECT_USE_INLINE_C_FILES
 #error SMBDIRECT_USE_INLINE_C_FILES define needed
 #endif
+#include "smbdirect_socket.c"
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
new file mode 100644
index 000000000000..0a96f5db6ff3
--- /dev/null
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
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


