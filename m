Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DED471EF1EF
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jun 2020 09:20:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=rVoYl07h6y9oFSMStNaRRxH8W+FxLw8cobKNf2aY3rA=; b=tVDhRyyNvJmzyXyljC48ZNuxYk
	JbBtXeItQXliMbkmZ6C6gOIpMEDOGC8yGbNSOMLrDYNCB20Vq4mzYohH9J79lnmN6xOG6QgV95CXY
	7eLtjsnhsGc7vmJBAwy6351tzLiO4d3tqTBZ1i3mSYlQFVkTVHaZylFFGjVYdpbrBYk0wV2qgqTqg
	KDENg3qK4L/pEW+pUUYIyhtCD4AR1/Gq6hNy34XcN7HEBLJyEVRdXcQDLLtMUpxbFHiF8BPJ2es/Q
	3c/iofq8Xw84/aK4LjaW3Tt1CAtzAvFQPBypowqaLwDfNRxunO78DoBJei/WX0beBIUucmN7IGHmX
	50GBRVeg==;
Received: from localhost ([::1]:29262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jh6e1-0092xk-G6; Fri, 05 Jun 2020 07:20:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28996) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jh6dn-0092xd-Es
 for samba-technical@lists.samba.org; Fri, 05 Jun 2020 07:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=rVoYl07h6y9oFSMStNaRRxH8W+FxLw8cobKNf2aY3rA=; b=ZrpAplIrITqq2JlNjTsCZhwIMa
 6DBGbWZt2IeSRpZBl82mnmQBPSzL/f/EHDpJFHz+TW02aM2IgpPphrsDlqg1gWMPwIr2IfjASKH1t
 zzwtAnqhjx+Bi4lltmsR1vmZXowJQ/keVE1+sL62Qo8EYKy+py+TLSk4Wno3ZV3lkU4Mq66Q2eQhH
 YbNFKSypiPzZoFXvFRZW0xTLYoc+fxoRMu+EWGTPePwBW5l3C9oZMYifKA+FE2HrQicuEN0OC0MOz
 WbP5LDkf8cQPAnNL6NEKqL23SGPchwsQ9k/gl651NLfL17l7Eng9u/uLBZqo6c8+9bpIBJWgLgLo4
 nVcZCIqOvsvYZ9GA/gDPhwVEy15nOda+PDeb0uJPu7TMBdtsD4B9rN+LaFr3DtII8y9M/jOt7oRK3
 iFTYHkMuWqpw8MRGi6MmRdi3oN8ABQkp4B+rud+eCT/tIqGLjGTw8QfJ1uWML4rzOwOvL7HCby/As
 sE3ni0M+T6trr8VPYblgyvpc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jh6dl-0003nf-O6
 for samba-technical@lists.samba.org; Fri, 05 Jun 2020 07:19:46 +0000
To: samba-technical <samba-technical@lists.samba.org>
Subject: [PATCH] samba-tool dns query --help
Message-ID: <4ec26631-e80f-4507-e7c2-8dd7a130aae5@samba.org>
Date: Fri, 5 Jun 2020 08:19:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------A19EC461402651A57A8B18BD"
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
--------------A19EC461402651A57A8B18BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, whilst running 'samba-tool dns query --help' I noticed something, 
'PTR' wasn't in the list of available record types, this patch just adds it.

Rowland



--------------A19EC461402651A57A8B18BD
Content-Type: text/x-patch; charset=UTF-8;
 name="Subject-samba-tool-dns-query-help-Someone-forgot-PTR.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="Subject-samba-tool-dns-query-help-Someone-forgot-PTR.patch"

From 00190a7281c7540481ea2e12279fd7da9885faa6 Mon Sep 17 00:00:00 2001
From: Rowland Penny <rpenny@samba.org>
Date: Fri, 5 Jun 2020 07:56:21 +0100
Subject: [PATCH] samba-tool dns query --help: Someone forgot 'PTR'
 from the list of record types

Signed-off-by: Rowland Penny <rpenny@samba.org>
---
 python/samba/netcmd/dns.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/python/samba/netcmd/dns.py b/python/samba/netcmd/dns.py
index 6faa54d1a8e..d4b06929aa3 100644
--- a/python/samba/netcmd/dns.py
+++ b/python/samba/netcmd/dns.py
@@ -790,7 +790,8 @@ class cmd_zonedelete(Command):
 class cmd_query(Command):
     """Query a name."""
 
-    synopsis = '%prog <server> <zone> <name> <A|AAAA|CNAME|MX|NS|SOA|SRV|TXT|ALL> [options]'
+    synopsis = ('%prog <server> <zone> <name> '
+                '<A|AAAA|PTR|CNAME|MX|NS|SOA|SRV|TXT|ALL> [options]')
 
     takes_args = ['server', 'zone', 'name', 'rtype']
 
-- 
2.20.1


--------------A19EC461402651A57A8B18BD--

