Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E76C86750
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:08:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=lKA6ST1MbnQPG1RhcqVft3KRJy1bpH5GZVI+G0mS6g0=; b=KTUpO776gC62tqXSFxUvvnWDwn
	zojdMbH42EMJ6F/56OuiENC29TQnT59uSmc5QLA9XPV7otR8JgK+Vq4rW3L+WDJIha3D97gc7HL6x
	6BYSVdT1b1hjv1skq6xRahxeOcgtDIRHnnTZDlJYlX6sRrq+7PQJE/4odOueaBnlC2l8t3YG894BA
	QqRETTwkMUQHSowATKlUER+blatNaNT1cP8nAyLNgduYrfsrutKv9GHX/+8sf+/H+xMeoXq9xjCkE
	KAL0yUAc8aGca5Q2dPOqklPg7TdU4wfTCiat+PGoYTd6k/her6KBeIsLIwrHcqVZHtVJLxaCnVu7I
	MmxMhSqw==;
Received: from ip6-localhost ([::1]:37864 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxSR-00DA3M-To; Tue, 25 Nov 2025 18:08:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38892) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLx-00D7xs-TK
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=lKA6ST1MbnQPG1RhcqVft3KRJy1bpH5GZVI+G0mS6g0=; b=OkG5RE+CwzcK4n+D2ZRCYRlxiZ
 gdWHQcDgZNufNr5olHpS1C3EWNEJvRHfbUKt6kcaDVUPbV+BVhMw0zzRZ1pSjY/xXZaFTQBZmsr3d
 7iYImayxqfUYXNPtWg944+MehS2UF59yCJOrjb/Uq3Lpvl3LyfjE/Ezf1HDjVW3Zzg89pnxsOrEU2
 jUOYv6Z7GD72aPLiQCHuhYA52uNuRWwgdZc1wgG7ylhPuA4yRqoFnha++F0EXqKmMvwR9wgMY60jH
 M1t0MG9QA8sEr5VW5uKAbGnkCgtNvXtt9PG/y7y5s81r6nz/KqPtJ1nTPv7tK5kqAc1b2mnL1/b0Z
 QInth88sI30Z45mZkcY2uatf7FLo4vE4ftWIXzlMdRGvdefWfUgFhQeOqwU62fiVBiWMNgyaiYTGc
 z2tLGO4FQPgD9AsNFKf9eOTzTA75eV84Bl60CzeUDpZgA4CHkiy6Qyt2LT4TJUubx/5na6faM7yW8
 htPMhmhS/jTeRq9b0JI4pZi8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLu-00FdC3-0J; Tue, 25 Nov 2025 18:01:22 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 045/145] smb: smbdirect: introduce
 smbdirect_connection_send_immediate_work()
Date: Tue, 25 Nov 2025 18:54:51 +0100
Message-ID: <dbb988f75cc4bff99de7a39313d36ffdd7a4eb4a.1764091285.git.metze@samba.org>
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

This is a combination of smb_direct_send_immediate_work() in the server
as well as send_immediate_empty_message() and smbd_post_send_empty() in
the client.

smbdirect_connection_send_immediate_work() replace all of them in
client and server.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 1ba83fdc1e6a..8ee3a1e28f82 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -1193,6 +1193,28 @@ static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc
 	wake_up(&sc->send_io.pending.dec_wait_queue);
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_send_immediate_work(struct work_struct *work)
+{
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, idle.immediate_work);
+	int ret;
+
+	if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
+		return;
+
+	smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_INFO,
+		"send an empty message\n");
+	sc->statistics.send_empty++;
+	ret = smbdirect_connection_send_single_iter(sc, NULL, NULL, 0, 0);
+	if (ret < 0) {
+		smbdirect_log_write(sc, SMBDIRECT_LOG_ERR,
+			"smbdirect_connection_send_single_iter ret=%1pe\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret));
+		smbdirect_socket_schedule_cleanup(sc, ret);
+	}
+}
+
 __maybe_unused /* this is temporary while this file is included in others */
 static int smbdirect_connection_post_recv_io(struct smbdirect_recv_io *msg)
 {
-- 
2.43.0


