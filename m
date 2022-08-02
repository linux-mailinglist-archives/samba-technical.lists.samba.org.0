Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B09B9588235
	for <lists+samba-technical@lfdr.de>; Tue,  2 Aug 2022 21:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vRtirq+uU7yY7pvbQcromr3NncF0jF3pOqCKRQG0aeU=; b=0PU4w6jCahieFRzyU2I4bMlQbe
	jUjmf5BrDPlV5Ik2ZHS3BDHYHOFfoSaLcPS6xfXmmVmU/7DAAb8CGVwjPEAS+8yMAT6yHxLzfZYXS
	6VvzBDbaKh/Fz6QDvHEz8iphew9R9iyGIMJxn8aXFfKhSPXzRq2zyQ45onjVwjH8MFvQwOwXgBbEm
	MI8rMYwwc2q+wUsJ6lqSzriBJetwnG3lDHiRNiZx/yh9vslkLxYLWiNterzRNs1GLgWJD99Hm5TFj
	XwV2KVVyEi7v+C447yvgNHTzd8k/Fn3GFmNMkL9/Wo+XLQTG8abRN4aFnrYOP/MFfI+b15xrcDx2j
	D3nK5ybQ==;
Received: from ip6-localhost ([::1]:44984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oIx95-0050aL-5u; Tue, 02 Aug 2022 19:01:35 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c]:33316) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oIx8m-0050W7-6L
 for samba-technical@lists.samba.org; Tue, 02 Aug 2022 19:01:18 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 01A2E3829C;
 Tue,  2 Aug 2022 19:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659466871; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRtirq+uU7yY7pvbQcromr3NncF0jF3pOqCKRQG0aeU=;
 b=IW9PJe7fSui1cLBUt8PTGeqq3ft2UYZorTP2qFIQTup9FRvfTXhu1yIMoI5bk/+o41cuF7
 svugMZgCgEQpK7qlLBO0JQtXk+wUuA8ezmOD6OCA+pbxcZicJC5l+jdxeqqTiCS2R2anaB
 gTyK50H5QqZ3nNdOplBuxWrs0gYRvNQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659466871;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRtirq+uU7yY7pvbQcromr3NncF0jF3pOqCKRQG0aeU=;
 b=o/Y27oxJNAaNJoTg23JJE5WYq0JQLTKWP1UwYw32O6fPkTy1/fD+PQ78+BaQhrAvjBYD23
 APOB6JW5cveyQvBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7276213A8E;
 Tue,  2 Aug 2022 19:01:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p9g1DXZ06WIEYAAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Tue, 02 Aug 2022 19:01:10 +0000
To: linux-cifs@vger.kernel.org
Subject: [RFC PATCH v2 5/5] smbfs: show a warning about new name
Date: Tue,  2 Aug 2022 16:00:48 -0300
Message-Id: <20220802190048.19881-6-ematsumiya@suse.de>
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

Also inform users about a possible removal of the existing aliases.

Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
---
 fs/smb/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/smb/core.c b/fs/smb/core.c
index 4bc019ef90e2..0d69e3f0eee9 100644
--- a/fs/smb/core.c
+++ b/fs/smb/core.c
@@ -1724,6 +1724,10 @@ init_cifs(void)
 		goto out_init_cifs_idmap;
 	}
 
+	pr_warn("This module has been renamed to \"smbfs.ko\" and its "
+		"current aliases (\"cifs\" and \"smb3\") might be removed "
+		"in a future kernel release.\n");
+
 	return 0;
 
 out_init_cifs_idmap:
-- 
2.35.3


