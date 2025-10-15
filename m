Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1638BDF406
	for <lists+samba-technical@lfdr.de>; Wed, 15 Oct 2025 17:05:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ZNWKftmubrYzpqhCtL3gCegnsbPkOp1kDN/0FRZLnh8=; b=Q7w6Kl4UUpRpRYtXvQ6pmAZRr9
	TTJojzelfJoLVB1MVabKoSJ53VIiTxkDYO1h4w48Za1r/f77lvw+dXEbo7qdUHKEk1phlJxaP6txD
	SHOpg40xG6wLM5FDYjnWrgpUCWg+syr714HALkT7EetZtqbh0j3sGtwHsZih7NSkG1xgkP8D21B7Q
	KFDvRjPPjaWX9cQRVgX7A+6xcy2kRLZwHFrEP0NCHJQlyfY7uu8kZM7bM5f0M8HCsdh4DZ4BYHwg8
	JSNE5HX/uO1coGOlKBibWi+BnCAdivxw3eUwET91CTZvwO5HCn/vGXvsDF5ULp5IwuFwLIFDePRrt
	2S7tsXfg==;
Received: from ip6-localhost ([::1]:58118 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9340-007rAb-PB; Wed, 15 Oct 2025 15:05:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39302) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v933w-007rAT-AB
 for samba-technical@lists.samba.org; Wed, 15 Oct 2025 15:05:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ZNWKftmubrYzpqhCtL3gCegnsbPkOp1kDN/0FRZLnh8=; b=XwnwGvY4i7Y9huZDK8S05SjtBx
 XZAO8snTqs/OMFxAbZ69x3vVrJKTEIFVhW2yyCH0BJYfPkjjKRT7syGfq8yZTN5somNCoxPoPnXev
 i7eIcx1/3HRAx/YIiSYFO146/pYiJm/eFs2UbUuR6uGqwypKDfMla6nfNSh4j+KKhtDraMlB30btt
 wbbSphZR4tpqyArlluDOjjkMQ5iHIAxJY1t93VUl0vdBmxO4Tl3vBSgSni6dV9Ydm3Kn13Ns+81D/
 aj+6rKjaVPKGRJ3L9dAVwe6H0Rn2//f7AJKIla9bXzMgflUdvIJTkHPJg589qxYnfIIEbQzE81JC/
 3Pm3qvxiF3VOVszjrwLKDxYHP/G3sDzPaoljn/ZpcEnsp5kACzKDhn7th+NEdVKnaVlf8wX0iGey+
 TRzEUXlFkNcJSf6Iam9qX/edPPlVganrYuj1JVcr+SaaSzaAkm+HGViaJHlXANEnef5NyBjDjUfHT
 KSBDvfstOZecnmgwcXfNDU7u;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v933t-009NQa-0E; Wed, 15 Oct 2025 15:05:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: client: let smbd_destroy() wait for
 SMBDIRECT_SOCKET_DISCONNECTED
Date: Wed, 15 Oct 2025 17:05:04 +0200
Message-ID: <20251015150504.1109560-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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

We should wait for the rdma_cm to become SMBDIRECT_SOCKET_DISCONNECTED,
it turns out that (at least running some xfstests e.g. cifs/001)
often triggers the case where wait_event_interruptible() returns
with -ERESTARTSYS instead of waiting for SMBDIRECT_SOCKET_DISCONNECTED
to be reached.

Or we are already in SMBDIRECT_SOCKET_DISCONNECTING and never wait
for SMBDIRECT_SOCKET_DISCONNECTED.

Fixes: 050b8c374019 ("smbd: Make upper layer decide when to destroy the transport")
Fixes: e8b3bfe9bc65 ("cifs: smbd: Don't destroy transport on RDMA disconnect")
Fixes: b0aa92a229ab ("smb: client: make sure smbd_disconnect_rdma_work() doesn't run after smbd_destroy() took over")
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 77de85d7cdc3..49e2df3ad1f0 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1575,12 +1575,12 @@ void smbd_destroy(struct TCP_Server_Info *server)
 	disable_work_sync(&sc->disconnect_work);
 
 	log_rdma_event(INFO, "destroying rdma session\n");
-	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING) {
+	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING)
 		smbd_disconnect_rdma_work(&sc->disconnect_work);
+	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTED) {
 		log_rdma_event(INFO, "wait for transport being disconnected\n");
-		wait_event_interruptible(
-			sc->status_wait,
-			sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
+		wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
+		log_rdma_event(INFO, "waited for transport being disconnected\n");
 	}
 
 	/*
-- 
2.43.0


