Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA9B34CBC
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:51:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uRXglccDxx3/AZsZFE1LCTE+r12kACEO3iBf19LjDKU=; b=5ruMXFr9agGeGFkJ9RpsaZtE+0
	fywelArQlEwY9QnzRVAig/OEA2PPkxshh1WdwTdhmYFOcBY1rfPGOQUuUywXrloAMZcqWj7vC7Ts0
	7A0Ly1cB1IebB4ASFa7LCyDIWSgbb8GkivW4a18eaQYfEf3gzylnNyUDZUtRQQYY0z1L/LiN1R+iN
	W2rAVJ3snaJtu9REdvcrXzS3lIjsWIn/9Fv8BFjotACb8BYdxtFahgInTNmK14OlUSHbOaFqmn1Jk
	kP0S0eXA6Wfu2nyjLSkKI1eJ6MgRseC7IGsITl1SIgxHbyoXIshPjwBp1XYJb4GXHnq5/gQFwMUsI
	1pHWmAMw==;
Received: from ip6-localhost ([::1]:23254 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeA7-000Onx-0V; Mon, 25 Aug 2025 20:51:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22520) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe7y-000O1Z-S4
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=uRXglccDxx3/AZsZFE1LCTE+r12kACEO3iBf19LjDKU=; b=wl4MWHGqtwEYGILBxQJkFugJ4z
 cxbpaA/Cc7BcsbYo0vErESmdWdKPmvBaIgBSgeYkNFVfUsX9xKilZTYUtDkkre2jWZ2tiKTSzWp/j
 MT923YKaciNZuBd/dtboYGvi6D/oov87a4jkMm0a/UXql69ZAYiBOS+lI9a9HPAoA3CezWUd2wKR+
 9iDwCF4O7TBIAx6AdueBlxemiMGdkAohA/lHFZtPy06WBUpvCw1Vg9RVhsLbXMV60sxzFcLVd/9ey
 WcrMcF+S7/2dku7+OrojLXZuJRtul8+779tkfXmGzmDPSfNuhhkR2ylXYgKEjBE4CHbZqivTr1o4f
 rJAeAQMwKb6XfQI3oM8jO8afQHlI2Nb92fuWjd47XqE3D+euN4m6aiyLUCKMAW2kxk8OA40Tp87Fh
 GI+FLjHaH1+G/qBfnxg+o5ZBELtkIKdT+fDQstoW0gOhsq5Ck2WUqwyJtczibGvgrHa+O0Fy7Yyqk
 wR1cyNIlA1N+K1rY9Igf2QJQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe7t-000kiV-0n; Mon, 25 Aug 2025 20:49:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 045/142] smb: client: remove unused
 smbd_connection->protocol
Date: Mon, 25 Aug 2025 22:40:06 +0200
Message-ID: <6ee43343a299728f5328858774dcc57e09a5a045.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There is only one protocol version for smbdirect yet and
this variable is write only.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/cifs_debug.c | 5 +++--
 fs/smb/client/smbdirect.c  | 1 -
 fs/smb/client/smbdirect.h  | 2 --
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
index 9dadf04508ac..8f1ad9cb6208 100644
--- a/fs/smb/client/cifs_debug.c
+++ b/fs/smb/client/cifs_debug.c
@@ -24,6 +24,7 @@
 #endif
 #ifdef CONFIG_CIFS_SMB_DIRECT
 #include "smbdirect.h"
+#include "../common/smbdirect/smbdirect_pdu.h"
 #endif
 #include "cifs_swn.h"
 #include "cached_dir.h"
@@ -442,8 +443,8 @@ static int cifs_debug_data_proc_show(struct seq_file *m, void *v)
 
 		seq_printf(m, "\nSMBDirect (in hex) protocol version: %x "
 			"transport status: %x",
-			server->smbd_conn->protocol,
-			server->smbd_conn->socket.status);
+			SMBDIRECT_V1,
+			sc->status);
 		seq_printf(m, "\nConn receive_credit_max: %x "
 			"send_credit_target: %x max_send_size: %x",
 			sp->recv_credit_max,
diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 450e43f1fe39..68450489c5d1 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -454,7 +454,6 @@ static bool process_negotiation_response(
 			le16_to_cpu(packet->negotiated_version));
 		return false;
 	}
-	info->protocol = le16_to_cpu(packet->negotiated_version);
 
 	if (packet->credits_requested == 0) {
 		log_rdma_event(ERR, "error: credits_requested==0\n");
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 0197a9da294e..3963fd27d8b6 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -39,8 +39,6 @@ extern int smbd_receive_credit_max;
 struct smbd_connection {
 	struct smbdirect_socket socket;
 
-	/* dynamic connection parameters defined in [MS-SMBD] 3.1.1.1 */
-	int protocol;
 
 	/* Memory registrations */
 	/* Maximum number of pages in a single RDMA write/read on this connection */
-- 
2.43.0


