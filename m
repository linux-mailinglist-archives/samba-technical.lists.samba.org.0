Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DC507C9A68
	for <lists+samba-technical@lfdr.de>; Thu,  3 Oct 2019 11:05:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=YrcWO6q7gGLvER6GIQFrvYIKOwQeoguzm6Zi+9kMKc4=; b=izcV1TWBXv9iffcYb0xfW7pYUv
	5tlliZxJPlDT6z/dEFayX2C9NY5Dpx1/KEhjL7ZDc5diQ0dsEBBof+XuPx+TizkCrjInzOHmPc9wh
	JUBuI+ge1xeSaJcxrKJw47KUeiuXVoemy07uIgxWkes52TZfSj4wFRFYo+iXeJYTH5KPLNfYwiCKC
	Bx/tL0sLH1yb6JB+75Ol4qLdtv5fdV7q1SsRUIOx6+VaZio3t3i/TdAL4T8hocj3NzcZOj+Px5NDy
	hEZaD7Q3cpF0IPz7cJYpAivhIEA+mPZ4OhfqXboVh2rjoExBCHxdi/Dbk1z79y/mQ3E6TAg4m3BpM
	nl/qFtRg==;
Received: from localhost ([::1]:51370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFx2c-000foc-9G; Thu, 03 Oct 2019 09:04:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15716) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFx2X-000foV-Lw
 for samba-technical@lists.samba.org; Thu, 03 Oct 2019 09:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:To:From:CC;
 bh=YrcWO6q7gGLvER6GIQFrvYIKOwQeoguzm6Zi+9kMKc4=; b=TfblwU3QMHDbitb5hcUPf0J2y8
 L+a3rSypuJfmSweBGt1XZDaFsbw/OQ9cJDqt09qfz2LUPVGRkbCDCgaL+PSgIGRfAk8swUPCmSI7i
 p1IUTusowA15tsFUBtoAAYQ6YwhxQPcy8jP1HVBOnZMf13yn8+O3AKAEMpeuZoDsEsXs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFx2V-0004kT-M3
 for samba-technical@lists.samba.org; Thu, 03 Oct 2019 09:04:47 +0000
To: samba-technical@lists.samba.org
Subject: Samba and GnuTLS
Date: Thu, 03 Oct 2019 11:04:46 +0200
Message-ID: <2061554.bL4SkraOkk@magrathea>
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

Hi,

I wrote a blog post about Samba and GnuTLS:

https://blog.cryptomilk.org/2019/10/02/samba-and-gnutls/


There is also a news about it at Phoronix:

https://www.phoronix.com/scan.php?page=news_item&px=SMB3-Faster-Encryption-Samba


Cheers,


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



