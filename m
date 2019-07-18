Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED0C6C972
	for <lists+samba-technical@lfdr.de>; Thu, 18 Jul 2019 08:52:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=RiSRxpgJhldoSr9LtXVTFyXfNxeMuG6ER915TEHUubk=; b=n38vJyBBvzRcpu1S8+FFfqgLjg
	qBHcykTvHpdz7NDxDtGP9C/JDn1piY9cT6R4a3TxBRVCCQ75d+AlT/T+yRmgMxVaQXqTihfxSJwND
	duyuwJ1yybKlMBAwL776beMN00WpdQ7z5iz5IpyC4nf8AbnXYRnQpuBqTKfVa5T0bvZCESIPik5AT
	c66GpQlRz5qpvoSCqN3jf+QY5Yt3u6YnvR1f+RPLTskasTnKvmSLiMQiT4fGcG1I/wDC0Mh07zKZE
	Fzmnv71rCjglCOrWJbJUCIOr4U1LMmZ1c80VD7gkQ+PcAM6Thn9jB8BKE0CBMK6jfIzbBZz7E/UA9
	HURmE9Rw==;
Received: from localhost ([::1]:49954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ho0GU-000jna-H1; Thu, 18 Jul 2019 06:51:42 +0000
Received: from mail-pg1-f172.google.com ([209.85.215.172]:45713) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ho0GG-000jnT-3C
 for samba-technical@lists.samba.org; Thu, 18 Jul 2019 06:51:31 +0000
Received: by mail-pg1-f172.google.com with SMTP id o13so12399354pgp.12
 for <samba-technical@lists.samba.org>; Wed, 17 Jul 2019 23:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language;
 bh=RiSRxpgJhldoSr9LtXVTFyXfNxeMuG6ER915TEHUubk=;
 b=eA1VN7Nh+287D0h17ZAi46ZF+KDLvvMREO1DzekjvooRTwyKM1WgY0o7p2x20d9nWr
 PgfurSs4JnRZIROto/ArpHmn1sfS5D5ec4XkUN5JHQVh2G14hC1aFncuAodQjxYLukw9
 523BvDq+MuXIMuWUMl+f9o6LMtBsHT/pt0dSN/7WUDx/UO+/fOPcYPOqMd4F+P0oOv6l
 9bMHmB0tA7jYpxv9/J9zJGLVziDBo87dKz0ym3j9+GH/AOUlyAj0bUTuFE9uNNmsQuNz
 LJuWTGSZrwFZd3v0x7Jt5Z+chUPDi4cOkxEhg3lnje2WazVTyEH6qhXNvT8qZ5jgrwYN
 /edg==
X-Gm-Message-State: APjAAAWFkaO/FEvpcj0eMD3Y43W0hYv2r94wt3ZcxmrYrrzMCcmrsgdF
 WXAx8g/4XSI61fL1+2abG4swLdzPn0RAIg==
X-Google-Smtp-Source: APXvYqzhaizu13nB2ZlY092Psq9o25sGNXXUK+ybV0aSMht8dFWkQN1BtIKzJmZ4jUvu1Hh9xjgNJw==
X-Received: by 2002:a17:90a:35e6:: with SMTP id
 r93mr49544878pjb.20.1563432685542; 
 Wed, 17 Jul 2019 23:51:25 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id m20sm20641533pff.79.2019.07.17.23.51.23
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 23:51:24 -0700 (PDT)
To: samba-technical@lists.samba.org
Subject: [PATCH] samba-tool: Fix traceback in samba-tool ntacl subcommands
Message-ID: <d0fa6fcc-08ea-26cb-621e-fac39428fc63@redhat.com>
Date: Thu, 18 Jul 2019 12:21:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------B7B1B787A0A75690E026472A"
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
From: Amit Kumar via samba-technical <samba-technical@lists.samba.org>
Reply-To: Amit Kumar <amitkuma@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

This is a multi-part message in MIME format.
--------------B7B1B787A0A75690E026472A
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

# samba-tool ntacl sysvolcheck
ERROR(runtime): uncaught exception - samdb_domain_sid failed
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py",
line 177, in _run
    return self.run(*args, **kwargs)
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line
265, in run
    domain_sid = security.dom_sid(samdb.domain_sid)
  File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in
get_domain_sid
    return dsdb._samdb_get_domain_sid(self)

# samba-tool ntacl sysvolreset
ERROR(runtime): uncaught exception - samdb_domain_sid failed
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py",
line 177, in _run
    return self.run(*args, **kwargs)
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line
210, in run
    domain_sid = security.dom_sid(samdb.domain_sid)
  File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in
get_domain_sid
    return dsdb._samdb_get_domain_sid(self)

Signed-off-by: Amit Kumar <amitkuma@redhat.com>
---
 python/samba/netcmd/ntacl.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/python/samba/netcmd/ntacl.py b/python/samba/netcmd/ntacl.py
index 4cc7737ae77..dfcc8bd4d8f 100644
--- a/python/samba/netcmd/ntacl.py
+++ b/python/samba/netcmd/ntacl.py
@@ -393,7 +393,11 @@ class cmd_ntacl_sysvolreset(Command):
         elif use_s3fs:
             use_ntvfs = False
 
-        domain_sid = security.dom_sid(samdb.domain_sid)
+        try:
+            domain_sid = security.dom_sid(samdb.domain_sid)
+        except Exception as e:
+            print("domain_sid not returned,",e)
+            return
 
         s3conf = s3param.get_context()
         s3conf.load(lp.configfile)
@@ -448,7 +452,11 @@ class cmd_ntacl_sysvolcheck(Command):
         except Exception as e:
             raise CommandError("Unable to open samdb:", e)
 
-        domain_sid = security.dom_sid(samdb.domain_sid)
+        try:
+            domain_sid = security.dom_sid(samdb.domain_sid)
+        except Exception as e:
+            print("domain_sid not returned,",e)
+            return
 
         provision.checksysvolacl(samdb, netlogon, sysvol,
                                  domain_sid,
-- 
2.17.1


Opened MR: https://gitlab.com/samba-team/samba/merge_requests/650


--------------B7B1B787A0A75690E026472A
Content-Type: text/x-patch;
 name="0001-samba-tool-Fix-traceback-in-samba-tool-ntacl-subcomm.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-samba-tool-Fix-traceback-in-samba-tool-ntacl-subcomm.pa";
 filename*1="tch"

From 646c9d78413d59399636d1ca14cad65341b912c6 Mon Sep 17 00:00:00 2001
From: Amit Kumar <amitkuma@redhat.com>
Date: Fri, 19 Jul 2019 00:43:58 +0530
Subject: [PATCH] samba-tool: Fix traceback in samba-tool ntacl subcommands

# samba-tool ntacl sysvolcheck
ERROR(runtime): uncaught exception - samdb_domain_sid failed
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py", line 177, in _run
    return self.run(*args, **kwargs)
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line 265, in run
    domain_sid = security.dom_sid(samdb.domain_sid)
  File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in get_domain_sid
    return dsdb._samdb_get_domain_sid(self)

# samba-tool ntacl sysvolreset
ERROR(runtime): uncaught exception - samdb_domain_sid failed
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/__init__.py", line 177, in _run
    return self.run(*args, **kwargs)
  File "/usr/lib64/python2.7/site-packages/samba/netcmd/ntacl.py", line 210, in run
    domain_sid = security.dom_sid(samdb.domain_sid)
  File "/usr/lib64/python2.7/site-packages/samba/samdb.py", line 583, in get_domain_sid
    return dsdb._samdb_get_domain_sid(self)

Signed-off-by: Amit Kumar <amitkuma@redhat.com>
---
 python/samba/netcmd/ntacl.py | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/python/samba/netcmd/ntacl.py b/python/samba/netcmd/ntacl.py
index 4cc7737ae77..dfcc8bd4d8f 100644
--- a/python/samba/netcmd/ntacl.py
+++ b/python/samba/netcmd/ntacl.py
@@ -393,7 +393,11 @@ class cmd_ntacl_sysvolreset(Command):
         elif use_s3fs:
             use_ntvfs = False
 
-        domain_sid = security.dom_sid(samdb.domain_sid)
+        try:
+            domain_sid = security.dom_sid(samdb.domain_sid)
+        except Exception as e:
+            print("domain_sid not returned,",e)
+            return
 
         s3conf = s3param.get_context()
         s3conf.load(lp.configfile)
@@ -448,7 +452,11 @@ class cmd_ntacl_sysvolcheck(Command):
         except Exception as e:
             raise CommandError("Unable to open samdb:", e)
 
-        domain_sid = security.dom_sid(samdb.domain_sid)
+        try:
+            domain_sid = security.dom_sid(samdb.domain_sid)
+        except Exception as e:
+            print("domain_sid not returned,",e)
+            return
 
         provision.checksysvolacl(samdb, netlogon, sysvol,
                                  domain_sid,
-- 
2.17.1


--------------B7B1B787A0A75690E026472A--

