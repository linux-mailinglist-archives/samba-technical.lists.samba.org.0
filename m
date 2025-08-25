Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA89B34CEA
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=FjoGrQht5h2TF66GmiqpfDnI5PpQeVAM4GxgwJ+f0DM=; b=k4sA6/VxvZO9W8afbEssMLuq7Z
	dUTAEUHOYiAd4JPc2GcT5sHqWkEYrj8JIt5im2lxBw1q0tAsFqKF21Yqr/zAnzZQkEcQUKq6kR6W3
	5JpBF5lCelVmu/2l1KVPXtUHzBwko8GdsXZKxPgoPdpGA/neqiHwHBku1KyYFD8YidfxLLNLa2QjL
	ZkYYYkWTgrQHfLiBdzmh6X22zuAwjX57McIbCgu96pQOyuGH1XLhCVHEOI8QnscSWGOIjjxGdoxmE
	dtHRb9SgXe+OgNcfhYx0gTN9cPOC4TJtCX8i0DrZDMholTk8i8a1rk6m4O0NWagZ/PiSeAYBTJN4F
	8+qPVnUA==;
Received: from ip6-localhost ([::1]:37704 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeDQ-000QCP-1E; Mon, 25 Aug 2025 20:54:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52796) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeAn-000P8p-0Q
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:52:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=FjoGrQht5h2TF66GmiqpfDnI5PpQeVAM4GxgwJ+f0DM=; b=V7pI+9T00moFd4KLNFJCVtOR2W
 VGw3erfDpJeY7zpJuEOl5hnVl6Drr83fXv/75AnsSveKlkDIdvrLuCvE+CCOPjWiDeV00azC6HjsM
 M8qT6lUOyv88tPefItjDVEVX7gVteOTITjqckxsE4IXe4W84jCKe37BG8pNqiSJBVZoithPqFkPOe
 q2nTFUcIMooUt+isIi9Z6QYdmO/kqxMx5wDjMO/kDCvEbyT4yApfSWKNcvvkg8HXEuBTOyXUDePlY
 Dl3z3+azKaYi6Fc/1nHZBEf0M/LYUQ3r6HgExxFTrNn2HJTZu8h6Kmd6KZmWZH4seGYN/nMhCKOQj
 Pg5QR7jeURXYJAFQJAumpIznbZu/FT7ibsJpYGbS3X/b6laHp3y2z6UYKuD4AqwpvSgYKseSDgGOY
 P+bRHziIREgqVN/GGcto1hufq4j1tB7vgLoksQgEHoadlf8UxnBh5eWntUDk64GM+FfQft+iM699g
 UMFN+kTNpHM1AjlGmMU5RngB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeAk-000lIB-0z; Mon, 25 Aug 2025 20:52:11 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 062/142] smb: client: pass struct smbdirect_socket to
 manage_credits_prior_sending()
Date: Mon, 25 Aug 2025 22:40:23 +0200
Message-ID: <6366a1ef2ac5101a15b1e413bd5b7fc3d9cba617.1756139607.git.metze@samba.org>
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
index e00a70125ca8..148ba5449b66 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -911,9 +911,8 @@ static int smbd_post_send_negotiate_req(struct smbd_connection *info)
  * buffer as possible, and extend the receive credits to remote peer
  * return value: the new credtis being granted.
  */
-static int manage_credits_prior_sending(struct smbd_connection *info)
+static int manage_credits_prior_sending(struct smbdirect_socket *sc)
 {
-	struct smbdirect_socket *sc = &info->socket;
 	int new_credits;
 
 	if (atomic_read(&sc->recv_io.credits.count) >= sc->recv_io.credits.target)
@@ -1064,7 +1063,7 @@ static int smbd_post_send_iter(struct smbd_connection *info,
 	packet = smbdirect_send_io_payload(request);
 	packet->credits_requested = cpu_to_le16(sp->send_credit_target);
 
-	new_credits = manage_credits_prior_sending(info);
+	new_credits = manage_credits_prior_sending(sc);
 	atomic_add(new_credits, &sc->recv_io.credits.count);
 	packet->credits_granted = cpu_to_le16(new_credits);
 
-- 
2.43.0


