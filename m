Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 912CBC86840
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:14:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pMTdTq7HOGqXyfkiKU+KEqSuKmskUIzm0AJFeVodh94=; b=2ZqsKgyDB9VXLclVN6Gh1eB7O/
	j0lw9jx3m4pBM600tdugT8Q5cIJ5swSdOeN3wjmsjqX6HWCYqztwm9Zxv0u2i5sTX5MHl6R4LhCUU
	u1DiftZe+j90LR2vu042AKy9MXtPvkqzEutsjSNtCdbgAx9nPJDQSqOi2+/AIT6fQPw3nTxnGTUhZ
	tHLWbIy+kKU+8Mnq6T41Lo9pFsMxsLH/LkH12HMViNgiC9x0wgHMIcM2WzanosVN9uBlfgothEPa5
	EYDFK9f25TtHiQ61VFykFARdslRi6fSonfmVwj0D3jrlqCfIybMLO7zxO8gvV9ZWfqJpO6MRZVH7e
	X9dQUjwA==;
Received: from ip6-localhost ([::1]:39496 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxY4-00DByV-34; Tue, 25 Nov 2025 18:13:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11882) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxSZ-00DA8l-39
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:08:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=pMTdTq7HOGqXyfkiKU+KEqSuKmskUIzm0AJFeVodh94=; b=stXH3LkiKf0TDmQOj0+GuUUIvQ
 Hy9qbE7bYqLUo1X9A1XSL11ubLGrOzfpQQDMCXr57le/lrqoBu3nsiEk1+aS8msRyQFyiJwSqgf4S
 6nLMryCOBY+oWHfhun9PF+q45kDBPKQEDbzQNofDxJV58XuSo79G7eAzemVEZT39Tvfyn2V9v/EYv
 9hQnrdyapNKEa2D6gvYIhUiZLKIkCp5eRwg/+Sh7IgKRaxyjiIbS8GmGdNZUjyYRfOq5NfOhEF7kr
 snK5iXDbp7sCEBaYKekGrpQSfWL6Q9ERghnwKWAOfXj/e8l4BuafvHkevWc5ZWIjcU+kCTdb0RGSP
 /iYGPsWURybrF2BYdxeYjxN1oI1CmOMHdQbnfJX8Q5xGRX9vTziQrBgZfY9fG47w1fSnYw9nT8asw
 gWpBvKic1FViyMrxQEE5XndW9YqmRJjiVEWvxk0EMkjawaZ+yPHxN1JM2dYBxmN8c1j2ogyoPepqv
 hdNaan1pqbh4xRmCEkhsEaLC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxOa-00FdfR-16; Tue, 25 Nov 2025 18:04:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 069/145] smb: client: make use of
 smbdirect_connection_idle_timer_work()
Date: Tue, 25 Nov 2025 18:55:15 +0100
Message-ID: <f4601fa50f70f1fb558f488bcc061a7afcdb9824.1764091285.git.metze@samba.org>
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

This is basically a copy of idle_connection_timer().

Note smbdirect_socket_prepare_create() already calls INIT_DELAYED_WORK().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 39d94bea2bbe..d2359d6b18ba 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1342,35 +1342,6 @@ static void send_immediate_empty_message(struct work_struct *work)
 	smbd_post_send_empty(sc);
 }
 
-/* Implement idle connection timer [MS-SMBD] 3.1.6.2 */
-static void idle_connection_timer(struct work_struct *work)
-{
-	struct smbdirect_socket *sc =
-		container_of(work, struct smbdirect_socket, idle.timer_work.work);
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-
-	if (sc->idle.keepalive != SMBDIRECT_KEEPALIVE_NONE) {
-		log_keep_alive(ERR,
-			"error status sc->idle.keepalive=%d\n",
-			sc->idle.keepalive);
-		smbdirect_socket_schedule_cleanup(sc, -ETIMEDOUT);
-		return;
-	}
-
-	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
-		return;
-
-	/*
-	 * Now use the keepalive timeout (instead of keepalive interval)
-	 * in order to wait for a response
-	 */
-	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
-	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
-			 msecs_to_jiffies(sp->keepalive_timeout_msec));
-	log_keep_alive(INFO, "schedule send of empty idle message\n");
-	queue_work(sc->workqueue, &sc->idle.immediate_work);
-}
-
 /*
  * Destroy the transport and related RDMA and memory resources
  * Need to go through all the pending counters and make sure on one is using
@@ -1774,7 +1745,6 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 
 	INIT_WORK(&sc->idle.immediate_work, send_immediate_empty_message);
-	INIT_DELAYED_WORK(&sc->idle.timer_work, idle_connection_timer);
 	/*
 	 * start with the negotiate timeout and SMBDIRECT_KEEPALIVE_PENDING
 	 * so that the timer will cause a disconnect.
-- 
2.43.0


