Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C4CC86768
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:09:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QsSwNc5zY0Vp+9eFsY9ZKfKzRllIiePk7r/9jSI+tj8=; b=aA60XpwC+QmyOWZeEFP4ZX0eGn
	bOQVPgN5CTbgiBtUo+ViYdwSwhbsE8um54FlVwarMUs0aWxuhYbIKqEXt05DCLHfxb3nkwmcC6nzW
	O/St250G7acoXNQ/kA/Da68HXbZvyc74xzakKyT0QQ8SN4URwxGjSQUFdIf0hpFjWh/sPLTrPid6U
	TVsfgK/Zo0NX3x3Pm2OgrVK2IzG5ZcDf0gKjl7kbUGdII0+gMhZIxdoQypxu+oidwwKvSv1XuU/Tu
	XIYaGPHJAeUJBaNlpn/Qi+flL5DgzperyQj207mauir5EhBeHUVhYZDwWmp3Y+FhCNNMDKcAXn6XX
	QR1oe19A==;
Received: from ip6-localhost ([::1]:18606 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxTh-00DARQ-Bj; Tue, 25 Nov 2025 18:09:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30484) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMT-00D87X-PP
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=QsSwNc5zY0Vp+9eFsY9ZKfKzRllIiePk7r/9jSI+tj8=; b=i/TCM9lEwiEq6Xx6WkbL7uZxcy
 EXoV6YvXm4NBHpx25jK8Sn07K5vQg2LbFwYzGcy3zdcALOQXhlBwoLz3kJXXcr11l7kYcnoU5rPVj
 g3nqM/M+gA4hR5wRXmkZa7XYDHcwRhPOh1ardftCg8xXjgSpBhaLVkbfHHAFqEUI6HhPrqsPit/i8
 RPIFId+x6cE0SQ0MkYj6PwRl4zO5955V67ywb1teiy16icys91n4IhHFWSPFFBcp3+TvUIaNRh0qB
 DFo7+MtQ8ZkRYYB6mH2k1BKHcOgnaphd4JIsba+4s9xk5etnmYU1dzVsICMaau5JTMIP2jBGuigHS
 k6v9KxGSq2NyvzQtHsi6wVopSeR7wWO4tLJgjTpy5BZ2Zc3GtOmBdbCEw/221EIlVzYR8DvWTkGD6
 GqxSq3fDOwrizhud8K+OFQthIg8F3tZtADmEGptk8ucFdF3Fcvmpi0ctqxmEmwzOzl9PjmEcFvXAy
 Y8f/XibnRN/XabUxHPT9id8a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMQ-00FdJB-1a; Tue, 25 Nov 2025 18:01:54 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 050/145] smb: smbdirect: introduce
 smbdirect_connection_is_connected()
Date: Tue, 25 Nov 2025 18:54:56 +0100
Message-ID: <adc0e3fa052ff3a7e866c0f588ead2305876b44f.1764091285.git.metze@samba.org>
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

This is a simple way to check is the connection is still ok
without the need to know internals of struct smbdirect_socket.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_connection.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 22d6273649a7..c270c9ac1c81 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -719,6 +719,14 @@ static void smbdirect_connection_negotiate_rdma_resources(struct smbdirect_socke
 						peer_responder_resources);
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static bool smbdirect_connection_is_connected(struct smbdirect_socket *sc)
+{
+	if (unlikely(!sc || sc->first_error || sc->status != SMBDIRECT_SOCKET_CONNECTED))
+		return false;
+	return true;
+}
+
 __maybe_unused /* this is temporary while this file is included in others */
 static int smbdirect_connection_wait_for_connected(struct smbdirect_socket *sc)
 {
-- 
2.43.0


