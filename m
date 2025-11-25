Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B46C8667B
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=9HP11oIEtYNGTRt2RrGuDZbXywFyoQoFDw9ZZl7qqJQ=; b=EbSp/CAkQTorFPV3SvGb1uRgrq
	EkSc7Tcm3yHM6q2oSI1K51sR7QjZH44KKhxD3KHML7NUg+bTHiyWoshKJroVxNKgek42Kb7YpXDDV
	5aDWaIpfdNCy8RpRKakEH8r1ZCAPU2dTBN4dEEmHZyj5hZ8dz21A1cmGPGL2Co1PA29rdyEsY8n3u
	NmesGJO8cJ0pOjd3Oc0VBH3UTzN5N/HZ1YsY8fGiHkzSOe4YLQWSiqR7shRL9IBnuqat9EOPofKt7
	6qeNZghHKuopJk24p5Hd5vE7gxeKIUiuSES5bjjo/WF/LwuD+WShh2D5WtZ2KXraZZvQOBqzmqpwp
	nX/Z/qcA==;
Received: from ip6-localhost ([::1]:53584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxMK-00D7zS-Df; Tue, 25 Nov 2025 18:01:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11918) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJC-00D73k-9N
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=9HP11oIEtYNGTRt2RrGuDZbXywFyoQoFDw9ZZl7qqJQ=; b=Dt0Cn38T3u5IaE5ktSMN7r6LIT
 iRsR8P6YvqL8AQvEOtYgs4oprzocl3OFWb0G0zQd+7hDK13F0errJYBRhZw4nJZnJdJHG3udnOa2W
 VrEtTkboXtMGRx/R7y2wbhMaUG530xB/h0bqnQ80XshFfg3rW22EZOVyXii3dOZvha4Gb9pPCUcr4
 bALS2TDGnLdvN1pIK78wOLdtoJWvzBPJ+XjLn+sYPUK9+Auz8RNTEbEqrWKkwyycU3VRESFsBDbQm
 pqu9iqi6kvWuYnUzNSMywkRU+C3i0fkPd93WlsCL8YZgErWgclnhyG3an4F2r76QRHdBdAYl2KxkZ
 R5IKJj3c1dC3SucX8lkRAz6OYQjcnxYbOcpY4xFtGBpus9hKyTXqDxBG7XX4BJrJMcc1sqIeqacGo
 JvEl7P+tix3+XFePer5knlvla8W07pny7p9ojsXj0/NATuN+WjHS3+kuTU3Z5qJOQsytpDyFjriMq
 F/NCcDbJbJ1fjXX88cp00lfk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJ6-00Fclf-08; Tue, 25 Nov 2025 17:58:28 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 018/145] smb: smbdirect: introduce
 smbdirect_connection_idle_timer_work()
Date: Tue, 25 Nov 2025 18:54:24 +0100
Message-ID: <218c4d55d54305c610732df83188609d09d3389d.1764091285.git.metze@samba.org>
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

This is basically a copy of idle_connection_timer() in the client
and smb_direct_idle_connection_timer() in the server.
The only difference is that the server does not have logging.

Currently the callers set their own timer function after
smbdirect_socket_prepare_create(), but that will change
in the next steps...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 31 +++++++++++++++++++
 fs/smb/common/smbdirect/smbdirect_internal.h  |  2 ++
 fs/smb/common/smbdirect/smbdirect_socket.c    |  3 +-
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index aa554527f993..f3176bb35977 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -92,3 +92,34 @@ smbdirect_connection_reassembly_first_recv_io(struct smbdirect_socket *sc)
 
 	return msg;
 }
+
+static void smbdirect_connection_idle_timer_work(struct work_struct *work)
+{
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, idle.timer_work.work);
+	const struct smbdirect_socket_parameters *sp = &sc->parameters;
+
+	if (sc->idle.keepalive != SMBDIRECT_KEEPALIVE_NONE) {
+		smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_ERR,
+			"%s => timeout sc->idle.keepalive=%s\n",
+			smbdirect_socket_status_string(sc->status),
+			sc->idle.keepalive == SMBDIRECT_KEEPALIVE_SENT ?
+			"SENT" : "PENDING");
+		smbdirect_socket_schedule_cleanup(sc, -ETIMEDOUT);
+		return;
+	}
+
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
+		return;
+
+	/*
+	 * Now use the keepalive timeout (instead of keepalive interval)
+	 * in order to wait for a response
+	 */
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
+			 msecs_to_jiffies(sp->keepalive_timeout_msec));
+	smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_INFO,
+		"schedule send of empty idle message\n");
+	queue_work(sc->workqueue, &sc->idle.immediate_work);
+}
diff --git a/fs/smb/common/smbdirect/smbdirect_internal.h b/fs/smb/common/smbdirect/smbdirect_internal.h
index 93c10b4f1ed5..7465a63118bd 100644
--- a/fs/smb/common/smbdirect/smbdirect_internal.h
+++ b/fs/smb/common/smbdirect/smbdirect_internal.h
@@ -33,4 +33,6 @@ static void __smbdirect_socket_schedule_cleanup(struct smbdirect_socket *sc,
 		__func__, __LINE__, __error, &__force_status); \
 } while (0)
 
+static void smbdirect_connection_idle_timer_work(struct work_struct *work);
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_INTERNAL_H__ */
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index a73162717ffe..37b483d8203b 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -27,6 +27,8 @@ static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
 	sc->workqueue = workqueue;
 
 	INIT_WORK(&sc->disconnect_work, smbdirect_socket_cleanup_work);
+
+	INIT_DELAYED_WORK(&sc->idle.timer_work, smbdirect_connection_idle_timer_work);
 }
 
 __maybe_unused /* this is temporary while this file is included in others */
@@ -66,7 +68,6 @@ static void smbdirect_socket_wake_up_all(struct smbdirect_socket *sc)
 	wake_up_all(&sc->mr_io.cleanup.wait_queue);
 }
 
-__maybe_unused /* this is temporary while this file is included in others */
 static void __smbdirect_socket_schedule_cleanup(struct smbdirect_socket *sc,
 						const char *macro_name,
 						unsigned int lvl,
-- 
2.43.0


