Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1419EC8672F
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:07:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=46RBBjLzXFv4O4Oc85bes6AeGA6IcDQKWnX97QsPqVQ=; b=nivlpFcFA15K/hWHBPg8SEvJZN
	gSFkybsalqA6jF4KZhThKkDNimyUCu49FtKZsf+y14jS6IOD3fhDKrcyqF0oh9LXhvD19CXNOot/f
	P3yefaNlsFVCvwlTKZHWlCFs/bebT1Cn9wZrEnzZp6xflLTjJi69Oi8d2iPOkfuDskYmsv5pi137w
	40zhOD6Op5rnF60ce+qjwM9rfpXv+uUUNfvVlzFTijscmsmDNoloepBFdZRrF3rcwxum/061qp6Ln
	3t0cjI18U5oXiKKGty+qoNylUgN1hMIlPOn6L05/DwjmVpP2f9iP7aRhBso9Ftked9nVv3hIz2f0P
	xBj1N0LA==;
Received: from ip6-localhost ([::1]:53082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxRF-00D9eQ-K8; Tue, 25 Nov 2025 18:06:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12268) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLS-00D7o7-5n
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=46RBBjLzXFv4O4Oc85bes6AeGA6IcDQKWnX97QsPqVQ=; b=yhsqCsj5tWVbD9zbtIEjpI6Qrp
 QjbTGpg/2wm1nQ+2eoz7MqdU7g0jh54dk7cp15b3Wt6PNbsaaevSL1X03uWXUdNmbM5rm7zYVu5VJ
 SWgilhNf67n2y5xBIgDk3fpYsDwGj2xU/9d3xVBXXAMdY6gg3jlwAyML+0sF8fz31v4QjI99Rp8Uq
 qUNlTle9w2vRJMibZlwLMSQDypOIGbKv2Nospr6EAWdAeu7foPUKgOeBWI0QeBXYsprjvcT8/aRPd
 14J2hBrbKrMl1CBm6Gj9vXKCLnzl+2S4r7ue/g+5OTufOtQ90Qj38PUmE/Cg1xrKtEURRtwfM76uE
 +cLj92SDNoCcLjAuSywpqPD1ejTaPYCkErPKJcjNiSdP29QZPb+bnGaqt5uH9eYZRbr+0o5o1hQ26
 K4JSAU3Ily/1d1FTpJAbmv6JWjx8DCC4mVrKlEmhxFcxtYKHc29M1tcvrVc7BfW2eFZOPl6x+dMHe
 X0FOvNTAVk3B2YROqQivo3zB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLK-00Fd6A-2q; Tue, 25 Nov 2025 18:00:47 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 040/145] smb: smbdirect: introduce
 smbdirect_connection_rdma_{established, event_handler}()
Date: Tue, 25 Nov 2025 18:54:46 +0100
Message-ID: <98210069af54646d2f1627b275ca962101aa34af.1764091285.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will be used by client and server in future,
it will be used after the rdma connection is established
in order to simplify the events happening on an established
connection.

We'll also have smbdirect_{connect,accept}_rdma_event_handler
functions which will be used before the rdma connection is
established.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 110 ++++++++++++++++++
 fs/smb/common/smbdirect/smbdirect_socket.h    |   8 ++
 2 files changed, 118 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index dcaab7383e7d..5c4303093b15 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -44,6 +44,116 @@ static void smbdirect_connection_qp_event_handler(struct ib_event *event, void *
 	}
 }
 
+static int smbdirect_connection_rdma_event_handler(struct rdma_cm_id *id,
+						   struct rdma_cm_event *event)
+{
+	struct smbdirect_socket *sc = id->context;
+	int ret = -ECONNRESET;
+
+	if (event->event == RDMA_CM_EVENT_DEVICE_REMOVAL)
+		ret = -ENETDOWN;
+	if (IS_ERR(SMBDIRECT_DEBUG_ERR_PTR(event->status)))
+		ret = event->status;
+
+	/*
+	 * cma_cm_event_handler() has
+	 * lockdep_assert_held(&id_priv->handler_mutex);
+	 *
+	 * Mutexes are not allowed in interrupts,
+	 * and we rely on not being in an interrupt here.
+	 */
+	WARN_ON_ONCE(in_interrupt());
+
+	if (event->event != sc->rdma.expected_event) {
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"%s (first_error=%1pe, expected=%s) => event=%s status=%d => ret=%1pe\n",
+			smbdirect_socket_status_string(sc->status),
+			SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+			rdma_event_msg(sc->rdma.expected_event),
+			rdma_event_msg(event->event),
+			event->status,
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+
+		/*
+		 * If we get RDMA_CM_EVENT_DEVICE_REMOVAL,
+		 * we should change to SMBDIRECT_SOCKET_DISCONNECTED,
+		 * so that rdma_disconnect() is avoided later via
+		 * smbdirect_socket_schedule_cleanup[_status]() =>
+		 * smbdirect_socket_cleanup_work().
+		 *
+		 * As otherwise we'd set SMBDIRECT_SOCKET_DISCONNECTING,
+		 * but never ever get RDMA_CM_EVENT_DISCONNECTED and
+		 * never reach SMBDIRECT_SOCKET_DISCONNECTED.
+		 */
+		if (event->event == RDMA_CM_EVENT_DEVICE_REMOVAL)
+			smbdirect_socket_schedule_cleanup_status(sc,
+								 SMBDIRECT_LOG_ERR,
+								 ret,
+								 SMBDIRECT_SOCKET_DISCONNECTED);
+		else
+			smbdirect_socket_schedule_cleanup(sc, ret);
+		if (sc->ib.qp)
+			ib_drain_qp(sc->ib.qp);
+		return 0;
+	}
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"%s (first_error=%1pe) event=%s\n",
+		smbdirect_socket_status_string(sc->status),
+		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error),
+		rdma_event_msg(event->event));
+
+	switch (event->event) {
+	case RDMA_CM_EVENT_DISCONNECTED:
+		/*
+		 * We need to change to SMBDIRECT_SOCKET_DISCONNECTED,
+		 * so that rdma_disconnect() is avoided later via
+		 * smbdirect_socket_schedule_cleanup_status() =>
+		 * smbdirect_socket_cleanup_work().
+		 *
+		 * As otherwise we'd set SMBDIRECT_SOCKET_DISCONNECTING,
+		 * but never ever get RDMA_CM_EVENT_DISCONNECTED and
+		 * never reach SMBDIRECT_SOCKET_DISCONNECTED.
+		 *
+		 * This is also a normal disconnect so
+		 * SMBDIRECT_LOG_INFO should be good enough
+		 * and avoids spamming the default logs.
+		 */
+		smbdirect_socket_schedule_cleanup_status(sc,
+							 SMBDIRECT_LOG_INFO,
+							 ret,
+							 SMBDIRECT_SOCKET_DISCONNECTED);
+		if (sc->ib.qp)
+			ib_drain_qp(sc->ib.qp);
+		return 0;
+
+	default:
+		break;
+	}
+
+	/*
+	 * This is an internal error, should be handled above via
+	 * event->event != sc->rdma.expected_event already.
+	 */
+	WARN_ON_ONCE(sc->rdma.expected_event != RDMA_CM_EVENT_DISCONNECTED);
+	smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+	return 0;
+}
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_rdma_established(struct smbdirect_socket *sc)
+{
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"rdma established: device: %.*s local: %pISpsfc remote: %pISpsfc\n",
+		IB_DEVICE_NAME_MAX,
+		sc->ib.dev->name,
+		&sc->rdma.cm_id->route.addr.src_addr,
+		&sc->rdma.cm_id->route.addr.dst_addr);
+
+	sc->rdma.cm_id->event_handler = smbdirect_connection_rdma_event_handler;
+	sc->rdma.expected_event = RDMA_CM_EVENT_DISCONNECTED;
+}
+
 static u32 smbdirect_rdma_rw_send_wrs(struct ib_device *dev,
 				      const struct ib_qp_init_attr *attr)
 {
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index eb9e498c2e2c..8d75390037fc 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -111,6 +111,12 @@ struct smbdirect_socket {
 	/* RDMA related */
 	struct {
 		struct rdma_cm_id *cm_id;
+		/*
+		 * The expected event in our current
+		 * cm_id->event_handler, all other events
+		 * are treated as an error.
+		 */
+		enum rdma_cm_event_type expected_event;
 		/*
 		 * This is for iWarp MPA v1
 		 */
@@ -487,6 +493,8 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_WORK(&sc->disconnect_work, __smbdirect_socket_disabled_work);
 	disable_work_sync(&sc->disconnect_work);
 
+	sc->rdma.expected_event = RDMA_CM_EVENT_INTERNAL;
+
 	sc->ib.poll_ctx = IB_POLL_UNBOUND_WORKQUEUE;
 
 	INIT_WORK(&sc->idle.immediate_work, __smbdirect_socket_disabled_work);
-- 
2.43.0


