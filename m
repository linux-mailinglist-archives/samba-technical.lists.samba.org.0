Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916CD9C4E
	for <lists+samba-technical@lfdr.de>; Wed, 16 Oct 2019 23:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4sfYqfNcpqUyQQbNHu50T1zrwYwZAKGk5e7iBBIfSaE=; b=4JONiBpcIZBKvgurMaPGczQUdM
	swegDwRZdVMaaXx5a1asrj8BdRx0+KXFnQ8+wStnKew50HtIcYQItzK9TWIbUwWN1dVwU2neUp1K1
	7oBYGma8TG7AD+1TZmYFmH/pEhLTXKaZ+e1HFIDOt9qFs5iD39vIhqYrsGNNc6tTWLPJ9U5/CsKAA
	qmlzY0aE2L8OI8XkkRyEg1EHDkt1Er7Pk+qD0ePRAv43DzpQqaW3S1gg4ioX4kEWEi1Q3Fh8uhgwk
	Oqk1U5ugdKIb/q/QMVJcV0eOYsbyvQEJCyzmiZnGOSf0NtbfF2f8jf0W4Aoi3iEEQvA0y4e/GaRO2
	dBLFWFnQ==;
Received: from localhost ([::1]:45052 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iKqYs-004PNC-Bk; Wed, 16 Oct 2019 21:10:26 +0000
Received: from [13.77.154.182] (port=37528 helo=linux.microsoft.com) 
 by hr1.samba.org with esmtp (Exim) id 1iKqYf-004PMc-CP
 for samba-technical@lists.samba.org; Wed, 16 Oct 2019 21:10:15 +0000
Received: by linux.microsoft.com (Postfix, from userid 1004)
 id 74F4120B9C01; Wed, 16 Oct 2019 13:52:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 74F4120B9C01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxonhyperv.com;
 s=default; t=1571259159;
 bh=4sfYqfNcpqUyQQbNHu50T1zrwYwZAKGk5e7iBBIfSaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
 b=fEJ5jG1S1MwamTnSlDlKPEPKPQZoloArDSkK1MWu89vIhffBH8pIzueXDS3OyoKRe
 hOpdrnE4BABVWf5KhMLqSS2oASgx141KJp5415iAzkLTiOMdBMZX9O6hlD0nVyeisd
 Kam0Tmk3Iiy6f4NIs+n4nQ54gqqU/u4GhABEWH5c=
To: Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] cifs: smbd: Return -EAGAIN when transport is reconnecting
Date: Wed, 16 Oct 2019 13:51:56 -0700
Message-Id: <1571259116-102015-8-git-send-email-longli@linuxonhyperv.com>
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

During reconnecting, the transport may have already been destroyed and is in
the process being reconnected. In this case, return -EAGAIN to not fail and
to retry this I/O.

Signed-off-by: Long Li <longli@microsoft.com>
Cc: stable@vger.kernel.org
---
 fs/cifs/transport.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
index afe66f9cb15e..66fde7bfec4f 100644
--- a/fs/cifs/transport.c
+++ b/fs/cifs/transport.c
@@ -318,8 +318,11 @@ __smb_send_rqst(struct TCP_Server_Info *server, int num_rqst,
 	int val = 1;
 	__be32 rfc1002_marker;
 
-	if (cifs_rdma_enabled(server) && server->smbd_conn) {
-		rc = smbd_send(server, num_rqst, rqst);
+	if (cifs_rdma_enabled(server)) {
+		/* return -EAGAIN when connecting or reconnecting */
+		rc = -EAGAIN;
+		if (server->smbd_conn)
+			rc = smbd_send(server, num_rqst, rqst);
 		goto smbd_done;
 	}
 
-- 
2.17.1


