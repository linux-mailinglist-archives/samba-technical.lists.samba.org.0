Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFAF2BB8AC
	for <lists+samba-technical@lfdr.de>; Fri, 20 Nov 2020 23:07:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=TP4ZJ/ywrZTt8jDOPCc2nzdqdjMvVkw5+nst+9/Crf4=; b=UvQvFQv6Odr4L/Wn358N7PuR4A
	n5jna5W7b1DkfJEzYWP1AQPBPmIrL6Kk3Iyg/56eupKefCjXSnskqu2ppDFX2iD+bmR//f1mSJzr/
	TEiWOyYvLbIt8CxeeYBHK03FpddGTEj67rXy8WYA6Phj2X9CdxrPZbQZCKmcleEXmAkWEcNX7yZ7A
	qo2iQ+yvMXL7OA3gz9q+n8hsF6HjWRGURtnbtAmGlw0KaLi0CNE/yCMk1gcFBt53bvgAAHYWMXPCN
	ZG7oWLL5egzcu4o0Ty1duX7kPctEWX+ufrkZeSjZounb7Y9sP4Amw7mMgeXzjVNytUsiTP/bBzgbg
	dj9HNQlA==;
Received: from ip6-localhost ([::1]:50394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kgEXP-002B1e-Fc; Fri, 20 Nov 2020 22:05:51 +0000
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:51444) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1kgEXJ-002B1V-Cn
 for samba-technical@lists.samba.org; Fri, 20 Nov 2020 22:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1605909946; x=1637445946;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=TP4ZJ/ywrZTt8jDOPCc2nzdqdjMvVkw5+nst+9/Crf4=;
 b=B9f+oFeC7opX7DwUGZyZA0/1S8Cs+iHvUP972ZSoE4DbsbsqUlbhE3MZ
 g62ocm6lnnnXRKaLC1b7AMLxnq5e7EvGE8dKNg7H4y1SdMNxfX4GJcfwI
 dvpFH929iAdP+l9qBIFE6lfjWOu+BndD4leecWP+ZLeTyg6iAkIyIhecp s=;
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-715bee71.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 20 Nov 2020 21:49:53 +0000
Received: from EX13MTAUEE002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan3.iad.amazon.com [10.40.163.38])
 by email-inbound-relay-1a-715bee71.us-east-1.amazon.com (Postfix) with ESMTPS
 id 2E45BA1872; Fri, 20 Nov 2020 21:49:51 +0000 (UTC)
Received: from EX13D11UEE004.ant.amazon.com (10.43.62.104) by
 EX13MTAUEE002.ant.amazon.com (10.43.62.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Nov 2020 21:49:51 +0000
Received: from EX13MTAUWC001.ant.amazon.com (10.43.162.135) by
 EX13D11UEE004.ant.amazon.com (10.43.62.104) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 20 Nov 2020 21:49:51 +0000
Received: from dev-dsk-pboris-1f-f9682a47.us-east-1.amazon.com (10.1.57.236)
 by mail-relay.amazon.com (10.43.162.232) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 20 Nov 2020 21:49:49 +0000
Received: by dev-dsk-pboris-1f-f9682a47.us-east-1.amazon.com (Postfix,
 from userid 5360108)
 id 0DD2EA8F50; Fri, 20 Nov 2020 21:49:50 +0000 (UTC)
To: <pboris@amazon.com>
Subject: [PATCH] Extend cifs acl utilities to handle SACLs
Date: Fri, 20 Nov 2020 21:49:18 +0000
Message-ID: <20201120214918.12517-1-pboris@amazon.com>
X-Mailer: git-send-email 2.15.3.AMZN
In-Reply-To: <20201119214042.6113-1-pboris@amazon.com>
References: <20201119214042.6113-1-pboris@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
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
From: Boris Protopopov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Boris Protopopov <pboris@amazon.com>
Cc: sfrench@samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Fixed error cases for insufficient privileges, added
attribute not supported error case for getcifsacl.

Signed-off-by: Boris Protopopov <pboris@amazon.com>
---
 getcifsacl.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/getcifsacl.c b/getcifsacl.c
index 1c72e7c..c1974d3 100644
--- a/getcifsacl.c
+++ b/getcifsacl.c
@@ -445,15 +445,26 @@ getxattr:
 			free(attrval);
 			bufsize += BUFSIZE;
 			goto cifsacl;
-		} else if ((errno == EPERM || errno == EACCES) &&
-			   !(strcmp(attrname, ATTRNAME_NTSD_FULL))) {
+		} else if (errno == EIO && !(strcmp(attrname, ATTRNAME_NTSD_FULL))) {
 			/*
 			 * attempt to fetch SACL in addition to owner and DACL via
 			 * ATTRNAME_NTSD_FULL, fall back to owner/DACL via
 			 * ATTRNAME_ACL if not allowed
+			 * CIFS client maps STATUS_PRIVILEGE_NOT_HELD to EIO
 			 */
-			fprintf(stderr, "Insufficient permissions to fetch full descriptor for %s\n",
+			fprintf(stderr, "WARGNING: Insufficient priviledges to fetch SACL for %s\n",
 				filename);
+			fprintf(stderr, "          Fetching owner info and DACL only\n");
+			attrname = ATTRNAME_ACL;
+			goto getxattr;
+		} else if (errno == EOPNOTSUPP && !(strcmp(attrname, ATTRNAME_NTSD_FULL))) {
+			/*
+			 * no support for fetching SACL, fall back to owner/DACL via
+			 * ATTRNAME_ACL
+			 */
+			fprintf(stderr, "WARNING: CIFS client does not support fetching SACL for %s\n",
+				filename);
+			fprintf(stderr, "          Fetching owner info and DACL only\n");
 			attrname = ATTRNAME_ACL;
 			goto getxattr;
 		} else {
-- 
2.23.3


