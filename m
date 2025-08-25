Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 92382B34D73
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=CF7X9Xpms/Oi8CEudNpU5B3be0ADA/GuqLqE9myqClI=; b=bzPQH1lK1aBpldHz60b/6RNfR4
	P2yTOUFmGWYgQYIFgozmNL8OFBVN8rdfF/viNiFNcBqjtAHCCU+IKubI0i3fcqMOYbP2LpYx4bWur
	8fI2yAhK17m3fUcAQwno4WdZ6Ta5LmZc/6rO5dGGRPfkZ4Hl/ecH/ScFIPPXw6kvxE6OkHy69nPe/
	NEK9YQStNCcx8EgVzjFKtgeCalXRDiYHeIJfbnKD3JNwNAZyP4xyZvZEcJdWSXEP9dlbj8Uxn4UYs
	h26FJ89OmgknLyuRu2tlo5MDYZnM9EW8/4wCMIAVrVoJSa//z3g7lTaL+xWsKwnbHmXaZpWI9EKZv
	IgEt3GbA==;
Received: from ip6-localhost ([::1]:50338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeMm-000U6P-9k; Mon, 25 Aug 2025 21:04:37 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13200) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeIR-000SIV-Ht
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:00:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=CF7X9Xpms/Oi8CEudNpU5B3be0ADA/GuqLqE9myqClI=; b=HJiSHGlqMDKJTOqI5Sj/qxpTnD
 +dpd0ncNNxW6O2hwj9exl/RfzPnc+AclfvI4/doScOVVEGQt52WL9lN+T8cnVnjrO/NeSx56QrC8f
 nBnx9RZgTHMsZKycneQr/6u2jCeAWqU/b39Z3u2d9loaE5rM9S7QWoBelKfwomrQyick/4yTtXK7u
 G1F0mBbcJThukK2T3UxJatSP5xcVWo8hNUuNQWKvJ1QiJ71zB+Giwgz+T4hgw9NR+00K51tOA3MG1
 87AIPAogdgvLkxu0BGmQHclZcb3f5PVgR8r1NLNC0flzi9VUyjcB1cHQsc+mmOq4vhYjr1wpEwgRt
 4OOZwDAwl4F1k9wj22K3928jNwuLvd9de7aZm5nUiodNGWlxG5QYn2ywZ+2UASHDM8+oXBAheM0cA
 sOed8FWq7TTWONI8fZy63nRfwGtuYjsLq2oS1T2iaHrsnu3DRyPnIpay9jf4+mN+fnXFCrbbJLt7P
 8+DkXS6+M3fXc+LoAInypVc3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeIO-000msH-2T; Mon, 25 Aug 2025 21:00:04 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 110/142] smb: server: make use of
 smbdirect_socket_parameters.negotiate_timeout_msec and change to 5s
Date: Mon, 25 Aug 2025 22:41:11 +0200
Message-ID: <67713bfe52a3240c771ccc8b4dc8075ba5b3dd3a.1756139607.git.metze@samba.org>
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

The server negotiations timer is just 5 seconds in Windows, so use the
same. See [MS-SMBD] 3.1.7.2 Connection Arrival.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index dfafb4f2218e..9bc8431821b6 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -33,8 +33,8 @@
 
 #define SMB_DIRECT_VERSION_LE		cpu_to_le16(SMBDIRECT_V1)
 
-/* SMB_DIRECT negotiation timeout in seconds */
-#define SMB_DIRECT_NEGOTIATE_TIMEOUT		120
+/* SMB_DIRECT negotiation timeout (for the server) in seconds */
+#define SMB_DIRECT_NEGOTIATE_TIMEOUT		5
 
 /*
  * Default maximum number of RDMA read/write outstanding on this connection
@@ -299,6 +299,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
 
+	sp->negotiate_timeout_msec = SMB_DIRECT_NEGOTIATE_TIMEOUT * 1000;
 	sp->recv_credit_max = smb_direct_receive_credit_max;
 	sp->send_credit_target = smb_direct_send_credit_target;
 	sp->max_send_size = smb_direct_max_send_size;
@@ -1954,7 +1955,7 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 					sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED &&
 					sc->status != SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING &&
 					sc->status != SMBDIRECT_SOCKET_NEGOTIATE_NEEDED,
-					SMB_DIRECT_NEGOTIATE_TIMEOUT * HZ);
+					msecs_to_jiffies(sp->negotiate_timeout_msec));
 	if (ret <= 0 || sc->status != SMBDIRECT_SOCKET_NEGOTIATE_RUNNING)
 		return ret < 0 ? ret : -ETIMEDOUT;
 
-- 
2.43.0


