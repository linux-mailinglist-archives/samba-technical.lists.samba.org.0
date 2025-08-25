Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 371AAB34C47
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=NjNkhDBw5z9qx1Sd2yFZ9YwmtUY03hiScUqRma92TIE=; b=vhbTQ1o3QfKhLem2wWuq8iIHR8
	kwmniRMll5mVMAbBTHUEevNgBFA0SATqUVUs38FvXC2UfCLW0EemW6JEdV9i8XANQyFfcNiPqrWQo
	2Q6l5H5AZh1KL7TFO6Tujll3UoJaY8/Iz/rVCblZzyAeijE9mxIe4pozHQC6UI9heTi87ufyHS4ma
	okcKoVNeOn1vTy5NVxwAyaXyfx/rtr6hfIUrGbhgYNayyl2mLqMmkOSBGZs7KnVTTk6PKOnwvem4C
	Szt3Rq3eYrwgPjg3GQSVnktVOCZkTRGY9u3QtKak/zRCnpTxBdPh13dB5aMltrwVWRLAdVrc3wi7E
	BBlLsMbw==;
Received: from ip6-localhost ([::1]:31440 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe2D-000Lbg-ML; Mon, 25 Aug 2025 20:43:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34868) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1n-000LVH-Oo
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:43:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=NjNkhDBw5z9qx1Sd2yFZ9YwmtUY03hiScUqRma92TIE=; b=Y3NmvPCp3BA/r2y2UXEJBjgfy9
 wTqJVPGY6lk9pF0Y0cu+6PPrseEyjNUR1UDPGb9sIGJm+UDuXmHsni702OvyX5GsjRqB48lLkOEF+
 r6AyvUqFKqMyn+AibRppeCpZeGg3J95AO8FcBpnS+xt9yltWU+G+O9lyA7JB5fcqx99ISsjvqNR7s
 swPnk4SSem0TlW8XiKgm9Ud2n3D1+prSgG9J301RjR33RDtA3/vVncUl3ANNJ0coonV00Vve81yK1
 XbuG4vTaMoXMabP4DUe5OqA8KP9+XWpwqfTrSaauIjAvtZ224EtLBA8FCRfSsk0Kdh30WegkmDhBP
 60EuZFZny5c3+uBVTDnb8ltEy4RC7TfocB2W3satLhv6RSTZFoYeTliFmXWVTVtkXWIWdRiTChZpp
 pnKjCeb2CXqIdaFwiLUlTEZN9e/DFRHyaB1/Q+WdQMaLXglH6Dv5ZGr7qyl9FdjICvrQGy2Qv7hen
 toPZ6Tlg3jblMNZAQwVsegBs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1j-000jNf-2F; Mon, 25 Aug 2025 20:42:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 005/142] smb: smbdirect: introduce
 smbdirect_socket.send_io.credits.{count, wait_queue}
Date: Mon, 25 Aug 2025 22:39:26 +0200
Message-ID: <53c154928e2debc07615bf71e0b09f0990ae34ba.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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

This will be shared between client and server soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index bfae68177e50..fc52c85a32fe 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -55,6 +55,14 @@ struct smbdirect_socket {
 			mempool_t		*pool;
 		} mem;
 
+		/*
+		 * The credit state for the send side
+		 */
+		struct {
+			atomic_t count;
+			wait_queue_head_t wait_queue;
+		} credits;
+
 		/*
 		 * The state about posted/pending sends
 		 */
@@ -131,6 +139,9 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 
 	init_waitqueue_head(&sc->status_wait);
 
+	atomic_set(&sc->send_io.credits.count, 0);
+	init_waitqueue_head(&sc->send_io.credits.wait_queue);
+
 	atomic_set(&sc->send_io.pending.count, 0);
 	init_waitqueue_head(&sc->send_io.pending.wait_queue);
 
-- 
2.43.0


