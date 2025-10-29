Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5674AC1AB14
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:30:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=n7oSuR4/Qsa3P52qQ0Ryhuz6phjJhE/hO9NAAagfr4Q=; b=sX8k4LvTl9ajo4vMq9ai6Wu8u9
	mtD3YlvREHFQfqZoI5JVCxX0iJYvpKVGMBGnlWZPE5qn25lcijhnKdNkP5uchxu6pDHoBRFNGaCT2
	pzUztxmztYsiDECvsM4wpr/51R8jJxHLr+FucYt5RLlJuuvFZw4lEAbRxCH54/xseL4BAJqF4Gyrq
	UxP0sGHt/a94eQic+N/IbJtjdAV9vBmNFN9C2sGtQhLPSEhrdfP1g7Uz3G60F+3ZG+/eNGlVqaSM4
	I+tvyKfr2sPvvobJc9cZ+bb6cK37PRNYljC2Zf1eI7KpbaAMSEJN367RHh7Gd2Qj6QS/7t2DqsUm1
	knR9mB/Q==;
Received: from ip6-localhost ([::1]:41418 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Fs-0097VN-IJ; Wed, 29 Oct 2025 13:30:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15820) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6B4-00961o-3e
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:25:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=n7oSuR4/Qsa3P52qQ0Ryhuz6phjJhE/hO9NAAagfr4Q=; b=vAkOY99otPX09PVSggM++NZCl1
 HmcAhKmP0c2ktuHo02Dqc1kYdF1IKkDMkwK/16eFwHSOLef4Yfr+WbM8WhsDhXMr1ANfL3IAqV+Rt
 EfqF3IEc2gfLsfmM5sDHWcOXHrjja0CEZRMAdkDucEwDtWZE3T7Pul7AHjzweP/U2qMBYjN/71pUO
 FLnP2tqEYWfZcQZPN2RRaFzOPxQ/LTLv5135aajUQsKaw+/ETQ4nqXBhIchISWucmZNxINC6qFSca
 n8Vsx5TLgBB2uxPJeMch7d8yuZHQH/67j4Vorq5eiBXQkNcDhtHYBX0bfFv4lWi8CsxJgCCpbRF77
 WDMDjpurjXRGMlNEJTDpKJsai1P/jGI5Je4RmZ4szbz/r1WKcTHiBcjrNLT/ncACKgqZu2FH3iyJi
 WrcJanLhdYeUS0vqsgs9r6+v5TWlP7E/yoLMvMBQwwIlT53tb1ebeUZ7fRJXUrQIQHmQF8rmhWoJ/
 mwXprZ/zpnand7xBQyJ1zV2n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Az-00BbdD-1B; Wed, 29 Oct 2025 13:25:21 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 029/127] smb: smbdirect: introduce
 smbdirect_get_buf_page_count()
Date: Wed, 29 Oct 2025 14:20:07 +0100
Message-ID: <4051ce8759eb0b014e0db5e3b409251bee87a895.1761742839.git.metze@samba.org>
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

This is a copy of get_buf_page_count() in the server
and will replace it soon.

The only difference is that we now use size_t instead
of int.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 5856ce287afa..983e08c8d2ee 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -640,4 +640,10 @@ struct smbdirect_rw_io {
 	struct scatterlist sg_list[];
 };
 
+static inline size_t smbdirect_get_buf_page_count(const void *buf, size_t size)
+{
+	return DIV_ROUND_UP((uintptr_t)buf + size, PAGE_SIZE) -
+		(uintptr_t)buf / PAGE_SIZE;
+}
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__ */
-- 
2.43.0


