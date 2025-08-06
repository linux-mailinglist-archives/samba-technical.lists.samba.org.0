Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2EFB1CB01
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 19:37:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=OqiquKw8uRrBjet7no24r9z4f5vNNHYmqJ8s33/fcSU=; b=Bh99X0fMHpx3xruhBscCiYzfPo
	tHdXyWZfcbsjeEIHfE3tEoXFsXcDXcUIqrQGsAq3flz1yxD0b+ANSeawmIBx+N9aYHCI6BHaX6oLN
	XND/TZ8iOVTCv+UpqrJR8aaoqZHxbNwC8JeNqr237ZWYtuwuVuO28KBIi8kYRMxD55EhBpnYU+g1d
	gQfnmzDztIj52ChXW2zr9PNXzx1SHSl7yxPVQgKEoxk59eBrS532d2+8gZLWQHYZD5bDqJspFyRUK
	2Zhh8tWbhhoMrjIgOVxsYFtH4VhG0cbDL5U+Isi10dDyNj1xgTMWRc6//m6OTsC2BV4Oak3n9r4q6
	MA6HA9+w==;
Received: from ip6-localhost ([::1]:52650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uji44-00EROQ-97; Wed, 06 Aug 2025 17:36:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55524) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji3z-00ERNs-FK
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 17:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=OqiquKw8uRrBjet7no24r9z4f5vNNHYmqJ8s33/fcSU=; b=I7A4qYI+1sX1rgGvaj7BNwA6KN
 nZR3Yq6kASGwK+xjJNs7VVbd99aJzFoUYzBI12SytHHERcQAOPtQ0ezgK4r6j4yG5sA+Bl6ao9tZn
 2zAn/ey+NNgLNZ8lrCZpBRaMa7ORF+mfSBfwNNaNq50lpySOdXW3UJmdx8CSKuLQPstB9Kt40tPTD
 cBtabooGaiPr7domRfWyB2Yd7es30DY0Pj0Z2L1j5ORN1ttev8Q90ERq6Bm4rVrhFo5RtEUKqJ7g3
 +DJv8fP9wfM9PIZTOFKpaB/43rxraBkun3vWyiesGRoCzvZTTToRjzA0B5I53b3mAutzov2J4XXwV
 nYA7LA5FfELbz1Q3BezrzH916K3LGjG8h6FuryQwMybJs7FwNK4EGNmcG2PUBumc5eqrWGsDd9YHi
 HX+HxK8oOcWurVIUULr2GbnJReDaRlExxH4WmU+RDe7z9OcntptTt16W0ekqkgxSWXip1V7lE8+E4
 9Xjfjn+2up3uoihv0R6Jtqeq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uji3y-001OX9-0O; Wed, 06 Aug 2025 17:36:30 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH 02/18] smb: smbdirect: add SMBDIRECT_RECV_IO_MAX_SGE
Date: Wed,  6 Aug 2025 19:35:48 +0200
Message-ID: <cab6668f747df91f0e8b6225f4ad75b8a790696e.1754501401.git.metze@samba.org>
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
 Tom Talpey <tom@talpey.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This will allow the client and server specific defines to be
replaced.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_socket.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.h b/fs/smb/common/smbdirect/smbdirect_socket.h
index 3ae834ca3af1..7270fcee1048 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.h
+++ b/fs/smb/common/smbdirect/smbdirect_socket.h
@@ -92,6 +92,13 @@ struct smbdirect_socket {
 struct smbdirect_recv_io {
 	struct smbdirect_socket *socket;
 	struct ib_cqe cqe;
+
+	/*
+	 * For now we only use a single SGE
+	 * as we have just one large buffer
+	 * per posted recv.
+	 */
+#define SMBDIRECT_RECV_IO_MAX_SGE 1
 	struct ib_sge sge;
 
 	/* Link to free or reassembly list */
-- 
2.43.0


