Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C07DC867FE
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:11:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3rjPAjStoO1UpAydj9sXqgkjPdRrA1M364NWhOlYKRw=; b=ueCnq9VKmIuYyc6oKpXmOPaxok
	I/RCl5L4+QrZjtx/bKmsWod/YiBfsirIcWNPnbxr6RFYa3MMhi/1jt6PEDQcvCqdKyBLMvmymlKHQ
	wzBzMbVO1dAzGgW1Tdytm+TnOWu6YvZgkSqPlyNG2jaCx25Hzdv9SpDGtXeCHDsTeeeQzk6DJ9k0O
	S1LNmpHAfRH7VpGtto8fTzHOuQdHUpbihQkJiTBFPeSKw29bjS5JF/qHqfIMNmQgv/AxNWgPe9czd
	6HBfFTDCnHAr/rEjDTC3K3HQJzYV4xBCgLQbacGclrK44dvwQciDF91pQErIuy5ELW7cSei/I5F5F
	Hp2FAlwA==;
Received: from ip6-localhost ([::1]:23634 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxVb-00DB32-NH; Tue, 25 Nov 2025 18:11:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54924) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQH-00D9PV-To
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:05:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=3rjPAjStoO1UpAydj9sXqgkjPdRrA1M364NWhOlYKRw=; b=ZJXAWawNaIwH7ErTkwc3mEO3Jq
 919wsgIGHn/VwTKGIQi8gu4+ZaQFpLywSm/Rl/X1PbxAbd8G8B7OZ/mw4G1LlAWeElibJekVFciTh
 VD4KuGnwLxjc1Qct/nEXd5dEot3hxUgTeGkDIZ9gKSB7XshO/EihRjY1npm5Ff9f7uNxNx6AOgyFh
 hJfhNuTHpcbfu+jCsN5Yb4c77qElg57F2AklTeOBsdTrA7+ii33nzPUk5HDzDtexjoElKy+bZD4vC
 GovNWskiimAkbt0Str1CikPippd/2XUS4XxC+yTTTmfRQo91SbtAksoEsNWJri+HGqTjR9/9Q60DT
 wXdF7jZMym73FVmdl1bQ55Ch/EQkbDkO4vH7qaP96TDTPT+xNxd/M02v12sMHNDUjmTtbzd5uO+9k
 qfvpgjYNR5Zw3TqtTQK1AsC88lJcukQbVTQJ6N9qKSlQ+0wvF3Rx25iBzbk98x3LqitHwPgZ9edpM
 6oTH6HyW5MjtJLGJ2+D0iD4I;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxN9-00FdX4-09; Tue, 25 Nov 2025 18:02:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 057/145] smb: smbdirect: let smbdirect_internal.h define
 pr_fmt without SMBDIRECT_USE_INLINE_C_FILES
Date: Tue, 25 Nov 2025 18:55:03 +0100
Message-ID: <4cbebdbf147d38e1d6ada64aef2eea716abd03a0.1764091285.git.metze@samba.org>
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

When we move to smbdirect.ko we want log message prefixed with the
module name.

Note callers are still using smbdirect_socket_set_logging() in order
to redirect the per connection logging to their own log functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_internal.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_internal.h b/fs/smb/common/smbdirect/smbdirect_internal.h
index ead845948089..8ea10f8f8501 100644
--- a/fs/smb/common/smbdirect/smbdirect_internal.h
+++ b/fs/smb/common/smbdirect/smbdirect_internal.h
@@ -6,6 +6,10 @@
 #ifndef __FS_SMB_COMMON_SMBDIRECT_INTERNAL_H__
 #define __FS_SMB_COMMON_SMBDIRECT_INTERNAL_H__
 
+#ifndef SMBDIRECT_USE_INLINE_C_FILES
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+#endif /* ! SMBDIRECT_USE_INLINE_C_FILES */
+
 #include <linux/errname.h>
 #include "smbdirect.h"
 #include "smbdirect_pdu.h"
-- 
2.43.0


