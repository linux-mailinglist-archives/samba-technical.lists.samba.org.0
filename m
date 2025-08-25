Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A850B34CFF
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=hxB3PbeW7jECtrC3U6MfKdxMJMAfwivNOE6dw3ZgpF8=; b=F2v8Znz4TztXoUOdZ3aAxwLhsA
	HHWOZG6rJPBko2Bdg2X0Fz6xBazCxGdYRJJKNIxxMwvBThHdu8e7n2Ma6gn4Z1jJJszS+Yp1YIn4W
	PejSGd6n6E2fxxD4hFhybwG5tumgpKTBrVmWbp7RYf5Pv0ITAhfg8i7KHXLxjTib8TxjxHRn3TVCk
	6EB+VXuqIQuJq18RxMJcwBRakjpjLun4U5srbEAJuL0Z1r6hOYFvg1UgWeuKzp+xRMiF70X3eeMS3
	sZSQ1/XOORIZsOpiPbrkPqX4HOMba+U3My65Nfkvjq4gn9Kmy2GwG9VD385cIhzWSXQ8JNjNbQ2Qk
	sp3K94+A==;
Received: from ip6-localhost ([::1]:47040 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeF9-000QrO-SY; Mon, 25 Aug 2025 20:56:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13958) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeC3-000Phi-Jm
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=hxB3PbeW7jECtrC3U6MfKdxMJMAfwivNOE6dw3ZgpF8=; b=O7YkCBHvyz+mteQcR0cPFXBki5
 vsa//yKW0dumVRC0j2DbDkHBVMgZHw5syS0n3ut47+ryJN0gtMX0fEgszQ5Mg47pz7/1paw3xaLk0
 26gM0H8HRYoPL5dGDhu7OG9rXt/YJpV8StUAFWDV3Z/VtyY51JRwX87dpV5ssVYk9S3axkA2iuQmm
 8uioWL0oT/qV8RNl0xmn097h/DrknQNPQsBXPwHO+Y65QbK7B9sQsiFnFbh5iO3MICMkF5kOVABV4
 eJbXnYpwFSFbPpYEuRFFk6S1b/zSuAXa17wu7TFriSk9aSZsbhtirGyd9Hxi2r94Rj+p7McHVK2Q8
 5QXJf0QJheHlUgw7RuKCM/fJY/Q5oBllaOy2QxUt1S1jZ4Gsm+VKyRCtMj2PHZE6Flvn225g7EN3t
 mV/jJqXvAqQX/TILDsitK6EHkSoFD3YmR7cH1Wt4bl1y5yV5NPVWF4k5Zzhw23bn9PXQ1fP/zLUD0
 M1Pdz5/HHyrJFi+Al2VXsQW+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeC2-000lXU-0p; Mon, 25 Aug 2025 20:53:30 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 070/142] smb: client: pass struct smbdirect_socket to
 smbd_create_id()
Date: Mon, 25 Aug 2025 22:40:31 +0200
Message-ID: <7f03c1ec15df165ec0f8f1cd3cf01dcba4fdc9c3.1756139607.git.metze@samba.org>
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
index 660edf02afee..3a0b5e3d3142 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -673,10 +673,9 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 }
 
 static struct rdma_cm_id *smbd_create_id(
-		struct smbd_connection *info,
+		struct smbdirect_socket *sc,
 		struct sockaddr *dstaddr, int port)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	struct rdma_cm_id *id;
 	int rc;
@@ -784,7 +783,7 @@ static int smbd_ia_open(
 	WARN_ON_ONCE(sc->status != SMBDIRECT_SOCKET_CREATED);
 	sc->status = SMBDIRECT_SOCKET_RESOLVE_ADDR_NEEDED;
 
-	sc->rdma.cm_id = smbd_create_id(info, dstaddr, port);
+	sc->rdma.cm_id = smbd_create_id(sc, dstaddr, port);
 	if (IS_ERR(sc->rdma.cm_id)) {
 		rc = PTR_ERR(sc->rdma.cm_id);
 		goto out1;
-- 
2.43.0


