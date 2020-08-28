Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A537025565B
	for <lists+samba-technical@lfdr.de>; Fri, 28 Aug 2020 10:26:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=u0WwDrvfxiwKl4ZeKkWc+y2eNEy3u9KIKXHY9iVJghI=; b=kJVxmD3uGQaTd0vFe6gLEKPPhx
	iMPDCV5LgAUdQGWkO5beF3d4b/KAJopA8z14Un3MgzRxJe0S212pBsGbXkzLKKIuV08sxbQiyxZb2
	5RcKQbcDoEetQmJH6s558ltKtP8MCVqI1Q598f9tipSwOd4N3VWTSbJ5MvCAhXczK1hOq2h1qKPcg
	am1O7TLlBEuXT+vbunPE2NTMNM9AjEZYnpIyBfSQRIz7RR6+22w+jGDpTiGc+Aps/cuCsBbq73nRB
	6FDwkwIgm/LtT+wupTCB+POlWwO/f4D8dfGCWoDK1D81Gi9C4FTHAMHYpKbZde9DPMtFMFtXz9LEB
	yDM6IOaA==;
Received: from localhost ([::1]:36422 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBZiP-0014pD-So; Fri, 28 Aug 2020 08:26:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29800) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBZiL-0014p6-20
 for samba-technical@lists.samba.org; Fri, 28 Aug 2020 08:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=0/lbOxdICbsVjN6lXiAwYXe9KYvkz/ov5fehWPuI36U=; b=kryI1TCrPMUwTzxxkhoh3MiCWS
 TI6bFe7epZgVxZwllNLP2GbL3M3LTHhIGsBAPVelYY3g24uh35ULOYMjFGlH+uKGy6i8shsC9t1fn
 bNipbkMZ6ku1Dh7Zm36d9xp/cgdqvMyHburH9r1cGrsuT3IRl+7VICZ73x/GeAExPA8Xq5KQ6DuMQ
 cbVYPUAEsh6VhsDLlQwnsLh6L2XSxSopH+rSxII9i/sO0K4VkKWO5VtWJKUnpjizkg1u4CaJFxp1r
 q6NpmWv4apq5pSlitjYBsvsNnLMG9OpqTMQYGBaxdIAhpI5fAi3p5LYhrxGCfePjRARQ0dIVFJ7zj
 aDT8Ye/gY4Pkj5I/B1DQ9lh0iZ8iMe/a0fpqpp7gkiX+C4annRGM2epOCM6JgBuCMKY72feC/cyy3
 V+0VisA1GIIfF0wYZ1S/9AeIZKbgOfWcSfQ3AVp8XCK37LdCWVFCVmb9RQoFBezpePRAC1Q4u10fD
 yyxLZYqjE4rlsvnWJyw+GDbi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBZiK-0002HF-Lg
 for samba-technical@lists.samba.org; Fri, 28 Aug 2020 08:26:24 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1kBZiK-007Jpx-Hy
 for samba-technical@lists.samba.org; Fri, 28 Aug 2020 08:26:24 +0000
MIME-Version: 1.0
Subject: Re: Fix compatibility issues with the timespec struct
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-212@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-212@samba.org>
Date: Fri, 28 Aug 2020 08:26:24 +0000
Message-Id: <E1kBZiK-007Jpx-Hy@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

TmV3IGNvbW1lbnQgYnkgbm9lbHBvd2VyIG9uIFNhbWJhIEdpdGh1YiByZXBvc2l0b3J5CgpodHRw
czovL2dpdGh1Yi5jb20vc2FtYmEtdGVhbS9zYW1iYS9wdWxsLzIxMiNpc3N1ZWNvbW1lbnQtNjgy
Mzk4Mjg2CkNvbW1lbnQ6CnRoaXMgd2FzIGZpeGVkIHNvbWUgdGltZSBhZ28gYnkgMTExNGIwMmE3
MmNlMGM4NmE1MzAxODE2NTYwZDI3MGVjNDdmOGJlMwo=
