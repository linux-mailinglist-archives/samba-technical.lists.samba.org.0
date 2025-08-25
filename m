Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD68B34C65
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=D245HkVB6YKsiXq7EM6IE/uFcsoP0ia5JlprlPOigmI=; b=nnkfdKdAlU58TQbtxR7WI7XX1H
	U2/+lD7JXt0Z5YBmlrtpdkhaKFOs8hfi6fm4DAeHU3grCapNIcIqFu8t0ubt1HCLdFu7TxFxiZplP
	oEym3T/wh3v3rWLinmCUyh92vUQjVDWISAJWRtKHWuzOQBpOFkZDQk738I7fzw0pP4xc2C7MaA0Q2
	EiLrRLqBIM/CWL6g6le7pQWZ3DdYzZBkvQ7608fsrtNaxLgeiEZ55lTo3JATECCh3awGxZS0SvuWA
	NgstgEXBwsQ2BdFnd8pcl1Gv+C+XBbEuX+jA0lD36brua+z4tzhPq7pBE2doo4/OhijvAbMpsP8A0
	/aB+CcMw==;
Received: from ip6-localhost ([::1]:30898 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe40-000MIz-9A; Mon, 25 Aug 2025 20:45:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45716) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe3A-000M3T-LI
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:44:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=D245HkVB6YKsiXq7EM6IE/uFcsoP0ia5JlprlPOigmI=; b=PMM0GtAofowaRpZCUz3UWgjH9B
 R97F06fSCjhYTtnUwck0HmDLUS2NBO107Jij+cmqbmmq78QbnG8Q0jVVmbVjotRAaPrZAk1zuWcej
 5bRmwJH2K2mUR5/MXjmvSq3h4GKoXI5zkwj4kylnK6ulbyTwdYr984tY2Uu4tMDO91wpFIdW+djH/
 NdyuCq3Z3IIFo9O85ajJU3trC1d9LjgZBkfEdqvehqslxwtH2X7ulGuki+lOQnUIU4RzYZZGOsk5z
 UUnC2vgbLzWuqtigunXK8f60ajmgyKSShjqx6PWzhuCmA7McAEZIQDPp33ktum+fV1/gKA6bFKIZS
 m9msz4sJ7hfB6Q88iLGbeKy2/h64oxjGBMV3JsgmJYqfheqBaaaX8NjuI/cMILqx4kisz9fA46mBq
 kohfm7ZegTkVcYCT+BZK3xlplUfnMk2CFpqLeafF3VxiO8+NOAlPGR6m8MRHKdPIZSz+0RM3qKDIz
 sYxX1DD5kPS1XGWqrkqvg0ws;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe2w-000jbq-1F; Mon, 25 Aug 2025 20:44:06 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 013/142] smb: smbdirect: introduce
 smbdirect_socket.idle.{keepalive, immediate_work, timer_work}
Date: Mon, 25 Aug 2025 22:39:34 +0200
Message-ID: <a0bf68cc3a37e128fe4d98f0fae19fc2fbff1f2f.1756139607.git.metze@samba.org>
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

This will allow client and server to use the common structures in order
to share common functions later.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 11f43a501c33..fade09dfc63d 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -18,6 +18,12 @@ enum smbdirect_socket_status {
 	SMBDIRECT_SOCKET_DESTROYED
 };
 
+enum smbdirect_keepalive_status {
+	SMBDIRECT_KEEPALIVE_NONE,
+	SMBDIRECT_KEEPALIVE_PENDING,
+	SMBDIRECT_KEEPALIVE_SENT
+};
+
 struct smbdirect_socket {
 	enum smbdirect_socket_status status;
 	wait_queue_head_t status_wait;
@@ -48,6 +54,15 @@ struct smbdirect_socket {
 
 	struct smbdirect_socket_parameters parameters;
 
+	/*
+	 * The state for keepalive and timeout handling
+	 */
+	struct {
+		enum smbdirect_keepalive_status keepalive;
+		struct work_struct immediate_work;
+		struct delayed_work timer_work;
+	} idle;
+
 	/*
 	 * The state for posted send buffers
 	 */
-- 
2.43.0


