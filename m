Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FC6B34D08
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:57:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Qye+0QmLAvFWq1VgYHM/0X2DGFzZNINKYU6v7i08nwQ=; b=bcvMCWTvc+VZSKy2lGBlOFKaIi
	fpsyjSemwPvbK/hDRFCvY7EA2UgFnvhftDBK8swN0TtXhiOZOlvbgdbxDkEs27JFucunovbqDRxQ9
	eYDYMXZy2E9V/HqvzmPZaMAySKNGX3jzCB4e1dRCh8W1VpLyTwOtOdKOl6wKRVcuFi/IGwwN9eIsm
	n4REMkLCqJ2VZY8UOLDHcy2G9rAxURelfkCHkqt1SRKXlZoQtJCJI0/MbUOX8LpoQQt6/VQ44q//q
	Qv1cgAl8pm7wbFlH26MSqzj5ZNUsUp7TcxV58azLaE2tdufe9IQTiVopancLAFaEwBOAENW4Xb1e4
	N6mji1AQ==;
Received: from ip6-localhost ([::1]:46386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeFs-000RAX-Mo; Mon, 25 Aug 2025 20:57:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49608) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCg-000Pxr-2Z
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:54:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Qye+0QmLAvFWq1VgYHM/0X2DGFzZNINKYU6v7i08nwQ=; b=BHGio5iPbrGwtIK6CMZlxdw+Ea
 nTfCCtS8b6yKp2KNsBGEeZ+u/bQjygf+Qs2C5SsF4UeDscV5SbdLujGJ8o4oI2o1iyh1LJ0N7orI0
 QJrBoshNaLzO0x+L5SEadC8ZpB+lSq2i1P9Ydxf8YVtSngB1eCAb47Fz6derzlKmU0Mmm24zkXqn3
 2fJvHo55Rv8ZqNC5H0qfBFlVpYHOvXO8purqc+/rwofI4x+aPf9Hf9Xp6TuXPegucYvRtiVjE7WkO
 ipAZcWiqQqMEYXaz1rkc15WkbtCR0Vh6oZxMl/W3Ct1peaUBnX1dzrDZA5mjxBLSWb+bzQND8Kjfj
 /ZU1EKH2ox+ZLj+2l7+YQLTYqhOpjRZ6fvQmgP+JZOND5gpuKHXaTakxo0p/Etot40DX0PIaQ8Cqq
 eoiVvxRCt+8c45dewJI/5TMqcq9fzeSdwglgIZ4ZDqXkGrsLKLWkeneOyiRELAlwLAapYYwGf1AVe
 EZl9UwxRFukAgm0cDhCk5HoS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCd-000lhF-0t; Mon, 25 Aug 2025 20:54:07 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 074/142] smb: client: pass struct smbdirect_socket to
 get_mr()
Date: Mon, 25 Aug 2025 22:40:35 +0200
Message-ID: <a681d33b42355a4246fe60d0b2d809e91762b914.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will make it easier to move function to the common code
in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 04f86fde11fe..8033be07bc77 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -2281,9 +2281,8 @@ static int allocate_mr_list(struct smbdirect_socket *sc)
  * issuing I/O trying to get MR at the same time, mr_list_lock is used to
  * protect this situation.
  */
-static struct smbdirect_mr_io *get_mr(struct smbd_connection *info)
+static struct smbdirect_mr_io *get_mr(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_mr_io *ret;
 	int rc;
 again:
@@ -2364,7 +2363,7 @@ struct smbdirect_mr_io *smbd_register_mr(struct smbd_connection *info,
 		return NULL;
 	}
 
-	smbdirect_mr = get_mr(info);
+	smbdirect_mr = get_mr(sc);
 	if (!smbdirect_mr) {
 		log_rdma_mr(ERR, "get_mr returning NULL\n");
 		return NULL;
-- 
2.43.0


