Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 30250B34CFC
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:56:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Mus8rDhtUh6j0CSQUCRAhqKGMFi3SLIzv2BweDqk/Y4=; b=AyZv57VCEoVhyDOHOY7T/JDR2q
	tNDmj1yW2ySOW+XVtfrihj7JB4943kRH+U+Oe0HzmvQQRcmUr0DJxnsEErWMcBvfvVLDWqqzGTgO3
	QoYTmow1gle5ZPzAhbiLMoJbVzVPkrsladSNLiTRibKu7mn0XrSahaeBwUHGar1dLxm/tD01oZlYV
	/vinLH+Yv7oEMstWeltqQqjN0A3Drw9GPFyykv4c+xjCioYMYn/mcbaOS2jQBUgi882T98Fv7LS7v
	ZQjvYEwMajLIXZJrwCplzlxzCnV39CO4x7QFOjXL4mMvXTulGN/R7mEGFpKpA56CPO/IYdZdAW1WV
	AaOp6glQ==;
Received: from ip6-localhost ([::1]:45526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeEw-000Qo5-KL; Mon, 25 Aug 2025 20:56:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13948) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBx-000Pem-Bv
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:53:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Mus8rDhtUh6j0CSQUCRAhqKGMFi3SLIzv2BweDqk/Y4=; b=tuLyOb1P0wVEGHpkig0uCBmf3g
 hsVPDQE8S0sGaY2tgIN/9b0IiGQj5YHUJZq8y147LsC2W6bGIbsUFx6mD6ldj5HkLI+87VAMJCRop
 xaAedWWyG/4VtDYH7g7DqXf6encUnEGjT+1SpHh8mOY8z3m/ckrUoJxkoFKizywXUpAgqdSpAeKRj
 QvstxA2RfhaGgoTwV67DSKQ08dGrbE2TlliHedK2zSgsEp/ve9wXJfZs1zgX30H8Q8m+AHxMgFLiL
 ZXBiVrc3SCGVn/9SKXbBTk1zl/tF05UNf+E3/KTl2msRdoDjg7e+ojwg+3MLP4IyclsVj7vPbZUOA
 0SkhXT2oW1ifIj4/TyuQWWkqvz4HPR0qayW69hUHMINLYhLsSaDa9fgxzFSshG/nZrbfSxpzAZZo7
 23a8bJd29d3TjCWbSLyWRBdBJwMKrdYdocY/LFOUGKZZEMcRvQKJHevGTelkin4F5iwXanOAp9lOQ
 MLSLwT4+/DWjkR5BBLG6d6Kf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBt-000lWb-25; Mon, 25 Aug 2025 20:53:21 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 069/142] smb: client: pass struct smbdirect_socket to
 smbd_qp_async_error_upcall()
Date: Mon, 25 Aug 2025 22:40:30 +0200
Message-ID: <6b2dbc6502b3a2804a5487043996341ecbde489d.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will make it easier to move function to the common code
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 8ef4d8319833..660edf02afee 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -359,11 +359,10 @@ static int smbd_conn_upcall(
 static void
 smbd_qp_async_error_upcall(struct ib_event *event, void *context)
 {
-	struct smbd_connection *info = context;
-	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_socket *sc = context;
 
-	log_rdma_event(ERR, "%s on device %s info %p\n",
-		ib_event_msg(event->event), event->device->name, info);
+	log_rdma_event(ERR, "%s on device %s socket %p\n",
+		ib_event_msg(event->event), event->device->name, sc);
 
 	switch (event->event) {
 	case IB_EVENT_CQ_ERR:
@@ -1715,7 +1714,7 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 
 	sc->ib.send_cq =
-		ib_alloc_cq_any(sc->ib.dev, info,
+		ib_alloc_cq_any(sc->ib.dev, sc,
 				sp->send_credit_target, IB_POLL_SOFTIRQ);
 	if (IS_ERR(sc->ib.send_cq)) {
 		sc->ib.send_cq = NULL;
@@ -1723,7 +1722,7 @@ static struct smbd_connection *_smbd_get_connection(
 	}
 
 	sc->ib.recv_cq =
-		ib_alloc_cq_any(sc->ib.dev, info,
+		ib_alloc_cq_any(sc->ib.dev, sc,
 				sp->recv_credit_max, IB_POLL_SOFTIRQ);
 	if (IS_ERR(sc->ib.recv_cq)) {
 		sc->ib.recv_cq = NULL;
@@ -1732,7 +1731,7 @@ static struct smbd_connection *_smbd_get_connection(
 
 	memset(&qp_attr, 0, sizeof(qp_attr));
 	qp_attr.event_handler = smbd_qp_async_error_upcall;
-	qp_attr.qp_context = info;
+	qp_attr.qp_context = sc;
 	qp_attr.cap.max_send_wr = sp->send_credit_target;
 	qp_attr.cap.max_recv_wr = sp->recv_credit_max;
 	qp_attr.cap.max_send_sge = SMBDIRECT_SEND_IO_MAX_SGE;
-- 
2.43.0


