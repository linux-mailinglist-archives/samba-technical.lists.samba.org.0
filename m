Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEF1EDA67
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2019 09:15:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7ZMORGCZ+vngASJTAQfTjEdE4lG3oHsGNhUY6Oo8gSs=; b=dqlydyQmEyJtXXcI5UrlZC2T3d
	IOhSiQ3BdsT4ERL2hWGDfb370afsTrN8I6ZtV/rCHC2FsLYTFx3E4NSkLSAAdWbhrib8YWk444KAU
	VKbTa53zednZqTAC49bo0Fri+WqRDDhFAiWgAh/it3IKrjM2WZX06RuwTQWIVuXG9S3C/favbbuKF
	YsLm75w8ckGj1BeGOLDPDucGnEJecRDBo84DVDTowbwUB6J8bL2XkVSobJtcf4P5EoU8kDPEe5KxD
	VQ3ekQNYzX7gH3hiIyDIrAcneXhKNMNmmcebWEdMGGXjMFI+WrNnrm+tocmcRZh5H3oH/JJLNhk0h
	SeHUNZzA==;
Received: from localhost ([::1]:60222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRXWD-006Riy-VL; Mon, 04 Nov 2019 08:15:22 +0000
Received: from mga06.intel.com ([134.134.136.31]:37421) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iRXW5-006Ria-Nk
 for samba-technical@lists.samba.org; Mon, 04 Nov 2019 08:15:18 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Nov 2019 23:59:18 -0800
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 03 Nov 2019 23:59:16 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iRXGe-000I1c-Fc; Mon, 04 Nov 2019 15:59:16 +0800
Date: Mon, 4 Nov 2019 15:59:09 +0800
To: Aurelien Aptel <aaptel@suse.com>
Subject: [cifs:for-next 18/20] fs/cifs/smb2transport.c:52:1: sparse: sparse:
 symbol 'smb3_crypto_shash_allocate' was not declared. Should it be static?
Message-ID: <201911041524.o7kWSYSC%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   3c652dd9928737b82a74b3ce8483c7497885eb04
commit: 4d1cc0309f7ec007b5b29f1350e3b1c105e86439 [18/20] cifs: try opening channels after mounting
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-6-g57f8611-dirty
        git checkout 4d1cc0309f7ec007b5b29f1350e3b1c105e86439
        make ARCH=x86_64 allmodconfig
        make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> fs/cifs/smb2transport.c:52:1: sparse: sparse: symbol 'smb3_crypto_shash_allocate' was not declared. Should it be static?

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

