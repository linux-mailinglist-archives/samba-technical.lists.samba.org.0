Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C13C1AC18
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OFRXOkz2qoXM+EZMcIUL0vN6PbqKZbBqNyw2hIqeExw=; b=zxitlfhGrOUwUFWhNr1PIJNbiy
	C547Nhezlz6atr+9WzwgYiDCC+CMx+VTTJ8988tHfIC7lelP/Hd5Jk+Mxl5caXVbP9r1MzOlJChSw
	By0/AS+7snTkAwBIYD2S6/QQkD+XnMgURwHPgTeJOba+umv+0Q1/8v3hy2SNDjx4T46UF/T78gjkM
	KXiPmi4wVahsB4L5z+vDdHNOnc0/WWs9QdN0zQGA4q/RtS9rHKiiCBSi6Q094xHKvYy6oEJBCUUMy
	c1XFn6XfcmpO9Ue0kRxomdQpEdCLApm1TEmr8SJHtDS65gLERu6D8fpe2wsgBwhQpLXdODBvnE92x
	2RaLdw6g==;
Received: from ip6-localhost ([::1]:61760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6M1-0099ct-Gh; Wed, 29 Oct 2025 13:36:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44868) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Dg-0096sS-Na
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=OFRXOkz2qoXM+EZMcIUL0vN6PbqKZbBqNyw2hIqeExw=; b=2QK2Z+SLFYokLBdZiJy2BnkEjV
 jwvA4ezh3+VRe1bIryvtJAm4QkpN6QQiuodQHjI6zEkNGVs3wAPysL78g/A3ZHq/h82MKGh+5cK9p
 H7jnTfi0u6RhueIXtNMvvM6yFdZNkZRnvI4DnPSshvHvklN1sRotsveQ4iH1kUE25hr+FzWATjBaR
 vtSF51WI3OFjb3gdxUxW9cZvZ+kO2X0RW54Kg3k7Y7UpMwxo3liIptyufsSLYLw8UFmNuFqHv+Bu7
 LNXNNYcv60XSUjtxWC4O+jiZO7woayr3XGvIcIWWKOnDCePFMocPr7JfKS1WY4ff3IPPCz3vjD5NU
 YIDgtc9mcksMMdv3STC0TG5sMH2gZCzQWNMInmAKkemEJCqYiDJbt4C3rm+zK6PneOsygUepQ5HxV
 PDe+Oc/+HXR3Nzylkzy4FmSZoe/0VdMNgLlZU0ErGhr5nOsV1Mmi0Nme6PBLSvSc5I4bgU6GRlSDh
 dmIYOp4Qt/y9d3WY7pQOakju;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Df-00Bc35-05; Wed, 29 Oct 2025 13:28:07 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 057/127] smb: client: make use of
 smbdirect_socket_prepare_create()
Date: Wed, 29 Oct 2025 14:20:35 +0100
Message-ID: <33fceea3c3f2155f27db17909557b6fc4008f858.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This prepares the use of functions from smbdirect_connection.c.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 35 +++++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 5ae22c8dea81..04a90fd0971c 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1793,6 +1793,7 @@ static struct smbd_connection *_smbd_get_connection(
 	int rc;
 	struct smbd_connection *info;
 	struct smbdirect_socket *sc;
+	struct smbdirect_socket_parameters init_params = {};
 	struct smbdirect_socket_parameters *sp;
 	struct rdma_conn_param conn_param;
 	struct ib_qp_cap qp_cap;
@@ -1803,20 +1804,10 @@ static struct smbd_connection *_smbd_get_connection(
 	char wq_name[80];
 	struct workqueue_struct *workqueue;
 
-	info = kzalloc(sizeof(struct smbd_connection), GFP_KERNEL);
-	if (!info)
-		return NULL;
-	sc = &info->socket;
-	scnprintf(wq_name, ARRAY_SIZE(wq_name), "smbd_%p", sc);
-	workqueue = create_workqueue(wq_name);
-	if (!workqueue)
-		goto create_wq_failed;
-	smbdirect_socket_init(sc);
-	sc->workqueue = workqueue;
-	sp = &sc->parameters;
-
-	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
-
+	/*
+	 * Create the initial parameters
+	 */
+	sp = &init_params;
 	sp->resolve_addr_timeout_msec = RDMA_RESOLVE_TIMEOUT;
 	sp->resolve_route_timeout_msec = RDMA_RESOLVE_TIMEOUT;
 	sp->rdma_connect_timeout_msec = RDMA_RESOLVE_TIMEOUT;
@@ -1832,6 +1823,22 @@ static struct smbd_connection *_smbd_get_connection(
 	sp->keepalive_interval_msec = smbd_keep_alive_interval * 1000;
 	sp->keepalive_timeout_msec = KEEPALIVE_RECV_TIMEOUT * 1000;
 
+	info = kzalloc(sizeof(struct smbd_connection), GFP_KERNEL);
+	if (!info)
+		return NULL;
+	sc = &info->socket;
+	scnprintf(wq_name, ARRAY_SIZE(wq_name), "smbd_%p", sc);
+	workqueue = create_workqueue(wq_name);
+	if (!workqueue)
+		goto create_wq_failed;
+	smbdirect_socket_prepare_create(sc, sp, workqueue);
+	/*
+	 * from here we operate on the copy.
+	 */
+	sp = &sc->parameters;
+
+	INIT_WORK(&sc->disconnect_work, smbd_disconnect_rdma_work);
+
 	rc = smbd_ia_open(sc, dstaddr, port);
 	if (rc) {
 		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
-- 
2.43.0


