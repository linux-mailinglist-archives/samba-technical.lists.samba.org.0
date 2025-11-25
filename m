Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0A3C86985
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:25:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=yx29IRSPTEj5WdbgpxQC8gQnfaOTpE2ScNvCf6oxdfk=; b=iM96Gb3Cwve6/CSajDwTLfD1KH
	MJcrrwkewXaBxbiaBHpYIxQgmc93uDxdrSNFYuydhd2cSYCr4VJIB6RMiNiNHNQYmi6ILD/a5WfER
	4/J5A8xosMiHdX34gHwvgweTsBKkmx46U589vSdFbOjf+hoZ978JfRxKtl+E9iAXEtjl9zC1iIrBd
	Iw/iCvwj1kGI4zYUs43WuayB3MqLLvL1dq6bVhXWLc/rbKAbfakWBTBLd/a7QA0r0lzaGe4GQWNlh
	00HlWV2XYhZw2XvJjCcmO2UCD4DAmwLodrl8kLlyPoVdtBBj/Q3SZpIrux2J7B4DZ63RBd4FtAwWK
	ke3LVbog==;
Received: from ip6-localhost ([::1]:47442 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxjD-00DFQs-Hi; Tue, 25 Nov 2025 18:25:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63790) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxgf-00DEkA-7G
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=yx29IRSPTEj5WdbgpxQC8gQnfaOTpE2ScNvCf6oxdfk=; b=b6+yWbB7tf1fxHUdUC+f1eQqAA
 GEqbEo3BvpXWab0Br3l4e9mOqOQYSTyOO0jsDNw7Ea+e5TLt9kp1qSH89uZM3vfHqrxMEsKRl+rhK
 qZz3frRXBi6xbEkLO5UbhnB4WHR+ekbegULEtMUiWCp9+zIX9o/GD6UefQF7wOxXPGJxFa9VfA2ks
 1o6wBQFOqKX3373zculLzQZhGNqzw3lRiXqPURjTIwii+03hE5uImQ3Zb9t8KuW3PMqXQr00P8N8Y
 4frbOnu//5DbTSNqNM4WPTTRTVODHicNJ3BofSs3ihtuNw09A45ncZ0D0j6PYVPfD0q62PwZ2+ur9
 QOj2AetTSjsA6UcPkgqPVrEImaSDAzbvbmMWaDBppW9LD++2c8sc54V4QtMsOidAMsQ0PkB2Fru/K
 fwOcj5vjz3kmBXMa3D9HGg8G/RZo30A84G7s8rkzOJrfZNqK9rd3th/F23jlC2rUADGRL5V11vaUe
 4874A7sa5ysnL1yqYX3RnrTO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxdd-00FfDd-30; Tue, 25 Nov 2025 18:19:42 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 118/145] smb: server: make use of
 smbdirect_socket_wait_for_credits()
Date: Tue, 25 Nov 2025 18:56:04 +0100
Message-ID: <76cb5e35218ac111d61b732f52dcfc617ec36d00.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will allow us to share more common code between client and
server soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 48 +++++++++++++---------------------
 1 file changed, 18 insertions(+), 30 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index ca587ed6acce..84ea45058cb5 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -768,27 +768,6 @@ static int smb_direct_flush_send_list(struct smbdirect_socket *sc,
 	return ret;
 }
 
-static int wait_for_credits(struct smbdirect_socket *sc,
-			    wait_queue_head_t *waitq, atomic_t *total_credits,
-			    int needed)
-{
-	int ret;
-
-	do {
-		if (atomic_sub_return(needed, total_credits) >= 0)
-			return 0;
-
-		atomic_add(needed, total_credits);
-		ret = wait_event_interruptible(*waitq,
-					       atomic_read(total_credits) >= needed ||
-					       sc->status != SMBDIRECT_SOCKET_CONNECTED);
-
-		if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
-			return -ENOTCONN;
-		else if (ret < 0)
-			return ret;
-	} while (true);
-}
 
 static int wait_for_send_lcredit(struct smbdirect_socket *sc,
 				 struct smbdirect_send_batch *send_ctx)
@@ -801,10 +780,12 @@ static int wait_for_send_lcredit(struct smbdirect_socket *sc,
 			return ret;
 	}
 
-	return wait_for_credits(sc,
-				&sc->send_io.lcredits.wait_queue,
-				&sc->send_io.lcredits.count,
-				1);
+	return smbdirect_socket_wait_for_credits(sc,
+						 SMBDIRECT_SOCKET_CONNECTED,
+						 -ENOTCONN,
+						 &sc->send_io.lcredits.wait_queue,
+						 &sc->send_io.lcredits.count,
+						 1);
 }
 
 static int wait_for_send_credits(struct smbdirect_socket *sc,
@@ -819,15 +800,22 @@ static int wait_for_send_credits(struct smbdirect_socket *sc,
 			return ret;
 	}
 
-	return wait_for_credits(sc, &sc->send_io.credits.wait_queue, &sc->send_io.credits.count, 1);
+	return smbdirect_socket_wait_for_credits(sc,
+						 SMBDIRECT_SOCKET_CONNECTED,
+						 -ENOTCONN,
+						 &sc->send_io.credits.wait_queue,
+						 &sc->send_io.credits.count,
+						 1);
 }
 
 static int wait_for_rw_credits(struct smbdirect_socket *sc, int credits)
 {
-	return wait_for_credits(sc,
-				&sc->rw_io.credits.wait_queue,
-				&sc->rw_io.credits.count,
-				credits);
+	return smbdirect_socket_wait_for_credits(sc,
+						 SMBDIRECT_SOCKET_CONNECTED,
+						 -ENOTCONN,
+						 &sc->rw_io.credits.wait_queue,
+						 &sc->rw_io.credits.count,
+						 credits);
 }
 
 static int calc_rw_credits(struct smbdirect_socket *sc,
-- 
2.43.0


