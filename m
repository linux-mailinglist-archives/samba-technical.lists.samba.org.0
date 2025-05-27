Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F29AC52CE
	for <lists+samba-technical@lfdr.de>; Tue, 27 May 2025 18:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=A0sz/wSnL8vgyujCYLdDA/1o5BvZVWKBoa64HwMHLU4=; b=qxVN0+htKRnsXiSLRnQpc8SrND
	yZ46/Kx7yEnN8MhEFFrGX9gvJJaxxXAxHcWiJIYlJyqiAimKTfyng3nivzBp3RdqH3I4w9P7d1tsh
	dOPnP4N1Xnd7oPPvpE6vOsb/S2AehVVEqwOZ+n0Htb2kDzbDgcM4k95O813JzgmmczNPezFY8OjG7
	dbqIzcqZULwiCrw2xK9m46GfAkpBWb0E7LBIHNsYUyQaCrfG5t78cS/dunl8aJ12Hkn5TbSZ61HQq
	0ZjmBxvoBmhp261xqcWHesEPITWsm6O3zaxc0zC88jrW4Z/vfs+wISPK+L+ME/kU1MNTDKsAAowP3
	gUOpj0mg==;
Received: from ip6-localhost ([::1]:39318 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uJwwa-004Hl0-8T; Tue, 27 May 2025 16:14:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39956) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJwwR-004HiR-7p
 for samba-technical@lists.samba.org; Tue, 27 May 2025 16:14:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=A0sz/wSnL8vgyujCYLdDA/1o5BvZVWKBoa64HwMHLU4=; b=dD5XvBUGM2WEJC/gRgFF6sN/n4
 S5+RjB6GQ8akFIAdCWUMR87ZXaIHGxO61GjYD7NL3eGRkLc0MXok++fnSRApHKhTKEVf+OguIr2ts
 OaPsDeNmApKN0rDpxipqYVG8OoLyRU9jiDFIaQzJEa4EC2dZ5TDrBbiLzLU1YPDx9Vze3/A9wy3wF
 uTBIKup/nJkmIW7GQ3GrhcFr1F7EOZvUv+r0prOhCvbM991aLbViRvSB/s+IEybIYT0Ol0vBKy/kH
 wTGH0rXg/QEJNJC/IcbkGdhlBzvsA4fn4UXzt7PnlY7Amh1LGnlF8TdLu+MpzmL58c4v5aUiogtxP
 5mEK0NEDlIU+sc0nWl9f+B2Oyq9mtjTOYwObUXKpp5+sulAqc3YOfxzZbFcLnfsEjrZ4zv9W09dtF
 9l2fLqKl9BvXWfAxnhGqtEcofvroetNIbjoxbvvmMSzV1FghCXGhH9GNMa1ATlsZPRm3au1fKkOGm
 DpPFbiP5J5vBpg4XI7932eqX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uJwwP-007Vm3-27; Tue, 27 May 2025 16:14:13 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH 3/5] smb: common: add smb_direct_buffer_descriptor_v1
Date: Tue, 27 May 2025 18:13:00 +0200
Message-Id: <fce4c4a11f8ed8f44637c1f0b1585bb2dad4c5f4.1748362221.git.metze@samba.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1748362221.git.metze@samba.org>
References: <cover.1748362221.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Will be used in client and server in the next commits.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smb_direct/smb_direct_pdu.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/smb/common/smb_direct/smb_direct_pdu.h b/fs/smb/common/smb_direct/smb_direct_pdu.h
index ab73cd8f807a..9a0b1762b828 100644
--- a/fs/smb/common/smb_direct/smb_direct_pdu.h
+++ b/fs/smb/common/smb_direct/smb_direct_pdu.h
@@ -48,4 +48,11 @@ struct smb_direct_data_transfer {
 	__u8 buffer[];
 } __packed;
 
+/* SMB DIRECT buffer descriptor V1 structure [MS-SMBD] 2.2.3.1 */
+struct smb_direct_buffer_descriptor_v1 {
+	__le64 offset;
+	__le32 token;
+	__le32 length;
+} __packed;
+
 #endif /* __FS_SMB_COMMON_SMB_DIRECT_SMB_DIRECT_PDU_H__ */
-- 
2.34.1


