Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF2A405F39
	for <lists+samba-technical@lfdr.de>; Fri, 10 Sep 2021 00:05:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=KYEQfeb7GpLEDCgtN3fdOhil68NMIoT4dUWx2CTUaOM=; b=URWwNbNqurzwXF9KfTm0pSghW/
	uTppnzl1oADwyJ97tD2UeyXqPoOYa7C8fioyNkJ4rTYT2TDp/POR4px6eYHCpVUZAOvfulxtJQMnL
	ovrDZKKrXyemMz0GrWrzDvdGcXb4jG+G30AcAO+ZpxBdGPopa96nzrv4Uk5uv2arE8uHiKaBCJL/z
	xhp5+HGiQq00NOANluDoshUQP41Oua4atV0D3OuLhEz3Qu0a0vVFXRYzZq7BeEqcZYQSLTHFXjJuh
	8bA3Zr1CaiWK2zGftc7CKtqa9Fc8vJIso7i7b00+PAYU+5l7+gLuTB4cBxqg2iS9zwXTzMWCfdKbD
	w2SfLxMQ==;
Received: from ip6-localhost ([::1]:56772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mOSA2-00EI5y-Hk; Thu, 09 Sep 2021 22:04:46 +0000
Received: from smtp-out2.suse.de ([195.135.220.29]:48494) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mOS9x-00EI5p-Am
 for samba-technical@lists.samba.org; Thu, 09 Sep 2021 22:04:43 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 013BE1FE36;
 Thu,  9 Sep 2021 21:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1631224015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KYEQfeb7GpLEDCgtN3fdOhil68NMIoT4dUWx2CTUaOM=;
 b=mwMdgObUrMFZuMH9wqCZ9lISzl9lK1Y0hbHv++uVjawAgYLlNI0XNt1Dz0h3ndDAeH0r3t
 tcEjX9lb3w2exIv3bRLS8QgPa/tyLSdwZRCgC55v77nVTktzU/9JMBEA4qkS9dUOBc+0Jj
 DNw7dfW383AesXmiJ7UjCiECRX+V9BI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1631224015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KYEQfeb7GpLEDCgtN3fdOhil68NMIoT4dUWx2CTUaOM=;
 b=4YH6kkMWx6y1VDuFj5jpY4ZACjleOt5hnhQ+r+csyCYbHdrqNQdFQF/xVswSadDeshciNc
 NcCbO0zK2vS8ldDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 87A9113CDF;
 Thu,  9 Sep 2021 21:46:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id csSOFM6AOmGAbwAAMHmgww
 (envelope-from <ematsumiya@suse.de>); Thu, 09 Sep 2021 21:46:54 +0000
To: linux-cifs@vger.kernel.org
Subject: [PATCH] cifs: properly invalidate cached root handle when closing it
Date: Thu,  9 Sep 2021 18:46:45 -0300
Message-Id: <20210909214646.8790-1-ematsumiya@suse.de>
X-Mailer: git-send-email 2.33.0
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
Cc: Enzo Matsumiya <ematsumiya@suse.de>, Steve French <sfrench@samba.org>,
 pc@cjr.nz, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cached root file was not being completely invalidated sometimes.

Reproducing:
- With a DFS share with 2 targets, one disabled and one enabled
- start some I/O on the mount
  # while true; do ls /mnt/dfs; done
- at the same time, disable the enabled target and enable the disabled
  one
- wait for DFS cache to expire
- on reconnect, the previous cached root handle should be invalid, but
  open_cached_dir_by_dentry() will still try to use it, but throws a
  use-after-free warning (kref_get())

Make smb2_close_cached_fid() invalidate all fields every time, but only
send an SMB2_close() when the entry is still valid.

Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
---
 fs/cifs/smb2ops.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 2dfd0d8297eb..1b9de38a136a 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -689,13 +689,19 @@ smb2_close_cached_fid(struct kref *ref)
 		cifs_dbg(FYI, "clear cached root file handle\n");
 		SMB2_close(0, cfid->tcon, cfid->fid->persistent_fid,
 			   cfid->fid->volatile_fid);
-		cfid->is_valid = false;
-		cfid->file_all_info_is_valid = false;
-		cfid->has_lease = false;
-		if (cfid->dentry) {
-			dput(cfid->dentry);
-			cfid->dentry = NULL;
-		}
+	}
+
+	/*
+	 * We only check validity above to send SMB2_close,
+	 * but we still need to invalidate these entries
+	 * when this function is called
+	 */
+	cfid->is_valid = false;
+	cfid->file_all_info_is_valid = false;
+	cfid->has_lease = false;
+	if (cfid->dentry) {
+		dput(cfid->dentry);
+		cfid->dentry = NULL;
 	}
 }
 
-- 
2.33.0


