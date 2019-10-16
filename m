Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C1ED9C49
	for <lists+samba-technical@lfdr.de>; Wed, 16 Oct 2019 23:11:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/J1KAoDt4Ozk7FB45NoOpcC31EITTBCBFxE5mPDky0M=; b=M5y07fL9zG5A7yITme/1XDDJxg
	LVHTaBt+bCdPKVsYBL2f+6+lSvHFPkSxymXVevgJtzNmxXKeYtMbHK4zUombUGEP50TJ1C8iiyT8j
	HUcDRBh5MBuP3vQuiE1izdVl2RQ2Uk0aaLQS7ssLGMm4F4g3BuC66T1nU5NE5uZj9CBb6jCEBiiOt
	3aXv7qgr5+QITHjF1Xz4NsCcPagWIOXox/fdQrTvWxm6fGNd4HTRqdvCAT99/y2WkoY+LFNJOWHeb
	glkiFVS2ga9oJUGOncNgHLtqGImXFYtYmP3OX1wtVxlISrJAj9w7au1azNHQmg30OoDd8lK+0KPn5
	kIK/MMbw==;
Received: from localhost ([::1]:45228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKqYy-004PPU-2e; Wed, 16 Oct 2019 21:10:32 +0000
Received: from [13.77.154.182] (port=37596 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1iKqYm-004PMy-05
 for samba-technical@lists.samba.org; Wed, 16 Oct 2019 21:10:23 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 60F3F20B711C; Wed, 16 Oct 2019 13:52:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 60F3F20B711C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1571259144;
 bh=/J1KAoDt4Ozk7FB45NoOpcC31EITTBCBFxE5mPDky0M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=Y0eBDBHquq6cYy1+wkmaiQuaVrwGocFDF9ABfnRExz/FxhSPac8J/t7NassnmR6nV
 S9YQv4Ait77buBeYE2tCeL+OtoBuYbmyZl2JObo5m11m0lkg1jOAE3Qi4T9dHSugfT
 cWiu3jU1tgK+MA7bJHOq3Hep9xGbV9ikyeDBEznY=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] cifs: smbd: Return -EINVAL when the number of iovs
 exceeds SMBDIRECT_MAX_SGE
Date: Wed, 16 Oct 2019 13:51:52 -0700
Message-Id: <1571259116-102015-4-git-send-email-longli@linuxonhyperv.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1571259116-102015-1-git-send-email-longli@linuxonhyperv.com>
References: <1571259116-102015-1-git-send-email-longli@linuxonhyperv.com>
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
From: longli--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: longli@microsoft.com
Cc: longli@linuxonhyperv.com, stable@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

From: Long Li <longli@microsoft.com>

While it's not friendly to fail user processes that issue more iovs
than we support, at least we should return the correct error code so the
user process gets a chance to retry with smaller number of iovs.

Signed-off-by: Long Li <longli@microsoft.com>
Cc: stable@vger.kernel.org
---
 fs/cifs/smbdirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/smbdirect.c b/fs/cifs/smbdirect.c
index cd07e5301d42..d41a9345f90d 100644
--- a/fs/cifs/smbdirect.c
+++ b/fs/cifs/smbdirect.c
@@ -1069,7 +1069,7 @@ static int smbd_post_send_data(
 
 	if (n_vec > SMBDIRECT_MAX_SGE) {
 		cifs_dbg(VFS, "Can't fit data to SGL, n_vec=%d\n", n_vec);
-		return -ENOMEM;
+		return -EINVAL;
 	}
 
 	sg_init_table(sgl, n_vec);
-- 
2.17.1


