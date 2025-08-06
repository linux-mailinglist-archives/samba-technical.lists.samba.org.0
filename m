Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1387AB1CB28
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=iXFRi7wVrvMW8VUnpsw5QdAheVGtnYQOLm8V16dTE2g=; b=ssp0/Mt6VQal1hVjIsYrYFUc1g
	Xs71QKqsdUIbdLHZ3Dmz4Fy7ZiCN8DImwZKP4ioaEDtLD0+AhGB5i2jwvd4HoOp5XeWJvakxP4iTN
	2LJLuH1q29Bq39LzhdCByDmzoG2qk7Eb5w3ABZdgT3SfaKD0BfvIRP7ErYVPAhaIXkHYniD61NaTO
	ujB1+TIE8JiUrhLp7LpnM4r4AXvIhjg8Ga5DIgxWUWp5q5wcVJrz1LSzAzYU89eo72ZhvtcYBQpMp
	19AGAff9GU5JrF7ur+cIue3IS2A5zPv2wgFNWnmHLpKczp4TQw/eWmAFb+HuriqEPIOQBfu9Bx6/C
	Os/hUj9Q==;
Received: from ip6-localhost ([::1]:36576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji6x-00ESWP-AX; Wed, 06 Aug 2025 17:39:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32946) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji5e-00ES3I-Fe
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:38:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=iXFRi7wVrvMW8VUnpsw5QdAheVGtnYQOLm8V16dTE2g=; b=U9f9N0lavj8CU4lfTJA4E9s8Nu
 Zl26oRoh9Jc7gulSxNbu/DiOBJ3pTYXM+QRTN5t1ZMp0pK/xxHRbq9lMmyZO9daFcRs/1Kmnc6Qtb
 Zb85Fb/Y9OjLJ4IuL6HRJwwdNMsYRXeYVXHaJ7KNK4lRrHroRoTTcv1rRE016vzt/HwNfGH3UcjU9
 +iDivshHEowxTPtYMO05imMHVAuRp6g3Y87BoqFBY0FoivtvrfMgrpNuAzrLahPcpg1zIbdMKsZuN
 GJKuUFMBz2iSEyPkmGv+DE4imqcVG6G2EuwPvSvblX4z2I9Q0/cLqFS3R0knFy8lLvRBmdc9FAZ/0
 KzzPEzyKcp1AOGTARxYo7y1aUDRsoQY40xTgkrjp/NFERgXxsebDEQ1o3x1sFL11NyrGisKsIfhfD
 oDAIIIAivj8QP8nG+T+npkSCz07tLG5VD/dwx7Jjq0YmK4AMSAZ8gShvnC3qHIR4CBQXTQoN2IMxP
 YQakRCFElHs6I4xDm3HZxWwz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji5a-001Oqr-2s; Wed, 06 Aug 2025 17:38:11 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 16/18] smb: server: make use of SMBDIRECT_RECV_IO_MAX_SGE
Date: Wed,  6 Aug 2025 19:36:02 +0200
Message-ID: <c647f5c932f46877eed52f023302486866dae6cf.1754501401.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754501401.git.metze@samba.org>
References: <cover.1754501401.git.metze@samba.org>
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

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 7fcd80c329d7..8021225df200 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -37,7 +37,6 @@
 #define SMB_DIRECT_NEGOTIATE_TIMEOUT		120
 
 #define SMB_DIRECT_MAX_SEND_SGES		6
-#define SMB_DIRECT_MAX_RECV_SGES		1
 
 /*
  * Default maximum number of RDMA read/write outstanding on this connection
@@ -1760,7 +1759,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 		return -EINVAL;
 	}
 
-	if (device->attrs.max_recv_sge < SMB_DIRECT_MAX_RECV_SGES) {
+	if (device->attrs.max_recv_sge < SMBDIRECT_RECV_IO_MAX_SGE) {
 		pr_err("warning: device max_recv_sge = %d too small\n",
 		       device->attrs.max_recv_sge);
 		return -EINVAL;
@@ -1784,7 +1783,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 	cap->max_send_wr = max_send_wrs;
 	cap->max_recv_wr = sp->recv_credit_max;
 	cap->max_send_sge = max_sge_per_wr;
-	cap->max_recv_sge = SMB_DIRECT_MAX_RECV_SGES;
+	cap->max_recv_sge = SMBDIRECT_RECV_IO_MAX_SGE;
 	cap->max_inline_data = 0;
 	cap->max_rdma_ctxs = t->max_rw_credits;
 	return 0;
-- 
2.43.0


