Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 57ED4C86A87
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:35:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dQJBEmgmuemS9LmpoA469mMdeNYWXFPBocfz2ukCDWM=; b=cRffwLc+gzmfCZFyJQC7Y542ko
	u8ZsnDMVfHeit81UmoXB8ndbkWzim0xJ6dss6Ff9ji7u+35ltumYjXBaBrRjjLzMuzUKC/vWHhlUE
	t3rz96g048FZghZN5PtMPGv+1vI5yRQjkVcOUEeo7/Tt35avEdlxhzRCxAYvSohhedRnD6/UKXfGt
	uA17Tygq7l1YIzeFExQN16wBQ6xJbGOi9AI9K3SzYQMNUFta3+gUPwG98GdbogdoF4UjP2AHuUMvP
	+VZZvVOERKbNHjGWm9qd/p1rodJlEya1h0+vIQX3RaY+juZMX5Cqf1lyI6t/zETShAGl1HOJXzUKk
	TdnWY0ig==;
Received: from ip6-localhost ([::1]:47906 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxsp-00DHNR-8n; Tue, 25 Nov 2025 18:35:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45266) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxqL-00DGfg-Ae
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=dQJBEmgmuemS9LmpoA469mMdeNYWXFPBocfz2ukCDWM=; b=iZfyGD7S60wFZ0DYysnn/zVZ/y
 9UMq6gClOWlTcZRtO3KZQ1h8JLcck32IfNBWWKYFPKAYjjB/exz+dvBNgNTnpXKiwY77IovHbtlve
 5fwjk+lNf6nhKpkZntir39abjfd4lxFo/yP2KLkG4b1pT/20sNvny3pFATISau11I1ij5M8T+uQ1E
 JBaZynr7ilyHYuWxNrRo9F39l+lgIJ3T+xCOjLiGnLQ2kfeTgvLXJp7QOFaVkmSqAZLMbaTpbQ1oU
 OQl3/IMaCpY1+ka2QCZB6MV64akK+77mgWfamtInqkSOoQ1JbEHxBNDL0Qymz5afh7raFjP5tuy3c
 718MIf4OMfDDNZQuR5P490ZKhYWDrrC+5Ags9lJXAWFbwg4FUHuPszHsiCmPRq++1Et5fjrCKFslN
 cbXi/nMEDcHpF2fMATWH929Jq6Gmrwc1qMbJsmS1ZR83KWFHUzfNOe0uQS8PK8Ibj2+n2m/In/trQ
 MPnf6pNHKcPihJACP+5iITDr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxiH-00Ffqu-0L; Tue, 25 Nov 2025 18:24:35 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 134/145] smb: smbdirect: wrap rdma_disconnect() in
 rdma_[un]lock_handler()
Date: Tue, 25 Nov 2025 18:56:20 +0100
Message-ID: <8f3c8ff31a4b4da800e1a35412ce4c14cdf17f4c.1764091285.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This might not be needed, but it controls the order
of ib_drain_qp() and rdma_disconnect().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index 35252aa12fe4..41f69b6f8494 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -461,7 +461,20 @@ static void smbdirect_socket_cleanup_work(struct work_struct *work)
 	case SMBDIRECT_SOCKET_CONNECTED:
 	case SMBDIRECT_SOCKET_ERROR:
 		sc->status = SMBDIRECT_SOCKET_DISCONNECTING;
+		/*
+		 * Make sure we hold the callback lock
+		 * im order to coordinate with the
+		 * rdma_event handlers, typically
+		 * smbdirect_connection_rdma_event_handler(),
+		 * and smbdirect_socket_destroy().
+		 *
+		 * So that the order of ib_drain_qp()
+		 * and rdma_disconnect() is controlled
+		 * by the mutex.
+		 */
+		rdma_lock_handler(sc->rdma.cm_id);
 		rdma_disconnect(sc->rdma.cm_id);
+		rdma_unlock_handler(sc->rdma.cm_id);
 		break;
 
 	case SMBDIRECT_SOCKET_CREATED:
-- 
2.43.0


