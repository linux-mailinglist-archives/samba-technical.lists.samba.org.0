Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFDEB8E6FD
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:46:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mSJq3XOgl8ROiwl4Uxt+5wyf/Jk7meDwTu5oH/PNPjE=; b=ef2rhI3BzsQNWpig93DCUIZ4hM
	dMKXqzOX9pEmR6lPojXDufw3uKa5Ox/h7zJjU29aIA9ccUSWJC6bebXH/rNwToURgaoKlEdM9MstK
	KBYZ0f/bB5F3cjLwuknnwHl8H9feIJW//2zNxgKPyM20hG7jKZLcX055/q7QHdqkmDjlsdBufnC0d
	vHN/JzVEEDq+wpUXgJ3bf85SvBxk97Wxs9dCW3ZvKu7lAYL8eV33r/L5LA4JAImgFP3oKYD6GH/8f
	ptlqeynGS0ISXlhBonEuxRl4Jk3NfFCQ18P5DYSo+xGp/p+JKzgi40UA1RjSWbErXSTDl0N1HnH8r
	5sTFCcdQ==;
Received: from ip6-localhost ([::1]:40014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0RsP-004SxZ-BC; Sun, 21 Sep 2025 21:45:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33530) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RsJ-004SxR-W8
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=mSJq3XOgl8ROiwl4Uxt+5wyf/Jk7meDwTu5oH/PNPjE=; b=UorEm1fZ/2u3N+97WBHrBWYu4F
 Vz0Lvgt8116VxVw6742B8dH5dA0WBsgE+5hfzV2uiv4nyDLBiz9ZPPG93+4ZEwcV+1zxFAxA6srrI
 YQ8oBAwBROVmnH1lD2b82nhFVYat376ohUWxwtcl6005kPi3dOEbjpjVrtseg4ng15O71bhwleQCq
 NpUZ5o/URRZnERsd/eRKXa8edYfG+GKwMIU+jDgHFUb9ePbJe9s3v3Oz+6H7eYIFKsVRoyZ0dtMpV
 pUGZFX6kY79tlJJLzWNf1F99RjMfHBsRZn4JDomDmHFNImA1Hlusasg//E6IclbmUInDk5EUbIq5o
 bhYToG6LOf9uHSrh8epNr49LULlCawPYNM2TOwnmctjwtWQaBFUOuVWYZ8labn+4ddJbgdyPxAdqX
 J27t9bXag5kJ2jzu/ILvS6ohfqPYdHVIiPjQ8fd7YV4YeQ+TzM5wSRJRjEO5X1KqVwgwlyNboGnDy
 x2mhEA01w03l36txonPE3PRt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0RsJ-005GMS-0W; Sun, 21 Sep 2025 21:45:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 02/18] smb: smbdirect: let smbdirect_socket_init() initialize
 all [delayed_]work_structs as disabled
Date: Sun, 21 Sep 2025 23:44:49 +0200
Message-ID: <a31ccd39feae0a9a40fa863038fa0fac0ab87e8f.1758489989.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758489988.git.metze@samba.org>
References: <cover.1758489988.git.metze@samba.org>
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

This safer to start with and allows common code not care about if the
caller uses these or not. E.g. sc->mr_io.recovery_work is only used
on the client...

Note disable_[delayed_]work_sync() requires a valid function pointer
in INIT_[DELAYED_]WORK(). The non _sync() version don't require it,
but as we need to use the _sync() version on cleanup we better use
it here too, it won't block anyway here...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index b4970d7e42ad..5e25abc02364 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -310,6 +310,14 @@ struct smbdirect_socket {
 	} statistics;
 };
 
+static void __smbdirect_socket_disabled_work(struct work_struct *work)
+{
+	/*
+	 * Should never be called as disable_[delayed_]work_sync() was used.
+	 */
+	WARN_ON_ONCE(1);
+}
+
 static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 {
 	/*
@@ -320,6 +328,14 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 
 	init_waitqueue_head(&sc->status_wait);
 
+	INIT_WORK(&sc->disconnect_work, __smbdirect_socket_disabled_work);
+	disable_work_sync(&sc->disconnect_work);
+
+	INIT_WORK(&sc->idle.immediate_work, __smbdirect_socket_disabled_work);
+	disable_work_sync(&sc->idle.immediate_work);
+	INIT_DELAYED_WORK(&sc->idle.timer_work, __smbdirect_socket_disabled_work);
+	disable_delayed_work_sync(&sc->idle.timer_work);
+
 	atomic_set(&sc->send_io.credits.count, 0);
 	init_waitqueue_head(&sc->send_io.credits.wait_queue);
 
@@ -331,6 +347,8 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	spin_lock_init(&sc->recv_io.free.lock);
 
 	atomic_set(&sc->recv_io.posted.count, 0);
+	INIT_WORK(&sc->recv_io.posted.refill_work, __smbdirect_socket_disabled_work);
+	disable_work_sync(&sc->recv_io.posted.refill_work);
 
 	atomic_set(&sc->recv_io.credits.count, 0);
 
@@ -346,6 +364,8 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	atomic_set(&sc->mr_io.ready.count, 0);
 	init_waitqueue_head(&sc->mr_io.ready.wait_queue);
 	atomic_set(&sc->mr_io.used.count, 0);
+	INIT_WORK(&sc->mr_io.recovery_work, __smbdirect_socket_disabled_work);
+	disable_work_sync(&sc->mr_io.recovery_work);
 	init_waitqueue_head(&sc->mr_io.cleanup.wait_queue);
 }
 
-- 
2.43.0


