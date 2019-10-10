Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AED4D2DCE
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2019 17:33:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=DT05UIB34qgZ21VKCCSFG+qP5wQYRjlisOShZMc+G7U=; b=YUyrYpSHe12y7hFetHkSB/ir9l
	PeD/bXVE9rXr6IVpniaR2aPMC6bi/i2oQoph+Vuz8iUaZeOZ0mLq3cH+yNIoppOcx9bgbMWem2FLn
	KDe/nJu5lvQ+Szcr2ksb3sTAq+jvMI19gSyx3SXZ+3Beb0i4n2s9wgsbDz7Gyy8TKSKHzIqDblxUG
	cA2Lz1EtOez5qCRs8HYrCY2NhKfVOJirh16eofmd9j0fsX/Qe7w4t+cVgL9s2p5715+VKv0iDufwA
	sIH1o67Se70nsX7TFtxllIHjF1NWnJMr5dTczanQOhtRvRQq5vzfkOkF+Vim46f8N8xLVL7HU/mxu
	cI3lTFQw==;
Received: from localhost ([::1]:26422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iIaQT-002lNP-Ll; Thu, 10 Oct 2019 15:32:25 +0000
Received: from mx.cjr.nz ([51.158.111.142]:55690) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIaQP-002lNI-29
 for samba-technical@lists.samba.org; Thu, 10 Oct 2019 15:32:23 +0000
Received: from authenticated-user (mx.cjr.nz [51.158.111.142])
 (Authenticated sender: pc)
 by mx.cjr.nz (Postfix) with ESMTPSA id B819A81032;
 Thu, 10 Oct 2019 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjr.nz; s=dkim;
 t=1570721537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=DT05UIB34qgZ21VKCCSFG+qP5wQYRjlisOShZMc+G7U=;
 b=rvm3wqngV62GigB/4x+JaHVZN0J+zQW5cYVlwWmQrsB7CW2N814zObqkGOGFMU5CFVVdxO
 YWfEcBVte/uGQ2LRwuNeWUOcowm11Cvkbsu0MycTP407vCStPo3DBI4EQMAJtas+GjPQB5
 OGcicOncRo9effHUIA6pLqedYAsfoztG8JSYcfniB3eIyS4Y1g40TzRyrII9GvSXrYuDs6
 RhhswYCXTgt7oN6U87jDaNZjll9yZOHWCDDuOaTbpcIaOA86yWr3n1/xqe98x6tSuJNq+l
 7JtJFaA0FXGxnY6R0y7xKYluzh+OEfiSy1BvrWPB6x5/XqVSsjvfrStd0tSSpw==
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 smfrench@gmail.com
Subject: [PATCH] cifs: Handle -EINPROGRESS only when noblockcnt is set
Date: Thu, 10 Oct 2019 12:31:58 -0300
Message-Id: <20191010153158.14160-1-pc@cjr.nz>
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
From: "Paulo Alcantara \(SUSE\) via samba-technical"
 <samba-technical@lists.samba.org>
Reply-To: "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>
Cc: "Paulo Alcantara \(SUSE\)" <pc@cjr.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We only want to avoid blocking in connect when mounting SMB root
filesystems, otherwise bail out from generic_ip_connect() so cifs.ko
can perform any reconnect failover appropriately.

This fixes DFS failover/reconnection tests in upstream buildbot.

Fixes: 8eecd1c2e5bc ("cifs: Add support for root file systems")
Signed-off-by: Paulo Alcantara (SUSE) <pc@cjr.nz>
---
 fs/cifs/connect.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index a64dfa95a925..bdea4b3e8005 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -3882,8 +3882,12 @@ generic_ip_connect(struct TCP_Server_Info *server)
 
 	rc = socket->ops->connect(socket, saddr, slen,
 				  server->noblockcnt ? O_NONBLOCK : 0);
-
-	if (rc == -EINPROGRESS)
+	/*
+	 * When mounting SMB root file systems, we do not want to block in
+	 * connect. Otherwise bail out and then let cifs_reconnect() perform
+	 * reconnect failover - if possible.
+	 */
+	if (server->noblockcnt && rc == -EINPROGRESS)
 		rc = 0;
 	if (rc < 0) {
 		cifs_dbg(FYI, "Error %d connecting to server\n", rc);
-- 
2.23.0


