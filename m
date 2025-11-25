Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53029C86573
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:57:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=iTyNId3h/Qps3V/EhOJfspZYMDnozKU0ouGiLtQMaJE=; b=OItTmwv7D0Y9ZtxiJtZutVfyXs
	uX0ljjhKBfg6ltn9VbyltzqdOquRVdWDj3uacjQqu+zRyaODzMXzfWlmahgMJq7MvgoSq+L7NTcvV
	acE+jn3uDrsHfyXJVKeq98FRKk1YqBn6CpeY2tn7TppW4FpTc8z/gj6tqDT5DhaLQT4H1o8YxK9R7
	4N+JAXYUQqxIYEf3d+48OSGuV+uCyPokoUjPk0tBGczPT/a7gfPqlNkGEOQuXD1xj3J5tVMsyia1o
	QGYFjzRFNdNS0Ry66KHmGvbEAzOE1iXzUCgUkYtjRs+CZBQaryfm8xN5N+F3mtjXXHbY6x9c6melh
	bsYlz6cg==;
Received: from ip6-localhost ([::1]:41584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxHX-00D6XZ-1C; Tue, 25 Nov 2025 17:56:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45826) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHT-00D6XJ-6g
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=iTyNId3h/Qps3V/EhOJfspZYMDnozKU0ouGiLtQMaJE=; b=sTmT3nObMV7JYBaoc2vKKv3R66
 8jci/EVGpNrkV+4TuNXwN5TdGF+ezxQNmQa7ya//7CcmFEDws0lCxwrAIZCmmvHpYd+xBqvTQfGnk
 OzXTNXJRY7UMkcKAeYQWUcguTODMSxqdHprrelkr+S37ZJ62ReR9y7yuTjLUFqhvvsIwfgw+tq2vO
 YQxrfva0eJk1+UHVNxZM3fHI0KcTSL5WGOKbiiENd9boh2vgYEq+CbBZpjXYGXKItnKFfgi8eKHSm
 pnzgMmdIn/FOsKd60f2yvXI1BB+uImjyHntI1Mlky7D6UVCQpNbKCrdgVruMoHha0Nv1MFCTB39Xz
 PZExjcyxVt2jdxxgSSiQBrM3NBwN19Nefv8eKhsjaSQfYjdeKXZxc8IMFlhwfTt694ybI1pEjNy29
 bdH/8A6LNmjN9xPy5Boml5WzGfWKOgR99NRLBZoqfaaK4WWWEqott0zuIngF5KsmOEfXF8MQCsI8R
 qX1atq+ek1NXMkS8IUkTp3eE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHS-00FcSo-1c; Tue, 25 Nov 2025 17:56:46 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 001/145] smb: smbdirect: let smbdirect.h include #include
 <linux/types.h>
Date: Tue, 25 Nov 2025 18:54:07 +0100
Message-ID: <20c22b16817340d00cd310e2e09e1d74ba0b488d.1764091285.git.metze@samba.org>
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

This will make it easier to use.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect.h b/fs/smb/common/smbdirect/smbdirect.h
index 05cc6a9d0ccd..821a34c4cc47 100644
--- a/fs/smb/common/smbdirect/smbdirect.h
+++ b/fs/smb/common/smbdirect/smbdirect.h
@@ -7,6 +7,8 @@
 #ifndef __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_H__
 #define __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_H__
 
+#include <linux/types.h>
+
 /* SMB-DIRECT buffer descriptor V1 structure [MS-SMBD] 2.2.3.1 */
 struct smbdirect_buffer_descriptor_v1 {
 	__le64 offset;
-- 
2.43.0


