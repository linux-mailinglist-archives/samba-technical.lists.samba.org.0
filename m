Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 491C3B34CFA
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:56:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zLf2RtM76VRdg4KdmDxGvFQs+F9fuU4yNYLuLom9MUs=; b=UKr9Lz07BqX3mzdViFNIPaHPs2
	odALtEYc5JZy3tuu26lqtjEWY47dVhPQzGEVgLJ4d3t7mZ91DA+umZu3VKQyTL1pr2JhXeFkjLHEM
	vPvXs7ERSeVV8QoS+bUQqh6WxnuU6YI1VtveaTky/SZJgxg4OgmoNpYVaNZzB9Ra3F+6WCA2+p5i9
	kFneLwM8MbJpMt0QC8nTNdetaxA8xapTybXDwFk66nQzmHYtrIg11fOkvPsvNXT9lYnnyAO9uI7oe
	8OYECu/FBZrQqCpQBG0iKurpifs5Mj+7xEG+F+JWMFBwoE9BQar6DpeEk8XP5W4oCxM2ySRW0F5r2
	YQC6PueA==;
Received: from ip6-localhost ([::1]:60382 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeEl-000QhJ-V1; Mon, 25 Aug 2025 20:56:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10672) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBi-000PY9-Fb
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:53:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=zLf2RtM76VRdg4KdmDxGvFQs+F9fuU4yNYLuLom9MUs=; b=laNKxDKDkrQqAmZghJk0YPkkzQ
 0QrOMdxjZD+mdOC1Ydn6ycBiZgTa4dBbHOV22CPSWJ7OwE/wdCnJGkC1djM+qCbNu5yiyn0esOysX
 NfYVqAKl+1WSt39FA3XQxOfOJFmLXpTooVgzaKwRG7PS4fa5hmHyCsDNWpzeMRZJWKnmB0pPRoZEd
 aYxQbv40bHqJSRxYQK7heKx1gPRYuDspjsmIyXMudXpqQTF2KP6mNoNw6kHKNJDHf7CtGAKva5n3s
 wgwV/g+5IDkT0ELiqDOfglnE+0yFLsDPy76Grore+SCGKi0weCZOveSZNB/VmT5iUXYdF/taOkT4j
 IDRqJWyXyWvQ45+sRUp9pxxe6dponyNhCGLs2G70PCodMkgon2zdsiWxe9ABx87mOMXpU+7hcV+Pe
 MBV9Y61o/YAQMuyHxSj/ngWxssVtSKRs2/7R4Fe7w0YZB66HEJLLXIrLliqkkUT5TU6f8ndsSNkoN
 /z+ux7kCgSp8CCccGwhz4vHS;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBg-000lV3-0j; Mon, 25 Aug 2025 20:53:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 068/142] smb: client: pass struct smbdirect_socket to
 smbd_conn_upcall()
Date: Mon, 25 Aug 2025 22:40:29 +0200
Message-ID: <50246a1a2cf8439610d387254b848745ad56902d.1756139607.git.metze@samba.org>
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
index baeda2192a27..8ef4d8319833 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -223,8 +223,7 @@ static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 static int smbd_conn_upcall(
 		struct rdma_cm_id *id, struct rdma_cm_event *event)
 {
-	struct smbd_connection *info = id->context;
-	struct smbdirect_socket *sc = &info->socket;
+	struct smbdirect_socket *sc = id->context;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	const char *event_name = rdma_event_msg(event->event);
 	u8 peer_initiator_depth;
@@ -684,7 +683,7 @@ static struct rdma_cm_id *smbd_create_id(
 	int rc;
 	__be16 *sport;
 
-	id = rdma_create_id(&init_net, smbd_conn_upcall, info,
+	id = rdma_create_id(&init_net, smbd_conn_upcall, sc,
 		RDMA_PS_TCP, IB_QPT_RC);
 	if (IS_ERR(id)) {
 		rc = PTR_ERR(id);
-- 
2.43.0


