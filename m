Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A01AB34D31
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:00:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lKt3KVmiUE+Tvp18vwYnt2qRQq72X9JhqkJgkgUAfCg=; b=ojnojZoHfLiF3w5Y6txADHxnMt
	fd/kPvGQpJbNbmInXFrDLyJzp7M8UFN5LRba0GWWEBpIzNm3SuvNRs+ILIhsOEYHFa9LDLlloM5Xf
	lCiQNga5NZtBJQpelDHolkuEWptPpic5uEaxJyjgzaKCxzCHoKlGE/DKx4Y7h6vFHr/YKSE/jGD+l
	RtSbp+uFrTm68WdgRV6SJVtTdVvPh+CsU42TUY/KbOgC4am+lPdbFlrRGkAtU8TawBEJp15fHL7qQ
	gJX5Fs2dSglJpvDyBkkLx99pfKmopNyFT9QevWHcMeTjzxHn2aYirCGiZcfXvs9HeUqEhO371oSjC
	/rB1ghvg==;
Received: from ip6-localhost ([::1]:53324 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeIY-000SIP-VW; Mon, 25 Aug 2025 21:00:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54574) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeF1-000QsP-ET
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:56:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=lKt3KVmiUE+Tvp18vwYnt2qRQq72X9JhqkJgkgUAfCg=; b=Z7wYmaIRtiCQiNhCo5JNrBh0VQ
 F/lwDPACtaqMJId7uJsOva8S/oaytRbqZSFWa40veId4qrMftQ69/L0pvc45sr60u9ZujuKx9+YIa
 j9MwV6T5Wrq9/n88CTMO/PtX3KpZf5WprttoJnkiMfi/PmghTMJSDqNOn8EqOhM/gZzKfIyy7Sb2Z
 JXOg/dNwDUu7ktvIbi+RF+5YAhNNjN/6kFFwgXaRaQ4egIGNzLtO0VuP+lAjhQI5SmPFeT+60K9pk
 ALx3vkaWNq98casGrRCbNmJ+ze+W6dVvCZbreHk2nx1JkOkCQVRYNS9/sLSQ2dxE2XHMc1RCcvcP9
 uDmdEaNt00vIgPSF1HRw2SwqKe14b5RZMiyA40/TYJ32eZ7y3q9QDy+g+3gMqKy9vKvF9ERXeVyD5
 aux7f9jJcW3tgEk8AdZvTVrrINXHnpKpbPurMUsElBlWAkYNph8lgl+Ub01Ov+EaANGbzOzRwRDvi
 OHtn2TyCleZg2at72XnkPnac;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeEx-000m9u-2P; Mon, 25 Aug 2025 20:56:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 088/142] smb: server: add a pr_info() when the server
 starts running
Date: Mon, 25 Aug 2025 22:40:49 +0200
Message-ID: <7fde1a95fc05ac48657dff125a0c3c9743a8556a.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

We already have a message like:
ksmbd: kill command received
when the server stops running.

This makes it easier for debugging in order to match any possible
warnings/errors in dmesg with restarted server.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/server.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/server/server.c b/fs/smb/server/server.c
index 8c9c49c3a0a4..40420544cc25 100644
--- a/fs/smb/server/server.c
+++ b/fs/smb/server/server.c
@@ -365,6 +365,7 @@ static void server_ctrl_handle_init(struct server_ctrl_struct *ctrl)
 		return;
 	}
 
+	pr_info("running\n");
 	WRITE_ONCE(server_conf.state, SERVER_STATE_RUNNING);
 }
 
-- 
2.43.0


