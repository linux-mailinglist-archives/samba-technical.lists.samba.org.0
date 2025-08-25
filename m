Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 047F7B34D9E
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:08:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lts/FKhso1txEJ7cisPtnLdMQEn3Vhg6twxLZ5IsVi8=; b=sYB+pJJJ5uz1a5+0l3nWK1b38/
	cpzVWoS1fXx1yAbfhR6emgNf9Pnb4+i4ziICNjmZWV0N8v2B/gJLmIAyDsjc3tZCcoenLIoKvFo3i
	ueR7yL/lZ1G1SRHoFmYluKVxiaJG0c+bAD8MxaHn6q1A18957EIPMJQSKFPKx2asjkYDSfnCxjI62
	rDbDYw68ooA93zl8EjBwFY/H8k8LsT6rDAzB/acsFfGCNBtit532ZnRqcPkoIRHKVxyjrc0jUwyct
	P2wwPqLxllcHvirCeVaP31EGSktRcCHLRiRn0osYazKjc2DalzQ8t580eNEXyDbBIHxd6nRAPG3Su
	Qb9aC6iw==;
Received: from ip6-localhost ([::1]:41740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeQ9-000Vcs-3W; Mon, 25 Aug 2025 21:08:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64224) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeLa-000Td0-QZ
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=lts/FKhso1txEJ7cisPtnLdMQEn3Vhg6twxLZ5IsVi8=; b=17nAGOVx2vHVEeExFOsDtwgFrJ
 o8ZjvvkGaQp9YysPyjJEUvcWUK/lhF5IfHnU2zyJQpQlxsyqBnOG7dE4jiQStef4c2CVPDdSOQk27
 yHk/0sduXwx4Zpdi7OpMgF0ajabuZi9MiVGYEGdOEBEnmIAkH/4hcI9HOub2uHtVVa6E2vdmBX2Ra
 mk3L4n3hoA8qwOM2JNaW+xqN7vw3gjjK6gMbFQ3/VsC0KMtvygYmvBsVsQfsOF0ze9x/dAMSwPUel
 sBUA3DoqvUqrhY29yu7ZbyUI0HxVthEnsNUztUw+OkdUdBkrvwpWtqJPEHWfBzs69XGuC2yhAWzi3
 yAbyz+y8D+EU4yO9DZQdKQ4e7rTrE4xI/nkSs0mJHjTv/lpoWrLDRkIXDUtq3imUK5W1+E4wXfB9+
 gsdLJyx/Xmf94OMrxGi0ru7xAKnYoLir2QvSuMLvoYkklhBj08LFOjqylYrj5UUQ8Adr7fvDFI6RK
 +mKJsRbwjHZ5XVbAmLNYzRmN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeLU-000nWD-1T; Mon, 25 Aug 2025 21:03:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 129/142] smb: server: remove unused struct struct
 smb_direct_transport argument from smb_direct_send_ctx_init()
Date: Mon, 25 Aug 2025 22:41:30 +0200
Message-ID: <ccf672589adf8f6805efd8d2b87a31e85b5126f7.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 95f9552ef843..d2e587ae3931 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -896,8 +896,7 @@ static int smb_direct_post_send(struct smb_direct_transport *t,
 	return ret;
 }
 
-static void smb_direct_send_ctx_init(struct smb_direct_transport *t,
-				     struct smbdirect_send_batch *send_ctx,
+static void smb_direct_send_ctx_init(struct smbdirect_send_batch *send_ctx,
 				     bool need_invalidate_rkey,
 				     unsigned int remote_key)
 {
@@ -934,7 +933,7 @@ static int smb_direct_flush_send_list(struct smb_direct_transport *t,
 
 	ret = smb_direct_post_send(t, &first->wr);
 	if (!ret) {
-		smb_direct_send_ctx_init(t, send_ctx,
+		smb_direct_send_ctx_init(send_ctx,
 					 send_ctx->need_invalidate_rkey,
 					 send_ctx->remote_key);
 	} else {
@@ -1245,7 +1244,7 @@ static int smb_direct_writev(struct ksmbd_transport *t,
 	remaining_data_length = buflen;
 	ksmbd_debug(RDMA, "Sending smb (RDMA): smb_len=%u\n", buflen);
 
-	smb_direct_send_ctx_init(st, &send_ctx, need_invalidate, remote_key);
+	smb_direct_send_ctx_init(&send_ctx, need_invalidate, remote_key);
 	start = i = 1;
 	buflen = 0;
 	while (true) {
-- 
2.43.0


