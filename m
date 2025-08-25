Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A1B34C88
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UW6eS9CxDHobELUIPmZRpu4OxqzdfIyO+N6wYgdZ6+A=; b=Z814/vWboHTzJGSzn+QVqHio6/
	1xtn/+amY3aeId59DtlLswWqBmdCCahE1b+t3tkSNdTdzqRVmkFpgN4gewsvU8QkghPq0C4cMJ1yc
	tXTn2OTTo0z+CDuZXZ43TClV873scqFCNibJX6A96FE/ugDX3DUXSppCZwEBgn4b4yNX2IjCu0NJM
	iIqrlrTa4bng47+kXZ/Spnmm5eMCxknkAzkVcUUHsuPcMtifTeXuO7fyGomxSJ/gUiEbEmzfIcfQa
	G/FnT74udRxJjvx/iih0paaQnICcJamxExoj689dUFKZUVwUPUE0vvvuf23wM/U983riB/JEYW2xm
	0ancSB3g==;
Received: from ip6-localhost ([::1]:50476 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe72-000Na5-DK; Mon, 25 Aug 2025 20:48:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63878) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5b-000N2n-W5
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=UW6eS9CxDHobELUIPmZRpu4OxqzdfIyO+N6wYgdZ6+A=; b=JZTrjb6HBGQtHY8/1QcK4BEwki
 ZT1yStJVYuT3OLk1zau5qIWTkOsq6IuE4q0S3fkLFqbNWfUQ1sr21+3rNlPKMFwOtSQt29d0tK4pp
 oSSQzFv6E15iyaVUGuK0s+3zWctSHd1iZk6kdtAI2jM+V2PBw3/PwMSaC7ubf03YUx9W9l3yiyQPd
 5Cw143orsyrc7P8an7FatpoW8c6x+mHxklVPBooBCDrzd+Ly9LjOvsCIrIPVWjzHqJGkfrNIHj2xJ
 NlSSeSVhlqduAmal8y72ELvmkC3ciW1Kwt/dxe4frfYBsfyAC3cYNMcAlbemEpa9Y5P67qbEug9Nf
 ZQAJfFA66rn6mDPcv2sNuQzTgGcmoux3682vygiYgGLy6gnbq2uMQECqwm1eVDb0YxwzCfZoaS7v9
 4+fzdVgofNQRTcauj422jnKUO+CPPNQBlbMPoe9L2CeWgH7O8cqjK1UnfGVruggmts0QfoE02c74a
 UVWpoi/IIi0TTvQJ3WUeAAQy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe5Z-000kA7-2x; Mon, 25 Aug 2025 20:46:50 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 030/142] smb: client: let smbd_destroy() call
 disable_work_sync(&info->post_send_credits_work)
Date: Mon, 25 Aug 2025 22:39:51 +0200
Message-ID: <1aa2d877d2a9b6549fc1bd4aa78d980928788ef5.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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

We already called disable_work(&info->post_send_credits_work) in
smbd_disconnect_rdma_work().

But in smbd_destroy() we may destroy the memory so we better
wait until post_send_credits_work is no longer pending.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index d36556fab357..a61c7d2afbdf 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1462,6 +1462,9 @@ void smbd_destroy(struct TCP_Server_Info *server)
 			sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 	}
 
+	log_rdma_event(INFO, "cancelling post_send_credits_work\n");
+	disable_work_sync(&info->post_send_credits_work);
+
 	log_rdma_event(INFO, "destroying qp\n");
 	ib_drain_qp(sc->ib.qp);
 	rdma_destroy_qp(sc->rdma.cm_id);
-- 
2.43.0


