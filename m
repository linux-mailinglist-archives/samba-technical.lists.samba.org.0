Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A515AB34C61
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZffG182R1r9Ny2Y/EqPIvW9iN+OdUAFdhj4/4je5/+E=; b=qVGtnMYbbOdn409pH3l8885qB5
	cxi4JZBz4pO1p16d483jQUpRpmUIrfO06TKc8SFbEVsMxQ5zUqCASn8IVlc+jxKGo/pTgRSawXgAd
	rI3lZyHIp8WbMJg74moHRJooh/LbDCmLywWLmVODrs6Sh2k87oZGhR2nnia2mw0z0fMXzXclMezrR
	SBlYf50OsN8vdaKRVPvFOnVucVslp8dWrw2KgB3ysW6Bo56ua9A5uyl6/LG9olfQRG3y08ubhAe/g
	gokhIbfeN8zMZ01g79mbJysK4ZQ9bwyg0p15AeTnwc6beimUiZjE6zyMgqXpCfFhHI6J4THp1++4J
	Py/Hv8PA==;
Received: from ip6-localhost ([::1]:43080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe3c-000M9T-K3; Mon, 25 Aug 2025 20:44:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64318) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2q-000Ltw-2L
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ZffG182R1r9Ny2Y/EqPIvW9iN+OdUAFdhj4/4je5/+E=; b=CMvuGSZvB1LQoG5w4pL434/Lct
 sncVZhvhJ+qCKoFySu5DmJpamojq5nt03z/UsUJzYsuOHyE17BOjSHPUC+o248/vwetDdF+F5c/KS
 2Y4jG0A63s2VGvdcUhAeHMRwP6savXzF9wLIZ5bH+pcJAr9elPSgh7J1wvL4bgXUBjJS78FVqc/4F
 23Rje6eIm7YAe4CI0qJzmDcAKKGpOsAKHMa2j44re4MbDNk6xAfXY8TLSLNtaArniamLvAIid5XBj
 fMLj2jll56P43fLfpFlKDtFaY1FfQVKsroDDoX8g0b0XQrGsdsQ+QQGOk1B6UsAgysMcr5pzFgg59
 YUG97dH2pNDhxfIe97g9BY9xSftpWEeN9pjpjUC11RVIsVPcFyYFXXKGCbcJHQjRcxlF411ydGQgn
 /7RdfQiVd9lnmhgymRu3CGY017MX9VBVKVkYUe5u4gV8y5yk6W0XWyUIh8qDAV4H9pcaA3kQlD/Zs
 2sXuVnkqeQbDzM3C9fVitJSs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2k-000jZg-2w; Mon, 25 Aug 2025 20:43:55 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 012/142] smb: smbdirect: introduce
 smbdirect_socket.rdma.legacy_iwarp
Date: Mon, 25 Aug 2025 22:39:33 +0200
Message-ID: <48bcd83eab19ef812d192cbc743657fc814612b7.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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

This will be used by client and server soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 09834e8db853..11f43a501c33 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -27,6 +27,10 @@ struct smbdirect_socket {
 	/* RDMA related */
 	struct {
 		struct rdma_cm_id *cm_id;
+		/*
+		 * This is for iWarp MPA v1
+		 */
+		bool legacy_iwarp;
 	} rdma;
 
 	/* IB verbs related */
-- 
2.43.0


