Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C128B34D96
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:07:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xVjElxzo01vce2UlkRdu5Ph77c/46mdDTzRPpDbX8zU=; b=l+BCyg1syCbcEQ8rvATdRuO58i
	zrQbZj38n4yTrrveJTXJYuHfm9OcJXb9njgzKIFtm29ozRtMO6vZ5CrlivYTipPF0ytvo01mCUAZ3
	RYJ5f2sCT06sPVOqBFWNHNaBDWO9iZAjrpIW7ItnJGv5WuDhuc3ViwzWONTjv2vcOX1+ueRa/tQ3z
	PNztkPVOyVh4ycUSDNPB2M++ZqxEfVpr2Vf/abIBqCHTFnRXkRh2FX3+Ti7wRpyJFNdqWGMXCe0eU
	FGU8ZtNafp02hRl8AUjUpDNXuGYa4pv6xIBMXCtooUGcGBfI7USEzVRD9yEnTv/lgLDPvbnsbzrEJ
	p9QLA3Ng==;
Received: from ip6-localhost ([::1]:58624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqePW-000VJf-12; Mon, 25 Aug 2025 21:07:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29420) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKq-000TK0-T0
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:02:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xVjElxzo01vce2UlkRdu5Ph77c/46mdDTzRPpDbX8zU=; b=qTJBNw78jPyXwYSYJ6yijoOWwt
 1LP7QWMyCok2HgesXRbAWhfvA2whJpy23CXPFRC47m09PeLSARwJCJSRFNIoWSy/C75V1vu9vyOQ8
 5JQ7TKDaiYOsa68/RAP6xeE5g3FO/mczMBv9m0D3v82ulIQU4tRS3N9SXtIBOaVlyWLSlp+6+Wwd9
 JPGfbFWF1UUvKon7MQMbI8dXAxx69MI6cE9y2Mq4ZIDSe082AN34nHECn03TNZnJafUyzftKXsI8T
 IfC0c1VF8qDVKZRldGe/uHlfqiMYzqWdB3wBCAvDvVLahbMxMUYgl7NGUW2kztOUH1FoBCk2yad1T
 8hQAT1gb0Kl4jrf7xqTIg0k1UdVwDUODvDWuWlwK7y88Hkt0lvpeN7+TAGXGOlkTb4ecHbGVye2D+
 gVzJtjMGC+1jn54SPFWqwwvv9+6LUUsrec+EADNwxwDwr528u7hPxnFUOp5KvfeBYZOcrm+LonOeg
 cjEDuNBKmDN3rp2pNda4zWMg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKo-000nNO-1C; Mon, 25 Aug 2025 21:02:34 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 125/142] smb: server: pass struct smbdirect_socket to
 smb_direct_accept_client()
Date: Mon, 25 Aug 2025 22:41:26 +0200
Message-ID: <65e3af9b8ddb10ca302d7b0491dad831c46f1535.1756139607.git.metze@samba.org>
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
index 21271c8a9573..99a8e1b1860d 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1656,9 +1656,8 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 	return 0;
 }
 
-static int smb_direct_accept_client(struct smb_direct_transport *t)
+static int smb_direct_accept_client(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct rdma_conn_param conn_param;
 	__be32 ird_ord_hdr[2];
@@ -1725,7 +1724,7 @@ static int smb_direct_prepare_negotiation(struct smb_direct_transport *t)
 		goto out_err;
 	}
 
-	ret = smb_direct_accept_client(t);
+	ret = smb_direct_accept_client(sc);
 	if (ret) {
 		pr_err("Can't accept client\n");
 		goto out_err;
-- 
2.43.0


