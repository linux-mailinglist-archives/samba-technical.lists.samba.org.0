Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EC9C868C5
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:18:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=RDNV0a5XFTF/TmtAxMZm7bpnkNRznb47x1xPep6hcMc=; b=aWTdzlNX2NCxgu3RMAriXTdezn
	Ka94HidVcpawhvKNVHzLrPXz9ZYc3h7vmQI+XwKhwNfpXLOdkv8E1BEQHIQQs0X5dWc3V+lTmok7E
	o6V2t5q6e0DcUleZ5WrLmajcZO2rltb6B9bzIDQmrpQjXNqxpJtVqvQzcg6cl794VWG67psWbicSX
	A+Jf4Q6DJRKpMuuJWBhS/shCRH+PNVweYk/cJoP2iFxLD68Qb67ESKG9Bh8TxhvHhKy4mnY4pvPQJ
	kTIRNVTv6hEeXBjQ/fWmpDFbimU9I4JWCDsIY9JCdhC94Dy2NBRPxLtZWMRLyeNJ/yxVIq7Pb0/FL
	nXmG1/AA==;
Received: from ip6-localhost ([::1]:19084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxcd-00DDZf-7A; Tue, 25 Nov 2025 18:18:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61394) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUY-00DAlG-6u
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=RDNV0a5XFTF/TmtAxMZm7bpnkNRznb47x1xPep6hcMc=; b=v0nqWrRCHJ3ySZ7YphaO9GqpWf
 hkpki85/ttBZUIKSRl6qKYanNiKppzMezbzW/iCO7H6znrbMf98kONlXlxJmWyGOoYIsp1kbxfp3Q
 bV32nFhZ/iqtBBTzCd+oWtRj+XYMKFarpFPcKimU4YFShy+QVzvhFUfw7jqeYPVxXIf+ba6CAo7Yv
 ymLto8ncRs3a7BHXClsl3GNESwiK6Pn5G/m6+HQqtuyEPntSJYgVsWyOJ1hVltyvYuO48U1KA/CyG
 QVc5tKD3VeXnGdQZExYc769ulWhy/igtt0qmtQNQFSIOxZ92b96rCY41Rnjwk1+omWhNuMT6z7pWe
 3bGOh+xVikWPNk0RHdZrQaaTrdDoYtGAf4AlelCZXFUXH8/FG5673tBvj5ELjlWleop28YIXxfPpZ
 9jvFnbPI5WfhnO8E3l2V4h8mtpDC6NhX4OG6NNlPf4xG3S8jD13H+6VZRBQpUQiOJ/XOUVm0rMfDr
 NXRh3Ucfzl8EP/Ev6Q5DmvEg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxRz-00Fe08-0K; Tue, 25 Nov 2025 18:07:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 086/145] smb: client: make use of
 smbdirect_connection_request_keep_alive()
Date: Tue, 25 Nov 2025 18:55:32 +0100
Message-ID: <67e25b892afe4b22634e42cb6bef9d432dddbd7d.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will help to share more common code soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 5695ba579ea5..42f85dd42e7b 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -731,32 +731,6 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
 	return rc;
 }
 
-/*
- * Check if we need to send a KEEP_ALIVE message
- * The idle connection timer triggers a KEEP_ALIVE message when expires
- * SMBDIRECT_FLAG_RESPONSE_REQUESTED is set in the message flag to have peer send
- * back a response.
- * return value:
- * 1 if SMBDIRECT_FLAG_RESPONSE_REQUESTED needs to be set
- * 0: otherwise
- */
-static int manage_keep_alive_before_sending(struct smbdirect_socket *sc)
-{
-	struct smbdirect_socket_parameters *sp = &sc->parameters;
-
-	if (sc->idle.keepalive == SMBDIRECT_KEEPALIVE_PENDING) {
-		sc->idle.keepalive = SMBDIRECT_KEEPALIVE_SENT;
-		/*
-		 * Now use the keepalive timeout (instead of keepalive interval)
-		 * in order to wait for a response
-		 */
-		mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
-				 msecs_to_jiffies(sp->keepalive_timeout_msec));
-		return 1;
-	}
-	return 0;
-}
-
 /* Post the send request */
 static int smbd_post_send(struct smbdirect_socket *sc,
 		struct smbdirect_send_io *request)
@@ -899,7 +873,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	packet->credits_granted = cpu_to_le16(new_credits);
 
 	packet->flags = 0;
-	if (manage_keep_alive_before_sending(sc))
+	if (smbdirect_connection_request_keep_alive(sc))
 		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
 
 	packet->reserved = 0;
-- 
2.43.0


