Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAADC86759
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:08:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=C+RrOWhyUMD4cWd8o/MVGl/xQ5DVKPMgqQ3I61Bhjko=; b=I8+EYa1OZZGMSzSeE9d8O1+iGK
	UGsvLJTVRJEluzV3Bz/TTSS0UIh+o/yHGIt+S5k5PO2yLcBw73gfp7q4Qh4320C7epwc+g9wEVty8
	7GQ9MnyRoatbvI1Uz6ZnFXCXu9P32kkM+Tv0kupcdYDlKvM4Jov7QuoL0hzChDqGkG2sdw/F/W53E
	eT/rh65A2xnA4Y9fIdqKsl1X7nRDSEO4p6pc+4ZexQyMdPtUde1/kSbo5285lrJbAWq2b6Ca4m78r
	MjVKaAv1OzQv7dWQgC5uPJaLVz07aTbltTb9riBlLjdyWLd/jgbKb9zpSi4xvEB9HL5SAnaHe2/N3
	9IP7q1Vg==;
Received: from ip6-localhost ([::1]:18786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxSw-00DACb-Gr; Tue, 25 Nov 2025 18:08:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21162) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMD-00D82n-Ti
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:01:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=C+RrOWhyUMD4cWd8o/MVGl/xQ5DVKPMgqQ3I61Bhjko=; b=QLQc2RbVlr5mvle4Egh4eHSt8M
 S+if4MTiTmmEeTr1BjJopp++uDOZYsuvq5MAz4yTGPsEI0lkRc9cmVT3fLSiEYJDRFoFsFjmu0pxp
 mC2KaJBW1uttglXIU+PQ8dq4DDk0VgSontOWZtEVKIhluJ3oe79jGo2aOephmqOK04mn3C0xTQzv0
 vbG7+dkFmCC3UKHG5+9+InuCevhLcPPMBhdBUHyex7WclRgSY8brjRFounjJ9qkGSo9qZF2Dh5ISo
 NUyIV7TfwO3WeDzyZ+BZ0bf5uZLLpu8lGcjo9SwtIh7UyuBCb/OLrTKYCJNKsWMXQKuLY7Zd8j3co
 k7ZfQKupeKo4QVtqpfWrbsuaYj4ZrWp/Jt7i25Hak886XZT4wKS6XowOuYrXMrh87fXP5xIlHch6g
 fnG33URri6cJwQ2J5Q8G/cUolVsqQsvdKkbcyScsO2Tl1Stm51hOvPBw9sEXRgCOuV3sLRF8FZaZu
 RcFJSDHCzFgcsNXNwemgxsG0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxM6-00FdF9-21; Tue, 25 Nov 2025 18:01:36 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 047/145] smb: smbdirect: introduce
 smbdirect_mr_io_fill_buffer_descriptor()
Date: Tue, 25 Nov 2025 18:54:53 +0100
Message-ID: <fae71391832f804ad7f5b00b4adce11cd7f011ec.1764091285.git.metze@samba.org>
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

This will be used by the client instead of dereferencing
struct smbdirect_mr_io internals.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_mr.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_mr.c b/fs/smb/common/smbdirect/smbdirect_mr.c
index 35dc2a6c9b89..3c2f653f70e8 100644
--- a/fs/smb/common/smbdirect/smbdirect_mr.c
+++ b/fs/smb/common/smbdirect/smbdirect_mr.c
@@ -452,6 +452,24 @@ smbdirect_connection_register_mr_io(struct smbdirect_socket *sc,
 		mutex_unlock(&mr->mutex);
 	return NULL;
 }
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_mr_io_fill_buffer_descriptor(struct smbdirect_mr_io *mr,
+						   struct smbdirect_buffer_descriptor_v1 *v1)
+{
+	mutex_lock(&mr->mutex);
+	if (mr->state == SMBDIRECT_MR_REGISTERED) {
+		v1->offset = cpu_to_le64(mr->mr->iova);
+		v1->token = cpu_to_le32(mr->mr->rkey);
+		v1->length = cpu_to_le32(mr->mr->length);
+	} else {
+		v1->offset = cpu_to_le64(U64_MAX);
+		v1->token = cpu_to_le32(U32_MAX);
+		v1->length = cpu_to_le32(U32_MAX);
+	}
+	mutex_unlock(&mr->mutex);
+}
+
 /*
  * Deregister a MR after I/O is done
  * This function may wait if remote invalidation is not used
-- 
2.43.0


