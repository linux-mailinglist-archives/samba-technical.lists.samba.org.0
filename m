Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E5DC1ABD5
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:35:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=es2jaFA4hWzXp2s1/zltWKFmmsKGJNoXYMYWFZDIWds=; b=lXfKL5ymqtjEbfAZJ7pwj0NdvN
	hQgiYU7An2fNCVHEWSGl2e923mnfJSRUMBD9q2to1gYdAM7o/leeQ6MTPHEU0qqvMADobheeirhNJ
	Ph1tagspN23XGmHI9TOnkw8k84EYqkwRHhKKOPO3UBDIyY2jmKKACSjZswnUngATLdyTN13hBWJEx
	i+3NeksnyBdwfbOPQvEjI9OPYA/RTPSHHbVChjdAboofSVYomxQLh1VSJqbD1ZrV0U8+qX8wVfzr1
	rdNcomjnujmeZjnZgqwUys4Mq6hs1UgLX5PwGUTXYNFMWHOz0MrQbQ6ImjMPzmUNrxBgtBg7jI/rm
	BoPGfVtA==;
Received: from ip6-localhost ([::1]:26532 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6KU-00995G-BP; Wed, 29 Oct 2025 13:35:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10854) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Cr-0096bJ-0w
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:27:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=es2jaFA4hWzXp2s1/zltWKFmmsKGJNoXYMYWFZDIWds=; b=zQt6vIUT04zFuqAkTbCGqCFXi+
 LHZCkIqCdHvSAg47FGonUwkOa/npBj6//MEQhtHPlbXdaXCQJIOt8nQUeyJDLKKSsnYgkDW/2J7I9
 TKeGPmpJjslAaG4L1lM8w76Eljn64YYAVe3oWzjLXXSW05esstP5vU8SVZEJH9LouZ99WPoEYSAt/
 Q5ay6ELCoEtIClrEuIqASt8sb+UdxQfnINzQFits2q5H9c5gKmJNDIy76/IAsuauUup2ZGm8FwkUX
 D8mZWdTgLOAfhICHU4AfsTqv67Esj7ppRDI+om9kC9ynB/UBi6zKe2w7SQrZdIkmpvru4TvOZi7IP
 S6rF17Nta1f/JSWvjqJkQDNMCLkhbdakksjfsAftq2PVU898CLAcmHyZQRkwGVTteViyl/r5Dd+8w
 Rijc9RE45bERtihpY4rKQlYFbMnrew+orT/KGLWJNkwS8A6CO4/l8Nk7ILPwe06W/bgXqrRQgAqyU
 XntFoJWbmQjPJleza417T13G;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Co-00BbuZ-0P; Wed, 29 Oct 2025 13:27:14 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 048/127] smb: smbdirect: introduce
 smbdirect_socket_shutdown()
Date: Wed, 29 Oct 2025 14:20:26 +0100
Message-ID: <84a38bb78cf7f7ca48d54242b1d06f5f181010cb.1761742839.git.metze@samba.org>
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
---
 fs/smb/common/smbdirect/smbdirect_connection.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 1487efbe7620..5670e442e129 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -1100,6 +1100,12 @@ static void smbdirect_connection_destroy_sync(struct smbdirect_socket *sc)
 		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_socket_shutdown(struct smbdirect_socket *sc)
+{
+	smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
+}
+
 static void smbdirect_connection_idle_timer_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
-- 
2.43.0


