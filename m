Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E19756034
	for <lists+samba-technical@lfdr.de>; Mon, 17 Jul 2023 12:16:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zshKLewW7y6t0Xlhdl6Aubw0HM2vl0HCDVgl2lB3Z+c=; b=tfSmoc0/xwMRXnkBeWh4SYScRK
	OmVb5z+Bt/PeKjoIiokaimCPNuzJL7sqEI1qhMKC4b2TPUGksUgy7ga3A35Z8i539zZnM60YA86Su
	gQkrcn4SHrjvWrNi0B30Te1jsqeZxHTK3kmBUaXdlqbhj71pxKIeQaIRiua0UPEWpsyeMolCB6kPJ
	KFq5jbongLq3DXddRL905zrqxtIVFJdcpYqR+r7JmVbyV658OBeUUWLKVOl+U9tVQqhkgkZrtmnu2
	gHMwMjDb9Ii9AYgsYygeQJBBwOGuSLVriBMszAe3h+eYlTXrD9caycImbZb28Ou3SKnGVYU4jNRfh
	8WD9vbLg==;
Received: from ip6-localhost ([::1]:24262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qLLGq-003Okw-NO; Mon, 17 Jul 2023 10:16:00 +0000
Received: from mga05.intel.com ([192.55.52.43]:64538) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qLLGj-003Okn-0B
 for samba-technical@lists.samba.org; Mon, 17 Jul 2023 10:15:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689588953; x=1721124953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0/4YfnWj7uZZvcBnfx2vVS2SmTppJGml5QU6wI2Ls2E=;
 b=JzUYhpcF0jI/7QHwtk63vrfUVo4O3UnBuFyx1xo9O/Z7hHcb6+yxmYsD
 HNqwn0bcOI4/KNUoKnazxChZyIxKa9+TMZhvcJc6MbetDEi48PO+36c2L
 TAeZhPy+Ljm6caEOlaPi0LBGPkw8JpRTeXuKg+Q0ttqlppyPhLeoiP7UF
 PrARkrIxWb9nqbHO9CUfLqdMgENWK4HYV12RwPgMPFpWw1pB5ccvAo8VK
 Py7i1it2G0ergIpgP9pCVp1trsTqNf58qP7wyk3WILyNRtoQaq8qrs2pp
 DhitjoYxPcRGbyrhUrB6FzSQU59z+pSaVYeC0aPHWU4DrAScebTcJBgwA Q==;
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 03:00:02 -0700
X-ExtLoop1: 1
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jul 2023 03:00:00 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 82458256; Mon, 17 Jul 2023 13:00:06 +0300 (EEST)
To: Steve French <stfrench@microsoft.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] smb: client: Rework memcpy() to avoid compilation error
Date: Mon, 17 Jul 2023 13:00:03 +0300
Message-Id: <20230717100003.11824-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
From: Andy Shevchenko via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In function ‘fortify_memcpy_chk’,
    inlined from ‘CIFS_open’ at fs/smb/client/cifssmb.c:1249:3:
include/linux/fortify-string.h:592:25: error: call to ‘__read_overflow2_field’ declared with attribute warning: detected read beyond size of field (2nd parameter); maybe use struct_group()? [-Werror=attribute-warning]
  592 |                         __read_overflow2_field(q_size_field, size);
      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

Instead of memcpy() use member-by-member copy. Let compiler do its job
on optimisation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 fs/smb/client/cifssmb.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/smb/client/cifssmb.c b/fs/smb/client/cifssmb.c
index 9dee267f1893..33ebb63826d3 100644
--- a/fs/smb/client/cifssmb.c
+++ b/fs/smb/client/cifssmb.c
@@ -1245,8 +1245,11 @@ CIFS_open(const unsigned int xid, struct cifs_open_parms *oparms, int *oplock,
 		*oplock |= CIFS_CREATE_ACTION;
 
 	if (buf) {
-		/* copy from CreationTime to Attributes */
-		memcpy((char *)buf, (char *)&rsp->CreationTime, 36);
+		buf->CreationTime = rsp->CreationTime;
+		buf->LastAccessTime = rsp->LastAccessTime;
+		buf->LastWriteTime = rsp->LastWriteTime;
+		buf->ChangeTime = rsp->ChangeTime;
+		buf->FileAttributes = rsp->FileAttributes;
 		/* the file_info buf is endian converted by caller */
 		buf->AllocationSize = rsp->AllocationSize;
 		buf->EndOfFile = rsp->EndOfFile;
-- 
2.40.0.1.gaa8946217a0b


