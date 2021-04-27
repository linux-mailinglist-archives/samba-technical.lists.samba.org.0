Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D58836C69F
	for <lists+samba-technical@lfdr.de>; Tue, 27 Apr 2021 15:01:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=0W3Y9xRQwzRXkJmDZLo1t/AE4O42O96GTu4u27QU5uw=; b=3v+1ymZ4Mq/OL33rNfIhRaTuq/
	HSQItX7b9w/RzlWqmVqbFl4cSl6Ta+bStZRv0gjuzT0al5FMSZCzXtO8HPeEzmHioC8hjj4nwsaWC
	zzgUmPmgdTovZTBUc20CStkRFIXmtlQhpXBE55ReUaEwsBK5P9TGGOZFVuKkFD4f1zp4M36poHBAv
	y4ntJVu0txP1oNNzV29OeOLA1gZoMq81VHzdgV1MNa/d+N6X60uT26EsX6dH4NmZGVJCWhBQrL9fj
	ZDY7BK2pwm4sWZv0aqD0yq17CIIktvOqSrZPRlnOy41sVQ+7R/MLolWLxCMOJZHB+DLTZPjb8PaA/
	dxms8+8w==;
Received: from ip6-localhost ([::1]:21250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbNL3-00CfUn-Ro; Tue, 27 Apr 2021 13:01:17 +0000
Received: from milliways.cryptomilk.org ([2a01:4f8:201:2294::2]:55132) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbNKz-00CfSz-Ab
 for samba-technical@lists.samba.org; Tue, 27 Apr 2021 13:01:15 +0000
Received: from milliways.cryptomilk.org (localhost [127.0.0.1])
 by milliways.cryptomilk.org (Postfix) with ESMTPS id 549344621A82;
 Tue, 27 Apr 2021 15:00:42 +0200 (CEST)
Received: from magrathea.localnet (unknown
 [IPv6:2001:a62:1487:3d01:5f13:bf6c:2942:bf8f])
 by milliways.cryptomilk.org (Postfix) with ESMTPSA id 187B04621A81;
 Tue, 27 Apr 2021 15:00:42 +0200 (CEST)
To: kseeger@samba.org
Subject: WHATSNEW: Document removal of NIS support
Date: Tue, 27 Apr 2021 15:00:41 +0200
Message-ID: <1909015.IJMpmFZxnm@magrathea>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2863314.xGLI9C2SW2"
Content-Transfer-Encoding: 7Bit
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@cryptomilk.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.

--nextPart2863314.xGLI9C2SW2
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Karolin,

attached is a WHATSNEW.txt change to document the removal of NIS support.


Cheers


	Andreas

-- 
Andreas Schneider                 asn@cryptomilk.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
--nextPart2863314.xGLI9C2SW2
Content-Disposition: attachment; filename="0001-WHATSNEW-Document-removal-of-NIS-support.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8"; name="0001-WHATSNEW-Document-removal-of-NIS-support.patch"

From 8a0e412d7ca85f2d18b567e46595a27db03d65f2 Mon Sep 17 00:00:00 2001
From: Andreas Schneider <asn@samba.org>
Date: Tue, 27 Apr 2021 14:58:20 +0200
Subject: [PATCH] WHATSNEW: Document removal of NIS support

Signed-off-by: Andreas Schneider <asn@samba.org>
---
 WHATSNEW.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/WHATSNEW.txt b/WHATSNEW.txt
index 4154e0849f2..013f5b6eb35 100644
--- a/WHATSNEW.txt
+++ b/WHATSNEW.txt
@@ -46,6 +46,9 @@ REMOVED FEATURES
 Tru64 ACL support has been removed from this release. The last
 supported release of Tru64 UNIX was in 2012.
 
+NIS support has been removed from this release. This is not
+available in Linux distributions anymore.
+
 
 smb.conf changes
 ================
-- 
2.31.1


--nextPart2863314.xGLI9C2SW2--




