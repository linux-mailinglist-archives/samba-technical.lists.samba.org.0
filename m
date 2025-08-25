Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B25E3B34C86
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Y6/nlBSg8A+NvwBSbcGUNlQwdnB6Qfcegl5rxs1zdp4=; b=lmd1wh2q9CIXMEdR3LxmbSMzH2
	glkJsat5NkEr7eVa2zABOJXerQvw8BUBMMncX9taK7VPoPsPDfReZn6ZibJ2tBptozROQmB3QWAcm
	tv+jjCSGERBVaew+E8Tfx/f4pOCszgHBSt9Pe31oSYvEMyYce98JXkrBxyGsDUBorftGkwwHzu4Zl
	wiEeyyJ1hrANx8hif9kTiuODxbCXC9qM8iDCBLB9J228JYClrjsGzbOpt77PluugtFXx8XATm5ClN
	iP0efhNR6hKCnX3GdmglqcgNo7hep+TEZGoOyw2auJzPmvb42XK1kCQOKBHXKEndC+3mz2ULVGgH/
	/AAY0vVw==;
Received: from ip6-localhost ([::1]:39604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe6q-000NTb-PH; Mon, 25 Aug 2025 20:48:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63864) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5V-000N0L-QW
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Y6/nlBSg8A+NvwBSbcGUNlQwdnB6Qfcegl5rxs1zdp4=; b=3Xk3snJMsk0SQ5ZnnKLf11U/ir
 z8dImSyVSOvhTr8xAqZWl7qZ/4Z0SDHKonWEpruHKQSkr6cdtr+9rkWtAUIL2++6M6v0lUcr94Bzt
 iLOYMqYPDWyeEJ41qsvJtmpuw3iPp7qjJFNHgdovHNkDZyeos0chy3gC07ml9k23mST482Twgul9f
 aBnxzhIANgQTuNTM/SYGll3AjtxQpIxWfcd27B4STsKipp+V/8bC8t9tAQK0w0hTn3wyOJKuenKm8
 Qcb0S1fxh2TZynLybh4Dze12FGaYTNKqjqxmSfpOIRBJR9biNb8T/q5eKNR6Eth6KPRBX844nLuAB
 bufKYXa5wyzOx23ZZdTZmc+LcFrVTOU5FMWImMaA5YAahLJXdbXGlWS8eLt4F9qT7lOOAXCS3zuu9
 fqXlJdV6qWxitCn7v4wskrRb70JJH0nTiDj8ARg3H+loZ6F3XQgwwoCAyw+yVX50VijigSOQT2TUo
 WrpPZmOhilPWzYiagL65wKpy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5R-000k8c-01; Mon, 25 Aug 2025 20:46:41 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 029/142] smb: client: use disable[_delayed]_work_sync in
 smbdirect.c
Date: Mon, 25 Aug 2025 22:39:50 +0200
Message-ID: <7557378cc38349fcb66205c5dcfa0b0b2fb98375.1756139607.git.metze@samba.org>
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

This makes it safer during the disconnect and avoids
requeueing.

It's ok to call disable[delayed_]work[_sync]() more than once.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index eab8433a518c..d36556fab357 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1468,7 +1468,7 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	sc->ib.qp = NULL;
 
 	log_rdma_event(INFO, "cancelling idle timer\n");
-	cancel_delayed_work_sync(&info->idle_timer_work);
+	disable_delayed_work_sync(&info->idle_timer_work);
 
 	/* It's not possible for upper layer to get to reassembly */
 	log_rdma_event(INFO, "drain the reassembly queue\n");
@@ -1841,7 +1841,7 @@ static struct smbd_connection *_smbd_get_connection(
 	return NULL;
 
 negotiation_failed:
-	cancel_delayed_work_sync(&info->idle_timer_work);
+	disable_delayed_work_sync(&info->idle_timer_work);
 	destroy_caches_and_workqueue(info);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
 	rdma_disconnect(sc->rdma.cm_id);
@@ -2200,7 +2200,7 @@ static void destroy_mr_list(struct smbd_connection *info)
 	struct smbdirect_socket *sc = &info->socket;
 	struct smbd_mr *mr, *tmp;
 
-	cancel_work_sync(&info->mr_recovery_work);
+	disable_work_sync(&info->mr_recovery_work);
 	list_for_each_entry_safe(mr, tmp, &info->mr_list, list) {
 		if (mr->state == MR_INVALIDATED)
 			ib_dma_unmap_sg(sc->ib.dev, mr->sgt.sgl,
-- 
2.43.0


