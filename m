Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B45B1CB04
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:37:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=3Xh0XxQgw+1/sCdwmmCbDEz41xc3QfXDqGMzKOA3EFU=; b=5kt6yfZi4u/h2+vavzwCVky8EG
	DFLD1oOxx261vsRvRDM2G0jlgdI1J2k70uTy7BOwl7iAqtARhAAwBt8y6eQMEWzmPlEjDhEje7R0O
	pBnN1jKi6SV1KqFzmc4G3E1i0uG3qNc03HaeTOOFLEF1edqNoVAqew2LEWjEXSle+a1A/wYGMJ2sw
	EfcyrwtoSdwqv+DCrqp3wgfO45JgRobzxtClfLjooZLzE5oMz4u1c2Voe5vjR4yuw+X4TnkU8muIf
	akAozO29gczm9mk/sxOLFEveoxaiECEKVVGRawLkaMnc2lxWojPpmqjqy4I9kHbPnUoBygVSOxEH5
	OVQZbyBw==;
Received: from ip6-localhost ([::1]:52636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji3w-00ERNL-5o; Wed, 06 Aug 2025 17:36:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55518) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji3s-00ERMv-7x
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=3Xh0XxQgw+1/sCdwmmCbDEz41xc3QfXDqGMzKOA3EFU=; b=fSy7bkl/xafKM6u/cceCsiiUMU
 jBFbgerzvd4eTiMtjAbqoj9+pph/BXhr9YiPNEVAA8O6rT61SQYHB58TFs7YbN9nVfRVg4p9swDmG
 NY1sDrTtv5lp+g7CdUpBxeWVLBdzr1nk2d8emnbf+H11OF578K+9nFJpJ63rMQ2jwrzDoW58ESTQ0
 Xcmg3bLLQAfd8Ez8qlTx1b/WwDaWqxd3EsrFfXTkteAyZtCgt5YCecW27GvQSo/7cLDzMCAPUkyP6
 ahQ42kiuFbcNxfnd+mSyyj5jBtVegh2eE1gBcyZ1acOWjDwpEuMlhT0bPYaTUlK6aIOpUzY77WY57
 HGo3qEuqkoWPF39dH4YmWQAOuawh9TstSZDBMJl0q6LvJEPzHTPvWopVwtWBI8IzNGYRck1BXpM99
 WW4n4SiuBuwrUfQOV1EX0MzJzmrtf59Rz2zFN3Bk9rKoDzMYT/eC5l2/sWVIw5odZB54jS4b7I3FW
 1Rl8QqF530quMUQOAM79H97k;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji3r-001OWu-28; Wed, 06 Aug 2025 17:36:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 01/18] smb: client: remove unused enum smbd_connection_status
Date: Wed,  6 Aug 2025 19:35:47 +0200
Message-ID: <5a513c72a3ccbb3bd493b42d1912d5288693c165.1754501401.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754501401.git.metze@samba.org>
References: <cover.1754501401.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/client/smbdirect.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/fs/smb/client/smbdirect.h b/fs/smb/client/smbdirect.h
index 9df434f6bb8c..0463fde1bf26 100644
--- a/fs/smb/client/smbdirect.h
+++ b/fs/smb/client/smbdirect.h
@@ -33,16 +33,6 @@ enum keep_alive_status {
 	KEEP_ALIVE_SENT,
 };
 
-enum smbd_connection_status {
-	SMBD_CREATED,
-	SMBD_CONNECTING,
-	SMBD_CONNECTED,
-	SMBD_NEGOTIATE_FAILED,
-	SMBD_DISCONNECTING,
-	SMBD_DISCONNECTED,
-	SMBD_DESTROYED
-};
-
 /*
  * The context for the SMBDirect transport
  * Everything related to the transport is here. It has several logical parts
-- 
2.43.0


