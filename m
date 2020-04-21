Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B941B1C5B
	for <lists+samba-technical@lfdr.de>; Tue, 21 Apr 2020 05:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=TiCiiufZTWAJ/cCwkULpqw4f8hT8qJr7SIhDxI9EeP0=; b=hmWJ3GMb24mMDGQPr9Hwzgux5F
	k2Cb7Mo2URm/hGDuojVozc4dSgzA+FBuGk20TV7RaBopR2UfqSZYgSGXOD7ccUy3AYzPA51Tm4DRx
	lMhGL9SziZtZ2Qo8CgxR4+ORqhv8mZhl0ozmfW00AKufg+ja6FsoQZ3ZJL8MAX826FELlP0qCnTb2
	cWRYyuE8wC9oHlh4ef4BPUJRpJk8pXKAKUCktDU2baGlBS3kBK2/OfSszewCNB+LhADLEF3aJQWrv
	ZOT8mX1vLUq2o9Ec1T08mlhowT21pVZ/er2y0HyiHovY2IMOffaTfIJjaJnDOMymKlBpSXjUk9Bnc
	SHZrRV7A==;
Received: from localhost ([::1]:57946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jQjA8-001Km3-Td; Tue, 21 Apr 2020 03:01:29 +0000
Received: from mx.cjr.nz ([51.158.111.142]:14902) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jQj9s-001KkP-Rd
 for samba-technical@lists.samba.org; Tue, 21 Apr 2020 03:01:18 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id EEB437FCFC;
 Tue, 21 Apr 2020 02:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1587437095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TiCiiufZTWAJ/cCwkULpqw4f8hT8qJr7SIhDxI9EeP0=;
 b=rreTdK+K5P4FgEy0ekkg1cq3lJHJrbzJiIiqnI7UnmHymsNabSRujnzuJxXWc+afAuWdFm
 7eGxcRf0FTy2CDtl9PMWqXqZ3VhQ98JSaIWE9uMLzKS97Q53QyPvrjyq6b6y54JcH02L53
 HaX5nIutGebCEe3BKucgtH6cde/vinOdvZPZodtHM3zPBmPXvUCmR3m/xwB5VnFFL9PDxv
 lV881m4OSOGR2yx61DzD5Exu7zLg353j306jcXCxFLJtxOlIIPa5Xz6/V8Cckg92T+dbt7
 vYJkgn3FaTempQNDlECbp3E3Dv55mYgdMov/sdSMGgA9xf7MglIn+Cr2nZswJw==
To: linux-cifs@vger.kernel.org, smfrench@gmail.com,
 samba-technical@lists.samba.org
Subject: [PATCH 1/3] cifs: do not share tcons with DFS
Date: Mon, 20 Apr 2020 23:44:22 -0300
Message-Id: <20200421024424.3112-1-pc@cjr.nz>
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@cjr.nz>
Cc: Paulo Alcantara <pc@cjr.nz>, Aurelien Aptel <aaptel@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This disables tcon re-use for DFS shares.

tcon->dfs_path stores the path that the tcon should connect to when
doing failing over.

If that tcon is used multiple times e.g. 2 mounts using it with
different prefixpath, each will need a different dfs_path but there is
only one tcon. The other solution would be to split the tcon in 2
tcons during failover but that is much harder.

Signed-off-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
Reviewed-by: Aurelien Aptel <aaptel@suse.com>
---
 fs/cifs/connect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index 95b3ab0ca8c0..ac6d286fe79f 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -3373,7 +3373,7 @@ cifs_find_tcon(struct cifs_ses *ses, struct smb_vol *volume_info)
 	spin_lock(&cifs_tcp_ses_lock);
 	list_for_each(tmp, &ses->tcon_list) {
 		tcon = list_entry(tmp, struct cifs_tcon, tcon_list);
-		if (!match_tcon(tcon, volume_info))
+		if (!match_tcon(tcon, volume_info) || tcon->dfs_path)
 			continue;
 		++tcon->tc_count;
 		spin_unlock(&cifs_tcp_ses_lock);
-- 
2.26.0


