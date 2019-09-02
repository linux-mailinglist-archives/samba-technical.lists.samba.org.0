Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 21571A52F8
	for <lists+samba-technical@lfdr.de>; Mon,  2 Sep 2019 11:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=qHroUKt1DiITQb+pLowv24yndzVxnNWMiTD1yPUEcvU=; b=EEauexeqexHbxUIE5uJhdqBeVg
	0+6CZczvdCXNnzS61ONur96HFw9kIcJBzCsNDdRVPmi0EcHGIIGVwxHV/Prs7CxKjHEVPm5yxApPQ
	Zr4QseqBeNJpv6cErig03CALtroAEfz6UV4ViqQBEAk6nQwFVcgX+TSvWllOSBCr6PDPS9xW+FxO/
	Xx61oIqUI77ZY/mbrZ3ZH2hvvRkuCNG/hMdB4usapkz/NnEdUlVIiYXcPOI+WX9ir8aIAbSH1P/wV
	m4KsRBgwi4oo57fO45iuplSjjcaPLmkCCS5tNWl2TvIWUZKEdLZk2ETMTpM9DDhVuOOwoNIfsKN57
	pFUtDu7g==;
Received: from localhost ([::1]:32282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i4inG-002u8N-7f; Mon, 02 Sep 2019 09:38:38 +0000
Received: from mx1.redhat.com ([209.132.183.28]:35480) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i4inB-002u8G-9u
 for samba-technical@lists.samba.org; Mon, 02 Sep 2019 09:38:36 +0000
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 51F2386679
 for <samba-technical@lists.samba.org>; Mon,  2 Sep 2019 09:38:28 +0000 (UTC)
Received: by mail-pg1-f197.google.com with SMTP id z35so8589183pgk.10
 for <samba-technical@lists.samba.org>; Mon, 02 Sep 2019 02:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:subject:date:user-agent
 :mime-version:content-language;
 bh=qHroUKt1DiITQb+pLowv24yndzVxnNWMiTD1yPUEcvU=;
 b=gH6D0v+CpQEoVi8fa0AVYTB/2KukqOuJUteA+2pnXhH+iL655GhF473UlpZDE0Fh0T
 ++IM31I6ZGt8kYeA0b4om0vX9uC8BEdyb65xxszQxFMe3p0fzdhuJrazHIsetXzCauRs
 CS5C4WchqyPDkX4yX+3cbhud69zG4MGzqRpTglVdummqwaYPZG0ywrexGZSeH0XLm7VX
 JETVzyjvSkj7UFPTyU5MeXdsxCaZF3yma9IoWvCUw62xfyccCT2icaPp1BneKBLbPiBQ
 dPYHvGPZcEph5Y/1QXbKQ2PzpTmTt+0Q9jSP4c9qxhQ8nJTlNDSIX9M63a4j2OGqjoPW
 ZoYg==
X-Gm-Message-State: APjAAAVAap/TYcvonxDIFQD44HBQ7ddV0qHGklMiBInjyB4HxDC6ZL5B
 VeX2RZxcNfWoy/HF1lonL4t9rEPDN7MA9LPRGBAS8/f92unptUnr7WbOJrAitdF+LAv6oUS6zmm
 ZecKnyP5g+oi3IemYBI5NeAN2Kp/R
X-Received: by 2002:a17:902:1107:: with SMTP id
 d7mr28453087pla.184.1567417107541; 
 Mon, 02 Sep 2019 02:38:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbMAmfV85A4c5Pgi1k+WSztjBD+WV0vmK2FnHo/Cw8YdgNMG1y9kZTSR34V7FOovV9To/ovw==
X-Received: by 2002:a17:902:1107:: with SMTP id
 d7mr28453072pla.184.1567417107379; 
 Mon, 02 Sep 2019 02:38:27 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id p10sm13431530pjr.14.2019.09.02.02.38.25
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 02:38:26 -0700 (PDT)
Message-ID: <5d6ce312.1c69fb81.67c3e.2767@mx.google.com>
X-Google-Original-From: Amit Kumar <anonymous>
To: samba-technical@lists.samba.org
Subject: [Patch] Uncaught exception on running 'samba-tool domain
 schemaupgrade'
Date: Mon, 2 Sep 2019 15:08:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------CCB3D56726D706750FDCCC7B"
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
--------------CCB3D56726D706750FDCCC7B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

PR: https://gitlab.com/samba-team/samba/merge_requests/757


--------------CCB3D56726D706750FDCCC7B
Content-Type: text/x-patch;
 name="0001-Uncaught-exception-on-running-samba-tool-domain-sche.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Uncaught-exception-on-running-samba-tool-domain-sche.pa";
 filename*1="tch"

From 06bbe380ae680a7e1b99138a1135a2621b0d0a3d Mon Sep 17 00:00:00 2001
From: Amit Kumar <amitkuma@redhat.com>
Date: Mon, 2 Sep 2019 04:26:08 -0500
Subject: [PATCH] Uncaught exception on running 'samba-tool domain
 schemaupgrade' # samba-tool domain schemaupgrade ERROR(<class
 'ModuleNotFoundError'>): uncaught exception - No module named 'markdown'  
 File "/usr/lib64/python3.7/site-packages/samba/netcmd/__init__.py", line 185,
 in _run     return self.run(*args, **kwargs)   File
 "/usr/lib64/python3.7/site-packages/samba/netcmd/domain.py", line 4157, in
 run     from samba.ms_schema_markdown import read_ms_markdown   File
 "/usr/lib64/python3.7/site-packages/samba/ms_schema_markdown.py", line 26, in
 <module>     import markdown

Signed-off-by: Amit Kumar amitkuma@redhat.com
---
 python/samba/netcmd/domain.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/python/samba/netcmd/domain.py b/python/samba/netcmd/domain.py
index 9d44d6d5ea4..b5a478154d0 100644
--- a/python/samba/netcmd/domain.py
+++ b/python/samba/netcmd/domain.py
@@ -4110,7 +4110,11 @@ class cmd_domain_schema_upgrade(Command):
         return count
 
     def run(self, **kwargs):
-        from samba.ms_schema_markdown import read_ms_markdown
+        try:
+            from samba.ms_schema_markdown import read_ms_markdown
+        except Exception as e:
+            print("Exception in importing markdown: %s" %e)
+            raise CommandError('Failed to import module markdown')
         from samba.schema import Schema
 
         updates_allowed_overridden = False
-- 
2.21.0


--------------CCB3D56726D706750FDCCC7B--

