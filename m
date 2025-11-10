Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E123DC47819
	for <lists+samba-technical@lfdr.de>; Mon, 10 Nov 2025 16:24:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6Pa9Hl/4tOLCprUapP9WVXeDGypM1kLq6H31y5mWsHI=; b=sUAXXwORKNALMgQ98oiorjBsCc
	B8SgSLo2eQZZUEAsGzmc+V9uFZ2vbGKcbQb6lqhvqu9yvRwrmshsKQDu4NisDiHiAj98g3pWHsmKO
	bobq3T6NwY1XYIaioAnBiZhoosmH1InQ9Ou/cuJ+eNJrIMn9+aXzoKN0cNepTnvyUYvbfmnRleQcd
	PPLhrJ9EjFz4COtHd7zyRBuEDdgyRsnDQTYNAGi0kmLWZmmF7pQTfIDK/6QfSOstMslSoUaBQYKGo
	vJ/k1eHNCBaoQnk8cJZE0Fnh9r6rkJInpkx3LZY08R8XaL4F+8IkOtD05atZwSIbjBztCEtsxbNMC
	O8EfDfiw==;
Received: from ip6-localhost ([::1]:43930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vITkZ-00Buqj-B9; Mon, 10 Nov 2025 15:24:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21710) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vITkU-00Buqc-73
 for samba-technical@lists.samba.org; Mon, 10 Nov 2025 15:24:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=6Pa9Hl/4tOLCprUapP9WVXeDGypM1kLq6H31y5mWsHI=; b=bWoEr8S8bHOtkjRF3+AcelyRiL
 0EZLprT/nGbehmlgIL8F6hP25bHDcoW6RfRE84T1PrRgDHTZG+Rtgd0q3/NnYwJAahun5nYUXj4MV
 Y7HcaFiy1KZ+DOdt2z1UAAFt0fodCAp3fAqXMN5+Iavoh/OgDoU6Onls2h4cscygeTCZFYFpJgEWl
 RmH8zw8roY82aYBSpDpqWGf+zQHo/1hk5nog2cakMX5oijMchjPNIa/L4hfMy0SKHvgjLzYcWqc87
 3dtwXbpOUxsRjGJHN71rO2Ez8gkwFMu4UgC55lsU63su/gFbuSPRiWULH632mkbkkheMVkz1lsCHm
 MDczoddXjPNjuibMblGjakwgkrEhyYEe3tggQRbPJmFvkWG2LJiFDyNMi20G/L65zKL4nQJXh3WQm
 YP/9//9ZxXGdHTQOkWk6xR5sgoyZrPc5W8BZFCJ5MQXVwI7wBLrMAw4Wk3KYbeXoHACwv6ROQlsXk
 eJHMHFghfkbnih2/W+rqXBF0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vITkS-00DTEX-1m; Mon, 10 Nov 2025 15:24:04 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: client: let smbd_disconnect_rdma_connection() turn
 CREATED into DISCONNECTED
Date: Mon, 10 Nov 2025 16:23:52 +0100
Message-ID: <20251110152352.2889115-1-metze@samba.org>
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

When smbd_disconnect_rdma_connection() turns SMBDIRECT_SOCKET_CREATED
into SMBDIRECT_SOCKET_ERROR, we'll have the situation that
smbd_disconnect_rdma_work() will set SMBDIRECT_SOCKET_DISCONNECTING
and call rdma_disconnect(), which likely fails as we never reached
the RDMA_CM_EVENT_ESTABLISHED. it means that
wait_event(sc->status_wait, sc->status == SMBDIRECT_SOCKET_DISCONNECTED)
in smbd_destroy() will hang forever in SMBDIRECT_SOCKET_DISCONNECTING
never reaching SMBDIRECT_SOCKET_DISCONNECTED.

So we directly go from SMBDIRECT_SOCKET_CREATED to
SMBDIRECT_SOCKET_DISCONNECTED.

Fixes: ffbfc73e84eb ("smb: client: let smbd_disconnect_rdma_connection() set SMBDIRECT_SOCKET_ERROR...")
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 85a4c55b61b8..c6c428c2e08d 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -290,6 +290,9 @@ static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 		break;
 
 	case SMBDIRECT_SOCKET_CREATED:
+		sc->status = SMBDIRECT_SOCKET_DISCONNECTED;
+		break;
+
 	case SMBDIRECT_SOCKET_CONNECTED:
 		sc->status = SMBDIRECT_SOCKET_ERROR;
 		break;
-- 
2.43.0


