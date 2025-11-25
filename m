Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7005C86913
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:21:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=41L0fkzGjZtw7n+AyUud5AU25hqjHZxA/9myhEm3YKw=; b=mtrvTd1OovDMHQvDEz7IwW9IQZ
	sJPeBb1Lw9Ug+nlzs86fT8lOe/+VRzgWDKQ+09o4p89W8GdkVVHloU00TpYn+L1ofGGn1dX1a67ZB
	Fxpx/5JJKDhWJF46eQqTfe+MbXXR2C2b3DZqEcfNfE/OQ5sfg2lloGn80gIhsH4eNwk+bnQ5pX0h4
	+kWhOwfzWBjNX9wwcSugXuPA25mj4vPAT8i54+++9+JAdAMxivSpKlWmfyEcc484kAWHjp6bGOITq
	G0X60pflD5n+2AYR571RncIeKAx18Ga8jCx37SH2fA7MtCQUBcL404YfNlFjn3QZYt26kdzcq6ra8
	E/XW6i3w==;
Received: from ip6-localhost ([::1]:60720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxf1-00DEEy-8S; Tue, 25 Nov 2025 18:21:08 +0000
Received: from hr2.samba.org ([144.76.82.148]:35244) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxcY-00DDdV-7j
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=41L0fkzGjZtw7n+AyUud5AU25hqjHZxA/9myhEm3YKw=; b=XJ7fJsqG49KQdiJXKbpYSnxbS7
 06mjmqEIhfY2DhACHSAGwQBUQ9E5+XHqvhXKHr0wGTQqZf9kjcNdIR2V4gFArw37IOKps8TEelHG+
 38d+ZGZq84E5bRTCGJ6MDNFr5Znhc3ED4sy4atNQ1haKPfq4eMBUJWO/295xX2WtThqxIUpR2Bpo5
 57v1zxhwvWXWqc0/FHeZhbb9nNm7Txq/I08k7TilhL4qKzLs6HV4/BeqyrlFip1ehHjfHUr48LUj2
 x3mvX+yqz+qLIfxJVN3j+1eIA+4s/XvvAWVcZxWqHpjv2lpS9Lu15Fm2Z+YHXUtnT7LkT72jMX8uM
 xLxUEARqjcXjqLH0Ib9ylMOmlWuandQK05hDlG0PrKDTckPFaQxzdtNKuL9X/TezZiZeWv3DMaQan
 AkOBS7QOFQaGkWvQI9a8QcsX9ien0RDIAfacw8GjBTDnfeLHGzmZh/aVo+pNaUNDOOmX9GQLvCAoo
 N4laIb4Jhu0vC7ixmIVKCnwo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUw-00FeGH-2e; Tue, 25 Nov 2025 18:10:43 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 100/145] smb: server: let smb_direct_create_pools()
 initialize complex_work as disabled
Date: Tue, 25 Nov 2025 18:55:46 +0100
Message-ID: <1a1977dd7651c7e9e1cc31b054d74c64421a7d8a.1764091285.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

smbdirect_recv_io.complex_work won't be used in server until
the end of the move to common functions, but common cleanup
code will call disable_work[_sync]() before that, so we
better initialize it now.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d61c95eca0ee..84da674bef85 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -2107,6 +2107,8 @@ static int smb_direct_create_pools(struct smbdirect_socket *sc)
 			goto err;
 		recvmsg->socket = sc;
 		recvmsg->sge.length = 0;
+		INIT_WORK(&recvmsg->complex_work, __smbdirect_socket_disabled_work);
+		disable_work_sync(&recvmsg->complex_work);
 		list_add(&recvmsg->list, &sc->recv_io.free.list);
 	}
 
-- 
2.43.0


