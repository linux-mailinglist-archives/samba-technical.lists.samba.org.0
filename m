Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8BDB1ED3F
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 18:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ajfeVZwkk1jxAUTyHLfKrwIbk+GwICQLIc8hekLdP/c=; b=BiyZts82dSTi/YjXMynSPUa1qz
	+grzTA0GofU4rdI5ugDO/oPkToc79HPkOrMCoK3BPKGaXfixBB/HsOox7fg/V+ziFzCEH8ZNOq+pR
	H66I5bq80OTMd7KdHfvYlNaWsvfPBpDarouO7IFznUX5/Ny0NYB25JCgH3jwk0pk4B1hDyQGN+3cR
	KTjzgtJelOu4tfkH5OpiTcFW+zh3Mqt/qxtqiOjYhO+M+/E4eKOqRrY5Nnlqdw9A68aBBUweNA9e+
	aO4OxryJZgvAXAJd4aYlQOsncBr8yILMNscJZ7kC3cAgVwHLJROrj/3hrKxnpAJ5p/3sEKPcsOVIN
	Za8SdVEw==;
Received: from ip6-localhost ([::1]:47504 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukQHL-00Ehzh-Vt; Fri, 08 Aug 2025 16:49:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47296) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQGw-00EhtY-Gp
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 16:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ajfeVZwkk1jxAUTyHLfKrwIbk+GwICQLIc8hekLdP/c=; b=2EVPU1yFkIikAao0cULLAEl+Ah
 cKzFHEtalHqNwlJOhsauqvlVVkpqNufoGp34igUurnFVnhZjAAnsiQi6NVbU8Aa5xfv8SoqiG3Ut9
 RkamloArHfVlEw9sQQc/fb8+4Tz0Y+yV1New/tYPfk5MDJrybMaB9X3FG4kuDQ4uPo8e8ilsv+3I4
 LzeLz/14eQq7w+RRD9xUuzckUDeZeiUjRIXTRxKEzOYcNR0h6+YGMXrt88Xddvcz7rh/Ka2Iq64Ck
 7OBFJJk67QL7tMsFWZGcrY404LcEWY5QasQYu6VjYQiDHQnvzloCnnc87tPRs1RmRGzR6BnbJSRYI
 s76+0t0J/CsR4SqOL8hkverwVRNR+kyTNbUyFcs1rJ3SBpfgRoH8Hhx7fcjYXPQkvBXYRbPrqlMl3
 eWRVUy9NWIDHAb7S3C7wC+ti9O4LJoR7kmxvSYFqKxJs9vY04iv+8qbIpaYA3i/aPXkrVtCW7JHwn
 sqBIKJkl1q9bRzqHVxas7hOA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQGu-001qO2-03; Fri, 08 Aug 2025 16:48:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 3/9] smb: client: don't call
 init_waitqueue_head(&info->conn_wait) twice in _smbd_get_connection
Date: Fri,  8 Aug 2025 18:48:11 +0200
Message-ID: <30e8bdb47efcdaa1949297a1a427e6699e82b307.1754671444.git.metze@samba.org>
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

It is already called long before we may hit this cleanup code path.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
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


