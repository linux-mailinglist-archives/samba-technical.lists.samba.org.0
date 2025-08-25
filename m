Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D26CB34D6E
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:04:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=79n6oU4o6fuFIfZ6VlNDRIbfI47efxK3S4Xd/LWOWdA=; b=0/YDyNtzz+kgvbVY2V5RLeEIVG
	Gda2gPAx8pHxNQ7BEAjrC4bHvykU/IJvtKRPSc6tOrC4kki1CW79R+EvYvki4x+oO0o06onk+9zA8
	IF18uBEFJtj/2fhAY1/x1twN0ql1N9bjD6s1HvR05P3HeH5dp2XcFSjP787/2+HSVD6WUev31LpOh
	5JXO2thJnP+6KQ+f7ecwy9tz5p8RdZm9UdNby4Ua5NvwFVzETvmVowBpm2H9AkhJdm9FuXywpb9C8
	Zw96vibmtdSNysf8LKYBUuckjdkrMDwJJCq4htC//ThxA2kRaROfyvWEE/eREKuChblMtjvoQbdrh
	qaOQTI5w==;
Received: from ip6-localhost ([::1]:22790 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeMG-000TrR-UV; Mon, 25 Aug 2025 21:04:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64302) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeHx-000S68-Ul
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:59:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=79n6oU4o6fuFIfZ6VlNDRIbfI47efxK3S4Xd/LWOWdA=; b=jsxwxpDFXSDGcsPkNDIQgCUx6w
 Ygvif2JB7sZ8OUbwosE0CH0gGr/hvQ1DzAQK36/fECMeJ0PtTFqBG0Qyn4hF2/oqTtxG5VpMmfb2t
 b5ZiwUOg0iLC66AL98UeRtd2W7F+q3MBJp1CXuqtdbIdRzX5cDGW/V5d2fCLjDbXKjuxNvGqve/z9
 QwFgGUV0bA+AsETuIW0gtiU+Fn/WKxPfWa7EP9Ws4oWysejRBqFqC5IA/FszOFYLwaZsyu1CgVB97
 EczVcO6yF24Ii0F9oKBxX7FL2/kKuIPX/QagkB4JzrgXZ6ZVWzSMjpAfDp5aj8FG9BdN+HuO4pMmO
 9jcxLcZ3kaGRnbR8hlqG+mOlxn9cXlV7hlJdUO9YppavBmz3udMctVNusk0evDMcBN8HGfEJB/5sS
 piKgUcHx6iUDlrzsMK/JBI6SOha7+1xlMmBIlBxNur8v/FMFr/VbKRX2IUQCBApe97TfgkE/Kzz8t
 qOIVKRzqcviQyqFVHic8hZnR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeHu-000mlL-2V; Mon, 25 Aug 2025 20:59:35 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 107/142] smb: server: remove useless casts from
 KSMBD_TRANS/SMBD_TRANS
Date: Mon, 25 Aug 2025 22:41:08 +0200
Message-ID: <67fe9152f886014715eeda774c7c5e7267be4158.1756139607.git.metze@samba.org>
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

At best they gain nothing, at worst we procude real bugs.
Note container_of() already casts to a pointer of the
given type.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 133898b0cd08..09838efa12bd 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -99,8 +99,8 @@ struct smb_direct_transport {
 	u8			responder_resources;
 };
 
-#define KSMBD_TRANS(t) ((struct ksmbd_transport *)&((t)->transport))
-#define SMBD_TRANS(t)	((struct smb_direct_transport *)container_of(t, \
+#define KSMBD_TRANS(t) (&(t)->transport)
+#define SMBD_TRANS(t)	(container_of(t, \
 				struct smb_direct_transport, transport))
 
 static const struct ksmbd_transport_ops ksmbd_smb_direct_transport_ops;
-- 
2.43.0


