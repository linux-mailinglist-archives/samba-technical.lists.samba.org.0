Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C8459E406
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 15:09:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=YAOIxblxocTtO3BL0vdfFElttBlZxbKdOb+H6jWEd7M=; b=myVHgWl7rbBEBnqn5Sf9gruJEf
	B2g2uy2CQZtODR7A4OyhJVRiwE8x0VqPpH58Rd+PIWBOYmOWCbcP9rWhpFicpIFyOmq1PLS3cUchS
	zN5RF4eI8FNxtXFZznmxA7otYtf2fHxatII7gAJ6x+NfIvtZYi5w0/5sbuv/crWSIJAd5Ea9h0pEm
	q3GorUNWakqf6A/2m22F/u0b/HPS7k9XxKzLnpG1kMcCyDbQHT1WInkDugcvB4AQM7tXH3uvwCXmX
	UO16rbzfG95a4R25aanb/LRkci8AdjYEZiG8EcDDDgQSKw+DoLDzPgYveeX9pAAMrZ+POBHkZE+I2
	O7ftZS+Q==;
Received: from ip6-localhost ([::1]:39582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQTeb-002116-0g; Tue, 23 Aug 2022 13:09:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56331) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oQTeU-0020w8-Tk
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 13:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAOIxblxocTtO3BL0vdfFElttBlZxbKdOb+H6jWEd7M=;
 b=f2AnBZZ1FQ+tCY4xROEabZI/A1Cjg8uvyVgzu446vxh3MRH3Cc2JMoXW4ZSnkaMn7hV7dT
 IBIh1y0tmQ52IhMzhWqatMNggefP5u+zg+whtN+UyWf6CMPSS04lmDTL0WzEPEITP8Iu4n
 YN5Z7UbdVQSLY9X7+MuqAXXlsf2s4m4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YAOIxblxocTtO3BL0vdfFElttBlZxbKdOb+H6jWEd7M=;
 b=f2AnBZZ1FQ+tCY4xROEabZI/A1Cjg8uvyVgzu446vxh3MRH3Cc2JMoXW4ZSnkaMn7hV7dT
 IBIh1y0tmQ52IhMzhWqatMNggefP5u+zg+whtN+UyWf6CMPSS04lmDTL0WzEPEITP8Iu4n
 YN5Z7UbdVQSLY9X7+MuqAXXlsf2s4m4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-lxsTvF6MOa6DNJO6C88fTQ-1; Tue, 23 Aug 2022 09:07:47 -0400
X-MC-Unique: lxsTvF6MOa6DNJO6C88fTQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CDD43C0CD5A;
 Tue, 23 Aug 2022 13:07:43 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6817F40CFD0A;
 Tue, 23 Aug 2022 13:07:42 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 3/5] smb3: fix temporary data corruption in collapse range
To: sfrench@samba.org, linux-cifs@vger.kernel.org
Date: Tue, 23 Aug 2022 14:07:41 +0100
Message-ID: <166126006184.548536.12909933168251738646.stgit@warthog.procyon.org.uk>
In-Reply-To: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
References: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
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

From: Steve French <stfrench@microsoft.com>

collapse range doesn't discard the affected cached region
so can risk temporarily corrupting the file data. This
fixes xfstest generic/031

I also decided to merge a minor cleanup to this into the same patch
(avoiding rereading inode size repeatedly unnecessarily) to make it
clearer.

Cc: stable@vger.kernel.org
Fixes: 5476b5dd82c8b ("cifs: add support for FALLOC_FL_COLLAPSE_RANGE")
Reported-by: David Howells <dhowells@redhat.com>
Tested-by: David Howells <dhowells@redhat.com>
Reviewed-by: David Howells <dhowells@redhat.com>
Signed-off-by: Steve French <stfrench@microsoft.com>
cc: Ronnie Sahlberg <lsahlber@redhat.com>
---

 fs/cifs/smb2ops.c |   26 ++++++++++++++++----------
 1 file changed, 16 insertions(+), 10 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 1c5a93ced946..75fcf6a0df56 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -3669,41 +3669,47 @@ static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
 {
 	int rc;
 	unsigned int xid;
-	struct inode *inode;
+	struct inode *inode = file_inode(file);
 	struct cifsFileInfo *cfile = file->private_data;
-	struct cifsInodeInfo *cifsi;
+	struct cifsInodeInfo *cifsi = CIFS_I(inode);
 	__le64 eof;
+	loff_t old_eof;
 
 	xid = get_xid();
 
-	inode = d_inode(cfile->dentry);
-	cifsi = CIFS_I(inode);
+	inode_lock(inode);
 
-	if (off >= i_size_read(inode) ||
-	    off + len >= i_size_read(inode)) {
+	old_eof = i_size_read(inode);
+	if ((off >= old_eof) ||
+	    off + len >= old_eof) {
 		rc = -EINVAL;
 		goto out;
 	}
 
+	filemap_invalidate_lock(inode->i_mapping);
 	filemap_write_and_wait(inode->i_mapping);
+	truncate_pagecache_range(inode, off, old_eof);
 
 	rc = smb2_copychunk_range(xid, cfile, cfile, off + len,
-				  i_size_read(inode) - off - len, off);
+				  old_eof - off - len, off);
 	if (rc < 0)
-		goto out;
+		goto out_2;
 
-	eof = cpu_to_le64(i_size_read(inode) - len);
+	eof = cpu_to_le64(old_eof - len);
 	rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
 			  cfile->fid.volatile_fid, cfile->pid, &eof);
 	if (rc < 0)
-		goto out;
+		goto out_2;
 
 	rc = 0;
 
 	cifsi->server_eof = i_size_read(inode) - len;
 	truncate_setsize(inode, cifsi->server_eof);
 	fscache_resize_cookie(cifs_inode_cookie(inode), cifsi->server_eof);
+out_2:
+	filemap_invalidate_unlock(inode->i_mapping);
  out:
+	inode_unlock(inode);
 	free_xid(xid);
 	return rc;
 }



