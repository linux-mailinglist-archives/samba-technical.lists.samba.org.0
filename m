Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B1DC1AEAE
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:49:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mJf35CW6IbEVf9r1criD2105WCtqm8Ul1qcNtDpHZY8=; b=4Ok79q8OXnxpqaqtfvXS1Cp6JX
	260eBZLPM8Nyp6KRSF5YdGKZubWsY+cg64GtN4SGa6PzSbJDBo4c4uDtcmlnN6bymbXnzEYSZyFq4
	o8S3sSzPELegM0rHSbfdBXUQamC7Yci+/9binMze7nlnCPUx+qh54SE8YkTG1uPoPi1u8JyYHAFgJ
	VdWD89hxCQTyY8AzUwEDfeEHfBW5SYIrjsGHYwcYsiXZw3e3Qd1DG9VRPcgf0kjBYKvIbRBm82pGZ
	tjH9FN+o93PkTjO1LFdOl/fTSAaX6J/BpTE2TGiuyd6JiY9ub5KQTZT5BoZD6CXIvKIYpEXLx2WXU
	rJOyOVKA==;
Received: from ip6-localhost ([::1]:63176 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6YG-009E95-4G; Wed, 29 Oct 2025 13:49:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44474) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6JB-0098hl-26
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:33:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=mJf35CW6IbEVf9r1criD2105WCtqm8Ul1qcNtDpHZY8=; b=eobsnSuf9Tv1b4gbfZ82IU/+Op
 weEwDTxtN9KaOsZo09bx1AYoyOrrif0aZcICr/DcXYDIFt3XLNPJtyTpbqBdtovJSJYtauekv9d1i
 ZEUQY94y6pyIehIjB4CKfF02YsyOGc5MflIIhDT5Ux+tZPDIRavQioBw6yKTVcmjSnQKhWYFAjznb
 o1KJaxCdCxgHucLAfCLtULKtsNbXYxIsnnfwm3ed3i8cQpxQ+dO2Odc0dOac3tODybziVFxPb/Jzo
 RhHkxWByGf3ENlbN//6sI/eoMJ9F5Jm0EQ2bw5G+4WE2kudUzSn9fJrj8IriyxgdpR8DwDV5kg40H
 W65nbtfBZhr/LUrMb7cmf2LawCUJ6U6eTCHl3GE5wotHwzFcpBmmAvd9ma6v8jTeaLiytdB14WqHX
 RpYR5GD79h3c7Hy9ZwL6uc8LHiGgdqQ5mYOX285+yasJ/Odi2HSFiJE1TJY0ca4qz2JE2/EJk8rnq
 evjLSSMJCftxZ1vt0I0eJgdT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6J7-00BcxX-1U; Wed, 29 Oct 2025 13:33:45 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 112/127] smb: server: make use of
 smbdirect_connection_wait_for_credits()
Date: Wed, 29 Oct 2025 14:21:30 +0100
Message-ID: <ddd5c1df1286b03bff2c34f1dbd4535e78b03405.1761742839.git.metze@samba.org>
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

This will allow us to share more common code between client and
server soon.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 42 ++++++++++------------------------
 1 file changed, 12 insertions(+), 30 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index d8829cb57270..3902ba403c0f 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -757,27 +757,6 @@ static int smb_direct_flush_send_list(struct smbdirect_socket *sc,
 	return ret;
 }
 
-static int wait_for_credits(struct smbdirect_socket *sc,
-			    wait_queue_head_t *waitq, atomic_t *total_credits,
-			    int needed)
-{
-	int ret;
-
-	do {
-		if (atomic_sub_return(needed, total_credits) >= 0)
-			return 0;
-
-		atomic_add(needed, total_credits);
-		ret = wait_event_interruptible(*waitq,
-					       atomic_read(total_credits) >= needed ||
-					       sc->status != SMBDIRECT_SOCKET_CONNECTED);
-
-		if (sc->status != SMBDIRECT_SOCKET_CONNECTED)
-			return -ENOTCONN;
-		else if (ret < 0)
-			return ret;
-	} while (true);
-}
 
 static int wait_for_send_lcredit(struct smbdirect_socket *sc,
 				 struct smbdirect_send_batch *send_ctx)
@@ -790,10 +769,10 @@ static int wait_for_send_lcredit(struct smbdirect_socket *sc,
 			return ret;
 	}
 
-	return wait_for_credits(sc,
-				&sc->send_io.lcredits.wait_queue,
-				&sc->send_io.lcredits.count,
-				1);
+	return smbdirect_connection_wait_for_credits(sc,
+						     &sc->send_io.lcredits.wait_queue,
+						     &sc->send_io.lcredits.count,
+						     1);
 }
 
 static int wait_for_send_credits(struct smbdirect_socket *sc,
@@ -808,15 +787,18 @@ static int wait_for_send_credits(struct smbdirect_socket *sc,
 			return ret;
 	}
 
-	return wait_for_credits(sc, &sc->send_io.credits.wait_queue, &sc->send_io.credits.count, 1);
+	return smbdirect_connection_wait_for_credits(sc,
+						     &sc->send_io.credits.wait_queue,
+						     &sc->send_io.credits.count,
+						     1);
 }
 
 static int wait_for_rw_credits(struct smbdirect_socket *sc, int credits)
 {
-	return wait_for_credits(sc,
-				&sc->rw_io.credits.wait_queue,
-				&sc->rw_io.credits.count,
-				credits);
+	return smbdirect_connection_wait_for_credits(sc,
+						     &sc->rw_io.credits.wait_queue,
+						     &sc->rw_io.credits.count,
+						     credits);
 }
 
 static int calc_rw_credits(struct smbdirect_socket *sc,
-- 
2.43.0


