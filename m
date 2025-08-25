Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D52B34C3C
	for <lists+samba-technical@lfdr.de>; Mon, 25 Aug 2025 22:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=rbD3qqKFpVGj4OvRRovKjGAmNbVTuNF62y5SdbCMCV0=; b=3e4LScoYFrBthv7triaA6GX+m/
	lqRYI9drgIU9jYijZLtPpaVHpf0ih8aF/iI1uUhceHScUCZWWN5lIrawQdpotxy9yxll68Bp5CroJ
	cXUgCGWoE9ch+LawSUQiwXAUymNZhLONqs4Sm37Mcx49LAig0JHCrEKvZEB6x77XFI66VJAittcPc
	I6LRYaiJgl0GPNubHsAthX9mZTBfCI2RMqy5IKQaTKBU3tmZ2usXv+K8xIeSZAIRbrvx0zsBIZfT6
	8800k83W3h3xyoSr8SQ4Zi4inEbvhANsTmM8lqXPL2lHfn1Nbe+ixlyQtCN4q8cUTkXNVSvSmU2qk
	jAaLvyoQ==;
Received: from ip6-localhost ([::1]:36144 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uqe1f-000LN0-3g; Mon, 25 Aug 2025 20:42:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45704) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1P-000LLB-Np
 for samba-technical@lists.samba.org; Mon, 25 Aug 2025 20:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=rbD3qqKFpVGj4OvRRovKjGAmNbVTuNF62y5SdbCMCV0=; b=bsLKnds9MOaNrG8OpO32GK/8eR
 fybQuOfrix6mK87D6o0DJqDCox7i+GHaAVooRrrubiqZXdUz7sxSSsulgbE8L7mr0+z2cwEDokdjD
 y3PQKiCtAHE/9VKz28G0suV2odfNH2H0SUlfyG79cIa0k+imzReKhI4feEM9UDnaaTGKHrH9weRe4
 SdjFZJLgLD/Ao9oVWVOJkD+9F9Nv28WcFJHBLThw3zWrfd7M6RG/lY+NKlZOueewQ48r9/O/7yaEN
 JqIifuG0mr3MhWPOXyDMLjNGiGffqKj5CLEJPeypeKNBdS2lx1orhmZXK/vszo/Bn/d6+VbEVWQTI
 Lz8/PIiN0msgDw2jrwDKkzi04gBXTYa3sC/OvGzsWM1N3oWapDwX8OI5tCuzbdEBzZH1ZMhnlNp18
 ac8WWjc2eGuvEbvEe1HSNpOs35NkziB3XUlDKg2dR8TA72Sl5gPJIgUJgTXhOAtFDLIa+cXWrNgM/
 AyJT2uMdyxADBaWbpXVJtZo3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uqe1O-000jJY-36; Mon, 25 Aug 2025 20:42:31 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 003/142] smb: smbdirect: introduce
 smbdirect_socket.disconnect_work
Date: Mon, 25 Aug 2025 22:39:24 +0200
Message-ID: <12d40c225a8fa43705ebca7786faa25d341c5fbd.1756139607.git.metze@samba.org>
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

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 5c94e668b8ae..79eb99ba984e 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -20,6 +20,8 @@ struct smbdirect_socket {
 	enum smbdirect_socket_status status;
 	wait_queue_head_t status_wait;
 
+	struct work_struct disconnect_work;
+
 	/* RDMA related */
 	struct {
 		struct rdma_cm_id *cm_id;
-- 
2.43.0


