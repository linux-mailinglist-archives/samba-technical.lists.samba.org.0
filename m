Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7045EB34C5B
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/GhBLN6rvUZjZvfHUt9t0jcr1gWU/Gqldr952pTS4Fo=; b=EPCBFhq7bOzwsaqVu4FVB/ON1Z
	W/VV9v5EA+CuFx3aAOCAH9CVapx3OGSGGAM/Kehh2JRfafjBhkKDW2437dpKM1VNc+BlJ100uyEM8
	12NAD3YHqhKgO5TsgmP5/okCchWkCKxAGi3UheFufbGIXdzyepW1009XVd1yyD6alH1IC0X6FpULD
	QNZs3AJXCeTGMid0ZijHMCUh8ENgQAfPHGR/OvhIti2gfnRTVRMt4gEXBFpwh2L8EH9P53hx2lCpo
	Nwezi18opgB8RaKmvR14Gw66nc9knG0d0P2QeIlZJDtc/6y9grpPXRcxs5OcFBQvBopikuPkWibqx
	fencrOPQ==;
Received: from ip6-localhost ([::1]:37104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe3D-000LzR-CP; Mon, 25 Aug 2025 20:44:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21320) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2V-000Lln-HK
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:43:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/GhBLN6rvUZjZvfHUt9t0jcr1gWU/Gqldr952pTS4Fo=; b=CjHxvaIHV4n7HrvTqGfZJCvNJB
 U/ZXF40ckDs/QbKshc6uURX5noi3A0Ld1KlHzHU2jZD/AphxLKZgWhY54S0NYonxD8uD8RGW0wqla
 kHLB5wzj0sB6RcMVZZSBhseLbWLom8XPZVdGO6EaQqMh0gZUI8483RlD06oJtAXBiSoDwPnlGFbf7
 WMMwXij5fr169/fSP3bDAO8uQ9xECZKr62e2ILBUbLZExA6ui4Ive0mKATTigQngcyZIwS1TyeAh8
 PNftZ3hZb5E0bMPhS79F5XKOuc+C5gMBpnLl+Ud2dbiJUd4+j8gRjaFDCantITZ+0UGfUmOV7xsmg
 l3xSfLeUlWgobLHpGEUAubDXm23S75Q2MSyaOnR8dTlMYjw3WZEPzKW4LdfLDR7vN+cVvtRF+aqay
 q/0aJWCCsVRj80HSgA7/1ZhFk7c0pYvHP7hR79AtalQ/tyeZ5NccYp18E1djSyua5ms9bIknIC1n5
 HKnsk/anlpE+cEu7jWKM8tUM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2S-000jVx-1b; Mon, 25 Aug 2025 20:43:36 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 010/142] smb: smbdirect: introduce
 smbdirect_socket_parameters.{resolve_{addr, route}, rdma_connect,
 negotiate}_timeout_msec
Date: Mon, 25 Aug 2025 22:39:31 +0200
Message-ID: <ff34cb7c0f5c52fd13eed7d126e2292bcbc03c5c.1756139607.git.metze@samba.org>
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

These will be used instead of hardcoded values in client and server.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect.h b/fs/smb/common/smbdirect/smbdirect.h
index b9a385344ff3..17aa08dd6aba 100644
--- a/fs/smb/common/smbdirect/smbdirect.h
+++ b/fs/smb/common/smbdirect/smbdirect.h
@@ -23,6 +23,10 @@ struct smbdirect_buffer_descriptor_v1 {
  * Some values are important for the upper layer.
  */
 struct smbdirect_socket_parameters {
+	__u32 resolve_addr_timeout_msec;
+	__u32 resolve_route_timeout_msec;
+	__u32 rdma_connect_timeout_msec;
+	__u32 negotiate_timeout_msec;
 	__u16 recv_credit_max;
 	__u16 send_credit_target;
 	__u32 max_send_size;
-- 
2.43.0


