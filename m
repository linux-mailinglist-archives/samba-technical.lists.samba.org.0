Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FA4E48A8
	for <lists+samba-technical@lfdr.de>; Fri, 25 Oct 2019 12:38:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=FayfNeGT6j1qewSZjEARp6f6zMucP3LRZwb6M/yZNWY=; b=EUulGDDB/Ciqh6h62M3gRE/01A
	giKJlFTBVSn2uaToqUdv8jwMXw9w2vJ4vzG0mvpYDw4jvNFncDGad9a+mQma8hrj3LfU0NWOTQSH5
	bIs8c6zLarqWrJFByvUcPIrz7W8blzLx9a03b/R87fS3rwDlT0JNAs8+PM+7fSHuLtywd8lrKtBCi
	+ffQg1ucbEJSkefgHzdR4k+KSIz+COqCT8HZ+yGBfDCpHon8ejJfG/6i61IrGUUcG/XLAAoc7+FvY
	m1XoJdZldiwFlivx6VZkyyIljef7fQQLgTg2P2UnLwwfAHBBn5FP6EdbE9MhoEllrNRFd+xbnRJ3M
	69ZUdn4Q==;
Received: from localhost ([::1]:39768 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iNwyJ-0026h7-EN; Fri, 25 Oct 2019 10:37:31 +0000
Received: from userp2130.oracle.com ([156.151.31.86]:53916) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iNwyE-0026gr-JS
 for samba-technical@lists.samba.org; Fri, 25 Oct 2019 10:37:28 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9PAYLxk021001;
 Fri, 25 Oct 2019 10:37:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=FayfNeGT6j1qewSZjEARp6f6zMucP3LRZwb6M/yZNWY=;
 b=lCeKnecvtXMgWSsSjLGU5qcZkOPvHLsrgQcG3S5kgwR4kONac5I3iHCzSctU+RaHr0UU
 2VpHqUIIay1AdSpUzDD5yZPQPJ13tZiJSo1VpVOkWXlMC6YqFGTbv1ByR7cVIColIZTj
 i0BpIDFEuU7a5Dse6T+XfFYlXskmKfgx64mKGa8FVPhmxQWL9/Y1f7WAK4kaQpjeVl0V
 TT+7UbayQgeUEhU9BlJNvvTF/bnWWn31bzeATRgZpNTZyNaM4jP5CsE+Xp+q2reK3LYO
 JBKoQHADqBU4W78z56GGm8pbNvtuktUP3gqJCyYiq74crgChaxUokVce+kVXw5XifbpO /g== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2vqswu28du-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2019 10:37:19 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x9PAY3qk133334;
 Fri, 25 Oct 2019 10:35:18 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 2vuun0ucym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Oct 2019 10:35:18 +0000
Received: from abhmp0015.oracle.com (abhmp0015.oracle.com [141.146.116.21])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x9PAZFt2032481;
 Fri, 25 Oct 2019 10:35:15 GMT
Received: from mwanda (/41.57.98.10) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 25 Oct 2019 03:35:15 -0700
Date: Fri, 25 Oct 2019 13:35:08 +0300
To: Steve French <sfrench@samba.org>
Subject: [PATCH] cifs: rename a variable in SendReceive()
Message-ID: <20191025103508.GA11916@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Smatch gets confused because we sometimes refer to "server->srv_mutex" and
sometimes to "sess->server->srv_mutex".  They refer to the same lock so
let's just make this consistent.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 fs/cifs/transport.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index 308ad0f495e1..7c3697fe7905 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -1283,7 +1283,7 @@ SendReceive(const unsigned int xid, struct cifs_ses *ses,
 
 	rc = allocate_mid(ses, in_buf, &midQ);
 	if (rc) {
-		mutex_unlock(&ses->server->srv_mutex);
+		mutex_unlock(&server->srv_mutex);
 		/* Update # of requests on wire to server */
 		add_credits(server, &credits, 0);
 		return rc;
-- 
2.20.1


