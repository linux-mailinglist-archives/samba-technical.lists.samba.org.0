Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D312C86765
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:09:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=llXoHEudPzkUluI3KGa1VSbDxHrIcUI2FUX/ww+qN6U=; b=KazflSNgj4nn1vaYitzitIUrF4
	7tF6pl6kfEHL6E84HPv5UFpK23PMzvv7V7a4/frTL8bSv7/3W5k+Ez/JnTRm62t00gYqTfMTTOovO
	1wDjXO9EESKRcCUfxWvmuFWcv2csaWHwveYrt0oFutmw0Aw3C9z+H1Ha0Xz7N/soj7eWQfx/TuTCU
	X0DfYeJOk+k6q/60GCzMlfArVtcaSa6LlJnm1W3X7Eu9l5PoZAqCaQ1dcR0qQYFSRP3trfTtU1pLv
	IFkQXwQ1lcDy1lDYe00KUKMyhgO6Q4AlaNHoiuNxDdRtw2ZKbsX5H+g2n8LmpZhS4C2DqBMbDOlR1
	j86wYEVw==;
Received: from ip6-localhost ([::1]:56740 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxTT-00DALs-2Z; Tue, 25 Nov 2025 18:09:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29350) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMN-00D85E-HC
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:02:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=llXoHEudPzkUluI3KGa1VSbDxHrIcUI2FUX/ww+qN6U=; b=oP24vBs6XMvU/2uFzFqF5pLkTG
 Cv5ilo9nPT0QnyixG5TBv2IeywX/HxcmTCxUiEaVeDoUE0zdgScs9hov1QaNSL9AZAiz79xsxl6bO
 9+ab1vHm6lRI7N773HpheO53MG+11mJsVT0B+m8iSjjaL1981z9WnQjO8QkrdH0W9FZEcgC6FKR5l
 tSumGDB5Q3jpaXF86f3+FdlZMs74WEFDaRh5gy7oIKZHfyA3fiAUUtL1fln/Hnknj6jjay2IdHHj1
 n1MHbi7jcgJtY9bJ1vI4rnjpnWZ57o2UkylJ6MTuoyrZ4+iCHYCqmOIyVkv6FBQ+rXfp8dOfLkjRH
 YlO7+PipYu7fyCEAi1HkOZM6ux8vOYMyM6FkNyMBUhBax7akHQAlBrw1W56w6ilXva4+hwHo2teMX
 Wrfn4xnVOz4crk8pPFqJjYzGl/7tyDBySfOixylOYcaer0XUnvM2Dra0a+jLurTKfpZghqYcMQIDt
 pianR8RHONWitkgX6IBcnG5D;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxMK-00FdHy-0i; Tue, 25 Nov 2025 18:01:48 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 049/145] smb: smbdirect: introduce
 smbdirect_connection_wait_for_connected()
Date: Tue, 25 Nov 2025 18:54:55 +0100
Message-ID: <22017877c4e0af3df7af7bfae7a13659c1035cfa.1764091285.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1764091285.git.metze@samba.org>
References: <cover.1764091285.git.metze@samba.org>
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

This will be used by client and server in order to wait for
the connect/negotiation to finish in order to get a usable
connection.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 3576737ec199..22d6273649a7 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -719,6 +719,74 @@ static void smbdirect_connection_negotiate_rdma_resources(struct smbdirect_socke
 						peer_responder_resources);
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static int smbdirect_connection_wait_for_connected(struct smbdirect_socket *sc)
+{
+	const struct smbdirect_socket_parameters *sp = &sc->parameters;
+	union {
+		struct sockaddr sa;
+		struct sockaddr_storage ss;
+	} src_addr, dst_addr;
+	const struct sockaddr *src = NULL;
+	const struct sockaddr *dst = NULL;
+	char _devname[IB_DEVICE_NAME_MAX] = { 0, };
+	const char *devname = NULL;
+	int ret;
+
+	if (sc->rdma.cm_id) {
+		src_addr.ss = sc->rdma.cm_id->route.addr.src_addr;
+		if (src_addr.sa.sa_family != AF_UNSPEC)
+			src = &src_addr.sa;
+		dst_addr.ss = sc->rdma.cm_id->route.addr.dst_addr;
+		if (dst_addr.sa.sa_family != AF_UNSPEC)
+			dst = &dst_addr.sa;
+
+		if (sc->ib.dev) {
+			memcpy(_devname, sc->ib.dev->name, IB_DEVICE_NAME_MAX);
+			devname = _devname;
+		}
+	}
+
+	smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_INFO,
+		"waiting for connection: device: %.*s local: %pISpsfc remote: %pISpsfc\n",
+		IB_DEVICE_NAME_MAX, devname, src, dst);
+
+	ret = wait_event_interruptible_timeout(sc->status_wait,
+					       sc->status == SMBDIRECT_SOCKET_CONNECTED ||
+					       sc->first_error,
+					       msecs_to_jiffies(sp->negotiate_timeout_msec));
+	if (sc->rdma.cm_id) {
+		/*
+		 * Maybe src and dev are updated in the meantime.
+		 */
+		src_addr.ss = sc->rdma.cm_id->route.addr.src_addr;
+		if (src_addr.sa.sa_family != AF_UNSPEC)
+			src = &src_addr.sa;
+		dst_addr.ss = sc->rdma.cm_id->route.addr.dst_addr;
+		if (dst_addr.sa.sa_family != AF_UNSPEC)
+			dst = &dst_addr.sa;
+
+		if (sc->ib.dev) {
+			memcpy(_devname, sc->ib.dev->name, IB_DEVICE_NAME_MAX);
+			devname = _devname;
+		}
+	}
+	if (ret == 0)
+		ret = -ETIMEDOUT;
+	if (ret < 0)
+		smbdirect_socket_schedule_cleanup(sc, ret);
+	if (sc->first_error) {
+		ret = sc->first_error;
+		smbdirect_log_rdma_event(sc, SMBDIRECT_LOG_ERR,
+			"connection failed %1pe device: %.*s local: %pISpsfc remote: %pISpsfc\n",
+			SMBDIRECT_DEBUG_ERR_PTR(ret),
+			IB_DEVICE_NAME_MAX, devname, src, dst);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void smbdirect_connection_idle_timer_work(struct work_struct *work)
 {
 	struct smbdirect_socket *sc =
-- 
2.43.0


