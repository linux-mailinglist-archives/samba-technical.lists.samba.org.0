Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E15C86852
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fqHPvtMjMkvOI+6JWcJUnocC08qNvnbm5/Vkzdae8Ws=; b=pH6ZG8Vjc9rHw5EVEPi+WOIa0t
	nTg+VpMIYQazf9e9B9fyrSPJBGsmAbGMvcquXTnNPe8oRyr3Ai3mILDuyFOnA5hsagd8ALdhGlJNO
	/17atXleQa+TA0NSRFTB7u5DFArm9p6JXKO+KFYo4ugpKAUxDAWEMI+D80c6D1pNFK2bP5slS1XeB
	FMzwEVfJCWme51GkHhcErd4O5pjKq9yNbEMneZ6zn37Mg3+Gric5WL/9KVv/u5tUooBGFD8C23UB3
	dUbyZZkNO6hpuPAAKrBx+qA5VWnyblFIMOskuIdBgMxQe4i0WbdihsPhLxo07UMOHHw730JHl7vXH
	eo/gKUMw==;
Received: from ip6-localhost ([::1]:39506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxYm-00DCHO-SU; Tue, 25 Nov 2025 18:14:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44092) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxTt-00DAWo-8p
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=fqHPvtMjMkvOI+6JWcJUnocC08qNvnbm5/Vkzdae8Ws=; b=3rgXF7QTHm3GT3WtY94R6MyasX
 Wfug8L/42BlDr5/0ZHKMxomZUTaJ2UrjfciMK8BVCkSaKfPBmGXe2TMfva9NyXi5yFyRhQZUT0smG
 EgbEJ1r5XGSvV6hKZcBjKRqm5lcwiuIEbCaPoqKfpXt7WgsFAmxAH4i7Uq7Mqd2kCW1JLdkrjSesX
 ZzDLVT9BTgk3N+7AxTS8npkLgGB/af2SxDjvRlbpGIb3kuAA3MjCHXvu8gV6cdOJWLtd3lEJCQ5jV
 htrn7F9SInfZVfFo/f8RQKR2ahm9NlxQQBKERJCRDnr0uksWscKVvrkrI6cUwV2uxMaJtj5uL6htd
 Pev3ks9grMswSnC/PNyxC0Dyw5nMXvMldjXebhGmNMjPP+Og2kiuecEdAQpsPbA1eXigx8Ey3ZjQk
 7kfKMdBSHK/bs/O9lcf7qlfWtC7RroDPongKO0OxlWk/9JjAqPGfhEpfvJ4Sm2Fi+YefFQxYmjS1t
 KUpGp/ab6OyxQolKM2qbu8Vx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQc-00Fdk0-1O; Tue, 25 Nov 2025 18:06:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 075/145] smb: client: make use of
 smbdirect_connection_qp_event_handler()
Date: Tue, 25 Nov 2025 18:55:21 +0100
Message-ID: <8ec0819d52cbf8548594173a9129521a725b879b.1764091285.git.metze@samba.org>
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
index 81130420434e..0d5674461058 100644
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
-		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
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
@@ -1479,7 +1459,7 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 
 	memset(&qp_attr, 0, sizeof(qp_attr));
-	qp_attr.event_handler = smbd_qp_async_error_upcall;
+	qp_attr.event_handler = smbdirect_connection_qp_event_handler;
 	qp_attr.qp_context = sc;
 	qp_attr.cap = qp_cap;
 	qp_attr.sq_sig_type = IB_SIGNAL_REQ_WR;
-- 
2.43.0


