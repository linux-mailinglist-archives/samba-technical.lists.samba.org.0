Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 55094C86574
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:57:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mlvKe2mgtno888KeQZ3YSWKd/tqU/dyQNi1eEpPb/aU=; b=Z+EmqfiLDTASaNqcnRa6HXckXv
	0Cgvjw0iTO/FmBUlGcwwKE5P3yqVZ7qDu70r1fSZNMCFpiVi1U1LvDGCt6410mzax9ins3d6hcLtd
	UPOJVlg1xUU9FsDizqZaD+/9smvwHI+2+zxcwtgYQU9++4ILvMAfp5N3P2qxnM3BnfVDCiOD/5UVe
	A5IWcnU/KpkxaAVB8CwwCMgDdUmJiTGdHRcQd47529dyji9IDd2KY7/gJcJqFWnKLhxQxll3SYOa7
	Vgv3zdSCizgFxwAQZlJ4xi3BBa3zTS8Blo+uYnu8QJ24YN905vRmNPZizaaJ6CxWSX5tnqQvHZVx3
	Kpk3pO2w==;
Received: from ip6-localhost ([::1]:41592 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxHe-00D6YQ-8I; Tue, 25 Nov 2025 17:56:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32496) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHZ-00D6YI-16
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:56:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=mlvKe2mgtno888KeQZ3YSWKd/tqU/dyQNi1eEpPb/aU=; b=zzkhy5bdqDBREl9oUsWQ+WjhuF
 x3teHbw7RQeFRB44rLb/Zbrh8uriPKudnPvtMeNdZ9+5vplpLW94oJutPc43tqtK1N/BAim4XDU6W
 V2zi75Vt3TwEESwWEqVS39P+OC6eRlySJF0VvJyN/7AXOW5usu0Itz2yZS3IvOhd4eYu6j+QIcYAD
 hR+Ue1csQXGKLwBODVG1U1LwAGQJqnIY2UfxjHRJhRLWuIhdkLxkSmmu4VYWmhJvAcyj9vhO9DtUr
 YjLKm8WS74jkJqzXLJ3CH7garQfeTpQ9z9/dJCdD775iCDGzhexftFSa5h8ir2xAqCHbmV/+nBLLq
 wPMD4FjFC2k8+Ui1llpe4P5IoQCkzpa8dAog6hEp/MvbRPH3tfd7JVVAyrLqhX9fl83YN3dGMoTFu
 uon3+Ne6mpGMgrj7N9YdirtpYDdPQm0Ed6zIxjSeQXLI6Kw++o3n8+BVotEhnaTCAWXSstpaPf0/E
 357fLFxtOx4fododf/bSoHSY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHX-00FcT4-3A; Tue, 25 Nov 2025 17:56:52 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 002/145] smb: smbdirect: introduce smbdirect_socket.logging
 infrastructure
Date: Tue, 25 Nov 2025 18:54:08 +0100
Message-ID: <2318bdfd1bee30ef4a3d0b188aef64e34f5b07d8.1764091285.git.metze@samba.org>
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

This will be used by client and server in order to keep controlling
the logging when we move to shared functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 127 +++++++++++++++++++++
 1 file changed, 127 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 384b19177e1c..f449fcd30235 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -330,6 +330,35 @@ struct smbdirect_socket {
 		u64 dequeue_reassembly_queue;
 		u64 send_empty;
 	} statistics;
+
+	struct {
+#define SMBDIRECT_LOG_ERR		0x0
+#define SMBDIRECT_LOG_INFO		0x1
+
+#define SMBDIRECT_LOG_OUTGOING			0x1
+#define SMBDIRECT_LOG_INCOMING			0x2
+#define SMBDIRECT_LOG_READ			0x4
+#define SMBDIRECT_LOG_WRITE			0x8
+#define SMBDIRECT_LOG_RDMA_SEND			0x10
+#define SMBDIRECT_LOG_RDMA_RECV			0x20
+#define SMBDIRECT_LOG_KEEP_ALIVE		0x40
+#define SMBDIRECT_LOG_RDMA_EVENT		0x80
+#define SMBDIRECT_LOG_RDMA_MR			0x100
+#define SMBDIRECT_LOG_RDMA_RW			0x200
+#define SMBDIRECT_LOG_NEGOTIATE			0x400
+		void *private_ptr;
+		bool (*needed)(struct smbdirect_socket *sc,
+			       void *private_ptr,
+			       unsigned int lvl,
+			       unsigned int cls);
+		void (*vaprintf)(struct smbdirect_socket *sc,
+				 const char *func,
+				 unsigned int line,
+				 void *private_ptr,
+				 unsigned int lvl,
+				 unsigned int cls,
+				 struct va_format *vaf);
+	} logging;
 };
 
 static void __smbdirect_socket_disabled_work(struct work_struct *work)
@@ -340,6 +369,100 @@ static void __smbdirect_socket_disabled_work(struct work_struct *work)
 	WARN_ON_ONCE(1);
 }
 
+static bool __smbdirect_log_needed(struct smbdirect_socket *sc,
+				   void *private_ptr,
+				   unsigned int lvl,
+				   unsigned int cls)
+{
+	/*
+	 * Should never be called, the caller should
+	 * set it's own functions.
+	 */
+	WARN_ON_ONCE(1);
+	return false;
+}
+
+static void __smbdirect_log_vaprintf(struct smbdirect_socket *sc,
+				     const char *func,
+				     unsigned int line,
+				     void *private_ptr,
+				     unsigned int lvl,
+				     unsigned int cls,
+				     struct va_format *vaf)
+{
+	/*
+	 * Should never be called, the caller should
+	 * set it's own functions.
+	 */
+	WARN_ON_ONCE(1);
+}
+
+__printf(6, 7)
+static void __smbdirect_log_printf(struct smbdirect_socket *sc,
+				   const char *func,
+				   unsigned int line,
+				   unsigned int lvl,
+				   unsigned int cls,
+				   const char *fmt,
+				   ...);
+__maybe_unused
+static void __smbdirect_log_printf(struct smbdirect_socket *sc,
+				   const char *func,
+				   unsigned int line,
+				   unsigned int lvl,
+				   unsigned int cls,
+				   const char *fmt,
+				   ...)
+{
+	struct va_format vaf;
+	va_list args;
+
+	va_start(args, fmt);
+
+	vaf.fmt = fmt;
+	vaf.va = &args;
+
+	sc->logging.vaprintf(sc,
+			     func,
+			     line,
+			     sc->logging.private_ptr,
+			     lvl,
+			     cls,
+			     &vaf);
+	va_end(args);
+}
+
+#define ___smbdirect_log_generic(sc, func, line, lvl, cls, fmt, args...) do {	\
+	if (sc->logging.needed(sc, sc->logging.private_ptr, lvl, cls)) {	\
+		__smbdirect_log_printf(sc, func, line, lvl, cls, fmt, ##args);	\
+	}									\
+} while (0)
+#define __smbdirect_log_generic(sc, lvl, cls, fmt, args...) \
+	___smbdirect_log_generic(sc, __func__, __LINE__, lvl, cls, fmt, ##args)
+
+#define smbdirect_log_outgoing(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_OUTGOING, fmt, ##args)
+#define smbdirect_log_incoming(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_INCOMING, fmt, ##args)
+#define smbdirect_log_read(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_READ, fmt, ##args)
+#define smbdirect_log_write(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_WRITE, fmt, ##args)
+#define smbdirect_log_rdma_send(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_SEND, fmt, ##args)
+#define smbdirect_log_rdma_recv(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_RECV, fmt, ##args)
+#define smbdirect_log_keep_alive(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_KEEP_ALIVE, fmt, ##args)
+#define smbdirect_log_rdma_event(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_EVENT, fmt, ##args)
+#define smbdirect_log_rdma_mr(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_MR, fmt, ##args)
+#define smbdirect_log_rdma_rw(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_RDMA_RW, fmt, ##args)
+#define smbdirect_log_negotiate(sc, lvl, fmt, args...) \
+		__smbdirect_log_generic(sc, lvl, SMBDIRECT_LOG_NEGOTIATE, fmt, ##args)
+
 static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 {
 	/*
@@ -392,6 +515,10 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_WORK(&sc->mr_io.recovery_work, __smbdirect_socket_disabled_work);
 	disable_work_sync(&sc->mr_io.recovery_work);
 	init_waitqueue_head(&sc->mr_io.cleanup.wait_queue);
+
+	sc->logging.private_ptr = NULL;
+	sc->logging.needed = __smbdirect_log_needed;
+	sc->logging.vaprintf = __smbdirect_log_vaprintf;
 }
 
 #define __SMBDIRECT_CHECK_STATUS_FAILED(__sc, __expected_status, __error_cmd, __unexpected_cmd) ({ \
-- 
2.43.0


