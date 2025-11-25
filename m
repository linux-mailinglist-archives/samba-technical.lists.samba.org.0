Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5297CC86786
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:09:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=iH2ZEHsUjamBdwExE5GRMOAk+r2J6DDZ1dpmVjazrAo=; b=ge9FAIYr88Wsdt6WqhnA5MUQ96
	9JHr+j//Rb4zxzTO93lsIlNieAte71QV0CXHsgPAz00/iUJz/mWHOeczQOrtYjybF2XMrj3/vviYN
	MCnsleQ3FSW35sQuhA5HUvab84Jg9qd02kSJTckMjvu3f3JiUoaTmn7rZ8VFQBbM4cMUvVAai0DSC
	DFUs2qaISsVlFE4DsexwUA3rTSQIyYzejahK0gl2Zb+7FYhwwyzXz90n5qtQsYoMnU6KEiMNhb5wN
	ZqVKR2jU4hz/f1RuePn7w9RW/P1b4/S547N1t3m+IAntwqJwQDGRDdgSC8MVNUGUAwoY9JUElw6ud
	e8YO/Xqw==;
Received: from ip6-localhost ([::1]:55452 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxTz-00DAVS-2F; Tue, 25 Nov 2025 18:09:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30496) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMZ-00D88y-5F
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=iH2ZEHsUjamBdwExE5GRMOAk+r2J6DDZ1dpmVjazrAo=; b=2sBnq6cGYchruqXVlFbFbwclna
 1VyhE7hB1uhT6MeJX/7hkHxuXGchzwgfsTxiBdnNTUaQOgJx18QRoO+9t90nk+ezyLvBGIBm5AYem
 L8UUPSZ7vfnLiLlSKlu+cQt24nSddqEokgOl9Fj/vcVbjJ8HA0cokh2h6mX9RKcNn4av8plhaBdIA
 Sdr4gRcAshmwNlVuAuSRbXb+G8ue56yeurRsQ/k427egOFeGQZ2KlnS9S079swpVEMk01JorhX6WP
 FgCHudhU4eqrgQ+z75k61X2bcLTWc5VRnEf0d/QLSa49MY8P/ShNZ7NrVUsQSpaWM1sTp6mOipxSl
 gIoaf73mqlR+3PMkTjt960n3dps2iHFF4qTR4Z//TlstOsQpkCAKbib8oJ7r6W5rdklCvO3ZAXS9m
 3j/Kar4aL/vLYKICPUzljy3JP7vH5kJsp8S1xRuYmFtH2gk02UnVLUIgJ/APEyO8fw8rqBq2aOYFm
 C2AJzYzBMknY6UbYT6lwnBYy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMW-00FdKc-2M; Tue, 25 Nov 2025 18:02:01 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 051/145] smb: smbdirect: introduce
 smbdirect_socket_shutdown()
Date: Tue, 25 Nov 2025 18:54:57 +0100
Message-ID: <25196e76808d60743066111698e7499075139dbd.1764091285.git.metze@samba.org>
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

This can be used by client and server to trigger a
disconnect of the connection, the idea of to be
similar to kernel_sock_shutdown(), but for smbdirect
there's no point in shutting down only one direct
so there's no 'how' argument.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index b0079c1f59aa..ed82238c76c0 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -431,6 +431,12 @@ static void smbdirect_socket_destroy_sync(struct smbdirect_socket *sc)
 		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_socket_shutdown(struct smbdirect_socket *sc)
+{
+	smbdirect_socket_schedule_cleanup(sc, -ESHUTDOWN);
+}
+
 __maybe_unused /* this is temporary while this file is included in others */
 static int smbdirect_socket_wait_for_credits(struct smbdirect_socket *sc,
 					     enum smbdirect_socket_status expected_status,
-- 
2.43.0


