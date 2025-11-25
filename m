Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2A8C86A51
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:33:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6ZBdmK/hb72nWzfTX+xpVwDxdtCuyybkMHjYK9w6vSg=; b=Vstp8YwILxMqXEtwXREppPdceg
	QH0zM/aaACz7jOyLglO6yCi15ruNWJ4qweWWSahHrog5DvckbaVpdBOH4MWmMBTOoVUo8W9jiQEe5
	0hIj0ZUd1woM2O4h+L/dVUC7ZqSn9NmYCD8HAA/Wh4W/DQbzAHQJHgsbj1QzxFouoCzK9UhO/Ahq/
	IywG7o/i7sGVom9Dvs9UK1JJqswtDMQTtXwjkkhgCaTsgPaM6gsHc3xHPsUPseVk7n9W9HGvIfRzX
	URoRga92u+XboOkQL/7MhnsiX6MMA2cLYb/GVYb6JI6v4GlXN+u5L85wTRiCVJrqinfaVPxlryj0w
	U+zE0PrQ==;
Received: from ip6-localhost ([::1]:61836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxqf-00DGg5-O7; Tue, 25 Nov 2025 18:33:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45312) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxqL-00DGfl-AL
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:32:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=6ZBdmK/hb72nWzfTX+xpVwDxdtCuyybkMHjYK9w6vSg=; b=NKQfFWVg2e26+fuyxgPQOSVPF/
 EXlf72BFVDDBmJbpjrSfb/Fwiy9Xlo9l8kBOFZMuY2sQA17ghs/lsoRj8lPaU/pd0djQ+22t2kD47
 GTIPQcTpargtnfbGCxkRoHxT0ECTqYkLT7M4MoG5j1V5VlKTRhbAlNC1FQgPZTl+VyTpTAyPBLJ97
 0qN55RiDCSCHDX2uy7b2MCGr3UccINWgFfDunuLtZ6Ea/ti8DCUM2Oa45QW6e800ayeOwxIIG+OvN
 uehxyyTUEPQapUsCv7Q126zZfqAQyFVGiblvvsE3yYdyvAwQzUkJ6XOU6l7FlG0t0Py6sHJzue+Ix
 12VUy1k+BizZR8i+JDcA6Lr3U5h+x7pE6xfkNXF63xG1JPQlVkgaRisLmaOoflGVteZdFl5A5bbKe
 JNP9bRah3zoHmawUm9KSJlmdZO8aLIwYwZ56EUueMTlOcIh3vBlDGDpdWEBoxj/SaMkVJmn1J6ABY
 /3rKDzJmQs5eV6dKpZfoPPMw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxmu-00Ffwd-0y; Tue, 25 Nov 2025 18:29:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 138/145] smb: client: no longer use
 smbdirect_socket_set_custom_workqueue()
Date: Tue, 25 Nov 2025 18:56:24 +0100
Message-ID: <cabe70c090b544443f56512146270fa58dcc5578.1764091285.git.metze@samba.org>
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

smbdirect.ko has global workqueues now, so we should use these
default once.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 12 ------------
 fs/smb/client/smbdirect.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 0c3a4b6aa03f..4b9ae71c323b 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -196,7 +196,6 @@ void smbd_destroy(struct TCP_Server_Info *server)
 
 	smbdirect_socket_release(info->socket);
 
-	destroy_workqueue(info->workqueue);
 	kfree(info);
 	server->smbd_conn = NULL;
 }
@@ -245,7 +244,6 @@ static struct smbd_connection *_smbd_get_connection(
 	struct smbdirect_socket_parameters init_params = {};
 	struct smbdirect_socket_parameters *sp;
 	__be16 *sport;
-	char wq_name[80];
 	int ret;
 
 	/*
@@ -270,10 +268,6 @@ static struct smbd_connection *_smbd_get_connection(
 	info = kzalloc(sizeof(struct smbd_connection), GFP_KERNEL);
 	if (!info)
 		return NULL;
-	scnprintf(wq_name, ARRAY_SIZE(wq_name), "smbd_%p", info);
-	info->workqueue = create_workqueue(wq_name);
-	if (!info->workqueue)
-		goto create_wq_failed;
 	ret = smbdirect_socket_create_kern(net, &sc);
 	if (ret)
 		goto socket_init_failed;
@@ -284,9 +278,6 @@ static struct smbd_connection *_smbd_get_connection(
 	ret = smbdirect_socket_set_kernel_settings(sc, IB_POLL_SOFTIRQ, GFP_KERNEL);
 	if (ret)
 		goto set_settings_failed;
-	ret = smbdirect_socket_set_custom_workqueue(sc, info->workqueue);
-	if (ret)
-		goto set_workqueue_failed;
 
 	if (dstaddr->sa_family == AF_INET6)
 		sport = &((struct sockaddr_in6 *)dstaddr)->sin6_port;
@@ -306,13 +297,10 @@ static struct smbd_connection *_smbd_get_connection(
 	return info;
 
 connect_failed:
-set_workqueue_failed:
 set_settings_failed:
 set_params_failed:
 	smbdirect_socket_release(sc);
 socket_init_failed:
-	destroy_workqueue(info->workqueue);
-create_wq_failed:
 	kfree(info);
 	return NULL;
 }
diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index bd03ae72e9c8..0017d5b2de44 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -25,7 +25,6 @@ extern int smbd_receive_credit_max;
 
 struct smbd_connection {
 	struct smbdirect_socket *socket;
-	struct workqueue_struct *workqueue;
 };
 
 /* Create a SMBDirect session */
-- 
2.43.0


