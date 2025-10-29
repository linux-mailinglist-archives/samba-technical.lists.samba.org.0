Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EC952C1ADDC
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:45:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ueulkKE7HArikNyXqAiB1zO6sRHIz2USFQHvqFe/aek=; b=GKBj4y3xSOfycBaYIdAh5A81Sh
	Kg2vDIHtQC9sLR2tNYDdPzEsRDw7QT0fIkXHmGBrnOlAp4mx1/xQyLIP0OmpFhrWAbtAh35QGTFd2
	nxNX4Ej7mhRLWP5qaIJsuYcV4vK72CrN1Xgrr+hX+kHBbaWVEgpFMZVMu+v7n6c/92MElqDh+bb1Y
	vGX1BsCm6O98uphcz727UDRHdxu9liP7OIG8ewgvtgZeb5dVdxA3teU244S0D+tOM88PT0bdoF+c/
	PR069zjodbqqPPpNa3SH7nw9KM/n/dgCxBQU+NlYNgKOKK1gRkaw/oIyZJOGrevbRQ7D6JIGaE9bb
	ug/WFXRw==;
Received: from ip6-localhost ([::1]:53710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6UB-009Cfc-Vf; Wed, 29 Oct 2025 13:45:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41790) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6HI-00982u-2W
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ueulkKE7HArikNyXqAiB1zO6sRHIz2USFQHvqFe/aek=; b=E3pAobyoFAxG/ulvRQjLs8IZ54
 KfOGNJ01P6UqGdHCPO715MkWWPN1tIObIdq4rnxY5B26VqrhvHWpI2whXn29GRNCCRyiEDhynkd1Z
 swylngggPe5jP96fMEK8GNs4mVMbl81IgzDpmRTIyiR7IEnE11BuZX8kXAdedzh6ywSzBxMPsjnR9
 Fa83UO1rxpG8K3ZPD1VU9jNT6DJgnk+nfqrW4ZN0rbnL3jBz5IEFgDcXt04BsuM7PakemuTkeQyJR
 dcrlb6viFLJZW9tBTpdz3hK4+mbIPjEkNBDWZrHpJ//jOZr87O3zjQbRL2rZCvGl6wAFsb2bJYXDX
 SBbMpDQs4ia9jM75/KBznOtMSM4dU3LC6SiTb2EXmt1t4SAJxwjPcJ38IzqEMOzx3XYxKm09ZoykH
 8pohn2Uv6bLNszrQ5EdvVxpwapFtqpGgtfP3SWI3p96j6UWarkoTzt2US4y3kYCMKZBJdKTo8x5S8
 Y3wgtzsbnrDLYesTeZ4k3CaV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6HF-00BceI-2M; Wed, 29 Oct 2025 13:31:49 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 093/127] smb: server: make use of
 smbdirect_socket_set_logging()
Date: Wed, 29 Oct 2025 14:21:11 +0100
Message-ID: <1964f010965464e492734f4281d96595048545a7.1761742839.git.metze@samba.org>
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

This will allow the logging to keep working as before,
when we move to common functions in the next commits.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 62 ++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index bcc584884f29..fa6371ed0b76 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -109,6 +109,65 @@ struct smb_direct_transport {
 	struct smbdirect_socket socket;
 };
 
+static bool smb_direct_logging_needed(struct smbdirect_socket *sc,
+				      void *private_ptr,
+				      unsigned int lvl,
+				      unsigned int cls)
+{
+	if (lvl <= SMBDIRECT_LOG_ERR)
+		return true;
+
+	if (lvl > SMBDIRECT_LOG_INFO)
+		return false;
+
+	switch (cls) {
+	/*
+	 * These were more or less also logged before
+	 * the move to common code.
+	 *
+	 * SMBDIRECT_LOG_RDMA_MR was not used, but
+	 * that's client only code and we should
+	 * notice if it's used on the server...
+	 */
+	case SMBDIRECT_LOG_RDMA_EVENT:
+	case SMBDIRECT_LOG_RDMA_SEND:
+	case SMBDIRECT_LOG_RDMA_RECV:
+	case SMBDIRECT_LOG_WRITE:
+	case SMBDIRECT_LOG_READ:
+	case SMBDIRECT_LOG_NEGOTIATE:
+	case SMBDIRECT_LOG_OUTGOING:
+	case SMBDIRECT_LOG_RDMA_RW:
+	case SMBDIRECT_LOG_RDMA_MR:
+		return true;
+	/*
+	 * These were not logged before the move
+	 * to common code.
+	 */
+	case SMBDIRECT_LOG_KEEP_ALIVE:
+	case SMBDIRECT_LOG_INCOMING:
+		return false;
+	}
+
+	/*
+	 * Log all unknown messages
+	 */
+	return true;
+}
+
+static void smb_direct_logging_vaprintf(struct smbdirect_socket *sc,
+					const char *func,
+					unsigned int line,
+					void *private_ptr,
+					unsigned int lvl,
+					unsigned int cls,
+					struct va_format *vaf)
+{
+	if (lvl <= SMBDIRECT_LOG_ERR)
+		pr_err("%pV", vaf);
+	else
+		ksmbd_debug(RDMA, "%pV", vaf);
+}
+
 #define KSMBD_TRANS(t) (&(t)->transport)
 #define SMBD_TRANS(t)	(container_of(t, \
 				struct smb_direct_transport, transport))
@@ -422,6 +481,9 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 		return NULL;
 	sc = &t->socket;
 	smbdirect_socket_prepare_create(sc, sp, smb_direct_wq);
+	smbdirect_socket_set_logging(sc, NULL,
+				     smb_direct_logging_needed,
+				     smb_direct_logging_vaprintf);
 	/*
 	 * from here we operate on the copy.
 	 */
-- 
2.43.0


