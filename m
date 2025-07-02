Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 83CDAAF0C5E
	for <lists+samba-technical@lfdr.de>; Wed,  2 Jul 2025 09:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=VZLx/loH14Yx5Zd2sekAGIwetpGqLRxVgkW0h+1ZlMc=; b=JSUOvhZaSrsX09YVeNtFaZCUQb
	r8c4eoW3ZKnYaRzFwwfydkV0lnsvGekd07bacv4IRhaNijRcGPzq3sUQtREocmZs3LkehQcAm3Bsb
	L73HlFx7tDzOEO41lO47j0p934wdD1BfBMYqMwJEIGOtEXxneasPuQiT97CQE1HbtDWVv4LfhPqxX
	w7P/2juXbezhovPa7kvPQ4x+8NVkXh1J1tEw1Ov6DeRdzvlfhstNVgdPhAocOdEmG9x/i17wOG0BK
	pW7tQ/+Q4C1FQ3LLhVIxFbgOsz3GhQkWWhcsX0JheC1k8bcbop/KaNjKPfpptc32yjaGZ49Zlcfw/
	qPFjGQeQ==;
Received: from ip6-localhost ([::1]:26782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uWrjV-00AENt-8O; Wed, 02 Jul 2025 07:18:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13394) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uWrjP-00AENm-C1
 for samba-technical@lists.samba.org; Wed, 02 Jul 2025 07:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=VZLx/loH14Yx5Zd2sekAGIwetpGqLRxVgkW0h+1ZlMc=; b=AOMek+snl/IAIeY6roaucHfJHd
 936mDZpw7jjD0MtXM9+Bk98UcleNbuW+M4Kr3uhTcazbCYR73nQ/8lpiVimuSXjsvntE83AXWUqvJ
 3ZVL3dxRiPghqUbSTz16e3fqrTyPDUmHP+Di8IvRHuUhu8oVPGkRkwaEQ14/d8ZyhfcqlVwewePXq
 F6ii8oaL/yyuNzhSNUiGJrAICElF/2FVOjVCD/KKvyrtFR0N9NHpDG+txRmRzlVAPBkrqhAoWs0qB
 a3OY6lNS59FvBJ9QKjOlHBSM99OtvC9arznVBnigTSCbBj8Okm7FviY2Gkz5zHq/Tlzd2sojFD1DE
 oih0GZCn+BwRtnNHwIu3hPwRgKa9yKoeNt074q/2j5ikHBUq40XPIo98eZS197YXb6NBKr7URqRG9
 QudLDET20P2FuXn/kDU2+ud+9AlxPHyOhA/dwlZytAQVgApAOtN7n1rwzaRx5eMlzH12vJvlkpAcb
 yQTBLsH1M7hElelsL2KeqVx6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uWrjN-00DTrq-2J; Wed, 02 Jul 2025 07:18:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: server: make use of rdma_destroy_qp()
Date: Wed,  2 Jul 2025 09:18:05 +0200
Message-Id: <20250702071805.2540741-1-metze@samba.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Tom Talpey <tom@talpey.com>, Hyunchul Lee <hyc.lee@gmail.com>,
 metze@samba.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The qp is created by rdma_create_qp() as t->cm_id->qp
and t->qp is just a shortcut.

rdma_destroy_qp() also calls ib_destroy_qp(cm_id->qp) internally,
but it is protected by a mutex, clears the cm_id and also calls
trace_cm_qp_destroy().

This should make the tracing more useful as both
rdma_create_qp() and rdma_destroy_qp() are traces and it makes
the code look more sane as functions from the same layer are used
for the specific qp object.

trace-cmd stream -e rdma_cma:cm_qp_create -e rdma_cma:cm_qp_destroy
shows this now while doing a mount and unmount from a client:

  <...>-80   [002] 378.514182: cm_qp_create:  cm.id=1 src=172.31.9.167:5445 dst=172.31.9.166:37113 tos=0 pd.id=0 qp_type=RC send_wr=867 recv_wr=255 qp_num=1 rc=0
  <...>-6283 [001] 381.686172: cm_qp_destroy: cm.id=1 src=172.31.9.167:5445 dst=172.31.9.166:37113 tos=0 qp_num=1

Before we only saw the first line.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <stfrench@microsoft.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 64a428a06ace..c6cbe0d56e32 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -433,7 +433,8 @@ static void free_transport(struct smb_direct_transport *t)
 	if (t->qp) {
 		ib_drain_qp(t->qp);
 		ib_mr_pool_destroy(t->qp, &t->qp->rdma_mrs);
-		ib_destroy_qp(t->qp);
+		t->qp = NULL;
+		rdma_destroy_qp(t->cm_id);
 	}
 
 	ksmbd_debug(RDMA, "drain the reassembly queue\n");
@@ -1940,8 +1941,8 @@ static int smb_direct_create_qpair(struct smb_direct_transport *t,
 	return 0;
 err:
 	if (t->qp) {
-		ib_destroy_qp(t->qp);
 		t->qp = NULL;
+		rdma_destroy_qp(t->cm_id);
 	}
 	if (t->recv_cq) {
 		ib_destroy_cq(t->recv_cq);
-- 
2.34.1


