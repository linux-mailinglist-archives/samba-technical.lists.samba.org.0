Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE1935A7CF
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 22:26:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=0oxAVaozx2tGUwHaI5hqE6vleAmozCilns4C2fl8pp0=; b=J3rWsi+fCGqXL3KeQNJ7GPgfXf
	D49jKPoACFkkRnwrOKtlGCbPvnJqv0B2RKmTrpRrbmC8LrkRlDp+f5/P6uBxi2ZjWGAneLYry+lIU
	Kh82xQXNnjoy6pTPJCab8ozdUY1Oe1jtq9p6auIfi6P7VaIv07ZA94u9txfpRzZSgR7I+sBk+fN2k
	q6E+6V7NoQS7kqASVzNiwrKvH0BgqcnfTE7GocC6MZXnTEWNlSIPYVcVE3lBWnVno/BLZ1wNOgzLe
	xx4rp9PepDuXlknrchga+ApzPfSKC1u12qZ2nrb+FH9YLwD/tw6LMCFO4RnBp3flN3txN4NiLBWQ3
	BZeRCtpw==;
Received: from ip6-localhost ([::1]:48278 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUxh4-00AjG0-OD; Fri, 09 Apr 2021 20:25:30 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131]:37743) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUxgy-00AjFt-UQ
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 20:25:27 +0000
Received: by mail-lf1-x131.google.com with SMTP id v140so11657806lfa.4
 for <samba-technical@lists.samba.org>; Fri, 09 Apr 2021 13:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=0oxAVaozx2tGUwHaI5hqE6vleAmozCilns4C2fl8pp0=;
 b=TrsdTKkfJTt4pFC3lY6wnytAQR6U0eQIAhmAR7xqLXwQYHPns8LXfno6UGd1Hgb50U
 a4rn1qU7kByAWKqUBSm2Rfn910rQuMBAcH2BaYpS5l6JTWLO2PlNUdRY3TXME2IZhSPZ
 iG9/CksXLJVomjYKP1u+PWBe72udr8SUyR+Z/YrWs/gPhk/s+JUDSKNBLMH9QlVfG4Ch
 Kf7za/jHyTeuZWJjMG3PGVplNEfK9X9gUNCcOHp0cYc3V5upvMa8CdBbKnhDB46bcO1b
 caUp37tXXa6M/3lbPojtyeJf2Mx52xY55bFoGrmyMcXkMTemuGkvCG3phPTHI7wRxYyw
 fxYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=0oxAVaozx2tGUwHaI5hqE6vleAmozCilns4C2fl8pp0=;
 b=Oe0BNYGG/MomF4FMWd0s667lyAxfNwADto+WqUbV0lTijrTX1hnalGUlkUkU5/4Fqs
 mPwg0tE9wTdXqCqjxXEZy6ZVehNKKX+kXYMxa36ZTkc6Dv4fRelfxjGGYnHnNaZHk/MQ
 3lOCOOfQpJsvMY2JmsT4Ng582oF5hS+ptINPsUK2wqwVeeQKw1jPbaKdE4Mcdht/Qet5
 OIJlh637fYDuEAVNd8sLuhbInHyoMb+RGc6sj1k4SehBLhav2LPJBr1uSS9LrmiKgyfV
 fQtROdpbOj2Gt/hhagxw2kyUWqNtMnV3GsJqs/FfMG2vwdDFx261yGTTiqJCYEtWAm8c
 rsJA==
X-Gm-Message-State: AOAM531vqAMFt1E54noohxyuFJ1uDfsqyKC3sFStp9KgxrZvEycWDwtX
 lHEE5g4qC2SyWk1H6z4Ix4vmu/nePUH+ECwqJdU=
X-Google-Smtp-Source: ABdhPJxVU0UuRd5AFC6Ofj+0WAsXT8kEYH6CC6JZvg2GWjS+v9PE9Tl/asarcVnyzhH1mP1M715DmgJ3fSxyLsKThWs=
X-Received: by 2002:a19:8c0a:: with SMTP id o10mr11314842lfd.175.1617999923362; 
 Fri, 09 Apr 2021 13:25:23 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 9 Apr 2021 15:25:12 -0500
Message-ID: <CAH2r5mvEZQQBdtbEeaDFq40iXEvpU+q7NGtLyioJkid_zwx9Yw@mail.gmail.com>
Subject: [PATCH][SMB3] smb3: update protocol header definitions based to
 include new flags
To: CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>,
 linux-cifsd-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

[MS-SMB2] protocol specification was recently updated to include
new flags, new negotiate context and some minor changes to fields.
Update smb2pdu.h structure definitions to match the newest version
of the protocol specification.  Updates to the compression context
values will be in a followon patch.

Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/cifs/smb2pdu.h | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/fs/cifs/smb2pdu.h b/fs/cifs/smb2pdu.h
index a5a9e33c0d73..d6cd6e6ff14d 100644
--- a/fs/cifs/smb2pdu.h
+++ b/fs/cifs/smb2pdu.h
@@ -181,7 +181,11 @@ struct smb2_rdma_transform {
  __le32 Reserved2;
 } __packed;

-struct smb2_rdma_encryption_transform {
+/* TransformType */
+#define SMB2_RDMA_TRANSFORM_TYPE_ENCRYPTION 0x0001
+#define SMB2_RDMA_TRANSFORM_TYPE_SIGNING 0x0002
+
+struct smb2_rdma_crypto_transform {
  __le16 TransformType;
  __le16 SignatureLength;
  __le16 NonceLength;
@@ -409,13 +413,29 @@ struct smb2_netname_neg_context {
 } __packed;

 /*
- * For rdma transform capabilities context see MS-SMB2 2.2.3.1.6
+ * For smb2_transport_capabilities context see MS-SMB2 2.2.3.1.5
  * and 2.2.4.1.5
  */

+/* Flags */
+#define SMB2_ACCEPT_TRANSFORM_LEVEL_SECURITY 0x00000001
+
+struct smb2_transport_capabilities_context {
+ __le16 ContextType; /* 6 */
+ __le16  DataLength;
+ __u32 Reserved;
+ __le32 Flags;
+} __packed;
+
+/*
+ * For rdma transform capabilities context see MS-SMB2 2.2.3.1.6
+ * and 2.2.4.1.6
+ */
+
 /* RDMA Transform IDs */
 #define SMB2_RDMA_TRANSFORM_NONE 0x0000
 #define SMB2_RDMA_TRANSFORM_ENCRYPTION 0x0001
+#define SMB2_RDMA_TRANSFORM_SIGNING 0x0002

 struct smb2_rdma_transform_capabilities_context {
  __le16 ContextType; /* 7 */
@@ -427,6 +447,11 @@ struct smb2_rdma_transform_capabilities_context {
  __le16 RDMATransformIds[];
 } __packed;

+/*
+ * For signing capabilities context see MS-SMB2 2.2.3.1.7
+ * and 2.2.4.1.7
+ */
+
 /* Signing algorithms */
 #define SIGNING_ALG_HMAC_SHA256 0
 #define SIGNING_ALG_AES_CMAC 1
@@ -634,7 +659,8 @@ struct smb2_tree_connect_rsp {
 #define SHI1005_FLAGS_ENABLE_HASH_V2 0x00004000
 #define SHI1005_FLAGS_ENCRYPT_DATA 0x00008000
 #define SMB2_SHAREFLAG_IDENTITY_REMOTING 0x00040000 /* 3.1.1 */
-#define SHI1005_FLAGS_ALL 0x0004FF33
+#define SMB2_SHAREFLAG_COMPRESS_DATA 0x00100000 /* 3.1.1 */
+#define SHI1005_FLAGS_ALL 0x0014FF33

 /* Possible share capabilities */
 #define SMB2_SHARE_CAP_DFS cpu_to_le32(0x00000008) /* all dialects */
@@ -1390,7 +1416,11 @@ struct smb2_lock_req {
  struct smb2_sync_hdr sync_hdr;
  __le16 StructureSize; /* Must be 48 */
  __le16 LockCount;
- __le32 Reserved;
+ /*
+ * The least significant four bits are the index, the other 28 bits are
+ * the lock sequence number (0 to 64). See MS-SMB2 2.2.26
+ */
+ __le32 LockSequenceNumber;
  __u64  PersistentFileId; /* opaque endianness */
  __u64  VolatileFileId; /* opaque endianness */
  /* Followed by at least one */

-- 
Thanks,

Steve

