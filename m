Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFD0B34C6B
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:45:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=07DSEBWos/y6qzcwAU4kkABmbcVJKOtYqHBnQeYT+JE=; b=3rwZBNGNnTiw3Cu3yWfthj5VhI
	YxOJjl6uEWFh2AHe6TIkm/eqoPqQa1S/+WD5qniFuqKRzlwyMtoBNekhrBHjR/lb9V3jxZqg29q0r
	oLbzRCZLqzRkjYp65abyaN7zS3XcCdOVHKjJdeQm+p8X78021S8btvKRv8oPva/xJxYJuOIlfL+9I
	Had+w9yXAsovtBlgEcHyeg9phYYbODaOggdSmRXwvUB/kJaQ1FlPBI19/yAEoIRmHy1Deqw9hV1pM
	mjYo6PQ8SmR6PeVBR0kZAnO0A89/BD8AjrafulVGUgYk2pPSoXvbeAidiUPRcYXjLQbvyXyX12+1c
	KtkgRzCA==;
Received: from ip6-localhost ([::1]:34698 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe4X-000MYS-Hq; Mon, 25 Aug 2025 20:45:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23616) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3b-000MDM-AO
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:44:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=07DSEBWos/y6qzcwAU4kkABmbcVJKOtYqHBnQeYT+JE=; b=Ek5EZnhwZ6/7rOd/LQk9mATqwM
 uTDSk+6Jbu7TpHk7bf7xDwN50qyIC8buyuMawu9Mi08hbCxB7U+0feS8+Sz/7WD7h8EPZO6TOw4Ni
 dKswZKEWxNAoiFteW9eLiBSnBokww24Fd3j6jyJ55f2BijUFyEYfeFNE+bVt0VKIA6PvfyZLOWfus
 FwZzDGTXp7uYF6Tao4vA7j8L7cfKctAOSn4qpzXT0YHeysW8+y372JO84ZblS99IftZC+A6+SLnQk
 LKL1F8G2kuNrhrzYLurtIJ2dMMxcIl7xz1Hl+v3FyNWT1RWBoP75hbUOxIsa5yNZIoGF9qoJuEPeC
 QN6BmZdpCZIECacEmg5zwymkWSWJCJpZQwGs+xybSqhNo1nyEGst8SfpAU8S4JeCDJI7frVT0F+o8
 kctqFMxgoxjMEr2h+ICPuCa8zVzafZcr8u0ej/4SNGdbFuonBG+WVcvqBr6+FHBqEX3IqwAO23xmI
 jUaffQORl+Nv8JtpTnzhNHGN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3W-000jho-2R; Mon, 25 Aug 2025 20:44:42 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 017/142] smb: smbdirect: introduce
 smbdirect_socket_parameters.max_frmr_depth
Date: Mon, 25 Aug 2025 22:39:38 +0200
Message-ID: <268c6376965096bf8b2303aaea91df616ebf3239.1756139607.git.metze@samba.org>
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

This will be used by the client...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/common/smbdirect/smbdirect.h b/fs/smb/common/smbdirect/smbdirect.h
index c3274bbb3c02..05cc6a9d0ccd 100644
--- a/fs/smb/common/smbdirect/smbdirect.h
+++ b/fs/smb/common/smbdirect/smbdirect.h
@@ -36,6 +36,7 @@ struct smbdirect_socket_parameters {
 	__u32 max_recv_size;
 	__u32 max_fragmented_recv_size;
 	__u32 max_read_write_size;
+	__u32 max_frmr_depth;
 	__u32 keepalive_interval_msec;
 	__u32 keepalive_timeout_msec;
 } __packed;
-- 
2.43.0


