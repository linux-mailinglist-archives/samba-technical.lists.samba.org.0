Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DF219BDBD
	for <lists+samba-technical@lfdr.de>; Thu,  2 Apr 2020 10:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=ZD0/M5H1ixEiyili5YONRAbHbbB7P7HIxIaDW+N+HgA=; b=h3NAlTQtkSTqn0FY+PvQEWTh70
	NWgMJeY6jZT08izdSrbBok20vSmmNknrvl/+aH1hV+Lzuy6qvZE3tB/O/q5P+semVhf/gJdKVKEtz
	sArxgU6KhgZbkFaecueYwwyh/SN3eLC009K9RZwytLBjPJXerC4vAgG8KI5digwLDM6GA4ov/6//M
	2oXSPLIcqhuh5Jvz55htTxgrBrVTWO7kRm5y7Mx4rZMPbamHxnPye6FbyT3KKaD6znm+dDtJRpIBt
	BwlyxhvglyfCkHb4tMHkiQ9yeHBFetguVo7++sH/ZV7TKwzbi3Nwvc6qAD2W8Ut0P3ZAYy8mY3C89
	mbmXnsdA==;
Received: from localhost ([::1]:56136 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJvSX-0034rW-5w; Thu, 02 Apr 2020 08:44:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJvSS-0034rO-0p
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 08:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=ZD0/M5H1ixEiyili5YONRAbHbbB7P7HIxIaDW+N+HgA=; b=mc15pcWeilohNSdunNtsnRhneB
 2m1eCPw0tOe3QMu6RdKVKC4LuxSTWTLnKSyDt8XdPzu3Dj1Hw8aogSyVhWVkG5AEOnqQ8qLWG5jtq
 zWxL0Vsno4pwBQOaNw+97ValN2iGFn2voTAeT0Pf8vD1VCZL7mFwJSnLeswrIH5dHQRCbVXfJsyjd
 VbDHAA72FijB5/J1U5NvILUoBjX4waNx6cNvNsiAQX4FaNu1+FHf9RLwY5XWmZqRXqE5RSPIx6HWZ
 DsGb465CH6tz/34FwXXtxumEKXCc/7rrCj0gnJUf07oMkzAJZbEyxYCmvmj0/RE4/oi5t1otL2SKx
 Maj5D+u00DEZGrDyMXC7CiDoaCcI8D5QXPHv/zmdY47vE/j7AZpNe5IS9BO859mx2PjOOEJEkSnqp
 HJeUyQYhIhoXp6AZrB8370booLflvkFJgF6AVqoBPE95XmtxWt9dUGyt0I+rbRDLD4uh22T/lKl86
 fUxSAmyjDqsDhfIEGKEVagTV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJvSQ-0007yo-Qa
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 08:44:14 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [PATCH] samba-tool group show
Message-ID: <0acb2828-a298-4a79-421d-683a771d9a93@samba.org>
Date: Thu, 2 Apr 2020 09:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------25755313B826A17A15CDFCD1"
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
--------------25755313B826A17A15CDFCD1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, <samba-tool group show 'groupname'> will only show the groups info 
if it is a global security group.

The attached patch fixes this.

See bug: https://bugzilla.samba.org/show_bug.cgi?id=14335

See: https://lists.samba.org/archive/samba/2020-March/229069.html for 
the user who found this.

Rowland



--------------25755313B826A17A15CDFCD1
Content-Type: text/x-patch; charset=UTF-8;
 name="Subject-PATCH-samba-tool-group-show-only-shows-globa.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="Subject-PATCH-samba-tool-group-show-only-shows-globa.patch"

From 1b3de4cd13abdc6ed22273682827b38ccf8033bb Mon Sep 17 00:00:00 2001
From: Rowland Penny <rpenny@samba.org>
Date: Thu, 2 Apr 2020 09:29:18 +0100
Subject: [PATCH] Subject: [PATCH] samba-tool group show: only shows global
 security groups, this patch makes it show all groups.

BUG: https://bugzilla.samba.org/show_bug.cgi?id=14335

Signed-off-by: Rowland Penny <rpenny@samba.org>
---
 python/samba/netcmd/group.py | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/python/samba/netcmd/group.py b/python/samba/netcmd/group.py
index 76705100960..d973c750b86 100644
--- a/python/samba/netcmd/group.py
+++ b/python/samba/netcmd/group.py
@@ -696,9 +696,8 @@ Example3 shows how to display a groups objectGUID and member attributes.
         if group_attrs:
             attrs = group_attrs.split(",")
 
-        filter = ("(&(sAMAccountType=%d)(sAMAccountName=%s))" %
-                  (ATYPE_SECURITY_GLOBAL_GROUP,
-                   ldb.binary_encode(groupname)))
+        filter = ("(&(objectCategory=group)(sAMAccountName=%s))" %
+                   ldb.binary_encode(groupname))
 
         domaindn = samdb.domain_dn()
 
-- 
2.20.1


--------------25755313B826A17A15CDFCD1--

