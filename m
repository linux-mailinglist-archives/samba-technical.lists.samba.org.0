Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AEEC1ABD2
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:35:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=5SnSj2eQcuRm+P36UsJW55o8k1/pIVpEPVCSUniMkoE=; b=Yx7tlKFr5i0MJtTowTxOujMNqg
	k1YSNSGYmVDz2BuLQczT52Q9M/sZ0ks+zsIxXfLAaT2lAq0eLpFblM7cxkdSIITTrGPv5Iwi5aoPC
	M8NystvFuCzalAQzLjfX9yz8QiySwFW7CkobmMbMp7gITeJoupV3Bo/pf9bLwMO2UD+A/T69KjoIs
	WZfFjNpDI1gJegT/uUIZQV6/veq/x76UdWMdIT99vI6j7WjSLtI150lCs/Y/T+VHI9aMwRbB5GpjM
	RxrHo+tQ73wO987zCYV5ecIpq2hF6clBiLga8jMUVblIfcVybg7zWhDw7XwDYgTB0MnO0IW0Xb4M5
	FdwQec4g==;
Received: from ip6-localhost ([::1]:26092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6KG-0098zV-Qn; Wed, 29 Oct 2025 13:34:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50426) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ck-0096Ys-JU
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=5SnSj2eQcuRm+P36UsJW55o8k1/pIVpEPVCSUniMkoE=; b=uzLCT5KOlSxl8xex2LIczxlqoh
 qSNTvQG39dPwguPVEyu+8IqnpIzCaFfTI3QKjbifvmUrrurItOcwzAv1OhEQiKIDvIwhVNlHq/PSS
 86z9ffC0MrjlsMlYu7mlU4OeVZuOiCsgpp5TZL1UiNdCEdatfNCIurFIYPiI9Rkv1Jbx6oKZBQh4z
 foFjCi9X8Q+d0hfO1oSqeJRlf9hul3YOggMGCtYN51oLBqSkNAie+fwCuqByxN574tgp1vrvAM+5q
 W1P9Sj1UixcyFbIuUWOh3MD5vOSIXtg6EgbQCGpyPYkVccUQDPKD/Wo59cGG7Npynws40cjbHnexS
 mX2J9+xRGmxNzSEscZ/fNkafbfKA/HxPTzERBvpf69hOG1akbRJoILJtTUpQ409Jzmzate3aaQhDN
 LqA8ugITrkBn2iyE4/8EaJzpBOhFFB+ZY9NRPP38AhrOb9n92hpdp6AxtrtIWbhjIShuRPs8hMOID
 miLlHg622Gr6H8inNFUJA2Fs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6Ci-00BbtV-1X; Wed, 29 Oct 2025 13:27:08 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 047/127] smb: smbdirect: introduce
 smbdirect_connection_is_connected()
Date: Wed, 29 Oct 2025 14:20:25 +0100
Message-ID: <28f7953cda95a9162ec7ae7ac146959f77e103d4.1761742839.git.metze@samba.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761742839.git.metze@samba.org>
References: <cover.1761742839.git.metze@samba.org>
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

This is a simple way to check is the connection is still ok
without the need to know internals of struct smbdirect_socket.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_connection.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_connection.c b/fs/smb/common/smbdirect/smbdirect_connection.c
index 858b071ba1bb..1487efbe7620 100644
--- a/fs/smb/common/smbdirect/smbdirect_connection.c
+++ b/fs/smb/common/smbdirect/smbdirect_connection.c
@@ -900,6 +900,14 @@ static void smbdirect_connection_disconnect_work(struct work_struct *work)
 	smbdirect_connection_wake_up_all(sc);
 }
 
+__maybe_unused /* this is temporary while this file is included in orders */
+static bool smbdirect_connection_is_connected(struct smbdirect_socket *sc)
+{
+	if (unlikely(!sc || sc->first_error || sc->status != SMBDIRECT_SOCKET_CONNECTED))
+		return false;
+	return true;
+}
+
 __maybe_unused /* this is temporary while this file is included in orders */
 static int smbdirect_connection_wait_for_connected(struct smbdirect_socket *sc)
 {
-- 
2.43.0


