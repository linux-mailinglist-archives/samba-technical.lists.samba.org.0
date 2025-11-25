Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22827C866D5
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:05:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=xmmDMC0Amk5/s+6LR6nD0AkP0PL58sMD0MDxtu05kTk=; b=NzY7RSwAUcO5D18KaFMp9zaERY
	j8ztvt+bMgsLewtsyrH8EB6nGyXTyGN0nn8zUE1baEk6P8nT/sRXTabdKh8YxpOA/NcNRqlfx35iU
	DKkQn546i4uj69JUMDJmosi8gPTCPJMbbEtJtivr9OfGTwecg3Pjh6K3McTQdmr4G0SJBg7BF+Dxx
	NKKqi0K9MPqjDVoTeLGZjXcYCWEm4Z8GvqoZ+cn/K4SxDdHEy906+7dCI27DZIaRDLM0Z8KYXiz2q
	a0onZC+VJXqX+Q8EbBKgf94AYLpX30S9OMdQIaZztOgdp6cRu5/sHUsJJZ4VGo23lLZeEjOwXcJjT
	tXseHiNg==;
Received: from ip6-localhost ([::1]:31840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxPV-00D96G-Db; Tue, 25 Nov 2025 18:05:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58850) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKe-00D7Xo-3O
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:00:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=xmmDMC0Amk5/s+6LR6nD0AkP0PL58sMD0MDxtu05kTk=; b=BvunW+gldsVFMRy7F0rqMcZMjV
 pe/CSKhVoysobCjqiyGo04gqJqSlPapzrLDQ40XhCEgOiCldWqu45ZZEYzFbZO9BvVdkLx5vlOPGE
 lfykEt0TzmmYBz5ccMcfHTsA17pp5wUHJLDjo+0fmLldQjDLXN6WbPnosSGxC56Xf91b+QE4bLe9a
 zqZzp/nbAEqxX8yx2gsSETEeNEqwFx2UkkBEH1cC04GygPBQ3VjIwAh0F5QRW3tO1KQk/zg7LGVj1
 Ig4RtNQq4Xuhk5N47iUy53Vxp+eEKdJNUmDKc3G/PtWzBFyNxKk4LUUQfeN4/ZcRQy5rcPhQRxq0n
 78p5mWpJo1U/qg3xDdyJNAbnPMldpUXJE6FWNaf5mzdcXUv7kvsB/U7H99FswxkQYBGrzNHCG5SmS
 ZM+z7l4Zj4AJNX2pZUylSizHRQ0v/o66BuVwO0q8SlUOT+ncE0ZEeyvgEPhHVeCUaUPK/+ZhCvcyV
 iuXT6mQzVFoRddWauUy5ku0w;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKX-00Fczp-3B; Tue, 25 Nov 2025 17:59:58 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 033/145] smb: smbdirect: introduce
 smbdirect_socket_wait_for_credits()
Date: Tue, 25 Nov 2025 18:54:39 +0100
Message-ID: <2c1d666374bb4020e08f2054e94865dd8cbc5d12.1764091285.git.metze@samba.org>
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

This is a copy of wait_for_credits() in the server, which
will be replaced by this soon.

This will allow us to share more common code between client
and server soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_internal.h |  7 +++++
 fs/smb/common/smbdirect/smbdirect_socket.c   | 29 ++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_internal.h b/fs/smb/common/smbdirect/smbdirect_internal.h
index 7465a63118bd..43ef6e39f28e 100644
--- a/fs/smb/common/smbdirect/smbdirect_internal.h
+++ b/fs/smb/common/smbdirect/smbdirect_internal.h
@@ -33,6 +33,13 @@ static void __smbdirect_socket_schedule_cleanup(struct smbdirect_socket *sc,
 		__func__, __LINE__, __error, &__force_status); \
 } while (0)
 
+static int smbdirect_socket_wait_for_credits(struct smbdirect_socket *sc,
+					     enum smbdirect_socket_status expected_status,
+					     int unexpected_errno,
+					     wait_queue_head_t *waitq,
+					     atomic_t *total_credits,
+					     int needed);
+
 static void smbdirect_connection_idle_timer_work(struct work_struct *work);
 
 #endif /* __FS_SMB_COMMON_SMBDIRECT_INTERNAL_H__ */
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index c064cbcb6b5c..9093352d1a57 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -279,3 +279,32 @@ static void smbdirect_socket_cleanup_work(struct work_struct *work)
 	 */
 	smbdirect_socket_wake_up_all(sc);
 }
+
+__maybe_unused /* this is temporary while this file is included in others */
+static int smbdirect_socket_wait_for_credits(struct smbdirect_socket *sc,
+					     enum smbdirect_socket_status expected_status,
+					     int unexpected_errno,
+					     wait_queue_head_t *waitq,
+					     atomic_t *total_credits,
+					     int needed)
+{
+	int ret;
+
+	if (WARN_ON_ONCE(needed < 0))
+		return -EINVAL;
+
+	do {
+		if (atomic_sub_return(needed, total_credits) >= 0)
+			return 0;
+
+		atomic_add(needed, total_credits);
+		ret = wait_event_interruptible(*waitq,
+					       atomic_read(total_credits) >= needed ||
+					       sc->status != expected_status);
+
+		if (sc->status != expected_status)
+			return unexpected_errno;
+		else if (ret < 0)
+			return ret;
+	} while (true);
+}
-- 
2.43.0


