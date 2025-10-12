Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D19BD0A8B
	for <lists+samba-technical@lfdr.de>; Sun, 12 Oct 2025 21:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=2IY+UvlfeOluyTVIvEJK1FsjZyuU9vFWeuHWuf/B6Cc=; b=bDcJ3MQZIYaHXpZ3pavNwVdhgE
	OQ7a8mwdcXcrrN0hCQNTyApBCHYnC9EExViXTbYN2LK8wSeUIf5vPtMyWrY9IaBW7BXj9H1Y6OjX0
	c4Bypq6poqh/CIOLi+OlCfpz/lRhULKPh9HgMb3chYtDx2lO2TvsF50X6+D6Aepezdkxxelr5qJ1i
	zI6z2f2gF9WXmyP9SDxERQoUY1nzG2JJH1D30r+df2aozbxm7iUzu3gCOVE3927fCc2fNkpmM+kgH
	nBvUZLXGbxh8+gSATPGRLlxMtl1/JitNx6xeKHEoiqxWxXikX0qbXHECmrHFuahEMoUrodRF3CD3z
	3MBnNNPQ==;
Received: from ip6-localhost ([::1]:57850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v81T4-007cIs-36; Sun, 12 Oct 2025 19:10:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22504) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81Sz-007cIT-3T
 for samba-technical@lists.samba.org; Sun, 12 Oct 2025 19:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=2IY+UvlfeOluyTVIvEJK1FsjZyuU9vFWeuHWuf/B6Cc=; b=XPixa6zglg66FFktIg9JxmbX1E
 MC61PiciDOAUt0HFruY1usNl//M11flktCjAPswmJU+DsgNTu5AwWviAERVX/dLSk9doILn9gLn+p
 sL4h17yyS5YYqs14UB+F9PdPMwqptjpJRu6bS3SpLTXCSzyPAZxRkmnqu2Cx9j1NEYqrDEKozaNAI
 AF3mKita+OJhybNj0vw/tmbas8pT+IUCPvrvkm17o7J5LO2GDVAoGAbl70UxOXZXpdH3mk4EGs79C
 yUR7CGJxoY10ikUboIdO5oUdDvKziu/4XHb7DH1fM4D1a+EEf5gPSW4W/3Eq2q8e8Xg2Kaq41nG5V
 wDrZ+GtQ/v+hulvemm37RzSoTRA7mhvIlCDc0poZWMbQ9IitelFU3Gw/PWoNIzOagjR/24g/wKEeR
 75TdNn8kytQwxB+2XiZlh/uHFXxrylZ+wJxM8zsQehSy3Xk8ZVOdRVEvR2S6M2X5m9YNhMWlfoFGE
 b+6Wy8O/keDSowj7NJGWpfoZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v81Sy-008nzg-10; Sun, 12 Oct 2025 19:10:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 01/10] smb: smbdirect: introduce smbdirect_mr_io.{kref,
 mutex} and SMBDIRECT_MR_DISABLED
Date: Sun, 12 Oct 2025 21:10:21 +0200
Message-ID: <6e733a250194e07943238c8318880231e3803760.1760295528.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760295528.git.metze@samba.org>
References: <cover.1760295528.git.metze@samba.org>
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

This will be used in the next commits in order to improve the
client code.

A broken connection can just disable the smbdirect_mr_io while
keeping the memory arround for the caller.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index db22a1d0546b..361db7f9f623 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -437,13 +437,22 @@ enum smbdirect_mr_state {
 	SMBDIRECT_MR_READY,
 	SMBDIRECT_MR_REGISTERED,
 	SMBDIRECT_MR_INVALIDATED,
-	SMBDIRECT_MR_ERROR
+	SMBDIRECT_MR_ERROR,
+	SMBDIRECT_MR_DISABLED
 };
 
 struct smbdirect_mr_io {
 	struct smbdirect_socket *socket;
 	struct ib_cqe cqe;
 
+	/*
+	 * We can have up to two references:
+	 * 1. by the connection
+	 * 2. by the registration
+	 */
+	struct kref kref;
+	struct mutex mutex;
+
 	struct list_head list;
 
 	enum smbdirect_mr_state state;
-- 
2.43.0


