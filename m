Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD9CC866B4
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:03:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Qy+2XmKfn5UFc2FXYoOcogtXoKuAzm2rZgwa0pF54SA=; b=JVvGvNmJWmfVS9AK0TtzTdFMGJ
	Bm+H/v/COkz+sznKQfTekUYpuSI1xnfqithZz5Wn9nk511QaVjxHnBKF60LUxOBJo0siwO/SaiPAe
	12jb0LPPP0MIxsezNbfPpAraqkIRslj08wrxqC/Aq0Ucv56ZYWOM4HcA7bga4dSQv7erdvI7DkYVd
	n1F/mjVr8nRJQVoS1HTiKh8JU9SZv+zCUpP3zGGrlNyRBNWQ3bO4bkHB/Qw1r+Og1qrE227wcGpOJ
	5sgVwf14Cqzou2iykbnq1/+IJ+eYjp36JyCxDfQduAQLDH0W6QG2jdsR6hxXGY12gnl5/cHXUW42v
	DY8Zki5g==;
Received: from ip6-localhost ([::1]:53640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxNw-00D8XC-Py; Tue, 25 Nov 2025 18:03:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28338) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJv-00D7JL-8h
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:59:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Qy+2XmKfn5UFc2FXYoOcogtXoKuAzm2rZgwa0pF54SA=; b=V/C6twYR7DHnwuoiUvMi2xN52/
 HXzQUEj+j1RWlqnhdJXNDIzoxYa0kzN/cU2b4jZPxc0LQeLwzbSyXvFFv4tww4D9BXe7pinHeXFZc
 Qp9AeHRvSmIapJGni52z7U+aJfe/M92+8pgVKXhKUPe08tQqSXvMfo5GUHxXAyMcAXuJR95FOZ1uf
 1BgqNfxyGK5n83/Sd/BQj3QbTAAjNvWqCToJkPSGJJv6tg6iruEfLl20iJBvMQ5VLDYQhhlexGQm4
 PubTvFiOyhyjFo1r/7e5w8X3WiZDufbrwuUktLsuxSLazC2TTLeyK9bEfmEsi/YVJkncJfMhquduR
 Zgkw2HkFFFW74GYAHwEeThDV637OpIH7G9LcwAK5qBIwX8xiazN5OHhMWutJTRXak+YaJ7V9s5qQt
 tOVH+WVfwbRAbYgYnwsNU5GidPXOB3lEOsusdm+SgM2/at+KRaK/+TalogJVB/nN/9MUMKh0THqxZ
 +Sn1ZgGiMoj4u4ZZ0UaHL6k+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJq-00Fcsu-2C; Tue, 25 Nov 2025 17:59:15 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 026/145] smb: smbdirect: introduce
 smbdirect_connection_qp_event_handler()
Date: Tue, 25 Nov 2025 18:54:32 +0100
Message-ID: <f388ebbba66c8ed4769221a98b27aaf9ca7a58d3.1764091285.git.metze@samba.org>
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

This is basically a copy of smbd_qp_async_error_upcall()
in the client and smb_direct_qpair_handler() in the server.
They will be replaced by the new common function soon,
which will allow more code to be moved as well.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 8c056d363b23..989f55993eee 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -19,6 +19,31 @@ struct smbdirect_map_sges {
 static ssize_t smbdirect_map_sges_from_iter(struct iov_iter *iter, size_t len,
 					    struct smbdirect_map_sges *state);
 
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_qp_event_handler(struct ib_event *event, void *context)
+{
+	struct smbdirect_socket *sc = context;
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+		"%s on device %.*s socket %p (cm_id=%p) status %s first_error %1pe\n",
+		ib_event_msg(event->event),
+		IB_DEVICE_NAME_MAX,
+		event->device->name,
+		sc, sc->rdma.cm_id,
+		smbdirect_socket_status_string(sc->status),
+		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
+
+	switch (event->event) {
+	case IB_EVENT_CQ_ERR:
+	case IB_EVENT_QP_FATAL:
+		smbdirect_socket_schedule_cleanup(sc, -ECONNABORTED);
+		break;
+
+	default:
+		break;
+	}
+}
+
 static void smbdirect_connection_destroy_mem_pools(struct smbdirect_socket *sc);
 
 __maybe_unused /* this is temporary while this file is included in others */
-- 
2.43.0


