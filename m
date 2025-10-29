Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1081C1AB6F
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:32:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vvQwpsjXEaVmWK+UXA4vYgG930Qgt1BRctVJKIjmKFk=; b=fWqGO8xgOmq7NAlf4zjBwb7+29
	DKo5kzDTTc0pd/Cy2UmWBZnVwmp6N2fkp7F0WR3raFlB1qkUcvk7XcVPgRapPmHWcS8Xv/J91uTGy
	cuHyR76EIt8ttKQcP+SaJkOb7jTdRzKB/kqdPTFmuXqZDaB5oxSTjuNoYZMroMlGOhjUqh8ZRKSeE
	66rwvIPMgEN9FMgkSF+QgfA7zRcJuSO0qGpv35OnPKCs6ITFELgA+NEz1H1reRxMqD1mDwxEeXTVb
	hhm0uECR45vzgF1f0JAErpS+saROc6K9aGq+8g8OH/OjF7dtUPmSMkDAdgg6LAMUnDpwyIn/CeWtI
	G/8jF3xg==;
Received: from ip6-localhost ([::1]:40160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6I1-0098GU-S4; Wed, 29 Oct 2025 13:32:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41890) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6C8-0096Mw-QH
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vvQwpsjXEaVmWK+UXA4vYgG930Qgt1BRctVJKIjmKFk=; b=H6hHfemt5lUfdk1ccSVojXtlWw
 zjd55f0ojGnw5sNupK5JWvPKfrv8gyqmqUGZMfzwdXGWAmVKny8WrIX+KOI+vlHdQi4ssAEO6oQN7
 3ggAJAgKMcJbG7iasBTZLa95LTB+IEfMWOuCcEpQl6Yc6D0wY8b9MXwXsMK1lN5YvoIwOq6szAMI3
 ThgkqFegJyyoCAZq5oosLkT7CdP1UAcqYsiO0F5dBefU6v1lC0t8u09fO+r8HC9n7DmcZaaaEEvTm
 54dnPoE6rdYxkSIV/wWkri9wBeI8YVieq05PcODNzF3whHGLr3eLWGFcrjNOTkuYkSrmNcGGOjZ4N
 5GrrbyeqY8cobAMt3td+r4omD3tgtSDjWWAR0iJlRzVso/iYeviclPPZ2d7P1ELv3AAxzZsx9cjCQ
 Ps60Wh152DnQ9Ug0XXrmlA7lvyzlSzsz4GbacxkXUIcca7lCYY0LbBNzY7oaDF94GMcqr129O1XAu
 2F2G9u+Lc4bXdzpmD8a/hljR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6C4-00Bbn5-2d; Wed, 29 Oct 2025 13:26:29 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 040/127] smb: smbdirect: introduce
 smbdirect_connection_request_keep_alive()
Date: Wed, 29 Oct 2025 14:20:18 +0100
Message-ID: <67f705b19b1a06a66d644477e44058a9a281266e.1761742839.git.metze@samba.org>
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

This a copy of manage_keep_alive_before_sending() in client and server,
it will replace these in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index da2e9ecdd98d..e2eb3c6cf0f1 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -1057,6 +1057,25 @@ static u16 smbdirect_connection_grant_recv_credits(struct smbdirect_socket *sc)
 	return new_credits;
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static bool smbdirect_connection_request_keep_alive(struct smbdirect_socket *sc)
+{
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
+
+	if (sc->idle.keepalive == SMBDIRECT_KEEPALIVE_PENDING) {
+		sc->idle.keepalive = SMBDIRECT_KEEPALIVE_SENT;
+		/*
+		 * Now use the keepalive timeout (instead of keepalive interval)
+		 * in order to wait for a response
+		 */
+		mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
+				 msecs_to_jiffies(sp->keepalive_timeout_msec));
+		return true;
+	}
+
+	return false;
+}
+
 __maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-- 
2.43.0


