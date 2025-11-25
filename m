Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6721BC86A60
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:33:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=W+IAS/M++2SUukq5MCo9uXhik4htSU8p4LSIQJET+ZA=; b=GuSePUDK/uOlVmdGJb+wK1+wjK
	oRXnJR6CKwcQxS1jhcPpmaaSOAy5HIMz3Y7ihh3r8fXtIlpYxc/hGNw+rGfYEvobHJ2+lAS6Fe+VO
	AwOcG1TlpfK2GM5ymagl7hcgzAK9LtFwAqDHr1ep/WVYIX/bgihlb3hurYwFyqYpCZ7iFA/8pACzZ
	Pv6zoH2B7ZGkJTDOdDkxNnXmLI3JBfjU33SpwqN5/PjtR07Wz4OlteE9gwVreEjpzyCpswWvolwoU
	T8sTH4/LlcKEVrUKeoSvfIcnvymE/o727eKXPCboKQrK6CihGS2eFl1GD5LIEN6I6c8Z4eDSfKRX/
	o4B23F7w==;
Received: from ip6-localhost ([::1]:60332 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxqy-00DGkh-Pz; Tue, 25 Nov 2025 18:33:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45298) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxqL-00DGfk-Af
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=W+IAS/M++2SUukq5MCo9uXhik4htSU8p4LSIQJET+ZA=; b=HLIUcsoYkUPbnYVT+WRMllN8MU
 w5+j++7h/px2nyHMYZWjjAeku4go6SXmdi/HH7ZFwBi+9y/3QlKU+6H7dI92A+ZKRxIeFFiUK7i0R
 3q9eCrGVaPvClEbOSP53SMjUYWb2Ze9IG+7482Cm6Lik7zHS26AXCMW8WYZQ/82dBDUifKjGdmKDd
 4Od92xIc9GB5/RygCrde9+dZyIKO4PkzeiRmwtpWs2Qc8psGU3gltRCoc1gxYElv6TZmL53lfJBu8
 aQ7MGsr6HVXT4dkAc3fH6WgFIknws9LGD20UTquiMDGBcCL0JmdaVyVRcNQ2vUkBeNOQT8T4clrCN
 YMTQXfrvbm48FSkBkwAVR8pJQsPvf/YH1eE5hRGtN0PSCH5ZlKRy/3H4WjFYVKAOCcqgbM4bv69o7
 wITJfeZFRZl+cCUBRlBRPy3vzQUGHyZQ9YEx5/6kBuUXjqFDiuOGPEB4Zo32s0jQd5GMcUltGXPKu
 jJhf9xZSXHnX6fVRH+E5GCYI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxmn-00Fftf-2J; Tue, 25 Nov 2025 18:29:10 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 137/145] smb: smbdirect: introduce global workqueues
Date: Tue, 25 Nov 2025 18:56:23 +0100
Message-ID: <0f0acfb64b66899ca68dc98fd3a2f4eb1fc91253.1764091285.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

These will be used in future and callers should no
longer use smbdirect_socket_set_custom_workqueue().

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_internal.h |  9 +++
 fs/smb/common/smbdirect/smbdirect_main.c     | 76 +++++++++++++++++++-
 fs/smb/common/smbdirect/smbdirect_socket.h   |  9 ++-
 3 files changed, 90 insertions(+), 4 deletions(-)

diff --git a/fs/smb/common/smbdirect/smbdirect_internal.h b/fs/smb/common/smbdirect/smbdirect_internal.h
index eecc8f6b197b..4cb5c8f07e8c 100644
--- a/fs/smb/common/smbdirect/smbdirect_internal.h
+++ b/fs/smb/common/smbdirect/smbdirect_internal.h
@@ -19,6 +19,15 @@
 
 struct smbdirect_module_state {
 	struct mutex mutex;
+
+	struct {
+		struct workqueue_struct *accept;
+		struct workqueue_struct *connect;
+		struct workqueue_struct *idle;
+		struct workqueue_struct *refill;
+		struct workqueue_struct *immediate;
+		struct workqueue_struct *cleanup;
+	} workqueues;
 };
 
 extern struct smbdirect_module_state smbdirect_globals;
diff --git a/fs/smb/common/smbdirect/smbdirect_main.c b/fs/smb/common/smbdirect/smbdirect_main.c
index c61ae8d7f4f0..12436e73b51e 100644
--- a/fs/smb/common/smbdirect/smbdirect_main.c
+++ b/fs/smb/common/smbdirect/smbdirect_main.c
@@ -12,14 +12,81 @@ struct smbdirect_module_state smbdirect_globals = {
 
 static __init int smbdirect_module_init(void)
 {
+	int ret = -ENOMEM;
+
 	pr_notice("subsystem loading...\n");
 	mutex_lock(&smbdirect_globals.mutex);
 
-	/* TODO... */
+	smbdirect_globals.workqueues.accept = alloc_workqueue("smbdirect-accept",
+							      WQ_SYSFS |
+							      WQ_PERCPU |
+							      WQ_POWER_EFFICIENT,
+							      0);
+	if (smbdirect_globals.workqueues.accept == NULL)
+		goto alloc_accept_wq_failed;
+
+	smbdirect_globals.workqueues.connect = alloc_workqueue("smbdirect-connect",
+							       WQ_SYSFS |
+							       WQ_PERCPU |
+							       WQ_POWER_EFFICIENT,
+							       0);
+	if (smbdirect_globals.workqueues.connect == NULL)
+		goto alloc_connect_wq_failed;
+
+	smbdirect_globals.workqueues.idle = alloc_workqueue("smbdirect-idle",
+							    WQ_SYSFS |
+							    WQ_PERCPU |
+							    WQ_POWER_EFFICIENT,
+							    0);
+	if (smbdirect_globals.workqueues.idle == NULL)
+		goto alloc_idle_wq_failed;
+
+	smbdirect_globals.workqueues.refill = alloc_workqueue("smbdirect-refill",
+							      WQ_HIGHPRI |
+							      WQ_SYSFS |
+							      WQ_PERCPU |
+							      WQ_POWER_EFFICIENT,
+							      0);
+	if (smbdirect_globals.workqueues.refill == NULL)
+		goto alloc_refill_wq_failed;
+
+	smbdirect_globals.workqueues.immediate = alloc_workqueue("smbdirect-immediate",
+								 WQ_HIGHPRI |
+								 WQ_SYSFS |
+								 WQ_PERCPU |
+								 WQ_POWER_EFFICIENT,
+								 0);
+	if (smbdirect_globals.workqueues.immediate == NULL)
+		goto alloc_immediate_wq_failed;
+
+	smbdirect_globals.workqueues.cleanup = alloc_workqueue("smbdirect-cleanup",
+							       WQ_MEM_RECLAIM |
+							       WQ_HIGHPRI |
+							       WQ_SYSFS |
+							       WQ_PERCPU |
+							       WQ_POWER_EFFICIENT,
+							       0);
+	if (smbdirect_globals.workqueues.cleanup == NULL)
+		goto alloc_cleanup_wq_failed;
 
 	mutex_unlock(&smbdirect_globals.mutex);
 	pr_notice("subsystem loaded\n");
 	return 0;
+
+alloc_cleanup_wq_failed:
+	destroy_workqueue(smbdirect_globals.workqueues.immediate);
+alloc_immediate_wq_failed:
+	destroy_workqueue(smbdirect_globals.workqueues.refill);
+alloc_refill_wq_failed:
+	destroy_workqueue(smbdirect_globals.workqueues.idle);
+alloc_idle_wq_failed:
+	destroy_workqueue(smbdirect_globals.workqueues.connect);
+alloc_connect_wq_failed:
+	destroy_workqueue(smbdirect_globals.workqueues.accept);
+alloc_accept_wq_failed:
+	mutex_unlock(&smbdirect_globals.mutex);
+	pr_crit("failed to loaded: %d (%s)\n", ret, errname(ret));
+	return ret;
 }
 
 static __exit void smbdirect_module_exit(void)
@@ -27,7 +94,12 @@ static __exit void smbdirect_module_exit(void)
 	pr_notice("subsystem unloading...\n");
 	mutex_lock(&smbdirect_globals.mutex);
 
-	/* TODO... */
+	destroy_workqueue(smbdirect_globals.workqueues.accept);
+	destroy_workqueue(smbdirect_globals.workqueues.connect);
+	destroy_workqueue(smbdirect_globals.workqueues.idle);
+	destroy_workqueue(smbdirect_globals.workqueues.refill);
+	destroy_workqueue(smbdirect_globals.workqueues.immediate);
+	destroy_workqueue(smbdirect_globals.workqueues.cleanup);
 
 	mutex_unlock(&smbdirect_globals.mutex);
 	pr_notice("subsystem unloaded\n");
diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index b3769be07df0..beb318463a68 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -108,8 +108,6 @@ struct smbdirect_socket {
 	/*
 	 * This points to the workqueues to
 	 * be used for this socket.
-	 * It can be per socket (on the client)
-	 * or point to a global workqueue (on the server)
 	 */
 	struct {
 		struct workqueue_struct *accept;
@@ -520,6 +518,13 @@ static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
 
 	init_waitqueue_head(&sc->status_wait);
 
+	sc->workqueues.accept = smbdirect_globals.workqueues.accept;
+	sc->workqueues.connect = smbdirect_globals.workqueues.connect;
+	sc->workqueues.idle = smbdirect_globals.workqueues.idle;
+	sc->workqueues.refill = smbdirect_globals.workqueues.refill;
+	sc->workqueues.immediate = smbdirect_globals.workqueues.immediate;
+	sc->workqueues.cleanup = smbdirect_globals.workqueues.cleanup;
+
 	INIT_WORK(&sc->disconnect_work, __smbdirect_socket_disabled_work);
 	disable_work_sync(&sc->disconnect_work);
 
-- 
2.43.0


