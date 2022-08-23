Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5BF59E401
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 15:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=E9ORJYSZYbAzoak3DB6oNeDOw/eyq14PJdfI25alqlE=; b=bKTi9lQTp/IMMNrSAL8GfHimDT
	1xXpvigylYuYq5Yxp0l5eS0es6h7/6iuj1qAzWPSNCXqiGSckNCAuOSR4D3G5hanZTcEWLS1F3r+T
	73SKOVW+7CWDEZI06pSvueL6uuKnzFJI5V4UhlA32eYfDPghg4K93FLTr9mqblOOlLGfE7DP98MfT
	7K6Spr2hLtLbk8P4WzBQT+WTd91jjgZmqVFctNfF9t6x9YiADLbdF3/Srt4+3x5DTWFIKxSX4Uke3
	JeI8ulWtrfU4KO7/A0a9SYuhne+VwoO6CgutcZr5/+HuStzd7vzEqRqsEHJmBWlsk7mFfDZCPesGX
	yUKBVYFA==;
Received: from ip6-localhost ([::1]:35700 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQTdI-0020cN-N4; Tue, 23 Aug 2022 13:07:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20697) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oQTdB-0020cD-2R
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 13:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9ORJYSZYbAzoak3DB6oNeDOw/eyq14PJdfI25alqlE=;
 b=CVZChfYK7DDj8LgulGRHvgCXR2OFn6bDS0PEWAGbKrlFKNbE5+KVdYriVzlS66JtA7vSAv
 EFn32n2pML+hv9zzBBRhJ3XS9qMZI/j32NxzPvEuCgUDqqb1edlymBEHYRmeuvAAF+NsAb
 GpFEi9qSkwR6t8fhlZi4EhrD4gI5GWk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260053;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9ORJYSZYbAzoak3DB6oNeDOw/eyq14PJdfI25alqlE=;
 b=CVZChfYK7DDj8LgulGRHvgCXR2OFn6bDS0PEWAGbKrlFKNbE5+KVdYriVzlS66JtA7vSAv
 EFn32n2pML+hv9zzBBRhJ3XS9qMZI/j32NxzPvEuCgUDqqb1edlymBEHYRmeuvAAF+NsAb
 GpFEi9qSkwR6t8fhlZi4EhrD4gI5GWk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-187-hJ7USIJtNyOnShiPXKs8ZQ-1; Tue, 23 Aug 2022 09:07:30 -0400
X-MC-Unique: hJ7USIJtNyOnShiPXKs8ZQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B22FA3826A48;
 Tue, 23 Aug 2022 13:07:29 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92154492D1A;
 Tue, 23 Aug 2022 13:07:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 1/5] smb3: Move the flush out of smb2_copychunk_range() into
 its callers
To: sfrench@samba.org, linux-cifs@vger.kernel.org
Date: Tue, 23 Aug 2022 14:07:28 +0100
Message-ID: <166126004796.548536.8555773200873112505.stgit@warthog.procyon.org.uk>
In-Reply-To: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
References: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
From: David Howells via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Howells <dhowells@redhat.com>
Cc: samba-technical@lists.samba.org, jlayton@kernel.org,
 linux-kernel@vger.kernel.org, willy@infradead.org, lsahlber@redhat.com,
 dchinner@redhat.com, linux-fsdevel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Move the flush out of smb2_copychunk_range() into its callers.  This will
allow the pagecache to be invalidated between the flush and the operation
in smb3_collapse_range() and smb3_insert_range().

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <stfrench@microsoft.com>
cc: Ronnie Sahlberg <lsahlber@redhat.com>
---

 fs/cifs/cifsfs.c  |    2 ++
 fs/cifs/smb2ops.c |   20 ++++++++------------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
index f54d8bf2732a..e9fb338b8e7e 100644
--- a/fs/cifs/cifsfs.c
+++ b/fs/cifs/cifsfs.c
@@ -1219,6 +1219,8 @@ ssize_t cifs_file_copychunk_range(unsigned int xid,
 
 	cifs_dbg(FYI, "copychunk range\n");
 
+	filemap_write_and_wait(src_inode->i_mapping);
+
 	if (!src_file->private_data || !dst_file->private_data) {
 		rc = -EBADF;
 		cifs_dbg(VFS, "missing cifsFileInfo on copy range src file\n");
diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 96f3b0573606..7e3de6a0e1dc 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -1600,17 +1600,8 @@ smb2_copychunk_range(const unsigned int xid,
 	int chunks_copied = 0;
 	bool chunk_sizes_updated = false;
 	ssize_t bytes_written, total_bytes_written = 0;
-	struct inode *inode;
 
 	pcchunk = kmalloc(sizeof(struct copychunk_ioctl), GFP_KERNEL);
-
-	/*
-	 * We need to flush all unwritten data before we can send the
-	 * copychunk ioctl to the server.
-	 */
-	inode = d_inode(trgtfile->dentry);
-	filemap_write_and_wait(inode->i_mapping);
-
 	if (pcchunk == NULL)
 		return -ENOMEM;
 
@@ -3689,6 +3680,8 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
 		goto out;
 	}
 
+	filemap_write_and_wait(inode->i_mapping);
+
 	rc = smb2_copychunk_range(xid, cfile, cfile, off + len,
 				  i_size_read(inode) - off - len, off);
 	if (rc < 0)
@@ -3716,18 +3709,21 @@ static long smb3_insert_range(struct file *file, struct cifs_tcon *tcon,
 	int rc;
 	unsigned int xid;
 	struct cifsFileInfo *cfile = file->private_data;
+	struct inode *inode = file_inode(file);
 	__le64 eof;
 	__u64  count;
 
 	xid = get_xid();
 
-	if (off >= i_size_read(file->f_inode)) {
+	if (off >= i_size_read(inode)) {
 		rc = -EINVAL;
 		goto out;
 	}
 
-	count = i_size_read(file->f_inode) - off;
-	eof = cpu_to_le64(i_size_read(file->f_inode) + len);
+	count = i_size_read(inode) - off;
+	eof = cpu_to_le64(i_size_read(inode) + len);
+
+	filemap_write_and_wait(inode->i_mapping);
 
 	rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
 			  cfile->fid.volatile_fid, cfile->pid, &eof);



