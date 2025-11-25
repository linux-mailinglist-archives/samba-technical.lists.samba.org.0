Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD38C866C0
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:04:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3vmuNBUlxrWLshbRVDMrGBqpy/riS7SKwetM6TM8DAc=; b=J5FeoBAqlV68pIv3KAAPvQWBLu
	m8noVOUmcuLxjiWh+mwegibErK82MbN0Qu8HCV/6kHVeJb55e9QRefeH2GzSVDT/j0u42IoYh5DFC
	0Jt76MqnFlbeqgosIWm8Do4XmfMrXlJQws+f9mmkpCOHrI4cAKxw8QffAKfExD8T70nAKZafHTiBq
	R/tlDbs75XDZk6fxPs9Q24Fi9ZnAqd26Acy57IsvChOTnb7JKwsL8DeD+L0PRp3doX1Mkswkf4rKQ
	pumhjVE+uEFF1vVCefHJ6KrWHwhGmJjWAqIv6ooGNSI3NomixrOybdWT0w6l5CHR0fSVyZLn2EB04
	maTsgFkQ==;
Received: from ip6-localhost ([::1]:31176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxOY-00D8lm-SQ; Tue, 25 Nov 2025 18:04:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26424) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKC-00D7OE-4a
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:59:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=3vmuNBUlxrWLshbRVDMrGBqpy/riS7SKwetM6TM8DAc=; b=xZmvco61fepMf+tqFFO+UPaHhc
 ZLX19/OLIZeO/IhNOILaAmN3OeWFHsOVCxhWPEEAD+yFDOTtpFp654V/yMqZGiKU1xpD7gL+yvZ2L
 BQ6JtLZfiCZLAhzDR60T+7XElkjCflRXSSqzfs0XxzBIA7W0zgP4cTnXtgsfL+krWkAsvnNjlSNPD
 ixNNzYCV6siPcRGFZJax7rhFjNk6OC13mm839Ex/QQG2u7HSivpltarw/Fj5d9mHNlR2GwyqujqVA
 BrBrIDPeCYhiQ9rbLidnKrp4s+VdpJKTMYLbHUG2aGaSsl7QGp5W/kDbTSAHFeF2JuND+VorGHdpK
 17jVgg0XnFip3Sy6lP3pLqZEMVT9zyAYy/xQbErXZ+jyKnRGZruIZcXci0LPx3DsQBw9XYn8LRsUF
 I0vz07ABFm3Ro4iNFomGJz0Mj4hJU2BfJd4SlPhP5tprOEuTKevamzoZcA+Jj4YC5iVK5ZedThUFB
 Yt2E0oc0fZRXs80EwXY2+mQH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxK9-00Fcwa-2d; Tue, 25 Nov 2025 17:59:33 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 029/145] smb: smbdirect: introduce
 smbdirect_connection_post_recv_io()
Date: Tue, 25 Nov 2025 18:54:35 +0100
Message-ID: <d7a36ccc311060df0c73e88632dc61fcb305faac.1764091285.git.metze@samba.org>
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

This is basically a copy of smbd_post_recv() in the client and
smb_direct_post_recv() in the server.

The only difference is that this returns early if the connection
is already broken.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 6ac4e88da1b0..bc88cbb313ce 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -641,6 +641,48 @@ static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc
 	wake_up(&sc->send_io.pending.dec_wait_queue);
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static int smbdirect_connection_post_recv_io(struct smbdirect_recv_io *msg)
+{
+	struct smbdirect_socket *sc = msg->socket;
+	const struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct ib_recv_wr recv_wr = {
+		.wr_cqe = &msg->cqe,
+		.sg_list = &msg->sge,
+		.num_sge = 1,
+	};
+	int ret;
+
+	if (unlikely(sc->first_error))
+		return sc->first_error;
+
+	msg->sge.addr = ib_dma_map_single(sc->ib.dev,
+					  msg->packet,
+					  sp->max_recv_size,
+					  DMA_FROM_DEVICE);
+	ret = ib_dma_mapping_error(sc->ib.dev, msg->sge.addr);
+	if (ret)
+		return ret;
+
+	msg->sge.length = sp->max_recv_size;
+	msg->sge.lkey = sc->ib.pd->local_dma_lkey;
+
+	ret = ib_post_recv(sc->ib.qp, &recv_wr, NULL);
+	if (ret) {
+		smbdirect_log_rdma_recv(sc, SMBDIRECT_LOG_ERR,
+			"ib_post_recv failed ret=%d (%s)\n",
+			ret, errname(ret));
+		ib_dma_unmap_single(sc->ib.dev,
+				    msg->sge.addr,
+				    msg->sge.length,
+				    DMA_FROM_DEVICE);
+		msg->sge.length = 0;
+		smbdirect_socket_schedule_cleanup(sc, ret);
+	}
+
+	return ret;
+}
+
 static bool smbdirect_map_sges_single_page(struct smbdirect_map_sges *state,
 					   struct page *page, size_t off, size_t len)
 {
-- 
2.43.0


