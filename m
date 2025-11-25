Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89101C86603
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:59:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=XCZcFRx3gKhyFR6uETrUvu/oijjMnMDxQQHTl1SCz+k=; b=lPC1320NQjXdG+pIQAMyXPoei1
	7E9AZmPTbFR7m8V/yQwxw/lgfuzNjNyWBKPzN7ZoMABj2DCeYu4dkRuhcmKUYL4V1GmJ5OU+xR3jS
	XxBvsbbqRGgcrzVvIqms0nqDnR2yWxV8GXt6Kzor+ArU2HJ6tj4IfS1iKdT/dh4DWgjzBpNkMuwEV
	yg4hjo0pdfxruiXrkVUDmDuzNHNvbcvkU4okQizVdYaOqGkjOYE5J8Rsv18zZOZJzBEoO8Dglxxq7
	p0jZTcnh1ETYXoiRy84wDyxGOI8xjayOJbmVdfqZ7LD/nf2SpB1AamC9MFEe2q/0YzQxqiiYaUocB
	G0XmazbQ==;
Received: from ip6-localhost ([::1]:22618 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxKD-00D7Kl-4j; Tue, 25 Nov 2025 17:59:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43684) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIN-00D6oG-Vz
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=XCZcFRx3gKhyFR6uETrUvu/oijjMnMDxQQHTl1SCz+k=; b=NalQGhn5VYGu0GEJGdLzbYN8XC
 sgp6DJQb2soLQNztej0YBwBtBiVQaSzr4BLeUDDxdoeYFrMyFKt9pEvBr1TDz1JEka/lCmDTQ2XNk
 XpZbDKXC80qNZcePrSsE+1W0x0rQm2Y/A8aBh6NxhxJTXC7KGopGob2s+PZrtZCuyZWyCiuQ0K+Oe
 zwCjtETiN+QMlq5oH5nU+Xa4tMyAsL+bvE5pLYWawLh+ZmLsorm7EbxzFPIz35wVAjOMvwjbsazZH
 chPuhkQVa6+Dw2MEmwbAbNtjsCAxq+e7faiwGEb+dVhZ8ULuEH8kdgZNpWXf8uAwNlw5sAc25kH/j
 0OROh/Jq+kXWW+U1A0L3kLdPoMZD3p45mDXYyJRhUrVZEgBkERvlzg7s/pS68ep7Qxhuh5ybZGQWh
 g5rPunat0LAla2ufNZ+tds8FqhmTHva0xb7GBcYosi2FkoBdZ7xu2hEA3ZAsfSV4KWq6PT4xB5cr1
 GgDy2y07LilEUOcgeHOJRrCg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxII-00Fcca-2Q; Tue, 25 Nov 2025 17:57:38 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 010/145] smb: smbdirect: introduce
 smbdirect_socket_prepare_create()
Date: Tue, 25 Nov 2025 18:54:16 +0100
Message-ID: <c0627b370f6d39059a180eb5e95baa307cc4d324.1764091285.git.metze@samba.org>
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

This will be used by client and server until we reach
the point where we have only public function from
an smbdirect.ko.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index 0a96f5db6ff3..421a5c2c705e 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -5,3 +5,22 @@
  */
 
 #include "smbdirect_internal.h"
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
+					    const struct smbdirect_socket_parameters *sp,
+					    struct workqueue_struct *workqueue)
+{
+	smbdirect_socket_init(sc);
+
+	/*
+	 * Make a copy of the callers parameters
+	 * from here we only work on the copy
+	 */
+	sc->parameters = *sp;
+
+	/*
+	 * Remember the callers workqueue
+	 */
+	sc->workqueue = workqueue;
+}
-- 
2.43.0


