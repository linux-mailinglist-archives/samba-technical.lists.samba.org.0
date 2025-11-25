Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 475D0C86612
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:00:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xXg/ga7QYryW4xZy2aHLO3396tv7jshh5KqEsbMMpPg=; b=GSHvTZ57DNJv8NSZ83Y/FeIhKx
	VZu9y8rClhSt8/LySC+8dvKwL5EO5DXobRezZJEPu8juE2NKFU0LvL+8IRDdC/dVhU2/dI73bUXnR
	sj5cwaFMPJE7Zj24/ZZ1ZcSAMyXXmNya/1t6YE15dOOCULaccTjg42j0vrhFDr3SaPgl3/hO/6teJ
	Elj7mkfCvdiWVYjOY4QvZr2jPMVCktNKkXNRqWDk+YkQrvzQIUPx8IzV7xO2OnQNpXFrR3+lJa9mh
	9JoSjuhLTESowlgBn/s3B5BPc0egLS5UpWtnsOYVzri6BRXqMdYgJqlGroIerWJUuHHlCgpsupnyB
	B+6/t2jQ==;
Received: from ip6-localhost ([::1]:37506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxKT-00D7PE-UD; Tue, 25 Nov 2025 17:59:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23440) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIa-00D6ro-Gs
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xXg/ga7QYryW4xZy2aHLO3396tv7jshh5KqEsbMMpPg=; b=1Bpes26wCEqIF+JALfMFx8dH3v
 d39/BoHEAfxu4E7o+kbc8N2nZEAtv6OTiPWbDdBYh6e4FFgh98NHVqYK/Fs4U2ep0v9vT3y0lNp1U
 Xcs7mZswylX1RIw00TeNx3Hok837d+JNFJpYGuQTcbV3d8KaxDDzqU9SHZecYw1Bf5hFAnHdyglN+
 dl7l9tD25S0sZgqhBGLETh1Yesv8XO0jEaWfNoSj/5g3ccwQG3TYwZ9bZUFIzPja9Ztpo3Py6vI+g
 Ygbvy9P1i/VfYShlNiY8TwyTx+nmexH3tU+JJqCiZvCxQ+sCBKidhAeeX3emXKiJwaJlJkggL65+1
 gekmbjCIq4EE3SnswiVvhcS0xnKZeh6JWUsvvMWRccRgrbCxfOkxwUuPVJoOHtoDtc2Dtn7UeLOmW
 jKJ1WQN4N6sVMG9PWJCCSdUqKukdzXDp0qiRoKDtc/PWfgO8E08ZfdmSw8IOkC0NVMDMjhY293Lk6
 mO+udyWmDYLUzKrunBEPJ5Ha;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIV-00FcgP-2D; Tue, 25 Nov 2025 17:57:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 012/145] smb: smbdirect: introduce
 smbdirect_socket_wake_up_all()
Date: Tue, 25 Nov 2025 18:54:18 +0100
Message-ID: <d570a3917fe080a7172f37646cc1015d77cc48e0.1764091285.git.metze@samba.org>
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

This is a superset of smbd_disconnect_wake_up_all() in the client
and smb_direct_disconnect_wake_up_all() in the server and will
replace them.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index 6c2732496cf7..a249e758379f 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -44,3 +44,21 @@ static void smbdirect_socket_set_logging(struct smbdirect_socket *sc,
 	sc->logging.needed = needed;
 	sc->logging.vaprintf = vaprintf;
 }
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_socket_wake_up_all(struct smbdirect_socket *sc)
+{
+	/*
+	 * Wake up all waiters in all wait queues
+	 * in order to notice the broken connection.
+	 */
+	wake_up_all(&sc->status_wait);
+	wake_up_all(&sc->send_io.lcredits.wait_queue);
+	wake_up_all(&sc->send_io.credits.wait_queue);
+	wake_up_all(&sc->send_io.pending.dec_wait_queue);
+	wake_up_all(&sc->send_io.pending.zero_wait_queue);
+	wake_up_all(&sc->recv_io.reassembly.wait_queue);
+	wake_up_all(&sc->rw_io.credits.wait_queue);
+	wake_up_all(&sc->mr_io.ready.wait_queue);
+	wake_up_all(&sc->mr_io.cleanup.wait_queue);
+}
-- 
2.43.0


