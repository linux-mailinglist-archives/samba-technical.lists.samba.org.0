Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D65EB34DAE
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=RJ8ch65eUboITu5ixn4t4Z+9kEC41oIacj4i7Z+Jjbw=; b=4E2TcGJ18qLn0sAz4e1N1mvF1g
	+pxQv13tPK9+uUw8U9XIrID9x2rYud+5zcG2MEdfivS8QJg1GCypBfb0PtpcIaV+NKMrn5JsXA3og
	OReVGH82CG3pxKc8aMfAH5pkyRJ8GQCcPEwYV+XxRanmK6xDz5pyHR+0icpfgJ+orRUg0/R2cAPyJ
	3ZfmOOo4mYFIlAljtMkvqmYDa4sItWEGsukhzOrBVPBTbVGj6YG9TgJV5l3ongHSDEjSrHoiEmRqz
	SEIJa4IWNF2wgbvNgfy1ZWyrCYSkt/a6PWkFdEr3vT4wbseISh3jEuzYmRH1usk9eS0CYXj2IZZAE
	8voA48sw==;
Received: from ip6-localhost ([::1]:61366 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeRn-000WSn-Ty; Mon, 25 Aug 2025 21:09:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10380) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeND-000ULT-RV
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=RJ8ch65eUboITu5ixn4t4Z+9kEC41oIacj4i7Z+Jjbw=; b=gcp3yE98tSkxswMqFd+13e297N
 wLCiYwxtHCIvmg7I5fnKTyzqi5iMO7pwfiCo4Aq6iKOArQ8j14QXTudVGSKhEnJGbV/vtdWdyRf8V
 ICriqj3zIuwTgNjSe0aL3JZJQfKLEhn43gBFlnuyLgYP3r5A+KMiN5AnxjqbdghKQoDeGSjUtxvJs
 TJBBcOTcQ9uf+5RQLC0B6PNrCbR2MzmEaLdUSwcvkTlPjks+j+9qZ86BcbGJ6wlVRuVnLuqzDC0/a
 TGo8QLypMhPsJ/RcYmjQqMRHxyLnAmrfyve3s1bdXmMhPBmYvkcMh72lujun91UmJ5M56oRa8ERrT
 4QBlhwmjg3f0MyZxgeT1uuewRepfl2WrUbl3l3VB9pTQ1LT7+YDx+gEfwYcA0p1jdUH5+9tpPEGyd
 zxbpbDMf5dRdEUNthCxU1H2Fn4OolwpA/ilyTzX88PMi5GDjctf/tRbKFBWpl3eryOfa+X05lliyp
 u7qaJOBySVKc8wmo4aJdBeUT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeNB-000nrJ-0N; Mon, 25 Aug 2025 21:05:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 139/142] smb: server: pass struct smbdirect_socket to
 post_sendmsg()
Date: Mon, 25 Aug 2025 22:41:40 +0200
Message-ID: <47101bb14a30c9d368d00c1edda236c83333f52e.1756139608.git.metze@samba.org>
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
index 0c11855a2a8a..289325640a04 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -1104,11 +1104,10 @@ static int get_mapped_sg_list(struct ib_device *device, void *buf, int size,
 	return ib_dma_map_sg(device, sg_list, npages, dir);
 }
 
-static int post_sendmsg(struct smb_direct_transport *t,
+static int post_sendmsg(struct smbdirect_socket *sc,
 			struct smbdirect_send_batch *send_ctx,
 			struct smbdirect_send_io *msg)
 {
-	struct smbdirect_socket *sc = &t->socket;
 	int i;
 
 	for (i = 0; i < msg->num_sge; i++)
@@ -1199,7 +1198,7 @@ static int smb_direct_post_send_data(struct smb_direct_transport *t,
 		}
 	}
 
-	ret = post_sendmsg(t, send_ctx, msg);
+	ret = post_sendmsg(sc, send_ctx, msg);
 	if (ret)
 		goto err;
 	return 0;
@@ -1625,7 +1624,7 @@ static int smb_direct_send_negotiate_response(struct smb_direct_transport *t,
 	sendmsg->sge[0].length = sizeof(*resp);
 	sendmsg->sge[0].lkey = sc->ib.pd->local_dma_lkey;
 
-	ret = post_sendmsg(t, NULL, sendmsg);
+	ret = post_sendmsg(sc, NULL, sendmsg);
 	if (ret) {
 		smb_direct_free_sendmsg(sc, sendmsg);
 		return ret;
-- 
2.43.0


