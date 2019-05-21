Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (unknown [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C571824876
	for <lists+samba-technical@lfdr.de>; Tue, 21 May 2019 08:54:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=8X7o8tFhUCBBHUcM1EXgr6eqDNTT0YGDRacAFkNOSIs=; b=m8sOCZI0VMRbSO6lGCKwW4LmXy
	su9uFnbMUhzdyi5dUGsWKxI6TIA7FGohAaXwG7+N0lNY4JKnWwn5BPKSet3N2TWsxaxQTN8Mf5pXm
	5rbjfqoq5QWtb03CZv6Ca0fRzrFbKhEmxJDetUgP/agqahqd8YKYGb649K78QA/1NW9tj+Fg8JtxY
	2RHJK3CgRFJDtRFojiOBI0+hbSqWtp6vO97eFAHr71TcZd0wKwbQ+yE2WfNk+/38WsfG/oh7ZH8TY
	9m9E/FXT50XuD8eXWx5ZjA3g6VmCE/tPIFFKXLvccFnmVZ0P1xHPydULB40a6P9RMEs7g5dLiRm8I
	udw4euQA==;
Received: from localhost ([::1]:33086 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSyfH-000ulp-Pq; Tue, 21 May 2019 06:54:23 +0000
Received: from [2a01:4f8:192:486::147:1] (port=24738 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSyfC-000uli-JR
 for samba-technical@lists.samba.org; Tue, 21 May 2019 06:54:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=8X7o8tFhUCBBHUcM1EXgr6eqDNTT0YGDRacAFkNOSIs=; b=psS2lE3LDz15h5VExFyBmuXdSS
 wb18QJQZGjUKgZ7ZQZhvpagSoxF8X3R+W0/SCG47a4k669vyUS72JodG5zhCU3yYw9wlewC74ufDG
 iSkLE5gn/7l87fXGre1fB2K14Sb4KPgY+8Dw5yGjrUzqpOXLKCKV9NIHzvmr4lDp9uwY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hSyf7-0000Ns-B4; Tue, 21 May 2019 06:54:13 +0000
To: Martin Schwenke <martin@meltin.net>
Subject: Re: New csbuild run
Date: Tue, 21 May 2019 08:54:13 +0200
Message-ID: <3206132.ajtiDnVues@magrathea.fritz.box>
In-Reply-To: <20190521162924.4444f055@martins.ozlabs.org>
References: <1902926.C4UlyRiazf@magrathea.fritz.box>
 <4043444.PDZQgdqHAT@magrathea.fritz.box>
 <20190521162924.4444f055@martins.ozlabs.org>
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

On Tuesday, May 21, 2019 8:29:24 AM CEST Martin Schwenke wrote:
> Hi Andreas,
> 
> On Tue, 21 May 2019 08:19:26 +0200, Andreas Schneider <asn@samba.org>
> 
> wrote:
> > On Tuesday, May 21, 2019 3:36:07 AM CEST Martin Schwenke wrote:
> > > How can I run this locally on my laptop?
> > 
> > you need to install csbuild which is normally available on Fedora. You
> > should use Fedora 29 or newer.
> > 
> > You can run it like this:
> > 
> > https://gitlab.com/samba-team/devel/samba/commit/
> > 5e996a902488ecb3f6e6afcd528cfdd135038c50#587d266bb27a4dc3022bbed44dfa19849
> > df3044c_228_289
> > 
> > Line 289-296
> > 
> > for 'make -j$(nproc)' you use e.g. 'make -j8'
> > 
> > You don't have to specify a commit range if you just want to get all
> > errors. But normally it compare a range. It will create a diff what is
> > new, fixed or currently not working.
> > 
> > for '--git-commit-range $CI_COMMIT_RANGE' you use for example:
> >     --git-commit-range master-mybranch~20..master-mybranch
> > 
> > which will compare the last 20 commits. It is interesting once you fix
> > something.
> > 
> > As csbuild also finds quite some false positives, the above command is
> > interesting, because of the diff it just doesn't report them as 'new' if
> > it is in both commits. So normally you only get newly introduced issues.
> > 
> > Does that answer your question?
> 
> Almost.  :-)
> 
> I run Debian, so is csbuild available from some other place than as a
> package in Fedora?  I know that I could find a Fedora RPM
> and unpack it, but I figure there must be a web site somewhere that I
> can download it from.   Unfortunately, searching the internet for
> "csbuild" finds too many other things.  :-(

I just found:

https://github.com/kdudka/csbuild-deb



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



