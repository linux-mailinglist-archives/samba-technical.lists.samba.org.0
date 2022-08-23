Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B5059E40E
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 15:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=d3i5wVY9ochj5YmCQFYqh+DQ+Bg9CInRp2iKPoE27ps=; b=YOtGLw/zpyOHoCL5zh+tvqv7hR
	x/D6sX55VRXsIky0zjYkKt9CwcHjN/Xp3cYloUwsoOYGbJ8A4vxtY9eKR/hb7rcSDBgHTreA0b/kR
	oefTW0u4tnBLpb34hAKicLJTr3HnmioYhI1ECEi33YotnGtC/o1pEKOiVBDljq/adiuF3qWup+vF3
	fXV3VMDWie4hnOYFTJa3U0WXQXZreKD1rSUAiMjjbt0Cpt1bXDh1lTHAN4tQZym/KXblgDiSwt9KX
	S22dhsgGMVRmC5HJF4yb80ZmjJBrNIOd4lI+mTZ/LMGU5vd5CjKrE3ReSDR2CXbNRKXdK6wHPfVFR
	kHV/jQfQ==;
Received: from ip6-localhost ([::1]:35142 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQTsc-0021tv-Vt; Tue, 23 Aug 2022 13:23:43 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60223) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oQTsW-0021q1-OA
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 13:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661261013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d3i5wVY9ochj5YmCQFYqh+DQ+Bg9CInRp2iKPoE27ps=;
 b=Q7EP+eoL21VoPxx74trTs9uKw1JxLTeKPuE22Ojs7qo3GEMyZc2WYdyzvd5jiP7gwvPEt3
 umIyc8SFidsQBSOmBirvpk1b/lr9E8u022p73Zb5JpbfNXJZjrYTabHGjo0VEBRjX4fV27
 JsknsWaA9ETMC2wTMMsCpQHXDWUeD2M=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661261013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d3i5wVY9ochj5YmCQFYqh+DQ+Bg9CInRp2iKPoE27ps=;
 b=Q7EP+eoL21VoPxx74trTs9uKw1JxLTeKPuE22Ojs7qo3GEMyZc2WYdyzvd5jiP7gwvPEt3
 umIyc8SFidsQBSOmBirvpk1b/lr9E8u022p73Zb5JpbfNXJZjrYTabHGjo0VEBRjX4fV27
 JsknsWaA9ETMC2wTMMsCpQHXDWUeD2M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-98--U2nptawM7S0xhEt02RCBA-1; Tue, 23 Aug 2022 09:07:57 -0400
X-MC-Unique: -U2nptawM7S0xhEt02RCBA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4D1433806650;
 Tue, 23 Aug 2022 13:07:57 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2CB52492C3B;
 Tue, 23 Aug 2022 13:07:56 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
Subject: [PATCH 5/5] smb3: fix temporary data corruption in insert range
To: sfrench@samba.org, linux-cifs@vger.kernel.org
Date: Tue, 23 Aug 2022 14:07:55 +0100
Message-ID: <166126007561.548536.12315282792952269215.stgit@warthog.procyon.org.uk>
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

insert range doesn't discard the affected cached region
so can risk temporarily corrupting file data.

Also includes some minor cleanup (avoiding rereading
inode size repeatedly unnecessarily) to make it clearer.

Cc: stable@vger.kernel.org
Fixes: 7fe6fe95b9360 ("cifs: FALLOC_FL_INSERT_RANGE support")
Signed-off-by: David Howells <dhowells@redhat.com>
Signed-off-by: Steve French <stfrench@microsoft.com>
cc: Ronnie Sahlberg <lsahlber@redhat.com>
---

 fs/cifs/smb2ops.c |   24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 5b5ddc1b4638..00c8d6a715c7 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -3722,35 +3722,43 @@ static long smb3_insert_range(struct file *file, struct cifs_tcon *tcon,
 	struct cifsFileInfo *cfile = file->private_data;
 	struct inode *inode = file_inode(file);
 	__le64 eof;
-	__u64  count;
+	__u64  count, old_eof;
+
+	inode_lock(inode);
 
 	xid = get_xid();
 
-	if (off >= i_size_read(inode)) {
+	old_eof = i_size_read(inode);
+	if (off >= old_eof) {
 		rc = -EINVAL;
 		goto out;
 	}
 
-	count = i_size_read(inode) - off;
-	eof = cpu_to_le64(i_size_read(inode) + len);
+	count = old_eof - off;
+	eof = cpu_to_le64(old_eof + len);
 
+	filemap_invalidate_lock(inode->i_mapping);
 	filemap_write_and_wait(inode->i_mapping);
+	truncate_pagecache_range(inode, off, old_eof);
 
 	rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
 			  cfile->fid.volatile_fid, cfile->pid, &eof);
 	if (rc < 0)
-		goto out;
+		goto out_2;
 
 	rc = smb2_copychunk_range(xid, cfile, cfile, off, count, off + len);
 	if (rc < 0)
-		goto out;
+		goto out_2;
 
-	rc = smb3_zero_range(file, tcon, off, len, 1);
+	rc = smb3_zero_data(file, tcon, off, len, xid);
 	if (rc < 0)
-		goto out;
+		goto out_2;
 
 	rc = 0;
+out_2:
+	filemap_invalidate_unlock(inode->i_mapping);
  out:
+	inode_unlock(inode);
 	free_xid(xid);
 	return rc;
 }



