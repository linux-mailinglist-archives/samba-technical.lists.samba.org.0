Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B486BF2F4D
	for <lists+samba-technical@lfdr.de>; Mon, 20 Oct 2025 20:36:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pnoXJ/UzCKiqULf2HvyDLJd+4GgK7oEsXhVJ4rmLv5Q=; b=hS0XmIKCSeqkSHgIe8MsE70D8X
	o3DGhfnvM82X7UByyumkkWmOxahrydSi0iGHwm6OD6d0FsAYX2x8ixj1TZECybK0fAQk8Nm7T8yOz
	OQbEWbyGb1A/1M4WIN29TQnrOoJqzEdTj2kWMED47eaO+TvP7fn6s5PXDdLgplvyMLiNI9pmzCyze
	gVFOYpfs6ujzNzly4K92W1CC7I/qfWDybSSax4MhEwynjPvcdcWLl3RVBKhJYVPCAzJi7NHNj2pw1
	nxLJz2eri5MzMeq2rjZJD9z54+Ls05Pq9i7C5NVWFW5Ay8JlE6zPO3IlAMItoBGy9C16spLPdJmaL
	WqBpJHzA==;
Received: from ip6-localhost ([::1]:31486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vAuk3-008NJJ-PS; Mon, 20 Oct 2025 18:36:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42762) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAujy-008NIp-EO
 for samba-technical@lists.samba.org; Mon, 20 Oct 2025 18:36:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=pnoXJ/UzCKiqULf2HvyDLJd+4GgK7oEsXhVJ4rmLv5Q=; b=1s+5abeZu8sAx87UqZwj1Z4qV3
 zfF2Qdg5fQzVvAGCrpIkrIk/AHnAKmfKLg2qB1TsBJKH3yKc8FxdUnyPW25D56esz9akv/lDTn7qb
 LQBAg6nsii2A/8frtjt/y/QIUqf6g740uFZFM0HUUGAtlhYUni9mP3SXKozSWrVWY0jMuiWAJ+XcI
 asFTc0Goio20CY84sZrst5m8MCaydYItYisHq1LV8mMO2wwMmE3S7P1YTHoyctuok1SrdR/A2G5QV
 53i9u+9MXKqTNnm1+Jw2d/J1VeMpMB+aADlPsSIwm8YVZBNvIfODrsALHKlDcI9XMIeZjWprsKq+3
 gnkOWrX9xJt9j1keNgXI/ktevjyjdCeCI2bdAh5JDpmnO/A3/Bp+DGsifniXwoPi9ntIUD8unSEUr
 xBGBrGAQDzE662gBaYEx6N1mMy9+ShNgG9lpChnmn8ZpUj5N/uBf2ZTXgrfqHs5u3puVlb9Ldnz77
 3anNuJaGoOrNz6BLvu3KyqV6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vAujx-00ACNG-0w; Mon, 20 Oct 2025 18:36:17 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 1/5] smb: smbdirect: introduce
 smbdirect_socket.send_io.lcredits.*
Date: Mon, 20 Oct 2025 20:35:58 +0200
Message-ID: <19cd5ef0c19786bce8c7295d85f7bebefce58a98.1760984605.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1760984605.git.metze@samba.org>
References: <cover.1760984605.git.metze@samba.org>
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

This will be used to implement a logic in order to make sure
we don't overflow the send submission queue for ib_post_send().

We will initialize the local credits with the
fixed sp->send_credit_target value, which matches
the reserved slots in the submission queue for ib_post_send().

We will be a local credit first and then wait for a remote credit,
if we managed to get both we are allowed to post an
IB_WR_SEND[_WITH_INV]. The local credit is given back to
the pool when we get the local ib_post_send() completion,
while remote credits are granted by the peer.

From reading the git history of the linux smbdirect
implementations in client and server) it was seen
that a peer granted more credits than we requested.
I guess that only happened because of bugs in our
implementation which was active as client and server.
I guess Windows won't do that.

So the local credits make sure we only use the amount
of credits we asked for.

The client already has some logic for this based on
smbdirect_socket.send_io.pending.count, but that
counts in the order direction and makes it complex it
share common logic for various credits classes.
That logic will be replaced soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 361db7f9f623..ee5a90d691c8 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -142,7 +142,15 @@ struct smbdirect_socket {
 		} mem;
 
 		/*
-		 * The credit state for the send side
+		 * The local credit state for ib_post_send()
+		 */
+		struct {
+			atomic_t count;
+			wait_queue_head_t wait_queue;
+		} lcredits;
+
+		/*
+		 * The remote credit state for the send side
 		 */
 		struct {
 			atomic_t count;
@@ -337,6 +345,9 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 	INIT_DELAYED_WORK(&sc->idle.timer_work, __smbdirect_socket_disabled_work);
 	disable_delayed_work_sync(&sc->idle.timer_work);
 
+	atomic_set(&sc->send_io.lcredits.count, 0);
+	init_waitqueue_head(&sc->send_io.lcredits.wait_queue);
+
 	atomic_set(&sc->send_io.credits.count, 0);
 	init_waitqueue_head(&sc->send_io.credits.wait_queue);
 
-- 
2.43.0


