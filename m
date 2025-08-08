Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3FB1EBF8
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 17:30:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=F3hwMFbPa1YtwtrilJjOweE62A0mW4eEN+pLyw+biTU=; b=hLFvWuDlP7SmSrJeIODuIn0YeI
	F6yyJqzZ6COBjrFLWp/WXTO8Lg8vVv6zrnpQ2K13U0PMgLQw2aqKFkcxw19aCx37s9ufuavBBQLY8
	Iyu0PE6zG/6uUWizpLrZ28ezIR7NECrdJOidwpZ4gLihP3bUWwFENKmNa5JuG5OFLDboakT32wrIQ
	MMqsLg/9VvcUgQDhWV0cEgGtJJZtTsSW87xZwd8QjAov/RbPbspjOeD0DGI3dUUe/9lZqJwc/W54k
	aJuPqONhDJf4G+jiIFcHWUjmfiu51UcHbyId0nBcHDiOIWOeqjGH54WbsHHWnBlDHcufywlN5aUiy
	2P53dFtA==;
Received: from ip6-localhost ([::1]:58082 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukP2Z-00Egks-73; Fri, 08 Aug 2025 15:29:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57842) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1s-00EgV1-Mc
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 15:29:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=F3hwMFbPa1YtwtrilJjOweE62A0mW4eEN+pLyw+biTU=; b=JGK8aRfc/0mntGUDXeTJwd3cV9
 jExWDM++Wq03qeoHScG8Wi1EjBh+UnHMQAGhSwQ32Jd+X24Px9XFcGN73zquZML5nGLmJdJkcoXIl
 4BGJaRpwtQdlarHOmN49VNTvza9QOwqVaLbNe6cm1sYteAmruWcwr427gKVVX+SxUGTTLRzpYnymf
 IAb4Bv6E/+lErSCSAp3lmEeJkpbxHbE016Xsxrsg8o3iq8Fn9IBMosM7VPnI2H3Xt7A7yqBeLqnhK
 FaSAT03bAlH8Wc4i7N5W7Ak3cB2p+nbBsevMMLwq1ne8s2CzqdZLdokDZrqplgADPrYgQZRKCezbG
 Y7xRyYP/qVr2zvls+LTBjiWnnavGogBFatYgA1i198AttghmJBrRzhaq3apy9sn0Mrh1qowN9GvdS
 XxTzYo10vJkPzfGjCHGsQjtGqKtCtkYz06DL8ki/ZMySQBLW1eXaTgeMeDETCPQLjnfRZhBcQfWB0
 IzXooALLsmyr+NvXh2kRuXBz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukP1p-001pVS-19; Fri, 08 Aug 2025 15:29:09 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 8/9] smb: smbdirect: introduce smbdirect_socket.status_wait
Date: Fri,  8 Aug 2025 17:28:06 +0200
Message-ID: <5eeb36d56d96b9cadc746ff858c3303138e5f7a3.1754666549.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754666549.git.metze@samba.org>
References: <cover.1754666549.git.metze@samba.org>
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

This will be used by server and client soon.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index f43eabdd413d..aac4b040606b 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -28,6 +28,7 @@ enum smbdirect_socket_status {
 
 struct smbdirect_socket {
 	enum smbdirect_socket_status status;
+	wait_queue_head_t status_wait;
 
 	/* RDMA related */
 	struct {
-- 
2.43.0


