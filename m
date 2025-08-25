Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 246E4B34CF2
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:55:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6e9j636sBIJTj88dsL6ykNeIJE4x0iMDn7Rd9dMBowk=; b=AMfiw9azyj5FbCPTCTVf7YScSl
	ETwCEmYV/a5rrbiQqhcdKWuTivFFQ0z1RJhwo+URBEe/NRAXsxtElLhSzbw0Bnn0jOqE9VWVK8wLS
	WM/rf8MwnYsFfqPWfULSdyYBfTT2pt+ViIPJu65IEb2qeQYrQ17HyU//D2o6/nxg93A1yrGR6tqFy
	1P1aPBz4XQ1+Ngld/DXnG3mGuZWkiOjcCk5r2poPRVljyHuVMXGRA5x+oz+j2SRja/0oGRjd/mp+6
	e4hsToWdR0Kyny9QFD63J4M8fbOY7sRJd3sF23h40u8S8H1WuzukZ8YBZI+n0hVxKA3fCDWt5iNlZ
	6GrJEWmQ==;
Received: from ip6-localhost ([::1]:57302 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeDy-000QQg-QJ; Mon, 25 Aug 2025 20:55:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22580) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBE-000PKG-Cx
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=6e9j636sBIJTj88dsL6ykNeIJE4x0iMDn7Rd9dMBowk=; b=p+QBGRfXI9h/7LHZDAAbw4cRF0
 /9SDlfGY0p+IwmMEt6cCItgkxfXjSO7P+WMC1fcQW/XRUBGaYtZydvGT1BSkkdkmK+2UD3wMmbUOC
 qoubyBou95SmsXPmA6zoB8FHIb5w06itxyWzObu5YpFA8w3KXB6x2nRWbbusbFiA/9MiLnY8LBNuR
 zDijBt/22lYPLeQBPs5vLlywgnKMVJRt+WvWF1uO5CJsHDBp+mwm7wutOsUHjWakoQipZodVjeqYz
 TCRyjNpmuFDTmznrN9mnbXLH7EfSUqDl3PnKYpqZ2oWlsw/eZG/dm7pAEv9Db9IDotVkdQ+X3WBZf
 t9dGSOsqJLdnE+IrwKymqBmM6QxLWatlR+0Lap0wTw3ozfrtJBlq9gvKs/uBmX6OllNjjGPdip6r3
 aBgiYMMR8VJnEOdo7eURye4BaJs9afHrsgqAJTNIQN3BRJ034/7mYQydW2vWYsxbIJGjsdNNlIEjZ
 Tm2d3l3+CIE1nMqnC08ydTUp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeBC-000lOD-1T; Mon, 25 Aug 2025 20:52:38 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 065/142] smb: client: pass struct smbdirect_socket to
 smbd_post_send_iter()
Date: Mon, 25 Aug 2025 22:40:26 +0200
Message-ID: <13e3904db462b7d1d29ca737331023579f1769b0.1756139607.git.metze@samba.org>
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
 fs/smb/client/smbdirect.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 782621a844f1..40d0233f41df 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -992,11 +992,10 @@ static int smbd_post_send(struct smbdirect_socket *sc,
 	return rc;
 }
 
-static int smbd_post_send_iter(struct smbd_connection *info,
+static int smbd_post_send_iter(struct smbdirect_socket *sc,
 			       struct iov_iter *iter,
 			       int *_remaining_data_length)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	struct smbdirect_socket_parameters *sp = &sc->parameters;
 	int i, rc;
 	int header_length;
@@ -1144,13 +1143,14 @@ static int smbd_post_send_empty(struct smbd_connection *info)
 	int remaining_data_length = 0;
 
 	sc->statistics.send_empty++;
-	return smbd_post_send_iter(info, NULL, &remaining_data_length);
+	return smbd_post_send_iter(sc, NULL, &remaining_data_length);
 }
 
 static int smbd_post_send_full_iter(struct smbd_connection *info,
 				    struct iov_iter *iter,
 				    int *_remaining_data_length)
 {
+	struct smbdirect_socket *sc = &info->socket;
 	int rc = 0;
 
 	/*
@@ -1160,7 +1160,7 @@ static int smbd_post_send_full_iter(struct smbd_connection *info,
 	 */
 
 	while (iov_iter_count(iter) > 0) {
-		rc = smbd_post_send_iter(info, iter, _remaining_data_length);
+		rc = smbd_post_send_iter(sc, iter, _remaining_data_length);
 		if (rc < 0)
 			break;
 	}
-- 
2.43.0


