Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B86B34CF6
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=tMx5Ah+SuJ38Wcv2vHqUr6QFUs4jhB41lsRYxeWB10A=; b=1oHPiqbbyoV6rFODQN7oeUMcTS
	SLhc5V/Xf4q2s/ZhNSOSSzHcmWvnUbbeDnsOqpawd2PPr0bei84pI2DymU1rDdzZIE15zs1ms0HuR
	gkBZqhBs8U+95jvrQN3mQAfFFHp6dwV1t1lEPWYR/kflWPv8YZ437YHduii06yWy8sxfsSis8usBe
	63YIYnzKIfg7N/87k1m3TMJwpGYbhrlpUUs246Vp35lAXPvniDHhDbNuDrAMbyzNa5EsqAgefjfCj
	ZrRi5iPVKLULYSmp+iwywDvJL6k/6beSKcWuukVkLAfzSGAW9QsSjKgAUndm4BFzH4LPUxDyiksXv
	P0NJiTVA==;
Received: from ip6-localhost ([::1]:20086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeEN-000Qbl-FH; Mon, 25 Aug 2025 20:55:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28536) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBO-000POr-Hb
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=tMx5Ah+SuJ38Wcv2vHqUr6QFUs4jhB41lsRYxeWB10A=; b=nAQXHIaNEQd74PwyDKdgi4tHpp
 flHCCdVFWRvJaZHA7dzCWOrZOgGv1oryPOOWqxm73zbme5my6RvY9dNfxRjOryBCPY3I2Tz6gmwDi
 BiI1lPAiYC2hGovz7BW770St4QdCPsFj98ExruujyJ9E4dgOXlGonSJ4nwru+xQbqmRq/936MgG3C
 fluksIxEhK9nbgXRkhD/V9jct3ShERN33swn6Y2lfSoW8KyPt0GRk9ermTN2KEjS89PvuJDz/HpTS
 cqD1tiyBlk5MjzlKwwN4jCr8VXplSPTD+liTZIhlbnkqWUnppV3l0tHKX1G4fFoxpcpfrhyuzBJju
 e6Rv0QQy52djfw39Khxlot7B9J9E2IJZn+MKdrhJupkExmC0YEca08rYU+UIS3ru83leF1fZhOpXJ
 ikwyq9pOuRWI/6o47ZCwsyfbcQCNjuYDgp83BIj0LocMR8igSZMl5C75Njj2V4mRoTkONbDTe3Dgo
 XUKgHODrgzL5RgExYxrwSMda;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBM-000lR1-0r; Mon, 25 Aug 2025 20:52:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 066/142] smb: client: pass struct smbdirect_socket to
 smbd_post_send_empty()
Date: Mon, 25 Aug 2025 22:40:27 +0200
Message-ID: <f35d07ab7d5d622b3ce13767a466b0f9b96d6bb0.1756139607.git.metze@samba.org>
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
 fs/smb/client/smbdirect.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 40d0233f41df..b9ea58e8db46 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -38,7 +38,7 @@ static int smbd_post_recv(
 		struct smbdirect_socket *sc,
 		struct smbdirect_recv_io *response);
 
-static int smbd_post_send_empty(struct smbd_connection *info);
+static int smbd_post_send_empty(struct smbdirect_socket *sc);
 
 static void destroy_mr_list(struct smbdirect_socket *sc);
 static int allocate_mr_list(struct smbdirect_socket *sc);
@@ -1137,9 +1137,8 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
  * Empty message is used to extend credits to peer to for keep live
  * while there is no upper layer payload to send at the time
  */
-static int smbd_post_send_empty(struct smbd_connection *info)
+static int smbd_post_send_empty(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	int remaining_data_length = 0;
 
 	sc->statistics.send_empty++;
@@ -1390,14 +1389,12 @@ static void send_immediate_empty_message(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
 		container_of(work, struct smbdirect_socket, idle.immediate_work);
-	struct smbd_connection *info =
-		container_of(sc, struct smbd_connection, socket);
 
 	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
 		return;
 
 	log_keep_alive(INFO, "send an empty message\n");
-	smbd_post_send_empty(info);
+	smbd_post_send_empty(sc);
 }
 
 /* Implement idle connection timer [MS-SMBD] 3.1.6.2 */
-- 
2.43.0


