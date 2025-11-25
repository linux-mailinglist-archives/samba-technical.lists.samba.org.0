Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D4AC86B23
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:46:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NvZExtzgyh791gvhqc5ygnP14QEe5smsq+iq93yu1No=; b=MKGL2jtVU0d4sx0qFppZj9bmhJ
	tXo4JeiYGyWaoNUT6XrZ+JoFqhESpyCCXSSeanSFssDkkH/OFMg1WXsAz88HCMxI0oVSDS6PR4lEI
	iZHK+w22Ze4rpiZ/3noUBtArDUnJOJqLiUnM+Fmnuz/NcMGiTHkBl/FxOvCuw7PcG68yMjPUFvNSn
	Hdbl3SLO/18P8e+i/fn8g07VanfZOo51dzXAYBb3PBQ7oMx3THgcCbmixarvZqxEB0Gb3zwhMfS+S
	YvkPpY86azcaiO/skFXS9vlZs6ZM9Bfd0VGxijo31hN6rfy/7klUFNXeUe3L0s3D8qFJ7mpIPsK2W
	YR+OAKig==;
Received: from ip6-localhost ([::1]:48336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNy3T-00DIJb-Tq; Tue, 25 Nov 2025 18:46:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36620) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNy3N-00DIJQ-U7
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=NvZExtzgyh791gvhqc5ygnP14QEe5smsq+iq93yu1No=; b=c3BgVc4fLKAAd52uHcpafKArkq
 mVRbk2BfndEWAnq1t9Xkwg7nT7Nntg14+bX5ti6VYp8Iy9rXLU+4ylrXpGJiTETrHNQaLJ3l1/dQw
 gC/iwab7EoPBNIEpALqHVz2hVHXMyi3kEXjOKLeZ4pnVn2TAMavGJzoCQpXflV8VraiF+bysmUWB+
 yuxIBO6WTmckcH34dxuxSqWgP3KDqmm8SYCtZOoKwbMyvhRFyEtCcib9OCOwwgblVFyYGfdET2MYy
 n/dZpLGtjjyqtvFp0VgBjADWUs/trHMhruwfYDnaBWrwrUs6SPpohP9FrK68jYPqM1wvfaGYZQRoa
 xzDrqHULwWXoknRIaNKbL1isJV1NUZjslDECdwzy6Yyu3tgI4nVQVvwhuAovGG5NKvmSje87oa7cn
 yqLD9oNspKfwEb1ODoKdyhmEfWCzzfzE48qrS/XxfENTGHtdcba00dIhAIP5hmDMDryO9ek1JdlBV
 x7903YWkvPuGgp7g8W/VQ1Zi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUq-00FeFk-2L; Tue, 25 Nov 2025 18:10:36 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 099/145] smb: server: make use of
 smbdirect_socket_wake_up_all()
Date: Tue, 25 Nov 2025 18:55:45 +0100
Message-ID: <117694f6f28878cc8e48d3043edcca8812fa20e9.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a superset of smb_direct_disconnect_wake_up_all() and
calling wake_up_all(&sc->mr_io.ready.wait_queue); and
wake_up_all(&sc->mr_io.cleanup.wait_queue); in addition
should not matter as it's not used on the server anyway.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 52cc756aa088..d61c95eca0ee 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -285,20 +285,6 @@ static struct smbdirect_recv_io *get_first_reassembly(struct smbdirect_socket *s
 		return NULL;
 }
 
-static void smb_direct_disconnect_wake_up_all(struct smbdirect_socket *sc)
-{
-	/*
-	 * Wake up all waiters in all wait queues
-	 * in order to notice the broken connection.
-	 */
-	wake_up_all(&sc->status_wait);
-	wake_up_all(&sc->send_io.lcredits.wait_queue);
-	wake_up_all(&sc->send_io.credits.wait_queue);
-	wake_up_all(&sc->send_io.pending.zero_wait_queue);
-	wake_up_all(&sc->recv_io.reassembly.wait_queue);
-	wake_up_all(&sc->rw_io.credits.wait_queue);
-}
-
 static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
@@ -354,7 +340,7 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 	 * Wake up all waiters in all wait queues
 	 * in order to notice the broken connection.
 	 */
-	smb_direct_disconnect_wake_up_all(sc);
+	smbdirect_socket_wake_up_all(sc);
 }
 
 static void
@@ -419,7 +405,7 @@ smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
 	 * Wake up all waiters in all wait queues
 	 * in order to notice the broken connection.
 	 */
-	smb_direct_disconnect_wake_up_all(sc);
+	smbdirect_socket_wake_up_all(sc);
 
 	queue_work(sc->workqueue, &sc->disconnect_work);
 }
@@ -545,7 +531,7 @@ static void free_transport(struct smb_direct_transport *t)
 	 * Most likely this was already called via
 	 * smb_direct_disconnect_rdma_work(), but call it again...
 	 */
-	smb_direct_disconnect_wake_up_all(sc);
+	smbdirect_socket_wake_up_all(sc);
 
 	disable_work_sync(&sc->recv_io.posted.refill_work);
 	disable_delayed_work_sync(&sc->idle.timer_work);
-- 
2.43.0


