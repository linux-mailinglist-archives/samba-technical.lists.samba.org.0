Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F598B1A0F0
	for <lists+samba-technical@lfdr.de>; Mon,  4 Aug 2025 14:12:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=CdYFXYJEModr6o2laAGxuweVh0CJ07+3rQ+j6A2kOL0=; b=srqJYL9VbNUXOURdeK3YsSVPCW
	zPLmMKPPkQAGfTH1RggJy95IRItNTTCeRbYVGNLjavVXaoJ7JGRMwdWw8FjGxdAiz1GZsjQAOfr8w
	Lt36pGVmWJ4mXRF2mK8QN9vML6DxbT4kAiriHWnDrkJ9m+RhNxga1HmTeL1ZwCYQLs2on8f6eucv3
	+uGw3nURsYFgAl6PkvxoAYqRtJ6kC2AJky8J7+N/N8lVW8CZcR3c5k3Qub/vj6wgB7sGBECa+UjQk
	9KI0VwcEYVtyXjGmD7DZ8pLEam8cmZVMJqaGbdgwIVpBjDkm8ZrYWCj+MmJRPOCb/TiG8rwN61d5L
	ii2oHGyw==;
Received: from ip6-localhost ([::1]:31510 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uiu3B-00EHso-GR; Mon, 04 Aug 2025 12:12:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34434) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2t-00EHmr-8Q
 for samba-technical@lists.samba.org; Mon, 04 Aug 2025 12:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=CdYFXYJEModr6o2laAGxuweVh0CJ07+3rQ+j6A2kOL0=; b=IT3Ux1rzLafu7K1AvIxpC9kgbK
 /FA45Owwzaphzh5XkRmylXlqnfsE+tbxvRFiNnHtolOj8Bj+xTac/YyqyverI4BHt76wHloRPHeRG
 gfSxEA0UkjmnyoYlXU3ilpU5mGqpsNB5YNiZywT7OIiShCPsCjjFMqCVW3n/clHm4dhK5x9h2lkWY
 SZF8a/cAVt+SYPTVfoTkSyCRTMrxIkmxiuX2VarZ7sLX81RnjaqU9j8FmY6F2cmBXTApvjbuLiEas
 GqNLAU0M/MfJ5l8i5yvwOCRFg3mn94QqBUZUHBOHC7PLS2drZaJW7cjL10LjVPCPs2buIbC9sbRmj
 rGoJYHNkV/4edlevgdbzh9D1lAkFOdQzLfAAGucSbAX06J59Wy84NWOKsSYm55XVMs3t4AHUfPyOx
 KoedcGMSZWRXWva8le6viA0AByLcEcbLJXBzOlhdi5UCNS+YZzMe4lMe5dhkRwPTBwWvEFz3vhmpI
 pmGJ3BS+oTpiutAao3wEHT06;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uiu2p-000vxF-1T; Mon, 04 Aug 2025 12:11:59 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 4/5] smb: client: let recv_done() cleanup before notifying the
 callers.
Date: Mon,  4 Aug 2025 14:10:15 +0200
Message-ID: <82981763ec07b3164d16c7d797118e98dcdeb676.1754308712.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754308712.git.metze@samba.org>
References: <cover.1754308712.git.metze@samba.org>
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

We should call put_receive_buffer() before waking up the callers.

For the internal error case of response->type being unexpected,
we now also call smbd_disconnect_rdma_connection() instead
of not waking up the callers at all.

Note that the SMBD_TRANSFER_DATA case still has problems,
which will be addressed in the next commit in order to make
it easier to review this one.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index a32ebb4d48a2..21a12e08082f 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -454,7 +454,6 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_RECV) {
 		log_rdma_recv(INFO, "wc->status=%d opcode=%d\n",
 			wc->status, wc->opcode);
-		smbd_disconnect_rdma_connection(info);
 		goto error;
 	}
 
@@ -471,8 +470,9 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		info->full_packet_received = true;
 		info->negotiate_done =
 			process_negotiation_response(response, wc->byte_len);
+		put_receive_buffer(info, response);
 		complete(&info->negotiate_completion);
-		break;
+		return;
 
 	/* SMBD data transfer packet */
 	case SMBD_TRANSFER_DATA:
@@ -529,14 +529,16 @@ static void recv_done(struct ib_cq *cq, struct ib_wc *wc)
 		}
 
 		return;
-
-	default:
-		log_rdma_recv(ERR,
-			"unexpected response type=%d\n", response->type);
 	}
 
+	/*
+	 * This is an internal error!
+	 */
+	log_rdma_recv(ERR, "unexpected response type=%d\n", response->type);
+	WARN_ON_ONCE(response->type != SMBD_TRANSFER_DATA);
 error:
 	put_receive_buffer(info, response);
+	smbd_disconnect_rdma_connection(info);
 }
 
 static struct rdma_cm_id *smbd_create_id(
-- 
2.43.0


