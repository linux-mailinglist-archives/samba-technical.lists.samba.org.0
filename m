Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 998B8C8673D
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:07:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ot/g2X2p3USxlU4/6ctFi0yjrKOMYk59FL1Ot5hIGbY=; b=WtVTKW2GzwMj8CKG/GzIwmQzAc
	SdcH4SYqC9++/em6+/YlJCjToa4bjcNaLvNET5ohkZ/aNwGewGyQqGK+Ji+KcoyQMbEZ6YLyzaR0y
	D/9Zi1ndnB8NHKvhp3zbKOZlloEPMGJq3OtM7x3t8MqvR6i72/XW4DuRtCDDUam4iQ9KIcRJCOIgf
	E/7KsR5xEUy/6eik0z3YPKXa5CUTQ/AdlbWXjAZbrw/HEdEnOxZgZrCipMPuKImDWseUVHtDtxAml
	mFMOkRBM60M0TOIY3HjzBNM3YMXTet8y0e29n4m2t8+7TiKZhLC/aLzqIvS3QJU9XduERQPI3IUEQ
	GTghoZ6Q==;
Received: from ip6-localhost ([::1]:39256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxRf-00D9on-D5; Tue, 25 Nov 2025 18:07:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15272) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLf-00D7sg-Bm
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:01:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Ot/g2X2p3USxlU4/6ctFi0yjrKOMYk59FL1Ot5hIGbY=; b=xu8kQoUCm+H56q0NMfFfp59Th7
 M7Mbaw5yY8y5E1OGQvcnMmkfeiLdSjhAMhXDb0bJ2dYvQPxUuAaHLDA4s8jm35NKRrD1yVmtHQ1dG
 kD6pKSIcX7PJTwt3QoDHuuVe2CgyqYwAD533on4XI1wG0wprxlaV0fkhTXyKlxeDx9snzt41Y2wcQ
 8euiko+r7z6njQVCfSG+8i5IxCawZHUWHwWfTCOGusdu0m8vVrgCr8okyqp95reMt6JjQyBJwqJN3
 6NhME6E5pd5MYL52kDApeVBS2homXLWBf04SXF26ukoW4F5Py+W/IG2TzWLDo02aMy3IWvD+kDlOA
 rO/eiu0mhlebLEgp0xnVJmhVo3TuAgFIe9GKnor9Q2uelvWWIAzFxopO+u3Nc3CyXiq66+ggvq8SH
 CDkfan0dK7ExvMGx6SCSWO3FjPJiJEWr8y5cB4hww3EpBQnMVQKuJ7c3YhAN+nRSCuNCHMmjRiYD+
 zR2HxiTJphD8WSegjQu1NBy6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxLX-00Fd7s-2w; Tue, 25 Nov 2025 18:01:00 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 042/145] smb: smbdirect: introduce
 smbdirect_connection_grant_recv_credits()
Date: Tue, 25 Nov 2025 18:54:48 +0100
Message-ID: <5cd8c3c57d16740da9de79b93b56177fbdc9272e.1764091285.git.metze@samba.org>
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

This is a copy of manage_credits_prior_sending() in the server.

It is very similar to manage_credits_prior_sending() in the
client, the only difference is that
atomic_add(new_credits, &sc->recv_io.credits.count) is done
in the caller there.

It will replace both versions in future.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 .../common/smbdirect/smbdirect_connection.c   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 71d2ee4030a2..6dce0f0c126a 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -704,6 +704,26 @@ static void smbdirect_connection_idle_timer_work(struct work_struct *work)
 	queue_work(sc->workqueue, &sc->idle.immediate_work);
 }
 
+__maybe_unused /* this is temporary while this file is included in others */
+static u16 smbdirect_connection_grant_recv_credits(struct smbdirect_socket *sc)
+{
+	u16 new_credits;
+
+	if (atomic_read(&sc->recv_io.credits.count) >= sc->recv_io.credits.target)
+		return 0;
+
+	new_credits = atomic_read(&sc->recv_io.posted.count);
+	if (new_credits == 0)
+		return 0;
+
+	new_credits -= atomic_read(&sc->recv_io.credits.count);
+	if (new_credits <= 0)
+		return 0;
+
+	atomic_add(new_credits, &sc->recv_io.credits.count);
+	return new_credits;
+}
+
 __maybe_unused /* this is temporary while this file is included in others */
 static void smbdirect_connection_send_io_done(struct ib_cq *cq, struct ib_wc *wc)
 {
-- 
2.43.0


