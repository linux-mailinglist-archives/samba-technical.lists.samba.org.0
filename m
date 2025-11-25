Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3DFC86904
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=BBlgRAmIgpvsORmw7/6n6m0OSdIW8edI3Jt9yySA3ts=; b=mWsS2MwZKL75lDnfT3Cic4dbnO
	DNtaitn0E2/RjG6J+eWqMcT8LnpD2CTFGb2Bff/3pNf721A3OHMeDfwDuOmDqTCd/U+V7V3fN6cTL
	5N1ufj/v+bfu6o38WLzu8sBtz60bjA7il8oT8gp3JW06L7k34here9fo380nayCsL1bWcd4huo7g0
	JEYkRcHaeCHOazBWoy/h8yj1g/dnQr1ON+vntQ1xyy4TAnskWH8z1+7sm8ePxrAt3o9A958ZMqghn
	vGxodrl/ZAwBYw4jJdiA0a0y/JGK5TVdaB6uawxKwUp5rQ29DdIZCmz+bMmmm1k8t2CSmszz90oJ3
	ku2SrWAg==;
Received: from ip6-localhost ([::1]:59070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxej-00DE9d-UK; Tue, 25 Nov 2025 18:20:51 +0000
Received: from hr2.samba.org ([144.76.82.148]:35230) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxcY-00DDdM-8I
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=BBlgRAmIgpvsORmw7/6n6m0OSdIW8edI3Jt9yySA3ts=; b=C8GeLNTzSuzr6GDJdRasGpW6MT
 tTpeZPmJqB4iMD/Tf6QuzA5mnjqWR4TGAXoX0Ie7Iw88bBrsbnJEbaopLFgO495ybGyH+RaGvUGd+
 D/sZ3vUeDz/TYVXDTzQa3VLnEPqqcSP5GA+IZ41WGkrX+1xCeVQMsBFUwT2XzcWEPGPFjpaH2gNaX
 2mT5wydb+4tUeXxpLDKbQHbR56pirEmYHSh/4RoFcF/WpL7MP+U9LDYOnymqbn5RnTVrCYEDA/2i3
 oMk581DlA05Mg0sDfzWEioYvKc1kWFLzC5i0SwIlwMuoqg1cxq0uNJPoOx+DKMTyVlpTEX3dZezvk
 SBbLLc1DIfVMX/BFzlkYdM20r5+Z9o+JL9LzyK3dOuQOhRAJ1TU6JrfrobFoUqAMD+GHHK9EzADwX
 JYncX/CFLG05fWL+6fLAoV6noERs1TwWXd2KnUBU8gqhnS5CXWHjOBhs3o9NL8HMGqDeAqMkdIEwF
 2VDDZ0ghW4/wln1WDIo1D0gw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUe-00FeEt-0B; Tue, 25 Nov 2025 18:10:24 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 097/145] smb: server: make use of
 smbdirect_socket_prepare_create()
Date: Tue, 25 Nov 2025 18:55:43 +0100
Message-ID: <56a65a77045d989742acba2e8ff80ff8438894c3.1764091285.git.metze@samba.org>
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

This prepares the use of functions from smbdirect_connection.c.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d656dbf9f7ae..343e2bd7ee2a 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -404,20 +404,14 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 {
 	struct smb_direct_transport *t;
 	struct smbdirect_socket *sc;
+	struct smbdirect_socket_parameters init_params = {};
 	struct smbdirect_socket_parameters *sp;
 	struct ksmbd_conn *conn;
 
-	t = kzalloc(sizeof(*t), KSMBD_DEFAULT_GFP);
-	if (!t)
-		return NULL;
-	sc = &t->socket;
-	smbdirect_socket_init(sc);
-	sp = &sc->parameters;
-
-	sc->workqueue = smb_direct_wq;
-
-	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
-
+	/*
+	 * Create the initial parameters
+	 */
+	sp = &init_params;
 	sp->negotiate_timeout_msec = SMB_DIRECT_NEGOTIATE_TIMEOUT * 1000;
 	sp->initiator_depth = SMB_DIRECT_CM_INITIATOR_DEPTH;
 	sp->responder_resources = 1;
@@ -430,6 +424,18 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
 	sp->keepalive_interval_msec = SMB_DIRECT_KEEPALIVE_SEND_INTERVAL * 1000;
 	sp->keepalive_timeout_msec = SMB_DIRECT_KEEPALIVE_RECV_TIMEOUT * 1000;
 
+	t = kzalloc(sizeof(*t), KSMBD_DEFAULT_GFP);
+	if (!t)
+		return NULL;
+	sc = &t->socket;
+	smbdirect_socket_prepare_create(sc, sp, smb_direct_wq);
+	/*
+	 * from here we operate on the copy.
+	 */
+	sp = &sc->parameters;
+
+	INIT_WORK(&sc->disconnect_work, smb_direct_disconnect_rdma_work);
+
 	sc->rdma.cm_id = cm_id;
 	cm_id->context = sc;
 
-- 
2.43.0


