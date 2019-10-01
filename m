Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D1C3E3F
	for <lists+samba-technical@lfdr.de>; Tue,  1 Oct 2019 19:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/E1kv+CSDGSHgtqsXNqghoPKVQgLON8oFsLtSgzbgEM=; b=tTUBempXN0QNT4dYYAZWp/8Hws
	xpQiE631hqS325PgcHItdMIt6jBsmlAO8oSPPm3f/0buoIjcKW9Md9siF7Acj0S0ovwkiC++Ga9HT
	b2TddMBlhrHF4ny4p/c5kN4GtHibHoqWaEucNsvHd7/j8yK1fLL2/BLVcwDqLcuZJxDClRQmKJcOV
	OjW9pAlwDY8O5OZuwwN4rYLj0xwKBlifpiwCEmiGjZFbOAkOdskwIXdW2ed0+7WV24K8HOJAwlouH
	wYAtZVzWktQwvD4795tJUIYp/c5pM6knP7BRFyWJbhQPBEcfm3c4YaHu11HSH2yjgnzHGSjH3x+Kz
	P7mBBO+Q==;
Received: from localhost ([::1]:22398 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFLg6-0006Cw-6b; Tue, 01 Oct 2019 17:11:10 +0000
Received: from mx.cjr.nz ([51.158.111.142]:36246) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFLfz-0006BH-VX
 for samba-technical@lists.samba.org; Tue, 01 Oct 2019 17:11:07 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id 08B47810E9;
 Tue,  1 Oct 2019 17:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1569949861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/E1kv+CSDGSHgtqsXNqghoPKVQgLON8oFsLtSgzbgEM=;
 b=n6Qg5+S4BtSBwxV9l0b/neIa8JoeOIM1hbpt0V+4g48E6Mugfzn6ZK5nsBfgF9lencyYx9
 l0IMIpfUMHxiG5rjojPZBgO15Ofvqk8s1Hu+twI6VKtZIb8QTiuoW2fSDEJrCMb30y0qvv
 ihxreBbOptNDKu7le8ftwzRvR0ZTl4ma5cfAx4vRC2uvF7+LCPCUetUxTfNK10jcCXfkP6
 CAVk3jW0Nudtis2k9w+P3vPBVGTuWm4lh/19E2bvmxSVnchRsHsAoamYitGYi8QjsNlRZL
 Fcb+Pd2BsYfnY7HjI9iphuhrdnJClL1RIv0Yv6FBqp2FXQUV3snXGD1d93EUDg==
To: netdev@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, davem@davemloft.net, smfrench@gmail.com
Subject: [PATCH net-next 1/2] init: Support mounting root file systems over SMB
Date: Tue,  1 Oct 2019 14:10:27 -0300
Message-Id: <20191001171028.23356-2-pc@cjr.nz>
In-Reply-To: <20191001171028.23356-1-pc@cjr.nz>
References: <20191001171028.23356-1-pc@cjr.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz;
 s=dkim; t=1569949861; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/E1kv+CSDGSHgtqsXNqghoPKVQgLON8oFsLtSgzbgEM=;
 b=c047YpXPVLWSAfBR0YogCgh6HuzPuWnyTwtNuI/Vsbag8VNNeWQJmiL5s/RdZWzW3FxcWe
 OWM2L/KxkR6kptWuJh+Wnry24EbCUSBdf+eLMJ38sFe4dI0XjVlEQ3lqDXJEjC/+WklqtD
 sCQ1VX6JTA5bCkKSM2H7frwldFUWQAGckOqU+JRAQ9+XuW50SI2I1egMhmT8Lc6yD4Kz9y
 700SfK61I8ofl9CPr3RgvuMjMIHJT9XqOOSKJx7z8/s/TjZBc8xGu6BbiDmEobmupDPDhy
 E/QHc88O8KJAeY6sfzJY0t67AdXTh2fTh8f1722fDQ2Tt2hYhGLXE4RQJP53Pg==
ARC-Seal: i=1; s=dkim; d=cjr.nz; t=1569949861; a=rsa-sha256; cv=none;
 b=Xvs3n0QgJH3JyRKd3JzSYTCes6SLDyGm5s18L+mB3otPeorgkDcGwatsY+BRsesC//rXS6
 iDcSWcn99NKBnnIic0mBWXEJJoIKP6aq0gegaEesjcXHwoUe/T3wriqtCUI0bMBcIR6rlx
 5UForedS9ZCSKRR4uox/SlnIHMDek4UMUJtXYR57MBnvSxYUBPSwS3VKB1Ojb7WKeWstdN
 HGG+JPhVXAD5ow/O6UXa/vzBLVRAiaVcFi4DDyTz12oUK+jAiYEfho6E0pT+YM48r/AwqU
 KkUL32MKkS1VZ2HmxpRbj6yw+9vvAyrlpz+Ri/nyuMgjgADzcSw1nAIRr31DFg==
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

Add a new virtual device named /dev/cifs (0xfe) to tell the kernel to
mount the root file system over the network by using SMB protocol.

cifs_root_data() will be responsible to retrieve the parsed
information of the new command-line option (cifsroot=) and then call
do_mount_root() with the appropriate mount options for cifs.ko.

Signed-off-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
---
 init/do_mounts.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 9634ecf3743d..af9cda887a23 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -212,6 +212,7 @@ static int match_dev_by_label(struct device *dev, const void *data)
  *	   a colon.
  *	9) PARTLABEL=<name> with name being the GPT partition label.
  *	   MSDOS partitions do not support labels!
+ *	10) /dev/cifs represents Root_CIFS (0xfe)
  *
  *	If name doesn't have fall into the categories above, we return (0,0).
  *	block_class is used to check if something is a disk name. If the disk
@@ -268,6 +269,9 @@ dev_t name_to_dev_t(const char *name)
 	res = Root_NFS;
 	if (strcmp(name, "nfs") == 0)
 		goto done;
+	res = Root_CIFS;
+	if (strcmp(name, "cifs") == 0)
+		goto done;
 	res = Root_RAM0;
 	if (strcmp(name, "ram") == 0)
 		goto done;
@@ -501,6 +505,42 @@ static int __init mount_nfs_root(void)
 }
 #endif
 
+#ifdef CONFIG_CIFS_ROOT
+
+extern int cifs_root_data(char **dev, char **opts);
+
+#define CIFSROOT_TIMEOUT_MIN	5
+#define CIFSROOT_TIMEOUT_MAX	30
+#define CIFSROOT_RETRY_MAX	5
+
+static int __init mount_cifs_root(void)
+{
+	char *root_dev, *root_data;
+	unsigned int timeout;
+	int try, err;
+
+	err = cifs_root_data(&root_dev, &root_data);
+	if (err != 0)
+		return 0;
+
+	timeout = CIFSROOT_TIMEOUT_MIN;
+	for (try = 1; ; try++) {
+		err = do_mount_root(root_dev, "cifs", root_mountflags,
+				    root_data);
+		if (err == 0)
+			return 1;
+		if (try > CIFSROOT_RETRY_MAX)
+			break;
+
+		ssleep(timeout);
+		timeout <<= 1;
+		if (timeout > CIFSROOT_TIMEOUT_MAX)
+			timeout = CIFSROOT_TIMEOUT_MAX;
+	}
+	return 0;
+}
+#endif
+
 #if defined(CONFIG_BLK_DEV_RAM) || defined(CONFIG_BLK_DEV_FD)
 void __init change_floppy(char *fmt, ...)
 {
@@ -542,6 +582,15 @@ void __init mount_root(void)
 		ROOT_DEV = Root_FD0;
 	}
 #endif
+#ifdef CONFIG_CIFS_ROOT
+	if (ROOT_DEV == Root_CIFS) {
+		if (mount_cifs_root())
+			return;
+
+		printk(KERN_ERR "VFS: Unable to mount root fs via SMB, trying floppy.\n");
+		ROOT_DEV = Root_FD0;
+	}
+#endif
 #ifdef CONFIG_BLK_DEV_FD
 	if (MAJOR(ROOT_DEV) == FLOPPY_MAJOR) {
 		/* rd_doload is 2 for a dual initrd/ramload setup */
-- 
2.23.0


