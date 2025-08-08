Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 72AC9B1EBE5
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 17:29:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ajfeVZwkk1jxAUTyHLfKrwIbk+GwICQLIc8hekLdP/c=; b=5ZLcJeACBK0alFr8K11tEmlh6X
	eLnmD/H09Xxu9mAQwJ+lzEpBwJJZxKCVa3TIcCJfopHM72nM4ES5eV3qGh3O4OMZmGnULCkJP/aff
	0+KCO7fu4ggPMYZW/27T1ussFBOwCCKueDYjkWItbT5o48FhDfXtmTqNtIVWvikWL2EzebZ6HniLI
	7LV/ntR5MsAEIWzWmAYW1IzTuilhVXCku0bZQOnrrdKM4mYWgMDSIP64eujWH9qLR8djOl/bSIzd1
	WaDiqsrA0djh0j+ZtGF0qLXX42pzcxBNy/fuOV7Dn/Br0jQFpJcQnqhDnQ0C5Zsrd4LkEg9A8ovpA
	VnbpalkA==;
Received: from ip6-localhost ([::1]:47284 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukP1M-00EgGa-GF; Fri, 08 Aug 2025 15:28:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49030) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1H-00EgEg-8D
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 15:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=ajfeVZwkk1jxAUTyHLfKrwIbk+GwICQLIc8hekLdP/c=; b=XRh8V5vC5EBIrU/oAx9aOMQao8
 ++3qhioNJ+l4Qhn5QkajiaywESWgyZoxvr9sto3PzJT6a0VxETpggJb0zaVtysf330L7pIbT/nTAr
 cPPmkBfNHz5ES2LVxTg1gaXh3IuX9dYl+HCQgSAnkGNer3e3lctotxjtcby+DvHlKckoDqP0DGynh
 /2cRpcyAG5nkL9boWGYv2grl1njG7XOK6Odn0bk7X40zrFOhaxAJQif/7Jz1Pn9FdejKckmeRkuDh
 8+hYFCKRAZzieTeaHocZIdaJUgjlVlsf+s5oiWvaYQ5pEVVAMjCNZz9xAw8ttYXqulGj1L2tjJR24
 s5h2cULyfyNLNQ6kPWn3f1VIoSTDFfQ2HEiVcCx8dIKeKQrm95h02FK2AUpKO2bxxxoAwzcQwS3+T
 S9K1r5LkuIDv0bg+QnI4sKPrby3+zfQsoirNWEAbyHW2E21+1TM3YH3xH8akn9JpP6GRQ8/6ubDco
 /ZslefODOeUqAb3Ym2aYs9nt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1G-001pON-2E; Fri, 08 Aug 2025 15:28:34 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 3/9] smb: client: don't call
 init_waitqueue_head(&info->conn_wait) twice in _smbd_get_connection
Date: Fri,  8 Aug 2025 17:28:01 +0200
Message-ID: <7c750a8db281c6d44c6785b15c7172b2bf13c26d.1754666549.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754666549.git.metze@samba.org>
References: <cover.1754666549.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

It is already called long before we may hit this cleanup code path.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 8ed4ab6f1d3a..c819cc6dcc4f 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1716,7 +1716,6 @@ static struct smbd_connection *_smbd_get_connection(
 	cancel_delayed_work_sync(&info->idle_timer_work);
 	destroy_caches_and_workqueue(info);
 	sc->status = SMBDIRECT_SOCKET_NEGOTIATE_FAILED;
-	init_waitqueue_head(&info->conn_wait);
 	rdma_disconnect(sc->rdma.cm_id);
 	wait_event(info->conn_wait,
 		sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
-- 
2.43.0


