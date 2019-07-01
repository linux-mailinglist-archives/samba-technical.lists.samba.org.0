Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 541DB5B65D
	for <lists+samba-technical@lfdr.de>; Mon,  1 Jul 2019 10:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Tb1sOu3WkiWnllLnLI/6uIAETe6ma1bQrYQTWhODUU4=; b=kw9wRWMAoeoagCfZgWmSTKAsig
	2qK/M7iqcOahlSi9VktPVjFCl0ULoTkarWJ2OgqyxJ9B8flGcE0DW1w/Q+IsJszEF3xPX5Z/Zh0fn
	nhuc8zVTC8OEYh3Ghj/Kwsu0ydRAhVtpdpMHZBuzjLQQMJXjdQluNKrZ/nXSPdE2BLPCbxuuwXypc
	pF682ZxJCnhK+z+1at1Qp7kydU+MkwWumkK/XsdNwA/2WPZiyUI1KnZ3MSMegROT9g/N3OhYwWHhg
	kq55kAdw1/Qx23U+5lNzw3moCfLt6XRT33/s5P/iM3pfJ0XMIWRb4jZo57QoZUHobhmFNJIdO2ltc
	oyMj27ZA==;
Received: from localhost ([::1]:18402 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hhrMU-004HrN-5z; Mon, 01 Jul 2019 08:08:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10176) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hhrMO-004HrG-NI
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 08:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=Tb1sOu3WkiWnllLnLI/6uIAETe6ma1bQrYQTWhODUU4=; b=UVxGuP/2yTFEqtSCfWvdFW5g/l
 r1EJUUGKJIvHilsW+2rngcob2Kj5cS46X2HdJ7Hul1OU4Xt3zShBFTbAdj3RcpexR9p3xSx50RPBn
 oLO3QeLfBCp9b80R5Vx+H/u4P0o1NuBPz6c7Sasp+V+ORHPSA4kb42YSkwxh6BH5ypbw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hhrML-0005bK-1w
 for samba-technical@lists.samba.org; Mon, 01 Jul 2019 08:08:21 +0000
Subject: Re: [HEADS-UP] Using stored immutable file birth time for SMB File-ID
To: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
References: <20190626135745.lk7757wmy26pgy26@inti>
 <20190627162137.1077fdc4@samba.org>
 <28fe2464-3992-84eb-fe14-cc16b41b665b@samba.org>
Message-ID: <5ed36eb9-2fc8-9573-4a11-002bf78a37cf@samba.org>
Date: Mon, 1 Jul 2019 10:08:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <28fe2464-3992-84eb-fe14-cc16b41b665b@samba.org>
Content-Type: multipart/mixed; boundary="------------02D36DE835737C4CAC771312"
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------02D36DE835737C4CAC771312
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 6/27/19 4:38 PM, Ralph Boehme via samba-technical wrote:
> Hi David,
> 
> On 6/27/19 4:21 PM, David Disseldorp wrote:
>> Hi Ralph,
>>
>> Another follow-up here, after looking at your patchset...
>>
>> On Wed, 26 Jun 2019 15:57:46 +0200, Ralph Boehme via samba-technical wrote:
>>
>>> As a file's creation time (or btime for birth-time) may be set by clients, this 
>>> would result in changed File-IDs every time a client sets the btime. So we need 
>>> to store an additional copy of a file's original btime. We store the btime as 
>>> part of the DOS attributes xattr, we need an additional field in there, making 
>>> for a new level 4 of the xattr info struct.
>>
>> IIUC, Btrfs, XFS, ext4 and f2fs already expose an *immutable* btime via
>> statx. See the discussion in https://patchwork.kernel.org/cover/10812257
> 
> thanks for bringing this up. These are interesting times... in the end
> the kernel may pick up our user.DOSATTRIB... :)
> 
>> I'd also imagine that there are FSes out there that can offer their own
>> immutable never-recycled File-ID.
> 
> Yes, HFS+, APFS, NTFS. :) Others?
> 
>> Ideally your patchset could cater to both cases by allowing for
>> make_file_index_from_btime() / update_stat_ex_file_index() calls in the
>> VFS stat handler
> 
> yes, that will work.
> 
>> and avoiding the extra dosmode games if the
>> st_ex_file_index is already set.
> 
> oh, good point, I have to fix that. :)
> 
>> As a minor nit, I think it'd make sense to combine the new stat_ex bools
>> into a single flags entry which includes calculated[_original]_birthtime
>> etc.
> 
> Yeah, maybe, I'll take a look.

proposed patchset for merge available via gitlab CI at

<https://gitlab.com/samba-team/samba/merge_requests/589>

...and as attachment.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

--------------02D36DE835737C4CAC771312
Content-Type: text/x-patch;
 name="master-fileid.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="master-fileid.patch"

From 24a41cac15cb81d91b1e51b060789eb6052a8c27 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Thu, 27 Jun 2019 12:50:37 +0200
Subject: [PATCH 01/22] vfs_catia: pass stat info to synthetic_smb_fname()

This doesn't cause visible damage in vanilla Samba, but would affect downstream
consumers that add additional fields to struct smb_filename.

For the same reason there's no test.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14015
RN: Ensure vfs_catia passes stat info to stacked VFS modules

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/modules/vfs_catia.c | 42 ++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/source3/modules/vfs_catia.c b/source3/modules/vfs_catia.c
index 5915e40ff28..762491ede31 100644
--- a/source3/modules/vfs_catia.c
+++ b/source3/modules/vfs_catia.c
@@ -193,7 +193,7 @@ static DIR *catia_opendir(vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 				name_mapped,
 				NULL,
-				NULL,
+				&smb_fname->st,
 				smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_smb_fname);
@@ -722,7 +722,7 @@ static int catia_chown(vfs_handle_struct *handle,
 	catia_smb_fname = synthetic_smb_fname(talloc_tos(),
 					name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (catia_smb_fname == NULL) {
 		TALLOC_FREE(name);
@@ -760,7 +760,7 @@ static int catia_lchown(vfs_handle_struct *handle,
 	catia_smb_fname = synthetic_smb_fname(talloc_tos(),
 					name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (catia_smb_fname == NULL) {
 		TALLOC_FREE(name);
@@ -797,7 +797,7 @@ static int catia_chmod(vfs_handle_struct *handle,
 	catia_smb_fname = synthetic_smb_fname(talloc_tos(),
 					name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (catia_smb_fname == NULL) {
 		TALLOC_FREE(name);
@@ -832,7 +832,7 @@ static int catia_rmdir(vfs_handle_struct *handle,
 	catia_smb_fname = synthetic_smb_fname(talloc_tos(),
 					name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (catia_smb_fname == NULL) {
 		TALLOC_FREE(name);
@@ -867,7 +867,7 @@ static int catia_mkdir(vfs_handle_struct *handle,
 	catia_smb_fname = synthetic_smb_fname(talloc_tos(),
 					name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (catia_smb_fname == NULL) {
 		TALLOC_FREE(name);
@@ -902,7 +902,7 @@ static int catia_chdir(vfs_handle_struct *handle,
 	catia_smb_fname = synthetic_smb_fname(talloc_tos(),
 					name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (catia_smb_fname == NULL) {
 		TALLOC_FREE(name);
@@ -968,7 +968,7 @@ catia_realpath(vfs_handle_struct *handle,
 	catia_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (catia_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -1001,7 +1001,7 @@ static int catia_chflags(struct vfs_handle_struct *handle,
 	catia_smb_fname = synthetic_smb_fname(talloc_tos(),
 					name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (catia_smb_fname == NULL) {
 		TALLOC_FREE(name);
@@ -1046,7 +1046,7 @@ catia_streaminfo(struct vfs_handle_struct *handle,
 	catia_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (catia_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -1126,7 +1126,7 @@ catia_get_nt_acl(struct vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -1165,7 +1165,7 @@ catia_sys_acl_get_file(vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -1210,7 +1210,7 @@ catia_sys_acl_set_file(vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -1253,7 +1253,7 @@ catia_sys_acl_delete_def_file(vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -1306,7 +1306,7 @@ catia_getxattr(vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -1353,7 +1353,7 @@ catia_listxattr(vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -1406,7 +1406,7 @@ catia_removexattr(vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -1465,7 +1465,7 @@ catia_setxattr(vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -2274,7 +2274,7 @@ static NTSTATUS catia_get_compression(vfs_handle_struct *handle,
 		mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 						mapped_name,
 						NULL,
-						NULL,
+						&smb_fname->st,
 						smb_fname->flags);
 		if (mapped_smb_fname == NULL) {
 			TALLOC_FREE(mapped_name);
@@ -2367,7 +2367,7 @@ static NTSTATUS catia_get_dos_attributes(struct vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
@@ -2401,7 +2401,7 @@ static NTSTATUS catia_set_dos_attributes(struct vfs_handle_struct *handle,
 	mapped_smb_fname = synthetic_smb_fname(talloc_tos(),
 					mapped_name,
 					NULL,
-					NULL,
+					&smb_fname->st,
 					smb_fname->flags);
 	if (mapped_smb_fname == NULL) {
 		TALLOC_FREE(mapped_name);
-- 
2.21.0


From f508906484a58fd842cc13f4ba89cd6213bac797 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Sun, 30 Jun 2019 14:43:28 +0200
Subject: [PATCH 02/22] idl: add xattr_DosInfo4 to xattr_DosInfo in xattr.idl

Adding itime, removing unused ea_size, size, alloc_size and change_time.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 librpc/idl/xattr.idl | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/librpc/idl/xattr.idl b/librpc/idl/xattr.idl
index 38d32fd85b1..a2c4f25d0fd 100644
--- a/librpc/idl/xattr.idl
+++ b/librpc/idl/xattr.idl
@@ -73,7 +73,8 @@ interface xattr
 		XATTR_DOSINFO_SIZE              = 0x00000004,
 		XATTR_DOSINFO_ALLOC_SIZE        = 0x00000008,
 		XATTR_DOSINFO_CREATE_TIME       = 0x00000010,
-		XATTR_DOSINFO_CHANGE_TIME       = 0x00000020
+		XATTR_DOSINFO_CHANGE_TIME       = 0x00000020,
+		XATTR_DOSINFO_ITIME             = 0x00000040
 	} xattr_DosInfoValidFlags;
 
 	typedef struct {
@@ -86,11 +87,19 @@ interface xattr
 		NTTIME change_time;
 	} xattr_DosInfo3;
 
+	typedef struct {
+		xattr_DosInfoValidFlags valid_flags;
+		uint32 attrib;
+		NTTIME itime;
+		NTTIME create_time;
+	} xattr_DosInfo4;
+
 	typedef [public,switch_type(uint16)] union {
 		[case(0xFFFF)] xattr_DosInfoFFFFCompat compatinfoFFFF;
                 [case(1)] xattr_DosInfo1 info1;
                 [case(2)] xattr_DosInfo2Old oldinfo2;
 		[case(3)] xattr_DosInfo3 info3;
+		[case(4)] xattr_DosInfo4 info4;
         } xattr_DosInfo;
 
 	typedef [public] struct {
-- 
2.21.0


From 252fbb8ec10103e5befd3658c5bc57911cd309a9 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Thu, 27 Jun 2019 16:52:25 +0200
Subject: [PATCH 03/22] s3: remove unused st_ex_mask from struct stat_ex

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/include/includes.h        |  1 -
 source3/include/vfs.h             |  1 +
 source3/librpc/idl/open_files.idl |  1 -
 source3/smbd/durable.c            | 14 --------------
 4 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/source3/include/includes.h b/source3/include/includes.h
index c26b75f5791..8f398d0d24b 100644
--- a/source3/include/includes.h
+++ b/source3/include/includes.h
@@ -213,7 +213,6 @@ struct stat_ex {
 	blkcnt_t	st_ex_blocks;
 
 	uint32_t	st_ex_flags;
-	uint32_t	st_ex_mask;
 };
 
 typedef struct stat_ex SMB_STRUCT_STAT;
diff --git a/source3/include/vfs.h b/source3/include/vfs.h
index 67cbe758674..39ea04bf266 100644
--- a/source3/include/vfs.h
+++ b/source3/include/vfs.h
@@ -261,6 +261,7 @@
 /* Version 40 - Add SMB_VFS_GET_DOS_ATTRIBUTES_SEND/RECV */
 /* Bump to version 41, Samba 4.11 will ship with that */
 /* Version 41 - Remove SMB_VFS_BRL_CANCEL_WINDOWS */
+/* Version 41 - Remove unused st_ex_mask from struct stat_ex */
 
 #define SMB_VFS_INTERFACE_VERSION 41
 
diff --git a/source3/librpc/idl/open_files.idl b/source3/librpc/idl/open_files.idl
index d724d738214..5668a0b97e2 100644
--- a/source3/librpc/idl/open_files.idl
+++ b/source3/librpc/idl/open_files.idl
@@ -80,7 +80,6 @@ interface open_files
 		hyper		st_ex_blksize;
 		hyper		st_ex_blocks;
 		uint32		st_ex_flags;
-		uint32		st_ex_mask;
 	} vfs_default_durable_stat;
 
 	typedef [public] struct {
diff --git a/source3/smbd/durable.c b/source3/smbd/durable.c
index 0c4a2fec684..311f7e598a4 100644
--- a/source3/smbd/durable.c
+++ b/source3/smbd/durable.c
@@ -122,7 +122,6 @@ NTSTATUS vfs_default_durable_cookie(struct files_struct *fsp,
 	cookie.stat_info.st_ex_blksize = fsp->fsp_name->st.st_ex_blksize;
 	cookie.stat_info.st_ex_blocks = fsp->fsp_name->st.st_ex_blocks;
 	cookie.stat_info.st_ex_flags = fsp->fsp_name->st.st_ex_flags;
-	cookie.stat_info.st_ex_mask = fsp->fsp_name->st.st_ex_mask;
 
 	ndr_err = ndr_push_struct_blob(cookie_blob, mem_ctx, &cookie,
 			(ndr_push_flags_fn_t)ndr_push_vfs_default_durable_cookie);
@@ -272,7 +271,6 @@ NTSTATUS vfs_default_durable_disconnect(struct files_struct *fsp,
 	cookie.stat_info.st_ex_blksize = fsp->fsp_name->st.st_ex_blksize;
 	cookie.stat_info.st_ex_blocks = fsp->fsp_name->st.st_ex_blocks;
 	cookie.stat_info.st_ex_flags = fsp->fsp_name->st.st_ex_flags;
-	cookie.stat_info.st_ex_mask = fsp->fsp_name->st.st_ex_mask;
 
 	ndr_err = ndr_push_struct_blob(&new_cookie_blob, mem_ctx, &cookie,
 			(ndr_push_flags_fn_t)ndr_push_vfs_default_durable_cookie);
@@ -497,18 +495,6 @@ static bool vfs_default_durable_reconnect_check_stat(
 		return false;
 	}
 
-	if (cookie_st->st_ex_mask != fsp_st->st_ex_mask) {
-		DEBUG(1, ("vfs_default_durable_reconnect (%s): "
-			  "stat_ex.%s differs: "
-			  "cookie:%llu != stat:%llu, "
-			  "denying durable reconnect\n",
-			  name,
-			  "st_ex_mask",
-			  (unsigned long long)cookie_st->st_ex_mask,
-			  (unsigned long long)fsp_st->st_ex_mask));
-		return false;
-	}
-
 	return true;
 }
 
-- 
2.21.0


From 6d15fd16f464ba13c8926ee066fca7fee82a006b Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Thu, 27 Jun 2019 17:06:46 +0200
Subject: [PATCH 04/22] s3: convert struct stat_ex st_ex_calculated_birthtime
 bool to flags

Subsequent commits will add more flags, this paves the way.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/include/includes.h        |  7 +++++--
 source3/include/vfs.h             |  1 +
 source3/lib/system.c              | 11 ++++++-----
 source3/librpc/idl/open_files.idl |  2 +-
 source3/modules/vfs_ceph.c        |  2 +-
 source3/modules/vfs_gpfs.c        |  4 ++--
 source3/smbd/durable.c            | 12 +++++-------
 7 files changed, 21 insertions(+), 18 deletions(-)

diff --git a/source3/include/includes.h b/source3/include/includes.h
index 8f398d0d24b..ec486be6efa 100644
--- a/source3/include/includes.h
+++ b/source3/include/includes.h
@@ -190,6 +190,9 @@ typedef uint64_t br_off;
 #define SOFF_T_R(p, ofs, v) (SIVAL(p,(ofs)+4,(v)&0xFFFFFFFF), SIVAL(p,ofs,(v)>>32))
 #define IVAL_TO_SMB_OFF_T(buf,off) ((off_t)(( ((uint64_t)(IVAL((buf),(off)))) & ((uint64_t)0xFFFFFFFF) )))
 
+/* Is birthtime real, or was it calculated ? */
+#define ST_EX_IFLAG_CALCULATED_BTIME		(1 << 0)
+
 /*
  * Type for stat structure.
  */
@@ -207,12 +210,12 @@ struct stat_ex {
 	struct timespec st_ex_mtime;
 	struct timespec st_ex_ctime;
 	struct timespec st_ex_btime; /* birthtime */
-	/* Is birthtime real, or was it calculated ? */
-	bool		st_ex_calculated_birthtime;
+
 	blksize_t	st_ex_blksize;
 	blkcnt_t	st_ex_blocks;
 
 	uint32_t	st_ex_flags;
+	uint32_t	st_ex_iflags;
 };
 
 typedef struct stat_ex SMB_STRUCT_STAT;
diff --git a/source3/include/vfs.h b/source3/include/vfs.h
index 39ea04bf266..ecac793b93d 100644
--- a/source3/include/vfs.h
+++ b/source3/include/vfs.h
@@ -262,6 +262,7 @@
 /* Bump to version 41, Samba 4.11 will ship with that */
 /* Version 41 - Remove SMB_VFS_BRL_CANCEL_WINDOWS */
 /* Version 41 - Remove unused st_ex_mask from struct stat_ex */
+/* Version 41 - convert struct stat_ex.st_ex_calculated_birthtime to flags */
 
 #define SMB_VFS_INTERFACE_VERSION 41
 
diff --git a/source3/lib/system.c b/source3/lib/system.c
index 9dd04ca5e3d..4bfe3785118 100644
--- a/source3/lib/system.c
+++ b/source3/lib/system.c
@@ -291,7 +291,7 @@ static void make_create_timespec(const struct stat *pst, struct stat_ex *dst,
 		dst->st_ex_btime.tv_nsec = 0;
 	}
 
-	dst->st_ex_calculated_birthtime = false;
+	dst->st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_BTIME;
 
 #if defined(HAVE_STRUCT_STAT_ST_BIRTHTIMESPEC_TV_NSEC)
 	dst->st_ex_btime = pst->st_birthtimespec;
@@ -303,7 +303,7 @@ static void make_create_timespec(const struct stat *pst, struct stat_ex *dst,
 	dst->st_ex_btime.tv_nsec = 0;
 #else
 	dst->st_ex_btime = calc_create_time_stat(pst);
-	dst->st_ex_calculated_birthtime = true;
+	dst->st_ex_iflags |= ST_EX_IFLAG_CALCULATED_BTIME;
 #endif
 
 	/* Deal with systems that don't initialize birthtime correctly.
@@ -311,7 +311,7 @@ static void make_create_timespec(const struct stat *pst, struct stat_ex *dst,
 	 */
 	if (null_timespec(dst->st_ex_btime)) {
 		dst->st_ex_btime = calc_create_time_stat(pst);
-		dst->st_ex_calculated_birthtime = true;
+		dst->st_ex_iflags |= ST_EX_IFLAG_CALCULATED_BTIME;
 	}
 }
 
@@ -327,7 +327,7 @@ void update_stat_ex_mtime(struct stat_ex *dst,
 	dst->st_ex_mtime = write_ts;
 
 	/* We may have to recalculate btime. */
-	if (dst->st_ex_calculated_birthtime) {
+	if (dst->st_ex_iflags & ST_EX_IFLAG_CALCULATED_BTIME) {
 		dst->st_ex_btime = calc_create_time_stat_ex(dst);
 	}
 }
@@ -336,7 +336,7 @@ void update_stat_ex_create_time(struct stat_ex *dst,
                                 struct timespec create_time)
 {
 	dst->st_ex_btime = create_time;
-	dst->st_ex_calculated_birthtime = false;
+	dst->st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_BTIME;
 }
 
 void init_stat_ex_from_stat (struct stat_ex *dst,
@@ -354,6 +354,7 @@ void init_stat_ex_from_stat (struct stat_ex *dst,
 	dst->st_ex_atime = get_atimespec(src);
 	dst->st_ex_mtime = get_mtimespec(src);
 	dst->st_ex_ctime = get_ctimespec(src);
+	dst->st_ex_iflags = 0;
 	make_create_timespec(src, dst, fake_dir_create_times);
 #ifdef HAVE_STAT_ST_BLKSIZE
 	dst->st_ex_blksize = src->st_blksize;
diff --git a/source3/librpc/idl/open_files.idl b/source3/librpc/idl/open_files.idl
index 5668a0b97e2..04305e24164 100644
--- a/source3/librpc/idl/open_files.idl
+++ b/source3/librpc/idl/open_files.idl
@@ -76,10 +76,10 @@ interface open_files
 		timespec	st_ex_mtime;
 		timespec	st_ex_ctime;
 		timespec	st_ex_btime;
-		boolean8	st_ex_calculated_birthtime;
 		hyper		st_ex_blksize;
 		hyper		st_ex_blocks;
 		uint32		st_ex_flags;
+		uint32		st_ex_iflags;
 	} vfs_default_durable_stat;
 
 	typedef [public] struct {
diff --git a/source3/modules/vfs_ceph.c b/source3/modules/vfs_ceph.c
index e1f3d757bf1..e3e9bb65b07 100644
--- a/source3/modules/vfs_ceph.c
+++ b/source3/modules/vfs_ceph.c
@@ -704,7 +704,7 @@ static void init_stat_ex_from_ceph_statx(struct stat_ex *dst, const struct ceph_
 	dst->st_ex_btime = stx->stx_btime;
 	dst->st_ex_ctime = stx->stx_ctime;
 	dst->st_ex_mtime = stx->stx_mtime;
-	dst->st_ex_calculated_birthtime = false;
+	dst->st_ex_iflags = 0;
 	dst->st_ex_blksize = stx->stx_blksize;
 	dst->st_ex_blocks = stx->stx_blocks;
 }
diff --git a/source3/modules/vfs_gpfs.c b/source3/modules/vfs_gpfs.c
index a1fe91d0df4..4b963edab11 100644
--- a/source3/modules/vfs_gpfs.c
+++ b/source3/modules/vfs_gpfs.c
@@ -1630,7 +1630,7 @@ static NTSTATUS vfs_gpfs_get_dos_attributes(struct vfs_handle_struct *handle,
 	}
 
 	*dosmode |= vfs_gpfs_winattrs_to_dosmode(attrs.winAttrs);
-	smb_fname->st.st_ex_calculated_birthtime = false;
+	smb_fname->st.st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_BTIME;
 	smb_fname->st.st_ex_btime.tv_sec = attrs.creationTime.tv_sec;
 	smb_fname->st.st_ex_btime.tv_nsec = attrs.creationTime.tv_nsec;
 
@@ -1689,7 +1689,7 @@ static NTSTATUS vfs_gpfs_fget_dos_attributes(struct vfs_handle_struct *handle,
 	}
 
 	*dosmode |= vfs_gpfs_winattrs_to_dosmode(attrs.winAttrs);
-	fsp->fsp_name->st.st_ex_calculated_birthtime = false;
+	fsp->fsp_name->st.st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_BTIME;
 	fsp->fsp_name->st.st_ex_btime.tv_sec = attrs.creationTime.tv_sec;
 	fsp->fsp_name->st.st_ex_btime.tv_nsec = attrs.creationTime.tv_nsec;
 
diff --git a/source3/smbd/durable.c b/source3/smbd/durable.c
index 311f7e598a4..4aa5a2d619e 100644
--- a/source3/smbd/durable.c
+++ b/source3/smbd/durable.c
@@ -118,7 +118,7 @@ NTSTATUS vfs_default_durable_cookie(struct files_struct *fsp,
 	cookie.stat_info.st_ex_mtime = fsp->fsp_name->st.st_ex_mtime;
 	cookie.stat_info.st_ex_ctime = fsp->fsp_name->st.st_ex_ctime;
 	cookie.stat_info.st_ex_btime = fsp->fsp_name->st.st_ex_btime;
-	cookie.stat_info.st_ex_calculated_birthtime = fsp->fsp_name->st.st_ex_calculated_birthtime;
+	cookie.stat_info.st_ex_iflags = fsp->fsp_name->st.st_ex_iflags;
 	cookie.stat_info.st_ex_blksize = fsp->fsp_name->st.st_ex_blksize;
 	cookie.stat_info.st_ex_blocks = fsp->fsp_name->st.st_ex_blocks;
 	cookie.stat_info.st_ex_flags = fsp->fsp_name->st.st_ex_flags;
@@ -267,7 +267,7 @@ NTSTATUS vfs_default_durable_disconnect(struct files_struct *fsp,
 	cookie.stat_info.st_ex_mtime = fsp->fsp_name->st.st_ex_mtime;
 	cookie.stat_info.st_ex_ctime = fsp->fsp_name->st.st_ex_ctime;
 	cookie.stat_info.st_ex_btime = fsp->fsp_name->st.st_ex_btime;
-	cookie.stat_info.st_ex_calculated_birthtime = fsp->fsp_name->st.st_ex_calculated_birthtime;
+	cookie.stat_info.st_ex_iflags = fsp->fsp_name->st.st_ex_iflags;
 	cookie.stat_info.st_ex_blksize = fsp->fsp_name->st.st_ex_blksize;
 	cookie.stat_info.st_ex_blocks = fsp->fsp_name->st.st_ex_blocks;
 	cookie.stat_info.st_ex_flags = fsp->fsp_name->st.st_ex_flags;
@@ -445,17 +445,15 @@ static bool vfs_default_durable_reconnect_check_stat(
 		return false;
 	}
 
-	if (cookie_st->st_ex_calculated_birthtime !=
-	    fsp_st->st_ex_calculated_birthtime)
-	{
+	if (cookie_st->st_ex_iflags != fsp_st->st_ex_iflags) {
 		DEBUG(1, ("vfs_default_durable_reconnect (%s): "
 			  "stat_ex.%s differs: "
 			  "cookie:%llu != stat:%llu, "
 			  "denying durable reconnect\n",
 			  name,
 			  "st_ex_calculated_birthtime",
-			  (unsigned long long)cookie_st->st_ex_calculated_birthtime,
-			  (unsigned long long)fsp_st->st_ex_calculated_birthtime));
+			  (unsigned long long)cookie_st->st_ex_iflags,
+			  (unsigned long long)fsp_st->st_ex_iflags));
 		return false;
 	}
 
-- 
2.21.0


From 74267fb0f78425a81c448f5f26f0f1bb948efbe0 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Thu, 27 Jun 2019 18:14:43 +0200
Subject: [PATCH 05/22] s3: add st_ex_itime to struct stat_ex

st_ex_itime is an immutable original birth time aka instantiation time. Set when
a file is created, never changes thereafter. May not be set by the client.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/include/includes.h | 6 ++++++
 source3/include/vfs.h      | 1 +
 source3/lib/system.c       | 3 +++
 source3/modules/vfs_ceph.c | 3 ++-
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/source3/include/includes.h b/source3/include/includes.h
index ec486be6efa..5a9150fe2fe 100644
--- a/source3/include/includes.h
+++ b/source3/include/includes.h
@@ -192,6 +192,7 @@ typedef uint64_t br_off;
 
 /* Is birthtime real, or was it calculated ? */
 #define ST_EX_IFLAG_CALCULATED_BTIME		(1 << 0)
+#define ST_EX_IFLAG_CALCULATED_ITIME		(1 << 1)
 
 /*
  * Type for stat structure.
@@ -210,6 +211,11 @@ struct stat_ex {
 	struct timespec st_ex_mtime;
 	struct timespec st_ex_ctime;
 	struct timespec st_ex_btime; /* birthtime */
+	/*
+	 * Immutable original birth time aka instantiation time. Set when a file
+	 * is created, never changes thereafter. May not be set by the client.
+	 */
+	struct timespec st_ex_itime; /* instantiation time */
 
 	blksize_t	st_ex_blksize;
 	blkcnt_t	st_ex_blocks;
diff --git a/source3/include/vfs.h b/source3/include/vfs.h
index ecac793b93d..17cbf32ec19 100644
--- a/source3/include/vfs.h
+++ b/source3/include/vfs.h
@@ -263,6 +263,7 @@
 /* Version 41 - Remove SMB_VFS_BRL_CANCEL_WINDOWS */
 /* Version 41 - Remove unused st_ex_mask from struct stat_ex */
 /* Version 41 - convert struct stat_ex.st_ex_calculated_birthtime to flags */
+/* Version 41 - add st_ex_itime to struct stat_ex */
 
 #define SMB_VFS_INTERFACE_VERSION 41
 
diff --git a/source3/lib/system.c b/source3/lib/system.c
index 4bfe3785118..104d1abc1f2 100644
--- a/source3/lib/system.c
+++ b/source3/lib/system.c
@@ -313,6 +313,9 @@ static void make_create_timespec(const struct stat *pst, struct stat_ex *dst,
 		dst->st_ex_btime = calc_create_time_stat(pst);
 		dst->st_ex_iflags |= ST_EX_IFLAG_CALCULATED_BTIME;
 	}
+
+	dst->st_ex_itime = dst->st_ex_btime;
+	dst->st_ex_iflags |= ST_EX_IFLAG_CALCULATED_ITIME;
 }
 
 /****************************************************************************
diff --git a/source3/modules/vfs_ceph.c b/source3/modules/vfs_ceph.c
index e3e9bb65b07..2f49ca24a18 100644
--- a/source3/modules/vfs_ceph.c
+++ b/source3/modules/vfs_ceph.c
@@ -704,7 +704,8 @@ static void init_stat_ex_from_ceph_statx(struct stat_ex *dst, const struct ceph_
 	dst->st_ex_btime = stx->stx_btime;
 	dst->st_ex_ctime = stx->stx_ctime;
 	dst->st_ex_mtime = stx->stx_mtime;
-	dst->st_ex_iflags = 0;
+	dst->st_ex_itime = dst->st_ex_btime;
+	dst->st_ex_iflags = ST_EX_IFLAG_CALCULATED_ITIME;
 	dst->st_ex_blksize = stx->stx_blksize;
 	dst->st_ex_blocks = stx->stx_blocks;
 }
-- 
2.21.0


From 230c49652c5c58783fcdaa87501e2ec30701be4a Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Thu, 27 Jun 2019 18:17:20 +0200
Subject: [PATCH 06/22] s3: add st_ex_file_id to struct stat_ex

st_ex_file_id is an immutable, never reused numeric identifier for objects in a
filesystem.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/include/includes.h | 2 ++
 source3/include/vfs.h      | 1 +
 source3/lib/system.c       | 2 ++
 source3/modules/vfs_ceph.c | 2 ++
 4 files changed, 7 insertions(+)

diff --git a/source3/include/includes.h b/source3/include/includes.h
index 5a9150fe2fe..abe12ac0930 100644
--- a/source3/include/includes.h
+++ b/source3/include/includes.h
@@ -193,6 +193,7 @@ typedef uint64_t br_off;
 /* Is birthtime real, or was it calculated ? */
 #define ST_EX_IFLAG_CALCULATED_BTIME		(1 << 0)
 #define ST_EX_IFLAG_CALCULATED_ITIME		(1 << 1)
+#define ST_EX_IFLAG_CALCULATED_FILE_ID		(1 << 2)
 
 /*
  * Type for stat structure.
@@ -201,6 +202,7 @@ typedef uint64_t br_off;
 struct stat_ex {
 	dev_t		st_ex_dev;
 	ino_t		st_ex_ino;
+	uint64_t	st_ex_file_id;
 	mode_t		st_ex_mode;
 	nlink_t		st_ex_nlink;
 	uid_t		st_ex_uid;
diff --git a/source3/include/vfs.h b/source3/include/vfs.h
index 17cbf32ec19..33c54c884cd 100644
--- a/source3/include/vfs.h
+++ b/source3/include/vfs.h
@@ -264,6 +264,7 @@
 /* Version 41 - Remove unused st_ex_mask from struct stat_ex */
 /* Version 41 - convert struct stat_ex.st_ex_calculated_birthtime to flags */
 /* Version 41 - add st_ex_itime to struct stat_ex */
+/* Version 41 - add st_ex_file_id to struct stat_ex */
 
 #define SMB_VFS_INTERFACE_VERSION 41
 
diff --git a/source3/lib/system.c b/source3/lib/system.c
index 104d1abc1f2..486a775c8c3 100644
--- a/source3/lib/system.c
+++ b/source3/lib/system.c
@@ -376,6 +376,8 @@ void init_stat_ex_from_stat (struct stat_ex *dst,
 #else
 	dst->st_ex_flags = 0;
 #endif
+	dst->st_ex_file_id = dst->st_ex_ino;
+	dst->st_ex_iflags |= ST_EX_IFLAG_CALCULATED_FILE_ID;
 }
 
 /*******************************************************************
diff --git a/source3/modules/vfs_ceph.c b/source3/modules/vfs_ceph.c
index 2f49ca24a18..1b293ddb1b0 100644
--- a/source3/modules/vfs_ceph.c
+++ b/source3/modules/vfs_ceph.c
@@ -708,6 +708,8 @@ static void init_stat_ex_from_ceph_statx(struct stat_ex *dst, const struct ceph_
 	dst->st_ex_iflags = ST_EX_IFLAG_CALCULATED_ITIME;
 	dst->st_ex_blksize = stx->stx_blksize;
 	dst->st_ex_blocks = stx->stx_blocks;
+	dst->st_ex_file_id = dst->st_ex_ino;
+	dst->st_ex_iflags |= ST_EX_IFLAG_CALCULATED_FILE_ID;
 }
 
 static int cephwrap_stat(struct vfs_handle_struct *handle,
-- 
2.21.0


From c94f9d8b492ca504ba07ee9dac85974eb754a588 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 13:13:08 +0200
Subject: [PATCH 07/22] s3/lib: add update_stat_ex_itime()

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/include/proto.h | 1 +
 source3/lib/system.c    | 7 +++++++
 2 files changed, 8 insertions(+)

diff --git a/source3/include/proto.h b/source3/include/proto.h
index 484afc959b9..84d19e4277d 100644
--- a/source3/include/proto.h
+++ b/source3/include/proto.h
@@ -220,6 +220,7 @@ ssize_t sys_recvfrom(int s, void *buf, size_t len, int flags, struct sockaddr *f
 int sys_fcntl_ptr(int fd, int cmd, void *arg);
 int sys_fcntl_long(int fd, int cmd, long arg);
 void update_stat_ex_mtime(struct stat_ex *dst, struct timespec write_ts);
+void update_stat_ex_itime(struct stat_ex *dst, struct timespec itime);
 void update_stat_ex_create_time(struct stat_ex *dst, struct timespec create_time);
 int sys_stat(const char *fname, SMB_STRUCT_STAT *sbuf,
 	     bool fake_dir_create_times);
diff --git a/source3/lib/system.c b/source3/lib/system.c
index 486a775c8c3..d42ec3048cc 100644
--- a/source3/lib/system.c
+++ b/source3/lib/system.c
@@ -342,6 +342,13 @@ void update_stat_ex_create_time(struct stat_ex *dst,
 	dst->st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_BTIME;
 }
 
+void update_stat_ex_itime(struct stat_ex *dst,
+			  struct timespec itime)
+{
+	dst->st_ex_itime = itime;
+	dst->st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_ITIME;
+}
+
 void init_stat_ex_from_stat (struct stat_ex *dst,
 			    const struct stat *src,
 			    bool fake_dir_create_times)
-- 
2.21.0


From d1247028295add7b9a59f009adf951e7b588928b Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:24:17 +0200
Subject: [PATCH 08/22] s3/lib: add update_stat_ex_file_id()

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/include/proto.h | 1 +
 source3/lib/system.c    | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/source3/include/proto.h b/source3/include/proto.h
index 84d19e4277d..8b387f7c563 100644
--- a/source3/include/proto.h
+++ b/source3/include/proto.h
@@ -222,6 +222,7 @@ int sys_fcntl_long(int fd, int cmd, long arg);
 void update_stat_ex_mtime(struct stat_ex *dst, struct timespec write_ts);
 void update_stat_ex_itime(struct stat_ex *dst, struct timespec itime);
 void update_stat_ex_create_time(struct stat_ex *dst, struct timespec create_time);
+void update_stat_ex_file_id(struct stat_ex *dst, uint64_t file_id);
 int sys_stat(const char *fname, SMB_STRUCT_STAT *sbuf,
 	     bool fake_dir_create_times);
 int sys_fstat(int fd, SMB_STRUCT_STAT *sbuf,
diff --git a/source3/lib/system.c b/source3/lib/system.c
index d42ec3048cc..a67388e436a 100644
--- a/source3/lib/system.c
+++ b/source3/lib/system.c
@@ -349,6 +349,12 @@ void update_stat_ex_itime(struct stat_ex *dst,
 	dst->st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_ITIME;
 }
 
+void update_stat_ex_file_id(struct stat_ex *dst, uint64_t file_id)
+{
+	dst->st_ex_file_id = file_id;
+	dst->st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_FILE_ID;
+}
+
 void init_stat_ex_from_stat (struct stat_ex *dst,
 			    const struct stat *src,
 			    bool fake_dir_create_times)
-- 
2.21.0


From 4ed752d09cac88127cafdc79eb94dceb01784696 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:13:28 +0200
Subject: [PATCH 09/22] s3/lib: add make_file_index_from_itime()

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/lib/file_id.c | 34 ++++++++++++++++++++++++++++++++++
 source3/lib/file_id.h |  5 +++++
 2 files changed, 39 insertions(+)

diff --git a/source3/lib/file_id.c b/source3/lib/file_id.c
index f8295ce738a..7d4fb006afe 100644
--- a/source3/lib/file_id.c
+++ b/source3/lib/file_id.c
@@ -90,3 +90,37 @@ void pull_file_id_24(const char *buf, struct file_id *id)
 	id->extid  = IVAL(buf,  16);
 	id->extid |= ((uint64_t)IVAL(buf,20))<<32;
 }
+
+uint64_t make_file_id_from_itime(SMB_STRUCT_STAT *st)
+{
+	struct timespec itime = st->st_ex_itime;
+	ino_t ino = st->st_ex_ino;
+	uint64_t file_id_low;
+	uint64_t file_id;
+
+	if (st->st_ex_iflags & ST_EX_IFLAG_CALCULATED_ITIME) {
+		return ino;
+	}
+
+	file_id_low = itime.tv_nsec;
+	if (file_id_low == 0) {
+		/*
+		 * This could be by coincidence, but more likely the filesystem
+		 * is only giving us seconds granularity. We need more fine
+		 * grained granularity for the File-ID, so combine with the
+		 * inode number.
+		 */
+		file_id_low = ino & ((1 << 30) - 1);
+	}
+
+	/*
+	 * Set the high bit so ideally File-IDs based on inode numbers and
+	 * File-IDs based on Birth Time use disjoint ranges, given inodes never
+	 * have the high bit set.
+	 */
+	file_id = ((uint64_t)1) << 63;
+	file_id |= (uint64_t)itime.tv_sec << 30;
+	file_id |= file_id_low;
+
+	return file_id;
+}
diff --git a/source3/lib/file_id.h b/source3/lib/file_id.h
index 6fa98400b85..509e924c1fe 100644
--- a/source3/lib/file_id.h
+++ b/source3/lib/file_id.h
@@ -35,3 +35,8 @@ const char *file_id_string(TALLOC_CTX *mem_ctx, const struct file_id *id);
 void push_file_id_16(char *buf, const struct file_id *id);
 void push_file_id_24(char *buf, const struct file_id *id);
 void pull_file_id_24(const char *buf, struct file_id *id);
+
+/*
+ * Make a SMB File-ID from itime
+ */
+uint64_t make_file_id_from_itime(SMB_STRUCT_STAT *st);
-- 
2.21.0


From 2a4e4f670bd10810cf9604dd6b4dc6362f144256 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Wed, 26 Jun 2019 13:40:05 +0200
Subject: [PATCH 10/22] s3:smbd: mark itime non-calculated if we created a file
 or dir

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/smbd/open.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/source3/smbd/open.c b/source3/smbd/open.c
index 411c917e55f..b86559ec417 100644
--- a/source3/smbd/open.c
+++ b/source3/smbd/open.c
@@ -3811,6 +3811,10 @@ static NTSTATUS open_file_ntcreate(connection_struct *conn,
 		fsp->initial_delete_on_close = True;
 	}
 
+	if (info == FILE_WAS_CREATED) {
+		smb_fname->st.st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_ITIME;
+	}
+
 	if (info != FILE_WAS_OPENED) {
 		/* Overwritten files should be initially set as archive */
 		if ((info == FILE_WAS_OVERWRITTEN && lp_map_archive(SNUM(conn))) ||
@@ -3958,6 +3962,8 @@ static NTSTATUS mkdir_internal(connection_struct *conn,
 		return NT_STATUS_NOT_A_DIRECTORY;
 	}
 
+	smb_dname->st.st_ex_iflags &= ~ST_EX_IFLAG_CALCULATED_ITIME;
+
 	if (lp_store_dos_attributes(SNUM(conn))) {
 		if (!posix_open) {
 			file_set_dosmode(conn, smb_dname,
-- 
2.21.0


From 4181f5c6a7dcafc19eb84b393926f232ae7740e5 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:25:21 +0200
Subject: [PATCH 11/22] s3:smbd: parse xattr_DosInfo4 in
 parse_dos_attribute_blob()

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/smbd/dosmode.c | 44 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/source3/smbd/dosmode.c b/source3/smbd/dosmode.c
index a4625718a56..8e8d791cfe9 100644
--- a/source3/smbd/dosmode.c
+++ b/source3/smbd/dosmode.c
@@ -325,6 +325,50 @@ NTSTATUS parse_dos_attribute_blob(struct smb_filename *smb_fname,
 						      create_time)));
 		}
 		break;
+	case 4:
+	{
+		struct xattr_DosInfo4 *info = &dosattrib.info.info4;
+
+		dosattr = info->attrib;
+
+		if ((info->valid_flags & XATTR_DOSINFO_CREATE_TIME) &&
+		    !null_nttime(info->create_time))
+		{
+			struct timespec creat_time;
+
+			creat_time = nt_time_to_unix_timespec(info->create_time);
+			update_stat_ex_create_time(&smb_fname->st, creat_time);
+
+			DBG_DEBUG("file [%s] creation time [%s]\n",
+				smb_fname_str_dbg(smb_fname),
+				nt_time_string(talloc_tos(), info->create_time));
+		}
+
+		if (info->valid_flags & XATTR_DOSINFO_ITIME) {
+			struct timespec itime;
+			uint64_t file_id;
+
+			itime = nt_time_to_unix_timespec(info->itime);
+			if (smb_fname->st.st_ex_iflags &
+			    ST_EX_IFLAG_CALCULATED_ITIME)
+			{
+				update_stat_ex_itime(&smb_fname->st, itime);
+			}
+
+			file_id = make_file_id_from_itime(&smb_fname->st);
+			if (smb_fname->st.st_ex_iflags &
+			    ST_EX_IFLAG_CALCULATED_FILE_ID)
+			{
+				update_stat_ex_file_id(&smb_fname->st, file_id);
+			}
+
+			DBG_DEBUG("file [%s] itime [%s] fileid [%"PRIx64"]\n",
+				smb_fname_str_dbg(smb_fname),
+				nt_time_string(talloc_tos(), info->itime),
+				file_id);
+		}
+		break;
+	}
 	default:
 		DBG_WARNING("Badly formed DOSATTRIB on file %s - %s\n",
 			    smb_fname_str_dbg(smb_fname), blob.data);
-- 
2.21.0


From d7cebcf92222efca14c41ea25727ce0710ba0238 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 14:26:10 +0200
Subject: [PATCH 12/22] s3:smbd: use xattr_DosInfo4 in set_ea_dos_attribute()

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/smbd/dosmode.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/source3/smbd/dosmode.c b/source3/smbd/dosmode.c
index 8e8d791cfe9..d722c022fe9 100644
--- a/source3/smbd/dosmode.c
+++ b/source3/smbd/dosmode.c
@@ -488,13 +488,19 @@ NTSTATUS set_ea_dos_attribute(connection_struct *conn,
 	ZERO_STRUCT(dosattrib);
 	ZERO_STRUCT(blob);
 
-	dosattrib.version = 3;
-	dosattrib.info.info3.valid_flags = XATTR_DOSINFO_ATTRIB|
+	dosattrib.version = 4;
+	dosattrib.info.info4.valid_flags = XATTR_DOSINFO_ATTRIB |
 					XATTR_DOSINFO_CREATE_TIME;
-	dosattrib.info.info3.attrib = dosmode;
-	dosattrib.info.info3.create_time = unix_timespec_to_nt_time(
+	dosattrib.info.info4.attrib = dosmode;
+	dosattrib.info.info4.create_time = unix_timespec_to_nt_time(
 				smb_fname->st.st_ex_btime);
 
+	if (!(smb_fname->st.st_ex_iflags & ST_EX_IFLAG_CALCULATED_ITIME)) {
+		dosattrib.info.info4.valid_flags |= XATTR_DOSINFO_ITIME;
+		dosattrib.info.info4.itime = unix_timespec_to_nt_time(
+			smb_fname->st.st_ex_itime);
+	}
+
 	DEBUG(10,("set_ea_dos_attributes: set attribute 0x%x, btime = %s on file %s\n",
 		(unsigned int)dosmode,
 		time_to_asc(convert_timespec_to_time_t(smb_fname->st.st_ex_btime)),
-- 
2.21.0


From 96897733cacc4d70dd92a5f7254f29779454e19d Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Tue, 25 Jun 2019 12:07:59 +0200
Subject: [PATCH 13/22] s3:smbd: return inode number, not FileIndex for UNIX
 query info level

get_FileIndex() returns a stable and unique numerical identifier when "store dos
attributes" is enabled. It is NOT the same as a file's inode number which used
as the key for locking.tdb.

For POSIX clients we should return the inode numbers in the POSIX query info
level and the FileIndex in the corresponding SMB protocol fields (eg SMB2 QFID
create context).

This fix lets test "smbtorture_s3.plain.CLEANUP3" test work with get_FileIndex()
returning something different then the file's inode number.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/smbd/trans2.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/source3/smbd/trans2.c b/source3/smbd/trans2.c
index 77297c158b7..02a6d4b2407 100644
--- a/source3/smbd/trans2.c
+++ b/source3/smbd/trans2.c
@@ -4601,7 +4601,6 @@ static char *store_file_unix_basic(connection_struct *conn,
 				files_struct *fsp,
 				const SMB_STRUCT_STAT *psbuf)
 {
-	uint64_t file_index = get_FileIndex(conn, psbuf);
 	dev_t devno;
 
 	DEBUG(10,("store_file_unix_basic: SMB_QUERY_FILE_UNIX_BASIC\n"));
@@ -4643,7 +4642,7 @@ static char *store_file_unix_basic(connection_struct *conn,
 	SIVAL(pdata,4,0);
 	pdata += 8;
 
-	SINO_T_VAL(pdata,0,(SMB_INO_T)file_index);   /* inode number */
+	SINO_T_VAL(pdata, 0, psbuf->st_ex_ino);   /* inode number */
 	pdata += 8;
 
 	SIVAL(pdata,0, unix_perms_to_wire(psbuf->st_ex_mode));     /* Standard UNIX file permissions */
-- 
2.21.0


From 701cbd4dbb30825a12f2df063a964ca387d0098b Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Fri, 28 Jun 2019 10:12:44 +0200
Subject: [PATCH 14/22] s3:smbd: rename get_FileIndex() to get_fs_file_id()

Also rename all variable used to store the result of the renamed
get_fs_file_id() in the callers.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/smbd/proto.h       |  2 +-
 source3/smbd/smb2_create.c |  6 +++---
 source3/smbd/trans2.c      | 26 +++++++++++++-------------
 3 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/source3/smbd/proto.h b/source3/smbd/proto.h
index a0424388bec..23c59000da1 100644
--- a/source3/smbd/proto.h
+++ b/source3/smbd/proto.h
@@ -1161,7 +1161,7 @@ int sys_statvfs(const char *path, vfs_statvfs_struct *statbuf);
 NTSTATUS check_access_fsp(const struct files_struct *fsp,
 			  uint32_t access_mask);
 uint64_t smb_roundup(connection_struct *conn, uint64_t val);
-uint64_t get_FileIndex(connection_struct *conn, const SMB_STRUCT_STAT *psbuf);
+uint64_t get_fs_file_id(connection_struct *conn, const SMB_STRUCT_STAT *psbuf);
 void aapl_force_zero_file_id(struct smbd_server_connection *sconn);
 bool samba_private_attr_name(const char *unix_ea_name);
 NTSTATUS get_ea_value(TALLOC_CTX *mem_ctx, connection_struct *conn,
diff --git a/source3/smbd/smb2_create.c b/source3/smbd/smb2_create.c
index 96a50741af9..55dfb148c8e 100644
--- a/source3/smbd/smb2_create.c
+++ b/source3/smbd/smb2_create.c
@@ -1389,8 +1389,8 @@ static void smbd_smb2_create_after_exec(struct tevent_req *req)
 
 	if (state->qfid != NULL) {
 		uint8_t p[32];
-		uint64_t file_index = get_FileIndex(state->result->conn,
-						    &state->result->fsp_name->st);
+		uint64_t file_id = get_fs_file_id(state->result->conn,
+						  &state->result->fsp_name->st);
 		DATA_BLOB blob = data_blob_const(p, sizeof(p));
 
 		ZERO_STRUCT(p);
@@ -1399,7 +1399,7 @@ static void smbd_smb2_create_after_exec(struct tevent_req *req)
 		   the MS plugfest. The first 8 bytes are the "volume index"
 		   == inode, the second 8 bytes are the "volume id",
 		   == dev. This will be updated in the SMB2 doc. */
-		SBVAL(p, 0, file_index);
+		SBVAL(p, 0, file_id);
 		SIVAL(p, 8, state->result->fsp_name->st.st_ex_dev);/* FileIndexHigh */
 
 		status = smb2_create_blob_add(state->out_context_blobs,
diff --git a/source3/smbd/trans2.c b/source3/smbd/trans2.c
index 02a6d4b2407..a268e97218f 100644
--- a/source3/smbd/trans2.c
+++ b/source3/smbd/trans2.c
@@ -219,18 +219,18 @@ uint64_t smb_roundup(connection_struct *conn, uint64_t val)
  mangle as we used to do.
 ********************************************************************/
 
-uint64_t get_FileIndex(connection_struct *conn, const SMB_STRUCT_STAT *psbuf)
+uint64_t get_fs_file_id(connection_struct *conn, const SMB_STRUCT_STAT *psbuf)
 {
-	uint64_t file_index;
+	uint64_t file_id;
 	if (conn->sconn->aapl_zero_file_id) {
 		return 0;
 	}
 	if (conn->base_share_dev == psbuf->st_ex_dev) {
 		return (uint64_t)psbuf->st_ex_ino;
 	}
-	file_index = ((psbuf->st_ex_ino) & UINT32_MAX); /* FileIndexLow */
-	file_index |= ((uint64_t)((psbuf->st_ex_dev) & UINT32_MAX)) << 32; /* FileIndexHigh */
-	return file_index;
+	file_id = ((psbuf->st_ex_ino) & UINT32_MAX); /* FileIDLow */
+	file_id |= ((uint64_t)((psbuf->st_ex_dev) & UINT32_MAX)) << 32; /* FileIDHigh */
+	return file_id;
 }
 
 
@@ -1836,7 +1836,7 @@ static NTSTATUS smbd_marshall_dir_entry(TALLOC_CTX *ctx,
 	uint32_t reskey=0;
 	uint64_t file_size = 0;
 	uint64_t allocation_size = 0;
-	uint64_t file_index = 0;
+	uint64_t file_id = 0;
 	size_t len = 0;
 	struct timespec mdate_ts = {0};
 	struct timespec adate_ts = {0};
@@ -1863,7 +1863,7 @@ static NTSTATUS smbd_marshall_dir_entry(TALLOC_CTX *ctx,
 		}
 	}
 
-	file_index = get_FileIndex(conn, &smb_fname->st);
+	file_id = get_fs_file_id(conn, &smb_fname->st);
 
 	mdate_ts = smb_fname->st.st_ex_mtime;
 	adate_ts = smb_fname->st.st_ex_atime;
@@ -2281,7 +2281,7 @@ static NTSTATUS smbd_marshall_dir_entry(TALLOC_CTX *ctx,
 		}
 		p += 4;
 		SIVAL(p,0,0); p += 4; /* Unknown - reserved ? */
-		SBVAL(p,0,file_index); p += 8;
+		SBVAL(p,0,file_id); p += 8;
 		status = srvstr_push(base_data, flags2, p,
 				  fname, PTR_DIFF(end_data, p),
 				  STR_TERMINATE_ASCII, &len);
@@ -2402,7 +2402,7 @@ static NTSTATUS smbd_marshall_dir_entry(TALLOC_CTX *ctx,
 		}
 		p += 2;
 
-		SBVAL(p,0,file_index); p += 8;
+		SBVAL(p,0,file_id); p += 8;
 		status = srvstr_push(base_data, flags2, p,
 				  fname, PTR_DIFF(end_data, p),
 				  STR_TERMINATE_ASCII, &len);
@@ -5110,7 +5110,7 @@ NTSTATUS smbd_do_qfilepathinfo(connection_struct *conn,
 	uint64_t file_size = 0;
 	uint64_t pos = 0;
 	uint64_t allocation_size = 0;
-	uint64_t file_index = 0;
+	uint64_t file_id = 0;
 	uint32_t access_mask = 0;
 	size_t len = 0;
 
@@ -5231,7 +5231,7 @@ NTSTATUS smbd_do_qfilepathinfo(connection_struct *conn,
 
 	   I think this causes us to fail the IFSKIT
 	   BasicFileInformationTest. -tpot */
-	file_index = get_FileIndex(conn, psbuf);
+	file_id = get_fs_file_id(conn, psbuf);
 
 	*fixed_portion = 0;
 
@@ -5575,7 +5575,7 @@ NTSTATUS smbd_do_qfilepathinfo(connection_struct *conn,
 			SCVAL(pdata,	0x3C, delete_pending);
 			SCVAL(pdata,	0x3D, (mode&FILE_ATTRIBUTE_DIRECTORY)?1:0);
 			SSVAL(pdata,	0x3E, 0); /* padding */
-			SBVAL(pdata,	0x40, file_index);
+			SBVAL(pdata,	0x40, file_id);
 			SIVAL(pdata,	0x48, ea_size);
 			SIVAL(pdata,	0x4C, access_mask);
 			SBVAL(pdata,	0x50, pos);
@@ -5600,7 +5600,7 @@ NTSTATUS smbd_do_qfilepathinfo(connection_struct *conn,
 		case SMB_FILE_INTERNAL_INFORMATION:
 
 			DEBUG(10,("smbd_do_qfilepathinfo: SMB_FILE_INTERNAL_INFORMATION\n"));
-			SBVAL(pdata, 0, file_index);
+			SBVAL(pdata, 0, file_id);
 			data_size = 8;
 			*fixed_portion = 8;
 			break;
-- 
2.21.0


From 9ab5fdae3341dc1bdfd34dad0bb4f2a0cf7799d6 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Sat, 29 Jun 2019 14:08:04 +0200
Subject: [PATCH 15/22] s3:vfs: add SMB_VFS_FS_FILE_ID()

Not yet used, that comes next.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 examples/VFS/skel_opaque.c            |  8 ++++++++
 examples/VFS/skel_transparent.c       |  7 +++++++
 source3/include/vfs.h                 |  7 +++++++
 source3/include/vfs_macros.h          |  5 +++++
 source3/modules/vfs_full_audit.c      | 17 +++++++++++++++++
 source3/modules/vfs_not_implemented.c |  8 ++++++++
 source3/modules/vfs_time_audit.c      | 20 ++++++++++++++++++++
 source3/smbd/vfs.c                    |  7 +++++++
 8 files changed, 79 insertions(+)

diff --git a/examples/VFS/skel_opaque.c b/examples/VFS/skel_opaque.c
index 6628bffe3eb..4e4475a11e8 100644
--- a/examples/VFS/skel_opaque.c
+++ b/examples/VFS/skel_opaque.c
@@ -513,6 +513,13 @@ static struct file_id skel_file_id_create(vfs_handle_struct *handle,
 	return id;
 }
 
+static uint64_t skel_fs_file_id(vfs_handle_struct *handle,
+				const SMB_STRUCT_STAT *sbuf)
+{
+	errno = ENOSYS;
+	return 0;
+}
+
 struct skel_offload_read_state {
 	bool dummy;
 };
@@ -1084,6 +1091,7 @@ static struct vfs_fn_pointers skel_opaque_fns = {
 	.realpath_fn = skel_realpath,
 	.chflags_fn = skel_chflags,
 	.file_id_create_fn = skel_file_id_create,
+	.fs_file_id_fn = skel_fs_file_id,
 	.offload_read_send_fn = skel_offload_read_send,
 	.offload_read_recv_fn = skel_offload_read_recv,
 	.offload_write_send_fn = skel_offload_write_send,
diff --git a/examples/VFS/skel_transparent.c b/examples/VFS/skel_transparent.c
index 9b5f336042e..ac2665ef07b 100644
--- a/examples/VFS/skel_transparent.c
+++ b/examples/VFS/skel_transparent.c
@@ -600,6 +600,12 @@ static struct file_id skel_file_id_create(vfs_handle_struct *handle,
 	return SMB_VFS_NEXT_FILE_ID_CREATE(handle, sbuf);
 }
 
+static uint64_t skel_fs_file_id(vfs_handle_struct *handle,
+				const SMB_STRUCT_STAT *sbuf)
+{
+	return SMB_VFS_NEXT_FS_FILE_ID(handle, sbuf);
+}
+
 struct skel_offload_read_state {
 	struct vfs_handle_struct *handle;
 	DATA_BLOB token;
@@ -1348,6 +1354,7 @@ static struct vfs_fn_pointers skel_transparent_fns = {
 	.realpath_fn = skel_realpath,
 	.chflags_fn = skel_chflags,
 	.file_id_create_fn = skel_file_id_create,
+	.fs_file_id_fn = skel_fs_file_id,
 	.offload_read_send_fn = skel_offload_read_send,
 	.offload_read_recv_fn = skel_offload_read_recv,
 	.offload_write_send_fn = skel_offload_write_send,
diff --git a/source3/include/vfs.h b/source3/include/vfs.h
index 33c54c884cd..56f4b9dd1f8 100644
--- a/source3/include/vfs.h
+++ b/source3/include/vfs.h
@@ -265,6 +265,7 @@
 /* Version 41 - convert struct stat_ex.st_ex_calculated_birthtime to flags */
 /* Version 41 - add st_ex_itime to struct stat_ex */
 /* Version 41 - add st_ex_file_id to struct stat_ex */
+/* Version 41 - add SMB_VFS_FS_FILE_ID */
 
 #define SMB_VFS_INTERFACE_VERSION 41
 
@@ -800,6 +801,8 @@ struct vfs_fn_pointers {
 				unsigned int flags);
 	struct file_id (*file_id_create_fn)(struct vfs_handle_struct *handle,
 					    const SMB_STRUCT_STAT *sbuf);
+	uint64_t (*fs_file_id_fn)(struct vfs_handle_struct *handle,
+				  const SMB_STRUCT_STAT *sbuf);
 	struct tevent_req *(*offload_read_send_fn)(TALLOC_CTX *mem_ctx,
 						   struct tevent_context *ev,
 						   struct vfs_handle_struct *handle,
@@ -1327,6 +1330,8 @@ int smb_vfs_call_chflags(struct vfs_handle_struct *handle,
 			unsigned int flags);
 struct file_id smb_vfs_call_file_id_create(struct vfs_handle_struct *handle,
 					   const SMB_STRUCT_STAT *sbuf);
+uint64_t smb_vfs_call_fs_file_id(struct vfs_handle_struct *handle,
+				 const SMB_STRUCT_STAT *sbuf);
 NTSTATUS smb_vfs_call_streaminfo(struct vfs_handle_struct *handle,
 				 struct files_struct *fsp,
 				 const struct smb_filename *smb_fname,
@@ -1751,6 +1756,8 @@ int vfs_not_implemented_chflags(vfs_handle_struct *handle,
 				uint flags);
 struct file_id vfs_not_implemented_file_id_create(vfs_handle_struct *handle,
 						  const SMB_STRUCT_STAT *sbuf);
+uint64_t vfs_not_implemented_fs_file_id(vfs_handle_struct *handle,
+					const SMB_STRUCT_STAT *sbuf);
 struct tevent_req *vfs_not_implemented_offload_read_send(
 			TALLOC_CTX *mem_ctx,
 			struct tevent_context *ev,
diff --git a/source3/include/vfs_macros.h b/source3/include/vfs_macros.h
index e867810f30f..c4fa0fe022e 100644
--- a/source3/include/vfs_macros.h
+++ b/source3/include/vfs_macros.h
@@ -331,6 +331,11 @@
 #define SMB_VFS_NEXT_FILE_ID_CREATE(handle, sbuf) \
 	smb_vfs_call_file_id_create((handle)->next, (sbuf))
 
+#define SMB_VFS_FS_FILE_ID(conn, sbuf) \
+	smb_vfs_call_fs_file_id((conn)->vfs_handles, (sbuf))
+#define SMB_VFS_NEXT_FS_FILE_ID(handle, sbuf) \
+	smb_vfs_call_fs_file_id((handle)->next, (sbuf))
+
 #define SMB_VFS_STREAMINFO(conn, fsp, smb_fname, mem_ctx, num_streams, streams) \
 	smb_vfs_call_streaminfo((conn)->vfs_handles, (fsp), (smb_fname), (mem_ctx), (num_streams), (streams))
 #define SMB_VFS_NEXT_STREAMINFO(handle, fsp, smb_fname, mem_ctx, num_streams, streams) \
diff --git a/source3/modules/vfs_full_audit.c b/source3/modules/vfs_full_audit.c
index 8c4dc44dc5d..b20bca0a528 100644
--- a/source3/modules/vfs_full_audit.c
+++ b/source3/modules/vfs_full_audit.c
@@ -158,6 +158,7 @@ typedef enum _vfs_op_type {
 	SMB_VFS_OP_REALPATH,
 	SMB_VFS_OP_CHFLAGS,
 	SMB_VFS_OP_FILE_ID_CREATE,
+	SMB_VFS_OP_FS_FILE_ID,
 	SMB_VFS_OP_STREAMINFO,
 	SMB_VFS_OP_GET_REAL_FILENAME,
 	SMB_VFS_OP_CONNECTPATH,
@@ -300,6 +301,7 @@ static struct {
 	{ SMB_VFS_OP_REALPATH,	"realpath" },
 	{ SMB_VFS_OP_CHFLAGS,	"chflags" },
 	{ SMB_VFS_OP_FILE_ID_CREATE,	"file_id_create" },
+	{ SMB_VFS_OP_FS_FILE_ID,	"fs_file_id" },
 	{ SMB_VFS_OP_STREAMINFO,	"streaminfo" },
 	{ SMB_VFS_OP_GET_REAL_FILENAME, "get_real_filename" },
 	{ SMB_VFS_OP_CONNECTPATH,	"connectpath" },
@@ -1820,6 +1822,20 @@ static struct file_id smb_full_audit_file_id_create(struct vfs_handle_struct *ha
 	return result;
 }
 
+static uint64_t smb_full_audit_fs_file_id(struct vfs_handle_struct *handle,
+					  const SMB_STRUCT_STAT *sbuf)
+{
+	uint64_t result;
+
+	result = SMB_VFS_NEXT_FS_FILE_ID(handle, sbuf);
+
+	do_log(SMB_VFS_OP_FS_FILE_ID,
+	       result != 0,
+	       handle, "%" PRIu64, result);
+
+	return result;
+}
+
 static NTSTATUS smb_full_audit_streaminfo(vfs_handle_struct *handle,
 					  struct files_struct *fsp,
 					  const struct smb_filename *smb_fname,
@@ -2864,6 +2880,7 @@ static struct vfs_fn_pointers vfs_full_audit_fns = {
 	.realpath_fn = smb_full_audit_realpath,
 	.chflags_fn = smb_full_audit_chflags,
 	.file_id_create_fn = smb_full_audit_file_id_create,
+	.fs_file_id_fn = smb_full_audit_fs_file_id,
 	.offload_read_send_fn = smb_full_audit_offload_read_send,
 	.offload_read_recv_fn = smb_full_audit_offload_read_recv,
 	.offload_write_send_fn = smb_full_audit_offload_write_send,
diff --git a/source3/modules/vfs_not_implemented.c b/source3/modules/vfs_not_implemented.c
index d3aca899067..aa7068ed073 100644
--- a/source3/modules/vfs_not_implemented.c
+++ b/source3/modules/vfs_not_implemented.c
@@ -511,6 +511,13 @@ struct file_id vfs_not_implemented_file_id_create(vfs_handle_struct *handle,
 	return id;
 }
 
+uint64_t vfs_not_implemented_fs_file_id(vfs_handle_struct *handle,
+					const SMB_STRUCT_STAT *sbuf)
+{
+	errno = ENOSYS;
+	return 0;
+}
+
 struct vfs_not_implemented_offload_read_state {
 	bool dummy;
 };
@@ -1088,6 +1095,7 @@ static struct vfs_fn_pointers vfs_not_implemented_fns = {
 	.realpath_fn = vfs_not_implemented_realpath,
 	.chflags_fn = vfs_not_implemented_chflags,
 	.file_id_create_fn = vfs_not_implemented_file_id_create,
+	.fs_file_id_fn = vfs_not_implemented_fs_file_id,
 	.offload_read_send_fn = vfs_not_implemented_offload_read_send,
 	.offload_read_recv_fn = vfs_not_implemented_offload_read_recv,
 	.offload_write_send_fn = vfs_not_implemented_offload_write_send,
diff --git a/source3/modules/vfs_time_audit.c b/source3/modules/vfs_time_audit.c
index 96847a4fde9..8e1c794c037 100644
--- a/source3/modules/vfs_time_audit.c
+++ b/source3/modules/vfs_time_audit.c
@@ -1520,6 +1520,25 @@ static struct file_id smb_time_audit_file_id_create(struct vfs_handle_struct *ha
 	return result;
 }
 
+static uint64_t smb_time_audit_fs_file_id(struct vfs_handle_struct *handle,
+					  const SMB_STRUCT_STAT *sbuf)
+{
+	uint64_t result;
+	struct timespec ts1,ts2;
+	double timediff;
+
+	clock_gettime_mono(&ts1);
+	result = SMB_VFS_NEXT_FS_FILE_ID(handle, sbuf);
+	clock_gettime_mono(&ts2);
+	timediff = nsec_time_diff(&ts2,&ts1)*1.0e-9;
+
+	if (timediff > audit_timeout) {
+		smb_time_audit_log("fs_file_id", timediff);
+	}
+
+	return result;
+}
+
 static NTSTATUS smb_time_audit_streaminfo(vfs_handle_struct *handle,
 					  struct files_struct *fsp,
 					  const struct smb_filename *smb_fname,
@@ -2824,6 +2843,7 @@ static struct vfs_fn_pointers vfs_time_audit_fns = {
 	.realpath_fn = smb_time_audit_realpath,
 	.chflags_fn = smb_time_audit_chflags,
 	.file_id_create_fn = smb_time_audit_file_id_create,
+	.fs_file_id_fn = smb_time_audit_fs_file_id,
 	.offload_read_send_fn = smb_time_audit_offload_read_send,
 	.offload_read_recv_fn = smb_time_audit_offload_read_recv,
 	.offload_write_send_fn = smb_time_audit_offload_write_send,
diff --git a/source3/smbd/vfs.c b/source3/smbd/vfs.c
index d3bb9c5d63f..51a4aeb0f22 100644
--- a/source3/smbd/vfs.c
+++ b/source3/smbd/vfs.c
@@ -2237,6 +2237,13 @@ struct file_id smb_vfs_call_file_id_create(struct vfs_handle_struct *handle,
 	return handle->fns->file_id_create_fn(handle, sbuf);
 }
 
+uint64_t smb_vfs_call_fs_file_id(struct vfs_handle_struct *handle,
+				 const SMB_STRUCT_STAT *sbuf)
+{
+	VFS_FIND(fs_file_id);
+	return handle->fns->fs_file_id_fn(handle, sbuf);
+}
+
 NTSTATUS smb_vfs_call_streaminfo(struct vfs_handle_struct *handle,
 				 struct files_struct *fsp,
 				 const struct smb_filename *smb_fname,
-- 
2.21.0


From 33e2acfff860945018b7e6e2403a9ed3b5c4f77e Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Sat, 29 Jun 2019 14:18:13 +0200
Subject: [PATCH 16/22] s3:vfs: move get_fs_file_id to vfs_default

This makes get_fs_file_id() the default implementation of
SMB_VFS_FS_FILE_ID(). No change in behaviour.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/modules/vfs_default.c | 23 +++++++++++++++++++++++
 source3/smbd/proto.h          |  1 -
 source3/smbd/smb2_create.c    |  5 +++--
 source3/smbd/trans2.c         | 25 ++-----------------------
 4 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/source3/modules/vfs_default.c b/source3/modules/vfs_default.c
index f2f2ed7f7d1..dcb53c64eef 100644
--- a/source3/modules/vfs_default.c
+++ b/source3/modules/vfs_default.c
@@ -2728,6 +2728,28 @@ static struct file_id vfswrap_file_id_create(struct vfs_handle_struct *handle,
 	return key;
 }
 
+static uint64_t vfswrap_fs_file_id(struct vfs_handle_struct *handle,
+				   const SMB_STRUCT_STAT *psbuf)
+{
+	uint64_t file_id;
+
+	if (handle->conn->sconn->aapl_zero_file_id) {
+		return 0;
+	}
+
+	if (handle->conn->base_share_dev == psbuf->st_ex_dev) {
+		return (uint64_t)psbuf->st_ex_ino;
+	}
+
+	/* FileIDLow */
+	file_id = ((psbuf->st_ex_ino) & UINT32_MAX);
+
+	/* FileIDHigh */
+	file_id |= ((uint64_t)((psbuf->st_ex_dev) & UINT32_MAX)) << 32;
+
+	return file_id;
+}
+
 static NTSTATUS vfswrap_streaminfo(vfs_handle_struct *handle,
 				   struct files_struct *fsp,
 				   const struct smb_filename *smb_fname,
@@ -3447,6 +3469,7 @@ static struct vfs_fn_pointers vfs_default_fns = {
 	.realpath_fn = vfswrap_realpath,
 	.chflags_fn = vfswrap_chflags,
 	.file_id_create_fn = vfswrap_file_id_create,
+	.fs_file_id_fn = vfswrap_fs_file_id,
 	.streaminfo_fn = vfswrap_streaminfo,
 	.get_real_filename_fn = vfswrap_get_real_filename,
 	.connectpath_fn = vfswrap_connectpath,
diff --git a/source3/smbd/proto.h b/source3/smbd/proto.h
index 23c59000da1..1dd1a8dbef4 100644
--- a/source3/smbd/proto.h
+++ b/source3/smbd/proto.h
@@ -1161,7 +1161,6 @@ int sys_statvfs(const char *path, vfs_statvfs_struct *statbuf);
 NTSTATUS check_access_fsp(const struct files_struct *fsp,
 			  uint32_t access_mask);
 uint64_t smb_roundup(connection_struct *conn, uint64_t val);
-uint64_t get_fs_file_id(connection_struct *conn, const SMB_STRUCT_STAT *psbuf);
 void aapl_force_zero_file_id(struct smbd_server_connection *sconn);
 bool samba_private_attr_name(const char *unix_ea_name);
 NTSTATUS get_ea_value(TALLOC_CTX *mem_ctx, connection_struct *conn,
diff --git a/source3/smbd/smb2_create.c b/source3/smbd/smb2_create.c
index 55dfb148c8e..61ed72169fb 100644
--- a/source3/smbd/smb2_create.c
+++ b/source3/smbd/smb2_create.c
@@ -1389,8 +1389,9 @@ static void smbd_smb2_create_after_exec(struct tevent_req *req)
 
 	if (state->qfid != NULL) {
 		uint8_t p[32];
-		uint64_t file_id = get_fs_file_id(state->result->conn,
-						  &state->result->fsp_name->st);
+		uint64_t file_id = SMB_VFS_FS_FILE_ID(
+			state->result->conn,
+			&state->result->fsp_name->st);
 		DATA_BLOB blob = data_blob_const(p, sizeof(p));
 
 		ZERO_STRUCT(p);
diff --git a/source3/smbd/trans2.c b/source3/smbd/trans2.c
index a268e97218f..9a2ae9b2f47 100644
--- a/source3/smbd/trans2.c
+++ b/source3/smbd/trans2.c
@@ -213,27 +213,6 @@ uint64_t smb_roundup(connection_struct *conn, uint64_t val)
 	return val;
 }
 
-/********************************************************************
- Create a 64 bit FileIndex. If the file is on the same device as
- the root of the share, just return the 64-bit inode. If it isn't,
- mangle as we used to do.
-********************************************************************/
-
-uint64_t get_fs_file_id(connection_struct *conn, const SMB_STRUCT_STAT *psbuf)
-{
-	uint64_t file_id;
-	if (conn->sconn->aapl_zero_file_id) {
-		return 0;
-	}
-	if (conn->base_share_dev == psbuf->st_ex_dev) {
-		return (uint64_t)psbuf->st_ex_ino;
-	}
-	file_id = ((psbuf->st_ex_ino) & UINT32_MAX); /* FileIDLow */
-	file_id |= ((uint64_t)((psbuf->st_ex_dev) & UINT32_MAX)) << 32; /* FileIDHigh */
-	return file_id;
-}
-
-
 /********************************************************************
  Globally (for this connection / multi-channel) disable file-ID
  calculation. This is required to be global because it serves
@@ -1863,7 +1842,7 @@ static NTSTATUS smbd_marshall_dir_entry(TALLOC_CTX *ctx,
 		}
 	}
 
-	file_id = get_fs_file_id(conn, &smb_fname->st);
+	file_id = SMB_VFS_FS_FILE_ID(conn, &smb_fname->st);
 
 	mdate_ts = smb_fname->st.st_ex_mtime;
 	adate_ts = smb_fname->st.st_ex_atime;
@@ -5231,7 +5210,7 @@ NTSTATUS smbd_do_qfilepathinfo(connection_struct *conn,
 
 	   I think this causes us to fail the IFSKIT
 	   BasicFileInformationTest. -tpot */
-	file_id = get_fs_file_id(conn, psbuf);
+	file_id = SMB_VFS_FS_FILE_ID(conn, psbuf);
 
 	*fixed_portion = 0;
 
-- 
2.21.0


From 2fbed49880b4228cbdbafec04fceab548cba3f50 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Thu, 27 Jun 2019 14:46:37 +0200
Subject: [PATCH 17/22] s3:smbd: use stored file_id in SMB_VFS_FS_FILE_ID()

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/modules/vfs_default.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/source3/modules/vfs_default.c b/source3/modules/vfs_default.c
index dcb53c64eef..bcad1c8a736 100644
--- a/source3/modules/vfs_default.c
+++ b/source3/modules/vfs_default.c
@@ -2737,6 +2737,10 @@ static uint64_t vfswrap_fs_file_id(struct vfs_handle_struct *handle,
 		return 0;
 	}
 
+	if (!(psbuf->st_ex_iflags & ST_EX_IFLAG_CALCULATED_ITIME)) {
+		return psbuf->st_ex_file_id;
+	}
+
 	if (handle->conn->base_share_dev == psbuf->st_ex_dev) {
 		return (uint64_t)psbuf->st_ex_ino;
 	}
-- 
2.21.0


From cd8364232221f482cedde2415773fcb307731cca Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Thu, 27 Jun 2019 14:47:57 +0200
Subject: [PATCH 18/22] s3:smbd: set file_id in fetch_dos_mode_done()

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/smbd/smb2_query_directory.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/source3/smbd/smb2_query_directory.c b/source3/smbd/smb2_query_directory.c
index 13fb820ce6c..d433f2bee42 100644
--- a/source3/smbd/smb2_query_directory.c
+++ b/source3/smbd/smb2_query_directory.c
@@ -1021,8 +1021,11 @@ static void fetch_dos_mode_done(struct tevent_req *subreq)
 	uint32_t dfs_dosmode;
 	uint32_t dosmode;
 	struct timespec btime_ts = {0};
+	bool need_file_id = false;
+	uint64_t file_id;
 	off_t dosmode_off;
 	off_t btime_off;
+	off_t file_id_off;
 	NTSTATUS status;
 
 	status = dos_mode_at_recv(subreq, &dosmode);
@@ -1074,6 +1077,30 @@ static void fetch_dos_mode_done(struct tevent_req *subreq)
 			       (char *)state->entry_marshall_buf + btime_off,
 			       btime_ts);
 
+	switch (state->info_level) {
+	case SMB_FIND_ID_BOTH_DIRECTORY_INFO:
+		file_id_off = 96;
+		need_file_id = true;
+		break;
+	case SMB_FIND_ID_FULL_DIRECTORY_INFO:
+		file_id_off = 72;
+		need_file_id = true;
+		break;
+	default:
+		break;
+	}
+
+	if (need_file_id) {
+		/*
+		 * File-ID might have been updated from calculated (based on
+		 * inode) to storage based, fetch via DOS attributes in
+		 * vfs_default.
+		 */
+		file_id = SMB_VFS_FS_FILE_ID(state->dir_fsp->conn,
+					     &state->smb_fname->st);
+		SBVAL(state->entry_marshall_buf, file_id_off, file_id);
+	}
+
 	tevent_req_done(req);
 	return;
 }
-- 
2.21.0


From 5e3d01a825596829b2b823b43070d7987194e359 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Sat, 29 Jun 2019 14:35:49 +0200
Subject: [PATCH 19/22] vfs_fruit: move zero file-id to vfs_fruit

Now that this stuff goes through the VFS, let's do it right. :)

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 source3/modules/vfs_default.c |  4 ----
 source3/modules/vfs_fruit.c   | 20 +++++++++++++++++---
 source3/smbd/globals.h        |  1 -
 source3/smbd/proto.h          |  1 -
 source3/smbd/trans2.c         | 10 ----------
 5 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/source3/modules/vfs_default.c b/source3/modules/vfs_default.c
index bcad1c8a736..68d9200ce88 100644
--- a/source3/modules/vfs_default.c
+++ b/source3/modules/vfs_default.c
@@ -2733,10 +2733,6 @@ static uint64_t vfswrap_fs_file_id(struct vfs_handle_struct *handle,
 {
 	uint64_t file_id;
 
-	if (handle->conn->sconn->aapl_zero_file_id) {
-		return 0;
-	}
-
 	if (!(psbuf->st_ex_iflags & ST_EX_IFLAG_CALCULATED_ITIME)) {
 		return psbuf->st_ex_file_id;
 	}
diff --git a/source3/modules/vfs_fruit.c b/source3/modules/vfs_fruit.c
index 9916bd12f5a..02b6d0dc0f6 100644
--- a/source3/modules/vfs_fruit.c
+++ b/source3/modules/vfs_fruit.c
@@ -2980,9 +2980,6 @@ static NTSTATUS check_aapl(vfs_handle_struct *handle,
 				      blob);
 	if (NT_STATUS_IS_OK(status)) {
 		global_fruit_config.nego_aapl = true;
-		if (config->aapl_zero_file_id) {
-			aapl_force_zero_file_id(handle->conn->sconn);
-		}
 	}
 
 	return status;
@@ -7135,6 +7132,22 @@ static uint64_t fruit_disk_free(vfs_handle_struct *handle,
 	return dfree / 2;
 }
 
+static uint64_t fruit_fs_file_id(struct vfs_handle_struct *handle,
+				 const SMB_STRUCT_STAT *psbuf)
+{
+	struct fruit_config_data *config = NULL;
+
+	SMB_VFS_HANDLE_GET_DATA(handle, config,
+				struct fruit_config_data,
+				return 0);
+
+	if (config->aapl_zero_file_id) {
+		return 0;
+	}
+
+	return SMB_VFS_NEXT_FS_FILE_ID(handle, psbuf);
+}
+
 static struct vfs_fn_pointers vfs_fruit_fns = {
 	.connect_fn = fruit_connect,
 	.disk_free_fn = fruit_disk_free,
@@ -7166,6 +7179,7 @@ static struct vfs_fn_pointers vfs_fruit_fns = {
 	.offload_read_recv_fn = fruit_offload_read_recv,
 	.offload_write_send_fn = fruit_offload_write_send,
 	.offload_write_recv_fn = fruit_offload_write_recv,
+	.fs_file_id_fn = fruit_fs_file_id,
 
 	/* NT ACL operations */
 	.fget_nt_acl_fn = fruit_fget_nt_acl,
diff --git a/source3/smbd/globals.h b/source3/smbd/globals.h
index f0c1624babe..03d50882d16 100644
--- a/source3/smbd/globals.h
+++ b/source3/smbd/globals.h
@@ -858,7 +858,6 @@ struct smbd_server_connection {
 	struct messaging_context *msg_ctx;
 	struct notify_context *notify_ctx;
 	bool using_smb2;
-	bool aapl_zero_file_id; /* Apple-specific */
 	int trans_num;
 
 	size_t num_users;
diff --git a/source3/smbd/proto.h b/source3/smbd/proto.h
index 1dd1a8dbef4..112acfa4ad4 100644
--- a/source3/smbd/proto.h
+++ b/source3/smbd/proto.h
@@ -1161,7 +1161,6 @@ int sys_statvfs(const char *path, vfs_statvfs_struct *statbuf);
 NTSTATUS check_access_fsp(const struct files_struct *fsp,
 			  uint32_t access_mask);
 uint64_t smb_roundup(connection_struct *conn, uint64_t val);
-void aapl_force_zero_file_id(struct smbd_server_connection *sconn);
 bool samba_private_attr_name(const char *unix_ea_name);
 NTSTATUS get_ea_value(TALLOC_CTX *mem_ctx, connection_struct *conn,
 			files_struct *fsp,
diff --git a/source3/smbd/trans2.c b/source3/smbd/trans2.c
index 9a2ae9b2f47..4f183ecd601 100644
--- a/source3/smbd/trans2.c
+++ b/source3/smbd/trans2.c
@@ -213,16 +213,6 @@ uint64_t smb_roundup(connection_struct *conn, uint64_t val)
 	return val;
 }
 
-/********************************************************************
- Globally (for this connection / multi-channel) disable file-ID
- calculation. This is required to be global because it serves
- Macs in AAPL mode, which is globally set.
-********************************************************************/
-void aapl_force_zero_file_id(struct smbd_server_connection *sconn)
-{
-	sconn->aapl_zero_file_id = true;
-}
-
 /****************************************************************************
  Utility functions for dealing with extended attributes.
 ****************************************************************************/
-- 
2.21.0


From 16f8faf8fe070cf49547cb38db4c22574f0a3e89 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Sun, 30 Jun 2019 14:24:59 +0200
Subject: [PATCH 20/22] vfs_fruit: make "fruit:zero_file_id" a per share option

Now that File-ID calculation goes through the VFS, we can nicely make a
per-share option out of it.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 docs-xml/manpages/vfs_fruit.8.xml | 33 +++++++++++++++----------------
 selftest/target/Samba3.pm         |  7 +++++++
 source3/modules/vfs_fruit.c       |  7 +++++--
 source3/selftest/tests.py         |  2 +-
 4 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/docs-xml/manpages/vfs_fruit.8.xml b/docs-xml/manpages/vfs_fruit.8.xml
index c5bd593a139..364b1536f66 100644
--- a/docs-xml/manpages/vfs_fruit.8.xml
+++ b/docs-xml/manpages/vfs_fruit.8.xml
@@ -143,23 +143,6 @@
 	    </listitem>
 	  </varlistentry>
 
-	  <varlistentry>
-	    <term>fruit:zero_file_id = yes | no</term>
-	    <listitem>
-	      <para>A <emphasis>global</emphasis> option whether to return
-	      zero to queries of on-disk file identifier, if the client
-	      has negotiated AAPL.</para>
-	      <para>Mac applications and / or the Mac SMB
-	      client code expect the on-disk file identifier to have the
-	      semantics of HFS+ Catalog Node Identifier (CNID). Samba
-	      doesn't provide those semantics, and that occasionally cause
-	      usability issues or even data loss. Returning a file identifier
-	      of zero causes the Mac client to stop using and trusting the
-	      file id returned from the server.</para>
-	      <para>The default is <emphasis>yes</emphasis>.</para>
-	    </listitem>
-	  </varlistentry>
-
 	  <varlistentry>
 	    <term>fruit:model = MacSamba</term>
 	    <listitem>
@@ -407,6 +390,22 @@
 	    </listitem>
 	  </varlistentry>
 
+	  <varlistentry>
+	    <term>fruit:zero_file_id = yes | no</term>
+	    <listitem>
+	      <para>Whether to return zero to queries of on-disk file
+	      identifier if the client has negotiated AAPL.</para>
+	      <para>Mac applications and / or the Mac SMB client code expect the
+	      on-disk file identifier to have the semantics of HFS+ Catalog Node
+	      Identifier (CNID). Samba provides File-IDs based on a file's
+	      initial creation date if the option <smbconfoption name="store dos
+	      attributes"/> is enabled.  Returning a file identifier of
+	      zero causes the Mac client to stop using and trusting the file id
+	      returned from the server.</para>
+	      <para>The default is <emphasis>yes</emphasis>.</para>
+	    </listitem>
+	  </varlistentry>
+
 	</variablelist>
 </refsect1>
 
diff --git a/selftest/target/Samba3.pm b/selftest/target/Samba3.pm
index 34a9864cd48..6ce61a8b4ed 100755
--- a/selftest/target/Samba3.pm
+++ b/selftest/target/Samba3.pm
@@ -1995,6 +1995,13 @@ sub provision($$$$$$$$$)
 	fruit:delete_empty_adfiles = true
 	fruit:veto_appledouble = no
 
+[vfs_fruit_zero_fileid]
+	path = $shrdir
+	vfs objects = fruit streams_xattr acl_xattr xattr_tdb
+	fruit:resource = file
+	fruit:metadata = stream
+	fruit:zero_file_id=yes
+
 [badname-tmp]
 	path = $badnames_shrdir
 	guest ok = yes
diff --git a/source3/modules/vfs_fruit.c b/source3/modules/vfs_fruit.c
index 02b6d0dc0f6..ea97cb93b30 100644
--- a/source3/modules/vfs_fruit.c
+++ b/source3/modules/vfs_fruit.c
@@ -2225,7 +2225,8 @@ static int init_fruit_config(vfs_handle_struct *handle)
 		SNUM(handle->conn), FRUIT_PARAM_TYPE_NAME, "posix_rename", true);
 
 	config->aapl_zero_file_id =
-	    lp_parm_bool(-1, FRUIT_PARAM_TYPE_NAME, "zero_file_id", true);
+	    lp_parm_bool(SNUM(handle->conn), FRUIT_PARAM_TYPE_NAME,
+			 "zero_file_id", true);
 
 	config->readdir_attr_rsize = lp_parm_bool(
 		SNUM(handle->conn), "readdir_attr", "aapl_rsize", true);
@@ -7141,7 +7142,9 @@ static uint64_t fruit_fs_file_id(struct vfs_handle_struct *handle,
 				struct fruit_config_data,
 				return 0);
 
-	if (config->aapl_zero_file_id) {
+	if (global_fruit_config.nego_aapl &&
+	    config->aapl_zero_file_id)
+	{
 		return 0;
 	}
 
diff --git a/source3/selftest/tests.py b/source3/selftest/tests.py
index a3cd890e903..5ef227732be 100755
--- a/source3/selftest/tests.py
+++ b/source3/selftest/tests.py
@@ -616,7 +616,7 @@ tests = base + raw + smb2 + rpc + unix + local + rap + nbt + libsmbclient + idma
     elif t == "vfs.fruit_timemachine":
         plansmbtorture4testsuite(t, "nt4_dc", '//$SERVER_IP/vfs_fruit_timemachine -U$USERNAME%$PASSWORD --option=torture:localdir=$SELFTEST_PREFIX/nt4_dc/share')
     elif t == "vfs.fruit_file_id":
-        plansmbtorture4testsuite(t, "nt4_dc", '//$SERVER_IP/vfs_fruit -U$USERNAME%$PASSWORD')
+        plansmbtorture4testsuite(t, "nt4_dc", '//$SERVER_IP/vfs_fruit_zero_fileid -U$USERNAME%$PASSWORD')
     elif t == "vfs.fruit_conversion":
         plansmbtorture4testsuite(t, "nt4_dc", '//$SERVER_IP/tmp -U$USERNAME%$PASSWORD --option=torture:share2=vfs_fruit_wipe_intentionally_left_blank_rfork --option=torture:delete_empty_adfiles=false', 'wipe_intentionally_left_blank_rfork')
         plansmbtorture4testsuite(t, "nt4_dc", '//$SERVER_IP/tmp -U$USERNAME%$PASSWORD --option=torture:share2=vfs_fruit_delete_empty_adfiles --option=torture:delete_empty_adfiles=true', 'delete_empty_adfiles')
-- 
2.21.0


From e82699fd43f99880cbaa4879437ba6b4c05966f7 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Sun, 30 Jun 2019 13:33:39 +0200
Subject: [PATCH 21/22] vfs_fruit: change default for "fruit:zero_file_id" to
 false

Now that we have reliable File-IDs, change the default for the option
"zero_file_id" to false.

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 WHATSNEW.txt                | 1 +
 source3/modules/vfs_fruit.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/WHATSNEW.txt b/WHATSNEW.txt
index 3a5d978d6ee..7ba0dbeca13 100644
--- a/WHATSNEW.txt
+++ b/WHATSNEW.txt
@@ -110,6 +110,7 @@ smb.conf changes
   --------------                     -----------                -------
 
   web port                           Removed
+  fruit:zero_file_id                 Changed default            False
 
 
 KNOWN ISSUES
diff --git a/source3/modules/vfs_fruit.c b/source3/modules/vfs_fruit.c
index ea97cb93b30..42beed2143f 100644
--- a/source3/modules/vfs_fruit.c
+++ b/source3/modules/vfs_fruit.c
@@ -2226,7 +2226,7 @@ static int init_fruit_config(vfs_handle_struct *handle)
 
 	config->aapl_zero_file_id =
 	    lp_parm_bool(SNUM(handle->conn), FRUIT_PARAM_TYPE_NAME,
-			 "zero_file_id", true);
+			 "zero_file_id", false);
 
 	config->readdir_attr_rsize = lp_parm_bool(
 		SNUM(handle->conn), "readdir_attr", "aapl_rsize", true);
-- 
2.21.0


From 13bba02ba0d456ed4e78d821b6120a46a06c19b6 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Thu, 27 Jun 2019 09:38:57 +0200
Subject: [PATCH 22/22] selftest: add a test that itime is not set when setting
 DOS attrs

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 selftest/target/Samba4.pm          |  5 ++++
 source3/script/tests/test_itime.sh | 39 ++++++++++++++++++++++++++++++
 source3/selftest/tests.py          |  2 ++
 3 files changed, 46 insertions(+)
 create mode 100755 source3/script/tests/test_itime.sh

diff --git a/selftest/target/Samba4.pm b/selftest/target/Samba4.pm
index 59ea6f38e18..32de94cf21f 100755
--- a/selftest/target/Samba4.pm
+++ b/selftest/target/Samba4.pm
@@ -1215,6 +1215,11 @@ sub provision($$$$$$$$$$)
 	fruit:locking = netatalk
 	fruit:encoding = native
 
+[xattr]
+	path = $ctx->{share}
+        # This can be used for testing real fs xattr stuff
+	vfs objects = streams_xattr acl_xattr
+
 $extra_smbconf_shares
 ";
 
diff --git a/source3/script/tests/test_itime.sh b/source3/script/tests/test_itime.sh
new file mode 100755
index 00000000000..c457da9906b
--- /dev/null
+++ b/source3/script/tests/test_itime.sh
@@ -0,0 +1,39 @@
+#!/bin/sh
+
+# this tests immutable birthtime
+
+if [ $# != 6 ]; then
+cat <<EOF
+Usage: $0 SERVER USERNAME PASSWORD LOCAL_PATH SMBCLIENT SHARE
+EOF
+exit 1
+fi
+
+SERVER="$1"
+USERNAME="$2"
+PASSWORD="$3"
+LOCAL_PATH="$4"
+SMBCLIENT="$5"
+SHARE="$6"
+SAMBATOOL="$BINDIR/samba-tool"
+
+incdir=`dirname $0`/../../../testprogs/blackbox
+. $incdir/subunit.sh
+
+# Show that setting DOS attributes on a locally created file, therefore lacking
+# a DOS xattr and an itime, doesn't set an itime
+no_itime_on_local_file() {
+    fname="tmp.$$"
+    local_fname="$LOCAL_PATH/$fname"
+    touch $local_fname || return 1
+
+    $SMBCLIENT //$SERVER/$SHARE -U $USERNAME%$PASSWORD -c "setmode $fname +h" || return 1
+
+    dosinfo=$($SAMBATOOL ntacl getdosinfo $local_fname) || return 1
+    echo $dosinfo | grep -q "xattr_DosInfo4" || return 1
+    echo $dosinfo | grep -q "1: XATTR_DOSINFO_ATTRIB" || return 1
+    echo $dosinfo | grep -q "1: XATTR_DOSINFO_CREATE_TIME" || return 1
+    echo $dosinfo | grep -q "0: XATTR_DOSINFO_ITIME" || return 1
+}
+
+testit "no_itime_on_local_file" no_itime_on_local_file
diff --git a/source3/selftest/tests.py b/source3/selftest/tests.py
index 5ef227732be..1394dc456b2 100755
--- a/source3/selftest/tests.py
+++ b/source3/selftest/tests.py
@@ -832,3 +832,5 @@ plansmbtorture4testsuite('rpc.fsrvp', 'nt4_dc:local', 'ncacn_np:$SERVER_IP[/pipe
     plantestsuite("samba3.blackbox.guest (%s)" % env , env,
                   [os.path.join(samba3srcdir, "script/tests/test_guest_auth.sh"),
                    '$SERVER', smbclient3, smbcontrol, net, configuration])
+
+plantestsuite("samba3.blackbox.itime", "ad_dc", [os.path.join(samba3srcdir, "script/tests/test_itime.sh"), '$SERVER', '$USERNAME', '$PASSWORD', '$LOCAL_PATH', smbclient3, 'xattr'])
-- 
2.21.0


--------------02D36DE835737C4CAC771312--

