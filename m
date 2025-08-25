Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D54EAB34D53
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:02:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=1EZqM+C7CseZMdabrUbnoNqhM8T64V5iIdljTIxw7eo=; b=x8+EM3y7i4Vd/a9xlv8zsWT2wo
	7dca9lzcfjj7eZsEsBt71q58Uck+GNdibgKCSzJqGElnM3bA8jxwOL7KIcMcoKK/e43VtyNID/35t
	SJZTRnE3P3mULkeKuvB5A1Xnx1YApLnOViC4aso6e9WJzqPcveDpn3LvJDm8HdrxuL6PC+C5fcNI8
	EJMeP4qLZQZiAIAt8A0Ogt6Dcusne2UuFQZ+p+JTmNhfZyxASq3Vgk41y1AkZCW3eodGXNYNcydUk
	xquADPkBt1Ptjzl6rINta2ko8ONsJD3bUG7gGabLO6eP0U4SJLgCsTc3IBXPIEF+tbNOPippLtH+C
	58tL2Kiw==;
Received: from ip6-localhost ([::1]:50368 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeKD-000Sy4-Ku; Mon, 25 Aug 2025 21:01:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22622) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGD-000RMd-Ir
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:57:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=1EZqM+C7CseZMdabrUbnoNqhM8T64V5iIdljTIxw7eo=; b=o+s8spXqZ1dJ3izrGAma3Pumif
 Vb2dUzVT0EXs+JD1IzT/7h3Hl9iOQo8oZS+iwC31Km8kYV33NM5bjh+sFa/CT9kojE6qBzKbNrKR5
 XdjHpQxH6usSCn4fyikYr8yPSjCtQEEUY3sYxFDKKIAUcNcsACNo/nexZk2mjdT15pn2Vy+Z9q2ps
 Acfr/fzLbDV2UojxnY62pVm8p7eft7OOcLAHg0kp/xCftGVn0RRAyJ6ou46VaowSpZ5M29TO18P6G
 NT46dpej5n708Z9gFy/9N4Ywn4T68ZEbvDYAqc7fD54EY1Q7mejwRs7szFxob1FCCMbscwBm8n7O6
 rmu8o345yoxaKmFm1B9G6Fen3/nQBFreeDKrD61Reo7E4PaYy6aRXgJI4XEgBlFaxuNTYivAyuy2R
 PixpeWeCRS3gbreMF400LUJDbDyj4jVuYCVr1ZBpYW0Bw/fuExXMDONyejCNMECvXMDcvUgGa7iW5
 1+YYnBuY0JKH6XYTE2r+vBPj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeGA-000mPt-1H; Mon, 25 Aug 2025 20:57:47 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 096/142] smb: server: make use of smbdirect_socket_init()
Date: Mon, 25 Aug 2025 22:40:57 +0200
Message-ID: <6522578c5fe66cf66cd707c11c8f6a3929a2b957.1756139607.git.metze@samba.org>
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

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d5b01748f0c4..f41c82598e3c 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -323,6 +323,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	if (!t)
 		return NULL;
 	sc = &t->socket;
+	smbdirect_socket_init(sc);
 
 	sc->rdma.cm_id = cm_id;
 	cm_id->context = t;
@@ -332,17 +333,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 
 	sc->ib.dev = sc->rdma.cm_id->device;
 
-	INIT_LIST_HEAD(&sc->recv_io.free.list);
-	spin_lock_init(&sc->recv_io.free.lock);
-
-	sc->status = SMBDIRECT_SOCKET_CREATED;
-	init_waitqueue_head(&sc->status_wait);
-
-	spin_lock_init(&sc->recv_io.reassembly.lock);
-	INIT_LIST_HEAD(&sc->recv_io.reassembly.list);
-	sc->recv_io.reassembly.data_length = 0;
-	sc->recv_io.reassembly.queue_length = 0;
-	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
 	init_waitqueue_head(&t->wait_send_credits);
 	init_waitqueue_head(&t->wait_rw_credits);
 
-- 
2.43.0


