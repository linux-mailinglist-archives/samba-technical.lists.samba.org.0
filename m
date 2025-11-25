Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DA72FC866D2
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 19:05:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Ouu9OqeY5hrf0ivd9FFmXgodcF2fguTRVOP0wBn9uE8=; b=k6rqcERga8tpIfkxtpetCF45ak
	iKJtkzSoXg1Xl66+Onm5PoQIcISkX+jibcL+7uLzY+tIARZ3CxroCeJLCzqk/XkBPI5ute+ZF3ieS
	LsAPr1vDLmMYAARPhr7/N1btDXcsnSz5+GFqcuEXBMt+iwICBRasKaLn9AFXkUqLEsiTOS5ccLC7e
	biz5imNtsUcFjuNrsH0KYmAwQZpdyWk1deLa9LAZB1oELNY6CD3mEn2NJpFjyQZevbCXoGvevty/z
	e+A/p2cqXJRVCkXkZHX9Nc6weHWFwSDOcj2aGhdvSAApx41ffo1nAJ1z/PyF+0rwM/Bs4B7K8lTVZ
	wa14mdTw==;
Received: from ip6-localhost ([::1]:30016 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxPI-00D92K-4m; Tue, 25 Nov 2025 18:04:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58844) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKV-00D7Un-Nm
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 18:00:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Ouu9OqeY5hrf0ivd9FFmXgodcF2fguTRVOP0wBn9uE8=; b=uEVKLodaYhAW6A6ooS7FwhM3Oj
 /AutBe7RsRW05izeTbZYBjiXhFMFkNKL9Bj4TcPkqDwgT9KxnVla17a+PKecLQNPeLlrP3Gbot54L
 YjwacfqHqs6t7dGabUGOQy0+N4KXhXCOKGA/9VAW/uSRlrIoyqTwoS/TeHGAoN8WB2UE/uMsizNG9
 VnKckRIv7rItmkbsfSkss+n+Yz9zzv2ObRna1+TQKZWaU9nC2OxpNnUjiDmQjmWzEYJBAUwqgK++P
 kkXdWOywEUdzS141tx9A0Gsf69QitNVelAfPFXnl9ym72dT4XpAzzialglw1tq2d31oREmpzmB1Qn
 8QaoL/yZEUmf5gITxLS1zU3FImz6YbHK5e4o2vfvFkgl1wRVapW20afR5iLDQGzgFBbypzZ3jgh8D
 DeocXkJFy7haJKloxoB317xcYzlDuxlYqjRE9fU4pS8VzoSVJcfrbmEuslCaSyyefJI3L7hWsroY2
 /81Z/7NEQHkZZ39vnQYWav07;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxKR-00Fcyu-0j; Tue, 25 Nov 2025 17:59:51 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 032/145] smb: smbdirect: introduce
 smbdirect_get_buf_page_count()
Date: Tue, 25 Nov 2025 18:54:38 +0100
Message-ID: <379a160360afef2a77e9dab9d45723e077a1ab10.1764091285.git.metze@samba.org>
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

This is a copy of get_buf_page_count() in the server
and will replace it soon.

The only difference is that we now use size_t instead
of int.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 66582847530c..3a10e688a762 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -712,4 +712,10 @@ struct smbdirect_rw_io {
 	struct scatterlist sg_list[];
 };
 
+static inline size_t smbdirect_get_buf_page_count(const void *buf, size_t size)
+{
+	return DIV_ROUND_UP((uintptr_t)buf + size, PAGE_SIZE) -
+		(uintptr_t)buf / PAGE_SIZE;
+}
+
 #endif /* __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_SOCKET_H__ */
-- 
2.43.0


