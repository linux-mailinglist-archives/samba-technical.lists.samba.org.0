Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3B3C1AD69
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=T7xlnEa4PhrAtzipy5xpLO6Xbg8QdMaauTa9svLYSeI=; b=CPj74bh2fyTvGgI602HV/6KOZt
	evisSYaZ8fJHTMxjA+x2DJKF0M4cHBvTfDuhpRfpXGc0wPz6Yz1446z2Qnc6SM+hR41nLZkaeezou
	MqoIiMYv0kpLi6itGCnK+29TcdS8y2g0xHGhmyazt2Cmg/YyfxSm3xvtRnkbMMUkqyk35G+vsedCq
	zZGQrOD/X96StM+feLTSM+DSGzk19d8ofYhvGtMt3glJH1EbhOh+60H6cPYJpRljTEkC+yH/x92hm
	kpaPHm8zBQvKPK9veqFPcJy3OvKu7jvhQCmS10Z+eFmDTiaFtWGr7ZER6qyjLQkpoSlfZnjHQme8i
	M7v7DPsA==;
Received: from ip6-localhost ([::1]:24208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6RT-009Bf4-Bt; Wed, 29 Oct 2025 13:42:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44006) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Fy-0097bm-4I
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=T7xlnEa4PhrAtzipy5xpLO6Xbg8QdMaauTa9svLYSeI=; b=m48SAipM9O2PpAOfh6w1j8MqGN
 GQ7J0iZoGqbDA/PpEvNM2ZPXklKPnW8tJvX5hXyN5WstL9dLx2P7ev6q8G5k3nPlMInir/FY6FH1C
 DreWnaDUHIeLKIlDhegR+NOQrQxue3pIlZk0FKNwzFkJxXp2pHo9oWc7tMkmTdNKY1J/gDsRSCpl+
 m0vY+6ErglZMs5FVhCCVEIErp/6I8w1XkXQ8Oq7HUHcxl/9CFLmg/qWcPUHY0TLsV5JAVOEOY25Vr
 ZTqqJhrV0IIKpvaC29MJ67T9Voj/tqUuHRBBPwt4Q9r4t34Pm79SoN7P3YirJ1BYtLtuSijWE388i
 LqDzh123e9kzBuSMPFfojVxr7ZsM/eNG1gTg0faCqQMDxxzujv8dIYeuNojoE4k9inFrD8CPMshKM
 rbGDe1/N7LJaThoim7m8RylLRzQ2GqFqXL83fuciiuzyKRCrTCsz3GaiopkgqvW70zgMP8/E+s2XS
 dGbvk6ksK61zLMhfs0ICG/ru;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Fr-00BcOU-1A; Wed, 29 Oct 2025 13:30:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 080/127] smb: client: make use of
 smbdirect_connection_grant_recv_credits()
Date: Wed, 29 Oct 2025 14:20:58 +0100
Message-ID: <4c474fcfaa14b461edd8fccf31936a76005b5354.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

This already calls atomic_add(new_credits, &sc->recv_io.credits.count),
so there's no need to do it in the caller anymore.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index e2f93d4af0a7..cb1e7dee9be7 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -730,32 +730,6 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 	return rc;
 }
 
-/*
- * Extend the credits to remote peer
- * This implements [MS-SMBD] 3.1.5.9
- * The idea is that we should extend credits to remote peer as quickly as
- * it's allowed, to maintain data flow. We allocate as much receive
- * buffer as possible, and extend the receive credits to remote peer
- * return value: the new credtis being granted.
- */
-static int manage_credits_prior_sending(struct smbdirect_socket *sc)
-{
-	int new_credits;
-
-	if (atomic_read(&sc->recv_io.credits.count) >= sc->recv_io.credits.target)
-		return 0;
-
-	new_credits = atomic_read(&sc->recv_io.posted.count);
-	if (new_credits == 0)
-		return 0;
-
-	new_credits -= atomic_read(&sc->recv_io.credits.count);
-	if (new_credits <= 0)
-		return 0;
-
-	return new_credits;
-}
-
 /*
  * Check if we need to send a KEEP_ALIVE message
  * The idle connection timer triggers a KEEP_ALIVE message when expires
@@ -828,7 +802,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	int data_length;
 	struct smbdirect_send_io *request;
 	struct smbdirect_data_transfer *packet;
-	int new_credits = 0;
+	u16 new_credits = 0;
 
 wait_lcredit:
 	/* Wait for local send credits */
@@ -920,8 +894,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	/* Fill in the packet header */
 	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
 
-	new_credits = manage_credits_prior_sending(sc);
-	atomic_add(new_credits, &sc->recv_io.credits.count);
+	new_credits = smbdirect_connection_grant_recv_credits(sc);
 	packet->credits_granted = cpu_to_le16(new_credits);
 
 	packet->flags = 0;
-- 
2.43.0


