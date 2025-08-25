Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA5B34D91
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nt/U48rlsaj4yyafVC5yjaXpCNOQtL6TgIFDba0GTSI=; b=mR6IRmDPwa8DegRf1kThk1Mf6G
	Tdqmyyh4kS+L+XDmEly43BYB3AeDZ2KU38To+YXa4jzRrRbM4kvbveMS02PiYI+iudNe7icHli95n
	F8M/fLuY/aEoO3T3YkDMjZdNA/e+WRRqcHJmXCR5s+/K14LcqWUtTlBf1oV2mNKXwm2rivRt44pF+
	RxKTr17DovLkICcNT2HYItSWBXRmKL1LBS6cJ+LdVKTE31jSilpngcvAkskpQe+A5GIwpRE989s/c
	WzjEWYTi38E8YzLyvD/5zqyZvlfj+37y9swP+1EoE9U6KZOmgl7Zi3bArJ5nS/LG3ZO1JaMmE7YW8
	FaSaOPfA==;
Received: from ip6-localhost ([::1]:48196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeOo-000V0B-Jh; Mon, 25 Aug 2025 21:06:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53126) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKF-000T3J-Ad
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nt/U48rlsaj4yyafVC5yjaXpCNOQtL6TgIFDba0GTSI=; b=OVMcrZXZC6KppjROETnbJBdwIi
 lMV71Udk7hh7mkwn1kBxpWzPPh4X8fK/4rzU4Go14HUhXULEa04ExbiiCERhYLZ/oJ7jyOu1bi/6v
 m/3PtLTg1uNpo7d+HJy+2WvrULmNl22N/V4B01PVJBPq3o77b9s4zWAtPl9/lOSCmVfDQ/NjxQnnz
 iQrKJTA26QDYcetJcUG19DmVYQiTXbiWM1Yz4uVpHMR7365IcmM0nLo6vcz26Kc0c0/V8pIgA9bQL
 Zo1x2DvHHEtJO92O484Z0cdvGaQTQ5tAXyH88c2yTV88j8D1twZjcd9S1P7EDDqn380q7ecdH3NW9
 P6YmSd6LeC2HJZtmesryzEhXh9mzSUTaspfvgAAIFO2qm+sbeR6IcSzLjPiaAougfAWDJqAlVDzM5
 Ovp5vFHPoeabw+B3XwWEX/YYJJw7E9dASLUn86JOt9hLRw4eHmjgeBicVcIuU6wLotyam3Kb5ORvt
 4/ZHucxHeZgCxoy16b3cBHYa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeKD-000nFj-0f; Mon, 25 Aug 2025 21:01:57 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 121/142] smb: server: pass struct smbdirect_socket to
 smb_direct_cm_handler()
Date: Mon, 25 Aug 2025 22:41:22 +0200
Message-ID: <1cd160391263cc4760faa4350202666b62dfc37c.1756139607.git.metze@samba.org>
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

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 8b6de0a6bf9d..bcfe0e62714c 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -333,7 +333,7 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	sp->keepalive_timeout_msec = SMB_DIRECT_KEEPALIVE_RECV_TIMEOUT * 1000;
 
 	sc->rdma.cm_id = cm_id;
-	cm_id->context = t;
+	cm_id->context = sc;
 
 	sc->ib.dev = sc->rdma.cm_id->device;
 
@@ -1537,8 +1537,7 @@ static void smb_direct_shutdown(struct ksmbd_transport *t)
 static int smb_direct_cm_handler(struct rdma_cm_id *cm_id,
 				 struct rdma_cm_event *event)
 {
-	struct smb_direct_transport *t = cm_id->context;
-	struct smbdirect_socket *sc = &t->socket;
+	struct smbdirect_socket *sc = cm_id->context;
 
 	ksmbd_debug(RDMA, "RDMA CM event. cm_id=%p event=%s (%d)\n",
 		    cm_id, rdma_event_msg(event->event), event->event);
-- 
2.43.0


