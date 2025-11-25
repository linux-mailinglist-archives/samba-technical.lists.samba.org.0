Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F122C86873
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:16:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4ySx//XRW96up5XGMXWNXYU6ttMCmnLsJOJR7Tbrnn8=; b=D0CZ9KdH/l4uXiNqNO4nPwdI7R
	GuWd2uoj2uF85vATPof/zORj2891SWHJMqDC9FUXa+9IYM9WrxPkXp5Y5xfQMVO3k7G6Z5uKIp+er
	2zB4IjbBkOYwdeMEg0zxbF805IRVXXBp/NWMb3/900HNflyTfJwxnWOoXLfg/lYRdV4cO9ovTi+Ea
	QEptnN1bc7CDTf39xPpnz03BTSuX8V78ydNrw7lf11LWJsYOtSV7ZfQ0vowZ1Lp3iZVUvegYHaf4r
	6QHugzYs/Y7L9P0YX0RxM13E9vVnGnNo8xt/tm5vhEu6awiWOgxIRJ65qUSzOLlKXKUpN95JxdCXv
	jogd0vhw==;
Received: from ip6-localhost ([::1]:40510 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxa4-00DClE-Ac; Tue, 25 Nov 2025 18:16:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54998) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxU2-00DAbQ-QU
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=4ySx//XRW96up5XGMXWNXYU6ttMCmnLsJOJR7Tbrnn8=; b=T30kIqTSDACU9vT7NpwSQUK2d9
 sXR5SPpCOhWzIw6Q7FiQvgEJipa1Mj9sSMpcHtsk50Uf1OrJq5wf3ros87zuW1oWgfOoTFuHlMk9M
 PG0BokGyj91KFoFfyX6cPWLGtBUGK5Hi1zmFoPo1CGTV9lyKVAiGa4rZOzWmDvCYXwJwSnNy8JXp/
 O94OGi0vzdPj2fnrep8irEE+E/58apMFEB64FgP2Q/6BvM8V706I8E+lwEOnTkBm7G9951wqQ+7Ho
 Hk7/6kL+zyXracCNf6DeMBiBdKfzXiGLtQKxO0ADPT/DwHKzrQRZqP3V/F7rnvFqsGjpa/S5AL/4c
 IdOVFbz4WnjYniGqlAiYyiuQLolX51vlweq7W+hOfZC/OMwtC/+dEPUjtF7YphZgMogLekVIq+Rnj
 u10z3E0p4QMO+IsMCcckLREty7KF3VtBdHIdIs48qk0w7MqQwfUHwERQF38LdyojMWy4ziVcDq2ku
 3iSG012oih1PyUKfMF49CeQ1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQy-00Fdmd-1d; Tue, 25 Nov 2025 18:06:37 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 078/145] smb: client: initialize recv_io->cqe.done =
 recv_done just once
Date: Tue, 25 Nov 2025 18:55:24 +0100
Message-ID: <f7cd803cb8e93c86582bd97529942765b911e04f.1764091285.git.metze@samba.org>
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

smbdirect_recv_io structures are pre-allocated so we can set the
callback function just once.

This will make it easy to move smbd_post_recv() to common code
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
 fs/smb/client/smbdirect.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 04ab25899ab8..9e3557476b4c 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1080,8 +1080,6 @@ static int smbd_post_recv(
 	response->sge.length = sp->max_recv_size;
 	response->sge.lkey = sc->ib.pd->local_dma_lkey;
 
-	response->cqe.done = recv_done;
-
 	recv_wr.wr_cqe = &response->cqe;
 	recv_wr.next = NULL;
 	recv_wr.sg_list = &response->sge;
@@ -1289,6 +1287,7 @@ static struct smbd_connection *_smbd_get_connection(
 	__be32 ird_ord_hdr[2];
 	char wq_name[80];
 	struct workqueue_struct *workqueue;
+	struct smbdirect_recv_io *recv_io;
 
 	/*
 	 * Create the initial parameters
@@ -1393,6 +1392,9 @@ static struct smbd_connection *_smbd_get_connection(
 		goto allocate_cache_failed;
 	}
 
+	list_for_each_entry(recv_io, &sc->recv_io.free.list, list)
+		recv_io->cqe.done = recv_done;
+
 	INIT_WORK(&sc->idle.immediate_work, send_immediate_empty_message);
 	/*
 	 * start with the negotiate timeout and SMBDIRECT_KEEPALIVE_PENDING
-- 
2.43.0


