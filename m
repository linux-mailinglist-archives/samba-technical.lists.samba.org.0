Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ED730B34D64
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:03:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cR9tHGIE29IQFSOemmoLUrCck/+6lNzf8sYYuhklJoA=; b=LqhCgO7koinZRKkipSvSJIO8W9
	emnnySslOWQ/6kJXx9rKVIQEEEQFrJgRYWM8013lv4qWIK97oHrFzOgcMYMQrwMyBLjhf6KMis58v
	rSoU5lspWLOFNKV7iEseuYfoFfbToRnwN6mGehUBMI/l8H6Ay0t7ROgcftEzmKeX9ocTZOr28pduj
	d7Ex47hoFgtEw1WH3a5EMES8OTOcm8cDCjn4HP/ChQ93Ag5BqQnPVgznN+Vh2sMBoWFJHBXpnsIr4
	XA39ThggtL+BbbJ15hiHgdtI3vLMJJqLnQr2Vmi00qWTOJqVCZxDUn0uIHmGGpTZFUNsc4+AcOduS
	XftH96yQ==;
Received: from ip6-localhost ([::1]:26654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeLW-000TUc-Cp; Mon, 25 Aug 2025 21:03:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16964) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeHF-000Rnw-RW
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=cR9tHGIE29IQFSOemmoLUrCck/+6lNzf8sYYuhklJoA=; b=lXA6hKLG5Y4knVME1+BBuY8Gx7
 9Se3jztSBgdQk3C2mwlJ1RINGUHpDw2hgaHtJClixTG1B1ePpzfQxfmPjdQ3PyO8nyVzjef/uosME
 WPYvCQrmEjH8DIw4nFCyp799v3NrXmPFuUcNSilU+6563o8HKG2Uw77MB8FQbD52mc/KFemZM68IA
 o7D7uBoJ93VXfsnaKXPfsas2rHcSSkirGbfVe7HA1VJdLwXsIkuz9GU6lA+H14DX5COK4hoMtBFYR
 wJU07XfQD/bOQnkrEPyPms2O1tkbkfXtMuMqJWkMOhxH3c5baAoPqPLtGy31SqMbQ/ThESrr2CKQR
 4oX2pUFGF7Gs2nt8kdvZMqgrEAgdvId5OsiHn5otJouXi/ej8yZOBIgIvfGqowCL7CXbrQfH/VMrG
 4wgGMkS7QglTHJjqSNijOQaKpl6FElIm/JsZmXKyyzYL0QJYPCIFsMGxaNHqWZ3uLXoly0afRoVGP
 4hGlpvjMb5axq2sAGRB70DHA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeHD-000mdG-1j; Mon, 25 Aug 2025 20:58:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 103/142] smb: server: take the recv_credit_target from the
 negotiate req and always limit the range
Date: Mon, 25 Aug 2025 22:41:04 +0200
Message-ID: <16aa56f3e75fe239cfbecb22a522acbf00d50be0.1756139607.git.metze@samba.org>
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

The clients sends the initial recv_credit_target in the negotiate req,
so we should use that.

We also limit the range between 1 and our local defined
sp->recv_credit_max. This will simplify further logic changes.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 3a0244943dc7..6046ebdc1317 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -94,7 +94,7 @@ struct smb_direct_transport {
 
 	spinlock_t		receive_credit_lock;
 	int			recv_credits;
-	int			recv_credit_target;
+	u16			recv_credit_target;
 
 	spinlock_t		lock_new_recv_credits;
 	int			new_recv_credits;
@@ -472,9 +472,11 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	struct smbdirect_recv_io *recvmsg;
 	struct smb_direct_transport *t;
 	struct smbdirect_socket *sc;
+	struct smbdirect_socket_parameters *sp;
 
 	recvmsg = container_of(wc->wr_cqe, struct smbdirect_recv_io, cqe);
 	sc = recvmsg->socket;
+	sp = &sc->parameters;
 	t = container_of(sc, struct smb_direct_transport, socket);
 
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
@@ -512,7 +514,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		struct smbdirect_data_transfer *data_transfer =
 			(struct smbdirect_data_transfer *)recvmsg->packet;
 		unsigned int data_length;
-		int old_recv_credit_target;
+		u16 old_recv_credit_target;
 
 		if (wc->byte_len <
 		    offsetof(struct smbdirect_data_transfer, padding)) {
@@ -546,6 +548,10 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		old_recv_credit_target = t->recv_credit_target;
 		t->recv_credit_target =
 				le16_to_cpu(data_transfer->credits_requested);
+		t->recv_credit_target =
+			min_t(u16, t->recv_credit_target, sp->recv_credit_max);
+		t->recv_credit_target =
+			max_t(u16, t->recv_credit_target, 1);
 		atomic_add(le16_to_cpu(data_transfer->credits_granted),
 			   &sc->send_io.credits.count);
 
@@ -1753,7 +1759,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	t->recv_credits = 0;
 
 	sp->recv_credit_max = smb_direct_receive_credit_max;
-	t->recv_credit_target = 10;
+	t->recv_credit_target = 1;
 	t->new_recv_credits = 0;
 
 	sp->send_credit_target = smb_direct_send_credit_target;
@@ -1979,6 +1985,9 @@ static int smb_direct_prepare(struct ksmbd_transport *t)
 		le32_to_cpu(req->max_fragmented_size);
 	sp->max_fragmented_recv_size =
 		(sp->recv_credit_max * sp->max_recv_size) / 2;
+	st->recv_credit_target = le16_to_cpu(req->credits_requested);
+	st->recv_credit_target = min_t(u16, st->recv_credit_target, sp->recv_credit_max);
+	st->recv_credit_target = max_t(u16, st->recv_credit_target, 1);
 
 	ret = smb_direct_send_negotiate_response(st, ret);
 out:
-- 
2.43.0


