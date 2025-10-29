Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECBCC1AB42
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:31:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6ajYJYZhn54gmmGtB6NnAVMb7kn2cgOD94NG20/NY+s=; b=xgZkgovsLEq7D18okxaboVf6aK
	Ws5LwdxoOksd+BmCKjxDqbuGMwSmVz4CSnlpHWVw2Y258IZ7lzIXQHJrhJVAU39rKdEEDvzbvqWYt
	7wADhYPxAcMZnmsSLs2i/d6sP9fjmogd2+GINV1vwKjsFMgBUpOAW5e9oS4pzdJ4ONzd3HqIq+pnO
	Rv2TwNZYJFAdJuJCZxukrRgrnNC2N3olCC1yi55oSaqEOjrSlf+qlKwuNdPrF49o2D/JTqYCGnW5c
	6+cAEceaM1GGS0bzxKQaemLbi9iDcZyxSmjK54GqSxR/EoT9yAtg2TTOBouM9hr86UuG8QrzDBHC1
	bz3a2GCA==;
Received: from ip6-localhost ([::1]:63774 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE6H5-0097v1-0l; Wed, 29 Oct 2025 13:31:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62870) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6BU-0096BF-Jg
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=6ajYJYZhn54gmmGtB6NnAVMb7kn2cgOD94NG20/NY+s=; b=HlNnSlMKDhoja2FDuOpY2HxwC1
 UhQ9BAw8xncXWeA8nb0EhUhFm6T3IZAydE749Ygxc37xHnF6yD+MEho6wwnVF9T/dyAA8IvXs0Z+7
 iUU+E61Jm0yok164xQ2Lcc6WwkjawCWBjr8FTfxv9NVuqZD9C8UEjdP1TgDMgAM1dFgiX4gZLV61N
 x6JBTkWNyTA3gMp4RaTbyIRfTRfKexr1CgoWi5Vg+Bq2DYcGWbEKy5OjzGkAC5QYqP9ifQ0TT5O0a
 H9ozsiOaWduuiR3TXTyeD4ZRUTC8VCwW6cN5rlnxk7mlwVg5FkEYu7tn+p+L7culS4vmLHo6ZUkbq
 JVhHjVTGydxcNyYbuqzdWw6NfmyossaTeaqN5JFv1laDOxIK7eh5HrzI4Uo0SY1cWptpOzNLxWQvy
 nw66ZZqrwQ7MT7XV9Sdii8ruypSRXjqJPA5KR0dS2/eh3HD4RvdjI4Sn05rs2gvBOYbBE/rv3EH/N
 rz8TtapGylz83SyqG1Xp8peY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE6BR-00BbfZ-1v; Wed, 29 Oct 2025 13:25:49 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 033/127] smb: smbdirect: define SMBDIRECT_MIN_{RECEIVE,
 FRAGMENTED}_SIZE
Date: Wed, 29 Oct 2025 14:20:11 +0100
Message-ID: <02f575b80927faafd42b40531d26818c31e6cc32.1761742839.git.metze@samba.org>
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

These are specified in MS-SMBD...

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect_pdu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/smb/common/smbdirect/smbdirect_pdu.h
index ae9fdb05ce23..7693ba337873 100644
--- a/fs/smb/common/smbdirect/smbdirect_pdu.h
+++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
@@ -8,6 +8,10 @@
 
 #define SMBDIRECT_V1 0x0100
 
+/* SMBD minimum receive size and fragmented sized defined in [MS-SMBD] */
+#define SMBDIRECT_MIN_RECEIVE_SIZE		128
+#define SMBDIRECT_MIN_FRAGMENTED_SIZE		131072
+
 /* SMBD negotiation request packet [MS-SMBD] 2.2.1 */
 struct smbdirect_negotiate_req {
 	__le16 min_version;
-- 
2.43.0


