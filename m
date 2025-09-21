Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6FB8E769
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:48:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6BfYLkFDioZezMId5wyusiJbKPkT8rO/6WyQV68h0q4=; b=aBl760cfzAlv6VXc5TkxauPWce
	YR1KvN/MA9qYnfby1DBB4qztep8Et1V3xJA1c522jQPmhhp0+3fAlqL6QHcmWxAe6Ibt+J4Jf4Mca
	WPfMjXr10giUxAIulibNou9BfEgLAeL/n4PbMGeAyJjOOUoq6AVSMydtOrrRgX+A9vsR0rILm4X4v
	pi4GOJPPsqRSWipwdwwikuBgIkEide4XTmpOoH4Czu8UG1ZKs2fOU++haIyqhsKKhlZCBql8lYf5E
	nzuJTTfgLCjTWPqGm7H/zgdlUbsBtW0joC4qMMMCo+haGNSmiphbtDisZ/gzpPCSiiV4GpFMq8126
	X6CIwVoA==;
Received: from ip6-localhost ([::1]:36016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Ruq-004Toa-K2; Sun, 21 Sep 2025 21:48:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33680) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rtg-004TSj-Dv
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=6BfYLkFDioZezMId5wyusiJbKPkT8rO/6WyQV68h0q4=; b=0v7AbYCgzDG7tIbV1uzpcD9dxX
 0epYDoiqLwogNZb1kVyRMoOPFp+XqVYeQHnvAmSkYgTVjPvPTr3SVywF6HnoZUY3PlpYGQmUuPkW5
 XJlczU4ZuH7HH8pkk/9rR+B6UB1NzaVp2eHoPBHvJBU7q59uL+QduJ1kzJ8OTYYN/iG35PyyOTkHd
 WEEJA0u0V7SVGlKgddiO/rRj+AuU0X+tsJ8FozGbg0zoY+k0aApfVaz8b2XoXbD8fjCB51A4U1Gpd
 5+dDf11aZ1oKQvvIF122L1Vk8J2A6Zvw9D6oUUcNfue/WqhLWGnv7kpNdFgi8VOQ4V1Y9Q/n4gBZO
 AU1TuUmzdWy+bQalgvOXS3NiCXfKHmzKauglg1VQtNkXK2eQWUjeM7hOMSrocBu33MWJYctu7myIG
 RgNCqHvlkB6L3uL3sAlcuIEbwB/bRKnlt8XABlsa7hHHnKycBtkJW6IrnQ87/zmDwR31HxL2G6ppp
 eaG4q916XUr5C2eUmmk1SVLN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rtc-005GZm-0I; Sun, 21 Sep 2025 21:47:00 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 12/18] smb: server: let
 smb_direct_disconnect_rdma_connection() set SMBDIRECT_SOCKET_ERROR...
Date: Sun, 21 Sep 2025 23:44:59 +0200
Message-ID: <f93ed3acdc20d019b290b274be60b6a2b5f54424.1758489989.git.metze@samba.org>
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

smb_direct_disconnect_rdma_connection() should turn the status into
an error state instead of leaving it as is until
smb_direct_disconnect_rdma_work() is running.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 40 ++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index a61898ea2a3f..67345c58bfe9 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -259,6 +259,46 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 static void
 smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
+	switch (sc->status) {
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED:
+	case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
+	case SMBDIRECT_SOCKET_ERROR:
+	case SMBDIRECT_SOCKET_DISCONNECTING:
+	case SMBDIRECT_SOCKET_DISCONNECTED:
+	case SMBDIRECT_SOCKET_DESTROYED:
+		/*
+		 * Keep the current error status
+		 */
+		break;
+
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
+	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_CREATED:
+	case SMBDIRECT_SOCKET_CONNECTED:
+		sc->status = SMBDIRECT_SOCKET_ERROR;
+		break;
+	}
+
 	queue_work(sc->workqueue, &sc->disconnect_work);
 }
 
-- 
2.43.0


