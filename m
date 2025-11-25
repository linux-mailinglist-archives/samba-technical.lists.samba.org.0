Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE3BC86669
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MV47yqJjczDICxGmwqAcKHKQQ8LAkQswBHeMLwVNCn8=; b=rqTJaX6uAZnWjJvsEVwRp1U664
	NlaqDaMK/DQgkFUleOLQtf0L3nBJJzuuTrQ3/FypS/ycGdSucyxm4gqIiV5xVlN+Uu2wgD3yGuyHN
	0jAHLPZTS4VKXk5dQrJlu8X5kFuyYWjIuCn5Bjy42GcMmqpc9rolkyQKzn5B7fo7KyGNOXqdn5Gy0
	ZOSCk98wGtdFVMZSVUDsR4Rc0LcfRmMZPxFJb1eTYOi7uDVnl92Tgq5hBsNgwMDI/IVTWYv/jTBvF
	SPAZSFJG6mnuONs6jCsn1U07OwkmOW/eV40vnBNHUDyokgsIQGtDxx0qsFXx0ZtbJcxpIoee4BDxv
	up+0CWmQ==;
Received: from ip6-localhost ([::1]:24530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxM1-00D7uB-QH; Tue, 25 Nov 2025 18:01:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64204) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJE-00D74b-TB
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=MV47yqJjczDICxGmwqAcKHKQQ8LAkQswBHeMLwVNCn8=; b=BQgk0gM/dAvbotZ/W5oXpHIghU
 OClA/Dmvryqe/2BHlh1G9yVideYk9g3kCpLxYpoDQOVTrGWQgfA7NOTgpfRZHQwvoyUKW4fvcj8QR
 zHzqdpEe1h5VthM1CR3rImf0jmc2n4+3kii7iJk1dDTSwZDsQOX3tcfXBH2i6UEYrccJcd7D3kheO
 vrUJavfy8G0XrY64A+VkmIkH1oZ/b3yJJjL8fWykYQ0I6AIgHRVZUjz5RhRrNEFKuYhOI7Sq0ixY2
 4Yz5YjTiAUbaE/5Qi+SRnmVOY3S+vaBFjBN677uWg94ShDHscqBNm10+bsx+SRI8VSClRjxYS/GE2
 DWdCNjFRi0PjsJ1DxIJj6v0vE4bgkPy2fkxGuL7bLxieaqf6NwTPycDxLpGKN0gOQHClJHF0ZUxlK
 yvmDRQT9Yhh0Lb6GMxJbaw9tFr+usNtQmU3CXw9nHnvk1Y1vJNSpWzBp/0Ta2h6Tp2OIh3FHGisAP
 FB6C+RrY9y6AEfbSMxTP1Ftp;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxJB-00FcmH-2P; Tue, 25 Nov 2025 17:58:33 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 019/145] smb: smbdirect: set SMBDIRECT_KEEPALIVE_NONE
 before disable_delayed_work(&sc->idle.timer_work); 
Date: Tue, 25 Nov 2025 18:54:25 +0100
Message-ID: <20871ac6c73e9a0eaad43f6ebe6bbe99d7e3d57e.1764091285.git.metze@samba.org>
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
 fs/smb/common/smbdirect/smbdirect_socket.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index 37b483d8203b..cd7192584820 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -106,6 +106,7 @@ static void __smbdirect_socket_schedule_cleanup(struct smbdirect_socket *sc,
 	disable_work(&sc->recv_io.posted.refill_work);
 	disable_work(&sc->mr_io.recovery_work);
 	disable_work(&sc->idle.immediate_work);
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
 	disable_delayed_work(&sc->idle.timer_work);
 
 	/*
@@ -206,6 +207,7 @@ static void smbdirect_socket_cleanup_work(struct work_struct *work)
 	disable_work(&sc->recv_io.posted.refill_work);
 	disable_work(&sc->mr_io.recovery_work);
 	disable_work(&sc->idle.immediate_work);
+	sc->idle.keepalive = SMBDIRECT_KEEPALIVE_NONE;
 	disable_delayed_work(&sc->idle.timer_work);
 
 	/*
-- 
2.43.0


