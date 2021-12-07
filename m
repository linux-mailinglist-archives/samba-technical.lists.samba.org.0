Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633146BABD
	for <lists+samba-technical@lfdr.de>; Tue,  7 Dec 2021 13:11:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=t92Mo+JxZG/jlt/VfGUzsrJ7nO3Csh7wPw0sfmctulE=; b=pGN8EGBNexoAoru/yzYK3esUk2
	IjYxj8ou7jIxCfmNr9ukH9YsAQxn5fmJRpRFPnX2ogz08UeCKK6+66KuyzYFPzm6z1NtdkVNTIE0J
	lV2k5I1mT9Mu3ZpZu6eERS2EThm6PyTUasjjHehejxIUH306sSXN3tXMWIm1jAU1AARTbJNPaP+Q3
	nQIljkSwd9WYy6UzWboa1xvs5Cr2Srhp1lhbS9hc0uNvFKEqEXVhykXk1JQSERbJ8VS5/8H3WZeCh
	/J/PAv68jNZYfxfjtWyGFfbc8/ag46o5py71uoR20/yN7A4AUgMLbmwX2PeJOz66D8pgvuqR6v0e2
	LN+oLing==;
Received: from ip6-localhost ([::1]:61488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1muZIl-003p59-5l; Tue, 07 Dec 2021 12:10:31 +0000
Received: from smtp1.axis.com ([195.60.68.17]:26484) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1muZIZ-003p4z-HO
 for samba-technical@lists.samba.org; Tue, 07 Dec 2021 12:10:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1638879019;
 x=1670415019;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=t92Mo+JxZG/jlt/VfGUzsrJ7nO3Csh7wPw0sfmctulE=;
 b=C2FePCAKs6L5QXpYdZJU3IQABTak+rQgX15v5TTmyY7gkuwsVSnrNpiV
 8ETATc0vMjtfDeQag8jlsYDlFpnNFfte0uaZz4+gFtHacDPMlt8ulVywn
 4ObcTqjCQ8mvHk2C4h1mytt60o+a0CIogDb6+VyTGTReZH6Q1z/JkMHAg
 rFRc9vVpcomqXHYwVywQKi7IV588bkPKhCda1GyHdCv7TTYiYmw1FlF6z
 txy82dVrqMTmT3ARU50cAjVue80avPes3tdfui1CSDnrjb6crpHTatgHG
 elCZ4WptzWlc15PBL6zd7uAdWKnxfF8PTY9VbRjOlB0KNYEYMkIHMsM+E g==;
To: Steve French <sfrench@samba.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Hyunchul Lee
 <hyc.lee@gmail.com>
Subject: [PATCH] cifs: Fix crash on unload of cifs_arc4.ko
Date: Tue, 7 Dec 2021 12:54:19 +0100
Message-ID: <20211207115420.18713-1-vincent.whitchurch@axis.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
From: Vincent Whitchurch via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: linux-cifs@vger.kernel.org,
 Vincent Whitchurch <vincent.whitchurch@axis.com>,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, kernel@axis.com,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The exit function is wrongly placed in the __init section and this leads
to a crash when the module is unloaded.  Just remove both the init and
exit functions since this module does not need them.

Fixes: 71c02863246167b3d ("cifs: fork arc4 and create a separate module...")
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 fs/smbfs_common/cifs_arc4.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/fs/smbfs_common/cifs_arc4.c b/fs/smbfs_common/cifs_arc4.c
index 85ba15a60b13..043e4cb839fa 100644
--- a/fs/smbfs_common/cifs_arc4.c
+++ b/fs/smbfs_common/cifs_arc4.c
@@ -72,16 +72,3 @@ void cifs_arc4_crypt(struct arc4_ctx *ctx, u8 *out, const u8 *in, unsigned int l
 	ctx->y = y;
 }
 EXPORT_SYMBOL_GPL(cifs_arc4_crypt);
-
-static int __init
-init_smbfs_common(void)
-{
-	return 0;
-}
-static void __init
-exit_smbfs_common(void)
-{
-}
-
-module_init(init_smbfs_common)
-module_exit(exit_smbfs_common)
-- 
2.33.1


