Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9E9C1ACE9
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:40:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xwmdRwumXMGb+fJQetHzL5yN5CsEsyORP95k/Oe/bYI=; b=OZXaugKDhokO8NLdC8/aV/ugGQ
	P4IPFoPaee2+pshZNac8k69+fPOzGp/C+xbMbfnmd/1x0LffxcwUusBfbeF1fiC0cEoTf08M50dfE
	Bi2LliqAXGBv6iTUiQDuiJmZ26r6kfR+yvgawmS702YOrW1Tiye+yhgtUzoR75sap1Q8Z3VPWteHU
	dUon1eaC3vcS5YjdFNwtMuer0rewzZ65xpEk6kMA5aCmaJA41hKbFo7D7zKGSB3Tj26FQtr8ItLIo
	ZWjnXMaxiwOfOkm39SV61ryQUFBGTNH25kCfBgXRyktFp6kngAgAWHr0ueG0d8uP1v+mo8MvRNt09
	Tl+GW8EA==;
Received: from ip6-localhost ([::1]:52586 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6PP-009ArH-Jo; Wed, 29 Oct 2025 13:40:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46280) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ev-0097I6-8Q
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xwmdRwumXMGb+fJQetHzL5yN5CsEsyORP95k/Oe/bYI=; b=dDBrKF5n1/j4vG/9ngdl4hAcyR
 TrR0lUOJWbrU2hxcF+q3t9cc9z7ri0Dl/zEHKFFnUsLEFldLEDuQ+0ThcxbO25c14807F1kDVGRWG
 4dKWFXS1Um5fv4/VzexJYX2tj5E7W+PJleXrlGIdC6VmzMdwGALsQh1RIO6U168buzBU+RbdRCqrd
 M+T7klxqOwo2t8PmL+ao8x63CSiCN/uEbe++wM8OU5/kiYeUhu4YIUQ67RLxyNaghfP10RbpdJ0Sw
 aXvsdd0vzLmvRdZIxyV542dK7A3VWwnh0ZVSlYfbsiiaWxgt23BCldf5bXlxJulZal5D3TSnC9rUJ
 HhyznXrLxjky7sIsioKI5/1ggUKMWuWNPkqeD1ijbTai7iHwywvI83KSRID7iCBbYeo5p9xDACjDs
 0mrRCWCDXMzr+sXclXcYaUbE/wSE1ad2VPdxt3+FdMrwF+76h93Nc4NCaJq9qi3CZ0oOa47+POMx2
 LZ/jVqlAximDrILaRozlzMl7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Es-00BcEw-0s; Wed, 29 Oct 2025 13:29:22 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 070/127] smb: client: make use of
 smbdirect_connection_qp_event_handler()
Date: Wed, 29 Oct 2025 14:20:48 +0100
Message-ID: <68c644c4660b5f908e3dd1b0203c261bf30adef8.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

This is a copy of smbd_qp_async_error_upcall()...

It will allow more code to be moved to common functions
soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 19971f7c4670..9326023c4afc 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -343,26 +343,6 @@ static int smbd_conn_upcall(
 	return 0;
 }
 
-/* Upcall from RDMA QP */
-static void
-smbd_qp_async_error_upcall(struct ib_event *event, void *context)
-{
-	struct smbdirect_socket *sc = context;
-
-	log_rdma_event(ERR, "%s on device %s socket %p\n",
-		ib_event_msg(event->event), event->device->name, sc);
-
-	switch (event->event) {
-	case IB_EVENT_CQ_ERR:
-	case IB_EVENT_QP_FATAL:
-		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
-		break;
-
-	default:
-		break;
-	}
-}
-
 static inline void *smbdirect_send_io_payload(struct smbdirect_send_io *request)
 {
 	return (void *)request->packet;
@@ -1478,7 +1458,7 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 
 	memset(&qp_attr, 0, sizeof(qp_attr));
-	qp_attr.event_handler = smbd_qp_async_error_upcall;
+	qp_attr.event_handler = smbdirect_connection_qp_event_handler;
 	qp_attr.qp_context = sc;
 	qp_attr.cap = qp_cap;
 	qp_attr.sq_sig_type = IB_SIGNAL_REQ_WR;
-- 
2.43.0


