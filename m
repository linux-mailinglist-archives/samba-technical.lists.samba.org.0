Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B30A554C
	for <lists+samba-technical@lfdr.de>; Mon,  2 Sep 2019 13:51:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=gAk8e8EnAq2a0bEaJMXZmHkMg4Ew4LRJrVZdbYC3VC4=; b=LmdlPzrwGt0JHRCNARsPkJWoaj
	pi10paPdKCPKwE3GZNZF5WFs6SYRZz1vBy42qwdmNeuSEeuzTwSl56cGMGa8/iaSA1ZXvtBiT6QFT
	l0Ik1QW2xY0SOi8eJ+BZDT4flcr8MpdVBPjUWSi4F2PvhopTnbS7gWkUyAbieXoIPVSnsINuz89GZ
	f4qDWI1y0xxZb46jvfewx7PadBC2XpUZ/TwDJ3tdiRt9V1sG+zhAkaeo90/axi8WiXIV0p6eglbld
	QJUXcLNf/WG7W9APWP0GD0jg8MvdJi06flgpIBVO2dUP1oUzKIj8RM21EzAKek4nTRT0AYuhzR8qz
	FgLrbwmQ==;
Received: from localhost ([::1]:50696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i4kr7-002wkV-8C; Mon, 02 Sep 2019 11:50:45 +0000
Received: from mx1.redhat.com ([209.132.183.28]:42970) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1i4kr1-002wkO-KI
 for samba-technical@lists.samba.org; Mon, 02 Sep 2019 11:50:42 +0000
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DFECD2A09AF
 for <samba-technical@lists.samba.org>; Mon,  2 Sep 2019 11:50:34 +0000 (UTC)
Received: by mail-pg1-f200.google.com with SMTP id o21so8765702pgd.11
 for <samba-technical@lists.samba.org>; Mon, 02 Sep 2019 04:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:subject:date:user-agent
 :mime-version:content-language;
 bh=gAk8e8EnAq2a0bEaJMXZmHkMg4Ew4LRJrVZdbYC3VC4=;
 b=dymQzTerG8y0nJparnHM8gqlpBUpUQyOegQnAS95HI1qpVj1Z4zWfMC2+Nu2yAbtUm
 ZRFO1Tw8fQslbjcXXlN0LGzmDYIjhS7Ja/HaIs2yR1Gzo9FwF1Al3UBdwil5GzrEubYb
 4RxuZJl/07Gdkl/J8aVbv7MAxxtpMoiqQpmgtGmvHumQAHv2XmmBuwC7VLacJsSbXw2K
 HLKpE8Fe4nr9XLJZQg6JGL+/KHdOGiD2QE9U9EfMmRJHeiMfdxccl03ingnlPoU2SZQ2
 EfIuYJ/Ue9L6sba70WBtW2u5Ggg4rwZpNdmvh86CNdGe4rSD11cq/mISfuMe3Qgccomz
 diOw==
X-Gm-Message-State: APjAAAWVCRgnhRQITDEu2A4NhUzqOJ1EWAo2QMfiEaC1ZUj2MX+xOMwh
 i3j9lH6mBruWItasNvT4tS/1LRAkrCQCZKdi2AzLx92l0bf5crm4VEb3Kpe8KM8injGz3qCyKvv
 kvpDqbLfCdsMW4056meEbcNjnZo6e
X-Received: by 2002:a62:c141:: with SMTP id i62mr12112150pfg.64.1567425034149; 
 Mon, 02 Sep 2019 04:50:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxpQe+pJmZSY8fhYAnp0EOlCqSWTtswSe+rUj3NjPqkhJ4WhFFcr/Wtwn7M8Sy8PXQqg0fwmw==
X-Received: by 2002:a62:c141:: with SMTP id i62mr12112141pfg.64.1567425034025; 
 Mon, 02 Sep 2019 04:50:34 -0700 (PDT)
Received: from amitkuma.pnq.csb ([125.16.200.50])
 by smtp.gmail.com with ESMTPSA id a8sm15379974pfa.182.2019.09.02.04.50.32
 for <samba-technical@lists.samba.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Sep 2019 04:50:33 -0700 (PDT)
Message-ID: <5d6d0209.1c69fb81.336d5.26fd@mx.google.com>
X-Google-Original-From: Amit Kumar <anonymous>
To: samba-technical@lists.samba.org
Subject: [Patch]Correcting the error message of 'samba-tool domain
 schemaupgrade'
Date: Mon, 2 Sep 2019 17:20:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------CEF2EFE27A5DD45F8D61C2AC"
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
--------------CEF2EFE27A5DD45F8D61C2AC
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

MR:https://gitlab.com/samba-team/samba/merge_requests/758


--------------CEF2EFE27A5DD45F8D61C2AC
Content-Type: text/x-patch;
 name="0001-Correcting-the-error-message-of-samba-tool-domain-sc.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Correcting-the-error-message-of-samba-tool-domain-sc.pa";
 filename*1="tch"

From 9359c6729f90dbaf6e549267d85dc17de3154a3e Mon Sep 17 00:00:00 2001
From: Amit Kumar <amitkuma@redhat.com>
Date: Mon, 2 Sep 2019 06:44:05 -0500
Subject: [PATCH] Correcting the error message of 'samba-tool domain
 schemaupgrade'

# samba-tool domain schemaupgrade -d 4

- Present error message
"Failed to upgrade schema. Check if 'patch' is installed."

- Should log this message:
"Failed to upgrade schema. Check if package 'patch' is installed.
Try running 'yum install patch'"

Signed-off-by: Amit Kumar amitkuma@redhat.com
---
 python/samba/netcmd/domain.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/python/samba/netcmd/domain.py b/python/samba/netcmd/domain.py
index 9d44d6d5ea4..732e9d50089 100644
--- a/python/samba/netcmd/domain.py
+++ b/python/samba/netcmd/domain.py
@@ -4185,7 +4185,10 @@ class cmd_domain_schema_upgrade(Command):
                                              stderr=subprocess.PIPE, cwd=temp_folder)
                     except (OSError, IOError):
                         shutil.rmtree(temp_folder)
-                        raise CommandError("Failed to upgrade schema. Check if 'patch' is installed.")
+                        raise CommandError('''Failed to upgrade schema.
+                                            Check if pacakge 'patch' is installed.
+                                            Try running 'yum install patch'
+                                           ''')

                     stdout, stderr = p.communicate()

-- 
2.21.0


--------------CEF2EFE27A5DD45F8D61C2AC--

