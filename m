Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2931CB86ED0
	for <lists+samba-technical@lfdr.de>; Thu, 18 Sep 2025 22:37:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ywm9q/Q8tEjjpzE6rv35qhNDMxqqhYr7kn0Jp3aYSYM=; b=VkR10utgL/iZPLFLHDWJ5Od1uT
	MusjSDBjHjW0yM/uhZKvXua3vvhmynWyXxqj+LnhdTf35ucGB0CiYJQ0/aVhWjB5x4flnvaM3oW3h
	09vGmyYBLZ3GLNBFcM7imraNirzSbuk819tStLXC2mGCWLNnUxmiLUJd1A+e2PJDUNHIytRw1SpTy
	27RSASD+h9ChRxBXAAbY5DlkYLgJ8bzS6Yh6G7lnyMcnXCmVc4nK8ZPMomyMdYbmzl/dsb66n9UPM
	mj6QkAHNcc9fzrLH81rnMsZLTo5cdNBuyFD6brYCHrlwqhRBoRim9nFgd+i1hACothdIFY9J6S5sF
	4PzGhA1Q==;
Received: from ip6-localhost ([::1]:44830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uzLMx-004EU5-N6; Thu, 18 Sep 2025 20:36:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12116) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uzLMt-004ETy-NU
 for samba-technical@lists.samba.org; Thu, 18 Sep 2025 20:36:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Ywm9q/Q8tEjjpzE6rv35qhNDMxqqhYr7kn0Jp3aYSYM=; b=E1fF4Ly7ZoLhxpzKUH12dKjvCM
 kqQaWjMqrxAEXwbPrQLsLl5zWNGn3lfbb/E5+8ow3IopRw2vOBv+h9DmG6Qwxc5bbMREj0p/5DbQz
 YP1hQ97iqAudtTkiK1dSx6V52tk35C4p3idHRGyE9lm/jcguRfsRtWkXbAcciJ58BzLkTv5QKnlSO
 viOyYXn0JLi20PTH7YPjjo6o3OGCAsvVRgvDVuBA95Mcgl7F2ucsSJKgG1j69EqwqG4PZBOBXbqwq
 z0Ej8DqER/O27tFl84NLsNOrU8C69y/LL+y8yorawP5jOEmm/IuMUF9YoysSSlSoYboSsKMXMuxfU
 nGU2uI7d4ndrGgTbUAv1GeBpiC9ZYpfrnMLbZQDKLC6ALmYIYIE1wVGSwZGcy5KE9PFgYtrKGxO+Y
 I79UtwUxREtKLPgJJnPrdGVsV2gEKG7A7vjN5rU/B+131NhHC0ReQ50o31+ey37RivN8PWxBZNS8V
 4Vvj2ZfCoz3VKCdAUWRQQDyb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uzLMs-004okF-0T; Thu, 18 Sep 2025 20:36:38 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: client: fix smbdirect_recv_io leak in smbd_negotiate()
 error path
Date: Thu, 18 Sep 2025 22:36:30 +0200
Message-ID: <20250918203630.1390057-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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

During tests of another unrelated patch I was able to trigger this
error: Objects remaining on __kmem_cache_shutdown()

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 001224d31e0c..6480945c2459 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1189,8 +1189,10 @@ static int smbd_negotiate(struct smbd_connection *info)
 	log_rdma_event(INFO, "smbd_post_recv rc=%d iov.addr=0x%llx iov.length=%u iov.lkey=0x%x\n",
 		       rc, response->sge.addr,
 		       response->sge.length, response->sge.lkey);
-	if (rc)
+	if (rc) {
+		put_receive_buffer(info, response);
 		return rc;
+	}
 
 	init_completion(&info->negotiate_completion);
 	info->negotiate_done = false;
-- 
2.43.0


