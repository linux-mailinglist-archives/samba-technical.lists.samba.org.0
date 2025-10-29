Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 879ADC1AA54
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:24:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=fvAVhMdelIY9T7TRI4LhOyzPl3HJn4mqaGgqZPl2kus=; b=yVDErBSFOxkdnjxIMBRTj9i06z
	BLCVQ8Fkq5TI5F6zsM7c3ShtwdBAnC/SAVLnSglQberBvEzaIbmJ3NdSShhPInY5fgT4Nk9ebfDJP
	D9U/bOMqwBlVHiNwuGEOlLaRRO1uBYHFqqxTmDlBV3V3/Yxo+TrF7mPeqV6JPZ0n6Y+mXvO0OaT+g
	2z+A40M6VyuZF7AFagCPZMAGwEtKnnsxCwROvsv+nCuEGFIoJrefPKWEnVtIPD2t9Xj8t9gllQRlQ
	eNjz8u/wtA0j3PVQcszHQbWGMfHkZjJYbDlkaK3nceSia0r2E6PuKbFOGWhrrxh/LsZStYKWPnocz
	j3ByMLcQ==;
Received: from ip6-localhost ([::1]:28582 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6AP-0095kH-VG; Wed, 29 Oct 2025 13:24:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:65530) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69C-0095Qx-Jm
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=fvAVhMdelIY9T7TRI4LhOyzPl3HJn4mqaGgqZPl2kus=; b=GxGsG+TMWr+vz0HwzumHJziE1Y
 jmIh88rt9+cZWvEFha6Z7RzJY+CqJJ2eXtDicy1zYZIz1FpgcFwXByMcnTZcXa7YyT1IIze4bn5tQ
 MK/sVVwfsESirJfJNhR/rlpAep6dpmag/sIl73rZlI2oo23ypLsfDAQz3wEzCqurYZXwfxRprUnAn
 2dZ7VfztCjYVWSETBpQppcdQ5s+JY/zBD9jWOCVe/7IsaLMrYuqXgcTcVPO3DtSVFUqB15O2tXj6v
 JRnFF/4cx5e/d0rRmMs5Bx2SVQOFrXcJkr9hy4/Wedy5RGLYpYXwa/EJKNtj8kCJ1KOJYvqRjcUHK
 fy21/gIPvACw/1LoKb5rUdO4aSFh0qne+id/WdYZf/XmyEBxFcOcVL4M/0xy6pb40pD5ouJMPmj+r
 pC1LtHazSrTLSuqFo3YD0g3l99sQ0e17eLBYB5bk39pWiO0XuteGh9wzquEVrfEd1AicqhlT5oZBZ
 N1ZG8dxppk9ZpAa9SpMhUNKY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE698-00BbIE-0x; Wed, 29 Oct 2025 13:23:26 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 009/127] smb: smbdirect: introduce
 smbdirect_socket_set_logging()
Date: Wed, 29 Oct 2025 14:19:47 +0100
Message-ID: <8d0f8874c14d3775a407726e951f40ea4ebd7515.1761742839.git.metze@samba.org>
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

This will be used by client and server in order to setup
their own logging functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 .../common/smbdirect/smbdirect_connection.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index ca6508705be8..f7fc4b1732c4 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -24,3 +24,23 @@ static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
 	 */
 	sc->workqueue = workqueue;
 }
+
+__maybe_unused /* this is temporary while this file is included in orders */
+static void smbdirect_socket_set_logging(struct smbdirect_socket *sc,
+					 void *private_ptr,
+					 bool (*needed)(struct smbdirect_socket *sc,
+							void *private_ptr,
+							unsigned int lvl,
+							unsigned int cls),
+					 void (*vaprintf)(struct smbdirect_socket *sc,
+							  const char *func,
+							  unsigned int line,
+							  void *private_ptr,
+							  unsigned int lvl,
+							  unsigned int cls,
+							  struct va_format *vaf))
+{
+	sc->logging.private_ptr = private_ptr;
+	sc->logging.needed = needed;
+	sc->logging.vaprintf = vaprintf;
+}
-- 
2.43.0


