Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BE0C86A81
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:34:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JtTUgN7Q/kmK9tFaXwPneT5S8M+2EvMdCdRr1+c7pAk=; b=LCUwpVI37aa1mFI7q9/MAM5iTW
	trpaIBVC2U026k/IoJ80ohkCJs0TRhPxTNy9RJwblxDwdozzRppVzhNJGQaTwEqMaPU1YZPsSu4cc
	1jFBOZOBJ5IJpx8Zn4eunf4GkmHR2dTGbO1a9rdq9tdpZYw4tKFmyM74L6VhYGAJI8GZwt6BUtxSv
	agl/+2x4mcFnkU8O3Yca4VlFKerAdwV2iMPRcaDhxR6UQ09qQFTTtBBJQImMTyBS+I127sN88Q/XI
	EdUY5zRye7SHEy/JKg9+LmAoqUmcc4QmzomVl0m0H5EsIgeXKUzycCvwd66dyCnNXogVmG/bjJOG6
	ExAQ/Whw==;
Received: from ip6-localhost ([::1]:42044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxsC-00DHA8-9A; Tue, 25 Nov 2025 18:34:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45280) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxqL-00DGfh-B1
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=JtTUgN7Q/kmK9tFaXwPneT5S8M+2EvMdCdRr1+c7pAk=; b=mpTXQI3T87FYKoScUu13apAvm7
 9jla66rm5lJ/gbblie7nSEc5TnLZfJIdupZMKU7E7DLeUhDmnFe6G77SHKIkrFuJG0EWjLuYaHnKU
 2/16yD4IMByjC/QyZ/DGR59/6QqWh1CgL7pkIE+FrQTMgtswBPz8lVUIBUFLAAOHsqPPmvCQv4bXc
 h2smogeOvHMJUSFPsXlzo5pHhYrw72HrSwCzWr84g3qO6p7E3bbAHyxzHZl5jBog5cB+SqokN4W+X
 pp7f2DJkligYAePj0K7J0Mcdgh30KUOqdu5O4Vn3z2Kg4oBOjVEn3JHLTfjga+PUw65TtDuTlya3H
 woetlmXl6xL8g5+EpJUXRVHUdGDU7zh5SdnVFNrXDhPWE8AuBLQXhDsudrhFMoky3rBLrVQzBB1/4
 mfxt+J888xq/McbvgWUBOADk8BY3YFY79eI9mKbIIAZZCjSm7mC/gz0zqHW9s+x6stV+jj92BwXbn
 HVth06JgDBXwyoWG8uPRe+al;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxnE-00Fg3T-2T; Tue, 25 Nov 2025 18:29:37 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 141/145] smb: smbdirect: introduce smbdirect_socket_bind()
Date: Tue, 25 Nov 2025 18:56:27 +0100
Message-ID: <55778c70f01ba954ea8e61c166101bdc55ad57f8.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will be used by the server in the next steps.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_public.h |  3 +++
 fs/smb/common/smbdirect/smbdirect_socket.c | 16 ++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_public.h b/fs/smb/common/smbdirect/smbdirect_public.h
index a5b15fce840c..7404f7e5bf52 100644
--- a/fs/smb/common/smbdirect/smbdirect_public.h
+++ b/fs/smb/common/smbdirect/smbdirect_public.h
@@ -85,6 +85,9 @@ bool smbdirect_connection_is_connected(struct smbdirect_socket *sc);
 __SMBDIRECT_PUBLIC__
 int smbdirect_connection_wait_for_connected(struct smbdirect_socket *sc);
 
+__SMBDIRECT_PUBLIC__
+int smbdirect_socket_bind(struct smbdirect_socket *sc, struct sockaddr *addr);
+
 __SMBDIRECT_PUBLIC__
 void smbdirect_socket_shutdown(struct smbdirect_socket *sc);
 
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index cb57ed994c6c..b04ee8f2bd2a 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -663,6 +663,22 @@ void smbdirect_socket_destroy_sync(struct smbdirect_socket *sc)
 		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
 }
 
+__SMBDIRECT_PUBLIC__
+int smbdirect_socket_bind(struct smbdirect_socket *sc, struct sockaddr *addr)
+{
+	int ret;
+
+	if (sc->status != SMBDIRECT_SOCKET_CREATED)
+		return -EINVAL;
+
+	ret = rdma_bind_addr(sc->rdma.cm_id, addr);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+__SMBDIRECT_EXPORT_SYMBOL__(smbdirect_socket_bind);
+
 __SMBDIRECT_PUBLIC__
 void smbdirect_socket_shutdown(struct smbdirect_socket *sc)
 {
-- 
2.43.0


