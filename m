Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 81925B1ED3A
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 18:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=TpE2TzPqL1qNot0BgtzwshC+rsQCLDpwLvbzx3G+x1k=; b=xnxfDX9Sidv/NcvOuVNVXe5w/2
	ZrUfdemIgdDfSqBIFgCPYRA9RJpcigtDlA0MVVeKRw7tXXnJu1TRIc2bTARZ+Do5pK1L0/yCi3PV8
	Mta8FJIDZkgj7ofwf959wpUsAtaOXlDHJnECzlHkk+j4CeCI8a4VAAqWCZE1gne72SbDFqGCV+0g0
	9TAeVBx9kNUZrsuSJOgFSh3ENO59uP2691yZ4DoEYtZTpk1lGga4CDBbT1hDdbdXgqSEn70WDGsHl
	jaV8WAsW8IfbADHRmGg0Nz9t67JjwduDSkSizvXAi//Yhu/LlKC0kWBM/hVHMTtx524Ltbr2QBlw3
	woc6SQ8w==;
Received: from ip6-localhost ([::1]:52296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukQGp-00EhpY-4b; Fri, 08 Aug 2025 16:48:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20638) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQGi-00EhpB-5u
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 16:48:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=TpE2TzPqL1qNot0BgtzwshC+rsQCLDpwLvbzx3G+x1k=; b=tqlamkKVz3WaoAV1aInuVYavdS
 DfzVKjP/Gwy5f0NbyqodOK8gXIG83or5sFJbP+SNaaH/PwyGvdajKG9g2IVEHDkzOh/m3XmZUMmPw
 L9kVP7YoRB5q1rElYIDgjnOM3w3XULIIfAYrcFDf+ZxijsETJz4IntGB0bAaOLJMZN9avpaS1wlAp
 L4jNpS8W+vwc2OXXogFljujCzZdNVHZNsrKvl7GHGE9vnQ5JbOs+BYSz53PVkJc9/w3f+ysbakcJ+
 hogpSKUoflFGTqDT4INWv8EZhhaRvJ/3Ew6FTGrYDqWYC4b0E3Eqt/uoRSEUI93TWqEAJrWdVi7fl
 ET8yzM2/tyYlDsBcZZj0aR7us6iMpX+tiOnDpMXwtRYaUYGsVce44/G8vjPOfO5/ndvKU7HrC9BeZ
 V7aK143wxeiGEW0Ze30u4hu5u2LsAW+nWIa5FrHB3C7XFJyCnj/nvnF5eZd2I6X+c5x6aR88WcMwc
 1j5TBcFk4q8s+ThiUNsDnu9n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQGg-001qM4-0r; Fri, 08 Aug 2025 16:48:34 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 1/9] smb: client: return an error if rdma_connect does not
 return within 5 seconds
Date: Fri,  8 Aug 2025 18:48:09 +0200
Message-ID: <2186fb5db861cd545f24e22102037bfcae7784b5.1754671444.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754671444.git.metze@samba.org>
References: <cover.1754671444.git.metze@samba.org>
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


