Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C8859B1CB0D
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:37:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cHs80A+tD1eg48eVJnbXyaLlyjH7aumFBVukj9mBQo4=; b=siMqpMIjVVNM2+WduocZR2ElCD
	sO65iIA+tJWqR6YZm87B9xg94B3uBHEpQBNZEH3ydWfW1vYtUmW9Vk7sqd4H8jq56U+b7qqj/Ivwe
	0mR+/OK0jmfWPo2jTYnpbqcJF9Gf4PBhHwf1XzK8MgeaXljEn/d6QX4k2dUIDCC6R1S4QvOeMCn7k
	tEAKN+hBHKOdR4lwG3ogcYqdyRjdDhC2BX6TrC0/lT2U1bEJ5y9ZbVPqy01JVReYkuIDA8eUaV6cV
	YgbM0iZc6ZzFxw2ILiqsymZ5qSt2ZIV9KjN4Aji2qAqUX00CUcPohqoJnEosqf2mk6cweSCUU6RDr
	H0OECnVQ==;
Received: from ip6-localhost ([::1]:33992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji4v-00EReK-6t; Wed, 06 Aug 2025 17:37:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46182) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4E-00ERSQ-Qn
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=cHs80A+tD1eg48eVJnbXyaLlyjH7aumFBVukj9mBQo4=; b=tbSLI9wsngPBDWvi3rF723iltS
 K6XNhN3CYgNelS2yLnZ5oh1sSBOflsynOF6wjgov8JiWtwYGE/Ezs9ZQKDy24Wzd6LY63Smg3CntJ
 c+5TOgOpCv7Oz9EVM69b9nuwxf4mYWdXdXbGrXvGzATcXraw714lw5H7NOqfbtL4hK3krqJJXQ4sC
 Luo1sXvi660tGFXP8tP6HDfL6DUx49raS0oimYok2A5071YkZk3umzZfUzmDL2GRF6meKHS5zKLCb
 5tPE10x/uiWJEydjgldys1UpdYMqkxilN/AMUg6l/E6LqbPZ5qqolmJXEiIp4aKE4gtJgNepQ7Pwv
 VMvBqoG3CffaFTmYefEuxYXEUa0Tk/j6lqVS4iRngAFHYIm7VwT3G/L9Wrjd0RZhjq8k9aQPimHLj
 7W0WNeE8wVv0qvI6F0/f8+rWDvRb5Jjko5fQaUH6O3UE9N31nF5hBtQ+dTE1CEJGgo/mmsiWGwZk2
 fgz1vgT9Et1DxtvVa5zOF5Mv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji4B-001OXg-1R; Wed, 06 Aug 2025 17:36:43 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 04/18] smb: smbdirect: introduce struct smbdirect_send_io
Date: Wed,  6 Aug 2025 19:35:50 +0200
Message-ID: <935fd25b08f70fb63026fff444e14a5a415053d1.1754501401.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754501401.git.metze@samba.org>
References: <cover.1754501401.git.metze@samba.org>
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

This will be used in client and server soon
in order to replace smbd_request/smb_direct_sendmsg.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 7270fcee1048..4660c05c358f 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -89,6 +89,30 @@ struct smbdirect_socket {
 	} recv_io;
 };
 
+struct smbdirect_send_io {
+	struct smbdirect_socket *socket;
+	struct ib_cqe cqe;
+
+	/*
+	 * The SGE entries for this work request
+	 *
+	 * The first points to the packet header
+	 */
+#define SMBDIRECT_SEND_IO_MAX_SGE 6
+	size_t num_sge;
+	struct ib_sge sge[SMBDIRECT_SEND_IO_MAX_SGE];
+
+	/*
+	 * Link to the list of sibling smbdirect_send_io
+	 * messages.
+	 */
+	struct list_head sibling_list;
+	struct ib_send_wr wr;
+
+	/* SMBD packet header follows this structure */
+	u8 packet[];
+};
+
 struct smbdirect_recv_io {
 	struct smbdirect_socket *socket;
 	struct ib_cqe cqe;
-- 
2.43.0


