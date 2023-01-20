Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17495675456
	for <lists+samba-technical@lfdr.de>; Fri, 20 Jan 2023 13:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=x7bSkaLKTjO3gs7bJ53wyFSXB79/Gb+t4LEDEg9ZShc=; b=DPUkAq1y0cddgCkzCOUz1UiNPy
	1FakWtAFzO6iSbXzOkNctGSFoObcxep9kMm/Z6U29mY85bCH8yeOqQeSNSzxV42N1rVTN+foS63gN
	ze5hxa4VDWH/BBem+/k3Y3dL4gLY+sPx25k6tHULIM082b8ObGDR0tncdK7f6bMZTf9aVm/6gWGcS
	zS2P8UHLGSnBW96CUKV22k5P710w30IDWYT14mb9mIsb/3yS09G2dsgSyNMqm+WbKxe8o/oQNQKIa
	R//6AUSIsmQhmSivWho7J37FQgp9lWcYdUvm1j4kbCla3TzGuQeRJq66/6cdxVPGPe8JLHw5tWQ/o
	Q6u31siA==;
Received: from ip6-localhost ([::1]:52190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pIqRT-001A2A-R3; Fri, 20 Jan 2023 12:24:23 +0000
Received: from mga11.intel.com ([192.55.52.93]:24268) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pIqRN-001A21-Lc
 for samba-technical@lists.samba.org; Fri, 20 Jan 2023 12:24:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674217457; x=1705753457;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AZ/jvlZjDAGzwVeZ5n8u21laCDo/f+erT+mJrrLfC7E=;
 b=ODBr+XMlfAkohn29ndFjG4PQugk8OUlXPzw1uQ6W+vYTvNODLXMN40Wt
 S0zTZlCDrvDvplhK3x03SypwcrEC4CdfH2jbgXyI6Ag0gF8GlLtDM0n21
 ulN0sBTiCd1Kg54chfP7b16HF7QIcjASeIqnnuBO2GChYYgOxjtvOjljB
 +z7j+nmGXDrTOOAdz4G1VNHh0zOYpftl8XEuHGNJvTMTer/FBoTFxvsXk
 v3BAkvQUMDjoWFrU4qFWXt6LLaWSqEHI39JFDgf1XLmo0OnSIHR4Ydf6y
 c+O9IXrg9qQTvSR3gJIsZh8AJh+hYIAo3TGKj4T9jXBcWPiECXzC6kpWr A==;
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 04:08:27 -0800
X-ExtLoop1: 1
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga005.jf.intel.com with ESMTP; 20 Jan 2023 04:08:24 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 50A4A36D; Fri, 20 Jan 2023 14:08:59 +0200 (EET)
To: Steve French <stfrench@microsoft.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] cifs: Get rid of unneeded conditional in the
 smb2_get_aead_req()
Date: Fri, 20 Jan 2023 14:08:57 +0200
Message-Id: <20230120120857.60444-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.0
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
From: Andy Shevchenko via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@cjr.nz>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

In the smb2_get_aead_req() the skip variable is used only for
the very first iteration of the two nested loops, which means
it's basically in invariant to those loops. Hence, instead of
using conditional on each iteration, unconditionally assing
the 'skip' variable before the loops and at the end of the
inner loop.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 fs/cifs/smb2ops.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
index 519e6124d73d..7fcb79ce6a94 100644
--- a/fs/cifs/smb2ops.c
+++ b/fs/cifs/smb2ops.c
@@ -4280,6 +4280,12 @@ static void *smb2_get_aead_req(struct crypto_aead *tfm, const struct smb_rqst *r
 	sg_init_table(*sgl, num_sgs);
 	sg = *sgl;
 
+	/*
+	 * The first rqst has a transform header where the
+	 * first 20 bytes are not part of the encrypted blob.
+	 */
+	skip = 20;
+
 	/* Assumes the first rqst has a transform header as the first iov.
 	 * I.e.
 	 * rqst[0].rq_iov[0]  is transform header
@@ -4287,17 +4293,15 @@ static void *smb2_get_aead_req(struct crypto_aead *tfm, const struct smb_rqst *r
 	 * rqst[1+].rq_iov[0+] data to be encrypted/decrypted
 	 */
 	for (i = 0; i < num_rqst; i++) {
-		/*
-		 * The first rqst has a transform header where the
-		 * first 20 bytes are not part of the encrypted blob.
-		 */
 		for (j = 0; j < rqst[i].rq_nvec; j++) {
 			struct kvec *iov = &rqst[i].rq_iov[j];
 
-			skip = (i == 0) && (j == 0) ? 20 : 0;
 			addr = (unsigned long)iov->iov_base + skip;
 			len = iov->iov_len - skip;
 			sg = cifs_sg_set_buf(sg, (void *)addr, len);
+
+			/* See the above comment on the 'skip' assignment */
+			skip = 0;
 		}
 		for (j = 0; j < rqst[i].rq_npages; j++) {
 			rqst_page_get_length(&rqst[i], j, &len, &off);
-- 
2.39.0


