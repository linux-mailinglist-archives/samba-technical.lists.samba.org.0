Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 40719B1CB0A
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:37:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UfzmhPhhjoSMyij4Eq8vv0QdU6nxViE8ga8RFg9nzd4=; b=Jlr5yzymbqHTKtRos/WxCivF41
	F+80Guu6+apxCqZ+55Qtd0qr8erao9yxCNU/qiqJhaDT3/tYezKXY+xVA6DOS7NVO9n5I1WEREjSH
	oeIt90CqqBWWJqamhrYcflmXXO1Inz3Roh6YWT2C/DXK/IPOIiYIeYoUadY+IimbkhoeT+YKfISrb
	F2BDgiLokmxMdIZ9Jto/CykNW4IBklH/jYlBhmhjX+QQRbmx1J7+9AvRXZa2d4TpbTPGS8e/xcF9s
	GD/5CJxDROAt8+7wLODyWvs0TtiOU1+p1FQWmvkQVMsibJkHpztGFpngNwYL8j7uS8BZBtYnPUoXr
	e+Ms/IHQ==;
Received: from ip6-localhost ([::1]:43144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji4a-00ERQG-4V; Wed, 06 Aug 2025 17:37:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10296) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji45-00EROr-JF
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=UfzmhPhhjoSMyij4Eq8vv0QdU6nxViE8ga8RFg9nzd4=; b=sJddu1gLIHsCoyGVK4Uj8XdSVN
 20OV5H4w/2UXwSMhfbnbMB+Ck3CHwODD15iiUdc5KAhNFfrovnOolkuchuICCColsba4o9s4X61Nd
 didgeT74iEd6TK6L+g5ls6UARQpHaaRiHvbX1SgrXZ5uP5EPnJPh6nodmqiCIsqUumoc6NWoHg7pQ
 6DT3zmjWr/HIdIy1Q9dfz6IUkpeOKhLR/+pKYZlq7wlTvewToRMdU6AFicvQSD7w4ZhTGORonI5oJ
 BaqWp/M4Fyge4zF7eDTHLuXosROzVzzP33w/xiJj6a+AWCEk/WMeV/QmX2EyLdFFcTFOM5fKOc5fQ
 Baj5cGVPVkym2qa5cI7w33O1ZTw099yDRp/T1RibDg9fabB2IJoV+x6iui3DeNySOFEJETLK/feSZ
 DVULpVWrx4n9r56aDz8hn3awjYzWarbm/tfwZ3clevJUEvh925n1KTK6Diz4TTS4I1CVNY2rJhSb/
 ZFCDaAIRCs/jWpc0qgIhfRjB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji44-001OXT-2Y; Wed, 06 Aug 2025 17:36:36 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 03/18] smb: client: make use of SMBDIRECT_RECV_IO_MAX_SGE
Date: Wed,  6 Aug 2025 19:35:49 +0200
Message-ID: <8373b8b0d69e7256b5d34cf7c1451e0dc54dfae6.1754501401.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 4 ++--
 fs/smb/client/smbdirect.h | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 5217a8122a94..5d1fa83583f6 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1563,7 +1563,7 @@ static struct smbd_connection *_smbd_get_connection(
 	sp->keepalive_interval_msec = smbd_keep_alive_interval * 1000;
 
 	if (sc->ib.dev->attrs.max_send_sge < SMBDIRECT_MAX_SEND_SGE ||
-	    sc->ib.dev->attrs.max_recv_sge < SMBDIRECT_MAX_RECV_SGE) {
+	    sc->ib.dev->attrs.max_recv_sge < SMBDIRECT_RECV_IO_MAX_SGE) {
 		log_rdma_event(ERR,
 			"device %.*s max_send_sge/max_recv_sge = %d/%d too small\n",
 			IB_DEVICE_NAME_MAX,
@@ -1595,7 +1595,7 @@ static struct smbd_connection *_smbd_get_connection(
 	qp_attr.cap.max_send_wr = sp->send_credit_target;
 	qp_attr.cap.max_recv_wr = sp->recv_credit_max;
 	qp_attr.cap.max_send_sge = SMBDIRECT_MAX_SEND_SGE;
-	qp_attr.cap.max_recv_sge = SMBDIRECT_MAX_RECV_SGE;
+	qp_attr.cap.max_recv_sge = SMBDIRECT_RECV_IO_MAX_SGE;
 	qp_attr.cap.max_inline_data = 0;
 	qp_attr.sq_sig_type = IB_SIGNAL_REQ_WR;
 	qp_attr.qp_type = IB_QPT_RC;
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 0463fde1bf26..81b55c0de552 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -139,9 +139,6 @@ struct smbd_request {
 	u8 packet[];
 };
 
-/* Maximum number of SGEs used by smbdirect.c in any receive work request */
-#define SMBDIRECT_MAX_RECV_SGE	1
-
 /* Create a SMBDirect session */
 struct smbd_connection *smbd_get_connection(
 	struct TCP_Server_Info *server, struct sockaddr *dstaddr);
-- 
2.43.0


