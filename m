Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 440C7165EA7
	for <lists+samba-technical@lfdr.de>; Thu, 20 Feb 2020 14:23:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4ELamNbr4RxvFSm3XJJCqeYrt9yKkb79lqP7BYJEDn4=; b=F92hZIT5fd7emTGPbyQDesa9dd
	dja8656BsEktWPGrHjqIhmoGbIVPHqYCcHxD+7ZrgACWwgEV7QVdC/Pi5E7JrDP5QHHvdrfSnaeXI
	04+tD3qPTkO1NtSR2u3bx7OyThsNu89PKWZSn9pFJpHY1LpGDjAuSnZslINNiRCIKVNG11v7g5ag5
	6nwvrmWigVHvpn98b4pODa0wd5Ulvogr8pbEanVxXUGKaYA1lO6xDraXPVzGZbOHKIWdRIbBtFgrB
	Pof0+GDB5kMpQxzvjQHVo5qWhXVWUa5snmxAj/P6vDXUbxSt8/SR14lPRwbMtjqyyRBEosIZJY1OK
	APtco9rA==;
Received: from localhost ([::1]:55096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j4lmd-00AkyE-2A; Thu, 20 Feb 2020 13:22:27 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41196) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j4lmW-00Aky7-C2
 for samba-technical@lists.samba.org; Thu, 20 Feb 2020 13:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=4ELamNbr4RxvFSm3XJJCqeYrt9yKkb79lqP7BYJEDn4=; b=f39BByEmGcOqIXStf7JQCbOY61
 jTZKpbvoAml5sEWBsIKzdC2BSHq8iJYrY4g1aSsUq6JEZ1Ve5d5OSvOwhg/fRt84GNTPyWbVM8KRV
 4dKjwVdWhiVFViBvVuMc3rAbajucCIWgaJDBwF5iARonc82wQW9z4DwUSqNPq6aUs7uB5mIYIdP1I
 BS2vvzXPTZsXCScS7iD6EFvNJhtIX0fvQVRFUhWUrZemANkt7S++K8eqYcsj0x6Il423duUHv7KDX
 1WuabZKRM7BXBbC9AMdaMgxsBRu3aJzMBIB2UOUledCW6JkvhDBO1zxHXESUV8/GILCOzJSyFd1G+
 DJTuqfPBEw76YOFlYm425iaOjPQaKYj5oV+kOlZz3NdPvIioTL5n0KGFQCqkMrqhiyh5zw+dvZslz
 5t2v576DJ2aaxngLeEcPFZFF2ZbzLp+WgMLNvXVQSu4BRq1hwau5yLP8kY34DCwXM1Lq4EzFqIr+V
 c4HjjygaWB2Z6RoIhuhVUT9J;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j4lmU-0003hv-JC; Thu, 20 Feb 2020 13:22:18 +0000
To: Karolin Seeger <kseeger@samba.org>
Subject: [PATCH] WHATSNEW: Spotlight backend for Elasticsearch
Message-ID: <70cf0568-9589-7bd0-ed36-cee40893b8e0@samba.org>
Date: Thu, 20 Feb 2020 14:22:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------0A9509E7614D68985F52C2F2"
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------0A9509E7614D68985F52C2F2
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Karo,

please add the following for the 4.12 release notes. Thanks!

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

--------------0A9509E7614D68985F52C2F2
Content-Type: text/x-patch; charset=UTF-8;
 name="WHATSNEW.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="WHATSNEW.patch"

From b8fcfa19a839bf879796d9fe18526af8df871b54 Mon Sep 17 00:00:00 2001
From: Ralph Boehme <slow@samba.org>
Date: Thu, 20 Feb 2020 14:19:04 +0100
Subject: [PATCH] WHATSNEW: Announce new Spotlight backend for Elasticsearch

Signed-off-by: Ralph Boehme <slow@samba.org>
---
 WHATSNEW.txt | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/WHATSNEW.txt b/WHATSNEW.txt
index ab161cbe811..fd947483f56 100644
--- a/WHATSNEW.txt
+++ b/WHATSNEW.txt
@@ -58,6 +58,29 @@ cryptography effectively wraps bad cryptography, but for now that above
 applies.
 
 
+New Spotlight backend for Elasticsearch
+---------------------------------------
+
+Support for the macOS specific Spotlight search protocol has been enhanced
+significantly. Starting with 4.12 Samba supports using Elasticsearch as search
+backend. Various new parameters have been added to configure this:
+
+  spotlight backend = noindex | elasticsearch | tracker
+  elasticsearch:address = ADDRESS
+  elasticsearch:port = PORT
+  elasticsearch:use tls = BOOLEAN
+  elasticsearch:index = INDEXNAME
+  elasticsearch:mappings = PATH
+  elasticsearch:max results = NUMBER
+
+Samba also ships a Spotlight client command "mdfind" which can be used to search
+any SMB server that runs the Spotlight RPC service. See the manpage of mdfind
+for details.
+
+Note that when upgrading existing installations that are using the previous
+default Spotlight backend Gnome Tracker must explicitly set "spotlight backend =
+tracker" as the new default is "noindex".
+
 "net ads kerberos pac save" and "net eventlog export"
 -----------------------------------------------------
 
@@ -189,6 +212,12 @@ smb.conf changes
   Parameter Name                     Description                Default
   --------------                     -----------                -------
 
+  elasticsearch:address              New                        localhost
+  elasticsearch:port                 New                        9200
+  elasticsearch:use tls              New                        No
+  elasticsearch:index                New                        _all
+  elasticsearch:mappings             New                        DATADIR/elasticsearch_mappings.json
+  elasticsearch:max results          New                        100
   nfs4:acedup                        Changed default            merge
   rndc command                       Removed
   write cache size                   Removed
-- 
2.24.1


--------------0A9509E7614D68985F52C2F2--

