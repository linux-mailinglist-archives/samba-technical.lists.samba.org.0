Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2519A195B1B
	for <lists+samba-technical@lfdr.de>; Fri, 27 Mar 2020 17:31:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zcyWhGkyoM7xi1g6fSOS8uUelZxM39Ohf3lbqEXYugc=; b=RUcwfY1ThVlshXEntW5V0tn1Kc
	4jwZMIkJySnlpfAhb8e91gY7+tyG4J6harB4AsRVqGVsQc5uEHSIo9jYupiHAN4fRAqt/Ra2ZZ6Tu
	+lNtC6Zg+xbP4IWXhPoJbXjVxnWaPGO5lDTUGe90lNDhrjjPdmCwVKChhKadxGVl8dmU/d0SWbaB2
	oyXr11jwgMFS/ZkCmmC0oaDvQib+pfGd/P6j+RuwMqgM84pAahhfL9ixL61CU7EGo3bM7AcuuHPQN
	k0oUY+lScXO0FEbTZYc7mDwk9kU/+rn80MNPAz2p/qxl7qVr5XTyyg6duAcKYMBOD6xFsLdBDxz/X
	Vl7yeVWA==;
Received: from localhost ([::1]:46470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jHrs0-000rMY-JN; Fri, 27 Mar 2020 16:30:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65152) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jHrrq-000rMQ-PL
 for samba-technical@lists.samba.org; Fri, 27 Mar 2020 16:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:Cc:To:From;
 bh=zcyWhGkyoM7xi1g6fSOS8uUelZxM39Ohf3lbqEXYugc=; b=RfvvtnpO4Z+fkJwC8Ei+68AnYJ
 rzY7zwedYBmmnZK+pMGzF3HMitcDn30kABrZooyE2WA+zwugtgC9CXnr99OwTU9aBp8nkWk+RTcev
 aXj/g33UzpOEyvORmNOOn0fyR260MNns6rJjocbzk7LJCtfLvB8j3qLIz93NNR6CpWBCM7SWSB3Ru
 mDLFdAgMnIyLk46C0rp6xq0a/nmNF92QhivlXnXc/4VE+Q/nlMG+x4JfPcBFcqRRMqk1m7sPfc1qR
 LchIXJANJUG6V41g6OIcnXupZwaEj6UgdYEZeZazkn+88giEVqVCRygDW1U/oCTWwuXPDdCCLg7wQ
 eKLz8M6h2yW798I5/253gOtGVOOI3o1a8oT6XvP/DpDGNCMP9tCMGo/hxK7iO6VVjwRqwrM9yham2
 d+NTgmkvJ1s3AGkBE+rNc1GTgdYsB7YxenS1etvOoCGYrhlWTA2prhpNEYNJcRxmpXfsxKbZeTjhg
 LQV2j8V753DV87gk+zvMMCr3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jHrrk-00078a-0s; Fri, 27 Mar 2020 16:29:52 +0000
To: samba-technical@lists.samba.org
Subject: [RFC PATCH RESEND] vfs_ceph: allow mounting a named filesystem
Date: Fri, 27 Mar 2020 12:29:50 -0400
Message-Id: <20200327162950.94545-1-jlayton@samba.org>
X-Mailer: git-send-email 2.25.1
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
From: Jeff Layton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeff Layton <jlayton@samba.org>
Cc: Marco Savoca <quaternionma@gmail.com>, ddiss@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Signed-off-by: Jeff Layton <jlayton@samba.org>
---
 docs-xml/manpages/vfs_ceph.8.xml | 16 ++++++++++++++++
 source3/modules/vfs_ceph.c       | 16 ++++++++++++++++
 source3/wscript                  |  6 ++++++
 3 files changed, 38 insertions(+)

I had a few spare cycles today and went ahead and plumbed in this
support since Marco had asked about it on the ceph-users list.

This builds but is otherwise untested. If it looks reasonable, I can
clean it up and test it out in the near future.

Thanks,
Jeff

diff --git a/docs-xml/manpages/vfs_ceph.8.xml b/docs-xml/manpages/vfs_ceph.8.xml
index 5b32122113a8..6f0001c8f52c 100644
--- a/docs-xml/manpages/vfs_ceph.8.xml
+++ b/docs-xml/manpages/vfs_ceph.8.xml
@@ -127,6 +127,22 @@
 		</listitem>
 		</varlistentry>
 
+		<varlistentry>
+		<term>ceph:fsname = name</term>
+		<listitem>
+		<para>
+			Allows one to explicitly set the filesystem name that
+			should be mounted for export via SMB. This is only
+			supported on Ceph v14 (Mimic) or later. Empty by default
+			which makes samba mount the "default" filesystem in the
+			cluster.
+		</para>
+		<para>
+			Example: ceph:fsname = home
+		</para>
+		</listitem>
+		</varlistentry>
+
 	</variablelist>
 
 </refsect1>
diff --git a/source3/modules/vfs_ceph.c b/source3/modules/vfs_ceph.c
index 7f4d65d48718..5c0a939390f6 100644
--- a/source3/modules/vfs_ceph.c
+++ b/source3/modules/vfs_ceph.c
@@ -90,6 +90,7 @@ static int cephwrap_connect(struct vfs_handle_struct *handle,  const char *servi
 	int snum = SNUM(handle->conn);
 	const char *conf_file;
 	const char *user_id;
+	const char *fsname;
 
 	if (cmount) {
 		handle->data = cmount; /* We have been here before */
@@ -100,6 +101,7 @@ static int cephwrap_connect(struct vfs_handle_struct *handle,  const char *servi
 	/* if config_file and/or user_id are NULL, ceph will use defaults */
 	conf_file = lp_parm_const_string(snum, "ceph", "config_file", NULL);
 	user_id = lp_parm_const_string(snum, "ceph", "user_id", NULL);
+	fsname = lp_parm_const_string(snum, "ceph", "fsname", NULL);
 
 	DBG_DEBUG("[CEPH] calling: ceph_create\n");
 	ret = ceph_create(&cmount, user_id);
@@ -131,6 +133,20 @@ static int cephwrap_connect(struct vfs_handle_struct *handle,  const char *servi
 		goto err_cm_release;
 	}
 
+#ifdef HAVE_CEPH_SELECT_FILESYSTEM
+	if (fsname) {
+		ret = ceph_select_filesystem(cmount, fsname);
+		if (ret < 0)
+			goto err_cm_release;
+	}
+#else /* HAVE_CEPH_SELECT_FILESYSTEM */
+	if (fsname) {
+		DBG_DEBUG("[CEPH] fsname setting only supported on Ceph Mimic and later\n");
+		ret = -EINVAL;
+		goto err_cm_release;
+	}
+#endif /* HAVE_CEPH_SELECT_FILESYSTEM */
+
 	DBG_DEBUG("[CEPH] calling: ceph_mount\n");
 	ret = ceph_mount(cmount, NULL);
 	if (ret < 0) {
diff --git a/source3/wscript b/source3/wscript
index 48194f261a48..608f4ef4b237 100644
--- a/source3/wscript
+++ b/source3/wscript
@@ -1724,6 +1724,12 @@ main() {
                       or lack of ceph_statx support''')
             conf.undefine('HAVE_CEPH')
 
+        if (conf.CHECK_FUNCS_IN('ceph_select_filesystem', 'cephfs',
+                                headers='cephfs/libcephfs.h')):
+            conf.DEFINE('HAVE_CEPH_SELECT_FILESYSTEM', '1')
+        else:
+            conf.undefine('HAVE_CEPH_SELECT_FILESYSTEM')
+
     if Options.options.with_glusterfs:
         conf.CHECK_CFG(package='glusterfs-api', args='"glusterfs-api >= 4" --cflags --libs',
                        msg='Checking for glusterfs-api >= 4', uselib_store="GFAPI")
-- 
2.25.1


