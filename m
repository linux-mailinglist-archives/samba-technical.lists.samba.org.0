Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CB17CB1EBE7
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 17:29:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=TpE2TzPqL1qNot0BgtzwshC+rsQCLDpwLvbzx3G+x1k=; b=ZHKTv6vUQ1sEgOI+nzDOohho4h
	FbkKxnas4kNJ5QTm0AkmBYTp9aQunFgk2ltAeebJDmLvSJR8wiIRaTedoh3cmoOgUR8tKw7GG0Fs6
	dm6QxAHuVQxBuY/aOqmgkBbwkJ0sSvGSlnfGVgHPyLwks3lt/NW0L+K4y7YvD3BqiyIGbM/Jak+ko
	OcjT+2q5FVVI3BXdVs3sJTJmEgEP9ALtmaS19NaLBAiuPFQCqcbRDPR5qrzhAtE9y/ckt4TwGtiPi
	FoxcRKE600XqF0j03MeIaRn9w4TAKZ2m+QAZ+6vX/dUtBRZlVCSnUZb7dOGSc5ye1t5uX9tmHD8Uz
	tzLAMc3g==;
Received: from ip6-localhost ([::1]:63306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukP18-00EgDg-8B; Fri, 08 Aug 2025 15:28:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15208) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP13-00EgDH-S3
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 15:28:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=TpE2TzPqL1qNot0BgtzwshC+rsQCLDpwLvbzx3G+x1k=; b=y5c/5ZR3qANRHgHPxkFbrH8l+j
 zCKwwjDT6tADUVSF7h/E/JvikO+dyKCHmnypfDCi911Kn3YXQUAaKbl6vYctStKEXMhRBx2dCQi+6
 mzWzo3DimotL335UozCEu3FqBP9N6inQyboed2mAcPhc7O2IdsjeRVyv6iWw8r8tVpdMP21NUrCoE
 xnmVyKda12L0onyXeKGK+oPr6f88glOJFxCKDY6SVFPGJTcZK/Ij95UH8uhhkIHN2F8JjNO+FBNdK
 1kcwkwXSTI8jNssB0FSIt744vxQm5TTEN1ze6BbtOoJ3rMsE2c0GWT5nXLr5CNo4pvOhYml04dMKQ
 8aIa73sAiBaS+I3Dmlq+YWts1vOy3OaUkKjkQGzVuM5a1gLO7ssBoGv7hOYhW0Csp5KqQDF0Ufoga
 cw4INOZuj72TCyZouSxlcQMwVbSoucjxjtKF8w5JKTdYwMa8fPGcyNwWbznGBhJ2PQ+vGOjizFNDF
 KZiSMjRDX8UxXmTIkVJuCPJC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP13-001pNw-0E; Fri, 08 Aug 2025 15:28:21 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 1/9] smb: client: return an error if rdma_connect does not
 return within 5 seconds
Date: Fri,  8 Aug 2025 17:27:59 +0200
Message-ID: <2f31432cef778fbe2418fef7a76df811c464432f.1754666549.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754666549.git.metze@samba.org>
References: <cover.1754666549.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This matches the timeout for tcp connections.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 6c2af00be44c..181349eda7a3 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1653,8 +1653,10 @@ static struct smbd_connection *_smbd_get_connection(
 		goto rdma_connect_failed;
 	}
 
-	wait_event_interruptible(
-		info->conn_wait, sc->status != SMBDIRECT_SOCKET_CONNECTING);
+	wait_event_interruptible_timeout(
+		info->conn_wait,
+		sc->status != SMBDIRECT_SOCKET_CONNECTING,
+		msecs_to_jiffies(RDMA_RESOLVE_TIMEOUT));
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
 		log_rdma_event(ERR, "rdma_connect failed port=%d\n", port);
-- 
2.43.0


