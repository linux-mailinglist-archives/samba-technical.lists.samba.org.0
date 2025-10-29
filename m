Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CBBC1AF2F
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:51:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=sMZ7fW9DbAWU81y4mz49GLom1R+WSFHnSMvDkKcbId4=; b=jmxx8Fvbk6D4EUbgYnQhfaVmOj
	KKJNeGxCBHUFEhJX4rwJS38xt9MQnWU7x+EsVDrdMv7tj4Wzs0ZyFWb0TKd2AkYmWYQCYve7gXjX0
	Q0Mi19QW+bOgJkCWb6AI4vUq6ulScdcKRY7JgKr+9REzVrZmAyT+UupIN8/8gb7T3zGkhf0sEnz04
	+lzcPS4NgNI/VaIPkYeycW+7pNBphbDJD8NV/Ogx2iVO0OAfFHej84Kcuyirv4KD/SaDsHLX3duqW
	mHmRMI32fBKIoMxe8iBr5yBAK5vO0Rnu6ysPn/XCGdMVgEHrDvZ+2wIbhvb3vUjgs8MQWMdBZh/k4
	KXQFvzmg==;
Received: from ip6-localhost ([::1]:34688 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6aL-009Ew0-GN; Wed, 29 Oct 2025 13:51:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48382) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6K5-00991A-GQ
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:34:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=sMZ7fW9DbAWU81y4mz49GLom1R+WSFHnSMvDkKcbId4=; b=vZb2Xh9aZWUcqCYzkitHjgLtIZ
 G6v7BHoF2uDE8YayjCgT/7GA8yrk2dw/uWMd+8DwsN5NXRuoW0LZgf+O+jaQCD/wWCxLqXBpjdVLe
 i2LcxNW0If/B5EqHnOxNwvitWRAlsvDBJ2dpAon+QeJ56mSnO0ubZtSp4mGUmYOcTK2o6egvIrTuM
 UeDRPsbImhEZrh2YClPB2flNKNdVJuTZJlLvWgoGwp4Jgx/jZ/A2tCYMEWuciMNdeNWd5P/M9yPVx
 v7J4bpRlZq+sGxSqoyXyIGLUe6Alzr6+Nh49X9YWuk8aSI1HcAvN56dETYWI9Kib+/0cQXqORQ5fy
 Ec2K9Y7I4ctS/pBHLkCMmx2JkFnlp43s/iRl3U38AV2o7taDZ0rJebqFr87V1MWHPpZ1QHdalvAd9
 6ZyyuwV6rrDQtuX6CoXKlqCLFtq1MYH72Dl7gPnKrG1HwuNNwYLsBmeQwQ3GRuWVdgxnqwO89dXir
 mgCP+57NP/Rj8bYFLSWf/9kX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6K2-00Bd6U-2A; Wed, 29 Oct 2025 13:34:43 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 122/127] smb: server: let smb_direct_post_send_data()
 return data_length
Date: Wed, 29 Oct 2025 14:21:40 +0100
Message-ID: <68de896993e35b062dbe77bc86d4d56a2143f791.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This make it easier moving to common code shared with the client.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 8a5183426bbb..070c386dd2ea 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -746,7 +746,7 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 	ret = post_sendmsg(sc, send_ctx, msg);
 	if (ret)
 		goto err;
-	return 0;
+	return data_length;
 err:
 	smbdirect_connection_free_send_io(msg);
 alloc_failed:
@@ -798,7 +798,7 @@ static int smb_direct_send_iter(struct smbdirect_socket *sc,
 						&send_ctx,
 						iter,
 						iov_iter_count(iter));
-		if (unlikely(ret)) {
+		if (unlikely(ret < 0)) {
 			error = ret;
 			break;
 		}
-- 
2.43.0


