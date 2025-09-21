Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEFFB8E700
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=8s1yRJzHYcj0JSI7+0RPoZkcz2/6cNfm7A6Be5Nm0Q8=; b=2F0cDlDcoNpFL0zVJ5NYVZl4Gl
	Wes4gTxFKUYwMq8huSbCzcj8p8lqoW3rmlVzxEAE1lzS5s3iXaj9ix5Ydtj/TK97S19Ed9phetrfq
	/Qzp+urkSMmaLLyHMMw3Gw8uemuZcvTMuZmb/nLxQz0KvGZlWUH8eBhf4WxKFmVkm4NNm6/MXF35H
	GRcK981v7+48HX15XltXJV1j2NAp97Lvg1RgYFiYk2m2wD1UXLfcXpOVTj1suiPcF/+9WmwgiknWK
	G9ki/d9Hp1oRZ1SnJRdidpMu3QuOSzu6ZmqgOEggZ5CP+tVily88Bslzx2zvBV8DsM6Jjt/v91w0h
	VKkKhLXg==;
Received: from ip6-localhost ([::1]:56464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0RsG-004Sx0-HX; Sun, 21 Sep 2025 21:45:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20628) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RsC-004Swb-Nn
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=8s1yRJzHYcj0JSI7+0RPoZkcz2/6cNfm7A6Be5Nm0Q8=; b=jqPIxR8Cx1FIITApZGHVqHQjCU
 yaPP7zJPYGxBCWrjLl/fdckj3guzf4W6u7WO7spwyGxPsVLmjkEsJeSS0Eat4PsVef4sMxkUlnKGl
 6D49z6+RbLNUOZgBA0EsIXL9w46HpCQmYTXk+jW+0bYR2hUE5wDWbG2RNJp3ASQKa803w01Lc4Uol
 B9BTwXeRN58HijMN9h1xYV68qsV+g/jD4FRsnLsrl6bMNRQMpV3hnpwsshlOcyzXNGuDYOcDKySdV
 6XxNu6JRwoDiqxB//YFraF9NsDDcZPOleTJCQxAyzHwX1XpL/hYPQDPmnJHkW5s5OGvdKUPoI7qhZ
 5lfEFfUyPaPhRcxFeXvjD+gpF6k8t/+sgaQPNncUT6yax6fuPp4PKcm8mNRG0WE+3GfH+HuTLT5aM
 brbRG/S3RJZdYNWg5sOa67Hml376RRjoyhtgjo1brlk60Epn3vsPLWtPpOfqY0PDfys4P47cZsA8q
 uu4ymq/WxTAAxNQK+IrTI9+O;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RsB-005GMF-1m; Sun, 21 Sep 2025 21:45:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 01/18] smb: smbdirect/client: introduce SMBDIRECT_SOCKET_ERROR
Date: Sun, 21 Sep 2025 23:44:48 +0200
Message-ID: <09b17a8a4e32d4360b4e554b032179aa96cf70f4.1758489988.git.metze@samba.org>
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

This will be used to turn SMBDIRECT_SOCKET_CONNECTED into an
error within smbd_disconnect_rdma_connection() on the client
and smb_direct_disconnect_rdma_connection() on the server.

We do this in a single commit with the client as otherwise it
won't build because the enum value is not handled in the
switch statement.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c                  | 1 +
 fs/smb/common/smbdirect/smbdirect_socket.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index e0a01b3b396a..7e0d2ecaa37e 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -186,6 +186,7 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
 	case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
 	case SMBDIRECT_SOCKET_CONNECTED:
+	case SMBDIRECT_SOCKET_ERROR:
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTING;
 		rdma_disconnect(sc->rdma.cm_id);
 		break;
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 91eb02fb1600..b4970d7e42ad 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -23,6 +23,7 @@ enum smbdirect_socket_status {
 	SMBDIRECT_SOCKET_NEGOTIATE_RUNNING,
 	SMBDIRECT_SOCKET_NEGOTIATE_FAILED,
 	SMBDIRECT_SOCKET_CONNECTED,
+	SMBDIRECT_SOCKET_ERROR,
 	SMBDIRECT_SOCKET_DISCONNECTING,
 	SMBDIRECT_SOCKET_DISCONNECTED,
 	SMBDIRECT_SOCKET_DESTROYED
@@ -60,6 +61,8 @@ const char *smbdirect_socket_status_string(enum smbdirect_socket_status status)
 		return "NEGOTIATE_FAILED";
 	case SMBDIRECT_SOCKET_CONNECTED:
 		return "CONNECTED";
+	case SMBDIRECT_SOCKET_ERROR:
+		return "ERROR";
 	case SMBDIRECT_SOCKET_DISCONNECTING:
 		return "DISCONNECTING";
 	case SMBDIRECT_SOCKET_DISCONNECTED:
-- 
2.43.0


