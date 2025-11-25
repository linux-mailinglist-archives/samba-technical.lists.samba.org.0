Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F63CC866E5
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=8Z83ugxk7/w7Jyf289f1HPC96gEJXNLJ0SamXqFnBx0=; b=pzkLR02bn3Ba87n/o8ROQ/IlfH
	v1fCnGRpCa0WaBcKxu/AL3nrXsYrevTAVtF8NRLB+p5skQMgUBQWdkEXwBOeDthtyM7q01FiQ8L9Q
	DmzOMyb4f0Gfk7Hq6lco6QvsXk9/vKIImBV/TgN409D4d2pQHPgmBY67OdWZXOpI8rRmJNkrxdlgl
	cMErQdaTlzLoSu5nsHpIYRUehRbO/WBPK0jU8CbCmrzI4ZKwFCShw1x0ioTks4zgggGhSv3SIb0fD
	FXVGo+rLWHWW2ey5R084pqEpO9i9vdWbQF4yCcDLK8UXHIRtFRwvqRyCup7DzQUI5We31z8AZMNou
	LUvsxLZA==;
Received: from ip6-localhost ([::1]:21190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxQD-00D9LF-9C; Tue, 25 Nov 2025 18:05:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36366) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKw-00D7dr-V1
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:00:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=8Z83ugxk7/w7Jyf289f1HPC96gEJXNLJ0SamXqFnBx0=; b=FQRK04/q+iYFSbSCTb4IJELCmX
 GHPvLSGrigiF3o5aaXcm14VrmsLy/4WHEkQoQ2ZYUQl+PgTwguoflI6RZ4FGT4AzFg+hJdnXN4P95
 3NltXXNUOEZzm5dBWuvaf5lZn+HljW2HF3kVeNjymJ56lHgtV5yiBEkFHv3+IJjE/Ub8J+ycppdWL
 R8knfDtKTMjE9G4lZrJwPCvE+joGl3e1q6o2iz55eMoNIeVht5mNKFDIs8zU8bqLMo84TFa3zL9+W
 gubPsuCTWonLPyyfNp8U2jUyKsSlwhZVoKDhHL41idxxEkAFCqkx7hTxKfVjNuFtU9UvmDW8h65tG
 Rq7yq+CwHWnepLf7pUQZOU6+Hv1wTm+0tECQq/EHadFAaTRDPx3WYTkYRv6qtaDCrfp/GxSxh6OlI
 FW+4EdktJvpjYQb1xoIa1HuS65FswE0f7Du88DLki/IMCSgdpROMKcfx/folXSicORMCSTF9GAMqz
 9IQK+V0+uJl2oFRkUKv5i9Ut;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKq-00Fd36-2K; Tue, 25 Nov 2025 18:00:17 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 036/145] smb: smbdirect: define SMBDIRECT_MIN_{RECEIVE,
 FRAGMENTED}_SIZE
Date: Tue, 25 Nov 2025 18:54:42 +0100
Message-ID: <9f64e2053560db29c126f771c55dcebc0efcc330.1764091285.git.metze@samba.org>
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

These are specified in MS-SMBD...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_pdu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/smb/common/smbdirect/smbdirect_pdu.h
index ae9fdb05ce23..7693ba337873 100644
--- a/fs/smb/common/smbdirect/smbdirect_pdu.h
+++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
@@ -8,6 +8,10 @@
 
 #define SMBDIRECT_V1 0x0100
 
+/* SMBD minimum receive size and fragmented sized defined in [MS-SMBD] */
+#define SMBDIRECT_MIN_RECEIVE_SIZE		128
+#define SMBDIRECT_MIN_FRAGMENTED_SIZE		131072
+
 /* SMBD negotiation request packet [MS-SMBD] 2.2.1 */
 struct smbdirect_negotiate_req {
 	__le16 min_version;
-- 
2.43.0


