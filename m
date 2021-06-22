Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B06963B0D5A
	for <lists+samba-technical@lfdr.de>; Tue, 22 Jun 2021 21:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Y1SGpz7niQeuXIA1UfJ4nAxjxBzGboS4Z9yUl1iaXVE=; b=2+XSxX/GU5A0Nv+dhpmY1lJp2Q
	hxYwBV3lTkEWSp56fJRCHJffZrc4lh72RXI5k1EgfzsxBO+9GloR96Tvbc6l571VKJuI25H0zdeOa
	91kcM6XiTHPtixcerkyAZM7daKUIMqtjzpcrlbzFCqM9ZOKjMIAVtC2Lk5sMO2VKYvgPVhgaO33Lj
	S3Z25B00DKzOIoiU3wcs001VCrcfac3oE4L1cDRiHcqE3WAEQukqdWX7l5JoYHNu2rZMu7LtV5/k3
	tNWRJCkmzRYlmvHuZT8CMaaqe/f9wOAXy5f4ENXaAD5d4kFVV4vPLYQMLjq/WVVbfsj3SRq2+pwJ7
	HTaQ7MqQ==;
Received: from ip6-localhost ([::1]:40020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lvldA-007fjS-Hs; Tue, 22 Jun 2021 19:00:17 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133]:34567) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lvld1-007fjH-KA
 for samba-technical@lists.samba.org; Tue, 22 Jun 2021 19:00:13 +0000
Received: by mail-lf1-x133.google.com with SMTP id f30so37701575lfj.1
 for <samba-technical@lists.samba.org>; Tue, 22 Jun 2021 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=Y1SGpz7niQeuXIA1UfJ4nAxjxBzGboS4Z9yUl1iaXVE=;
 b=hs1+jspUFwBSZbmzwjYPlxO3/dyB6bA0gzzvHC5exBwvwgKjVjNkVznFhWpwvEuWqz
 MxBsI+bl7tEunjwr9Zl65ZM4ZIG4f7eofAgzuaP+b/m27CraIfa8YI0Kb8VPlWhImduA
 r2RyJUt8EYZ0KVS/6KV8CC5rjn0sZBIKEk2dKwu+/sESVARO00iX1jXzKIvDhaplwxfk
 ArrEi3H4mDi+7VDumhRTqnjTdNFTviGCdZXfoycktD2d0xQUT0Q5QOCpU/g3PLGy6bkD
 Y90yA1mRh75qcjmRKfPirDZAAlXPj6jrLC4FLZJaT8c6ZVCmyrLcu7s5jwAgnOd5NpTo
 PZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=Y1SGpz7niQeuXIA1UfJ4nAxjxBzGboS4Z9yUl1iaXVE=;
 b=ntyBVB+AFyNQORqcvcYcYjHch5bguSNUvtFjRXDll4GROZK268ZWH/PMcXgsIgsUMG
 mIoZ7bdh34kFolhPmuNIBeQMqsQyWJuvzAvhuYXtuEwgW65m+60wM64toAVLj1KlFzXT
 YOS8oZgo7elzIoXxQKtGTWzWHZ9VXgo0yYLBQpHOGmE5XZvaTNLVihNU2XirwTs8PF6i
 9guXJCil9v3Ft2bSig+r4LB7EBJ2zQbp4cqVfEfITL9wLOAEx7iB4k8xiQhaFZOwtWGE
 2WhWZvX0fn0XWO8tRtP3BsRdWLKSDwydjvWuph+mda7Lwdt1N+r97vw5TaMxGVGCibHm
 k9KA==
X-Gm-Message-State: AOAM533aN0VMXeuTKGtS36jIKPHAJvqPjZYChvNB8KkzhITBv1zlutr0
 A6UI4pPBsv8hQMim3SljO8UobsKzRgHAB4YOPmg=
X-Google-Smtp-Source: ABdhPJyggIrON9JS6dCdKkp7fiLzYpLXDwB4DCZewYN5NHk3asFWPeFt5Sv67gtoF4+MhTq5KsOYmL1F1uTjWGmU1OA=
X-Received: by 2002:ac2:419a:: with SMTP id z26mr3977783lfh.307.1624388404772; 
 Tue, 22 Jun 2021 12:00:04 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 22 Jun 2021 13:59:53 -0500
Message-ID: <CAH2r5mtAf73mMnjYbs67K2KsnZpzQRjxD+VvYBiwS4PWO7W_Qw@mail.gmail.com>
Subject: [PATCH][CIFS] Add new info level for query directory
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>, 
 COMMON INTERNET FILE SYSTEM SERVER <linux-cifsd-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

SMB3: Add new info level for query directory

The recently updated MS-SMB2 (June 2021) added protocol definitions
for a new level 60 for query directory (FileIdExtdDirectoryInformation).

Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/cifs/readdir.c |  2 +-
 fs/cifs/smb2pdu.h | 39 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/fs/cifs/readdir.c b/fs/cifs/readdir.c
index 00b6b953d13c..bfee176b901d 100644
--- a/fs/cifs/readdir.c
+++ b/fs/cifs/readdir.c
@@ -309,7 +309,7 @@ static void cifs_fulldir_info_to_fattr(struct
cifs_fattr *fattr,
 {
  __dir_info_to_fattr(fattr, info);

- /* See MS-FSCC 2.4.18 FileIdFullDirectoryInformation */
+ /* See MS-FSCC 2.4.19 FileIdFullDirectoryInformation */
  if (fattr->cf_cifsattrs & ATTR_REPARSE)
  fattr->cf_cifstag = le32_to_cpu(info->EaSize);
  cifs_fill_common_info(fattr, cifs_sb);
diff --git a/fs/cifs/smb2pdu.h b/fs/cifs/smb2pdu.h
index 653486243cdf..a5c48b85549a 100644
--- a/fs/cifs/smb2pdu.h
+++ b/fs/cifs/smb2pdu.h
@@ -264,7 +264,7 @@ struct share_redirect_error_context_rsp {
  __le32 NotificationType;
  __le32 ResourceNameOffset;
  __le32 ResourceNameLength;
- __le16 Flags;
+ __le16 Reserved;
  __le16 TargetType;
  __le32 IPAddrCount;
  struct move_dst_ipaddr IpAddrMoveList[];
@@ -1448,6 +1448,22 @@ struct smb2_echo_rsp {

 #define SMB2_QUERY_DIRECTORY_IOV_SIZE 2

+/*
+ * Valid FileInformation classes.
+ *
+ * Note that these are a subset of the (file) QUERY_INFO levels defined
+ * later in this file (but since QUERY_DIRECTORY uses equivalent numbers
+ * we do not redefine them here)
+ *
+ * FileDirectoryInfomation 0x01
+ * FileFullDirectoryInformation 0x02
+ * FileIdFullDirectoryInformation 0x26
+ * FileBothDirectoryInformation 0x03
+ * FileIdBothDirectoryInformation 0x25
+ * FileNamesInformation 0x0C
+ * FileIdExtdDirectoryInformation 0x3C
+ */
+
 struct smb2_query_directory_req {
  struct smb2_sync_hdr sync_hdr;
  __le16 StructureSize; /* Must be 33 */
@@ -1684,6 +1700,7 @@ struct smb3_fs_vol_info {
 #define FILEID_GLOBAL_TX_DIRECTORY_INFORMATION 50
 #define FILE_STANDARD_LINK_INFORMATION 54
 #define FILE_ID_INFORMATION 59
+#define FILE_ID_EXTD_DIRECTORY_INFORMATION 60

 struct smb2_file_internal_info {
  __le64 IndexNumber;
@@ -1764,13 +1781,31 @@ struct smb2_file_network_open_info {
  __le32 Reserved;
 } __packed; /* level 34 Query also similar returned in close rsp and
open rsp */

-/* See MS-FSCC 2.4.43 */
+/* See MS-FSCC 2.4.21 */
 struct smb2_file_id_information {
  __le64 VolumeSerialNumber;
  __u64  PersistentFileId; /* opaque endianness */
  __u64  VolatileFileId; /* opaque endianness */
 } __packed; /* level 59 */

+/* See MS-FSCC 2.4.18 */
+struct smb2_file_id_extd_directory_info {
+ __le32 NextEntryOffset;
+ __u32 FileIndex;
+ __le64 CreationTime;
+ __le64 LastAccessTime;
+ __le64 LastWriteTime;
+ __le64 ChangeTime;
+ __le64 EndOfFile;
+ __le64 AllocationSize;
+ __le32 FileAttributes;
+ __le32 FileNameLength;
+ __le32 EaSize; /* EA size */
+ __le32 ReparsePointTag; /* valid if FILE_ATTR_REPARSE_POINT set in
FileAttributes */
+ __le64 UniqueId; /* inode num - le since Samba puts ino in low 32 bit */
+ char FileName[1];
+} __packed; /* level 60 */
+
 extern char smb2_padding[7];

 /* equivalent of the contents of SMB3.1.1 POSIX open context response */

-- 
Thanks,

Steve

