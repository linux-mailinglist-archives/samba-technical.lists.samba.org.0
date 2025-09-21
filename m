Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A157BB8E72E
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mRaIcOrMnhZdNxDb84SGNbrVD7QuJfIGQvd9MyLo8Ic=; b=ziiOxvae2aM69UGu3u3EtdtKo7
	EPvA6c1ue7k9OkLT82qFNelDlMe8sMOdHB28zP0S5ymxokoYX1BWIPwX3FY9vU2aNI0mi4mqW+v7T
	LhqCKrXo8JJYg2U01y8+mHgx4wHMG9zrUqwjAEZ6XMjgheJT15s/S9xZA81JMHDtMa7IO+ZkGGsYh
	KeDO4jOEydshFDfASWPOJHAH4x6xpdbLnqQ8ZuN3w1ajdfa60QMEwCmtrRWuVitAdQrwhBGCwqMPw
	o2tdWKv5aMN7G+vB97VXH0A+xo1xcrUhK0TrDcpUtpduxvi3j1zgDZfn0pp3PD/5QqZ8M8YL94AzZ
	VNqGINIA==;
Received: from ip6-localhost ([::1]:25378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0RtM-004TEi-JS; Sun, 21 Sep 2025 21:46:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12514) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rsi-004T6j-TI
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=mRaIcOrMnhZdNxDb84SGNbrVD7QuJfIGQvd9MyLo8Ic=; b=PMvu8V5FxVVWZ+wHbY5rvJBm4O
 mfVDrsulcMSwDhy98fuAJ6kr0/lSowXR9EDfXkHmoeBag9SzjON3CxFHKQKWHPVssOFALlAcVy0xf
 8hvFyX0RmFThyYqx15F10TItbp5CmwpUG6nZQGXxtKPA+5wJC3QL/vp2TsClOPLM/k9cwzebCCJ5U
 Lc4+qL7EAPwJ8SNsuaT/nYfQH7GqMGoYbj9JJhTSX7VghTfmK+qCGhYfX/rgxR9I5MdzcypT+xd41
 dHZooImMRUrMyFm1gfVKfLLPFbssDf6Ch97Bt9BDYljEKntrgTqgFc1kXuNZwlkcIrks7fWXVysqk
 hzo+p9MgGVlPLAccRyDFyFOfO4qh4ojEgyptCQ2QSZ6AM1YqasBVfzj6GwvNijkb43aeY3lFEsYxo
 aGJNRxuVBxe3aCuBY23ZY14WRZSi1ZVYK6ukn1MSIYkECwIhpo/sH6XScowDCTf3o1d5D6LWnYTPN
 GIHekT1Bz/DZEWu5SdgLCWSW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rsg-005GPu-1R; Sun, 21 Sep 2025 21:46:02 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 05/18] smb: client: fill in smbdirect_socket.first_error on
 error
Date: Sun, 21 Sep 2025 23:44:52 +0200
Message-ID: <16af61b4118ddb1c674f1f77405ee9d0ba146959.1758489989.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758489988.git.metze@samba.org>
References: <cover.1758489988.git.metze@samba.org>
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

For now we just use -ECONNABORTED, but it will get more detailed
later.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 38934e330096..73beb681ac0b 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -181,6 +181,9 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 	disable_work(&sc->idle.immediate_work);
 	disable_delayed_work(&sc->idle.timer_work);
 
+	if (sc->first_error == 0)
+		sc->first_error = -ECONNABORTED;
+
 	switch (sc->status) {
 	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
 	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
@@ -217,6 +220,9 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 
 static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
+	if (sc->first_error == 0)
+		sc->first_error = -ECONNABORTED;
+
 	switch (sc->status) {
 	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
 	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
-- 
2.43.0


