Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 179C1C867AD
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:10:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cWjktuw45N3wnmtfOqZpNWGAi4s9n5JE9rpaf+rYeC4=; b=HZAtYlK7WCtehmOzHvJx1TH0m9
	y8EujZjYggpBTIsCodD1jLSfcPEmZ2SeJSog1CiLluhscWmQ3DWE3qRRSRGbHoen7fkX+ELhjQ1sz
	DPynz+9yCo1jsv41ClfPUH7+44tJi5UlPTa6dHDenlNWjUUVQB5faDmPj0r2iUAOWPnUuS9VdQW1j
	RLpk5DYwyoNITHMpSLKI8WiVymUS2z7L72urYxOjaL1F2+MWcmZnrz14epDVyGOBW+SBAQobKBXy/
	zePQ/KZBS7Fyo7HQJHo/dJQw+dQJzq7rSvkWlx8cEp5h3xaWDWVheTbKdoSsE7EXcRTbghJs0xerF
	WZP7GyAw==;
Received: from ip6-localhost ([::1]:50952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxUZ-00DAgw-4q; Tue, 25 Nov 2025 18:10:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54418) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxN7-00D8JS-KB
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:02:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=cWjktuw45N3wnmtfOqZpNWGAi4s9n5JE9rpaf+rYeC4=; b=nenk8YBo8t2huQxp8e4uEb6iMC
 aiP2SxW2KqLqcy28MQV7kt8enj3ShhG79I9j+puwlP8VzIAwFDHjPmA1mcSxawIZi8dF5vmRHXEyN
 YHYp01+jHjCU+W2GhJQ3b21FgA3D563TSqwZrEFbPk6QxpH23DkbkbQ6nmqEkVxJGxESLX7yQEFfH
 0W8UovjxP+4APrrEXuva28JcTX5nOe8LKbuDUQImnwpFJhvSqUqz4PjRdmMM8eE3Exu9VVXeDGR3F
 GTA9T2DHsR7jB8I5Fceap5kQAYOb8Dy90WtCK2T2ATYBsa4m0QNbNbBuCWGd0+90iFFzHZawXzZd6
 FvpFNrZFwkW7JWh1GHx13PgznmEpBBzyHzkRgxyGAlNBv6UGyEugw4JTNY2rRpz9+VUw5iHwZkR2n
 OICKdmFpIO1yZgUICllmdMBr80iCrQ/fyKTzqwFHxxrOBupUHTE+9vtpMHDf+lyUNJYlVdYRzUUBW
 o4UkllvagiSMSFgRe8bQN5a6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxN2-00FdS9-2K; Tue, 25 Nov 2025 18:02:33 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 056/145] smb: smbdirect: let smbdirect_socket.h include all
 headers for used structures
Date: Tue, 25 Nov 2025 18:55:02 +0100
Message-ID: <97aa13bfd745af9cbd7770bd9e7715f13a857549.1764091285.git.metze@samba.org>
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

Currently they are implicitly included via client and server code,
but this is needed when we move to an smbdirect.ko.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 957685ec5857..bfa6a8907de4 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -6,6 +6,13 @@
 #ifndef __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__
 #define __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__
 
+#include <linux/wait.h>
+#include <linux/workqueue.h>
+#include <linux/kref.h>
+#include <linux/mempool.h>
+#include <linux/spinlock.h>
+#include <linux/mutex.h>
+#include <linux/completion.h>
 #include <rdma/rw.h>
 
 enum smbdirect_socket_status {
-- 
2.43.0


