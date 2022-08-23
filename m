Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC6859E40D
	for <lists+samba-technical@lfdr.de>; Tue, 23 Aug 2022 15:23:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=5XBOIH3pNVedUwFsOXAIjq4Jvv7g7DjLTpjlFUvS39Y=; b=AxpzXD9QLZSEuDMg+r4ochmQBy
	J5s5cnRE44a3FUP0QA93O4juIDb7eIurdVT1NaU/9wwobmouv8gaSZ0e2+JTz+zp4FFFgMvUZRqyz
	VUCmTLz66Uu4eczGBTfj2ACXf2McfSgy3ppJI8pEEy2Apd5kK43GwtUxd+jL/yEo7BDxVw1yqqwtT
	vYkB56alVdgsMSYwz8BhkIhh7pxH5q50MNrnxTxAd0IiinbAtNLMm6Ef0Dhjz+lA6og+tI+ZXjdtR
	fXbN4mE4jUYI68dm5bPsq1clAuPb6ZQA0k3jc60+OlzPM0PVt/Ju3UDgzavSERqOYiMkuLFAUrpTi
	JPbAil6g==;
Received: from ip6-localhost ([::1]:22682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oQTsG-0021lm-Jb; Tue, 23 Aug 2022 13:23:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33003) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1oQTsC-0021lc-4b
 for samba-technical@lists.samba.org; Tue, 23 Aug 2022 13:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260992;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5XBOIH3pNVedUwFsOXAIjq4Jvv7g7DjLTpjlFUvS39Y=;
 b=bn96NQhz01YmA3GRInOduDCZA1viTVffab5KiBBBtPKmaiz1MwSbsygy2w/gDALN1e5qgW
 AWgiRKQDtWE+TixkGLrh5haJptfS5bMxKR9i/lrnl4BnI98tP/NMMgA7ybwZfm+oFLyeHF
 l+6IabJDUAQe4B0XAc6jSkl4tyF3890=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661260993;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5XBOIH3pNVedUwFsOXAIjq4Jvv7g7DjLTpjlFUvS39Y=;
 b=AGg8yuHlCDA5lXoAXYBSwTV3M9A9F4YJtGyWLny2fkAoCIz7WNMUe0OEtL7IxEJMsJhmV8
 qj5oZvkoKDUTI++7qYMClJaKUEJDWWE3DBqjXUoTB+BbEN5Inlz3Mx0iEXaw43PpinT2Wr
 7i7u9jc14MvvRNQPsojGgpAN9eU/Nbk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-tNCRk7prMsyJhm6rhXGLfg-1; Tue, 23 Aug 2022 09:07:23 -0400
X-MC-Unique: tNCRk7prMsyJhm6rhXGLfg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3EAE80A0BC;
 Tue, 23 Aug 2022 13:07:22 +0000 (UTC)
Received: from warthog.procyon.org.uk (unknown [10.33.36.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84A1DC15BB3;
 Tue, 23 Aug 2022 13:07:21 +0000 (UTC)
Subject: [PATCH 0/5] smb3: Fix missing locks and invalidation in fallocate
To: sfrench@samba.org, linux-cifs@vger.kernel.org
Date: Tue, 23 Aug 2022 14:07:20 +0100
Message-ID: <166126004083.548536.11195647088995116235.stgit@warthog.procyon.org.uk>
User-Agent: StGit/1.4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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


Here are some patches to fix locking and invalidation in the smb3/cifs
fallocate, in particular in zero_range, punch_hole, collapse_range and
insert_range.

Those four operations were, for the most part, missing calls to inode_lock(),
filemap_invalidate_lock() and truncate_pagecache_range(), the last of which
was causing generic/031 to show data corruption.

David
---
David Howells (4):
      smb3: Move the flush out of smb2_copychunk_range() into its callers
      smb3: missing inode locks in zero range
      smb3: missing inode locks in punch hole
      smb3: fix temporary data corruption in insert range

Steve French (1):
      smb3: fix temporary data corruption in collapse range


 fs/cifs/cifsfs.c  |   2 +
 fs/cifs/smb2ops.c | 131 ++++++++++++++++++++++++++--------------------
 2 files changed, 75 insertions(+), 58 deletions(-)



