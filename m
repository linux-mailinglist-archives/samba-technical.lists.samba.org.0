Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A611DB1A0F1
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=86PQTTD/8vIal3LVRgKzMafkOkFA0tsZeqaHvjLdiYg=; b=oQKS9Jq7K+kh6RQ6nq86xrtJXg
	pWTurBSRduQGcTtZyCZEabKl7G9UMkAQAloZ+9Tvx3j0vwWPQ0VTdt+pWlz744x13crpV2yVz7khB
	At/ahuwTnJjs6Mp7mAwfVx9H4bslxaxeWWBFt4m1xhS67TMYHzOa/ARQlIr/c1qJcHMeUUGK2Hlpb
	Rqf2euwMU1anzVMkwfZnXozhqLh4Z5q8J/SaDXSUxRfJI7eeyYAJHI437zOJhvB5035QLWriNOanr
	gctMPhyMjo/rMuKLTItxQzZ/QOb7jwD/yYzf4xyOGW9gbG7Y0rxzd0TObWWp7ZFo7e4x1Qe9awpsJ
	G6HEeJpg==;
Received: from ip6-localhost ([::1]:50744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu3L-00EHvI-6g; Mon, 04 Aug 2025 12:12:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48786) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2z-00EHqB-Rs
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=86PQTTD/8vIal3LVRgKzMafkOkFA0tsZeqaHvjLdiYg=; b=bdf0vcbNuGYj5WTKZrDm0nQl+G
 Nm98iy+NBCMwRcNiZAT7NI8WEapLlSdIeEKPtcb4lClpCfAdJRoujcrYcpdvw/xzPpKyGqLQMtXPj
 +o/QBclTTaeeriBWCn8G1VtNLZhDWxRdHwIgZOkXcXtebiNCb6UFQcn/A2mVIoNOPHfdhbAi7PIAS
 yT7YCs5w636nmSGviVCspdHnB3hdzsQoh57iVvPwSU0qQ080wdazA5RY6v8FMDlzpoGh6FKjB09mz
 iKgcJKCLCNUGu8bDTCxHZ+0ML/rkS/HVyZRbDZQz3xpwzsRevQ5YSeUsSauSsRWqaBcsYMJZnAUdV
 OC8otxckEmycHXjfTF+Bqxi5/Z+biR/WoUrhRLBv6tr/G6R5YteMaz77bB/Z5DNKVLLE3gzTWqYeB
 G7aSGF40NkcZO/XxChhffa+yn/aYPyXCMJMvL0VSIqjzy2HlK+RSGpn8JdBqqimzljkld5OLbylUL
 93wlr9uVO9+k24gXo+hhWsOU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2x-000vyn-1H; Mon, 04 Aug 2025 12:12:07 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 5/5] smb: client: let recv_done() avoid touching data_transfer
 after cleanup/move
Date: Mon,  4 Aug 2025 14:10:16 +0200
Message-ID: <64cb50961182cd17ac9bdda2913986f322a5acac.1754308712.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754308712.git.metze@samba.org>
References: <cover.1754308712.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Calling enqueue_reassembly() and wake_up_interruptible(&info->wait_reassembly_queue)
or put_receive_buffer() means the reponse/data_transfer pointer might
get re-used by another thread, which means these should be
the last operations before calling return.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 21a12e08082f..58321e483a1a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -479,10 +479,6 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		data_transfer = smbd_response_payload(response);
 		data_length = le32_to_cpu(data_transfer->data_length);
 
-		/*
-		 * If this is a packet with data playload place the data in
-		 * reassembly queue and wake up the reading thread
-		 */
 		if (data_length) {
 			if (info->full_packet_received)
 				response->first_segment = true;
@@ -491,16 +487,7 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 				info->full_packet_received = false;
 			else
 				info->full_packet_received = true;
-
-			enqueue_reassembly(
-				info,
-				response,
-				data_length);
-		} else
-			put_receive_buffer(info, response);
-
-		if (data_length)
-			wake_up_interruptible(&info->wait_reassembly_queue);
+		}
 
 		atomic_dec(&info->receive_credits);
 		info->receive_credit_target =
@@ -528,6 +515,16 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 			info->keep_alive_requested = KEEP_ALIVE_PENDING;
 		}
 
+		/*
+		 * If this is a packet with data playload place the data in
+		 * reassembly queue and wake up the reading thread
+		 */
+		if (data_length) {
+			enqueue_reassembly(info, response, data_length);
+			wake_up_interruptible(&info->wait_reassembly_queue);
+		} else
+			put_receive_buffer(info, response);
+
 		return;
 	}
 
-- 
2.43.0


