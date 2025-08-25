Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9F6B34CAC
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:50:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Z5k2Kw0euVkw9CxnDvatgv5FUhJ5Qh5dxNWrPuY0hIk=; b=CNT+40h5gJ1c3OCzyBHAyxo1+P
	gn9u7UdwZQz6WNCrLwM9TofhEioAs7Cx02/op11Rw0dPIYE5gNoyPyfDut/imbNwRPGCjVrQzTli0
	nphq8FxewP4Wx3GiM+upCK7aROGk+RGMe+ocJepOtoHgH/UG/tfReUu/ZNU4CaDPAvajzarEpikzI
	e4aYwPuRjtNjnF3bRFas3JghPGqkeavqXJ7KGjVSh+Nqnpc14Zy+z1YRm6rqyhG1zZeDGh2mR54Hl
	SaW/jV6/EnaUV0w2a9vApsWAny+Z9gBZ3lasZWS+J8ZVbL0TWZhpGfbKeuuifquLDU6wFzatWi5fR
	73x46deQ==;
Received: from ip6-localhost ([::1]:38474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe9F-000ORM-8N; Mon, 25 Aug 2025 20:50:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65128) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe7K-000NlH-QX
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:48:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Z5k2Kw0euVkw9CxnDvatgv5FUhJ5Qh5dxNWrPuY0hIk=; b=g0CWH6PY0nBSqhRGq/eQyNcEBT
 ONZiGI33soX0z/A+xHNkW3ddKp03RBWTDRtCzvPaz/9JIzifn7P7rUtGHwADbroZERWNIofWBipgj
 NcgnouP+DsMMQi/ODK7FKSk/bfOqlRhAKhLxTOqTOidSaWa6jrut2e50JCPzi9nswaJ0DE9HJ+eO6
 HWdgF7IFTCAR1IbX41YeELazCB7UK+RxSZaPWeHnak8l9CNAI/OFBWjwXEeQrwbuemp7p2ST6m3oX
 BBlZacdOfWYbAxRExG1K6TylUlGxJejHauhQjJ3WT7cwzVx0j3u7FDScpT6mXPZBzKtHg0+ASlthn
 PlIm3o2MdI6cT+2vKEbIJM70b0Ha6tLLKK3+mIk8tpNQ0G+X7hX0hlRezqBvJLH3HhxvAyMN9NI9Y
 u5ykISv5gEuP7PLg7saPA90F/uX2VKEge1+m6Ju2W/w9+eSr8k6EuiOcDCuRHFLuZf5F813Qb6TpN
 TPQpXJZkyVZfWCC/w0klm4w2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe7H-000kaW-1k; Mon, 25 Aug 2025 20:48:35 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 041/142] smb: client: make use of
 smbdirect_socket.rdma.legacy_iwarp
Date: Mon, 25 Aug 2025 22:40:02 +0200
Message-ID: <a79fe2e93bf4a4763c3c8fa55c576bd48296c1d8.1756139607.git.metze@samba.org>
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

Currently it's write only for the client, but it will likely be use
for debugging later.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 2 +-
 fs/smb/client/smbdirect.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index e6c54255192f..ab1f5050e616 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -298,7 +298,7 @@ static int smbd_conn_upcall(
 				ird32 = min_t(u32, ird32, U8_MAX);
 				ord32 = min_t(u32, ord32, U8_MAX);
 
-				info->legacy_iwarp = true;
+				sc->rdma.legacy_iwarp = true;
 				peer_initiator_depth = (u8)ird32;
 				peer_responder_resources = (u8)ord32;
 			}
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index b973943acea3..f5f4188ad7cd 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -50,8 +50,6 @@ struct smbd_connection {
 	int protocol;
 
 	/* Memory registrations */
-	/* Maximum number of RDMA read/write outstanding on this connection */
-	bool legacy_iwarp;
 	/* Maximum number of pages in a single RDMA write/read on this connection */
 	int max_frmr_depth;
 	/*
-- 
2.43.0


