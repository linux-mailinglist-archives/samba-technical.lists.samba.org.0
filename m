Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AEDB34DA4
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=C+mqjZUyj4EMMjQ0fZt0U2DSls4tURl87r2iFMFbYk8=; b=JhH4u77uNU4X/+eFPEXER8c89h
	Wl4uDAxB81ejfJrZxOwfOsOzUG/L+x4IG4m07hLI/rQeVk9B5gFrm1kAagcBwFfOmc72shEiaUDqI
	vYydzGk//pEfSPXHVpvt6h8Os219oCVEiPskuB1exaWidR50EXaFBvELYkIWRbx2fs88alAcdVkwz
	8wwFKBqCG9IlJNK+UGLA1U1qIPzGRGfsbIMKkIJGes8plTsKKZYxIZopw5rNHP9ybrMTplQaNSrDD
	tSCLefjcP99VIt8WMpTdm62uTmaX6cb9FH7Z+43bUSUaBwK1KQ8uAIjo31n7v4geIhiORrXKcnGJz
	u/Rz+XiQ==;
Received: from ip6-localhost ([::1]:55956 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeQn-000VxH-1a; Mon, 25 Aug 2025 21:08:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49948) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMD-000TuK-36
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=C+mqjZUyj4EMMjQ0fZt0U2DSls4tURl87r2iFMFbYk8=; b=eGW+aRugVa9G2Run5Y/4zdPAC1
 rbU1sodJLC3AvVPnN0wLaZxWTN81fVC1idmZANdQlRL6AppkdW9kahSYM9o3YMHz7QqJbhhPFWDIH
 hmhNVTlGENUGIGzodJUbTTJEikQ2AByKUvWPgZcFMfH68pObk+hie8Q7JobRyAhzeEAZz2SgGa639
 AS9bZVvCsKC9EJfuYJK9P2zE2ulxiK6+tw0rEFpr1sqXaiCGcdHZTo1BSeuOK0XHHsvZQl3aVKhHz
 N2hqamze9TIjWbudyRhUHhi/ElpByWOjqIDgcNlBOYupK80gRCtDn1GvBiHJeaj1WxXMUv3svkCOb
 HioCvNgsHwPZJxPeh9epHpnHsZYt4+6M2/YduprjgSQSjRGE4zK9euh71iqGeYUYrDxLKmZmzvqYZ
 LDSkdGBfYFtsu3Qf4V7jCVKxIKezMY70rZcPBQgWHdCQzKscIIP6BLxPCrz4kjYWD9OBKvNFY5px4
 oR55YKC1iIjYORVuZgqGJjK0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMA-000neO-2W; Mon, 25 Aug 2025 21:03:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 133/142] smb: server: pass struct smbdirect_socket to
 wait_for_send_credits()
Date: Mon, 25 Aug 2025 22:41:34 +0200
Message-ID: <2205cb384ce6db174e5e46390faf2d21b60ae2fb.1756139608.git.metze@samba.org>
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

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 370e27bbcf12..defebe773b8a 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -967,10 +967,9 @@ static int wait_for_credits(struct smbdirect_socket *sc,
 	} while (true);
 }
 
-static int wait_for_send_credits(struct smb_direct_transport *t,
+static int wait_for_send_credits(struct smbdirect_socket *sc,
 				 struct smbdirect_send_batch *send_ctx)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	int ret;
 
 	if (send_ctx &&
@@ -1162,7 +1161,7 @@ static int smb_direct_post_send_data(struct smb_direct_transport *t,
 	int data_length;
 	struct scatterlist sg[SMBDIRECT_SEND_IO_MAX_SGE - 1];
 
-	ret = wait_for_send_credits(t, send_ctx);
+	ret = wait_for_send_credits(sc, send_ctx);
 	if (ret)
 		return ret;
 
-- 
2.43.0


