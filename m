Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AFAC86A33
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:32:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=b9yHqoqKTCHAN8u0FwBxpC+ttSlTRj9+OdVegGgmRjw=; b=WPu4k6OCfB1C7K1qvndMDxlOl7
	UWYGh7pg7aZ+kCczAEY8GpW4r8tJV2qSaEvE6GhFaXMPHqj3R4YQuxArWDKYvMt1jj8EgkOvTWU38
	jS+fZQltUwS7hFqHaTxIa/VEQ42oqg98hZoImSEgHC4m0Mfqe6i71RhW/HKTJ2sUPAeULXERAqzcZ
	eEPh2ADFPZwmGx0iU6F5cik8jhKVTs/OPcKsPcnVDfab9eDtcLvrPvfRkwhhhH4j7NiLghTRyJugn
	rq/M051ttm6WF2jkLky5SzzfFgh6R+lnGjNtn8JSLjCG3zfUY063RomEy+XnEnO52o8oKFxoMUQ4l
	dzQTBqlQ==;
Received: from ip6-localhost ([::1]:37222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxpo-00DGXC-PP; Tue, 25 Nov 2025 18:32:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:22046) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxn0-00DFog-CR
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=b9yHqoqKTCHAN8u0FwBxpC+ttSlTRj9+OdVegGgmRjw=; b=j8u/Wxa2vrlJsSFsfzaFn5oEyt
 X7sTAE95+GBblWel1JeFaGWGwyk+VgjYQ7aVT2+VCBzDO0U5H0gHbJ6d/MGyFQM+t/xLcix9wrGay
 J+555ChBwC0pfHS90nTGORG5N+8u1yOliaqM8wf8KiDz6Xacx+A1uwVCx2bNcNAvo720whY9y2Si1
 5qz89g3RvG9kvkixqlLSmCJGxX6/fLFQJYLJGwfHb/n4EZiXgkC6gYkaqX+GDhY+9Lto+e7JXBB0k
 yTb35aoKNQGtBCe5bEqo9CxIVOPzwJW30dwHrIdBbQOLAwto1rUXCotuDls6xZ4jM8VEVFkbwgQeM
 SXnzW2j50Qu+dIHTEr4SH/1Q/3IN96JQ5c3ss2ICM4Hx85EhzafSQ9uqP+anhhHY31QD+qA54+A/i
 8ui9Ak/CFhpWVImUSUJJYi0Zalp/vSe3zLrJMRxdV3LuAhdHWq2abKCkLyyjLu/UQPHtXARCZI7fB
 T8bgs5kDvGyQ5NmWmJRCqep1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxhG-00Ffiz-2d; Tue, 25 Nov 2025 18:23:28 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 128/145] smb: server: let smb_direct_post_send_data()
 return data_length
Date: Tue, 25 Nov 2025 18:56:14 +0100
Message-ID: <28dc497b8bb277da6ae603e858969f9bd36959b4.1764091285.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This make it easier moving to common code shared with the client.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index f9913321389b..0a352e56ccf7 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -761,7 +761,7 @@ static int smb_direct_post_send_data(struct smbdirect_socket *sc,
 	ret = post_sendmsg(sc, send_ctx, msg);
 	if (ret)
 		goto err;
-	return 0;
+	return data_length;
 err:
 	smbdirect_connection_free_send_io(msg);
 alloc_failed:
@@ -813,7 +813,7 @@ static int smb_direct_send_iter(struct smbdirect_socket *sc,
 						&send_ctx,
 						iter,
 						iov_iter_count(iter));
-		if (unlikely(ret)) {
+		if (unlikely(ret < 0)) {
 			error = ret;
 			break;
 		}
-- 
2.43.0


