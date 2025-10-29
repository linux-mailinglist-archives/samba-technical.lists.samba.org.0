Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 51788C1AA18
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=E2vfaYX9Hh8gqLNvPJpUnPEX1qsOcHPGG3aewqC6yAs=; b=GS1hhjjMP4Slgil1QebApwEVHW
	8Ks8/CdW5pyG++i9P9bFUplVYkPS+Isj2nrCq1z9cfQT47xQ4f45QDuXh4XsZUugL7fS1BofNbx9S
	hBPH+iOuBOxGn6lbMIkqRWoEKgkhx2GkShfJ+lz3W7sPJ7Dhcf3N40ck/Mpufqq+ytKEA+1js6saG
	xjMDXg6nQy061eMLz7SPpxW/fujlwbHAPpSECuWYpOF/6YAMlgOmVSLlEZRnPeEs8fVMk3gZvQSs0
	ARq5VTql0oKpZQd1OkNg8lqmQVtLJbsiHCiMnNtOY0Yky7FEwmqDd/Hj/NaIWsnJxplb4hYYAP0BE
	Omq4cS0w==;
Received: from ip6-localhost ([::1]:26434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE68f-0095E3-EY; Wed, 29 Oct 2025 13:22:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58914) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68b-0095Dw-V6
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=E2vfaYX9Hh8gqLNvPJpUnPEX1qsOcHPGG3aewqC6yAs=; b=sYRAGBT5DiKhNykFzDCrbu8YCt
 0EtSASkvg636afrmxubQ8izctbo+u44RPe67lo1uquE/T4BnxWK4NLsxbNJMSZy2z0wf6RJFV8bAm
 3cXbndWiU2pRgESibmpxxsW2urPmX0gqVdXomRyo2Hkn6VjrTeghN1nbepQ7UonjXJcNNT8nr+eWU
 GCHQ2527tjCPrYJPpXNAkDdmDqYc9/zE/Op46x2kYZ3YBhiu/Af+F6oSV6HTClamaxBGE5UAd3JhP
 sU8H4ELWSlh0wfPPGyNcwTKJXeX3RBGEW6v4/zd/TJWdGDSS7tpZtGyAlquTxHFAjZkWzUDdLMGI7
 dMquxzyxqZwa6QztuDcwcNVApYesYjwmsX3n8NCcchQvsIOjPIbaowwPJWyqE0q0uZAuLDaufLqU1
 6qvb/T8einuPO/vgw+dVxz1YmB5GML7+ClpFDl/ZNE3a/VLQelXsQU1JuKm+xRMCyVETEMtKB+HnB
 RFXLehkMhyx3U837NTRkPkdi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68b-00BbEw-0g; Wed, 29 Oct 2025 13:22:53 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 003/127] smb: smbdirect: introduce smbdirect_socket.logging
 infrastructure
Date: Wed, 29 Oct 2025 14:19:41 +0100
Message-ID: <7575e0da64f55c4e5e51e97a12dd4da50993e38f.1761742839.git.metze@samba.org>
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

This will be used by client and server in order to keep controlling
the logging when we move to shared functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 125 +++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 611986827a5e..65b21b65596f 100644
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
@@ -340,6 +369,98 @@ static void __smbdirect_socket_disabled_work(struct work_struct *work)
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
+#define __smbdirect_log_generic(sc, lvl, cls, fmt, args...) do {			\
+	if (sc->logging.needed(sc, sc->logging.private_ptr, lvl, cls)) {		\
+		__smbdirect_log_printf(sc, __func__, __LINE__, lvl, cls, fmt, ##args);	\
+	}										\
+} while (0)
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
@@ -392,6 +513,10 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_WORK(&sc->mr_io.recovery_work, __smbdirect_socket_disabled_work);
 	disable_work_sync(&sc->mr_io.recovery_work);
 	init_waitqueue_head(&sc->mr_io.cleanup.wait_queue);
+
+	sc->logging.private_ptr = NULL;
+	sc->logging.needed = __smbdirect_log_needed;
+	sc->logging.vaprintf = __smbdirect_log_vaprintf;
 }
 
 struct smbdirect_send_io {
-- 
2.43.0


