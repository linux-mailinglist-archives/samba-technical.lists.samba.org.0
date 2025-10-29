Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D4CC1AC11
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:36:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bcjMY6JVxw9y7Peakh/tVneXy9Z+k1t808ke8YxKUoA=; b=pAYpgICdDQMgsowbsrZLrJP7mr
	1ZJoQ7xWh9XhNSDd4/ddfQEF3YQ1sObH8RLvqbSPhawopsKrAndYbuvtUMceWFMYIdIP+1JBrse/A
	xLIMk5bTLfTs6byv/QfCf69DEZOWzWBSNQ7ef2vBeKRs0/Ht/fiaHOvcXT7L2ZcyLkgqMf6XEWQNI
	Fwrd861d0/UHMisWCDu2F9Er6RNYEwqmTxGMEb6RwlXFW/Tbne+S2cxoGBn9G8CVJ+wDBD8jHdvPx
	664sjEhl24jArk7lZwUmGlmSeQNcaihMY2bZhtUW7a82KRYbSliwb2eTbCSak6qdW+2+DtL9fCfpA
	IJvDojPg==;
Received: from ip6-localhost ([::1]:64716 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Ll-0099Xh-Sf; Wed, 29 Oct 2025 13:36:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28342) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6DM-0096m0-8H
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=bcjMY6JVxw9y7Peakh/tVneXy9Z+k1t808ke8YxKUoA=; b=jtr2A0MZieKmzfUgNzaYw58COi
 e7tl1eXkbhaomF2F/xDCbldZNS7t+9oBjkkfyDD8hnshxdRRIf8k6dbKaxP60Ay4hXGTjhfiZ1irV
 CuyKZLsAL3GCAswDxcJjYXr98ljNsg55TRx9E7wAfcTTtwMhulRmKqwVPhrdmW3zYpsxhr2aZbqxk
 fNTfWSjja5pHbWaDc9kcGES7w0DOV9JF57EHNdXQou8YnkZC5gQMjV4TBN0sWPiSkpGRIPLd9npvG
 wvmRFuXktEWBS+j/2xbU6mhsDapgAnqFsRXFGkdGax8gG9uSiHABQ/E9wPbEzsFtCHY0FywXp1g4t
 hsN5K6eo4SMiMVWdPinLoBmfiEwkQ6UoykH/rttnkMP8UJULfvbDNhXCH1TeOYqSr8pQCxCWubaUn
 UJ2Yb3l2rhC2HwVkCO7B6E2nIkLaQUjEuN5ZnUjEsL0WNr2F4OldHVqrDD8qzrH8/uL8b39c4kh31
 PWTr3Zi3rBoVCXkZSMFSEnFS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6DH-00Bbzd-2d; Wed, 29 Oct 2025 13:27:43 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 053/127] smb: smbdirect: let smbdirect_internal.h define
 pr_fmt without SMBDIRECT_USE_INLINE_C_FILES
Date: Wed, 29 Oct 2025 14:20:31 +0100
Message-ID: <f33c899c974ea11d0e8c82d2059dc81284d9d937.1761742839.git.metze@samba.org>
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
---
 fs/smb/common/smbdirect/smbdirect_internal.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_internal.h b/fs/smb/common/smbdirect/smbdirect_internal.h
index 0727b9fee879..f8fabddc3808 100644
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


