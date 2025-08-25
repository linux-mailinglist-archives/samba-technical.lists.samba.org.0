Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFCFB34D02
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:57:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=G+tc5uI0jjTHMPWSxNgRwZV8XtjK0x/UIA1B314cIRE=; b=Oo5nqm0QzdATAMxZENmUvYJMSW
	6wvGPaRpNt7LoyU7eeUZRK+0/qOHaeAJ+z2JXWXrVkdFLOw+7dLd1+AtbI7zaNtKUsTe8Bc6tNvnt
	KP0VJpk8j+I9bLEWXXXKN8Dktu+bwEHf3I22rhBqccxMPO2SpLPJnC9MOyW000GecLNX5mNurZDUb
	c7pLRYf+Qup7hzrrPCZT6ggj5BHRiJQi3mpNHEHzlhcBvjpsSdXay/8UOBdaUTqmLfbXyfSr9X+d3
	MVqnp7Wpq07zdkVkpYbLeYSPBf6OLTAln5iKNM6gxrP7WtIWhB9Wwlzs/aEd8yd5TLf1ugzvbFcQT
	UulIJlRg==;
Received: from ip6-localhost ([::1]:42260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeFM-000Qwi-KZ; Mon, 25 Aug 2025 20:56:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30996) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCD-000PmA-GA
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:53:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=G+tc5uI0jjTHMPWSxNgRwZV8XtjK0x/UIA1B314cIRE=; b=fsTTkMXQV6Wkoxt2HkDtwk7Yff
 83pAHxSlIZW1ElV2fah7/DFG8ykWaNScGJWy4xB6mD+6R6YCzFuAGc0bi+AygCm6dXfWHZBqwfeKM
 LZvdZmZTopUXLYoSuJm/O4raK16l4gT5gYyaid5CewSKRtAiT+eCfTD51wGdpkGdV2X/JCZPM+3b/
 IdTCshrsaKy0fO5NtM4LLVlFA5ztoQ4/mtynkjABXQ+E9heX1Q+IqfnGaJWpKHahVNenE1BmdA8C/
 L6IXf4zrEIEuAq0gvvcB/rf7/g1+JfSDtjbFQNluYEWFxnIVoCwx9MqfG5Fm/dTWUCgOKl99IezEt
 Bf+K0ETCp6f7useV3bFzfk85pXb0sh8OpgcH+3jYfpQc8q3jJaWctNAV/z7SRLWt6rv+B85F1J30h
 j52cprva0cHKZUA1wgzfHkRDk9LurGa+yZI/EHFm6w13Cw3l4lCRwH9vGjrP7vRQec1V01exLPvaI
 CD48dsvbCU/CWyuNWl+C++We;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeCA-000lZJ-2H; Mon, 25 Aug 2025 20:53:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 071/142] smb: client: pass struct smbdirect_socket to
 smbd_ia_open()
Date: Mon, 25 Aug 2025 22:40:32 +0200
Message-ID: <db1174ac0241ca8556abcb128325dc2adb4c24e6.1756139607.git.metze@samba.org>
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
index 3a0b5e3d3142..9fef01ed6320 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -773,10 +773,9 @@ static bool frwr_is_supported(struct ib_device_attr *attrs)
 }
 
 static int smbd_ia_open(
-		struct smbd_connection *info,
+		struct smbdirect_socket *sc,
 		struct sockaddr *dstaddr, int port)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int rc;
 
@@ -1677,7 +1676,7 @@ static struct smbd_connection *_smbd_get_connection(
 	sp->keepalive_interval_msec = smbd_keep_alive_interval * 1000;
 	sp->keepalive_timeout_msec = KEEPALIVE_RECV_TIMEOUT * 1000;
 
-	rc = smbd_ia_open(info, dstaddr, port);
+	rc = smbd_ia_open(sc, dstaddr, port);
 	if (rc) {
 		log_rdma_event(INFO, "smbd_ia_open rc=%d\n", rc);
 		goto create_id_failed;
-- 
2.43.0


