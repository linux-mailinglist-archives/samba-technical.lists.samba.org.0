Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 751F3B34C35
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:42:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UBWxRjqbP1NxfDDkYBaBDDKVCkFotsBNHjyJFppPmTg=; b=xxB8bX7Nn2PJevqZjnoxzuzl9R
	BC9Lp80vq+/LRtPu84+1xG2h2zSklDPSukX3nCowhfnOqm+oWVkBbbT1hgml6Xlln3Gkz0BTxzP/h
	n0MhFpPeGcFw4sUzcyviJyKzfRC9fvBeI9g7t+qEEIsiRzR5lb18mecWzI05BGx6FKKPF+feYPj94
	wWgRkpe6Pe9ro7r0zCTP5r3nmCGd2rf9wDoPVT3XhYZNzDzthp78Vrf4fnWtpvHHsXHpzbNbb5TtF
	W5KlnfjnF9OHiccd26ffWFiqnaTOtUmNKfmB5A+Fen4xzX5hC4j5a8ZeOxDxQuPL7peYXRabg3wWH
	ksM7pIvg==;
Received: from ip6-localhost ([::1]:42822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe1C-000LHq-Ob; Mon, 25 Aug 2025 20:42:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39380) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe18-000LHQ-Eo
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:42:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=UBWxRjqbP1NxfDDkYBaBDDKVCkFotsBNHjyJFppPmTg=; b=JiGb6H5PJf6UudmPgXUHTCq6e9
 iJjx7dfwgJALWR9Q0/7/ELJlkPxkH+jsM1e8KfNvDUmtW5sXHnnPFeAsQftaWA/IuICvyl6pVMxs9
 hAZ6rhnA1wt5Iqbm2epzy9se2AHWtsP8q6c6P33cV9bayb8SoqGPmuvO0N1RjlHcqvKRXkJi4VrEt
 JlE6w5X7LVgr1uQLiousc09JpKn38gln8yGzX8+oPsRkaFhwx3uSLAwGilhHdhP6zZEh0m2nFsVcm
 ODCCfHIJVa01PSElJxwwiNeXETpFUeFb+Lx7SyyiEN5cVSelLkKIatKpfk73YxY6ZsVRvNAgttycy
 T4PSJdl3Bc0YKbldvsG9YrDWMkH8eLWjZ5UsjONbX0GXIHNPoGjTALMFseJ5V5dZ1vwXuDx0bjnn/
 xTlM/7bwxEiIhlyWdzjkuys/T/ZiMQeJw8qTnCkXEQBGjuvULp7iK3PSBM/E6V/9VzMvocWhLhBGA
 pAcrXUGhGB4v04XLMbOcqZ5M;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe17-000jJ8-2n; Mon, 25 Aug 2025 20:42:13 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 001/142] smb: smbdirect: introduce
 smbdirect_socket.status_wait
Date: Mon, 25 Aug 2025 22:39:22 +0200
Message-ID: <14aab245261c699cd5ac2057738b1659a5028113.1756139607.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
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
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 3c4a8d627aa3..80c3b712804c 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -18,6 +18,7 @@ enum smbdirect_socket_status {
 
 struct smbdirect_socket {
 	enum smbdirect_socket_status status;
+	wait_queue_head_t status_wait;
 
 	/* RDMA related */
 	struct {
-- 
2.43.0


