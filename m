Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDB4B1B822
	for <lists+samba-technical@lfdr.de>; Tue,  5 Aug 2025 18:13:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=W7cgvWLjtj1b7cYPEx2c6e/4EocgzbRHcks6YDfjLWk=; b=xV0ZESaSi56ORB6H0NFwWOo/mH
	XwvrXE9WvYvBDQ1F8+Z0X9X3LeskOMOAbNmva4m+4bEeAQUbxBolzQ6igKhyA8pN0uwxyZAp6jYgq
	UwP+7LnPhQx4YP9R4Tj/UvOHBaLiWYIfBWA3MVeSHSXEt5/PCJYeNUn43QMa5m101faZR5WC7vaag
	WHiO3jwwwVqdSc6xildliPzCnLC+nIGLFPAccQmC+fI2QKk31Ff/UfZYBNCl+sLOvqWT76H+93CTN
	pgl2biMDbZm9KGQ/hiF5zoqhwFPromRLNTI3045DrENxCtMOlEz8uUdHsW1UMQrQT/t30PaGGsmgN
	523/8lkg==;
Received: from ip6-localhost ([::1]:22008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujKHi-00ENEO-2W; Tue, 05 Aug 2025 16:13:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36564) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKHQ-00ENAD-11
 for samba-technical@lists.samba.org; Tue, 05 Aug 2025 16:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=W7cgvWLjtj1b7cYPEx2c6e/4EocgzbRHcks6YDfjLWk=; b=2uUXnKKAgF+X06Z4GlpU0vW3JJ
 IIVvtkqNlTbBLqJMAV39tTb3GKNwp2Ci9rx/pQNYd6CUxIurx5dIfHm6QsC9e/phpP8TmK4+wxpZs
 P/NZrlQnlZwaX3lwSQ3aqbZdKWUffF70P5IXwXaddXtmsUBkqyrwVwCDaH3ZVLYZQ63D0nE7+WYoK
 dp+9+Or9fND/dmHGHFlIsYANXLQbfREH9rp6UcjlBfSc54hk5V9uu+fi2mxZSENCVGT4YHCH4zxsp
 VRwKtFH3bRvyd9EDRYgszO2eGmQC61aDFvbpdfvp2SL7b7+TrY1ETjGYT6KIcNCbwXWePCTd5WMQS
 AgtTdoj0aPlur4Oe00UGLdZ7InwpR0vOcefHtZonXhGrU9vvDS5jy0HTYKtFWjo+amb4LfkxLpY+5
 7IonRQugVyw4rd0uJ3zNWr0DrRJ2wmqBGaOuUaILhy24W8qWrVwgnhOeuLcUdoEEXqfUZzEhK97JG
 BXNd7c7bzDV7lDAUw4sIn3Dp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujKHM-0019h3-2f; Tue, 05 Aug 2025 16:12:44 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 06/17] smb: smbdirect: introduce
 smbdirect_socket.recv_io.free.{list, lock}
Date: Tue,  5 Aug 2025 18:11:34 +0200
Message-ID: <5bf7bdf82254d326e9b560365fced62eae7bbec7.1754409478.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754409478.git.metze@samba.org>
References: <cover.1754409478.git.metze@samba.org>
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

This will allow the list of free smbdirect_recv_io messages including
the spinlock to be in common between client and server in order
to split out common helper functions in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index a7ad31c471a7..21a58e6078cb 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -51,6 +51,15 @@ struct smbdirect_socket {
 			SMBDIRECT_EXPECT_NEGOTIATE_REP = 2,
 			SMBDIRECT_EXPECT_DATA_TRANSFER = 3,
 		} expected;
+
+		/*
+		 * The list of free smbdirect_recv_io
+		 * structures
+		 */
+		struct {
+			struct list_head list;
+			spinlock_t lock;
+		} free;
 	} recv_io;
 };
 
-- 
2.43.0


