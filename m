Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0B259E405
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 15:09:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=9xAYAAOCpEEEwELWePUFnuDfySASzSuNbOm12cspl+0=; b=SrIbtI5fAwNOLXqqUmirwLtw8t
	Ksdsj6QHZGcKfhGLbZizjfi0CEJoZrEtoLZ6jCKYG9EwqdbPZAPXk+jHRrN2UXkN/AEqVdTNfIJHj
	c/jo5GfrNd/D+w8dCwkYBDPk5lyMDvdf3y9p07jMqHrSm2wDF2BKJB+vQ52p7aRvzASxukHZwXUem
	jPJQp2XyxNMjPynGiHNneDUT7l0UDdN1BHXjl+dtcmMZt4Sci3r9Yp+JkTW3VlrVU0iydck7WOcga
	ef9uimH7uos4i8uGb5W+4ewyE45AdxSzQz8KyEuzdneIL1wQOpjdUMJEMiIsDyiewpaPQgaqWB8kL
	jI5rlhhg==;
Received: from ip6-localhost ([::1]:39580 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQTeY-0020zL-Qz; Tue, 23 Aug 2022 13:09:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56927) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oQTeS-0020uT-P5
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 13:09:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xAYAAOCpEEEwELWePUFnuDfySASzSuNbOm12cspl+0=;
 b=MYSzX5JFDz6mmaleqPjohfL6O5Pk2sTUUzektHnqC/HNa6YDZUtaQbhPZn0IsmvtHkcltJ
 VFrzeuPieV7oYal2Opc5Z/EaDPLzvyVjxrmtCaWMUBemBEf0db68Mo/ikGfzz+DugqsnWZ
 JLgASRs4lvi3YugqPE5xv45hPyu0510=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xAYAAOCpEEEwELWePUFnuDfySASzSuNbOm12cspl+0=;
 b=MYSzX5JFDz6mmaleqPjohfL6O5Pk2sTUUzektHnqC/HNa6YDZUtaQbhPZn0IsmvtHkcltJ
 VFrzeuPieV7oYal2Opc5Z/EaDPLzvyVjxrmtCaWMUBemBEf0db68Mo/ikGfzz+DugqsnWZ
 JLgASRs4lvi3YugqPE5xv45hPyu0510=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-434-chscAqNLNMC1MwvnguUTyg-1; Tue, 23 Aug 2022 09:07:37 -0400
X-MC-Unique: chscAqNLNMC1MwvnguUTyg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB11029AB449;
 Tue, 23 Aug 2022 13:07:36 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7003118EA8;
 Tue, 23 Aug 2022 13:07:35 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 2/5] smb3: missing inode locks in zero range
To: sfrench@samba.org, linux-cifs@vger.kernel.org
Date: Tue, 23 Aug 2022 14:07:34 +0100
Message-ID: <166126005487.548536.8031989219056277959.stgit@warthog.procyon.org.uk>
In-Reply-To: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
References: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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

smb3 fallocate zero range was not grabbing the inode or filemap_invalidate
locks so could have race with pagemap reinstantiating the page.

Cc: stable@vger.kernel.org
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Steve French <stfrench@microsoft.com>
---

 fs/cifs/smb2ops.c |   55 +++++++++++++++++++++++++++++------------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 7e3de6a0e1dc..1c5a93ced946 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -3298,26 +3298,43 @@ get_smb2_acl(struct cifs_sb_info *cifs_sb,
 	return pntsd;
 }
 
+static long smb3_zero_data(struct file *file, struct cifs_tcon *tcon,
+			     loff_t offset, loff_t len, unsigned int xid)
+{
+	struct cifsFileInfo *cfile = file->private_data;
+	struct file_zero_data_information fsctl_buf;
+
+	cifs_dbg(FYI, "Offset %lld len %lld\n", offset, len);
+
+	fsctl_buf.FileOffset = cpu_to_le64(offset);
+	fsctl_buf.BeyondFinalZero = cpu_to_le64(offset + len);
+
+	return SMB2_ioctl(xid, tcon, cfile->fid.persistent_fid,
+			  cfile->fid.volatile_fid, FSCTL_SET_ZERO_DATA,
+			  (char *)&fsctl_buf,
+			  sizeof(struct file_zero_data_information),
+			  0, NULL, NULL);
+}
+
 static long smb3_zero_range(struct file *file, struct cifs_tcon *tcon,
 			    loff_t offset, loff_t len, bool keep_size)
 {
 	struct cifs_ses *ses = tcon->ses;
-	struct inode *inode;
-	struct cifsInodeInfo *cifsi;
+	struct inode *inode = file_inode(file);
+	struct cifsInodeInfo *cifsi = CIFS_I(inode);
 	struct cifsFileInfo *cfile = file->private_data;
-	struct file_zero_data_information fsctl_buf;
 	long rc;
 	unsigned int xid;
 	__le64 eof;
 
 	xid = get_xid();
 
-	inode = d_inode(cfile->dentry);
-	cifsi = CIFS_I(inode);
-
 	trace_smb3_zero_enter(xid, cfile->fid.persistent_fid, tcon->tid,
 			      ses->Suid, offset, len);
 
+	inode_lock(inode);
+	filemap_invalidate_lock(inode->i_mapping);
+
 	/*
 	 * We zero the range through ioctl, so we need remove the page caches
 	 * first, otherwise the data may be inconsistent with the server.
@@ -3325,26 +3342,12 @@ static long smb3_zero_range(struct file *file, struct cifs_tcon *tcon,
 	truncate_pagecache_range(inode, offset, offset + len - 1);
 
 	/* if file not oplocked can't be sure whether asking to extend size */
-	if (!CIFS_CACHE_READ(cifsi))
-		if (keep_size == false) {
-			rc = -EOPNOTSUPP;
-			trace_smb3_zero_err(xid, cfile->fid.persistent_fid,
-				tcon->tid, ses->Suid, offset, len, rc);
-			free_xid(xid);
-			return rc;
-		}
-
-	cifs_dbg(FYI, "Offset %lld len %lld\n", offset, len);
-
-	fsctl_buf.FileOffset = cpu_to_le64(offset);
-	fsctl_buf.BeyondFinalZero = cpu_to_le64(offset + len);
+	rc = -EOPNOTSUPP;
+	if (keep_size == false && !CIFS_CACHE_READ(cifsi))
+		goto zero_range_exit;
 
-	rc = SMB2_ioctl(xid, tcon, cfile->fid.persistent_fid,
-			cfile->fid.volatile_fid, FSCTL_SET_ZERO_DATA,
-			(char *)&fsctl_buf,
-			sizeof(struct file_zero_data_information),
-			0, NULL, NULL);
-	if (rc)
+	rc = smb3_zero_data(file, tcon, offset, len, xid);
+	if (rc < 0)
 		goto zero_range_exit;
 
 	/*
@@ -3357,6 +3360,8 @@ static long smb3_zero_range(struct file *file, struct cifs_tcon *tcon,
 	}
 
  zero_range_exit:
+	filemap_invalidate_unlock(inode->i_mapping);
+	inode_unlock(inode);
 	free_xid(xid);
 	if (rc)
 		trace_smb3_zero_err(xid, cfile->fid.persistent_fid, tcon->tid,



