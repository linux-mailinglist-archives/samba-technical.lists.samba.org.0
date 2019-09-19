Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C36C5B7978
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 14:32:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xYHaguuqkZAjGKqBi/wff33jzCeg21O+5/4qDe2Bzsg=; b=Tke7fGaf6Une1q7ysiKtghgveX
	B5sG4EebuwhxYW4WM4DiJFa1Jzo3XpD8AOKKfw9cwLK2q5NhoXYA3MY6msd0HRenGu8m6R2WEDSLe
	fwNKv5JnbtyTGAxDvE6f4wBJBnmYfG6n/K01XsDHQ22TPsbCgSELhjiManUNuriNpakb+rzIvm2dU
	CGZWZgZbnLZbzymq0aDDDekopaSHE843iP27QmToAILR/fQJExIoBrB/ubiLTSXU1igccmX3kjyf+
	6G9ueNww3KlduPK4CjOMDvI8NCA0bnThHSnc54iIcyRRjLei0kqLBXCZ1TKjpskulVASf6p+yToNZ
	02Lv4XzA==;
Received: from localhost ([::1]:49856 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAvaj-006uBb-9T; Thu, 19 Sep 2019 12:31:21 +0000
Received: from mx.cjr.nz ([51.158.111.142]:45692) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAvae-006uBU-Ry
 for samba-technical@lists.samba.org; Thu, 19 Sep 2019 12:31:19 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id E62CF810D5;
 Thu, 19 Sep 2019 12:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1568895156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xYHaguuqkZAjGKqBi/wff33jzCeg21O+5/4qDe2Bzsg=;
 b=ILi49dpi9tB8Ua1osuj+YxzBeu2EP20naHgIK+Yo+YJeNzJ1zEQDB7q5Hof7a4vTKxPGuF
 GzZnfoESt4P99CMXOkhAZ1vokSwQFNQyEJgwycprJrLC/WsrWL+q3oTNCFDKSu14dQefmO
 6W0YYOw65P9QU7sp2urwYWEDwQC0OeuTXIHud3UFO5Bd2ZdwXLiDe0G+XbZPumLao7krCb
 oMErQ23dkjNu8Wi4oL2pBq3oPtiO1BhitHY4MSyv5fRtvsFaFYAGuUjf/ngs4QbVXlg+ox
 6aB3I+Nez6D/0/sJFq3TmsDC+Kh4cvKbYDcxLapJPjNGf/7xzyMl/nE79qry4A==
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] mount.cifs: Fix invalid free
Date: Thu, 19 Sep 2019 09:12:26 -0300
Message-Id: <20190919121226.8756-1-pc@cjr.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz;
 s=dkim; t=1568895156; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=xYHaguuqkZAjGKqBi/wff33jzCeg21O+5/4qDe2Bzsg=;
 b=rLB2+4mKS1HTM+j5bsgs2n+8w8NOpFxJY7FgUIgJdARelR94krlFuANYEkUMysAiuATZAU
 q38LpY93MKBFcHgQqXamBXT435fkSI81SnClUippQxp/sy0AZs31E5Uwc1/CJnsyTKOhLI
 +pj/8DG+iwbaqJn2DMig5jTuWyZYu0cAHMTU5zJlwDSkEX/CyWN+9qGy7OosUYzCmxc5By
 cXgBBZBskqaJ+DdEtL7P2YhvJrJPAwxPVI6EeYWh6dHxbqNVu9XFvACuSorFEUKrHSNXA6
 RB1/2NdDw3l77xVMeSJUgnP+EW8j7CmzJyblvsOfAKuVEisaED319eSN5zMm/g==
ARC-Seal: i=1; s=dkim; d=cjr.nz; t=1568895156; a=rsa-sha256; cv=none;
 b=ruYd0dg3VWEmHBPwv6x+9AyZBvURT23m8AOeKOsdXHRHbCyozqyLY2jOsmo0poVWKZGPZC
 Ft0lQXRJY0dDLzL3YEAzoSiNHC9UYICG0rhhHiZbECDVwt76ZgT7i6g7seeblGh2puvhSz
 RrQi86wpDueCBvMZK9dp6LcL82fe5lowKB9V8f3z+adcKiQwQRMY2VKsO2+9MH8jXVrGqK
 zpHTFYxCkH4tI3mFUZ1g2zggwWJLm9T80QfQ3BbVXKqcBbv0hvZAR9x43OpBV373YDBfQA
 kSHN2UxIAajtlCS49HsfLBIwupFXQPqtG2SzSAkxn/Do3CWUbB63zdKtX5zUGw==
ARC-Authentication-Results: i=1; mx.cjr.nz;
 auth=pass smtp.auth=pc smtp.mailfrom=pc@cjr.nz
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
From: "Paulo Alcantara \(SUSE\) via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>
Cc: "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

When attemping to chdir into non-existing directories, mount.cifs
crashes.

This patch fixes the following ASAN report:

$ ./mount.cifs //localhost/foo /mnt/invalid-dir -o ...
/mnt/bar -o username=foo,password=foo,vers=1.0
Couldn't chdir to /mnt/bar: No such file or directory
=================================================================
==11846==ERROR: AddressSanitizer: attempting free on address which was
not malloc()-ed: 0x7ffd86332e97 in thread T0
    #0 0x7f0860ca01e7 in
    __interceptor_free (/usr/lib64/libasan.so.5+0x10a1e7)
    #1 0x557edece9ccb in
    acquire_mountpoint (/home/paulo/src/cifs-utils/mount.cifs+0xeccb)
    #2 0x557edecea63d in
    main (/home/paulo/src/cifs-utils/mount.cifs+0xf63d)
    #3 0x7f08609f0bca in __libc_start_main (/lib64/libc.so.6+0x26bca)
    #4 0x557edece27d9 in
    _start (/home/paulo/src/cifs-utils/mount.cifs+0x77d9)

Address 0x7ffd86332e97 is located in stack of thread T0 at offset 8951
in frame
    #0 0x557edece9ce0 in
    main (/home/paulo/src/cifs-utils/mount.cifs+0xece0)

  This frame has 2 object(s):
    [48, 52) 'rc' (line 1959)
    [64, 72) 'mountpoint' (line 1955) <== Memory access at offset 8951
    overflows this variable
HINT: this may be a false positive if your program uses some custom
stack unwind mechanism, swapcontext or vfork
      (longjmp and C++ exceptions *are* supported)
SUMMARY: AddressSanitizer: bad-free (/usr/lib64/libasan.so.5+0x10a1e7)
in __interceptor_free
==11846==ABORTING

Fixes: bf7f48f4c7dc ("mount.cifs.c: fix memory leaks in main func")
Signed-off-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
---
 mount.cifs.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mount.cifs.c b/mount.cifs.c
index 7748d54aa814..0c38adcd99b1 100644
--- a/mount.cifs.c
+++ b/mount.cifs.c
@@ -1893,7 +1893,7 @@ acquire_mountpoint(char **mountpointp)
 	int rc, dacrc;
 	uid_t realuid, oldfsuid;
 	gid_t oldfsgid;
-	char *mountpoint;
+	char *mountpoint = NULL;
 
 	/*
 	 * Acquire the necessary privileges to chdir to the mountpoint. If
@@ -1942,9 +1942,9 @@ restore_privs:
 		gid_t __attribute__((unused)) gignore = setfsgid(oldfsgid);
 	}
 
-	if (rc) {
-		free(*mountpointp);
-	}
+	if (rc)
+		free(mountpoint);
+
 	return rc;
 }
 
-- 
2.23.0


