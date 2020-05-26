Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0878819A417
	for <lists+samba-technical@lfdr.de>; Wed,  1 Apr 2020 06:00:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oX1GjFQtj0xHC/XB5285qc7+tqBtdktxqc0mc+I+1AY=; b=wdhZUj70brU6a7lQIAlCiDoapH
	biXVGgkOgoAtKMEWy52nn7K1L9SryO8kWWcW2ziI7JOM/GN9c604iWH6iOm3jITu7eJPNmlGGMTFK
	f/LV5rm77q99JHsw8FjXEMuy5JV4HiRxAW1+4i9KAvoNCZwMz97qaTJGrtWp+xYQRZ6buseoANG/8
	ZX7I0p028krnzd5BpSIxDeDGNFLFyebTDdtJu0UVeG5sKJ0TV/e2KThh53r839cA2pHuUee98HHwL
	JoumxIbDPR8ooiKuwiAG5/+Mi+NSnQDU0MPe/zqhzozOWfWuCBj9lo5AIJlJCktY2QXDD/rhZkgtO
	eKsGotxg==;
Received: from localhost ([::1]:59898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJUXT-002wbL-In; Wed, 01 Apr 2020 03:59:39 +0000
Received: from [13.77.154.182] (port=51040 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1jJUXN-002wbC-KX
 for samba-technical@lists.samba.org; Wed, 01 Apr 2020 03:59:36 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 0F49F20B4749; Tue, 31 Mar 2020 20:59:29 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0F49F20B4749
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1585713569;
 bh=oX1GjFQtj0xHC/XB5285qc7+tqBtdktxqc0mc+I+1AY=;
 h=From:To:Cc:Subject:Date:Reply-To:From;
 b=c8IXBodqcbtn9CdV+X52h+GJtOuW9IZuwCJ8HrZUUqIy8F4FCQToDYKSZLWrWidv/
 24PtWIa/3ta8OzKWen/Vu+6CPi+7jWhtZBqw0drrJ1zCLxs0FaMOJNzGfC0Hf83Dkq
 pe5g2iR4MHIoMIy0TdmX/A8LdP8JuA5GtxMc7QCg=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] cifs: smbd: Properly process errors on ib_post_send
Date: Tue, 31 Mar 2020 20:59:22 -0700
Message-Id: <1585713563-4635-1-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
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
From: longli--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: longli@microsoft.com
Cc: longli@linuxonhyperv.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From: Long Li <longli@microsoft.com>

When processing errors from ib_post_send(), the transport state needs to be
rolled back to the condition before the error.

Refactor the old code to make it easy to roll back on IB errors, and fix this.

Signed-off-by: Long Li <longli@microsoft.com>
---
 fs/cifs/smbdirect.c | 196 +++++++++++++++++---------------------------
 1 file changed, 77 insertions(+), 119 deletions(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index bdae6d41748c..b961260a6336 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -800,27 +800,55 @@ static int manage_keep_alive_before_sending(struct smbd_connection *info)
 	return 0;
 }
 
-/*
- * Build and prepare the SMBD packet header
- * This function waits for avaialbe send credits and build a SMBD packet
- * header. The caller then optional append payload to the packet after
- * the header
- * intput values
- * size: the size of the payload
- * remaining_data_length: remaining data to send if this is part of a
- * fragmented packet
- * output values
- * request_out: the request allocated from this function
- * return values: 0 on success, otherwise actual error code returned
- */
-static int smbd_create_header(struct smbd_connection *info,
-		int size, int remaining_data_length,
-		struct smbd_request **request_out)
+/* Post the send request */
+static int smbd_post_send(struct smbd_connection *info,
+		struct smbd_request *request)
+{
+	struct ib_send_wr send_wr;
+	int rc, i;
+
+	for (i = 0; i < request->num_sge; i++) {
+		log_rdma_send(INFO,
+			"rdma_request sge[%d] addr=%llu length=%u\n",
+			i, request->sge[i].addr, request->sge[i].length);
+		ib_dma_sync_single_for_device(
+			info->id->device,
+			request->sge[i].addr,
+			request->sge[i].length,
+			DMA_TO_DEVICE);
+	}
+
+	request->cqe.done = send_done;
+
+	send_wr.next = NULL;
+	send_wr.wr_cqe = &request->cqe;
+	send_wr.sg_list = request->sge;
+	send_wr.num_sge = request->num_sge;
+	send_wr.opcode = IB_WR_SEND;
+	send_wr.send_flags = IB_SEND_SIGNALED;
+
+	rc = ib_post_send(info->id->qp, &send_wr, NULL);
+	if (rc) {
+		log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
+		smbd_disconnect_rdma_connection(info);
+		rc = -EAGAIN;
+	} else
+		/* Reset timer for idle connection after packet is sent */
+		mod_delayed_work(info->workqueue, &info->idle_timer_work,
+			info->keep_alive_interval*HZ);
+
+	return rc;
+}
+
+static int smbd_post_send_sgl(struct smbd_connection *info,
+	struct scatterlist *sgl, int data_length, int remaining_data_length)
 {
+	int num_sgs;
+	int i, rc;
+	int header_length;
 	struct smbd_request *request;
 	struct smbd_data_transfer *packet;
-	int header_length;
-	int rc;
+	struct scatterlist *sg;
 
 	/* Wait for send credits. A SMBD packet needs one credit */
 	rc = wait_event_interruptible(info->wait_send_queue,
@@ -835,6 +863,15 @@ static int smbd_create_header(struct smbd_connection *info,
 	}
 	atomic_dec(&info->send_credits);
 
+wait_sq:
+	wait_event(info->wait_post_send,
+		atomic_read(&info->send_pending) < info->send_credit_target);
+	if (unlikely(atomic_inc_return(&info->send_pending) >
+				info->send_credit_target)) {
+		atomic_dec(&info->send_pending);
+		goto wait_sq;
+	}
+
 	request = mempool_alloc(info->request_mempool, GFP_KERNEL);
 	if (!request) {
 		rc = -ENOMEM;
@@ -856,11 +893,11 @@ static int smbd_create_header(struct smbd_connection *info,
 		packet->flags |= cpu_to_le16(SMB_DIRECT_RESPONSE_REQUESTED);
 
 	packet->reserved = 0;
-	if (!size)
+	if (!data_length)
 		packet->data_offset = 0;
 	else
 		packet->data_offset = cpu_to_le32(24);
-	packet->data_length = cpu_to_le32(size);
+	packet->data_length = cpu_to_le32(data_length);
 	packet->remaining_data_length = cpu_to_le32(remaining_data_length);
 	packet->padding = 0;
 
@@ -875,7 +912,7 @@ static int smbd_create_header(struct smbd_connection *info,
 	/* Map the packet to DMA */
 	header_length = sizeof(struct smbd_data_transfer);
 	/* If this is a packet without payload, don't send padding */
-	if (!size)
+	if (!data_length)
 		header_length = offsetof(struct smbd_data_transfer, padding);
 
 	request->num_sge = 1;
@@ -884,107 +921,15 @@ static int smbd_create_header(struct smbd_connection *info,
 						 header_length,
 						 DMA_TO_DEVICE);
 	if (ib_dma_mapping_error(info->id->device, request->sge[0].addr)) {
-		mempool_free(request, info->request_mempool);
 		rc = -EIO;
+		request->sge[0].addr = 0;
 		goto err_dma;
 	}
 
 	request->sge[0].length = header_length;
 	request->sge[0].lkey = info->pd->local_dma_lkey;
 
-	*request_out = request;
-	return 0;
-
-err_dma:
-	/* roll back receive credits */
-	spin_lock(&info->lock_new_credits_offered);
-	info->new_credits_offered += packet->credits_granted;
-	spin_unlock(&info->lock_new_credits_offered);
-	atomic_sub(packet->credits_granted, &info->receive_credits);
-
-err_alloc:
-	/* roll back send credits */
-	atomic_inc(&info->send_credits);
-
-	return rc;
-}
-
-static void smbd_destroy_header(struct smbd_connection *info,
-		struct smbd_request *request)
-{
-
-	ib_dma_unmap_single(info->id->device,
-			    request->sge[0].addr,
-			    request->sge[0].length,
-			    DMA_TO_DEVICE);
-	mempool_free(request, info->request_mempool);
-	atomic_inc(&info->send_credits);
-}
-
-/* Post the send request */
-static int smbd_post_send(struct smbd_connection *info,
-		struct smbd_request *request)
-{
-	struct ib_send_wr send_wr;
-	int rc, i;
-
-	for (i = 0; i < request->num_sge; i++) {
-		log_rdma_send(INFO,
-			"rdma_request sge[%d] addr=%llu length=%u\n",
-			i, request->sge[i].addr, request->sge[i].length);
-		ib_dma_sync_single_for_device(
-			info->id->device,
-			request->sge[i].addr,
-			request->sge[i].length,
-			DMA_TO_DEVICE);
-	}
-
-	request->cqe.done = send_done;
-
-	send_wr.next = NULL;
-	send_wr.wr_cqe = &request->cqe;
-	send_wr.sg_list = request->sge;
-	send_wr.num_sge = request->num_sge;
-	send_wr.opcode = IB_WR_SEND;
-	send_wr.send_flags = IB_SEND_SIGNALED;
-
-wait_sq:
-	wait_event(info->wait_post_send,
-		atomic_read(&info->send_pending) < info->send_credit_target);
-	if (unlikely(atomic_inc_return(&info->send_pending) >
-				info->send_credit_target)) {
-		atomic_dec(&info->send_pending);
-		goto wait_sq;
-	}
-
-	rc = ib_post_send(info->id->qp, &send_wr, NULL);
-	if (rc) {
-		log_rdma_send(ERR, "ib_post_send failed rc=%d\n", rc);
-		if (atomic_dec_and_test(&info->send_pending))
-			wake_up(&info->wait_send_pending);
-		smbd_disconnect_rdma_connection(info);
-		rc = -EAGAIN;
-	} else
-		/* Reset timer for idle connection after packet is sent */
-		mod_delayed_work(info->workqueue, &info->idle_timer_work,
-			info->keep_alive_interval*HZ);
-
-	return rc;
-}
-
-static int smbd_post_send_sgl(struct smbd_connection *info,
-	struct scatterlist *sgl, int data_length, int remaining_data_length)
-{
-	int num_sgs;
-	int i, rc;
-	struct smbd_request *request;
-	struct scatterlist *sg;
-
-	rc = smbd_create_header(
-		info, data_length, remaining_data_length, &request);
-	if (rc)
-		return rc;
-
+	/* Fill in the packet data payload */
 	num_sgs = sgl ? sg_nents(sgl) : 0;
 	for_each_sg(sgl, sg, num_sgs, i) {
 		request->sge[i+1].addr =
@@ -994,7 +939,7 @@ static int smbd_post_send_sgl(struct smbd_connection *info,
 				info->id->device, request->sge[i+1].addr)) {
 			rc = -EIO;
 			request->sge[i+1].addr = 0;
-			goto dma_mapping_failure;
+			goto err_dma;
 		}
 		request->sge[i+1].length = sg->length;
 		request->sge[i+1].lkey = info->pd->local_dma_lkey;
@@ -1005,14 +950,27 @@ static int smbd_post_send_sgl(struct smbd_connection *info,
 	if (!rc)
 		return 0;
 
-dma_mapping_failure:
-	for (i = 1; i < request->num_sge; i++)
+err_dma:
+	for (i = 0; i < request->num_sge; i++)
 		if (request->sge[i].addr)
 			ib_dma_unmap_single(info->id->device,
 					    request->sge[i].addr,
 					    request->sge[i].length,
 					    DMA_TO_DEVICE);
-	smbd_destroy_header(info, request);
+	mempool_free(request, info->request_mempool);
+
+	/* roll back receive credits and credits to be offered */
+	spin_lock(&info->lock_new_credits_offered);
+	info->new_credits_offered += packet->credits_granted;
+	spin_unlock(&info->lock_new_credits_offered);
+	atomic_sub(packet->credits_granted, &info->receive_credits);
+
+err_alloc:
+	/* roll back send credits and pending */
+	atomic_inc(&info->send_credits);
+	if (atomic_dec_and_test(&info->send_pending))
+		wake_up(&info->wait_send_pending);
+
 	return rc;
 }
 
-- 
2.17.1


