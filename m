Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 597AFC9D07F
	for <lists+samba-technical@lfdr.de>; Tue, 02 Dec 2025 22:16:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=nFx/LeqE9ahJ9gho311pUXSBD1x8oa7Rl1ekFX2Cs0w=; b=dSOdn7Qtwi9DQnlIRSlJUoIA2w
	CnSrEoJYRPBUzsbMt4p3f4LaJqOTht5tc6Ty+1Em2A9LyLkN/cYFiRbCpTUFlZQfOZVRCs0VNsTU9
	YF1zPkgDO+r5X3q0nFRgAtI8j8/xyA49BhZQEDPHirfGruSw9CNoTqXBbETRgU/LboHygnnKnEYOd
	Ex6XcKMvpRHudRbW0cZrnhRM00Q95zCp+fFyp4Rkmo2MPKkTR1x4ZJmJHMtdGNJpfH8f3MfQwghiy
	cyvP8JmSAiEj4xeBr1okMGAe1JqlXCLVqbItl2OYkAGrBxJa6l/pDqausJHPe2+xjkjEnK7oXYJWP
	x75TVUoQ==;
Received: from ip6-localhost ([::1]:50750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vQXj3-00FbHQ-68; Tue, 02 Dec 2025 21:15:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20382) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vQXiy-00FbHD-Qy
 for samba-technical@lists.samba.org; Tue, 02 Dec 2025 21:15:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=nFx/LeqE9ahJ9gho311pUXSBD1x8oa7Rl1ekFX2Cs0w=; b=zRVetU2Gi8ONfTdpJMWyDkX+4D
 mUNg9Fl1DGz57JdIw6jsBhKAPVBMzZo2UoaUOwQZqdoD/zcZP6GdTsmToKZWhStERwj4Ka91L7LNM
 s5lFivIXoM3M0z0p4N+qz58IoPA7hswmqX9l2mQuuxXQPD0GeXjwjIituQwajFvmYcZZV0efJPT4e
 XhFEC/Qfqzv6X8IVHMvdyt0dIjCMXizAZb9mTNE8kLFLSMhoMNIXz2BtYcu7AsyE9qbbHUjD5KbxL
 H2zAzpeJmlljAawnXRszt6E8UDH1DzKve2RqSGicsO2/+6rg6EoMp6q26ojZzDf5WBGFbsyu2NEfo
 ynIECMEPocnqnCYNCLhdEF19fjSz7ft5vnOtMpYjEIPcEyu2dgH8Wc0fw41blfvyDuWMjn7cLw2zj
 B2Eh3NGnfl2qAlnVH08natoTaDyF/bSLInwffFc/K5m75yEr5PtzkPm3Xva/Peog9gU3SWr63Igin
 AE5PP6VY3Js2m7Rb1sIBo7K/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vQXix-00Ghsl-2Q; Tue, 02 Dec 2025 21:15:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [RFC PATCH 1/4] smb: smbdirect: introduce
 smbdirect_socket.connect.{lock, work}
Date: Tue,  2 Dec 2025 22:15:24 +0100
Message-ID: <bb7abd609300057a839001f2501f5e1827d825a8.1764709225.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764709225.git.metze@samba.org>
References: <cover.1764709225.git.metze@samba.org>
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

This will first be used by the server in order to defer
the processing of the initial recv of the negotiation
request.

But in future it will also be used by the client in order
to implement an async connect.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 384b19177e1c..ee4c2726771a 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -132,6 +132,14 @@ struct smbdirect_socket {
 
 	struct smbdirect_socket_parameters parameters;
 
+	/*
+	 * The state for connect/negotiation
+	 */
+	struct {
+		spinlock_t lock;
+		struct work_struct work;
+	} connect;
+
 	/*
 	 * The state for keepalive and timeout handling
 	 */
@@ -353,6 +361,10 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_WORK(&sc->disconnect_work, __smbdirect_socket_disabled_work);
 	disable_work_sync(&sc->disconnect_work);
 
+	spin_lock_init(&sc->connect.lock);
+	INIT_WORK(&sc->connect.work, __smbdirect_socket_disabled_work);
+	disable_work_sync(&sc->connect.work);
+
 	INIT_WORK(&sc->idle.immediate_work, __smbdirect_socket_disabled_work);
 	disable_work_sync(&sc->idle.immediate_work);
 	INIT_DELAYED_WORK(&sc->idle.timer_work, __smbdirect_socket_disabled_work);
-- 
2.43.0


