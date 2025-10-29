Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E368C1AB5F
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:32:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=9i6a+g1djcTPmqsDdHdKFq4oZ09J4GRQuvlp29Wttvk=; b=pzSbi+Q/CIkms8xeC0e9DANRGa
	e9ZSR+kwKFmglaBYU15br/0Hfj/0i8bf6KcAZnv4FpdPlE5NReqtq7JPH/0lxsdjivc1Iqj46KGp5
	p1pmvtBx5f5FiS+owrXGpG74wEbbYeb0HhLQdpkzHWXCJgihcS4OQomOOeYk8j+diLd9caY/D7FBA
	bo8SwYPxiyXPd2uCYDjZdJPme0j6m0HrHRvOxY9Cy7Tf0T6rzziGMsE4xhhnm0wdinauAgz+0xw2m
	oUP1dAUarUksDQ6ITL4U/SAuHzFqSEHHV5r0a1utDayOhYZxYs7JhOG2+RV2mjuWzbOQHLsX4V2vE
	Qz6/mHWg==;
Received: from ip6-localhost ([::1]:43270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Hs-0098BU-Ir; Wed, 29 Oct 2025 13:32:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10026) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Bq-0096HC-Ig
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=9i6a+g1djcTPmqsDdHdKFq4oZ09J4GRQuvlp29Wttvk=; b=GoWUjAQQYutwTZemKYEEC9px4l
 9gTztH9cuhjDvGIuTr4HYzbXMtA2uLeljoOGW0u7VLdHFUm4vKr5leADZSn/6prorYH44GFrvW1Vv
 9wha7nUicufwR6hTLPtNzUrblz9UbKIQIt/LXGNCzGPOI+prh6KOlTvEQKYQbvB7BrYSSSeHprOa2
 M4LQV+MzoYoD4GERES8xqDu8xL9urVSEY3pGSRdOqoJNW09XKCOaRyReXzPnCFm4LxlylgYifX1Ps
 7J9UMgxhzOoI0//ib2V2C0k8ue/ROwMX6ZFDiWtHVbwDWH0HLSuUMHch6cDBxRCekNK9ET5E6DMfn
 xk4gf+5RZuAtAhHhnFLoZ57cRJ4tOqY2uufNBepG0yGezpOXkeUMiv3fuJMdMhD754gYJ1hE2xvWY
 Y7uvUreCSAD0z6enFuMO+bf6BPfh7Sc+3OLI3PDTdmgKTYlKA3vO7kWAMISDyCkayTkhSL2yvfXFb
 bb0UpE42ZbsNX5n4mZbgHn+8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Bo-00Bbkd-0y; Wed, 29 Oct 2025 13:26:12 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 037/127] smb: smbdirect: introduce
 smbdirect_connection_rdma_{established, event_handler}()
Date: Wed, 29 Oct 2025 14:20:15 +0100
Message-ID: <53a9b0c17add79ebd8ff286a6c7d6b1e106dd46e.1761742839.git.metze@samba.org>
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
 .../common/smbdirect/smbdirect_connection.c   | 88 +++++++++++++++++++
 fs/smb/common/smbdirect/smbdirect_socket.h    |  8 ++
 2 files changed, 96 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 6fe6c53e10ea..cd4f3e6fa5e2 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -128,6 +128,94 @@ static void smbdirect_connection_qp_event_handler(struct ib_event *event, void *
 	}
 }
 
+static int smbdirect_connection_rdma_event_handler(struct rdma_cm_id *id,
+						   struct rdma_cm_event *event)
+{
+	struct smbdirect_socket *sc = id->context;
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
+	if (event->status || event->event != sc->rdma.expected_event) {
+		int ret = -ECONNRESET;
+
+		if (event->event == RDMA_CM_EVENT_DEVICE_REMOVAL)
+			ret = -ENETDOWN;
+		if (IS_ERR(SMBDIRECT_DEBUG_ERR_PTR(event->status)))
+			ret = event->status;
+
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
+		 * If we get RDMA_CM_EVENT_DEVICE_REMOVAL, we should change to
+		 * SMBDIRECT_SOCKET_DISCONNECTED, so that
+		 * rdma_disconnect() is avoided later via
+		 * smbdirect_connection_schedule_disconnect() =>
+		 * smbdirect_connection_disconnect_work().
+		 */
+		if (event->event == RDMA_CM_EVENT_DEVICE_REMOVAL)
+			sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+
+		smbdirect_connection_schedule_disconnect(sc, ret);
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
+		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		smbdirect_connection_schedule_disconnect(sc, -ECONNRESET);
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
+	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
+	return 0;
+}
+
+__maybe_unused /* this is temporary while this file is included in orders */
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
index 795ce4b976ff..c930d7531965 100644
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
@@ -485,6 +491,8 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_WORK(&sc->disconnect_work, __smbdirect_socket_disabled_work);
 	disable_work_sync(&sc->disconnect_work);
 
+	sc->rdma.expected_event = RDMA_CM_EVENT_INTERNAL;
+
 	sc->ib.poll_ctx = IB_POLL_UNBOUND_WORKQUEUE;
 
 	INIT_WORK(&sc->idle.immediate_work, __smbdirect_socket_disabled_work);
-- 
2.43.0


