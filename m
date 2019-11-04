Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E342EDA66
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2019 09:15:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wS8HViWrC1+m7jjCfZ4pmsUS2btsnqpjgxwCktVEGFs=; b=ajGPfDnvBhqrr2Ps/hYY1mOB9O
	uIUsMgPryQcRhQF9IxcOMMKbLgSx3brgWPYkGVkfq8VxmCnmrwcq+vDNlpa/q3+bxmDrNbY9N2T07
	3KmD40GY86UyYZSmhEEUKCICs1cCEH2akB4MSvms6rk4kxY+xBDXkccpLbTshdKBns5U1Ae6u8b7r
	mM0R3swd2QqQ2c5ZYBUpfSe7tQOHO/jIcTAEY3tLLW46FEzTOwxP9MMFmO5UikyPkLg9+rTTYu8H8
	En/mkKAlvpyMif7WFcFRzWZRORgX0UL3GF6rsT6z+MVUt8AWVnid2KmqtCYS0JIf549ynjmhJy440
	/Z/Hu5Kg==;
Received: from localhost ([::1]:60220 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRXWB-006Rin-TL; Mon, 04 Nov 2019 08:15:19 +0000
Received: from mga03.intel.com ([134.134.136.65]:40032) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iRXW5-006RiZ-2w
 for samba-technical@lists.samba.org; Mon, 04 Nov 2019 08:15:18 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Nov 2019 23:59:19 -0800
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga002.fm.intel.com with ESMTP; 03 Nov 2019 23:59:17 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iRXGe-000I26-IZ; Mon, 04 Nov 2019 15:59:16 +0800
Date: Mon, 4 Nov 2019 15:59:11 +0800
To: Aurelien Aptel <aaptel@suse.com>
Subject: [RFC PATCH cifs] cifs: smb3_crypto_shash_allocate can be static
Message-ID: <20191104075911.23rhzcbztbhlbjk5@4978f4969bb8>
References: <201911041524.o7kWSYSC%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201911041524.o7kWSYSC%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
From: kbuild test robot via samba-technical <samba-technical@lists.samba.org>
Reply-To: kbuild test robot <lkp@intel.com>
Cc: linux-cifs@vger.kernel.org, kbuild-all@lists.01.org,
 samba-technical@lists.samba.org, Steve French <stfrench@microsoft.com>,
 linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Fixes: 4d1cc0309f7e ("cifs: try opening channels after mounting")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 smb2transport.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smb2transport.c b/fs/cifs/smb2transport.c
index 1af789871ec2e..86501239cef55 100644
--- a/fs/cifs/smb2transport.c
+++ b/fs/cifs/smb2transport.c
@@ -48,7 +48,7 @@ smb2_crypto_shash_allocate(struct TCP_Server_Info *server)
 			       &server->secmech.sdeschmacsha256);
 }
 
-int
+static int
 smb3_crypto_shash_allocate(struct TCP_Server_Info *server)
 {
 	struct cifs_secmech *p = &server->secmech;

