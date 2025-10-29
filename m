Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 08655C1ABA8
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:34:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=kbWRn3NZtYG7kstJCa+SOMSM8xj3XMv/xo19iF3NNSI=; b=J81uONPlYkdoqoC9H9dvvV/INt
	W5BMkANkOGmzqCS50xEhP+TwYfdcDp1U8omm5PS/5fozz5Z/Wu+MH5w2tsTO2BaU3dElIsI9pkHSQ
	5imAf8R8DVoc/qgxqlJ/ZNkjvTFdbeVd6wrqWJaH60uq9XdYiz3e/oQ9dcNFg6K0AIGXN/VVVXoxP
	Ok9KLbUVQaVmbwCX1sntqvNIRZcFG/eTLPhkSQTYtmVZRZibDbmn5YzZFmtJn8Jq2LRpyk3/lvK/l
	uDpvsl1lJW1HGOitOZTAKzgJpxTEXwBWw3fksh4wTnhttPijJ3t9FOPJH+r9mo3yYR4M1vESyJzvn
	DSG2to9Q==;
Received: from ip6-localhost ([::1]:44738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6JV-0098k9-PN; Wed, 29 Oct 2025 13:34:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53508) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6CT-0096Tc-BG
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=kbWRn3NZtYG7kstJCa+SOMSM8xj3XMv/xo19iF3NNSI=; b=Aav841KCdoHf0SMhEWVCCTFbcv
 /FxxLeD+AauiRZynceVl9VMeW4TmVJ9LqYncpcr7p9Ya6paX/tKX27odbdvV/D8wEzt6+do9DrnTZ
 soASsL69sShbL5al1K72insopW7A642C8bK32vU2Y0ugRJVPUDZXL1CJ6vt40fYXM2nu1haz7Ivjg
 udyHwPvRlYZvHmnGYTv+DVK8ocXqYbh2kORdjWpuIBO7WEmCyfnpmadhCMo3IC8YS6L65FPkL6Rzz
 XVoa4uSoB4feu4CW7b72QrRzhwKqyay7APu9W42gZlaOki3Vrn8GS2L3xBklYD6mYkkpHw+VXdzFI
 9jLKQA64m3dwqG7U1GVLWZFOs7iUbc7n3FgMWyG3q/yWIwbiE9X5SP5CgKedsEPNGG/wgocVWkE6f
 gpRfYdtQ/X3R6PJbORc9wB9IjlBNfcNisyAhkpsdOWVYL46s639WJlccUZtkTYs6u1ltnh/8mX0mI
 xfYEuMWb1Y8QqC0QbtnJkwO0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6CR-00Bbqd-21; Wed, 29 Oct 2025 13:26:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 044/127] smb: smbdirect: introduce
 smbdirect_mr_io_fill_buffer_descriptor()
Date: Wed, 29 Oct 2025 14:20:22 +0100
Message-ID: <2818d5b62f38b73c009db4a7e2066e77bca0c7ff.1761742839.git.metze@samba.org>
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

This will be used by the client instead of dereferencing
struct smbdirect_mr_io internals.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_mr.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_mr.c b/fs/smb/common/smbdirect/smbdirect_mr.c
index 5fd6a853e656..bca58eee783b 100644
--- a/fs/smb/common/smbdirect/smbdirect_mr.c
+++ b/fs/smb/common/smbdirect/smbdirect_mr.c
@@ -453,6 +453,24 @@ smbdirect_connection_register_mr_io(struct smbdirect_socket *sc,
 		mutex_unlock(&mr->mutex);
 	return NULL;
 }
+
+__maybe_unused /* this is temporary while this file is included in orders */
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


