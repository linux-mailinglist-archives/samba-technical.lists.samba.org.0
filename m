Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23153791465
	for <lists+samba-technical@lfdr.de>; Mon,  4 Sep 2023 11:09:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=QrxJDXphbv3W9L1Asm6s21MZGiL5Ml08y1Ch8LQQOMs=; b=camkNkwz+2UuCfHYcntE4gkvkg
	XBYUep1zLmkVSXZPi4CixuRcH5ye0pxIO/MZKMF4jwh/+F7IHEGeGY6phTTabbIRlaF36+BvcyzFT
	78frcWOCKFrb8BPbxJDOx90d7yonL4cbP2YJ5qHapA+5KnTDrjyPmfa6Nq9b8iGCTyEki7BHckTYh
	x258lFDMKz+BvzOiLgdcW7kSD382BN2boFvKCwNHNYp3z1VCWuu1fvR/e0kljcsiburQUl8SlRMC4
	NNvtHixpWDOgJCOvPIcLPns16GH3OqU+iSKo+q1rekWghUtcllVYocwdg1HjCPh/80hXvgXZjBauG
	ymqKPBjA==;
Received: from ip6-localhost ([::1]:46342 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qd5Zo-000JKj-15; Mon, 04 Sep 2023 09:08:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19460) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qd5Zf-000JKa-Ej
 for samba-technical@lists.samba.org; Mon, 04 Sep 2023 09:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=QrxJDXphbv3W9L1Asm6s21MZGiL5Ml08y1Ch8LQQOMs=; b=hb8oitNnTzMWFForkA7V+7L1PQ
 jWMzZXmKCfRjyD28mEUhgh7py/Wxb8vAXxifACrIgWA+QQ4KL+xDeiNj0TGBv0k5KdRvyxpysfB4s
 9APsaVL+g+PqRbOcLM4q5BXrEMlrLJUcJJ+HSTwznz/B+lk+t4UE7Dj/yGfCY+6S4ODp3556arlcG
 B5kqAq3kLOIoClvm+G8jkvoUW0QqW1kMm4o2S7fwM4CQ/da4vuaNpzBcvQ/Pd0yQVZhiofdeKjcIK
 5QGKwp/p0aUx0zlC/ky+eIFHiJdkHM6VPC1OT2Z5T054GZd5KCIuk/Ued6QDWkmGKmW/GFa7YVRAE
 wEXY7PHB6LpdLMj/TU59CXD8DmGJs+My40dXr8oNTRn2uuPN8NuxhwlUqABWDMC/gNw4wjVbXqQJ2
 nNgqFMyQ7S2WK09wsMjBOaBcIwfiNSUN2BNMfFXgc/SC2At+UoeUJ+ofAmhckpKURcicla1GYzRb2
 lQjE9K+bnTsLT6CJbEn2HzZC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qd5Zd-00BffX-1O; Mon, 04 Sep 2023 09:08:45 +0000
To: samba-technical@lists.samba.org, slow@samba.org
Subject: `allow trusted domains = no` and `Unix Users`
Date: Mon, 04 Sep 2023 11:08:44 +0200
Message-ID: <1873406.tdWV9SEqCh@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello,

I have a user who set `allow trusted domains = no` in his smb.conf. He also 
set `force user = localuser` on a share. However he is not able to connect to 
the local share:

[2023/07/27 12:31:43.434346,  3, pid=1019460, effective(0, 0), real(0, 0)] 
../../source3/lib/util_names.c:84(is_allowed_domain)
  is_allowed_domain: Not trusted domain 'UNIX USER'
[2023/07/27 12:31:43.434350,  3, pid=1019460, effective(0, 0), real(0, 0), 
class=auth] ../../source3/auth/auth_util.c:492(create_local_token)
  create_local_token: Authentication failed for user [cortexuser] from 
firewalled domain [UNIX USER]

The change was introduced by df5fe2d835169161d3930acf1e9c750dd2bc64b6

Is it by intention that local unix users fall into the "trusted domain" 
category or is this a bug?


Best regards


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



