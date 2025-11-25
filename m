Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0440FC865A0
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:58:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Op+S5bVdjI3q0kJR9LDywlYCBGb1n34imLxkNJ2rr/k=; b=Pj8eykHgz6F3F/T8PrqEQEFRwv
	w94DSpylc9znFkyPu/bxZ6GfXCPvWvUN3H/+HX1a4Yx6dHbvf840KllycJ/2aXUCwIfLAlkyQwRfa
	EVsp0L5mHy1fMGirTntVJGdUqRSX93BD1JW2BrEhGPUVYztgHmYn/Wu+32llupX20PcOCBchPc6xc
	bBH0KAe21ej8ty8DkQ2KBcfGe5G3gGRdEW4+qwFXVSMvHiW1rDuylz6tg/ju2Qo7UVLwfYT3XisvF
	74vHrlAzrv05Cm2jVVa+w8qlGGCB7+8Z/C6ddpjte+rLrGF96i4zGg9Aj1B/j1rTX/C9FjMoizXzw
	8vhj1sgg==;
Received: from ip6-localhost ([::1]:18034 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxIP-00D6di-ET; Tue, 25 Nov 2025 17:57:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61634) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHk-00D6aJ-SS
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Op+S5bVdjI3q0kJR9LDywlYCBGb1n34imLxkNJ2rr/k=; b=xhOHWsXB7erVFEh5F6u/3z2s8R
 YEJoJy3fq5dIsKuo0oAzNecQpi1h7lbOxrV5jwabNAGnHK9W+pKfqfEHwEQqRqDyAGop2XHTvZ+zz
 0s7W/nRZnLGOPpJ9fEN8UJJ+jpam+AWco9z7PN3p7Ndc9CBgpSEFi34UbzZhlBeqndYoxJUp9sbl1
 AAc4HpLZNzfIFTbvdESrDwV6UQ3tfMK4pPdlFFBIH7gKrmVdfbOlze+2SRoh1C0Rc1x+hB/4kQ2hC
 nfJqyaMS4GV8I0NjHzB2iYltgcTee5X+EJP1U9PWDCDZRvTRP6ZF1Cheqdxa19PpCAF18V7mem5GI
 IgA0JgYlec2Ja0G8BqXJlE6iosl09AGHgZuZX4OXoeQ7RDJvBBYqsx7pOZlWQ0CXJlxzff/dfzWuy
 nNN3MqeqNosRF1SKUN/Rl/+zhW0zfNa0HAXXayGzgl6j6Oc5rq0V/TDmnqM+Pnyn2sh0o1LcaxXyP
 6Mbq5gMipo2ToknGHiek8Tzn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxHj-00FcTw-00; Tue, 25 Nov 2025 17:57:03 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 004/145] smb: smbdirect: introduce
 smbdirect_recv_io.complex_work
Date: Tue, 25 Nov 2025 18:54:10 +0100
Message-ID: <a514dbaeac0c38c77f1107c90615e53e44f839f5.1764091285.git.metze@samba.org>
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

This will be used by client and server in order to implement
async connect/accept logic.

The problems is that ib_post_recv() completions can run
in an interrupt context, where we are not allowed to
sleep.

During the negotiation phase we need to do complex things
e.g. allocate memory, which might sleep, so we'll offload
this to the workqueue instead.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index cf8a16d3d895..ea269f55935d 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -631,6 +631,14 @@ struct smbdirect_recv_io {
 #define SMBDIRECT_RECV_IO_MAX_SGE 1
 	struct ib_sge sge;
 
+	/*
+	 * We may need to handle complex
+	 * work that might sleep and are
+	 * not allowed to run in an interrupt
+	 * context.
+	 */
+	struct work_struct complex_work;
+
 	/* Link to free or reassembly list */
 	struct list_head list;
 
-- 
2.43.0


