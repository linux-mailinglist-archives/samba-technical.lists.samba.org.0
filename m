Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8143F6B1C4
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jul 2019 00:21:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AxoUoTt5K7+zshg3ONTMvDYCVJu3NRBr7grwDyQnoTc=; b=Xm9kN0TvuZV49wpIXDHdEHQLEK
	Lttlkl5ibmZ4MdkVxmTRTuhzJwA8sVhAnmnU7EpyIs+anqg1FxL/nEc7GJS071OdXvlubTzMS5jqe
	l+XLZmCBy1KfNfdsKabSPBAR6v12n/w43Nfwoe6bduFgUKVToyJFVMwXYC/+bJlsIoMKR/Hpo5UAx
	friyu7paH4pUkHojCl1x8VkaHZq1++lFW5PPulZdRdXkHCm4JbwaZsc4lpYhU+SCwnsrl0iTmlQTA
	rWymNY9g3f0XHBOHzxddpZigohV427QBPIIfueTjYKervftqlbAvFMPYkGbYUwvUjJgIYnghwCORE
	YJUJqU1A==;
Received: from localhost ([::1]:55640 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hnVpF-000M4G-8H; Tue, 16 Jul 2019 22:21:33 +0000
Received: from mx.paulo.ac ([212.47.230.6]:60554) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hnVpB-000M44-0L
 for samba-technical@lists.samba.org; Tue, 16 Jul 2019 22:21:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=paulo.ac; s=dkim;
 t=1563314704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxoUoTt5K7+zshg3ONTMvDYCVJu3NRBr7grwDyQnoTc=;
 b=IbFR25wRGrznobFXuQRyNuGkbfD1SSMgJyQBGHLdcV7DFNF5yIoWL1NDgtzoLw6E6l+oOL
 bfNgsK2ZakP53Qava9xcuLnebTGs7Hregaw7SZOQdv8p061+dJ12I409HVXyBqHejRTlma
 XEDWJX17DDLEGPhtEnSYxHMhQuBol7k2VxdSWUJnLRPt1DNRFbaFm8K973WwXsCAjj8GME
 JTar2fNEYxj4KJHljBgOetQ8VlRmflaHcFA6c3uRMoAeJ0qgAM/lTGIFWkcZIdN5Xp9c5D
 vke9k9WK4kQE54Ok6LWURgo5AOhPhieauGkIn2KqkuGSAQp2ZYa92oNEebaNeQ==
To: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
Subject: [PATCH 2/3] init: Support mounting root file systems over SMB
Date: Tue, 16 Jul 2019 19:04:51 -0300
Message-Id: <20190716220452.3382-2-paulo@paulo.ac>
In-Reply-To: <20190716220452.3382-1-paulo@paulo.ac>
References: <20190716220452.3382-1-paulo@paulo.ac>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=paulo.ac;
 s=dkim; t=1563314704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AxoUoTt5K7+zshg3ONTMvDYCVJu3NRBr7grwDyQnoTc=;
 b=w+7xCJDpe4AgFrpz2GF8iDNQIVpnhqKze8fCYNaLpC922/MjT9G0/F/mgQC3KUBxUvArFj
 MCO8Oy4KyrZ7L7rM4Rt1nOXgzobruamWUQstEAMCcKtLSPP+3/go2rFY4x4+5g5WirHWoH
 axep00QztS+mRps3wFn+8o0qfve9koG4rpjWVPbWzbGjj3EFaa2KjWbRFziv5cbbZ1h0Ej
 iPPDUg0a3D3RjHMJs3Nwq3LfyNvZ6+5C4dSss7bVuPTdqAzeCqAp90KKViJZvAR7lcRBdT
 9hp+HGnoA/SdFu49aN8myNRUV0ALleULu4rTbOGeNHCWsEwic1gAnvlcvujAIA==
ARC-Seal: i=1; s=dkim; d=paulo.ac; t=1563314704; a=rsa-sha256; cv=none;
 b=iZBo+Sd9BKD4J34jCDL3cwkYlv0+tycyfc8mJJfeXJ2yjTOmK8P078s6dugcUHB6UB1dsv
 qGc0MFYPGVD7UNrGqr2ujEp6PbaZdbE0Ig+hFHxNoh37KBox5nbEjNKNUW0QV+7ThDtooB
 0aAELTRLtW0vqbRGuwfDzp8Jxpd/DYyfME30MV+T+UAaUjtksWjP7SGF7IT1I8x7sMaLf5
 /BAodz5QkiN/KaiDSZoD0sOBKutfYHH8YNQ266GakinK7sUVGc/ytZiJuF1RGDYMEr6ws1
 5DAuCnaoLKhKW67Fiv3qH6d22AV9Hxoqq186/UOkC/dMjpChuU55gGWXfjdB7g==
ARC-Authentication-Results: i=1; mx.paulo.ac;
 auth=pass smtp.auth=paulo smtp.mailfrom=paulo@paulo.ac
Authentication-Results: mx.paulo.ac;
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
Cc: "Paulo Alcantara \(SUSE\)" <paulo@paulo.ac>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Add a new virtual device named /dev/cifs (0xfe) to tell the kernel to
mount the root file system over the network by using SMB protocol.

cifs_root_data() will be responsible to retrieve the parsed
information of the new command-line option (cifsroot=) and then call
do_mount_root() with the appropriate mount options for cifs.ko.

Cc: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Paulo Alcantara (SUSE) <paulo@paulo.ac>
---
 init/do_mounts.c | 49 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index 2d1ea3028454..28c5b583afef 100644
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
2.22.0


