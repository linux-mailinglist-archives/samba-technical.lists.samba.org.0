Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC5DB8E772
	for <lists+samba-technical@lfdr.de>; Sun, 21 Sep 2025 23:48:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=bf+TrMOyPQbDKyj9ELLaPC6mkkrLSxRiQ7BfobwYfL0=; b=DNiyoZUDyuGV0tkB8gQ4xoCnv3
	KYjGDUtTtGMW5gXC/ydJyLx27hFQLRPBG4R5bfv9O3q3EIKtcuFm7W7OHg5rYQCT9XJEolBZR5hny
	Qw7lEh54/hhs+qvp4EjNJ/IxcEHrwXV+lwhGldvvG2/+9Do/itN4lxHvBaQAU+fMfbKXSa0Bk/CFr
	xne8ts8XNIkf/596qpwMtJjphvMb04twBE0jF5D8D7mCY0zBj9alxrzEaOfGEgDBYfkSeI1cHkEd1
	OU5EL9sQeTATe26O2QMWLy4x9RP/1TTOIkaq4D3TgxfGhAaMtkZDe6TwHHKUtyLoY6dEPO1VlZ6j/
	DNDt0bag==;
Received: from ip6-localhost ([::1]:47160 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0RvC-004TyH-N9; Sun, 21 Sep 2025 21:48:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37332) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rtv-004TXI-C3
 for samba-technical@lists.samba.org; Sun, 21 Sep 2025 21:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=bf+TrMOyPQbDKyj9ELLaPC6mkkrLSxRiQ7BfobwYfL0=; b=EnZH2J+E+XXb8O/R82Ds0AJ6Xk
 TOe1YOKvmJuYTWnofCTnVgr5S5WiUi0k5G1uGP0MFXu1U/jLMY1i0eJcCF8xbGkMVMX0JfF+xmmHo
 mc1geePXd2LLn2ivUZfmAfiDdlnz8X2lcZYG4Rl5/DfTeeodxBnpPI/9QWCz2bmi2f7MjMafD4VSv
 lJw6VasxNsyFjLIrb+BL8la8Zebs/YNiwu4ZZozqXaHWu/6H6CaQXcwA6LkgTsqgx6sfW8kc8lDoK
 T2MxPb9/Mb0vIWqhrR8Ox0l9qpzw64c+crJtCkgp3xkqie76OMrQ6SRt0EhoPS/W92YNh6TV2FZBF
 ipSBjFQhQeEnaF/pcwZn96EUIjbl/sbtDtKLcBB5Q9W2VDnEELpnY8mdNRiSdozCaztPSLmPkcvZx
 zJVc5zvBhcyGwA0REo2nvgz90nyTOxb50ELFZqZtcOtIuj4tT9brYVkbwccFd1h1U1zMNJ8m+JqUL
 aBqH/fT+TSqncn+c4bXCbVY4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0Rts-005Geu-1g; Sun, 21 Sep 2025 21:47:16 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 14/18] smb: server: let
 smb_direct_disconnect_rdma_connection() disable all work but disconnect_work
Date: Sun, 21 Sep 2025 23:45:01 +0200
Message-ID: <120a2b6e803489e0b96f1faabbbf1dae8f634572.1758489989.git.metze@samba.org>
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
Cc: metze@samba.org, Steve French <smfrench@gmail.com>,
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <stfrench@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

There's no point run these if we already know the connection
is broken.

Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/server/transport_rdma.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
index 44fa0af21b45..cd4398ae8b98 100644
--- a/fs/smb/server/transport_rdma.c
+++ b/fs/smb/server/transport_rdma.c
@@ -262,6 +262,15 @@ static void smb_direct_disconnect_rdma_work(struct work_struct *work)
 static void
 smb_direct_disconnect_rdma_connection(struct smbdirect_socket *sc)
 {
+	/*
+	 * make sure other work (than disconnect_work) is
+	 * not queued again but here we don't block and avoid
+	 * disable[_delayed]_work_sync()
+	 */
+	disable_work(&sc->recv_io.posted.refill_work);
+	disable_work(&sc->idle.immediate_work);
+	disable_delayed_work(&sc->idle.timer_work);
+
 	if (sc->first_error == 0)
 		sc->first_error = -ECONNABORTED;
 
-- 
2.43.0


