Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1B7C922DB
	for <lists+samba-technical@lfdr.de>; Fri, 28 Nov 2025 14:50:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=t1+PK9VnGZvCZHbEcDo4QTE4lHc3Q7EfeGH4nuGiFHM=; b=Uo8ak7TVTX3zMXfi8b8s2Ag20b
	jlDGcqV9/W7LV6V0IWbz/P8xfgSp0EqlL+j3Gb6s6qcm4IMlJy/OOgMlXLFSZY2u5krPQjSP4c1gY
	M3hTj5Kd22ihljJSrGdCKNaqV8Td8TJr5CLA4s2b7X8bBnyOvGRMbmsB9UfTwOjfb/k/W7ZlS3OvM
	yfbkTZSAnCf1G3muv9HE88MsaUU/vbBgwho4xgx3CYkPgrEbRYmmLLLnpbeoN+nxqQxEfa0YqBLFe
	AbBmqX2C4z3mvrLvPbqDSDMJ1APG+7IKcEwufynCUVeSU9t+pPXTzTJqzSzKDZhoXMEhn1WSkvD5t
	YvYzOBmw==;
Received: from ip6-localhost ([::1]:60098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vOyrL-00DWhb-Tc; Fri, 28 Nov 2025 13:50:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47164) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOyrG-00DWhR-Cf
 for samba-technical@lists.samba.org; Fri, 28 Nov 2025 13:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=t1+PK9VnGZvCZHbEcDo4QTE4lHc3Q7EfeGH4nuGiFHM=; b=eu3rOJnlUAsMpaNhTiaY/2mYU9
 2/1NLnQgzoXmBJo25nwcqnALd9M503ZJ3TAt6pScWj/iAg4yip6GoD/PWxSDUePXjSDdf/YfURZd6
 X9P/15H5HobwKftETuswM+JB+/g7yrhQZQpAb7rMjUIMgx41y6pHXPA5VMxhJjxX+290oA75h/1SH
 4wBD/mHtU3O3tTe2FvWD6Jxvc3gU6zWs8uCgw7+zfpzhJEK30vla9M2MOhdXKMqvXAHKaoXJIc/Vn
 gTew4EtFMcU7avnlO9E9W4UHIL7d6saSF7rf9BrD7YOphrcnPfI4vc8BpjT9RmKn/+BAz63RpUicE
 4Y6vNUg3BeeEP0XdJTltNswf3oLV/rzqD5gLs3EiKK2o4la46uiDCTViz/0PnTv5HP1+Bo3f9CNyr
 0RY2kHtmxyAIgA7Puw0/Ho2emyCPZjRZYu8ZEvZyLT2DRJfp5kGlJ7lrFAM/oeT+INnqk5DhiZNgN
 a5WA/CpBttyjN3kkHLeZP0LF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vOyrF-00G9HC-09; Fri, 28 Nov 2025 13:49:57 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] MAINTAINERS: change git.samba.org to https
Date: Fri, 28 Nov 2025 14:49:51 +0100
Message-ID: <20251128134951.2331836-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is the preferred way to access the server.

Cc: Steve French <smfrench@gmail.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 047d242faf68..d55c1c263e71 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6179,7 +6179,7 @@ L:	linux-cifs@vger.kernel.org
 L:	samba-technical@lists.samba.org (moderated for non-subscribers)
 S:	Supported
 W:	https://wiki.samba.org/index.php/LinuxCIFS
-T:	git git://git.samba.org/sfrench/cifs-2.6.git
+T:	git https://git.samba.org/sfrench/cifs-2.6.git
 F:	Documentation/admin-guide/cifs/
 F:	fs/smb/client/
 F:	fs/smb/common/
@@ -13611,7 +13611,7 @@ R:	Sergey Senozhatsky <senozhatsky@chromium.org>
 R:	Tom Talpey <tom@talpey.com>
 L:	linux-cifs@vger.kernel.org
 S:	Maintained
-T:	git git://git.samba.org/ksmbd.git
+T:	git https://git.samba.org/ksmbd.git
 F:	Documentation/filesystems/smb/ksmbd.rst
 F:	fs/smb/common/
 F:	fs/smb/server/
-- 
2.43.0


