Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798FC1AA17
	for <lists+samba-technical@lfdr.de>; Wed, 29 Oct 2025 14:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=p4FLya2lUbbWJJUMa9Dm75Mm1rxCNDAGhrXanJ7pNlQ=; b=479Y4GY4RYfwp4aXhX8iwsfIeb
	EpAuvk43ZwitpvsHIT5RAP7M5XY6eWgNiDfMD+D81fu5tddvPWMqEuXnUqMz4vkIiw4XfbXsaD34G
	qtlJ0Oxvklwof02krKa7JhWvcyvEmNQQop+riGaM1VWLbYWe4YAtRE1CveixZ52ZIPcCEvtlePNlH
	8ljJgtjCv0/e0Dm4E+m6Hns2CMuJN22ESlo9fvCThA6xN9o8AeJPf/bQgICp7Tkb149vZcSsHXQA/
	j0sbFvsZCoSM9RuZBUc8a50XL3W4Z4CA35MLvT/3CoLplzgclUHIjaNJ3o1rIPrfG5Qi1dxm8LT4v
	TjUovk6w==;
Received: from ip6-localhost ([::1]:58658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vE68S-0095Cx-PK; Wed, 29 Oct 2025 13:22:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47008) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68O-0095CY-4H
 for samba-technical@lists.samba.org; Wed, 29 Oct 2025 13:22:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=p4FLya2lUbbWJJUMa9Dm75Mm1rxCNDAGhrXanJ7pNlQ=; b=thTlsYvx5Hl9JuEzrMwSAhln0k
 7TnZPz/u19Huw9tiRj92SeQBc74z3zqsUkurJiSAwQox3PWkA56P4O2pDSOvh3K/G0wkOP9y1xYqQ
 iVLZdKIhlM2arKXxYIT06AKwkfueFJnuyotwpV1145UZOfLDRiPSIjqs6aoBzDoMg3OguCp5fmw1d
 LCAXy489FHAjOzk2YfOeNF2rixNWeulDxVG8H/B1dm+1NAO1Xrx8bEP0nQuDZsM0wYdx/HTANuWpf
 vrL/Xcl2dOppFs9S/rQ3pm7wge8KB+fjfdzg7qN7QVNDcdYliDSGYnFmB9Q/ZnJQ7yjEhjOJPxNd+
 LgcfJQZsnlPV1w/ds5EJ5xTUGK5f9ILnump3iCmO8WPARMMNUp1HPa/YG0AlTQHNIKFy0f0NjdnWk
 lKXtMlTxTLIRm6WLeS+5CNjxTTZyNF0Tw6YEC1LnCJ7sPJ3yv1Zq1M1zDQaRPXOGvQymEoH4ztoX+
 jbqPqStLAb9MxWc5sCKtR7gr;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vE68N-00BbES-1B; Wed, 29 Oct 2025 13:22:39 +0000
To: linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org
Subject: [PATCH v2 001/127] smb: smbdirect: let smbdirect.h include #include
 <linux/types.h>
Date: Wed, 29 Oct 2025 14:19:39 +0100
Message-ID: <fa8747cfebde4621fc47b8a8b218961b94120db2.1761742839.git.metze@samba.org>
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

This will make it easier to use.

Cc: Steve French <smfrench@gmail.com>
Cc: Tom Talpey <tom@talpey.com>
Cc: Long Li <longli@microsoft.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>
Cc: linux-cifs@vger.kernel.org
Cc: samba-technical@lists.samba.org
Signed-off-by: Stefan Metzmacher <metze@samba.org>
---
 fs/smb/common/smbdirect/smbdirect.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/smb/common/smbdirect/smbdirect.h b/fs/smb/common/smbdirect/smbdirect.h
index 05cc6a9d0ccd..821a34c4cc47 100644
--- a/fs/smb/common/smbdirect/smbdirect.h
+++ b/fs/smb/common/smbdirect/smbdirect.h
@@ -7,6 +7,8 @@
 #ifndef __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_H__
 #define __FS_SMB_COMMON_SMBDIRECT_SMBDIRECT_H__
 
+#include <linux/types.h>
+
 /* SMB-DIRECT buffer descriptor V1 structure [MS-SMBD] 2.2.3.1 */
 struct smbdirect_buffer_descriptor_v1 {
 	__le64 offset;
-- 
2.43.0


