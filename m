Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7979BC86919
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:21:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=N2xJslzjp+TDc+te/ezg8kgxyNlp7b0Qs4EzD/FhHvs=; b=RlyrDZtmt6ZOrnaBZ/PE1kQiDp
	IrPcV6t/4+eL0mHRqh9ciRDhJGLWkIP2cAWE9+DkAyZB9QYc53btIEB9UO4S3ipBVT4iMfLG8Rd+I
	Y1aBs598TNlby18joulQqxohACRghO/0N/yV/76jgS+pa/l0f7rJXCSs+dhC6yZy/x/YLNHuBb1ty
	9IJGpQ7GobHOoUExBl2cc+v6WzxIxLMqP0J3ZOVqvETYW1FoKweGJj047E6qOGwwIu7HgpWfiLv/z
	1CkQMWCteFLMd4PumWyIqXURInHM1Jx/gR3PAZByipFnjQHV4bFW+LyV6+KMNBS+zqspUf7EM7ItG
	TMzDdjnQ==;
Received: from ip6-localhost ([::1]:25074 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxfW-00DENk-Ci; Tue, 25 Nov 2025 18:21:39 +0000
Received: from hr2.samba.org ([144.76.82.148]:35282) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxcY-00DDde-BW
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:19:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=N2xJslzjp+TDc+te/ezg8kgxyNlp7b0Qs4EzD/FhHvs=; b=hYwSQ7F8dw0zS1/fSL0sOSPH1E
 DilWQ9u7mwGSS5nfMa/ALlLRFQ8zOQbogY0T7XmVnrqAeHC5gtOxwgNDxWIXpY9DT5eCRqoLyYxzD
 Zryt2r4dvUpt0LrU39xfH48F2V5KlcAP1BPtBVrY2Eep33FC31icIGQXOyo5ffstEUTCSU63NQ4Zj
 kfPP34/aiIgFsO73+6eGjHtUomiU1EMoNs7w57agrKEXXrK9N3X0MgSJoGRZ2JlbMFPmcVyAfwbkm
 57XFZYagL2HyNpxVlBt/npJJ5gRQztTi0UxplL3AkoGJRAeaTYjCEw462k6fOcAKLsxGmbMbD/eUK
 yD9CV27BoNpSsSXRfHg0FqRWxjZZ60nSHsEQgW8qEIjo6V8zrhefOENUrk1sdXNY+nYYRdLQOPfv4
 NOBCsd3QhhRprkL63+fX3CCNXhGdprmcjvT5iqN3SPPJNbOdCGYHE0RnW2dtnBJnCeP6S+tsW48Vl
 L1aZQuXBfiR9gjBY3f1MGAKP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxVy-00FeS9-1Y; Tue, 25 Nov 2025 18:11:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 108/145] smb: server: make use of
 smbdirect_connection_send_io_done()
Date: Tue, 25 Nov 2025 18:55:54 +0100
Message-ID: <eb206c9b993b44cfc8b8e1732bb4d5aa09944d14.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This also wakes up send_io.pending.dec_wait_queue, which
is currently always empty in the server, but that might
change in future. And we also don't spam the logs on IB_WC_WR_FLUSH_ERR.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 42 +---------------------------------
 1 file changed, 1 insertion(+), 41 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 92ea33be0005..3b324b42d009 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -737,46 +737,6 @@ static void smb_direct_post_recv_credits(struct work_struct *work)
 		queue_work(sc->workqueue, &sc->idle.immediate_work);
 }
 
-static void send_done(struct ib_cq *cq, struct ib_wc *wc)
-{
-	struct smbdirect_send_io *sendmsg, *sibling, *next;
-	struct smbdirect_socket *sc;
-	int lcredits = 0;
-
-	sendmsg = container_of(wc->wr_cqe, struct smbdirect_send_io, cqe);
-	sc = sendmsg->socket;
-
-	ksmbd_debug(RDMA, "Send completed. status='%s (%d)', opcode=%d\n",
-		    ib_wc_status_msg(wc->status), wc->status,
-		    wc->opcode);
-
-	/*
-	 * Free possible siblings and then the main send_io
-	 */
-	list_for_each_entry_safe(sibling, next, &sendmsg->sibling_list, sibling_list) {
-		list_del_init(&sibling->sibling_list);
-		smbdirect_connection_free_send_io(sibling);
-		lcredits += 1;
-	}
-	/* Note this frees wc->wr_cqe, but not wc */
-	smbdirect_connection_free_send_io(sendmsg);
-	lcredits += 1;
-
-	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
-		pr_err("Send error. status='%s (%d)', opcode=%d\n",
-		       ib_wc_status_msg(wc->status), wc->status,
-		       wc->opcode);
-		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
-		return;
-	}
-
-	atomic_add(lcredits, &sc->send_io.lcredits.count);
-	wake_up(&sc->send_io.lcredits.wait_queue);
-
-	if (atomic_dec_and_test(&sc->send_io.pending.count))
-		wake_up(&sc->send_io.pending.zero_wait_queue);
-}
-
 static int manage_credits_prior_sending(struct smbdirect_socket *sc)
 {
 	int new_credits;
@@ -1079,7 +1039,7 @@ static int post_sendmsg(struct smbdirect_socket *sc,
 					      msg->sge[i].addr, msg->sge[i].length,
 					      DMA_TO_DEVICE);
 
-	msg->cqe.done = send_done;
+	msg->cqe.done = smbdirect_connection_send_io_done;
 	msg->wr.opcode = IB_WR_SEND;
 	msg->wr.sg_list = &msg->sge[0];
 	msg->wr.num_sge = msg->num_sge;
-- 
2.43.0


