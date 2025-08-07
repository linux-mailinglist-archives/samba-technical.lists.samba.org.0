Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF2B1DB61
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 18:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=gJI2Cp84cI2jqYL00jY1Ab/mYja74+2CSqYptQEJH7U=; b=wzmxVQu/bQpEg2j968wwRm/Uze
	+nb67p9rigDnSCIcb4qPGCY6EpoJoQSyZTU52gibF7hXg4wtuYAQq0XlJGJYt0sNo7A6y7h4Z2k1/
	V+hMgD+rwBMu8pe6JxRmNQIgq+G7DFdX5VXwuIrM8SKiTcvC1vB7L55aKv8lYtODis52BioxwjtqU
	m641l8l/RGs+iVTf9I969XiuUgZ1Jv5eXMepcpfJWzlGIOThOo0w9A/lAvrvPlHUDh3xCkZxFQriB
	QXmHLj+SdEkVpLeatyl5om+WZRetIwcWLK2l2KCoWi6i+EFA+d4BAal2IWsGIfULdEJlnOyARGz47
	3AihqvNg==;
Received: from ip6-localhost ([::1]:64750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk3EJ-00EZUY-UH; Thu, 07 Aug 2025 16:12:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27220) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3EF-00EZU9-4z
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 16:12:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=gJI2Cp84cI2jqYL00jY1Ab/mYja74+2CSqYptQEJH7U=; b=nTpXKaWrOD9PtoLWdEv07t35Hn
 XGxlojdENJBhCPL/Lb/C73llmilrz9+YD63ih2n2DX3idTGmsxFz1KZELZuxAIDDk6o9+ODzpCRmH
 YvdqTEb5RykCF6MsZ4Agmkklhky7j/vP5ZsZYgRxLvsO/vgvPwxSlSmJ5hcEkShG5P8p0lNNCDa0x
 QyCI3UOy6jiLW9kkuAc/XDjWVJny2WP3mCE0D1tr742EVdg371yOxvy4w7CrpDu2yyQVjXK8uyiOf
 lP6UV+IR8RokrIx1v9cy12+bwmtPc4eDt1NF43twRkxREP5Dsp5kyqmlJWHz11lMG8WVV7UkMoK0X
 LljNIZEh2Kktpch4DehYxsBMMWbiUsmSvTdkrdMemeupZy0ntCcReZSv08gF65V8fJyazoR+jU2G8
 1kbcZUmccB+YnXPiQcmNhjoSvgnzsNXa/OdVEg2QKw80+bzVPig0vTXeUMVlBJVhC7e3spOLtvsNP
 BIB6Lf3nBKExr2dFoiLantzy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3EE-001cZ4-1J; Thu, 07 Aug 2025 16:12:30 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 1/9] smb: client: return an error if rdma_connect does not
 return within 5 seconds
Date: Thu,  7 Aug 2025 18:12:11 +0200
Message-ID: <7df130cd3be4e4f360980d45fd6335e3c92d16e2.1754582143.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754582143.git.metze@samba.org>
References: <cover.1754582143.git.metze@samba.org>
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

This matches the timeout for tcp connections.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
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


