Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C98C1AACC
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:28:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=e32+HEKZsRvIZhe8SJt6PWjWzu0O/6ukW3cbEH/tlGc=; b=ZTTiEjCeWG5CVUAKywebSvdsBv
	26zvm65IC/koRKfZ9dF/AhVoadvE42sel5DDdoNyy+0eYLmp2RMB7YQuOtKJIav7ZsY37H8TG2HGM
	Twbx9t+6cBunQ5zQYMP4CY9Ky/VscntT7I2fzu5IJ1jaUaLzhhZ18PCU5GgQre8fr7Y9AoCz7fUz1
	p2SQ3jjNIKl05wemXY6XZxViNFRo0caBf1JipQzQJ9nol+xeN4MmoArVPfFy62V4JfIaEs22q6D9u
	A48mb57RmFEV4dCf77DwkiTMvBxCi31dJ4ACx03dYSPa0tiDElsTcXdaguvOD3hSRnYJ0XCfnIT67
	EWOD9FoA==;
Received: from ip6-localhost ([::1]:33680 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6EA-0096z9-5a; Wed, 29 Oct 2025 13:28:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36788) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6AU-0095r5-D6
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=e32+HEKZsRvIZhe8SJt6PWjWzu0O/6ukW3cbEH/tlGc=; b=gYLi09CSizA1UK7puNO46Q8DpG
 zYlK027IE66R6MWGVvalHhE+B/vtM4lhUyb+jvJ2ENfftnKnoRAQQPJOq2gt80vRHppNa0X2+fkj2
 5G5GXYJsITC/6veNJhemrr3EPNh5Svz2snZ93O4uantTlxXyXD2PGDawlHLggozpivw4g9sqCGp05
 deolZkpc0ZSe7bEuS2FueSJTgy4Ykgr8KNXnuw1gSg+ZFHIxdJfGGecjBuNi8dVGnC/TUqxuz3/LI
 7uglx06DOLYphqGH1wxn0ycmZ4mvNtGEgXgluvRHgNhUKCSmJtRUadj1LhGerOC3MX91Zp9s5aEvT
 eLVr3+eDifPcSp42INZ2DjNULG3o3j4QyR64Vw7B6EBVb/u62brUuKdvfil4Iaz5ZXwCl87+tmjD6
 Jr4FLZGiTQR1yEfpJPIwqV1v6IUaE9eN8TKFXBGcFv+bXm+mGw1Cx+i1bisrS53zYp7TXuUUQ4xwh
 WH35SVLFGVuErz4QI5j4+IpZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6AR-00BbYJ-1J; Wed, 29 Oct 2025 13:24:47 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 023/127] smb: smbdirect: introduce
 smbdirect_connection_qp_event_handler()
Date: Wed, 29 Oct 2025 14:20:01 +0100
Message-ID: <0379d74442c68fbdb99fdd1d4f05cf01a77bf16c.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is basically a copy of smbd_qp_async_error_upcall()
in the client and smb_direct_qpair_handler() in the server.
They will be replaced by the new common function soon,
which will allow more code to be moved as well.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 1113a7e9d575..5afb27f790a5 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -101,6 +101,31 @@ static void smbdirect_connection_wake_up_all(struct smbdirect_socket *sc)
 	wake_up_all(&sc->mr_io.cleanup.wait_queue);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_connection_qp_event_handler(struct ib_event *event, void *context)
+{
+	struct smbdirect_socket *sc = context;
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+		"%s on device %.*s socket %p (cm_id=%p) status %s first_error %1pe\n",
+		ib_event_msg(event->event),
+		IB_DEVICE_NAME_MAX,
+		event->device->name,
+		sc, sc->rdma.cm_id,
+		smbdirect_socket_status_string(sc->status),
+		SMBDIRECT_DEBUG_ERR_PTR(sc->first_error));
+
+	switch (event->event) {
+	case IB_EVENT_CQ_ERR:
+	case IB_EVENT_QP_FATAL:
+		smbdirect_connection_schedule_disconnect(sc, -ECONNABORTED);
+		break;
+
+	default:
+		break;
+	}
+}
+
 static void smbdirect_connection_destroy_mem_pools(struct smbdirect_socket *sc);
 
 __maybe_unused /* this is temporary while this file is included in orders */
@@ -331,7 +356,6 @@ smbdirect_connection_reassembly_first_recv_io(struct smbdirect_socket *sc)
 	return msg;
 }
 
-__maybe_unused /* this is temporary while this file is included in orders */
 static void smbdirect_connection_schedule_disconnect(struct smbdirect_socket *sc,
 						     int error)
 {
-- 
2.43.0


