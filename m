Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1CB8E76F
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:48:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZotanPfuqXC8gKv4kgZSupTobtQq+Z/W2VKej3T0u2Q=; b=WVIejX5V+F6Xy18zwWh2K3D4lz
	1X2KlROCjsYtr7K8Lsc6Mr5rYq8LvgA/pr2yCYCGCbY0KGO/ngm0kML0OlPSDK99Nh2nEJSfCZ3LG
	3g7P8qhcVhq+/LRdYrExQydh6X63J7HLsln089nizhiMvgPq0K+OUmhSx0YuSxX6mFJprZK0uhu0C
	ktm9C1pojHY3iEYGQTKJxICebtQerXI89wDMqvdhsdCrCwb1de7x+znaZ12Z4EW7dEi32Gymf1q62
	bVC/SLa8ZkrvN7Ed2IZfTo+mA0mKmKF4OCP39KKnzvFpxTVFpr0Z4EELli5h97FAuf2LJcPOIEUdD
	EpqpIkLQ==;
Received: from ip6-localhost ([::1]:26202 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0Rv3-004TtC-7u; Sun, 21 Sep 2025 21:48:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24590) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rto-004TV1-1x
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:47:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ZotanPfuqXC8gKv4kgZSupTobtQq+Z/W2VKej3T0u2Q=; b=h64fKPZ3QAMfbF0ut0VNFqMBO6
 9zsJtfvFAB2UPikMQdC08x9zxvQoO8U6kXnhRh5vWtTpzGVveLGvsKXyk1GvySRjuujff/iAWSt6n
 GtNBGzU+vM8FTzjtxl/mLegVNXLVAFPDKXZuV1kY9v1ug8d7XY1A5J44FH9M42JDe34KE8G2+iE1B
 /64+HUvkoiPRYbsJp/rzJyScJsOEwYSkkZqnTkL3P6nsKqnj1AMEOBM2BsRxHpoPKXakfZPnJg57G
 X26x5JU2d6K4fUEhC6JaMdPrgnDR4Mzi1ZpKeuQXD3SNNzQ+7lRDqsj1IcjCydIVVwOFo9nRxKax/
 t4TqJTuuN+hiitfWUIbl45EkuF8gx89RSHBrvYQ9ZSlcBHe9t3KAGFx4jLm/RM293IusSQ0+M6XGd
 TeuKuQPWLgr31rVN4jLDb0ZtC1nmQYCYj6Y73LmTxKUrGdpCH3PfHH+1HqVeGmIyJyM6mtXbQjAmu
 5bmpYyvQ9ZuQcT/9qL1ptGTZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rtk-005GcV-2D; Sun, 21 Sep 2025 21:47:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 13/18] smb: server: fill in smbdirect_socket.first_error on
 error
Date: Sun, 21 Sep 2025 23:45:00 +0200
Message-ID: <7a4ab9b767693f8b4f96ed85b9f83628d04b8c9b.1758489989.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

For now we just use -ECONNABORTED, but it will get more detailed
later.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 67345c58bfe9..44fa0af21b45 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -222,6 +222,9 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 	disable_delayed_work(&sc->idle.timer_work);
 	disable_work(&sc->idle.immediate_work);
 
+	if (sc->first_error == 0)
+		sc->first_error = -ECONNABORTED;
+
 	switch (sc->status) {
 	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
 	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
@@ -259,6 +262,9 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 static void
 smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
+	if (sc->first_error == 0)
+		sc->first_error = -ECONNABORTED;
+
 	switch (sc->status) {
 	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
 	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
-- 
2.43.0


