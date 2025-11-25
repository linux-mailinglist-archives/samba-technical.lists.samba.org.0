Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A95F2C8689E
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UJ606WCdffDfHpUhfMTmCdhyhR2iTTQXwNiaSGYzpVI=; b=tj5h4qD/w102pAbCtuNQ/tTZE7
	sTem2EnUM5vaZox6nI/F35x6BgVgywZhLlxM6jZBG4CvYuD3+6e8Uoom+gtVk9uTC/jTUllWHWgev
	ycFs4Wcl73fDHbI50VwQtVopWUYsmTUlzDf2awXHuKwsEGdT7pduEqqq4hOYmTpHAZNF3pgfUOUiK
	1RuPt27vXBzLr3/Mqe0wSV36SeVYU0a7aHAVDlYqA8ip1GkBgJ79Q+F5FmayJ/94ZUQK/mOcRl9Xd
	Ysp6K6zzqWLymN8Ug80SOeBbXBO1UuSlRlGs0/LSAochHyfl9Z8DnWJS8O/HSL6rqKMX8E9LLrDcx
	qfRb76RA==;
Received: from ip6-localhost ([::1]:60914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxba-00DDEE-B0; Tue, 25 Nov 2025 18:17:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61408) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxUY-00DAlI-5N
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=UJ606WCdffDfHpUhfMTmCdhyhR2iTTQXwNiaSGYzpVI=; b=zl+sH/lEAhFTT7b5CxSFtqChkw
 x+rDNE+Z0bo0z21x0k0VDL5dWkJg3yIhZxY4hu8ae3lWhb5WcIH8x3jHyGMbRDFWuyggZPgkYA2zS
 x5sIHA5K/p60LUlS6YQkh/ahcYzFF9D51l5hkZCOB3BGxjVHxC7BeLkqoRix5xRKbIx7o2O5cqjAS
 xRRv/OJJZvl3TYJXKf9ex+FGiHNxUUtqRlwGCLLnT7ZL2fYRKy3x/tkhBBg56JuGY/O8hT2ACYSTu
 16uhErex6JTRq21unc3WsMRSIkfG699JlUF1Zy8mM1DRziVg04CRpHRULNonQ3beRGI/vbnKeJOCw
 7cmExVlPSRxcn7UGqz6y9kUCHEVDGtCd8Lhewoi/EDfxm4GihUBQzU/2XN3E4Vcfz0NETM5XbKw7Y
 pX1ZwfyGRVGJ3SCJBjo+wJhC//ipbDzYcJUESErgP8wT66WqEdWm4D8q1pRjTJFHbhdB3hwjTRIfm
 y7hOE4qM2Pq80/K5f7DmQA7c;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxSD-00Fe0v-1I; Tue, 25 Nov 2025 18:07:53 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 087/145] smb: client: change smbd_post_send_empty() to void
 return
Date: Tue, 25 Nov 2025 18:55:33 +0100
Message-ID: <e4a3efe1810c0d9c5c647209742b4eeb0912111a.1764091285.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

The caller doesn't check, so we better call
smbdirect_socket_schedule_cleanup() to handle the error.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 42f85dd42e7b..bc8c3e3f705f 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -23,8 +23,6 @@ const struct smbdirect_socket_parameters *smbd_get_parameters(struct smbd_connec
 	return &sc->parameters;
 }
 
-static int smbd_post_send_empty(struct smbdirect_socket *sc);
-
 /* Port numbers for SMBD transport */
 #define SMB_PORT	445
 #define SMBD_PORT	5445
@@ -930,12 +928,17 @@ static int smbd_post_send_iter(struct smbdirect_socket *sc,
  * Empty message is used to extend credits to peer to for keep live
  * while there is no upper layer payload to send at the time
  */
-static int smbd_post_send_empty(struct smbdirect_socket *sc)
+static void smbd_post_send_empty(struct smbdirect_socket *sc)
 {
 	int remaining_data_length = 0;
+	int ret;
 
 	sc->statistics.send_empty++;
-	return smbd_post_send_iter(sc, NULL, &remaining_data_length);
+	ret = smbd_post_send_iter(sc, NULL, &remaining_data_length);
+	if (ret < 0) {
+		log_rdma_send(ERR, "smbd_post_send_iter failed ret=%d\n", ret);
+		smbdirect_socket_schedule_cleanup(sc, ret);
+	}
 }
 
 static int smbd_post_send_full_iter(struct smbdirect_socket *sc,
-- 
2.43.0


