Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F884B8E6FE
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Tvcib6dIRKFpE5R5lvG/nteozSxdGuOWP980KtNsmVc=; b=P4Si9UXISkBYGc3nofgru/K22C
	B5Kxa15ZCQ348edYxLb/OUQt8CZsSu8hCzuk+13ToZzy9fh2NNW1rCTJekoe9ZNF9naEjU2Naskki
	Ny5cqhG6Kxx6W7dGLdcJKtuaS4CNjyFf1rRS9W8b20WLwFhfj+cOprSMtwzemUmrYLZ7Ijcj9issr
	HNTf6KXFp9J7Oc4IhdDnkhaUqAvcBjOSkgnVZZsBVF4ePzmCyuKHbFjSDTHnpMoBH4WFKRcRfXDhV
	ebquk/Z+7c7tC02WclXW/R86wennDaJoCgrEU7Eik/0FcoMqF+nFyjEfAq+bYwK+O8IZrwwcSBkFq
	HwrqvXNg==;
Received: from ip6-localhost ([::1]:52078 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Rsg-004T4G-PQ; Sun, 21 Sep 2025 21:46:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24120) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RsT-004T0F-1a
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Tvcib6dIRKFpE5R5lvG/nteozSxdGuOWP980KtNsmVc=; b=Y6Wv5NpAC3DOg6EtkcmH73YLQQ
 vi4dD24dmx7PooVAlqoyeVxIyG6biVE1dNrbeTiH+oKhvTWCjqIlAnbqTYXYfqBQw7MEsXaTFWQiW
 ONVr0TximFyt7xODtUiAw7WQAyawID9hVdi2f5lbw3dK8ZxSfYDppfVSg2afx29QUsHEWzWHljwL/
 suQjrTCd+Fay0KnrPhNn+sG0OrZPz/d4OMiXtbO3pEHVKiKoFEeKqfa0/iNPL04DoXnhu0XLrEHk/
 wDARoP0dStzbEfR2gkjmQqbL90kZi1hMfqdLJNFGbWn+MDqTVo/T+4liro5YSefYUljgskenmZgv4
 Vv90VOAgrv8kNIPy33gl9xu71NQFmiQaDo/wW/ZQ2pdjZvkyQ+u5nOqmj8PnTtl5LQvMKCqn+T6cs
 vrmvYbnQHoKBK57tXw7FI4FBu7UwHC+WfxU3xt6wUyCFD1km0i8UUlq5FfDypRocqQbAs0xwDdNyf
 W86zBQhGje4EuRHTIlSL3vk4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RsQ-005GMe-1J; Sun, 21 Sep 2025 21:45:46 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 03/18] smb: smbdirect: introduce smbdirect_socket.first_error
Date: Sun, 21 Sep 2025 23:44:50 +0200
Message-ID: <d45911e332bfdbf2b2948d1f5e460abe85c38581.1758489989.git.metze@samba.org>
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

This will be used when a connected conection gets the first error.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 5e25abc02364..db22a1d0546b 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -83,6 +83,7 @@ enum smbdirect_keepalive_status {
 struct smbdirect_socket {
 	enum smbdirect_socket_status status;
 	wait_queue_head_t status_wait;
+	int first_error;
 
 	/*
 	 * This points to the workqueue to
-- 
2.43.0


