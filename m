Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F44FB34C67
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:45:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2xlJXPzPk3P1CMeruOsdqKAMRmOlgnuQV272X11hZWs=; b=UOX2DTdHxRfXT3FQqzHNIz/SzT
	qdf85gsOuxhgKZkfDHwtZToZZX5c+NKOc8xXRf8bYsHT1W8JEWvSpwJ2DxS0C5p+pJliwOuOHVXtV
	zsPHUhzMOj2AKm1dPSlNMEaZL8UvsGwBFuyytvZmZyEJfr14P6rjMnhdDcK/lMfqSlcAZedbfhTy9
	XW9a3FEyqiQ+IKy89P5sCYo4aTwNzubAN7pOEMbjMpg8susYIAgrbs3q5MerQeTGVFrLD+Bu/iPzv
	NQige08WHuMYlSpouy7tvZiZKlnu0rnVAaj0iRKsQqOhqVIebZ72nvs7z87oHvneB8XByQjE24DVk
	LMdB5B1Q==;
Received: from ip6-localhost ([::1]:25296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe4B-000MOe-53; Mon, 25 Aug 2025 20:45:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50240) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3K-000M7E-VK
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=2xlJXPzPk3P1CMeruOsdqKAMRmOlgnuQV272X11hZWs=; b=BaaeR3HlgAa9rxwGp0hdr+NKd1
 DPzP8trxLBf7XMnF5w+DH6jYXqtFLSr/s7kwdlhO9mPjZ0HdUHqbT4VmIGiT1mn8XEpeP/cA0OSTa
 m1wLO3K5bQMAo8P409H4k8d0FkiuedWjuf/3zNizkdsx/1UK7mgtdiFCX2f+s2Al4THTYe0+i+xFZ
 DvfCfYw8W/XuI8FgzeqiBzQc1JHxpsXagnf4yoMbrJViAUjORIxJCh9YWXIICt0tWRrKXHqUVOrON
 i0+j6HD886TK7t6vFK16MQzlz+1flGb9w3wZegZpchxnG7s3+iTB8wk5lrQDqkBQCRmXYa6BAfECm
 bUOsOAAkC9NjT7SUgBnZVf1pvTqwW9DixqCs1lJR7coZtAQOjozdgs6v+V/Uk4naXGnYFw+rp21YW
 OAGgKnFUBcoTZbrTudfYP51Jup0lQgP0qDOGOTsAdYbg59OII05/AjJDUFJPn0gZpxx/z/4XsZS+W
 TF1UMdghmSV65Qe76pUfoj3h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3E-000jeQ-0L; Mon, 25 Aug 2025 20:44:25 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 015/142] smb: smbdirect: introduce
 smbdirect_socket.workqueue
Date: Mon, 25 Aug 2025 22:39:36 +0200
Message-ID: <bb8d3aef2a5f89376f84c4a032b16707960de1d6.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The client currently used a per socket workqueue
because it can block in a work function
waiting for credits.

So we use a per socket pointer in order to prepare
common code.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 5df0143ccd6a..c4e37c156f46 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -28,6 +28,14 @@ struct smbdirect_socket {
 	enum smbdirect_socket_status status;
 	wait_queue_head_t status_wait;
 
+	/*
+	 * This points to the workqueue to
+	 * be used for this socket.
+	 * It can be per socket (on the client)
+	 * or point to a global workqueue (on the server)
+	 */
+	struct workqueue_struct *workqueue;
+
 	struct work_struct disconnect_work;
 
 	/* RDMA related */
-- 
2.43.0


