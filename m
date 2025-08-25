Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C52C9B34D23
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:59:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=pEUIFp0iInJsZvYyg4vLNBlNOBm8Hg0Cav/wQt1CYPY=; b=MxgJ/E5LKLZ3Ft7Q092KBsozdM
	9sVu/+RKvuepmT2jN+hSzdtuVWjPze+mbxBHZYejdzFn2WNv7SSwCeBlZPsE4RgyIjTw3luKj6Fz3
	XXjtwWvVG/Rbdf8yVeTh1aUIowiNneMPaBFt6AAEAoRcXQiasQG7ib6AR9NPpnsJx8FGY0/laMxPe
	QQJKA2vYISWJDVdeeIjV6evVSrLWqZP/31AClMUJ00arYnrGdq5zPTBxrhNohkE7nmg3NFSEZtpkW
	EZhTCvTNiQ1y/GUVFaCHICBZuPnzvGlEqRgKbvcZKNKb6K6ZhVkYvYHQHC5D+RzKecbWPZCU9dz+d
	rV7KFWiw==;
Received: from ip6-localhost ([::1]:62364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeHs-000RzB-VP; Mon, 25 Aug 2025 20:59:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52598) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeEL-000QdD-TL
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:55:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=pEUIFp0iInJsZvYyg4vLNBlNOBm8Hg0Cav/wQt1CYPY=; b=DiZkphQmvI5W3pzG8mYnWPV0Pe
 mWKRNucalQw8zXzi1CZUjM6x1i8XF6viIKc6QsVHOVrDVYkw5oswPHyr5wdfxSyXzSsEN6T/eiX8Y
 j/XkcLraohQhZvcj35rCNjLW/QtNLFCTdTPT3s8PJ9WsJPVzk6ywjs+hqDsu1d3qCTxuzwcEnGT1k
 UWd8CZzV2QyEJwU7Zr6xFqdoJnsmIlOq7P2o2J4kiVVz7Z0MUtcf9tss5WoFrqnITI+OiNG5cDX3F
 U/K92lq8Nt2h2QNxwPXc4kHgZAdb5JyxEPNhFahUElCvrvt+LyG7f7u+7jbT1YVeSxyfUdlI4NZaE
 pRmLDuv1HU3I4TTBhYZTrFcN2wLzhPZKckBPGt3sVBqfJ0DUngRxd890jxCyo9dkxv19W91NqjCmb
 UPrRq3ub9khSgOXEaXjaTmxq6HY5Jr5brnvlEXeToBIiMP+xarpJYhw0MvgwDWoVNCRiPyLpM7uYf
 W4jqhj7aJApJOz5NbzCcaOA9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeEJ-000lz9-11; Mon, 25 Aug 2025 20:55:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 084/142] smb: server: make use of SMBDIRECT_RECV_IO_MAX_SGE
Date: Mon, 25 Aug 2025 22:40:45 +0200
Message-ID: <ab548063c39fb74c56f5aa0e7bb7474f17fc340e.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Acked-by: Namjae Jeon <linkinjeon@kernel.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d8274bd9a020..c56cbd6ab0af 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -37,7 +37,6 @@
 #define SMB_DIRECT_NEGOTIATE_TIMEOUT		120
 
 #define SMB_DIRECT_MAX_SEND_SGES		6
-#define SMB_DIRECT_MAX_RECV_SGES		1
 
 /*
  * Default maximum number of RDMA read/write outstanding on this connection
@@ -1767,7 +1766,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
 		return -EINVAL;
 	}
 
-	if (device->attrs.max_recv_sge < SMB_DIRECT_MAX_RECV_SGES) {
+	if (device->attrs.max_recv_sge < SMBDIRECT_RECV_IO_MAX_SGE) {
 		pr_err("warning: device max_recv_sge = %d too small\n",
 		       device->attrs.max_recv_sge);
 		return -EINVAL;
@@ -1791,7 +1790,7 @@ static int smb_direct_init_params(struct smb_direct_transport *t,
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


