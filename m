Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E62D4C1AA8D
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:26:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=L/eSe2pakCtQVKwuwbPyB7UyuaI0+Ick39K6Bq0JRKY=; b=y/HIM6YmmScE07ZIz12R7uAR4C
	N7T5whlzRsmgZsGkZ6Mp3MGUcnma03gzepIYKi+H3O84YguBJpULLDzhb+NxMDaosJA+7Q9cuZkS4
	/r/zPso0s9Fgg+9VakO6yHFUos0gcYA8AZQJpgNXQ9aKoRmQiAMIEtG6uPK+dym1bRiL+hXfDZTot
	3GgZxDTTGFUnHXqicYhgV6uRZTwJqdyUCFK+fryEDYaokXZ9gdR9m5IL7xImYwfltVt1QZYjaJhXU
	TtP41/RzJPzsqQ8wr+gOuUl1YFxuotpVTTysVbMdapnu2fzqVncd5HS0KFJpHPIyuTpCgxYlMrweS
	zlTe43Dg==;
Received: from ip6-localhost ([::1]:35860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6CG-0096Iz-I7; Wed, 29 Oct 2025 13:26:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21564) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69k-0095bn-Tu
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:24:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=L/eSe2pakCtQVKwuwbPyB7UyuaI0+Ick39K6Bq0JRKY=; b=MS8Z1Md3+39mjmru1CEYTlo/jh
 8tqj6R5zWMD5Ol1zVv2dr4FQprC4AIvxcxhbNq8wYwSJeah16lJKoEgCtsV5nP5t5brfffdk9azVI
 VA3YI1TXxHEq9VHPy5rWcR+re9xl+VnKT2SQgjjqgZG8FVfzi4R41tLa0zo2mHCznwPXOB2hgLe0Y
 AJYtc5ajLTYye2kD6B/cRN6WoiGw1QiyF6EPzFv2zDwFAk0zZTZk2ld/WUMNJhBkkQ2aSP7/35JjX
 mwdJv4wR8R24haRNMlIRqwvr4xjvWR7U3fO+N/Rp+dCzgPpvux8UmpkN95L81Qnh8ntFA+15Lwjut
 Oq9SVQLMG4IeuQ1ClO1uhkMK6jQPTXkk1QvPHrV/zcffQuvX56s2QXgRRf4Y+AFeDHMrIjlz7NOjn
 LLYCmoYt0SFAE+FHtWJcXdezT0dZeSbjDIyUJQakFtyGiWHo9yLHImSx02xCIg1p+fYNKbX9ibn2/
 RF1ndkqHjW8L4YciraaBCzx3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69g-00BbQP-39; Wed, 29 Oct 2025 13:24:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 015/127] smb: smbdirect: introduce
 smbdirect_connection_idle_timer_work()
Date: Wed, 29 Oct 2025 14:19:53 +0100
Message-ID: <a372810075445478ad5dd1e538fedf18d3ca1aea.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is basically a copy of idle_connection_timer() in the client
and smb_direct_idle_connection_timer() in the server.
The only difference is that the server does not have logging.

Currently the callers set their own timer function after
smbdirect_socket_prepare_create(), but that will change
in the next steps...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 27f8545ee30d..79be89a3946e 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -9,6 +9,7 @@
 static void smbdirect_connection_schedule_disconnect(struct smbdirect_socket *sc,
 						     int error);
 static void smbdirect_connection_disconnect_work(struct work_struct *work);
+static void smbdirect_connection_idle_timer_work(struct work_struct *work);
 
 __maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
@@ -29,6 +30,8 @@ static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
 	sc->workqueue = workqueue;
 
 	INIT_WORK(&sc->disconnect_work, smbdirect_connection_disconnect_work);
+
+	INIT_DELAYED_WORK(&sc->idle.timer_work, smbdirect_connection_idle_timer_work);
 }
 
 __maybe_unused /* this is temporary while this file is included in orders */
@@ -276,3 +279,34 @@ static void smbdirect_connection_disconnect_work(struct work_struct *work)
 	 */
 	smbdirect_connection_wake_up_all(sc);
 }
+
+static void smbdirect_connection_idle_timer_work(struct work_struct *work)
+{
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, idle.timer_work.work);
+	const struct smbdirect_socket_parameters *sp = &sc->parameters;
+
+	if (sc->idle.keepalive != SMBDIRECT_KEEPALIVE_NONE) {
+		smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_ERR,
+			"%s => timeout sc->idle.keepalive=%s\n",
+			smbdirect_socket_status_string(sc->status),
+			sc->idle.keepalive == SMBDIRECT_KEEPALIVE_SENT ?
+			"SENT" : "PENDING");
+		smbdirect_connection_schedule_disconnect(sc, -ETIMEDOUT);
+		return;
+	}
+
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
+		return;
+
+	/*
+	 * Now use the keepalive timeout (instead of keepalive interval)
+	 * in order to wait for a response
+	 */
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_PENDING;
+	mod_delayed_work(sc->workqueue, &sc->idle.timer_work,
+			 msecs_to_jiffies(sp->keepalive_timeout_msec));
+	smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_INFO,
+		"schedule send of empty idle message\n");
+	queue_work(sc->workqueue, &sc->idle.immediate_work);
+}
-- 
2.43.0


