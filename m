Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D0668B34C5E
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:44:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=A0uqMnQzJ5zybMngTUCbCjTTX8T0NrC0mtPrflGfal4=; b=CFz6j88cZDc845AMsNkaFpxoS3
	P4id7HcKnlBUKOygak3uzcHQEJdTKWnNuwx228ktVuaVvaP8f/BsdDGvg4ZsoWmB8Q+e49QHjx9el
	RNdP+Rh19aGzbaiZiIAefuUTuPhzNyYdSoOG3F8p+q3T7xO3sPkJIXgKJLChdl/s4+QpZiOG9tFkG
	ytjl6IM+GQs1yQoGu+aquzJ9D0XlohwepoUSHG1hKQjkZK2BjM9JGmtO/L8r7zX/AqbPGhZUhZ1Aq
	PHCWB4nU9xZQa6bsz84fuHI1XGUQuetuPMLsa3iZz/ES9hwBjUqz7T4U2+4WOPL2IAQOPfmAe/VLs
	R+LQTNtQ==;
Received: from ip6-localhost ([::1]:41782 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe3O-000M4t-Kx; Mon, 25 Aug 2025 20:44:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16054) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2f-000LpK-0E
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:43:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=A0uqMnQzJ5zybMngTUCbCjTTX8T0NrC0mtPrflGfal4=; b=SfCXvjLYmShakwlu3x8OdTs4HX
 6p8e3PJ/IIbG2UmgQqDdND6+nlFD2j8cbS1FMwgytq3q+SVO5qc4Ug23p+hilec1hZs9qvF11VKIv
 DzlAxbGPbJ+9O9aaPKT4W2yK147LOpBAbzYHcmsov1Mpk2v1Z0u/d9fnu6aVsPSEAOcdM6Xh2KsoB
 w+qLyz4yGxCvbdC/ImqAMUmGc2SjPpPgBbhnZ6DQFgAT7Py8BSd+/NeUlYTHZPqv6yzl2KUCAxHCN
 cFrpJPdIW/hqC6bQvdU+psA5N4tawsatnIVp7umqQy100LPfkXw625XGvkVevFEC5nptDaDto8zIW
 yUzZmLPYuTZE+mTJfqO0eyi3jLQYaW5nlHqwg6OOLmRiTrdxrVr5ninbn2Uw5sMbb5MVy/kgQxaO8
 2nggLyoaOt/Fk+cESNNDxYSzpCEE4pZpw9l4cPh2FG5rsb7GzkRIIJLKaBKE8wT9dP6ovqnYWZgUe
 L/vqi9zXt+LiD9Ke6zFuABb3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2a-000jXo-2l; Mon, 25 Aug 2025 20:43:45 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 011/142] smb: smbdirect: introduce
 smbdirect_socket_parameters.{initiator_depth, responder_resources}
Date: Mon, 25 Aug 2025 22:39:32 +0200
Message-ID: <b24b81cf546b2498add2d3033d469dbcffb433ba.1756139607.git.metze@samba.org>
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

This will make it easier to specify these from the outside of the core
code later.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect.h b/fs/smb/common/smbdirect/smbdirect.h
index 17aa08dd6aba..c3274bbb3c02 100644
--- a/fs/smb/common/smbdirect/smbdirect.h
+++ b/fs/smb/common/smbdirect/smbdirect.h
@@ -27,6 +27,8 @@ struct smbdirect_socket_parameters {
 	__u32 resolve_route_timeout_msec;
 	__u32 rdma_connect_timeout_msec;
 	__u32 negotiate_timeout_msec;
+	__u8  initiator_depth;
+	__u8  responder_resources;
 	__u16 recv_credit_max;
 	__u16 send_credit_target;
 	__u32 max_send_size;
-- 
2.43.0


