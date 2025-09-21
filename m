Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6E2B8E73F
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:47:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=IfEoqN+k/tgJdLVGN3c3Tn/VEWus/DrRES0UThRwqRE=; b=J01fnvNi9fWMgDR8yVsmXpI5pX
	Nh/atC095KqI58ZMvpyFXZElr1GwmU2MMpkW3skD9bFMha/3JM9FLFHbsLnXpJx3I11GMUrtuJ/1T
	MHvWjlq82P+3DJ/pqdmU3RBwS3ev2bF4gIEDSZTNOSl0L2U2PA0wXr6aqkUon1suJA9hTA7AtwMSc
	KPftCIv4edld+aOYG8wwrPFlpbiRY1jyhnFc+97EYc2P8ZYAO8ADpB0GUl+g7a+PdDGPBiagLlsEP
	qwAQeYKsGOv6AWqJ0hOQ77dCp6oLZPY9h730zlIbJh9BUwNjtGhMVts//sjLYmq4g5sdfmwEAXB5J
	Kpq1IMHA==;
Received: from ip6-localhost ([::1]:20056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0RtV-004TLZ-CZ; Sun, 21 Sep 2025 21:46:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12526) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rst-004TAa-Dj
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:46:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=IfEoqN+k/tgJdLVGN3c3Tn/VEWus/DrRES0UThRwqRE=; b=eUxAX2beBaIw8g+0fmA9o7FMjL
 k0TB0aqxRvILLZ53Jp/sq5dLtsS4tz5hW3A6BI3//U9qiAObx6IxmQbc+2iCY/WEUV00e0L4pfgar
 nYQXRZUMW9PMlVsJuAcIeWl33s4J3w3deyzczjxSVTPkCdZq9Q+xDf712NdC2Py0Zt0PSSgD9HG4D
 UyHjYftBdzZJm5JlnGb1YVWWkCKxo4Dg2BgUnAg1GpJWZHH7KHorB0P0DzrPsYfZhZn6rFObSknjo
 IqLXRlqR2/sPqOcSuj3Hd17CY5mhRrNtz0QDX6vFVCnQNvv52cxGmD+lV+GmN/raJ5yN9hh1HZ4xa
 az0pO97P9CmA3jjHl5FO+A943j+UEeYJGOR0DW56PCs8hbenNItF2wxDGc/9pjBoa9PBJ9AXt0cpI
 Wi9pSU7og8//YRMPR8d6eNg7OLQ50kzRVArB6iq9iLjsClVhwxvSqdf2OOcvCaj/owdfvlUODczNu
 Czlmu5cm8mWLWDzOYhHKOOwB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rso-005GRS-0E; Sun, 21 Sep 2025 21:46:10 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 06/18] smb: client: let smbd_disconnect_rdma_connection()
 disable all work but disconnect_work
Date: Sun, 21 Sep 2025 23:44:53 +0200
Message-ID: <00ade01b51673817ba5500444756d7882314c4ef.1758489989.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758489988.git.metze@samba.org>
References: <cover.1758489988.git.metze@samba.org>
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

There's no point run these if we already know the connection
is broken.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/client/smbdirect.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 73beb681ac0b..b39e60086c6a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -220,6 +220,16 @@ static void smbd_disconnect_rdma_work(struct work_struct *work)
 
 static void smbd_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
+	/*
+	 * make sure other work (than disconnect_work) is
+	 * not queued again but here we don't block and avoid
+	 * disable[_delayed]_work_sync()
+	 */
+	disable_work(&sc->recv_io.posted.refill_work);
+	disable_work(&sc->mr_io.recovery_work);
+	disable_work(&sc->idle.immediate_work);
+	disable_delayed_work(&sc->idle.timer_work);
+
 	if (sc->first_error == 0)
 		sc->first_error = -ECONNABORTED;
 
-- 
2.43.0


