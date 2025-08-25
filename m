Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A587FB34DA2
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Y7eupOoAXXEC+dStY3lgbtiJEppQQwLLejW9ZOYjnhg=; b=2IXCn/KNhJcqokwDGbE41tIMPd
	BFE5PIfuRlQ0C4+zHKVTKtBY97MZh9MsaJgILmRiK2JatY+EyAQIivzgKRhBziPaA1C3YursuhJ5G
	qtzh1IJ2zvidNiPDOR2npQ/LqNOFHj79+FKrroAyHXXoSe2f0F6ELf6c24UMZ0cy2EDvxT+6Pm7wm
	VHychI/82hqKkjsandBVYLFXaVrgERnVQXSolHbP+quMPaSdtGrqJcL2qQ/GxYfew2mwLykUUXWc6
	Xodkb1bewzaRrVj+/zPvSIzdkEX7PsJfhv1raQuglDaERMdJebyZ0f7b30qzCqmTy/NK61EViWqKl
	WlbvdnGQ==;
Received: from ip6-localhost ([::1]:23690 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeQa-000Vuw-Pq; Mon, 25 Aug 2025 21:08:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43172) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeM3-000TqG-SK
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:03:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Y7eupOoAXXEC+dStY3lgbtiJEppQQwLLejW9ZOYjnhg=; b=q2Gz0AuDXm/ZGTdhAjU20u0ced
 KIB5aEXKQ9UrD8rMW7P6gdpSoo8KAX0qxkc47j57112pIgOcxxCA2qSjCcHISCvhFuQ//xq2gUiSh
 52YKQJZO9MyWmZVc1sQe29vIhs/bbCRf6GCKDTO85Gqw+B6u7ElL7yL2I0+kmANebj1MZchu5+USP
 e427sfskASjIK5VG5slgUZwwr6BlADaPwf9wzxjswwROGjWeqhK36QfrgL79b1PxEyAg077NACPqW
 X2/23b40GS/dB3kB0c61ipzXTmNAVzoqyDHw9Iw0MkYVUSvXFRnROB/vUx9TLdSv6GZqJ9YCQqH3F
 9sKIjQ5Gg9lYRkLjjCCz25W14ZL9/RRk2kA4IdLrR3u+A6vSZVV01rKXhDovGNehy/iFMyJlSCY+P
 ADbd4viEjVt6+yMcZylMvUN7F5uY4Qqs5FuXOktPpASEXdcSQARrEd3PjibDIxf+o8WvOXi+xqHmF
 3aqnnwJsUVtWpcVYwkyZnzKZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeM0-000nc2-1L; Mon, 25 Aug 2025 21:03:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 132/142] smb: server: pass struct smbdirect_socket to
 wait_for_credits()
Date: Mon, 25 Aug 2025 22:41:33 +0200
Message-ID: <ccb33477d02502775c28206860e514c33f1ee2d3.1756139608.git.metze@samba.org>
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
index 39ea9c51a24b..370e27bbcf12 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -945,11 +945,10 @@ static int smb_direct_flush_send_list(struct smbdirect_socket *sc,
 	return ret;
 }
 
-static int wait_for_credits(struct smb_direct_transport *t,
+static int wait_for_credits(struct smbdirect_socket *sc,
 			    wait_queue_head_t *waitq, atomic_t *total_credits,
 			    int needed)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	int ret;
 
 	do {
@@ -981,14 +980,14 @@ static int wait_for_send_credits(struct smb_direct_transport *t,
 			return ret;
 	}
 
-	return wait_for_credits(t, &sc->send_io.credits.wait_queue, &sc->send_io.credits.count, 1);
+	return wait_for_credits(sc, &sc->send_io.credits.wait_queue, &sc->send_io.credits.count, 1);
 }
 
 static int wait_for_rw_credits(struct smb_direct_transport *t, int credits)
 {
 	struct smbdirect_socket *sc = &t->socket;
 
-	return wait_for_credits(t,
+	return wait_for_credits(sc,
 				&sc->rw_io.credits.wait_queue,
 				&sc->rw_io.credits.count,
 				credits);
-- 
2.43.0


