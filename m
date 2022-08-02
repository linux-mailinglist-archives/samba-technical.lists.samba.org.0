Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE9A588237
	for <lists+samba-technical@lfdr.de>; Tue,  2 Aug 2022 21:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=x7CVA3ezN29fi8HTvDoRtpKit33X8WuLRCBguAgxowc=; b=F1MyY7U1e9gE31hl3VXQs1wc86
	J5V9xUA/MOddnHb8aP+SUgairYpza+fKxaynYvrEGDG0yhSSQi3FOINmCD16mqkn/favUHhY5jNyA
	Ym9LiWiZmtS2N9A7aGGkHSXJYfRT4diarQIabOeaFbnP3D95LEdKySjUCy1u7+u5Uzz5XXNzT/MUz
	oWqMaywdqTiR3qznkS5mj93R0R21GvaAi3AJFA8yE/DqoKi//oSkPqRWqIGe8Kn8Em3jUvrIWEd0x
	Wti2bhuO9aaFs4AFrJe7bKS1jq+Zy1GtbKQV7OJfBt0PmeVqNtucvsu8SsVVvnuNWYyxkzpXrL79n
	PtfNccTg==;
Received: from ip6-localhost ([::1]:44808 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIx8q-0050X4-Ri; Tue, 02 Aug 2022 19:01:22 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d]:44584) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIx8i-0050W3-P1
 for samba-technical@lists.samba.org; Tue, 02 Aug 2022 19:01:15 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A6D920B18;
 Tue,  2 Aug 2022 19:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659466867; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7CVA3ezN29fi8HTvDoRtpKit33X8WuLRCBguAgxowc=;
 b=uNhvWlezOigVUH1MN75hT1XM/sy7FezqNNsvOwODAg/Jp8ch3uaGh33HtxgrbLY64rtgcv
 13/cR0gWDC2mCdUB6HGs63mq6+a+f+SvrqRKBeTWeYSVpsx/vMHuTjNkcKY1GecMGPMgCN
 wbhZBJKMAK5o88I+npN5+kUqc8gRrwY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659466867;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7CVA3ezN29fi8HTvDoRtpKit33X8WuLRCBguAgxowc=;
 b=OjOIXdUlLIX5/l2psdLXRkQLocg3vBzpUqAf7h6/gd851BETIutU9TZyuNkY3lmxTNNtAe
 T6oAy2s75C3RERCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 01E6013A8E;
 Tue,  2 Aug 2022 19:01:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kpjtLHJ06WL8XwAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Tue, 02 Aug 2022 19:01:06 +0000
To: linux-cifs@vger.kernel.org
Subject: [RFC PATCH v2 4/5] smbfs: update module description
Date: Tue,  2 Aug 2022 16:00:47 -0300
Message-Id: <20220802190048.19881-5-ematsumiya@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220802190048.19881-1-ematsumiya@suse.de>
References: <20220802190048.19881-1-ematsumiya@suse.de>
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
From: Enzo Matsumiya via samba-technical <samba-technical@lists.samba.org>
Reply-To: Enzo Matsumiya <ematsumiya@suse.de>
Cc: nspmangalore@gmail.com, jlayton@kernel.org, pc@cjr.nz,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 pshilovsky@samba.org, tom@talpey.com, smfrench@gmail.com,
 linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

More concise and direct description fits a new module name.

Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
---
 fs/smb/core.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/smb/core.c b/fs/smb/core.c
index 8b135c1cd5ae..4bc019ef90e2 100644
--- a/fs/smb/core.c
+++ b/fs/smb/core.c
@@ -1791,9 +1791,7 @@ exit_cifs(void)
 
 MODULE_AUTHOR("Steve French");
 MODULE_LICENSE("GPL");	/* combination of LGPL + GPL source behaves as GPL */
-MODULE_DESCRIPTION
-	("VFS to access SMB3 servers e.g. Samba, Macs, Azure and Windows (and "
-	"also older servers complying with the SNIA CIFS Specification)");
+MODULE_DESCRIPTION ("SMB client filesystem (supports SMB1, SMB2, and SMB3)");
 MODULE_VERSION(CIFS_VERSION);
 MODULE_SOFTDEP("ecb");
 MODULE_SOFTDEP("hmac");
-- 
2.35.3


