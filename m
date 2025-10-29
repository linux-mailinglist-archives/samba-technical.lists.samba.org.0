Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2061DC1AA93
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:27:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=T3vjzA3huYTGlZnuztf4h2U2T+gDWn0Ta3XDGST01C0=; b=lyHiMw9A4rH8mPw+9p2rCiY7Qe
	dbu2a46FI68bWuDnwVhIOvFBdB3U7O3t0vJcF4favgZQFdYB57SvT+S1OLJ+2gEfrfAooRvrbviFc
	DViea4Ejdmswhc5izWrKVjfsgo0jepd7zXbFZwH555t8MIh+oO+c39Jb50orNxtMRO+iVWqQIX7ro
	oQenF92ymcx5jmgiNu1tr3Io2gwTBpDeA2qTJzZ7azlVySCQLS3OzPuoxqoP2djnFH9MR8w8Vmdgg
	u+3+KU+Uuyf/bzbDQtWaYqv/d5wVIPPLVtUGkLmexDEg2zn9envdANmyjlnsYLuAzb4MUpH4bkJf6
	gRBurj+A==;
Received: from ip6-localhost ([::1]:32336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6CT-0096Pb-FL; Wed, 29 Oct 2025 13:26:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21568) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69q-0095dq-Er
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=T3vjzA3huYTGlZnuztf4h2U2T+gDWn0Ta3XDGST01C0=; b=tDB+I9SS/SfiAZi81V8TzY+3yZ
 iaCHW+zdZnNebMMnnGM5j1nS9CnZxCKababMkrJucU0+iTjpfXyyfsCYJ3E3O+Grp529OM0/0gTxP
 ToSIWhSAmZs+DZ8yPvij2OXiCEds7WwFDk+s/VzfeL/KOrYUUT8EdKLj1lJvuj4gQxPCAcl4szbWs
 U9pR7wYkbhC+uMc2W8y6xRM9FniW+aVHnaIKYg1OXYHOU0D7/O153Ozk+4471aqRs5LG+UxuYXGUJ
 +AjNJ15KPMexTCFpEiHiEqQL9tnEGl3J+rJUm3+TwcRmlR6iDyRTFBSmccfT/pg/ZTQ1K3J4zSF8J
 /InPKm9IKlnw9A5hWP09JtQC6Em9Gg3f0nsRny1V1gNwNcMQNlXMJQhWvm6L5uhhg90MbPhMsyVlB
 hl3LoDI9nq+o2Sio0kJ1kTRxUN5U5q8hd5UJIbE+OfkrS65dUD2sRj4jPZPomMdxgfRAZBsQHdZor
 l1x9KTskEFmSDiwHkbY/0HVg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE69m-00BbRB-2B; Wed, 29 Oct 2025 13:24:06 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 016/127] smb: smbdirect: set SMBDIRECT_KEEPALIVE_NONE
 before disable_delayed_work(&sc->idle.timer_work); 
Date: Wed, 29 Oct 2025 14:19:54 +0100
Message-ID: <26043564f536fc7332f26e5e4dbbcd9ebaa250cc.1761742839.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, metze@samba.org,
 Steve French <smfrench@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This avoids a potential confusing log message from
smbdirect_connection_idle_timer_work() if it's already running.

This is a very small race windows and not really needed, but it feels
better when reading the code.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_connection.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 79be89a3946e..8d00a456c513 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -160,6 +160,7 @@ static void smbdirect_connection_schedule_disconnect(struct smbdirect_socket *sc
 	disable_work(&sc->recv_io.posted.refill_work);
 	disable_work(&sc->mr_io.recovery_work);
 	disable_work(&sc->idle.immediate_work);
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
 	disable_delayed_work(&sc->idle.timer_work);
 
 	if (sc->first_error == 0)
@@ -235,6 +236,7 @@ static void smbdirect_connection_disconnect_work(struct work_struct *work)
 	disable_work(&sc->recv_io.posted.refill_work);
 	disable_work(&sc->mr_io.recovery_work);
 	disable_work(&sc->idle.immediate_work);
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
 	disable_delayed_work(&sc->idle.timer_work);
 
 	if (sc->first_error == 0)
-- 
2.43.0


