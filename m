Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A038C86747
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:07:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=EpoLEjPg3e9EgX+ABPGUpWDMOCb4QTXEGClbyQCtMUw=; b=C5gFpSgLs8FQofd7jxhFk27EPI
	q1sebdp4Tm9Oaz3KPfVkuXof3ZvR+fcy9nTxVb0dfNVf1MQuOYdWpaPc9xGQ5NB71QJo3/PUTFjge
	plLQyq5BnEj/h/o4tamBLNtcPPT/BsuQ8HftUeiOPL5d2qFHQ33fG1TMiySEckKEUERwrCqdqyiu5
	pIUOSVDeNgQNoOZtKyv+JjBS3lw7f9ffYfXtu9J+W/LIGFdrRM6flh7FIRYbrMg2FKpMJy6+Ns+9x
	5bpanxXZrFBEHbQ/RS/SS4P/Nc1jxgLU1xQD7nhhWIdOuCWLrbGriCTPVFGlxjZo1grLzbJwBjnnq
	QtCYRvgA==;
Received: from ip6-localhost ([::1]:58630 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxRu-00D9rz-5a; Tue, 25 Nov 2025 18:07:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15282) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLj-00D7tl-Hf
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=EpoLEjPg3e9EgX+ABPGUpWDMOCb4QTXEGClbyQCtMUw=; b=mMN+wwImZHooHF7EH/UGyZjB7x
 6iArF2tHwvsGwMVVwcJjjNWgjQyhFPvk+e2xVJ8kGeVMsX5WYiLW7+ZBV10sCZRLSIywrfYw+WPgJ
 YN/rXHSvNQ2wqjObKKcYfWTIH850mQhHg+dhPjxynykmd1nkoKKFI+3KUruaeNbkJDQIXws1Y89Ea
 LVHE9zDPUWuHtu/gv4tP/c2CBszVuCAt2y61FPwMUm1k+CBA8T0iS6NnaDkF9qyJWVoB8EMqckOwT
 Ut7zPkaTQcGe2mwggY2X96JLPJLbOLYxANkd8y8ptv1BtvUofRZbekTnUBtwK3O0GUhMvkhDi2DTK
 bm0JsB7RSqPIPkRfp2jlsObw/KvyF9dc1LFLuzUs2dmamS1VzIk3Mx9fb0TQmSsM7nxNMiIFQg5qq
 8UsISK/9aj39Jk+DB9IbxWMlRQKPUdnnJSLEcI3RurwpgCHBG5/cnZkvif+ARHOGSHDESUHfbyafV
 RnozArzBOEwQp8HpcUz9zZUJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLf-00Fd8c-0v; Tue, 25 Nov 2025 18:01:07 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 043/145] smb: smbdirect: introduce
 smbdirect_connection_request_keep_alive()
Date: Tue, 25 Nov 2025 18:54:49 +0100
Message-ID: <647ecd059c2b5ba426da04e6c025bcc2ebad2cfa.1764091285.git.metze@samba.org>
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

This a copy of manage_keep_alive_before_sending() in client and server,
it will replace these in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 6dce0f0c126a..9901c5d01958 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -724,6 +724,25 @@ static u16 smbdirect_connection_grant_recv_credits(struct smbdirect_socket *sc)
 	return new_credits;
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static bool smbdirect_connection_request_keep_alive(struct smbdirect_socket *sc)
+{
+	const struct smbdirect_socket_parameters *sp = &sc->parameters;
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
 __maybe_unused /* this is temporary while this file is included in others */
 static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-- 
2.43.0


