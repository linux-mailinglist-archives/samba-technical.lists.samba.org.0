Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4E2C86A8B
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:36:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4RrLk4/r5FwWAwcAKY5N3aQMPt4sxOW3Rzkozzubnj0=; b=jXO+2fB+oaNCSDiP+KJ6Jx0J2C
	9H11Vaa7Xw9ZI/06VWbt1yKW3B/GXYltyZGLP9YWwzP7vt03EzUMJ94UOeN7+kBXLY34yvPSUVHaY
	NFoN20RVOVrs0vdnSsor5+YqDUxp7z5zZInco5Vc8wxrqSWXeOll8If22lcl5pk9LFr90jxX9XGrY
	NmZqOCiN+B3Mx1BsxgZwXNZRvog+ZXYs9HNdnheUlVCDyFTIp38PbP7TADmpua/nMDBdydNgUR+Iv
	F9psrL6C5c0nHyl3H36jUwQrrZDy58XKGUopHHkuqaORrBVbV0iiK/vi47+gYKeBdPvKcrnUldqFS
	LkUvmPrg==;
Received: from ip6-localhost ([::1]:34288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxtV-00DHYQ-JW; Tue, 25 Nov 2025 18:36:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26354) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxrU-00DH1C-2P
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=4RrLk4/r5FwWAwcAKY5N3aQMPt4sxOW3Rzkozzubnj0=; b=iZNDqMm7A03+VwOhTeW5q7xqvn
 cQ911DOCD0EwppTQjM12u1YmcA1a2b6CDAJNxW1e2BTJK2ppgOB7Pp8Nq5cFjPEYSO6UD7hEDSt0r
 APDU5lLIaEP3UpFU82ZlkTRlfwlb/HYEUcEsCcq0uPoBZavuEtxczDD0h+8TpBj4zkxIwJnktsk4x
 cBSHyRHsmGeMmk7RYGvwOW10lm7dAKmMoYn7yAp9E9t6Ab+RONlpsZXvEOI0Uks+CpHGtwjnZQDem
 Lh7/oF+iBSjQQce+TUdwQ3yaMFoRH+FJ4ImEMMzpi8BXcVwbsn6LDltWAuCdXWGAjUGlaceNpnx43
 hd9Ubs5qq0VuKmhbspEoRUtx/nAG4KGe40IT7g01nc1acQm2rCBAR2ITYuXpWoBtujuO8nr2hCw+/
 iWlnbqf3HyeCkVlY/PMgDDlhQ3ge2f6nspJ2k5LDKpTgVYU9CtsQeH6a75zetfFYdT9irA5LXKsVN
 7OTpz97nNE7M9gJyCxq5oxM1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxnk-00FgFO-35; Tue, 25 Nov 2025 18:30:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 144/145] smb: server: remove unused
 ksmbd_transport_ops.prepare()
Date: Tue, 25 Nov 2025 18:56:30 +0100
Message-ID: <aa3dc5a8bebb0aac5e97eac6192cd55636c1c701.1764091285.git.metze@samba.org>
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

This is no longer needed for smbdirect.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/connection.c | 4 ----
 fs/smb/server/connection.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/fs/smb/server/connection.c b/fs/smb/server/connection.c
index 66d6dab66ebe..71e2f522b05a 100644
--- a/fs/smb/server/connection.c
+++ b/fs/smb/server/connection.c
@@ -317,9 +317,6 @@ int ksmbd_conn_handler_loop(void *p)
 	mutex_init(&conn->srv_mutex);
 	__module_get(THIS_MODULE);
 
-	if (t->ops->prepare && t->ops->prepare(t))
-		goto out;
-
 	max_req = server_conf.max_inflight_req;
 	conn->last_active = jiffies;
 	set_freezable();
@@ -411,7 +408,6 @@ int ksmbd_conn_handler_loop(void *p)
 		}
 	}
 
-out:
 	ksmbd_conn_set_releasing(conn);
 	/* Wait till all reference dropped to the Server object*/
 	ksmbd_debug(CONN, "Wait for all pending requests(%d)\n", atomic_read(&conn->r_count));
diff --git a/fs/smb/server/connection.h b/fs/smb/server/connection.h
index 7f9bcd9817b5..784208d22c53 100644
--- a/fs/smb/server/connection.h
+++ b/fs/smb/server/connection.h
@@ -126,7 +126,6 @@ struct ksmbd_conn_ops {
 };
 
 struct ksmbd_transport_ops {
-	int (*prepare)(struct ksmbd_transport *t);
 	void (*disconnect)(struct ksmbd_transport *t);
 	void (*shutdown)(struct ksmbd_transport *t);
 	int (*read)(struct ksmbd_transport *t, char *buf,
-- 
2.43.0


