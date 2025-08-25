Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 42056B34D7A
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:05:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3fVhp8qoU+SSi2ZphYatk89NVIUBsDkVLa5DmK/brto=; b=ILLF0IBOu5Viv4t47iNYZyWmxM
	ReEe9o1SwaqP8hwA2KKQTZwf/NS2RwyBcY79Y+ksUaBDg6VE+rMqKgCw524TGa5s7ZpsRxiLXc5LD
	R0CyZjKMmaBbK8W0zkmpv7VxFRmDO/rUOyzydsk4X1IaOjNZfVsO95L0KDtpQCnAM1yUiBeP0jUVX
	aB8uL7ayzaAb2sYi7xcK2vaJUS05QPhJBYjtQX01cQPFhytVBKqBmVvFe9Db1TIIUU6pOSYS9vH7p
	//EMO5up1vD3gv3bnVDdyRmI+HDlfLxl+dDkWQeeDX7ndxvuw3PXWX92qdyarqO2OBk+8jc1ZQqkd
	/GGecG9A==;
Received: from ip6-localhost ([::1]:30682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeNB-000UGd-CM; Mon, 25 Aug 2025 21:05:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47740) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeIp-000SSo-Ee
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:00:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=3fVhp8qoU+SSi2ZphYatk89NVIUBsDkVLa5DmK/brto=; b=H48PvL1s+EjSYZczgKgQCJo13W
 9HdiwwRBVBXkwdFka+quDUBK/1Tj7u/Zm4/2VlP/syDGsL8x7odVFX+fciATqXL8/ma9pk2hBk5Gt
 eJVb2at3g/D/Nartaup0PHIVmqom14XCd5iM8ZfpQOxV5g2tAsYZ9x91wq0kDTEjiA59aHfdP2eyQ
 pOLImore+TVy9wFcq9K34Di8dkD5HGCEJz4bDW3rLteI/Stb34hYdprdeyGMfNy0fELsEamHBUmp3
 4ZGidxplGPS9kaVX4Wv2KxHkKv8m4nJuBgGfN+pjcaDtUqdmwfsNdidqNEt6V3WP3oaSumDnyXyzY
 YAKuqxZ8FJ9UE9HADq+9xrnormSu4dWZixqwHCbIoNonH4Eyr6XcwQwu5lI79h2/inl0iEPYux9IK
 GSPuBQbK1GRgBJffKLu3DKftrGcvdqVuJAs7fXozjBUaDWohEY2VfGnG9T2e8Ys/fxcUvhPqf+3td
 Zuu3vXWLiL7tCozrlrbpmxZm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeIi-000mvT-03; Mon, 25 Aug 2025 21:00:24 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 112/142] smb: server: make use of
 smbdirect_socket.rdma.legacy_iwarp
Date: Mon, 25 Aug 2025 22:41:13 +0200
Message-ID: <810beadc67c3251432203f88e7b64912c98fc820.1756139607.git.metze@samba.org>
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
 fs/smb/server/transport_rdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 100ac189b47e..8e1df4eb39d6 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -93,8 +93,6 @@ struct smb_direct_transport {
 	struct smbdirect_socket socket;
 
 	struct work_struct	send_immediate_work;
-
-	bool			legacy_iwarp;
 };
 
 #define KSMBD_TRANS(t) (&(t)->transport)
@@ -1624,7 +1622,7 @@ static int smb_direct_accept_client(struct smb_direct_transport *t)
 	conn_param.initiator_depth = sp->initiator_depth;
 	conn_param.responder_resources = sp->responder_resources;
 
-	if (t->legacy_iwarp) {
+	if (sc->rdma.legacy_iwarp) {
 		ird_ord_hdr[0] = cpu_to_be32(conn_param.responder_resources);
 		ird_ord_hdr[1] = cpu_to_be32(conn_param.initiator_depth);
 		conn_param.private_data = ird_ord_hdr;
@@ -2092,7 +2090,7 @@ static int smb_direct_handle_connect_request(struct rdma_cm_id *new_cm_id,
 			ird32 = min_t(u32, ird32, U8_MAX);
 			ord32 = min_t(u32, ord32, U8_MAX);
 
-			t->legacy_iwarp = true;
+			sc->rdma.legacy_iwarp = true;
 			peer_initiator_depth = (u8)ird32;
 			peer_responder_resources = (u8)ord32;
 		}
-- 
2.43.0


