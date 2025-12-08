Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 266C1CADA65
	for <lists+samba-technical@lfdr.de>; Mon, 08 Dec 2025 16:50:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=CiKrVI85vD3bbzXcBhDbKFazTe0ABFjTGTTal9tlVOY=; b=hH5INJHO5D67Lrd8mtU/BIYK0/
	Yv6ISdQx1+MW5iSZBDb3eytWqXet2i/ftzJ7fMoaPy3vidM5uoTo8dhgRkNc076qUgKyqlrEDqX9c
	M9VXVRIR+fTpD3Y88zyHZaiZ4biJ/uhxXM5XTKaNt30Q/QMke4qL7HChkHtC6wlD7dQgAKw7kiBOi
	bTdtf8AkRe2GT1SVHUJgWSnwXA1FGnuUAKURHrRisv9j2tts9MsdCOElroavAhJjO314mL6Fsf3Nc
	n1ZpXf/FqjffL0jI7gb3Z3YnXCzy6UthlTZvMHtXl+zr2w0KvzjmyVL/260DlchctsfOf1fFEkJvy
	LzFpCjYg==;
Received: from ip6-localhost ([::1]:28190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vSdUS-00FtcD-5s; Mon, 08 Dec 2025 15:49:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34116) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vSdUN-00Ftc6-1d
 for samba-technical@lists.samba.org; Mon, 08 Dec 2025 15:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=CiKrVI85vD3bbzXcBhDbKFazTe0ABFjTGTTal9tlVOY=; b=IMQgl7hKwD6HCTpMYBDwu+KKlQ
 jchSddw9z5IgIpRHGKOHcRkqD3NymoZfuZs3u+CAzVCKDiZLUxlk+6RECScEhK+7D55qp8opVGoIp
 MlvlZq2khacm4An+PjHWgW/DScwTmi7KfFiUuLUlURjcRfNDqoaEJ2IyPhU+JwPIEWtyw5nfSsh7a
 68frh69d7NkPvzY0MYGmnvDmT7U2ntwF6JNgut7ey5ogF4MrEnyc5JyWkjSPY2Mt/yKxLb+mKvGwf
 4b9CgF9qcYzPx7+xXmzSDibOy0YgnMuvhmWGBp1P8KbzQ28Dzs5gGwtZt1QEl8B4lD3cm0sUWjRYq
 rPty2b970THA2alk3ej3HE6W5xSxdk9U1HY0ZHws5x/y191kJi+vz6e4myCOe9cnQ7qKy14EP5YFU
 OZsxdM5UUMWLECvZ8WDyIm07bwXe55JvYa396R36NHPcAigqnm1FCHJzub+B7oy5zr3p+N+xoEccX
 6m14GW2zRMSWHnJPy5+Bi/6b;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vSdUL-00HPnf-26; Mon, 08 Dec 2025 15:49:25 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: server: reset smb_direct_port =
 SMB_DIRECT_PORT_INFINIBAND on init
Date: Mon,  8 Dec 2025 16:49:19 +0100
Message-ID: <20251208154919.934760-1-metze@samba.org>
X-Mailer: git-send-email 2.43.0
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

This allows testing with different devices (iwrap vs. non-iwarp) without
'rmmod ksmbd && modprobe ksmbd', but instead
'ksmbd.control -s && ksmbd.mountd' is enough.

In the long run we want to listen on iwarp and non-iwarp at the same time,
but requires more changes, most likely also in the rdma layer.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index f585359684d4..05f008ea51cd 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -2708,6 +2708,7 @@ int ksmbd_rdma_init(void)
 {
 	int ret;
 
+	smb_direct_port = SMB_DIRECT_PORT_INFINIBAND;
 	smb_direct_listener.cm_id = NULL;
 
 	ret = ib_register_client(&smb_direct_ib_client);
-- 
2.43.0


