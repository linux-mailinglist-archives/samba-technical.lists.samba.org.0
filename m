Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BFB1DB69
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 18:13:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=J8VwAIG8jBZik4M9J45UPYRQfEYGVaXkhKjPtz9bqAY=; b=QsthABJixnzm6DNFlHdEbBZIpH
	ZZi+v/bdLVgQQC5PpHvILanQj9O4TD5vrW7DtRvrEYXR0K5gYiT17L4KHvxR8iS+VDm1LbFCW9nX+
	Ifj+IOgh2DA8jghKitaUCPxAkUBHryBr8FoNF81GOcjZBZHaEcMBts7OZ1NwP0cVpmrV12MVyUdAZ
	1gn+qdmBf/CnwcZHuoV1FO3hYpQglHqDnJOwhIoQGcQfeax9rofaVScofXMs399yikSOoMccP1dNQ
	iWAGbC+9TqoKK+tnfQ9BQbqXPn1ary1B9HjVX5PuUSMH4JuY4I1T8nUr9Wi9ZklOs4jxwFOUSITfp
	mMRM6/+A==;
Received: from ip6-localhost ([::1]:43634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk3Eq-00EZfs-9G; Thu, 07 Aug 2025 16:13:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:31908) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3ET-00EZYi-2n
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 16:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=J8VwAIG8jBZik4M9J45UPYRQfEYGVaXkhKjPtz9bqAY=; b=wQN9Wf0kXBKLPyfwYWuNfLXvwu
 AsGfv3z3E/RRuy7VUy/6qxkuqiAwvoCHoJm5hcpszQOb9UbYqFzScYlL0uLWLcAsTHvkF2cHCGN5t
 H3tEBApE5O5MsvnDVfFpN3Pvi6fBS0mOC8yYvCnxM7EajqwiZ1vpZeiOadFH2Y+KUm+4NL5MFaBkt
 0ffqScSB/nWaSlEkBrVXcenzQWnP73udUP3cB/A1Ou4RTxaaoXjMecm3Vb0exWSOuE5M90SfxnRN8
 ilhzVF58zyJLjdSp7RzCwLQ75ejw4pScwx8loLgsC/ejt+fJl78YG32P06ew8SJztamrCAxjz3YiK
 53lq0PKGQ9LmyknkHlMNe7MiYoGK0oQO+yv/h1MsZB1zGhVjVgJIHq//lGYcfzsA+IJ9+IKMW2TCE
 U5bLaFENUlaIB3cE/tPutRZVr9OmN+6dfcAgBJC0hW5dqVF+WV5tpArnuaENDqpzppoOYvZlnfrac
 vS0C8yxLz7DuC6eK9SQUaWAP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3ER-001cZc-0T; Thu, 07 Aug 2025 16:12:43 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 3/9] smb: client: don't call
 init_waitqueue_head(&info->conn_wait) twice in _smbd_get_connection
Date: Thu,  7 Aug 2025 18:12:13 +0200
Message-ID: <34eb89b5573045e9c5424dc13f223d3d79cf257b.1754582143.git.metze@samba.org>
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

It is already called long before we may hit this cleanup code path.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 8ed4ab6f1d3a..c819cc6dcc4f 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1716,7 +1716,6 @@ static struct smbd_connection *_smbd_get_connection(
 	cancel_delayed_work_sync(&info->idle_timer_work);
 	destroy_caches_and_workqueue(info);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
-	init_waitqueue_head(&info->conn_wait);
 	rdma_disconnect(sc->rdma.cm_id);
 	wait_event(info->conn_wait,
 		sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
-- 
2.43.0


