Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6029859E402
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 15:08:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=41srhtC1DtBCiKuNUZse2LJ9UWvjGkyUijYd/UmDvl8=; b=vwmAv3nb6Z1exRbPWIB9xHY5dV
	DPKiTaOGMXnPXzfeqE52O4W3DWR9WHFKIp4/XkLofDMgKNKKwHugBSL3PdZEV8mMbM/+OHtf3VaW0
	mLRMqmg4ijugVC7rjP7ZsSX7+y8hEPv/qvDk+oMpk8b5H8YMG8h+325Ls/MmNLNkhBEAAQCpFWNlY
	gM9Z9unMpfkO7/XW/HNLOZIJZ61FuOA5Zp2y0C+WCYko2yJLt+gHiJ/SxhELqbQcB9+yg+HYdr9fC
	ASuTEQqAJ9YWtz0ExUDWMDXh89+Of1CXSlGcZzy1fuZIaKR7vYJ71ER8me6d2Zi2AuiesmTlDl4bD
	xE4dELpA==;
Received: from ip6-localhost ([::1]:33426 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQTdV-0020dF-0w; Tue, 23 Aug 2022 13:08:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57434) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oQTdN-0020cb-Hn
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 13:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41srhtC1DtBCiKuNUZse2LJ9UWvjGkyUijYd/UmDvl8=;
 b=GQTNsTseX/Eo5kAogM8919fXUh6n8ep+F1bUO/KDdaM8EF7MmQG/6nFAjR3K/1r4TCtSpg
 88bdg82pVWkLcj9apo/io6rrv2o2h/kGOraUZ5VnVh32h3XmYnSPs7OnynQ3iJTDxhtrCW
 8/IkpoKxFMyEVqlUNj1haJaGk8/m4n4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=41srhtC1DtBCiKuNUZse2LJ9UWvjGkyUijYd/UmDvl8=;
 b=GQTNsTseX/Eo5kAogM8919fXUh6n8ep+F1bUO/KDdaM8EF7MmQG/6nFAjR3K/1r4TCtSpg
 88bdg82pVWkLcj9apo/io6rrv2o2h/kGOraUZ5VnVh32h3XmYnSPs7OnynQ3iJTDxhtrCW
 8/IkpoKxFMyEVqlUNj1haJaGk8/m4n4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-483-Qpmpwwt-O9i9IEC4IzE4_A-1; Tue, 23 Aug 2022 09:07:51 -0400
X-MC-Unique: Qpmpwwt-O9i9IEC4IzE4_A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71E7B3C0CD5D;
 Tue, 23 Aug 2022 13:07:50 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4FEE940CFD0A;
 Tue, 23 Aug 2022 13:07:49 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 4/5] smb3: missing inode locks in punch hole
To: sfrench@samba.org, linux-cifs@vger.kernel.org
Date: Tue, 23 Aug 2022 14:07:48 +0100
Message-ID: <166126006871.548536.9826412629988468617.stgit@warthog.procyon.org.uk>
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

smb3 fallocate punch hole was not grabbing the inode or filemap_invalidate
locks so could have race with pagemap reinstantiating the page.

Cc: stable@vger.kernel.org
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Steve French <stfrench@microsoft.com>
---

 fs/cifs/smb2ops.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 75fcf6a0df56..5b5ddc1b4638 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -3375,7 +3375,7 @@ static long smb3_zero_range(struct file *file, struct cifs_tcon *tcon,
 static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
 			    loff_t offset, loff_t len)
 {
-	struct inode *inode;
+	struct inode *inode = file_inode(file);
 	struct cifsFileInfo *cfile = file->private_data;
 	struct file_zero_data_information fsctl_buf;
 	long rc;
@@ -3384,14 +3384,12 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
 
 	xid = get_xid();
 
-	inode = d_inode(cfile->dentry);
-
+	inode_lock(inode);
 	/* Need to make file sparse, if not already, before freeing range. */
 	/* Consider adding equivalent for compressed since it could also work */
 	if (!smb2_set_sparse(xid, tcon, cfile, inode, set_sparse)) {
 		rc = -EOPNOTSUPP;
-		free_xid(xid);
-		return rc;
+		goto out;
 	}
 
 	filemap_invalidate_lock(inode->i_mapping);
@@ -3411,8 +3409,10 @@ static long smb3_punch_hole(struct file *file, struct cifs_tcon *tcon,
 			(char *)&fsctl_buf,
 			sizeof(struct file_zero_data_information),
 			CIFSMaxBufSize, NULL, NULL);
-	free_xid(xid);
 	filemap_invalidate_unlock(inode->i_mapping);
+out:
+	inode_unlock(inode);
+	free_xid(xid);
 	return rc;
 }
 



