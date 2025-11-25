Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CAEC865FA
	for <lists+samba-technical@lfdr.de>; Tue, 25 Nov 2025 18:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=njbxxn/KwvlJ3DBgxw474uzlc7FEesNvYsndVO1Y2RQ=; b=tdZfEl+grFOplZN9/+OMgevs8D
	Boy8mhVzpKEQQpMWV179B6LZGMaI2g/w/SQBKHnht2vF4oSV1py5l4TVTiP21iGctVIzMH/d1cQ7c
	78iAYr1iioWAzuYauoQvNE9dUg3jgxFN/tNkD9KxbXROxpX1rOe0ZiEdiolQGXwLIThDJqkmIrvM9
	SOWottc3G4ZXd1UKO614gzCgaQ38vv23cj4n6PpjcccyWFDGm6X4xMP1Zm2Sbhp3NxZ95qZMpHPV6
	g7aw9crcH+2pR4jzeVIpSaTK3Z6s3ZGHBFALUcvvQSGWb7zkHRIjjDIWGOjK9q6Tw16qno09TkGbF
	61SaSvCA==;
Received: from ip6-localhost ([::1]:44758 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vNxK0-00D7Fu-0n; Tue, 25 Nov 2025 17:59:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53318) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIT-00D6ph-NA
 for samba-technical@lists.samba.org; Tue, 25 Nov 2025 17:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=njbxxn/KwvlJ3DBgxw474uzlc7FEesNvYsndVO1Y2RQ=; b=YsBhvy0Xx3XZvBNo9nEwsdlTV7
 26I0Eng2nrPeRboZYFjeqG1P4MokRYjirJUbi+sQTrlb1VQZh+qk7jEgs4KKegep7R/tp5/00Ql+L
 hYZYorXn+MeGJw/3eElHFWuGkJ2/j6lCof7msBRxsADniN6vfNG/V6kaWZKW13YOm68yRXB5RahcL
 Cm4aINJOz+JKSfXVz5tIK8fC3IrBpjnlS5SzlAoO8m0B2y6D4xTkhWmYvdGtEMSpzk6kytcxUE0+E
 izG9grjWWd7SpNgR2CiWWweqGFDcGPY7aluadwJdrgoFRwrIYvl7kZRV0Q/86eMnPjVpGOLZ6cozA
 URQ65QB9YfaBErSDyds1f6FUSacutabNj+qzzizzW5Bf1eJlFytS9r05VJjA4y/1akZA8Dp/D/2oo
 1Aw/uytCi5HXu70nWEJvKhpIjHXNaUbnKTTzU8ZyDJxN8Xh+Zu4iTurTY8I+lh2meCZOpJq5sD/Gx
 N+v0sNPGFafOASJP8tsX43uJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vNxIO-00Fcev-22; Tue, 25 Nov 2025 17:57:45 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v4 011/145] smb: smbdirect: introduce
 smbdirect_socket_set_logging()
Date: Tue, 25 Nov 2025 18:54:17 +0100
Message-ID: <576d7313b59f5e25455e193d78037e42d10a5191.1764091285.git.metze@samba.org>
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

This will be used by client and server in order to setup
their own logging functions.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/smb/common/smbdirect/smbdirect_socket.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_socket.c b/fs/smb/common/smbdirect/smbdirect_socket.c
index 421a5c2c705e..6c2732496cf7 100644
--- a/fs/smb/common/smbdirect/smbdirect_socket.c
+++ b/fs/smb/common/smbdirect/smbdirect_socket.c
@@ -24,3 +24,23 @@ static void smbdirect_socket_prepare_create(struct smbdirect_socket *sc,
 	 */
 	sc->workqueue = workqueue;
 }
+
+__maybe_unused /* this is temporary while this file is included in others */
+static void smbdirect_socket_set_logging(struct smbdirect_socket *sc,
+					 void *private_ptr,
+					 bool (*needed)(struct smbdirect_socket *sc,
+							void *private_ptr,
+							unsigned int lvl,
+							unsigned int cls),
+					 void (*vaprintf)(struct smbdirect_socket *sc,
+							  const char *func,
+							  unsigned int line,
+							  void *private_ptr,
+							  unsigned int lvl,
+							  unsigned int cls,
+							  struct va_format *vaf))
+{
+	sc->logging.private_ptr = private_ptr;
+	sc->logging.needed = needed;
+	sc->logging.vaprintf = vaprintf;
+}
-- 
2.43.0


