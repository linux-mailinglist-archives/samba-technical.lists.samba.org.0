Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB95B34C33
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:42:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=sz6yHpwvKEmIA+54vUxdZfhda39ILYhx4ggitLwtg0M=; b=gsJHMF0DwbjSdlbn38D4BoqDHk
	h4zf00SZhYbNWDh+otJwNRK7IzkRKzf2c2mVkY45mSgOUDcfZi8pa41ag2hVXxbEou66WkCuw0agN
	AEDjbhPzPo7pAoJcompBPJKdA//6FWRc4EmiB27jpNEfeHQktedIvMUsyBKX6ScPlgunUU3NT+tdk
	mpH9twqWRk5Be2slKc0AJ6SsOW7sMZ3pUq8CfPSKO+z+VkBh1MzM/WMfB8qFlb2ENTa1RlvKgwEAw
	UmKX4heAfeM8zI/gYu0QFQeSKeBzao+guZ5cMSvEZpN6oUjlrxe0rqIx1KgPPpAQKyLZgltgaxBLX
	Uwfbt3HA==;
Received: from ip6-localhost ([::1]:24948 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe1M-000LJ8-1f; Mon, 25 Aug 2025 20:42:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45694) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1H-000LIH-71
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=sz6yHpwvKEmIA+54vUxdZfhda39ILYhx4ggitLwtg0M=; b=xE5pl2njfSbYT/u0IsHP+gzYA/
 cKMiAP3S45cvzPIHy1e+h7rVD8vfh0x74TwSVLpdIVVGC2iGqnwmJKrvNHmkYY3590MYQtlwOZtde
 CHRAbUT9P87ti2e+CC4fvPnu1mu9PcSm5h+0ku45tiCYz3atoNx4GzoutLNGKjO2LssvfqSFMdfOB
 MOdYXBHUPvGAxOpwSnwUVhJH9SuwPRFJCSFqe7NP4XDdQDKGRhEsilcKj0Mqb+HJPlNmszFLKRv7H
 ZfN4/0ecQMCUdZPD4CqpDs38Nz3M4BtjxAaMP2vYWk9H1D0+RlDka9bOBn2XuFie+v6Pm3aSM5EQJ
 PhYwtldEDGPxc65mqmVBZxp6w5ygOUqdHOOoLOVeXK5d9I9jw6ULar4if4KdgFToiiKOyH/Mta0jM
 5rHBzW1bhWpMa9hWcZ6Up/HdfgTPnnzcdB8R8UOBUCQOetPxrDrBYF7Odurb+gFR6dDJz18RpcrFq
 VmUVMHDoOLrvJqiyomYKyQVP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1G-000jJK-1l; Mon, 25 Aug 2025 20:42:22 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 002/142] smb: smbdirect: introduce smbdirect_socket_init()
Date: Mon, 25 Aug 2025 22:39:23 +0200
Message-ID: <d7723fb1372fccfa3b54a9b8455fabbf9edf5174.1756139607.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756139607.git.metze@samba.org>
References: <cover.1756139607.git.metze@samba.org>
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

This will make it easier to keep the initialization
in a single place.

For now it's an __always_inline function as we only
share the header files. Once move to common functions
we'll have a dedicated smbdirect.ko that exports functions...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 80c3b712804c..5c94e668b8ae 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -113,6 +113,22 @@ struct smbdirect_socket {
 	} recv_io;
 };
 
+static __always_inline void smbdirect_socket_init(struct smbdirect_socket *sc)
+{
+	*sc = (struct smbdirect_socket) {
+		.status = SMBDIRECT_SOCKET_CREATED,
+	};
+
+	init_waitqueue_head(&sc->status_wait);
+
+	INIT_LIST_HEAD(&sc->recv_io.free.list);
+	spin_lock_init(&sc->recv_io.free.lock);
+
+	INIT_LIST_HEAD(&sc->recv_io.reassembly.list);
+	spin_lock_init(&sc->recv_io.reassembly.lock);
+	init_waitqueue_head(&sc->recv_io.reassembly.wait_queue);
+}
+
 struct smbdirect_send_io {
 	struct smbdirect_socket *socket;
 	struct ib_cqe cqe;
-- 
2.43.0


