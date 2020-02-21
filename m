Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2B167EDC
	for <lists+samba-technical@lfdr.de>; Fri, 21 Feb 2020 14:42:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=9yOVojDggGr8NCbPtK+T/UaNcM1PGJ5/4Qht0J3hiYE=; b=B8J85VCB+lEfHwUDU+FD1Z8IS1
	7zNtur8OiNL/pkE4bJZT/r6IEcpsthNmCGT1AblpnQiGzA9Ot5roPkLkjlUG1LZxIjF5KKlfFxRVF
	3FXlgCh3JwzagCWaFO5LxOE2UQBXWgiAYarGCnly1AruI3UyDMeXI6CmiEoeKGYLkEApCQrozIUMB
	bqXyq7TnKPeKmNPnCdeKlteAOz/lMRszA4vraDGyE6xlxlRs2KAa0wmSMjshBpx+yFelpM6gapjg/
	BuAvvmhme6a1O1Om9GbyhuTNuIVGu///VqpusOT+q6C/MIZTD/Njo+ZFU/669p9bN5MBrBtV2a/sq
	IaH7mRyQ==;
Received: from localhost ([::1]:19344 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j58YT-00AveL-Hm; Fri, 21 Feb 2020 13:41:21 +0000
Received: from smtprelay0091.hostedemail.com ([216.40.44.91]:48237
 helo=smtprelay.hostedemail.com) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j58YN-00AveD-5Y
 for samba-technical@lists.samba.org; Fri, 21 Feb 2020 13:41:17 +0000
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
 [10.5.19.251])
 by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 2F813181CB174
 for <samba-technical@lists.samba.org>; Fri, 21 Feb 2020 13:22:25 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id B5B61182CED34;
 Fri, 21 Feb 2020 13:22:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: badge02_300193163bd5e
X-Filterd-Recvd-Size: 1390
Received: from XPS-9350.home (unknown [47.151.143.254])
 (Authenticated sender: joe@perches.com)
 by omf18.hostedemail.com (Postfix) with ESMTPA;
 Fri, 21 Feb 2020 13:22:09 +0000 (UTC)
Message-ID: <862518f826b35cd010a2e46f64f6f4cfa0d44582.camel@perches.com>
Subject: [trivial PATCH] cifs: Use #define in cifs_dbg
To: Steve French <sfrench@samba.org>
Date: Fri, 21 Feb 2020 05:20:45 -0800
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 216.40.44.91
 (smtprelay0091.hostedemail.com) incorrectly presented itself as
 smtprelay.hostedemail.com
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
From: Joe Perches via samba-technical <samba-technical@lists.samba.org>
Reply-To: Joe Perches <joe@perches.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

All other uses of cifs_dbg use defines so change this one.

Signed-off-by: Joe Perches <joe@perches.com>
---
 fs/cifs/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/inode.c b/fs/cifs/inode.c
index b5e663..cd95e0 100644
--- a/fs/cifs/inode.c
+++ b/fs/cifs/inode.c
@@ -653,8 +653,8 @@ cifs_all_info_to_fattr(struct cifs_fattr *fattr, FILE_ALL_INFO *info,
 		 */
 		if ((fattr->cf_nlink < 1) && !tcon->unix_ext &&
 		    !info->DeletePending) {
-			cifs_dbg(1, "bogus file nlink value %u\n",
-				fattr->cf_nlink);
+			cifs_dbg(VFS, "bogus file nlink value %u\n",
+				 fattr->cf_nlink);
 			fattr->cf_flags |= CIFS_FATTR_UNKNOWN_NLINK;
 		}
 	}



