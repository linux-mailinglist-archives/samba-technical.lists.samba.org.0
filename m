Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE2C866C9
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:04:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=uKgJg9/E4iDotawwGC0HRol7AJp9JRDRoEELjviSTVk=; b=PM1o7DfMHYHrG/y64QJ3rrSvo0
	O1LkwboayjcAQcEE0RY1aRheN86ZxVQH+z4+kyu1dwQB7rC7dDXiL2wSOUnQPNftG5rKwDfSePrN2
	fxrhVBrd1xXp6nC0h7LXyGusYnvfUtYO8oOaklKxxtCYQrnCBPRmJ34y7xJP6rXaVmdhQPDIX8GAR
	m5cq5B+NOqmOv2jRB94oVjZw8QAixdCH5P4KL6XOdOslHTZENnAQkvr9x8BY3/k9XfX2OomNh4f4o
	K9Q4Fi62+842lx+ELjUwN8Ovkmw9m6aSJC1IwhvvEC/bOgliLH9xyywoFopS8bTcXYr3dA/BOt7dM
	M7fRGQVQ==;
Received: from ip6-localhost ([::1]:26182 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxOt-00D8tJ-4R; Tue, 25 Nov 2025 18:04:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKI-00D7QV-Fs
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=uKgJg9/E4iDotawwGC0HRol7AJp9JRDRoEELjviSTVk=; b=HFfXNtFpxtPVgJy6hFPxSWobty
 2wsN4knMm90Zku4U3nUASKkd02EOL8S9fzpgCpEOaJsXoMbI5inEfB9/vkByDNLFsAqDrow89U/uY
 Mu0IWCcz5cXwntFo30/Qld6A61e6Zc3xrDT6Zw2bWEUaqv75auv7ls6hyQQQwTX75Qxdiv/wk20IK
 cbCduw5djRwVNKtN6vEsh0SXZIF8ph2ynhwPDASfEbC1VqfzCB6oIszNV4RFkZan3UOfb/trHf9cn
 5y7J4BJFkMbE4gKIQSmjmsUpUi3scDBynzGg6kf82N3o98Nddj0pXm5W8YpSgTZxy6Wx2hYK+Oo+s
 CSwpd2RSmoZvC98euOfRMilEgL7eTmZExmUJBEQFgh77sFGk7K0IzIz2olLrndf4lbQSE0JgdCS4A
 2kRtIuNhbCk4nfiz+cuGiHe+m/+usVz+b8KPD0DddcIRnBBgCgu6cAT0LoHyEB4wB540IfGXn3iFc
 NS0OSa14rXisEi4C7U+X2TgP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKF-00Fcx9-1T; Tue, 25 Nov 2025 17:59:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 030/145] smb: smbdirect: introduce
 smbdirect_connection_recv_io_refill_work()
Date: Tue, 25 Nov 2025 18:54:36 +0100
Message-ID: <ca94d20bd219eaf6ff1bb308cbfecea733b1145d.1764091285.git.metze@samba.org>
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

This is basically a copy of smbd_post_send_credits() in the client
and smb_direct_post_recv_credits() in the server.

There are several improvements compared to the existing functions:

1. We calculate the number of missing posted buffers by getting the
   difference between recv_io.credits.target and recv_io.posted.count.

   Instead of the difference between recv_io.credits.target
   and recv_io.credits.count, because recv_io.credits.count is
   only updated once a message is send to the peer.

   It was not really a problem before, because we have
   a fixed number smbdirect_recv_io buffers, so the
   loop terminated when smbdirect_connection_get_recv_io()
   returns NULL.

   But using recv_io.posted.count makes it easier to
   understand.

2. In order to tell the peer about the newly posted buffer
   and grant the credits, we only trigger the send immediate
   when we're not granting only the last possible credit.

   This is mostly a difference relative to the servers
   smb_direct_post_recv_credits() implementation,
   which should avoid useless ping pong messages.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index bc88cbb313ce..f260d50a561b 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -683,6 +683,98 @@ static int smbdirect_connection_post_recv_io(struct smbdirect_recv_io *msg)
 	return ret;
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_connection_recv_io_refill_work(struct work_struct *work)
+{
+	struct smbdirect_socket *sc =
+		container_of(work, struct smbdirect_socket, recv_io.posted.refill_work);
+	int missing;
+	int posted = 0;
+
+	if (unlikely(sc->first_error))
+		return;
+
+	/*
+	 * Find out how much smbdirect_recv_io buffers we should post.
+	 *
+	 * Note that sc->recv_io.credits.target is the value
+	 * from the peer and it can in theory change over time,
+	 * but it is forced to be at least 1 and at max
+	 * sp->recv_credit_max.
+	 *
+	 * So it can happen that missing will be lower than 0,
+	 * which means the peer has recently lowered its desired
+	 * tarted, while be already granted a higher number of credits.
+	 *
+	 * Note 'posted' is the number of smbdirect_recv_io buffers
+	 * posted within this function, while sc->recv_io.posted.count
+	 * is the overall value of posted smbdirect_recv_io buffers.
+	 *
+	 * We try to post as much buffers as missing, but
+	 * this is limited if a lot of smbdirect_recv_io buffers
+	 * are still in the sc->recv_io.reassembly.list instead of
+	 * the sc->recv_io.free.list.
+	 *
+	 */
+	missing = (int)sc->recv_io.credits.target - atomic_read(&sc->recv_io.posted.count);
+	while (posted < missing) {
+		struct smbdirect_recv_io *recv_io;
+		int ret;
+
+		/*
+		 * It's ok if smbdirect_connection_get_recv_io()
+		 * returns NULL, it means smbdirect_recv_io structures
+		 * are still be in the reassembly.list.
+		 */
+		recv_io = smbdirect_connection_get_recv_io(sc);
+		if (!recv_io)
+			break;
+
+		recv_io->first_segment = false;
+
+		ret = smbdirect_connection_post_recv_io(recv_io);
+		if (ret) {
+			smbdirect_log_rdma_recv(sc, SMBDIRECT_LOG_ERR,
+				"smbdirect_connection_post_recv_io failed rc=%d (%s)\n",
+				ret, errname(ret));
+			smbdirect_connection_put_recv_io(recv_io);
+			return;
+		}
+
+		atomic_inc(&sc->recv_io.posted.count);
+		posted += 1;
+	}
+
+	/* If nothing was posted we're done */
+	if (posted == 0)
+		return;
+
+	/*
+	 * If we posted at least one smbdirect_recv_io buffer,
+	 * we need to inform the peer about it and grant
+	 * additional credits.
+	 *
+	 * However there is one case where we don't want to
+	 * do that.
+	 *
+	 * If only a single credit was missing before
+	 * reaching the requested target, we should not
+	 * post an immediate send, as that would cause
+	 * endless ping pong once a keep alive exchange
+	 * is started.
+	 *
+	 * However if sc->recv_io.credits.target is only 1,
+	 * the peer has no credit left and we need to
+	 * grant the credit anyway.
+	 */
+	if (missing == 1 && sc->recv_io.credits.target != 1)
+		return;
+
+	smbdirect_log_keep_alive(sc, SMBDIRECT_LOG_INFO,
+		"schedule send of an empty message\n");
+	queue_work(sc->workqueue, &sc->idle.immediate_work);
+}
+
 static bool smbdirect_map_sges_single_page(struct smbdirect_map_sges *state,
 					   struct page *page, size_t off, size_t len)
 {
-- 
2.43.0


