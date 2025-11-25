Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B9918C86831
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=O5TZrCEzx9fXdVqdrnYPrOkY2ZAOv0dCwnMvKH5CJac=; b=rw26+Qdyq/0uuBsU8TmENOOBT7
	mps5ahMsollxnETg0+tS0kjnBmrUgpS7LG1SpEZOAHjS3t7rR5tAl5XjM4sPAAtXHbkMQT3VhREHm
	JqIiSDP5VftK1SDRNiC43lzfcllfZ43LikcH6Nd6u+YdKePa1D1/3iugHy2CFXYDXmY1ITKkcG5a5
	eKTzktrZ9aL4mxgkyZxN3P4qjpiR/piEMPyGccmokVZL+dl6kGlaXU53sjfBQ25963PhutbINDLMG
	TEmfzk6Lgt4PUtx8BFgTzefpsSjFE9qeSYECOCMRbJxQNk5tUfcnzkl0dDFu+11Dlutl+S/AOBPHh
	LJIhUY1w==;
Received: from ip6-localhost ([::1]:24962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxX8-00DBaz-9D; Tue, 25 Nov 2025 18:12:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26952) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxQs-00D9bv-J8
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:06:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=O5TZrCEzx9fXdVqdrnYPrOkY2ZAOv0dCwnMvKH5CJac=; b=1B20a+Q00hW0FyKVoJS7PBsToi
 0ZaggpSRzuAzF0Fn2XCpFhgfO7sq4OjhA6Nzd2MgfsDRzlfqtOCLphX4ChnJDWeCR7x7N/Iat/PmC
 mCGbdSf4hC+bFhs2t8o+acCKQQlfC11xoay7hsyJlgJOfO1QWbonp4WA2EL/Q7detmegAv/AupQFD
 0lSOAfBs8chrEddpXWFcnO8CZJBBlc4j+goTG08jtwy3wY4N9kpwyRnoBuq4qwzj9oe0Tj1sQCsL+
 f/e0pjWmLNCe0Oia1ShGW3mA5HGKYeKspkT0GbrRUwph6nuKltVn5YVaqZACS6QDEiiRk8Q3hMKPU
 YF5bR4JDz4WH5EVh29be2lpRJmPF5Nhgcd5oQ0NzI3ClVkvT/ULHuYXu3uEEGlVqOBG9fGldhhJZz
 RM0fq1RbSGNsTeIr3QtD+VEI89VQywsxwQjU24oeqZUuQK8tKkueoZVZCBVj6RomL0bviNlVCkXwi
 JDDgfn+FGUEHD/+r851EmA0S;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxNu-00Fdbv-13; Tue, 25 Nov 2025 18:03:27 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 064/145] smb: client: let allocate_receive_buffers()
 initialize complex_work as disabled
Date: Tue, 25 Nov 2025 18:55:10 +0100
Message-ID: <09e1ec4a68cbfa5b6f3a6bf53cfed266cfc42576.1764091285.git.metze@samba.org>
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

smbdirect_recv_io.complex_work won't be used in client until
the end of the move to common functions, but common cleanup
code will call disable_work[_sync]() before that, so we
better initialize it now.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 4dae3d1eb93e..33f3cbc0bbd9 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -1543,6 +1543,8 @@ static int allocate_receive_buffers(struct smbdirect_socket *sc, int num_buf)
 
 		response->socket = sc;
 		response->sge.length = 0;
+		INIT_WORK(&response->complex_work, __smbdirect_socket_disabled_work);
+		disable_work_sync(&response->complex_work);
 		list_add_tail(&response->list, &sc->recv_io.free.list);
 	}
 
-- 
2.43.0


