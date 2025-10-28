Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 132C0C16427
	for <lists+samba-technical@lfdr.de>; Tue, 28 Oct 2025 18:44:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=vaSEz0xi2rODa315BDn6GyJ2sDUw6WlXsoYvDMbS+l0=; b=LiKhQJnswUKnD8RUNGFIv2vMGu
	U2bkfw1Yb6W3/9p+jgbXz6G4jpHsCsk8Br6rxSA5Qcv9nLH2cOZoAn5yeWDy+y0thuYgRqpMeqQzR
	x8nH6sGuzsj12kJWVT+fHKZs6li4PadJoom4f1Ck0I068zEiNyPaEz4xmSifOgheCcYqlJozk0F8I
	vhX/UajA19Qp3k07JAm33hshBFKlud2mBXFL3/WuTNP8O8s7B0Jc/OEe8QN9Fv0DMp3eKUAP+Do7n
	H6zfgn3dfzXaWgi3Ii3N59hh9JJinuJXOYfeyWW85FfWqDnkjtcXFAgE0ZBCwzvMIskraxsnrLNiR
	oEF8DXiQ==;
Received: from ip6-localhost ([::1]:35518 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vDnjp-0090du-1b; Tue, 28 Oct 2025 17:44:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41286) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vDnjj-0090dn-Oj
 for samba-technical@lists.samba.org; Tue, 28 Oct 2025 17:44:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=vaSEz0xi2rODa315BDn6GyJ2sDUw6WlXsoYvDMbS+l0=; b=jd5Dwqt+79YRShV11YjOvv0vZm
 VOAvhboWRUuYtHGFpY53x71bRO8NYtDipDvqKmcezUDSeO4QGsw74ychx/eeImwYV8KzxCm3bVJNY
 N7Pz5wD2sxhlLayBcC9yr/3fPFy06YO6PR3oqnaTYkhnsMwUg5J09pVHLDskP+SVVl+FBqSigc8Lx
 NhGlbtAhtTzT+XjonHiO/jQUwCl8BAqEPkH1dfJvMv60xmpi/LCuU3uXjJ0BpxB04NeDs61alkReK
 VJplcojfu1Ci3yDuzfLQmH2ZroNo8X/2gCEKHznC30FkGjZPpWU7qrb4M5K3YzT3ixCTad933Q61I
 CIl+NSDp07EpZgcngOpCFT5G5asWM9L8g27Itnk4iYjtmcnwlMN12xyY1LLnzkYDzIFXl6lxGbLwB
 7eoSrFakq1/6VY53RGs5oirQPrux5sM1Tg4lPUFJbcIQTalZGe2sqWGvwA0yyNYg+iJJCnqbfJmLR
 xm87K0Ntbh9HfRm+aE/UiruL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vDnji-00BSvP-0L; Tue, 28 Oct 2025 17:43:58 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH] smb: client: call smbd_destroy() in the same splace as
 kernel_sock_shutdown()/sock_release()
Date: Tue, 28 Oct 2025 18:43:46 +0100
Message-ID: <20251028174347.1800568-1-metze@samba.org>
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

With commit b0432201a11b ("smb: client: let destroy_mr_list() keep
smbdirect_mr_io memory if registered") the changes from commit
214bab448476 ("cifs: Call MID callback before destroying transport") and
commit 1d2a4f57cebd ("cifs:smbd When reconnecting to server, call
smbd_destroy() after all MIDs have been called") are no longer needed.

And it's better to use the same logic flow, so that
the chance of smbdirect related problems is smaller.

Fixes: 214bab448476 ("cifs: Call MID callback before destroying transport")
Fixes: 1d2a4f57cebd ("cifs:smbd When reconnecting to server, call smbd_destroy() after all MIDs have been called")
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/connect.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
index dd12f3eb61dc..61b693ed7126 100644
--- a/fs/smb/client/connect.c
+++ b/fs/smb/client/connect.c
@@ -310,6 +310,8 @@ cifs_abort_connection(struct TCP_Server_Info *server)
 			 server->ssocket->flags);
 		sock_release(server->ssocket);
 		server->ssocket = NULL;
+	} else if (cifs_rdma_enabled(server)) {
+		smbd_destroy(server);
 	}
 	server->sequence_number = 0;
 	server->session_estab = false;
@@ -338,12 +340,6 @@ cifs_abort_connection(struct TCP_Server_Info *server)
 		mid_execute_callback(mid);
 		release_mid(mid);
 	}
-
-	if (cifs_rdma_enabled(server)) {
-		cifs_server_lock(server);
-		smbd_destroy(server);
-		cifs_server_unlock(server);
-	}
 }
 
 static bool cifs_tcp_ses_needs_reconnect(struct TCP_Server_Info *server, int num_targets)
-- 
2.43.0


