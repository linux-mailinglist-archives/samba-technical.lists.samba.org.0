Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 778E235A9E6
	for <lists+samba-technical@lfdr.de>; Sat, 10 Apr 2021 03:21:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=IA67hmjLpkn9GkvvAgWi7bY5KDIWoJCG7fhQVVG1Q4Q=; b=LrC4FC6OK6ta+6+BP+lcnlthCK
	pxwGfKXyPoJmqUV2e7cbIgHUDN+4vKqDwmGhGzzE23wRP+eQMOsFTbNPPxahldTkwfM3YxLx+E5GK
	dkYIMFfxCR9i2Hjvdvq61QXdHqXtxIUL/Eof+ZlwN38xS/QsAe6P8gcH8SFj3bI6dpGW1NNk9Y7K4
	TpvllXbx8rZGNGAaV67jvZ0fhd8xxvkdzasqRK8mbZDrIBPIjFcYe6R10OVtHxPZe6+ZX0fKx6zx9
	iSJhUaxEfbamhwt6HAlO/YTl2B8CO5ktmrVtDB/SYlWFqLoleGGOt+maMgbtWMtldb9fIxfl0CbVZ
	SWnljKZw==;
Received: from ip6-localhost ([::1]:52076 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lV2IQ-00Ak4M-En; Sat, 10 Apr 2021 01:20:22 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:42499) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lV2IE-00Ak4F-7h
 for samba-technical@lists.samba.org; Sat, 10 Apr 2021 01:20:12 +0000
Received: by mail-lj1-x231.google.com with SMTP id l22so1164986ljc.9
 for <samba-technical@lists.samba.org>; Fri, 09 Apr 2021 18:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=IA67hmjLpkn9GkvvAgWi7bY5KDIWoJCG7fhQVVG1Q4Q=;
 b=UATaJOKJ9B1/jhk+yjZNsrYgtChoS/r6V2hF6JO0RfdGUduLQIKHmpCRWwrGP1Ealg
 9J4r3D3N35I8kSFkVGrigLzAN1ED7Vy0mv8IkYgLn2v36Twbm8vOQuQ8tuYRAHerF59J
 fKIso3oVTaTe63N8CjAE6+7dv4IBM8Y0kASkGFZ/sd9dTSCLHNpnYJV5POHwmRcyr+mD
 C/0aU75Wc4uzYabcHkiOADGAoA9AcF9Pe+bdXxHdLF7I16b/cDtZnGAl2wcDBCz9upjN
 s4unjzkAOmx/G6YY9j7Bi64mGeeaqgSemUcjgUwFN4ksPOIPkI9zFAldDFm/fj0uPvpD
 /FOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IA67hmjLpkn9GkvvAgWi7bY5KDIWoJCG7fhQVVG1Q4Q=;
 b=bbHipCzisC8ggkN6UPAMsXbweS/b78LHvbTWJ3epgkJsV7MpbaR77M291hjFocWRfP
 xkkguOtXI7Zakp+9xy2VGVrUXEdgmC4WA2PvoM6BWt81+4LTImW03rV+2F8A1W7szQH2
 uS8B8y0NqFC/3BhDitlEREzuDBcQHQ5zE09KfhyyM9vOGeQJHO0s2ZPX/Uwv/83Q88v0
 XJygwfNDkuSAqQlBnOvOrEJR+5vDyFiAagp9s8f12pZVVgymSR0HS4InxtGUB8roPm2u
 lMVK7T4DrWalb0qxEEPZAo4z4uQJZit1Vcm3K8fYwF6FTOs4LRdeaPNOAn9EzHn8NESu
 MLGQ==
X-Gm-Message-State: AOAM533A4Zvs82q04sd8LPaLw5kdV7kHMuBP6Hp89fjGhNDyk5P1P+I1
 ExaphxdXN3WM8xrnocpzGQMjCGwoH+0OYBFZBRQ=
X-Google-Smtp-Source: ABdhPJz5B0XLKcMHS29jbU42RqHpeK+xFIelhf2UNu/JWQtebHAAptI3nl3WwRGxZ0do+19bohBHflb7+A/TMWp+tOc=
X-Received: by 2002:a2e:96d5:: with SMTP id d21mr10822933ljj.148.1618017607930; 
 Fri, 09 Apr 2021 18:20:07 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 9 Apr 2021 20:19:57 -0500
Message-ID: <CAH2r5mtouKTBH2wce04Es11qNg1JiKw25C=xuEBtEKr5MJc1PA@mail.gmail.com>
Subject: [PATCH] SMB3: update structures for new compression protocol
 definitions
To: CIFS <linux-cifs@vger.kernel.org>, linux-cifsd-devel@lists.sourceforge.net,
 samba-technical <samba-technical@lists.samba.org>
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

Protocol has been extended for additional compression headers.
See MS-SMB2 section 2.2.42

Signed-off-by: Steve French <stfrench@microsoft.com>
---
 fs/cifs/smb2pdu.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/smb2pdu.h b/fs/cifs/smb2pdu.h
index d6cd6e6ff14d..6442dc1c292b 100644
--- a/fs/cifs/smb2pdu.h
+++ b/fs/cifs/smb2pdu.h
@@ -144,7 +144,7 @@ struct smb2_transform_hdr {
 } __packed;

 /* See MS-SMB2 2.2.42 */
-struct smb2_compression_transform_hdr {
+struct smb2_compression_transform_hdr_unchained {
  __le32 ProtocolId; /* 0xFC 'S' 'M' 'B' */
  __le32 OriginalCompressedSegmentSize;
  __le16 CompressionAlgorithm;
@@ -160,10 +160,17 @@ struct compression_payload_header {
  __le16 CompressionAlgorithm;
  __le16 Flags;
  __le32 Length; /* length of compressed playload including field
below if present */
- /* __le32 OriginalPayloadSize; */ /* optional */
+ /* __le32 OriginalPayloadSize; */ /* optional, present when LZNT1,
LZ77, LZ77+Huffman */
 } __packed;

 /* See MS-SMB2 2.2.42.2 */
+struct smb2_compression_transform_hdr_chained {
+ __le32 ProtocolId; /* 0xFC 'S' 'M' 'B' */
+ __le32 OriginalCompressedSegmentSize;
+ /* struct compression_payload_header[] */
+} __packed;
+
+/* See MS-SMB2 2.2.42.2.2 */
 struct compression_pattern_payload_v1 {
  __le16 Pattern;
  __le16 Reserved1;

-- 
Thanks,

Steve

