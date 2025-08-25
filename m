Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A02B34D4F
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:01:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=QpsyYYVWqluMLty6/9UAIxU+hwXsAEXMA9savJJBiJg=; b=NqAVCxxyJKA8E1WTjjvUN1uoss
	2qVPtfL950B0ZWkVxzaARfmsL7LHH4FZU6GTzUwU7uRjrixdJ4cxaIM2IjBKHYZtHzFPVDio7wmxA
	QJPOL/QzQE2xKxeJTkxyqN/PRga+hu3Z2F9LNfqURv3ioEJjIIfdZnFyfw//BclL7xCAnFDruvLx9
	lfxREnqvypU5EKwN76y2vHCRIOs5p4nUZVnqxItgdlRWQRKgVbsRRb+ET3Yt3E8ECNmmSgH8b3zxx
	oZ+gcsxzXrWfA3oMTOqmVfn3Pxz2F6gVubhmD3zgu54oSUWGgELvtPdWGT3x6IcfmjF/5zq6KwFi8
	MzwQLp4g==;
Received: from ip6-localhost ([::1]:63990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeK1-000StO-Vj; Mon, 25 Aug 2025 21:01:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41216) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeFw-000RFV-E8
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:57:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=QpsyYYVWqluMLty6/9UAIxU+hwXsAEXMA9savJJBiJg=; b=Y0FAp3FN2uQ8goK7lrROtUVWWz
 78tTVQQm9X4o0//OKsyJKY9i/Tm7AEFwanMqLJ/2vyjpPP/TbGxAZmYw6Y0EIrVwZ5p/ME83fy6ZD
 OnwWLTC9CNk//Y2YBWy6Z7PnW6XPrGTrTznWnF+CmrgcfM4gYhkcA68ufSvXSd9lySyYWrzgAmXgO
 6wkpDCuTxOtNRn/2gd5ezytIUcAQTmXr6srJnhyQnDIsn5AdPqRH9S/am9CWi6NGijcBQkPvJUsIy
 thdIhh/KPf2n2pyhhZ9x4YsY+7z4vCTDm7Goks6uLvkSG0ttdHRyW7eCyr0PfFnsBdQTtkuxhjGFQ
 s6UAlDfc02WXAORL3+bTUbEJt18AX1vBQ402PPgTUa2l2KCm9lG6oLLccbp4jmYsCKPC2zeqLb2cg
 mVR0kpzNeBtH50+GyFQuAYV0M9tRiFr1fYZNzFl1mV2mHfDPJzOWOBFYTu6vOiaj24PCpuiJFpNrs
 UaArpnB7c+K3cShPtR1vMKDY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeFs-000mLx-06; Mon, 25 Aug 2025 20:57:28 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 094/142] smb: server: move
 smb_direct_disconnect_rdma_work() into free_transport()
Date: Mon, 25 Aug 2025 22:40:55 +0200
Message-ID: <149659aad412ffd0b1ea0a61349c01044b9066a2.1756139607.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The logic is also needed when smb_direct_handle_connect_request()
calls free_transport(), because rdma_accept() and RDMA_CM_EVENT_ESTABLISHED
could already be reached.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index fdcf53856665..741b5b62b7d6 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -380,13 +380,19 @@ static void free_transport(struct smb_direct_transport *t)
 	struct smbdirect_socket *sc = &t->socket;
 	struct smbdirect_recv_io *recvmsg;
 
+	disable_work_sync(&t->disconnect_work);
+	if (sc->status < SMBDIRECT_SOCKET_DISCONNECTING) {
+		smb_direct_disconnect_rdma_work(&t->disconnect_work);
+		wait_event_interruptible(sc->status_wait,
+					 sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
+	}
+
 	wake_up_all(&t->wait_send_credits);
 
 	ksmbd_debug(RDMA, "wait for all send posted to IB to finish\n");
 	wait_event(t->wait_send_pending,
 		   atomic_read(&t->send_pending) == 0);
 
-	disable_work_sync(&t->disconnect_work);
 	disable_work_sync(&t->post_recv_credits_work);
 	disable_work_sync(&t->send_immediate_work);
 
@@ -1486,9 +1492,6 @@ static void smb_direct_disconnect(struct ksmbd_transport *t)
 
 	ksmbd_debug(RDMA, "Disconnecting cm_id=%p\n", sc->rdma.cm_id);
 
-	smb_direct_disconnect_rdma_work(&st->disconnect_work);
-	wait_event_interruptible(sc->status_wait,
-				 sc->status == SMBDIRECT_SOCKET_DISCONNECTED);
 	free_transport(st);
 }
 
-- 
2.43.0


