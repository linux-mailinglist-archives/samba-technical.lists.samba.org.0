Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEF6B34DA6
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 23:09:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=JSK+riPPPf08vYfT1RBtQsvn92r3VHjyW5AHCdAF5AY=; b=gZtfdyU7nerMaQTZcc7JlNHKht
	+BoiOYmNln91sv8qehrsfwDMjqOPRZfpvL+8fcTAONYfKUVVYSLg6jKME93+FstIdqWeSg6NAukki
	B5SlY3DNexnETJo09/ldHRxGCgTgOnkCDzqctQ+Sm1wr/b1R4O4e4UuhEb9zC0F+/y1BJQ7MRPce9
	Ftny1rDKW8sP0MTwG/bwRSera38wrCdw3dr6l+FsIuhp6IccqixjLgaYiABEAUty4cO898h51RmuU
	UDG5AcWh+CHoiATi6NeF6d0Mp3OzdVCFTeFlWHtTjur5T0LHAPsB3QRnWV59Le/kfYVEHEaGijA/N
	RfhytBRA==;
Received: from ip6-localhost ([::1]:26406 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqeQw-000W47-Cx; Mon, 25 Aug 2025 21:08:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47168) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMN-000Tyq-FF
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 21:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=JSK+riPPPf08vYfT1RBtQsvn92r3VHjyW5AHCdAF5AY=; b=3cjsD/zznwqKL+0TSSE6iU3mnM
 D2WGCuHCapm7JjHtTfCOdFa+b/znVTmUwmYAgi2wQYYRhqUfQ/Ckstcc/KYMzll1JCp1zp8JtRrLm
 iqkVVbQlxaZ8bdm/mgmQN7ky7FSkmgfn3ksEZeZbQtts6esBtYbgDcps91T/tGOJIPkM/IC7w+7yM
 eLQ2iGIeBeh8P9N2inTsb2H2WtREN2j5fIFogE7fqb2GCC6NWh4Kxw3JxrcBA2/k4DRPfBW0qgDzf
 DPzA4CJiNyjEAv/MzOoGswJFhHEcmNld0mYhHDbwNMZUV9b2dU2vtBlf61LFZEx0bt31SiaJZpjTk
 f9f/1u/+VMID6Lk50wpwk/PhEIHhNuDZdTBEXJ2hYRyWHWaseHLxqInpiib5EUy4g6P2kClItcxnP
 XcCd6j+TzmJnDcGfeMKtzAuBxWaQSR9Nz7w4Sxr6WIF4ywr6/tNvCaFuHrigBWOrmfZlhVhbABI81
 tIg98u7uLWsItVLqGwLn/0lc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqeMK-000ngc-2j; Mon, 25 Aug 2025 21:04:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 134/142] smb: server: pass struct smbdirect_socket to
 wait_for_rw_credits()
Date: Mon, 25 Aug 2025 22:41:35 +0200
Message-ID: <568abc598637207c7dae45cc46b2c5b927c90b32.1756139608.git.metze@samba.org>
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

This will make it easier to move function to the common code
in future.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/server/transport_rdma.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index defebe773b8a..e47ff55af2e0 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -982,10 +982,8 @@ static int wait_for_send_credits(struct smbdirect_socket *sc,
 	return wait_for_credits(sc, &sc->send_io.credits.wait_queue, &sc->send_io.credits.count, 1);
 }
 
-static int wait_for_rw_credits(struct smb_direct_transport *t, int credits)
+static int wait_for_rw_credits(struct smbdirect_socket *sc, int credits)
 {
-	struct smbdirect_socket *sc = &t->socket;
-
 	return wait_for_credits(sc,
 				&sc->rw_io.credits.wait_queue,
 				&sc->rw_io.credits.count,
@@ -1401,7 +1399,7 @@ static int smb_direct_rdma_xmit(struct smb_direct_transport *t,
 	ksmbd_debug(RDMA, "RDMA %s, len %#x, needed credits %#x\n",
 		    str_read_write(is_read), buf_len, credits_needed);
 
-	ret = wait_for_rw_credits(t, credits_needed);
+	ret = wait_for_rw_credits(sc, credits_needed);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0


