Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0928B34C4C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1nzp8IuvxdyWUD84dgWr7xE4PHMAucRQUfJUXn6B7ok=; b=IjFBEIGuluLuzLW6d8CvWfwKtV
	2zZSoUfyJd7cEVblpzUg+IlrIiw1vskb7shI4pUJSMMFHrcoICjcutcjgEzAVDcWwMnNtzq/64jpK
	lbe8dmgb1Uis3+AlqFrM54ubkO1xvw9ZenIUZvLBtiNhkg9mcZZ6DO9gy5fCrcl7+ZZhxSvLTi5/H
	T5HLAJQl4KXK2ydVzfoxumltIF00Z2fpCPV0EbNTeMaBjQUXOgbabA7DD5YNaWCTs3joJaOmeo/B9
	Y+CMLYvLCXT4Tsppl18qaq8jMfAJuTD8yPeTKPZSWPt3+7LpTJCLrlSox7brc81wIE8H93/7f1Lkg
	ZlyNNHBA==;
Received: from ip6-localhost ([::1]:54800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe2P-000Lfi-3f; Mon, 25 Aug 2025 20:43:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34876) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1v-000LXb-ID
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=1nzp8IuvxdyWUD84dgWr7xE4PHMAucRQUfJUXn6B7ok=; b=PmYF6afEHAuDGpwctgmegrXNTo
 otH1WLv/DnGqG55wbX7GhdyoUQkkunvBifMktWIRR08m6/qIXnFjhy+Qdz3YAAI5KgK+2GX3yHfal
 lk7lO5Bil+1378obl6aKEw4LOn5b6Dl/tMa2ceCGAjzBIQbSgZogPF2y4tfqYWQcUCNdfVu+EyGO/
 zgB/PVcoM5yoabfp8XQ3DbOQNtXPsxyPdNwDZ4BMLSEhjyqeYkWWQiWycBwLLNI03gfaWHUGIWlfg
 egdXmv0cjOnaOqhJfo61/PBGyYHpghSFFqyM6/tfuf06o75lyK6cyZ/6QeDKsEmfHiWLdViIbwR+b
 ysjlkw9q5FfJ+GVDddRGloIheZ35N/T26BzvoLUvk8+oQSLW1Fj/HKGX4p10AuHoWS5Z9FX4NBYg2
 sU+aB8LDwHbJcelOHp9/C3KKnF9Wqb9dQzYjC0VKjKSkHytbTzGUhTgioPcR6Cfl94B/JTKpufEI4
 qVv1Zc0FNqm+J0xIj48aF5ya;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1s-000jQ6-22; Mon, 25 Aug 2025 20:43:00 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 006/142] smb: smbdirect: introduce struct
 smbdirect_send_batch
Date: Mon, 25 Aug 2025 22:39:27 +0200
Message-ID: <9b68b1b21eef8831cac06eee3529b6ff862aecf4.1756139607.git.metze@samba.org>
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

This will replace struct smb_direct_send_ctx in the server
and allow us move code to the common smbdirect layer soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index fc52c85a32fe..ef6f330ba7d4 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -177,6 +177,23 @@ struct smbdirect_send_io {
 	u8 packet[];
 };
 
+struct smbdirect_send_batch {
+	/*
+	 * List of smbdirect_send_io messages
+	 */
+	struct list_head msg_list;
+	/*
+	 * Number of list entries
+	 */
+	size_t wr_cnt;
+
+	/*
+	 * Possible remote key invalidation state
+	 */
+	bool need_invalidate_rkey;
+	u32 remote_key;
+};
+
 struct smbdirect_recv_io {
 	struct smbdirect_socket *socket;
 	struct ib_cqe cqe;
-- 
2.43.0


