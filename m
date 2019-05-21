Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (unknown [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FFB2247F4
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 08:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=ktDEop2iaqD8FDypaz8+bBu+qY8F+bbu9/UM6u8LL44=; b=Fo+1HsEjFmiGYuVCBxhmQ4aFY2
	jZOEyX/X392ieVt1k1/88+FyqIt+WqB89Lg2YvFrYLXlPQ40eqrKdHtrl2JYkBKTYiuPIHir+pIve
	8K9QoK1SEW+abUDjAV7YaQj/11ZdD7h8VZ2clT1/zEqkL/z2mMzlE75h+LBSQ7P9q174ysxhVm776
	/qq94bD7o5QDhqwaVy/C+d02r8wgEdjdC/IIcE6Fn/9wNsRttUHe5OZMUe4mdp92xZSeLWctRiVUV
	kU9fllg0d4uSfG2TonT1609L2J6JQW4VghyHQmBW/Yy2DWiwTGT2dbrHi9ZeAQKGGZcSszTIeF/oH
	P41gE8dQ==;
Received: from localhost ([::1]:30868 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSy7i-000u9a-NR; Tue, 21 May 2019 06:19:42 +0000
Received: from [2a01:4f8:192:486::147:1] (port=14650 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSy7d-000u9T-TI
 for samba-technical@lists.samba.org; Tue, 21 May 2019 06:19:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=ktDEop2iaqD8FDypaz8+bBu+qY8F+bbu9/UM6u8LL44=; b=Xeg7yudjv/RaoUifPrNRw1kgIM
 9Izu3Yt9vyFLDGvYZW2/uMRaAIje72CnvKYz/X/B6DNlM5kX01Ok2HAS9+r3schcLIFaE6DiHgRbr
 ruYA3Q09ojSefOi4AQB39Wgx7LeTj4Zxn/JXiMiadgmtOvUso0CKBzHzctJFnBqfoXvc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hSy7X-00084l-5w; Tue, 21 May 2019 06:19:31 +0000
To: Martin Schwenke <martin@meltin.net>
Subject: Re: New csbuild run
Date: Tue, 21 May 2019 08:19:26 +0200
Message-ID: <4043444.PDZQgdqHAT@magrathea.fritz.box>
In-Reply-To: <20190521113607.55e693da@martins.ozlabs.org>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
 <20190521113607.55e693da@martins.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, May 21, 2019 3:36:07 AM CEST Martin Schwenke wrote:
> How can I run this locally on my laptop?

Hi Martin,

you need to install csbuild which is normally available on Fedora. You should 
use Fedora 29 or newer.

You can run it like this:

https://gitlab.com/samba-team/devel/samba/commit/
5e996a902488ecb3f6e6afcd528cfdd135038c50#587d266bb27a4dc3022bbed44dfa19849df3044c_228_289

Line 289-296

for 'make -j$(nproc)' you use e.g. 'make -j8'

You don't have to specify a commit range if you just want to get all errors. 
But normally it compare a range. It will create a diff what is new, fixed or 
currently not working.

for '--git-commit-range $CI_COMMIT_RANGE' you use for example:

    --git-commit-range master-mybranch~20..master-mybranch

which will compare the last 20 commits. It is interesting once you fix 
something.

As csbuild also finds quite some false positives, the above command is 
interesting, because of the diff it just doesn't report them as 'new' if it is 
in both commits. So normally you only get newly introduced issues.

Does that answer your question?


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



