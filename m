Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BF02DCFFC
	for <lists+samba-technical@lfdr.de>; Thu, 17 Dec 2020 12:03:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=L3aGYrlGeo3eT6PpjNqyTbmWD+46i7QX5RYLQI6tFXo=; b=E5DYTx/HJNowyccJ84yG724egB
	y6eI1YtifXBfgeMxYBoShsZAc+zqUHAYAymGlh5aYs8uvBnBdiuRC7Ng+gnZRG7b4b1h/r9IOLZLL
	y8gn+5wVXLQUvAo13X/gnwPGurabaOttun1oImnmydVTFXtxcdJ12Rwpi+iqq5vZI+SRRPA5j6Ovv
	jSr4mfy2qRwgrgxnihsZirlHb6tmgVJeBCzcacZ2eDUukhjch+gejTsDph641tnWtutRSmx0D/9xk
	4P0UiSx7DkheUbBiSSKLphYqKKZMKy18lr3Q9fG3unrQ0nkat+E+LDCeaNa7y4MVq0EJatGqRLiSF
	C2F+HpQQ==;
Received: from ip6-localhost ([::1]:61336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kpr3F-001mzD-CI; Thu, 17 Dec 2020 11:02:29 +0000
Received: from aserp2120.oracle.com ([141.146.126.78]:38540) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kpr39-001mz6-EB
 for samba-technical@lists.samba.org; Thu, 17 Dec 2020 11:02:25 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHAxrmr142184;
 Thu, 17 Dec 2020 11:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=L3aGYrlGeo3eT6PpjNqyTbmWD+46i7QX5RYLQI6tFXo=;
 b=Mffd3LLUfyTaTJfrCowPMeqSxUXq0stihiQJYoclk7ZqpIFTVNwf4/UYAl+5wpbnyC7u
 TV/+FeZ4X8gbGM/sXiFKuz5eNvexQNDcBXFY8xpOviKS3JwyEvXI6hsUXIkB/mabhA4E
 9v5a+Owowjo+8Q98j8SFzlcvQo4flWerwMoYZFewLA/bSBDJ4k4NW/nvrRpKOQfMxMtA
 t+c/o4bucfGl9xCTjechnOjuiBYZJu1o8XFE7GuzGAUHe7iIwCgTbqmC19i71LCiRIE1
 DgyiuGZMaQmj56PtP1h1lGr0xAudqP8ftgmpwxgImx4XSHRXvRTIZkwTSXJkli1UeEKy Fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 35cntmcsw0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 17 Dec 2020 11:02:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0BHB1D4i128891;
 Thu, 17 Dec 2020 11:02:00 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 35e6et4ynk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Dec 2020 11:02:00 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0BHB1u7I011570;
 Thu, 17 Dec 2020 11:01:56 GMT
Received: from mwanda (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 17 Dec 2020 03:01:55 -0800
Date: Thu, 17 Dec 2020 14:01:48 +0300
To: Steve French <sfrench@samba.org>
Subject: [PATCH 1/3] cifs: Delete a stray unlock in cifs_swn_reconnect()
Message-ID: <X9s6nGDLt4xreaYN@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
From: Dan Carpenter via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-cifs@vger.kernel.org, Samuel Cabrero <scabrero@suse.de>,
 samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org,
 Aurelien Aptel <aaptel@suse.com>, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The unlock is done in the caller, this is a stray which leads to a
double unlock bug.

Fixes: bf80e5d4259a ("cifs: Send witness register and unregister commands to userspace daemon")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/cifs_swn.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/cifs/cifs_swn.c b/fs/cifs/cifs_swn.c
index c594e588a8b5..b2ef082d6438 100644
--- a/fs/cifs/cifs_swn.c
+++ b/fs/cifs/cifs_swn.c
@@ -285,8 +285,6 @@ static struct cifs_swn_reg *cifs_find_swn_reg(struct cifs_tcon *tcon)
 			continue;
 		}
 
-		mutex_unlock(&cifs_swnreg_idr_mutex);
-
 		cifs_dbg(FYI, "Existing swn registration for %s:%s found\n", swnreg->net_name,
 				swnreg->share_name);
 
-- 
2.29.2


