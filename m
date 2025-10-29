Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A1C1AD82
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:42:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vLkbr5VcMkb0ltbdDMO/cI6tvAWpoiD+KbE3jF+z8/o=; b=vRuOk5sBK4KyfH8a626OAHLFXY
	Jvq+iFm5qTv0GOIWiMhVFYlo0x73uJcyha4IvyWSJrC20TQmu7o4aPECOVPAo3vFOtAyHFiGR+Y4A
	6Sq99YItIt3+lSIoYAXNg/QRpfLhVr0vVXlFCBI5JvmsyfipLJHmBfZ/y5PWei2cyUQyL23SfmKUY
	ghdBNLUutH5Yh7R6ca4MN3RbSSolAYWSnqvOByEZcLu6dPdBWcsPOM3tvlE2yuwrbIpTMzxnxI6m5
	oJj4ItFAJ71HMbAwl+tM4lCbKIYUHPP8pVig4NLp3/ztqIgIJU7zkEVEQWbUuu4yn8PwIp2nffkz5
	kPfKSqKg==;
Received: from ip6-localhost ([::1]:38046 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Ru-009Bnr-DI; Wed, 29 Oct 2025 13:42:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44534) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6GB-0097gT-RS
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vLkbr5VcMkb0ltbdDMO/cI6tvAWpoiD+KbE3jF+z8/o=; b=sinxfE14RV0z+z7kj3JKpRK275
 iKtlBCnxzV6OTv99ddrvfVWHHw6NIFV8Hzov3WMKUnjDbyJNRHwjhPHJvS8IySWdB8Yf4+8jTtzOB
 5y+gWZfZ7DYgddiLcU2hSMbdS0AIXnesAgD+XLGK7pRoNV0GaWH75WRoCz9VpEHWn2VrVrp8BqPSo
 2U2lz1viCyGZ/J3wy6T8/uBKiWxcTNNbS+Xt4x2mNmkhvIhJU8K6hyVxrORb2TI0m9PftRjrCWqu+
 TCijk9AiH7Ybdea+4imHIYT5n0/QAFJNNdYE0+jeg1pGKHC8AbK+6LEMkEFm9uCatR3uBSnblf1HF
 oZ0RYvglavczL+8WjzdT9+luA8Bf/1UWTxS4IXHeSHu4OokNrhxSihidQzYSmlcb+qkOOrK6rjSkl
 eK/1IXaFcGhtFJcICKo8m6faTkHiEta/xDIIpOKBbw0bGP5V9s31JV3oZW9CqosIxS6ynxhKttSyh
 zjx6U/lBh08EzUQk9MUag+NW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6G6-00BcQ2-2b; Wed, 29 Oct 2025 13:30:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 082/127] smb: client: change smbd_post_send_empty() to void
 return
Date: Wed, 29 Oct 2025 14:21:00 +0100
Message-ID: <203777eac2f4d21a916399701987c9af42542704.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

The caller doesn't check, so we better call
smbdirect_connection_schedule_disconnect() to handle the error.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index ef2f957d0e86..b94fa3bec5c5 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -23,8 +23,6 @@ const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connec
 	return &sc->parameters;
 }
 
-static int smbd_post_send_empty(struct smbdirect_socket *sc);
-
 /* Port numbers for SMBD transport */
 #define SMB_PORT	445
 #define SMBD_PORT	5445
@@ -929,12 +927,17 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
  * Empty message is used to extend credits to peer to for keep live
  * while there is no upper layer payload to send at the time
  */
-static int smbd_post_send_empty(struct smbdirect_socket *sc)
+static void smbd_post_send_empty(struct smbdirect_socket *sc)
 {
 	int remaining_data_length = 0;
+	int ret;
 
 	sc->statistics.send_empty++;
-	return smbd_post_send_iter(sc, NULL, &remaining_data_length);
+	ret = smbd_post_send_iter(sc, NULL, &remaining_data_length);
+	if (ret < 0) {
+		log_rdma_send(ERR, "smbd_post_send_iter failed ret=%d\n", ret);
+		smbdirect_connection_schedule_disconnect(sc, ret);
+	}
 }
 
 static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
-- 
2.43.0


