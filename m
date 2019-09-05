Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A8EAABC1
	for <lists+samba-technical@lfdr.de>; Thu,  5 Sep 2019 21:08:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MQ7QSppux8Y1s8kfSsUNxZsA9QRimRonn/ZdxFo92cA=; b=VNOcRbS7WSHhNp4jkNer4RSygb
	jy2qzJfMAi8Pcbs+H3BjCYDDdjUWIhROD0eSIrnxh4XFXYS4OcW7vepfQfqth2SowqObpUqr3f380
	S9m8wAAfO7LYXHVicYYKvCuo+ZpEeeUVKmnE3xLt+Ti8YQNMToTfHne5hseZLnWymVNwdrS50z6Xw
	VQP9JF3PkVunpPomeknnXUx8EJlHun8BXXXN/sdFuxmwb3UkzFiJTTlcJ1Jv8jIRzgTaHzcdSfDOt
	Je7pLPl/FBBvRCqzeLxOiGJm4QN2mrkftubZU06A6qO94G3g/zHpTDwEI9Zz31ZFsiZR2/LJbx4hY
	64jNQIXA==;
Received: from localhost ([::1]:23962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i5x6n-003oI6-4L; Thu, 05 Sep 2019 19:07:53 +0000
Received: from mx.paulo.ac ([51.15.251.127]:33864) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i5x6i-003oHz-Tp
 for samba-technical@lists.samba.org; Thu, 05 Sep 2019 19:07:51 +0000
Received: from mx.paulo.ac (mx.paulo.ac [51.15.251.127])
 by mx.paulo.ac (Postfix) with ESMTPSA id 181CD81016;
 Thu,  5 Sep 2019 18:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paulo.ac; s=dkim;
 t=1567709383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MQ7QSppux8Y1s8kfSsUNxZsA9QRimRonn/ZdxFo92cA=;
 b=vccxvvoUDr8FPEYKNNYFwfUHq8ZkGCN0TRwgc+RhT8NM1FJTvLV28ujnehxmwys6UvFCdO
 4LpdsdmssykAiiMzfRe+OwhF8fDOuvZ+FOM+v+Oz1p6HS+SdqMhVjbUBg2c4fom9+HJLem
 68oltt90EeKJEeo9URxczTyE8T63hRlB4wFnr91NNosPtMEiNwMeRZx+Hs+4Vxe8qlW4kA
 2BFzXb7AfLQyjLN4IFJbVWiAG6SmFkDmvEuleGr3Y//G38MwBmT3dj09bM9BPae3o4cGE5
 mNOI+s94Ih9mZYiMmmAZP+JF4me+3lHSUAgO7QTuXwO2nGqEt+ITvkltZ2JKmg==
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 piastryyy@gmail.com
Subject: [PATCH] mount.cifs: Fix double-free issue when mounting with setuid
 root
Date: Thu,  5 Sep 2019 15:49:35 -0300
Message-Id: <20190905184935.30694-1-paulo@paulo.ac>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=paulo.ac;
 s=dkim; t=1567709383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=MQ7QSppux8Y1s8kfSsUNxZsA9QRimRonn/ZdxFo92cA=;
 b=euLPc8ag9RahIWeWYeelTfcGYoctWu35HllLNKX3oUyhez5RkslSZ97FmINOnR7oeS5ty6
 VUXFK0E8bL7ciLpdZPLer0fiFE17VByOc/2Uw9DdRjaKuWFUcOdgIJKW17WgQMnHBJJEPE
 MmRKNmwgf3PSLHRM7/aQsPRRiWsVYAlvgOT294umRWKXnTF+YOHDjjOzO1uMEwMESpAIQm
 QP+ShyqejFxC+RUdZ/ywo4mRH7LR0YX9Fd4v5O8XsSTfSxxmx4PhpYLQxZSP4M8m0Ub8oz
 Vm1GBikO4IJz4860ClhCX9acjzoL3iBBcy8vdz6A7YVvyYdzW3mfzD9MLeMKPA==
ARC-Seal: i=1; s=dkim; d=paulo.ac; t=1567709383; a=rsa-sha256; cv=none;
 b=wTxMtOpNbs7crE8yweiTee4D6xh1wC/dcI9RYhBRnon/BWdcjVFOdcUT0iavAx4bTIYNbX
 UKFh5UvRqVIfJAFfoXDEesmkjxxK1VmOejeCCI0lLp+xpKu5uV/VlQBou+kT6crJRl9h1y
 dGmd/nOGPLOdSvzhcIhR3fxE5mmMtnvgYywPLCL1RmEkxyJlNJsmdLo9vZStdylzF6GJQz
 8yaq3jo2uZYKpw6ZVmoROUPVZKVqJqJ1x3KTI/2kGG98HPch5oKgtC9Ur8NBJCB6Dvk1gL
 g1MvuthhxyuEejo1SumndR2JB05GhWyCodj9g5JpYbkISWgBZ5hSZUKPQpCWzQ==
ARC-Authentication-Results: i=1; mx.paulo.ac;
 auth=pass smtp.auth=paulo smtp.mailfrom=paulo@paulo.ac
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
Reply-To: "Paulo Alcantara \(SUSE\)" <paulo@paulo.ac>
Cc: "Paulo Alcantara \(SUSE\)" <paulo@paulo.ac>, aaptel@suse.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It can be easily reproduced with the following:

  # chmod +s `which mount.cifs`
  # echo "//localhost/share /mnt cifs \
    users,username=foo,password=XXXX" >> /etc/fstab
  # su - foo
  $ mount /mnt
  free(): double free detected in tcache 2
  Child process terminated abnormally.

The problem was that check_fstab() already freed orgoptions pointer
and then we freed it again in main() function.

Fixes: bf7f48f4c7dc ("mount.cifs.c: fix memory leaks in main func")
Signed-off-by: Paulo Alcantara (SUSE) <paulo@paulo.ac>
---
 mount.cifs.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/mount.cifs.c b/mount.cifs.c
index 7748d54aa814..2116fc803311 100644
--- a/mount.cifs.c
+++ b/mount.cifs.c
@@ -247,7 +247,6 @@ check_fstab(const char *progname, const char *mountpoint, const char *devname,
 	 * set of options. We don't want to trust what the user
 	 * gave us, so just take whatever is in /etc/fstab.
 	 */
-	free(*options);
 	*options = strdup(mnt->mnt_opts);
 	return 0;
 }
@@ -1762,6 +1761,7 @@ assemble_mountinfo(struct parsed_mount_info *parsed_info,
 		   const char *orig_dev, char *orgoptions)
 {
 	int rc;
+	char *newopts = NULL;
 
 	rc = drop_capabilities(0);
 	if (rc)
@@ -1773,10 +1773,11 @@ assemble_mountinfo(struct parsed_mount_info *parsed_info,
 
 	if (getuid()) {
 		rc = check_fstab(thisprogram, mountpoint, orig_dev,
-				 &orgoptions);
+				 &newopts);
 		if (rc)
 			goto assemble_exit;
 
+		orgoptions = newopts;
 		/* enable any default user mount flags */
 		parsed_info->flags |= CIFS_SETUID_FLAGS;
 	}
@@ -1880,6 +1881,7 @@ assemble_mountinfo(struct parsed_mount_info *parsed_info,
 	}
 
 assemble_exit:
+	free(newopts);
 	return rc;
 }
 
-- 
2.23.0


