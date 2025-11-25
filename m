Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2B7C866F9
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:06:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=i/QwXzh3u/bJtSjnuwRoopJdyOv4i1gz17T9dmfSnqE=; b=3ZQIHe1Q5fnuda+hCFylugEjbE
	6BGVfnS2zBrgNB9dTQR3TBlZ4z5RuJKfrAtt0Q9FGeyWU421yRDmiaKakkRYOmaVOfXb7x43VUbmQ
	3/DtiBbS6lLklOcvoy28xmGt1Qq2xkHS9xduewe7/nqFFV7abipGcWf+surDcCgW2t7C5RSeQrMHs
	B9cfGYpXRAMYpPq2Jh5B38rN4cYGtMXMLMjNagpNU+7UAm0EKWHIm92GtgkaNHU325g11ENtUjOY+
	wa/NEGbwp9ue42oJXRyTFH+a9ah051qWmTU1uLlysum75H5Xk4p+LjP9EMCYiSD/l6jwuGJu+9uTa
	3Ex8JesQ==;
Received: from ip6-localhost ([::1]:43578 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxQV-00D9Pe-0D; Tue, 25 Nov 2025 18:06:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53534) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxL2-00D7fb-Gj
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:00:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=i/QwXzh3u/bJtSjnuwRoopJdyOv4i1gz17T9dmfSnqE=; b=VOGPsKP4/4SvJ1ah+/52IES3sv
 HWYpCnyIIsPfVqjAyKo8rzNhdrLpw80826mJkSw/EFJSfCq6HVdxrf+a4bHK8CQf84J0T6lrxgiD+
 5FT6hRqAVv29B3JYjy3YXj/2orqqDc54oRhxa5OP5rk6AGyzMcecfqNtYgVlRBxHvMMtJw6WWqnoD
 +oNpPAE3Vbrr7FkO4lm/R89MUMnM04PjUySGBZY1gflfvvzxD+oZd5qSIuLNQROU6FPTn4FiQN2Dz
 7hmaykK4uqb0FdcEyoD+pE2M2PlhRBGOM40msRk1CaJu06SkgunJzWzAhNp+MGzvvCFLX4sdCgMtX
 Yd6V0rssT+fmAWgpj9JSAHIu+j9tU16FyoFYzlJLXirmzUFRL/6Occ0icrsUHrpxkU79X94lc4T6d
 k/hQt0tTCm0FDFqF4ulsuQ7fLLGrNWn8G1S+6Tt4WzSmn9lc2VXKo9v9xZrlbnEYBQUmbQ6k72eoe
 wH/YqS6xRtix5/skiLucvZ6l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKw-00Fd3a-2J; Tue, 25 Nov 2025 18:00:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 037/145] smb: smbdirect: define
 SMBDIRECT_RDMA_CM_[RNR_]RETRY
Date: Tue, 25 Nov 2025 18:54:43 +0100
Message-ID: <a4cc81b54db30a3606b700742e603a36453ab74a.1764091285.git.metze@samba.org>
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

These are copies of {SMBD,SMB_DIRECT}_CM_[RNR_]RETRY.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index a0076223daf9..eb9e498c2e2c 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -727,4 +727,13 @@ static inline size_t smbdirect_get_buf_page_count(const void *buf, size_t size)
 		(uintptr_t)buf / PAGE_SIZE;
 }
 
+/*
+ * Maximum number of retries on data transfer operations
+ */
+#define SMBDIRECT_RDMA_CM_RETRY 6
+/*
+ * No need to retry on Receiver Not Ready since SMB_DIRECT manages credits
+ */
+#define SMBDIRECT_RDMA_CM_RNR_RETRY 0
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__ */
-- 
2.43.0


