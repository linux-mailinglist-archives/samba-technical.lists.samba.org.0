Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFA0C86A57
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:33:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=qrL9upO6WvwxJBCTVkiReFOcALYutsNVTLN7azJA+F4=; b=fLGqdbJI2OEdT/Q6E20ZYT812X
	y+810HwX9j1KvGAUvpVc+9WH5PWg4RLMPDOsFQ2dG2n/9PaGlp2Bo1wC0WUEBZIN/C98fw3pDEksY
	LrVGntgcZzqSvpUy5L0O+6oT+Rpi7rBtk3nqrrXhwB4SZPkYF1oQtPxnLLPAcqIGMVc3ySO1mIq6e
	Cl2olJMU59v6MyEqRPzppbILFN5jw/xCwzOgBPJ3cy+5tye+oSNuSgtybICfx4+iBTgLDSCFpaYVN
	aI2mxPF6SHFilS3t02H0qGaq4OcAlE3u8t3mGHBseC/Cftuc98U7oyKOzAwRjjCwyhkFaz0XcOnfF
	bbHtnMMQ==;
Received: from ip6-localhost ([::1]:60318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxqm-00DGhm-5B; Tue, 25 Nov 2025 18:33:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45292) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxqL-00DGfj-Af
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:33:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=qrL9upO6WvwxJBCTVkiReFOcALYutsNVTLN7azJA+F4=; b=ByaKSsK3qXE253w2ynYWhDbhSD
 ys5rronvE7YrzXQBge/enPeAUVeBn8GBnt1B04JGvy+/1OyObWG5+CCeqq0EdCh7ZsaLMHU7j1xaS
 xjYkKj2WPaHu44vNnfL+Cp5h080ls+Qhqf428ORMonwAyfHL7Cx5mq4VlTcUtZPuIw6UGu2AwUusT
 kX5ijLHvG9asFbPCkRAJBa9VeWVnBXaRfuj0JqpZeAL05lyxsEBJXBjqYxuivlSkejJHGX6c/ZLtZ
 1rNVwbQbDnyz82/ipp9bmLwpnnZLvyohorBgf1hRhv1iVEYS9CF82/LUZg5gEkJa0D64lUwvkBo/V
 awwsLe2MDBwOSYXD+MZ3pJ4ri4hq7an8nfQFdY1BB7m38zvpDABX9KwektfTS8XAEu8/96iZ3BTYP
 6p7QAean7DXvu3wrpG4b8uVulWjEVluRsrXyK4WwpMHOivDute6PZv8DaG6QPv7ZzVui3c0ObGuoW
 WIZcnlTMnixI4D0BebozWgA3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxn7-00Fg0x-0x; Tue, 25 Nov 2025 18:29:30 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 140/145] smb: smbdirect: split out
 smbdirect_accept_negotiate_finish()
Date: Tue, 25 Nov 2025 18:56:26 +0100
Message-ID: <5115bf0558a79ae53e02d5a47988ae201e20c3e2.1764091285.git.metze@samba.org>
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

This will make it easier to support the listen/accept socket interfaces
in the next steps.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_accept.c   | 24 +++++++++++++++-----
 fs/smb/common/smbdirect/smbdirect_internal.h |  2 ++
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_accept.c b/fs/smb/common/smbdirect/smbdirect_accept.c
index 2ff61a4617be..d8818a0a8286 100644
--- a/fs/smb/common/smbdirect/smbdirect_accept.c
+++ b/fs/smb/common/smbdirect/smbdirect_accept.c
@@ -292,11 +292,7 @@ static void smbdirect_accept_negotiate_recv_work(struct work_struct *work)
 	u32 preferred_send_size;
 	u32 max_receive_size;
 	u32 max_fragmented_size;
-	struct smbdirect_send_io *send_io = NULL;
-	struct smbdirect_negotiate_resp *nrep;
 	u32 ntstatus;
-	int posted;
-	int ret;
 
 	/*
 	 * make sure we won't start again...
@@ -397,6 +393,24 @@ static void smbdirect_accept_negotiate_recv_work(struct work_struct *work)
 	 */
 	sp->max_fragmented_send_size = max_fragmented_size;
 
+	ntstatus = 0; /* NT_STATUS_OK */
+
+not_supported:
+	smbdirect_accept_negotiate_finish(sc, ntstatus);
+}
+
+void smbdirect_accept_negotiate_finish(struct smbdirect_socket *sc, u32 ntstatus)
+{
+	const struct smbdirect_socket_parameters *sp = &sc->parameters;
+	struct smbdirect_recv_io *recv_io;
+	struct smbdirect_send_io *send_io;
+	struct smbdirect_negotiate_resp *nrep;
+	int posted;
+	int ret;
+
+	if (ntstatus)
+		goto not_supported;
+
 	/*
 	 * Prepare for receiving data_transfer messages
 	 */
@@ -424,8 +438,6 @@ static void smbdirect_accept_negotiate_recv_work(struct work_struct *work)
 	 */
 	atomic_set(&sc->recv_io.credits.count, posted);
 
-	ntstatus = 0; /* NT_STATUS_OK */
-
 not_supported:
 	send_io = smbdirect_connection_alloc_send_io(sc);
 	if (IS_ERR(send_io)) {
diff --git a/fs/smb/common/smbdirect/smbdirect_internal.h b/fs/smb/common/smbdirect/smbdirect_internal.h
index 4cb5c8f07e8c..8a032078175c 100644
--- a/fs/smb/common/smbdirect/smbdirect_internal.h
+++ b/fs/smb/common/smbdirect/smbdirect_internal.h
@@ -139,4 +139,6 @@ int smbdirect_connection_create_mr_list(struct smbdirect_socket *sc);
 __SMBDIRECT_PRIVATE__
 void smbdirect_connection_destroy_mr_list(struct smbdirect_socket *sc);
 
+void smbdirect_accept_negotiate_finish(struct smbdirect_socket *sc, u32 ntstatus);
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_INTERNAL_H__ */
-- 
2.43.0


