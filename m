Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 36079B34CEE
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ra2IgFt5mosX8C0GPiCAz6yc4/uCl62IWCdvHjh1jiU=; b=4CBqLSPBNwuy+anhKy5tJiUME7
	qEZCAnS/D3LQ7PgeG1NauZ+p+epbrPVmGbSp39QcFISX7yoATJQ0vyM64LaXQkDHfznn5+nkZ7/FC
	eieC5YOkGvFd51jH4keUPfxLUX4mLr41IIR9NOC2obVer6JJkSewO+vh2gikEgr0xe2+yEFhKV9Ij
	o4uJEgNvgRkmVOXaHXMM7M4iz+ymMavNgcImlwsv/pNgPvWDTyMB113lOW9y/xBp6eD/qq0hG4HEe
	Wpu4DY/Hm91F1YwveE3SVAs8cXhGOvPALIJVnvkohWToatBYTFyUvYQch15CcNljXzYaEjLfchGbi
	TZGbPSsQ==;
Received: from ip6-localhost ([::1]:25250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeDn-000QM1-5u; Mon, 25 Aug 2025 20:55:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63350) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeB6-000PH0-L4
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Ra2IgFt5mosX8C0GPiCAz6yc4/uCl62IWCdvHjh1jiU=; b=v8Se3/hT2N0VA60PDVT81TQXeP
 qtftn4RQCWGshBmWcPm6rG4AuRsHrVAiLk/ea4ePFZLeiuEonccJbyfW2UiLbp6xvdZ0BIn4iZipH
 dL3WLYs6WjAlzbJdxinfJGuPsuvfc1H/3YWN6EjbvuyBmRn9pnrmldh8GcFGwsgX6N0Mpfk5UZI4Z
 iYEhUsWbCWdYLQYKvjJ69kRG/BfxzpScQMQwHnqTfVnakeJL/5xyRLcTkq8n4LrCKMFKx9wC8y31A
 z4es8Gv69JN2Kv54m9Wen98AH/32skJQjGOrmKorROMO60SAEqX5BSPYjsF79MpVmVlfaCcUkqkLI
 3LWK+Ot8pn4r0V5WF8DspdZEzWMIvE7VB4tNEo3+/BlIU93CuMclw0J8N7UFym4CMN8q/f+pin8MB
 WzOEpaeFbq4j/Eky8EgLmnRSRCHrnGHEQYt7ep0ISjie3yuj9o6wTjyL/D4+38TbWgWTsQhyJfy5Q
 hQAMLYUKIJ274vs3/TDwK+bW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeB3-000lMF-1d; Mon, 25 Aug 2025 20:52:29 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 064/142] smb: client: pass struct smbdirect_socket to
 manage_keep_alive_before_sending()
Date: Mon, 25 Aug 2025 22:40:25 +0200
Message-ID: <08b9f7d6acf60d9531eab8183f0fd98d51a8283a.1756139607.git.metze@samba.org>
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
index 552eb3d29dfc..782621a844f1 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -938,9 +938,8 @@ static int manage_credits_prior_sending(struct smbdirect_socket *sc)
  * 1 if SMBDIRECT_FLAG_RESPONSE_REQUESTED needs to be set
  * 0: otherwise
  */
-static int manage_keep_alive_before_sending(struct smbd_connection *info)
+static int manage_keep_alive_before_sending(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 
 	if (sc->idle.keepalive == SMBDIRECT_KEEPALIVE_PENDING) {
@@ -1067,7 +1066,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 	packet->credits_granted = cpu_to_le16(new_credits);
 
 	packet->flags = 0;
-	if (manage_keep_alive_before_sending(info))
+	if (manage_keep_alive_before_sending(sc))
 		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
 
 	packet->reserved = 0;
-- 
2.43.0


