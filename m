Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E65FCC1AA60
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:25:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WDnG4dTUK/0i2YUk9L5cV7ZWopeYOVDlFDWoOhQgtG8=; b=dFdxoEbjBvGvJdv+WqF8vfGz3Z
	UFWvTcqD816j+fTCn88Sz78MdglH5ZUbOlnYXKblCJ2L5wrK56bXVJSVVGkTKtss2cLae1mug37Zi
	RXD113w2efWLkjfwPl5BX6PLfhvGLNGtdKD8sDZKYIbQCYDRm0ogPDoyGsjm7WjEHbsSIaDbqW+h4
	5QVrk6SL2G3jJJIHmsImRPgwVyQjsULSq4vD4vZ/FbtNEMcycwmLD2Z5ucPSwz++d/L+nk6sojSZ1
	90SaaDalqR/Sr2r4TSkScPkAX3cGQ3eLDbHpbxQY1U9oNRN9HzAeQJij7lKtrq1WpTXnNEuuPHqA0
	MVAY7/4A==;
Received: from ip6-localhost ([::1]:43126 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Ar-0095tf-UM; Wed, 29 Oct 2025 13:25:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21172) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69I-0095TH-J8
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:23:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WDnG4dTUK/0i2YUk9L5cV7ZWopeYOVDlFDWoOhQgtG8=; b=v5dGOf07DOdeSm45Qqc23+AvEC
 ft5RW6h87AGigoCW53/LVjjsdRFshAcbg6ZWNjJjdYVp2EoTR23SAD3P99tOAOcydJkbaoXwAQZFX
 nrIkwDSQHwrT9yPF3UBIKB0w6KD5OFnk0WGRxyWxxeKht4mFFVAAKr9TuaSt+NQZXekWh5nEfrS5i
 wPxQnjuY3K3PZGLjo6AKQ2KGlIer8yzzb12/QVpouQfHNCz/F3rAeYYzBX49SKcpl6BI+Kqs0Ot4G
 c7YinPV093wDXq2H43EnGXcWZ2xZB3ikJd+/LKh1e2OhhFiASgVcQzuCUl6Rq0aNVTl8MRpLWbmYy
 4yRJEedyrqtIVh5RparszsexRyeZf+mqrFscvHKSDqYjYncPlR6yeZw9+5+hNIKneOfrcdogjBBrK
 975R/Rbu14YQkX84mN0clU7JPPbF/FCtnoogo/+ybA0JWcvatae+YcVIkkZzQhLyf8rmY7Tzh8QfQ
 YBKnLrzDsBypmkWRxu9xrefV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69E-00BbJi-0c; Wed, 29 Oct 2025 13:23:32 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 010/127] smb: smbdirect: introduce
 smbd_disconnect_wake_up_all()
Date: Wed, 29 Oct 2025 14:19:48 +0100
Message-ID: <93242f5b9813a13e411183685ee0f32ccdc19b15.1761742839.git.metze@samba.org>
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

This is a superset of smbd_disconnect_wake_up_all() in the client
and smb_direct_disconnect_wake_up_all() in the server and will
replace them.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_connection.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index f7fc4b1732c4..654719f4388a 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -44,3 +44,21 @@ static void smbdirect_socket_set_logging(struct smbdirect_socket *sc,
 	sc->logging.needed = needed;
 	sc->logging.vaprintf = vaprintf;
 }
+
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_connection_wake_up_all(struct smbdirect_socket *sc)
+{
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 */
+	wake_up_all(&sc->status_wait);
+	wake_up_all(&sc->send_io.lcredits.wait_queue);
+	wake_up_all(&sc->send_io.credits.wait_queue);
+	wake_up_all(&sc->send_io.pending.dec_wait_queue);
+	wake_up_all(&sc->send_io.pending.zero_wait_queue);
+	wake_up_all(&sc->recv_io.reassembly.wait_queue);
+	wake_up_all(&sc->rw_io.credits.wait_queue);
+	wake_up_all(&sc->mr_io.ready.wait_queue);
+	wake_up_all(&sc->mr_io.cleanup.wait_queue);
+}
-- 
2.43.0


