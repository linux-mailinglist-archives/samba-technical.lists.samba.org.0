Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BE5B34CEC
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=+1PvEAXB1OcAjywS4RUFc4FKgORPF3OYnxND+tEuJSE=; b=R2rUvJHU2jemJtxvrjHPxZ6U8o
	4wsDBL15rRbHLW8eBlTrDMBZ6WSWXeVOcrbAgAOuP3h9SvxcfD2hzc8z8HENOTpaWHcB9+OjpWKzO
	ybFOY99cexxwvaTZFtFiQlYTjihOjZm31oUglQVZGIflcGPUKrRBIW4oVWEDWT6QPfiLBXMuPeWTX
	QwKRUOdhiqi6YpcVB8zs0x3T3CCT9OdsKOVxjahyp57zw2z8+zb+pikm24NBmhlWY0wCyhV3KboH4
	iNUULjOg2DeFAFuLwMEvgdn3VepnKxtHxi8YphalFzMIOcF8wPUM84dQdn159oR/1zXlpo7Ncvtzc
	ostUGYvA==;
Received: from ip6-localhost ([::1]:40328 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeDb-000QH3-FC; Mon, 25 Aug 2025 20:55:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27360) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeAx-000PDI-6F
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=+1PvEAXB1OcAjywS4RUFc4FKgORPF3OYnxND+tEuJSE=; b=MFXa8hk6uibXA+7oxTtapRp6bh
 VzJBauGA+IyTaqQ2Ak7FYrMr5TF0QEyDo9EVQjDmIS530HZ9VQ9TJ+E9PFGQV0oym2ubQW3rASGek
 acTORq9rrTC55ygE7R9wC6UgY5X4yMTEJlwGJyrpZsBWkn/+7tJEnRH3ktHTusPaZqc3ZYUEkPHKa
 jXL4uWov98DU4nKowEFVtYbNCYtq0GEcEbVu12wWskG7YJjWWh72FqtIPk6xXnxDU3txlQsb/jXsK
 4C+lmD1o4/dfBHFDwubSONkKA7snJAOwTpsbG5znlJhJG+4Tzdznn0yx+H+A1vL4lbTlLLc2f8aqb
 zXpRyNwo346G/5/zPUl9qaVEvC+6VQ00ihyPH2oj1w8i8aNoE/Pz3ESANob5W9oLTlW8gafgnA5x7
 4HZ3OO/8IPCGVqyGzvfF6KCi5QrXhe2jrj5GQWqu2pxUlKAy3ibwcmKywpCDtN0xUtsGh2Gbdan6/
 Ib8zcs4xy89yXiKan8syxan3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeAu-000lK4-0K; Mon, 25 Aug 2025 20:52:20 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 063/142] smb: client: pass struct smbdirect_socket to
 smbd_post_send()
Date: Mon, 25 Aug 2025 22:40:24 +0200
Message-ID: <a0b3ab48a8ccdd8ae68ef080002753cfdbc6b19d.1756139607.git.metze@samba.org>
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
index 148ba5449b66..552eb3d29dfc 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -957,10 +957,9 @@ static int manage_keep_alive_before_sending(struct smbd_connection *info)
 }
 
 /* Post the send request */
-static int smbd_post_send(struct smbd_connection *info,
+static int smbd_post_send(struct smbdirect_socket *sc,
 		struct smbdirect_send_io *request)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct ib_send_wr send_wr;
 	int rc, i;
 
@@ -1107,7 +1106,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 	request->sge[0].lkey = sc->ib.pd->local_dma_lkey;
 
 	atomic_inc(&sc->send_io.pending.count);
-	rc = smbd_post_send(info, request);
+	rc = smbd_post_send(sc, request);
 	if (!rc)
 		return 0;
 
-- 
2.43.0


