Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 106AEB1ED47
	for <lists+samba-technical@lfdr.de>; Fri,  8 Aug 2025 18:50:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=F3hwMFbPa1YtwtrilJjOweE62A0mW4eEN+pLyw+biTU=; b=TBcj2sogBIbPeneleehn+QxzBS
	2kxBoAmgrSLCOi72LvNUI6Vv4JJTVRz+vJEZ90N8AsWVDyPXw8LirlT0un7Gx2HWAwZ5cf+0ZmYe3
	8wnwV2V5CGndTC/awBQj6HynYn415usc5qICUD58mAd1NmBWYS9qmVF34XgZpraZSgk5AoVGlQxyv
	6NJubTS3sS6vw5d+QAlYRisiLkEUTrE2Aoi2LXL/3PQlyBS2ezrLVvRlJw0v7EVMLcO9luVHr+ESa
	2H2CEwHYnt87GkvMQMrAdX8S7w1Uo2NiCqxWxvoT47LRZZbp9OzYnfDMFCWf12pZoVocDjsBoYXbF
	82n7Fk8A==;
Received: from ip6-localhost ([::1]:49928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ukQI9-00EiLJ-2D; Fri, 08 Aug 2025 16:50:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56504) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQHV-00Ei7G-Cp
 for samba-technical@lists.samba.org; Fri, 08 Aug 2025 16:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=F3hwMFbPa1YtwtrilJjOweE62A0mW4eEN+pLyw+biTU=; b=ivQVDG70ajdJIf8ktcwGvnN1TH
 h61HCT4Doamd04inMUB11zX26bDcCgJTbXsiqtWph8IZTfxt6CheaxXvnQJf8N4+Z/3AS7WVr93cl
 +/3xhaAoQWExsXqeF/Io9PSSXlgXTrljGjflcPCjXME3TH+SnmcTMLD/AIS1ws6Fuq3gHyag2TKeC
 /SGa6AgcxUaujhSTjk7CLBkr6BQrtrJmbAmJ30GSrmqtF18ENOO08kgICqiLD5mjFLJAqQLtVNr63
 LFZ9XeW7kSfmwrX64xsouwBp4HIf9EbcvWD5s+VCNtQCklrWRzMazO2X88sMerLewW2I7QxZ4fNog
 c1B3QR768sSgdrgAQ/5mOyPJU40R4bLOV+1nK8sCkAck4Wnkma0kYZij4NWkUiFaeHVx8kJNbqPb3
 wVWUK/7uJuSZwFv7JjIvGpbDLFWF8RKGsj+iRaEHZiUkLzl+kkqyPL/TaajZvUj7pHXlSqS/cttPe
 etYUgmJ8QUvfrYMFOtIErQXv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ukQHS-001qV1-2n; Fri, 08 Aug 2025 16:49:23 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v3 8/9] smb: smbdirect: introduce smbdirect_socket.status_wait
Date: Fri,  8 Aug 2025 18:48:16 +0200
Message-ID: <0f1d3a0d282c9f053e8c0baf9f86d4ba13d3d02e.1754671444.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1754671444.git.metze@samba.org>
References: <cover.1754671444.git.metze@samba.org>
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


