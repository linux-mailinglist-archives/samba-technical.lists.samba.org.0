Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7001AC1ABC0
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:34:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WNVoZ11kryC1OlFDyxOooBhkkCBKEAJd45gIaf8iGZM=; b=ys3sJId3Ijf6Uo8+pvA0tyOOVF
	fV0J6MfLWxHc+IThcyxFePXjylgeh80HJY/TMFk66Tmo8UkocM4u2HIbJtD03PtYE/WmLqTh7z0NH
	U5HRK3j3eKah2nxIekwTAb96HMrs8t3lS5EWenKQQGrBLsY4ov3mYYBeLWV7YIffsWkCxMGYsnbuq
	tRO4ZhLDwQfiIvm5PcfUUixeUBZv+Vxvnhn74OpUNUeebiY9+bZhyPJ3B11RIJc8xzZus2SSu2ngu
	r8h8TzkdyaKXTzUi7zjFMQLcpfA9+vTND9mFpC9OYQvIcz7wGXfEwyHzNjVvBrxtC/8pbT7/S9NEz
	juPbVm5Q==;
Received: from ip6-localhost ([::1]:23288 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6Jz-0098ub-TS; Wed, 29 Oct 2025 13:34:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50422) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Cf-0096XQ-LR
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WNVoZ11kryC1OlFDyxOooBhkkCBKEAJd45gIaf8iGZM=; b=W8/aTlQbHhLtphYaJ9ExmVojaI
 c6oxVJ++6NntTuFf/p+OHa2LGriNo8E62zXOlaWJeJ5w/D1veIzFKN3D/RjopKn9uPw20l7pYzV/i
 jGWU60MkMP3FLFtJj3escCnsjLNNlUpaIk1ZkC4mUSO5FR0ep0tod93nImbRsg7knX29pFrE+f0Xh
 HaWci7Vch27HL27dhpbA6PwLMulJn5HwNY12SWOsURKaJUcEqxrr7veVIFnmiv5KFcGAXARTKJaqw
 nyzl4LrAULkh/7kTAdlAn4XgE7qq/6FtkWqxNZghhvLcp2crbO9ioWiQNlVEIuxs5bDWOxn0p/9qX
 AB5sRjacIvM9jxCaG0giolj/DlZMp6WHSuNu3d1HxaqcU0L+i8t9dYobDWBdxirYIuyqMrsD00/63
 ugDl5rF8Of64V/ujAd+V9Q6EVIAQZc6KX6kRZWyinnfqFV3MlqDM0rzX8L1JUwYYOawXSTZm1i10j
 w1plNlXWpV7wSGwgHdwrenSq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Cc-00Bbse-2v; Wed, 29 Oct 2025 13:27:03 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 046/127] smb: smbdirect: introduce
 smbdirect_connection_wait_for_connected()
Date: Wed, 29 Oct 2025 14:20:24 +0100
Message-ID: <f399ee6b6a41ab4983c5ea5b6721174b4cb91565.1761742839.git.metze@samba.org>
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
---
 .../common/smbdirect/smbdirect_connection.c   | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index daab8b5eba49..858b071ba1bb 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -900,6 +900,74 @@ static void smbdirect_connection_disconnect_work(struct work_struct *work)
 	smbdirect_connection_wake_up_all(sc);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static int smbdirect_connection_wait_for_connected(struct smbdirect_socket *sc)
+{
+	struct smbdirect_socket_parameters *sp = &sc->parameters;
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
+		smbdirect_connection_schedule_disconnect(sc, ret);
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
 static void smbdirect_connection_destroy(struct smbdirect_socket *sc)
 {
 	struct smbdirect_recv_io *recv_io;
-- 
2.43.0


