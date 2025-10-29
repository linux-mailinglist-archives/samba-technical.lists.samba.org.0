Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AADFC1AB8D
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:33:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JcojBEtkna30Hqo+F1gitVUuCLmWnxhc+qxt03rQrNs=; b=oFoIKqJzuJ/0fV/BQKiG9dkZuV
	64hEAQ9rqYxdx8Kw4xzTyF5GRE7MTI94n5tyuLMbmdlqX0bMb+uGlba7yFQyHZVJ+rYl+TAN8RW+J
	QoiVRQZ2nOobc+DeKziLR2aReutLj92e+kpgFNZ7b3JX9JD4XInn+HVCbiLrCUXHu9qzcz1alQyUF
	NCA7oav6knlfHmGkNbxXT3kcv7VsIWIXlgBaCDymGY4q8zUpnz8du3WgQUz034Vqyrjxkiuc4o6uY
	s32pdLlZaWcP7yvrOaf1rS91jWttjDpq7ocqYns2qaKxXKOzmO3FZEMkxjtPvBs3z7It1aoLtAMa9
	1T7Y5w7g==;
Received: from ip6-localhost ([::1]:62106 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Il-0098S7-5i; Wed, 29 Oct 2025 13:33:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28756) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6CI-0096Pl-UA
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=JcojBEtkna30Hqo+F1gitVUuCLmWnxhc+qxt03rQrNs=; b=k7b1ePSbM4O1MpNQqhUdfCKwos
 pY1VvdHuEg+COoRdW8C3gwcvk1pCuRl3XuZg149L7T6G1V6xkklafzxdgPnB9dsSqYgx3r7DDL+hv
 a6hnJupbaU+2HxV+AnYflVMl3P4AzGdxm2zJo2341G09pnaikA1tQU78Vqw8hWqYwKIX/SnLv1UGM
 p4EX1JG0+5HQEZvcc+ACUvqZMnPS3nW7rSp31QLyqws+EOdz2j7smx09rtxi2BYKRxrZ3mwBxOtId
 dIL2lYmNES7ew0zydNvyBMhP9DjzXCJHN1cnOCxwY14hMPVP769MatxKbwW9VeN7/JK33xjYgJV2T
 OPp1WewIGcqsKRhabRRlk50fqbgQzrPdFUG+qIeY3oywGIO3/52++espeeeByPsHSIXYX+GDDt36Z
 27gmIPhA2RutRXatcSqs2UEznN6lB2CsmN5VCY8nai4Dtpj1ysmZp9Lv+lRGfjy8ePyZRSfJDhbtS
 T/1bswN/XSvels7wEXAh4ivX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6CG-00Bbol-1X; Wed, 29 Oct 2025 13:26:40 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 042/127] smb: smbdirect: introduce
 smbdirect_connection_send_immediate_work()
Date: Wed, 29 Oct 2025 14:20:20 +0100
Message-ID: <cf7a66b45bf07e660e93c6c8857e278e94074156.1761742839.git.metze@samba.org>
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

This is a combination of smb_direct_send_immediate_work() in the server
as well as send_immediate_empty_message() and smbd_post_send_empty() in
the client.

smbdirect_connection_send_immediate_work() replace all of them in
client and server.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index e834fcfe05af..cb977f014c3a 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -1522,6 +1522,28 @@ static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc
 	wake_up(&sc->send_io.pending.dec_wait_queue);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_connection_send_immediate_work(struct work_struct *work)
+{
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, idle.immediate_work);
+	int ret;
+
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
+		return;
+
+	smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_INFO,
+		"send an empty message\n");
+	sc->statistics.send_empty++;
+	ret = smbdirect_connection_send_single_iter(sc, NULL, NULL, 0, 0);
+	if (ret < 0) {
+		smbdirect_log_write(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_send_single_iter ret=%1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		smbdirect_connection_schedule_disconnect(sc, ret);
+	}
+}
+
 __maybe_unused /* this is temporary while this file is included in orders */
 static int smbdirect_connection_post_recv_io(struct smbdirect_recv_io *msg)
 {
-- 
2.43.0


