Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 53408B1DB75
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 18:14:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=7F/232G2VDG9RxJgBb29CQuodJH39OPElS6DaH1eU98=; b=pg1ZfjNEbBdciG0ZywjWALke31
	XECBk5fw4/UGnEjpyG3QU+C4r1kTHJcBYO+c5pw1v7HWnMXhb2NccOCS7o5zm4uajQ8ERpYgGP0Nu
	th/xQKZuWqAQmLvobDs88bqee7ZPnwYuzSQ2pfQtG2XD4iThQNHpp/dw47P+Hw/oceAbUMLy5ARuk
	koEzXBmVL43NG+4PeNBcQAAu2jRLmtA7vqrqCbRFBfGI9S1PkeeA6Mb+MoqbjUoQhSW9xQKj/seRP
	zuCF+3IlFXzVKXU0QvD5mOM8I4LyF03bLCDU6PtzLoaTC8+WRea/hBhI9P3s1OlhGRjk3gkBzAhYm
	ZCIHNIOg==;
Received: from ip6-localhost ([::1]:40766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk3Ff-00Ea0M-AG; Thu, 07 Aug 2025 16:13:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18300) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3F7-00EZq9-LA
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 16:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=7F/232G2VDG9RxJgBb29CQuodJH39OPElS6DaH1eU98=; b=QDRb+ohkR6ID9oyalL2zXRFYlW
 NENkbcDtvriiELZ93LPE/gU+8N016oHU5JqWNi669mCajZd+O6o3x1c+JBSrrokq3i6VpTpgL9p1C
 WjH+p9JzcWjkJpue+4yGO+AeD2lZ1wIEqzP4KaBzvtEZALxG7QImMSJlP1kOhDE3IX3fakWTlpx1g
 olsIuEAB+pnSUwuLCFQOwKWj8JpNOy4UmFMWjX5JwMfugaCWe0pzeIG3TQ/HubwQaOJTWMM3S01qS
 +jKNbLdihq0+uNtSH9D0c1BUZGwYdOniHqBNxUOJufbQTR8Kfg4E1dCNPfjEjllqprSL6ZGItDewt
 1uj6QgWVGh56YPrANlQY9+xtfG2hwl7V8yOJaKSpUcwfLowxI5SHKWVTatBljVjkNezQiWtiRWs/b
 RWipVQ2hhW1p1FB1KM/LwIb2l5ff2Faf95pn3M7zFvFntd1ngWo9VgKl/G9yRC6noq+VMolupcQpI
 kbE34N2N++pjZmrX1iCAuTYx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk3F2-001ciC-38; Thu, 07 Aug 2025 16:13:21 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 8/9] smb: smbdirect: introduce smbdirect_socket.status_wait
Date: Thu,  7 Aug 2025 18:12:18 +0200
Message-ID: <9c447963b95f34eed0f752feb624264e40d8f2c6.1754582143.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754582143.git.metze@samba.org>
References: <cover.1754582143.git.metze@samba.org>
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

This will be used by server and client soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index f43eabdd413d..aac4b040606b 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -28,6 +28,7 @@ enum smbdirect_socket_status {
 
 struct smbdirect_socket {
 	enum smbdirect_socket_status status;
+	wait_queue_head_t status_wait;
 
 	/* RDMA related */
 	struct {
-- 
2.43.0


