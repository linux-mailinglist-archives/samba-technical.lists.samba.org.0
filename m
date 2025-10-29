Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E1286C1AB36
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:31:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zTN36BFEdi18HMgUsLU+sVnSbSM01rHF57SgQfV4jQc=; b=xxbGlX7bF9GeSBlg6xTblJ4Tfh
	ol1cTsBDKTrkB3hMFVSs/nW5a7lYcnpLLS1aGTU5dgsjILXz1RSVHw54+DPrvfSWOY3hrwRvMoamv
	i0iPzk0jcfpe7UrLMzeuXoNC6CcirZI0bxBr9Fn6jQNV6oIPqflhWdLUDpSAjx/f56f5O7G4ys/ox
	A3Vh2xc9DAmWd/IHEQjB3Rn2eWR0uBrOGYlit3kNXzD33dry1RgqAVRJgRAI7jMGcEHL+/ZL1IERk
	BVDIWNaKr2ZoRqapsEy8y02a5Nf4A0PmG4JdmrAesJ3GLeTBbefoO+7BpumuktzzQPzAmYOqN/DX8
	s5ve+fgA==;
Received: from ip6-localhost ([::1]:33196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Gu-0097pQ-3T; Wed, 29 Oct 2025 13:31:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53204) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Bg-0096E9-1v
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:26:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=zTN36BFEdi18HMgUsLU+sVnSbSM01rHF57SgQfV4jQc=; b=Ddh+vCDdzhpELltYvnDQkdU5dR
 V5LfPCAtd2ICW+Q8nTcwyvSt0tTLTo7UVkVwZ2Mt/zynx+ixOlAUj8faWCvHZA1ErHpqhRI2XiW65
 h9ZeRmXSouhXQhNvHihtnd2JLdi56fCDbU0kSNEbOkaHwVGuoOWx7enfXciEjQml8WkM115q5mtnA
 gsxjoKXxk0AfkWXlPF+3Zpqbi4zxy9zVKujw68Sq3Upho9t4Sw37KqDDE3N8Jybf2L9Ws7fVKGMiF
 4dxhdNqwqZCtswVazS8/wlNZ1ZcFCLHGxER28yvXzFyPZW3GZQ8caasmprMPXQ2FHnNjMomiUvIxV
 Q2vADrgLnqHd+FFGSpqs6TmSVE2eRF6vCj8DheUbZQ5NGZ1zh22FOHm/sseo9Z3kb8EQ/IZczx7lB
 DOn41Fq4POSNeioV9SA3cc0IiqqxCoQEhJ9zpXKy2GCshbQHEK8vSf+P7QmyTezY8U2r3gZz+JzWs
 iMfN0gyY7FWwWYs1uSARxCoR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Bd-00Bbio-0G; Wed, 29 Oct 2025 13:26:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 035/127] smb: smbdirect: introduce
 smbdirect_connection_recv_io_done()
Date: Wed, 29 Oct 2025 14:20:13 +0100
Message-ID: <a3f6fd564533b44bfaa4dd8ba3ccf141ba33989f.1761742839.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is basically a copy of recv_done() in client and server,
with the following additions:

- Only handling the SMBDIRECT_EXPECT_DATA_TRANSFER code path,
  as we'll have separate functions for the negotiate messages.
- Using more helper variables
- Improved logging
- Add credits_requested == 0 error check
- Add data_offset not 8 bytes aligned error check
- Use disable_work(&sc->recv_io.posted.refill_work)
  before smbdirect_connection_put_recv_io, when it
  is followed by smbdirect_connection_schedule_disconnect()

This will be used on common between client and server in future
and replace the existing recv_done() functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 167 ++++++++++++++++++
 1 file changed, 167 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 1b84e0789d77..cea05753c80e 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -908,6 +908,173 @@ static int smbdirect_connection_post_recv_io(struct smbdirect_recv_io *msg)
 	return ret;
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_connection_recv_io_done(struct ib_cq *cq, struct ib_wc *wc)
+{
+	struct smbdirect_recv_io *recv_io =
+		container_of(wc->wr_cqe, struct smbdirect_recv_io, cqe);
+	struct smbdirect_socket *sc = recv_io->socket;
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct smbdirect_data_transfer *data_transfer;
+	u16 old_recv_credit_target;
+	u16 credits_requested;
+	u16 credits_granted;
+	u16 flags;
+	u32 data_offset;
+	u32 data_length;
+	u32 remaining_data_length;
+
+	if (unlikely(wc->status != IB_WC_SUCCESS || WARN_ON_ONCE(wc->opcode != IB_WC_RECV))) {
+		if (wc->status != IB_WC_WR_FLUSH_ERR)
+			smbdirect_log_rdma_recv(sc, SMBDIRECT_LOG_ERR,
+				"wc->status=%s (%d) wc->opcode=%d\n",
+				ib_wc_status_msg(wc->status), wc->status, wc->opcode);
+		goto error;
+	}
+
+	smbdirect_log_rdma_recv(sc, SMBDIRECT_LOG_INFO,
+		"recv_io=0x%p type=%d wc status=%s wc opcode %d byte_len=%d pkey_index=%u\n",
+		recv_io, sc->recv_io.expected,
+		ib_wc_status_msg(wc->status), wc->opcode,
+		wc->byte_len, wc->pkey_index);
+
+	/*
+	 * Reset timer to the keepalive interval in
+	 * order to trigger our next keepalive message.
+	 */
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
+			 msecs_to_jiffies(sp->keepalive_interval_msec));
+
+	ib_dma_sync_single_for_cpu(wc->qp->device,
+				   recv_io->sge.addr,
+				   recv_io->sge.length,
+				   DMA_FROM_DEVICE);
+
+	if (unlikely(wc->byte_len <
+	    offsetof(struct smbdirect_data_transfer, padding))) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"wc->byte_len=%u < %zu\n",
+			wc->byte_len,
+			offsetof(struct smbdirect_data_transfer, padding));
+		goto error;
+	}
+
+	data_transfer = (struct smbdirect_data_transfer *)recv_io->packet;
+	credits_requested = le16_to_cpu(data_transfer->credits_requested);
+	credits_granted = le16_to_cpu(data_transfer->credits_granted);
+	flags = le16_to_cpu(data_transfer->flags);
+	remaining_data_length = le32_to_cpu(data_transfer->remaining_data_length);
+	data_offset = le32_to_cpu(data_transfer->data_offset);
+	data_length = le32_to_cpu(data_transfer->data_length);
+
+	smbdirect_log_incoming(sc, SMBDIRECT_LOG_INFO,
+		"DataIn: %s=%u, %s=%u, %s=0x%x, %s=%u, %s=%u, %s=%u\n",
+		"CreditsRequested",
+		credits_requested,
+		"CreditsGranted",
+		credits_granted,
+		"Flags",
+		flags,
+		"RemainingDataLength",
+		remaining_data_length,
+		"DataOffset",
+		data_offset,
+		"DataLength",
+		data_length);
+
+	if (unlikely(credits_requested == 0)) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: credits_requested == 0\n");
+		goto error;
+	}
+
+	if (unlikely(data_offset % 8 != 0)) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"invalid: data_offset=%u (0x%x) not aligned to 8\n",
+			data_offset, data_offset);
+		goto error;
+	}
+
+	if (unlikely(wc->byte_len < data_offset ||
+	    (u64)wc->byte_len < (u64)data_offset + data_length)) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"wc->byte_len=%u < date_offset=%u + data_length=%u\n",
+			wc->byte_len, data_offset, data_length);
+		goto error;
+	}
+
+	if (unlikely(remaining_data_length > sp->max_fragmented_recv_size ||
+	    data_length > sp->max_fragmented_recv_size ||
+	    (u64)remaining_data_length + (u64)data_length > (u64)sp->max_fragmented_recv_size)) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"remaining_data_length=%u + data_length=%u > max_fragmented=%u\n",
+			remaining_data_length, data_length, sp->max_fragmented_recv_size);
+		goto error;
+	}
+
+	if (data_length) {
+		if (sc->recv_io.reassembly.full_packet_received)
+			recv_io->first_segment = true;
+
+		if (remaining_data_length)
+			sc->recv_io.reassembly.full_packet_received = false;
+		else
+			sc->recv_io.reassembly.full_packet_received = true;
+	}
+
+	atomic_dec(&sc->recv_io.posted.count);
+	atomic_dec(&sc->recv_io.credits.count);
+	old_recv_credit_target = sc->recv_io.credits.target;
+	/*
+	 * We take the value from the peer, which is checked to be higher than 0,
+	 * but we limit it to the max value we support in order to have
+	 * the main logic simpler.
+	 */
+	sc->recv_io.credits.target = credits_requested;
+	sc->recv_io.credits.target = min_t(u16, sc->recv_io.credits.target,
+					   sp->recv_credit_max);
+	if (credits_granted) {
+		atomic_add(credits_granted, &sc->send_io.credits.count);
+		/*
+		 * We have new send credits granted from remote peer
+		 * If any sender is waiting for credits, unblock it
+		 */
+		wake_up(&sc->send_io.credits.wait_queue);
+	}
+
+	/* Send an immediate response right away if requested */
+	if (flags & SMBDIRECT_FLAG_RESPONSE_REQUESTED) {
+		smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_INFO,
+			"schedule send of immediate response\n");
+		queue_work(sc->workqueue, &sc->idle.immediate_work);
+	}
+
+	/*
+	 * If this is a packet with data playload place the data in
+	 * reassembly queue and wake up the reading thread
+	 */
+	if (data_length) {
+		if (sc->recv_io.credits.target > old_recv_credit_target)
+			queue_work(sc->workqueue, &sc->recv_io.posted.refill_work);
+
+		smbdirect_connection_reassembly_append_recv_io(sc, recv_io, data_length);
+		wake_up(&sc->recv_io.reassembly.wait_queue);
+	} else
+		smbdirect_connection_put_recv_io(recv_io);
+
+	return;
+
+error:
+	/*
+	 * Make sure smbdirect_connection_put_recv_io() does not
+	 * start recv_io.posted.refill_work.
+	 */
+	disable_work(&sc->recv_io.posted.refill_work);
+	smbdirect_connection_put_recv_io(recv_io);
+	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
+}
+
 static int smbdirect_connection_recv_io_refill(struct smbdirect_socket *sc)
 {
 	int missing;
-- 
2.43.0


