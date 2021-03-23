Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9EC345F9B
	for <lists+samba-technical@lfdr.de>; Tue, 23 Mar 2021 14:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=5L9+Fb7ZhtNIr9R4BP0JPl0Bu0Air2XgRbmbDPrhyJg=; b=Ch/vR6XFc+WGJuBXlCIlgiqjeQ
	8GR9E7pa+EVnwiKpdivmC3tNd0yai+MrmJgVMaPXuYObXpQCpQFAg070SDiuh52rwVCWnRU1xxpBe
	BuBado0mFjIeS/atT6pw6HZFtisIK40mtpLrueWJen1bLoo8ItT8crTCX70M89NCCl3799hX4IS7o
	LSkWOoZFn2iIfVUotx89wZlAx8jLAng/LM9yszxHPGJD0BHB9P28CRZ+xEFgqhGvUH0Jf1xEOoqpr
	QJIoi4g1YfxxBiyfpNSdTSEjg88hkeAYr5C6NFVG+d1VTp9/GhcRZbVcyxWNVLtIhmvUGAG9PDI3o
	KrFrZtzA==;
Received: from ip6-localhost ([::1]:37486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lOh3F-006NDQ-SP; Tue, 23 Mar 2021 13:26:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47028) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lOh35-006NDJ-MO
 for samba-technical@lists.samba.org; Tue, 23 Mar 2021 13:26:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=5L9+Fb7ZhtNIr9R4BP0JPl0Bu0Air2XgRbmbDPrhyJg=; b=XEaHQICffMGihImBj+g7t+XgnJ
 WMUqo4NgYB2qyRD6CXRgb+OcoC/FQ8GRbU384ceYTORrxKh2Nkt63v2+eDRqnvIx8S3PYwAG9cyzr
 wYA1zwhcySiQxmeZXZ5XcnhCdBNN7R2U+n4uqWEXF9GAdOrJzHDrWvg1SWG+wWioBAWw4+b+wBJwX
 f8MVXFFUWB5WE7Jhy6IaZVMQtVcRyS9z5JVgZVTmBSrdLx1PyOQhXwe9wot5Fkzwo2CruJ0yJtCwy
 6hlz2KT8Wim8UP+4GoWvLcXyxuExC9+5GKkeNVhvEenKT1oOzqAImbM8R2NCZ2GzgbX+/yJC20sEb
 V3oBRb0nIu3hdSoi/EO7j9/ehjEPT+R+1+Clh/AzG6419jWJkiK4vKwoZBFt0g+kUnq5twjI8i4JW
 IKguO+su4fCo0QNY4jB1JEdAVEb+J43sjs+eyNUHEpzFvfOZnerbBO+NSEhyHBaAz4v+GznoniyKx
 wIfuv6/SYGb2FYFamhmlnuOu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lOh2q-0006h5-Gv
 for samba-technical@lists.samba.org; Tue, 23 Mar 2021 13:26:04 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [PATCH] man winbind
Message-ID: <64a50e84-f92f-bcbd-e3cf-3e5ae55b5b7f@samba.org>
Date: Tue, 23 Mar 2021 13:26:04 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------5762392154D287A5C1184019"
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------5762392154D287A5C1184019
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Seeing as I cannot seem to do this through Git-Lab, lets try the old way 😁

This patch just removes an untrue statement from the winbind manpage, 
you can run winbind without running nmbd.

Rowland



--------------5762392154D287A5C1184019
Content-Type: text/x-patch; charset=UTF-8;
 name="man-winbind-Remove-untrue-statement-you-can-.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="man-winbind-Remove-untrue-statement-you-can-.patch"

From dc83f87ac51fec0346e74677ed5b7a7a6da6dd44 Mon Sep 17 00:00:00 2001
From: Rowland Penny <rpenny@samba.org>
Date: Tue, 23 Mar 2021 13:16:02 +0000
Subject: [PATCH] man winbind: Remove untrue statement, you can run
 winbind without running nmbd.

Signed-off-by: Rowland Penny <rpenny@samba.org>
---
 docs-xml/manpages/winbindd.8.xml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/docs-xml/manpages/winbindd.8.xml b/docs-xml/manpages/winbindd.8.xml
index 99c00388c20..d5acc072a00 100644
--- a/docs-xml/manpages/winbindd.8.xml
+++ b/docs-xml/manpages/winbindd.8.xml
@@ -358,10 +358,6 @@ auth  required    /lib/security/pam_unix.so \
 	<para>The following notes are useful when configuring and
 	running <command>winbindd</command>: </para>
 
-	<para><citerefentry><refentrytitle>nmbd</refentrytitle>
-	<manvolnum>8</manvolnum></citerefentry> must be running on the local machine
-	for <command>winbindd</command> to work. </para>
-
 	<para>PAM is really easy to misconfigure.  Make sure you know what
 	you are doing when modifying PAM configuration files.  It is possible
 	to set up PAM such that you can no longer log into your system. </para>
-- 
2.20.1


--------------5762392154D287A5C1184019--

