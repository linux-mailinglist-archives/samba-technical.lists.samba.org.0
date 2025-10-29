Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1B3C1AD79
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:42:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=9oPTajjIPyMPzpj6sIvxhn1o/qqu1bykEtaz0IzpG3Q=; b=4kurDM8Z0Dv07J4e87nITDTsE2
	rvdOg9oMnpteC5MIMHMQfnC/9YeH4LulX/0H4JCdkq9rELrFZBYBVD62I7XbiCrgoEc8LNcHmT8+7
	oOPvKf43B002/42mtNLRHT5UK0Nm3dh/KQh83uIbioAUueXcYM23N4vOkivZOf92LeeOpk5pImGjP
	fw5T+93NM955vU7H5wzrvZFBWom2ZlnT7sFY7ciS8bwymBrd0qPrlG9qWDpq+wSoWkeq3QTmBonQV
	BecyNLMF4w07Iy22DswmnrowbkBDGv1RILCKAVbDprn7F3gKTIsTc+dyYUtE3B5vOFmvlzcusByTT
	zUcKCZ+g==;
Received: from ip6-localhost ([::1]:63282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Rf-009Bik-HD; Wed, 29 Oct 2025 13:42:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44532) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6G4-0097dh-Br
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:30:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=9oPTajjIPyMPzpj6sIvxhn1o/qqu1bykEtaz0IzpG3Q=; b=0ZWI5TMIdaEOhh4T/Q/jN7HdAX
 685FsheR5swiKLFweiIqADctMD4Lu6XqsDZZ+M8rb0xgr2Q59pCxsW8bHnjIEtU69P/VU+VXQlr27
 kfxItDICmNvzw5SQy2NONCPYG2FleNbYjBv9ElIc0TQr3mGVSHV2xftPMionwHPnoNYnv2isWur5z
 GN+8TTck2WhUpTLBibP+yDKmpW1Qk0VYgcG5a+/76ohgprnPyOFnxS2yy55GGXAOyA8o4FudB9y7j
 w8uAZvLkdaX7+PqFP+cZnlVLrhuv/nYUwkmMQlkKkQov6r/eIg2PbaXRC3KUwLF+WcowEU12zxqUb
 D+JlcgQGd4M1B5eg4QmhVVi9HyJcqF/rePtC4J+/ma5FFSVtk81+0+LjxESJrijfn7WMI9wrHV3Cw
 saFlSMsHvnOJr2rE9D1tqEYmBpWy4/+eeTk2TYGjdWoEH7yVZizHZnhcZUMR5whhm6WG88nry2VEL
 MfbADRAPn5hX66sLv/Fra5Ea;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Fy-00BcPB-2e; Wed, 29 Oct 2025 13:30:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 081/127] smb: client: make use of
 smbdirect_connection_request_keep_alive()
Date: Wed, 29 Oct 2025 14:20:59 +0100
Message-ID: <25e7fb24c28ce2945d9eb4e74c65e8e347ac6d04.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

This will help to share more common code soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 28 +---------------------------
 1 file changed, 1 insertion(+), 27 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index cb1e7dee9be7..ef2f957d0e86 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -730,32 +730,6 @@ static int smbd_post_send_negotiate_req(struct smbdirect_socket *sc)
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
@@ -898,7 +872,7 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
 	packet->credits_granted = cpu_to_le16(new_credits);
 
 	packet->flags = 0;
-	if (manage_keep_alive_before_sending(sc))
+	if (smbdirect_connection_request_keep_alive(sc))
 		packet->flags |= cpu_to_le16(SMBDIRECT_FLAG_RESPONSE_REQUESTED);
 
 	packet->reserved = 0;
-- 
2.43.0


