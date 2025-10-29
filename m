Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F822C1AA72
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:25:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=clY1ObX7ulWnBwA/LuW26mVgWdqnWOB6Wjwp+FYXykk=; b=0mo40+wLvzGm7FOaJ8tPeI+KUY
	Yhru9JO1VzhxVhMwP+i9xaWD2SDBfpJY9fElggdsHTZ93sds21sGd2+gzmZHNWNZ+cvF7ZruC/NXC
	CJI77cKAE7GTliGZj+pSOgsvPJ/B/rMoXhO5xz7KLz0VJYyT7o2hmiCmIf9LznukCiW9kdg92audK
	bWywGaaXPeYQeJtI+uDmy5TozRTI6g7dKHAvg4ifL5WllZ6M+n73+r/bqpwuvMxwREeBfWpT9FiTf
	Ao49YTHjiFSaE/eeJiL0epJXD5Vqrgfa6+HMIhbKibA2Ci0czXAx0VCBIYcVIvxUyoPHMFwqToi3V
	OpLxIUNg==;
Received: from ip6-localhost ([::1]:52068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6BM-00965E-MN; Wed, 29 Oct 2025 13:25:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63722) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69T-0095W3-Ha
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:23:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=clY1ObX7ulWnBwA/LuW26mVgWdqnWOB6Wjwp+FYXykk=; b=tdXSfaFVEbDRDjufTNhJobX4fY
 5Yg7OVZ8x7M9tjVdlOdmbXrfu2MxARshE3oDxJm2i5a85Jxb4f8B440uHup5lIA/SS3UQXTpI166i
 q8WeUsoqzQha+ygrXkGKvmvQK3hkfgmQ8kbxH9/M4VwNUgDo3Y0a8+AEaz2difOivm4QUWd3m9ZUt
 jzxHnSVKGxhLYASqJKSv1Klf4+pMhMnPG8Gxupp6UWG5Nl5vJHtBnvln/rdssEPJqO+zq37b05AOa
 XuwFEjkl/XRheTIqV54yub1HEQCy7gaP3W9TUWetOal8GLt7FunOxNQU51JNkxzgOj/D+zidGNfc9
 Bs3KR9WhDM/8hyVZ4WEJb7By4adtzqZq6Kd81ZExqFd4j6GqGwWVQ0TigsTe/vbpOuTpmeqOd7kR3
 2qG7GMjmIRqT48YChWsRinEZam0bfE+kUhU4WUm3QW2jIYSepvGjssUn94olRJ5QB+5M2Regtq8Ur
 XD+VkoLk59qwYx6s1gERy5Hr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69P-00BbNi-2d; Wed, 29 Oct 2025 13:23:43 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 012/127] smb: smbdirect: introduce
 smbdirect_connection_schedule_disconnect()
Date: Wed, 29 Oct 2025 14:19:50 +0100
Message-ID: <beb34939d6e613b0eab29039434c126ff7b7a8d9.1761742839.git.metze@samba.org>
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

This is a copy of smbd_disconnect_rdma_connection() and
smb_direct_disconnect_rdma_connection(). It will replace
them in the next steps.

The only difference is that it gets an explicit error passed
in instead of hardcoding -ECONNABORTED.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index ebf47baa5d25..f96355043e16 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -6,6 +6,8 @@
 
 #include "smbdirect_internal.h"
 
+static void smbdirect_connection_schedule_disconnect(struct smbdirect_socket *sc,
+						     int error);
 static void smbdirect_connection_disconnect_work(struct work_struct *work);
 
 __maybe_unused /* this is temporary while this file is included in orders */
@@ -67,6 +69,74 @@ static void smbdirect_connection_wake_up_all(struct smbdirect_socket *sc)
 	wake_up_all(&sc->mr_io.cleanup.wait_queue);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_connection_schedule_disconnect(struct smbdirect_socket *sc,
+						     int error)
+{
+	/*
+	 * make sure other work (than disconnect_work)
+	 * is not queued again but here we don't block and avoid
+	 * disable[_delayed]_work_sync()
+	 */
+	disable_work(&sc->recv_io.posted.refill_work);
+	disable_work(&sc->mr_io.recovery_work);
+	disable_work(&sc->idle.immediate_work);
+	disable_delayed_work(&sc->idle.timer_work);
+
+	if (sc->first_error == 0)
+		sc->first_error = error;
+	if (sc->first_error == 0)
+		sc->first_error = -ECONNABORTED;
+
+	switch (sc->status) {
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED:
+	case SMBDIRECT_SOCKET_NEGOTIATE_FAILED:
+	case SMBDIRECT_SOCKET_ERROR:
+	case SMBDIRECT_SOCKET_DISCONNECTING:
+	case SMBDIRECT_SOCKET_DISCONNECTED:
+	case SMBDIRECT_SOCKET_DESTROYED:
+		/*
+		 * Keep the current error status
+		 */
+		break;
+
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ADDR_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_NEEDED:
+	case SMBDIRECT_SOCKET_RESOLVE_ROUTE_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_RESOLVE_ROUTE_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_NEEDED:
+	case SMBDIRECT_SOCKET_RDMA_CONNECT_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_RDMA_CONNECT_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_NEGOTIATE_NEEDED:
+	case SMBDIRECT_SOCKET_NEGOTIATE_RUNNING:
+		sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
+		break;
+
+	case SMBDIRECT_SOCKET_CREATED:
+	case SMBDIRECT_SOCKET_CONNECTED:
+		sc->status = SMBDIRECT_SOCKET_ERROR;
+		break;
+	}
+
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 */
+	smbdirect_connection_wake_up_all(sc);
+
+	queue_work(sc->workqueue, &sc->disconnect_work);
+}
+
 static void smbdirect_connection_disconnect_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
-- 
2.43.0


