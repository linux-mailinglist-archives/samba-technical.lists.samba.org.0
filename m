Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F8D4D53F
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 19:29:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=iBwvPhpqkNNYXV5nIzFEqH23kkQwvB0tQSv3sRYSbTE=; b=fR5lKCgEHLEQgbAlxqujCvCX/z
	v2wQYY1zst71BfHFPb5jYHfs+4fuTLLdRdh+wVxyluMXEfPB2oIpck/PytTGUNQPHLi1IIEoGDqCa
	FRRZuK96GlbOx6QtyS210e5Ca/A3YaHa51JOlt9qHd6uCcUTdqNrjpZXJzhmXJQG9hyzszO+bJrZH
	w+LzbXDIp5ZZyYv7dHOht7NzVA7L8jcUcokWimBaC2l/3SHJfR0v3FE8KCgWMfmzCih2JnSG3i11u
	FtdIFHXYmnkRGQjZcsGJdzHry30jiOzgMizcmi71EFE81mOv3VsRYkCEiiy7wAidnbI90wiVGaQFL
	i1g1+Xuw==;
Received: from localhost ([::1]:19632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he0s8-000lUR-1x; Thu, 20 Jun 2019 17:29:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48472) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he0s3-000lUK-DV
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 17:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:To:From:Date:CC;
 bh=iBwvPhpqkNNYXV5nIzFEqH23kkQwvB0tQSv3sRYSbTE=; b=p3Pl7YSc4ucZfxM9VPYLBRubtk
 zrLJugVgXaoxvsMCr5lWUFpQnO9NMU2aZsfL2fsWDJua5NpzjUTwPU5epMXcYmswmRzFKwwfD3CYD
 Mgv0UfUgkiCZjbu154hCWJVkcfxeuLa5pwvlJR6rHw+LfcoH24hznIVP06y8wFvIqGA4=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he0s2-0006tY-R9
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 17:29:11 +0000
Date: Thu, 20 Jun 2019 10:29:08 -0700
To: samba-technical@lists.samba.org
Subject: Using gitlab question
Message-ID: <20190620172908.GD109029@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I have a pending merge request:

https://gitlab.com/samba-team/samba/merge_requests/558

that has been made unmergable by a commit from another
Team member that needs to go into autobuild before
my change (it's a minor change to test code lists
that needs rebasing).

What is the correct procedure for doing this ?

Do I close the existing merge request and re-issue
a new CI-run followed by merge request ?

Or is there a way to ammend my existing merge
request with an updated patchset once I've
fixed the rebase conflict ?

Just trying to get more familiar with gitlab
workflow here.

Thanks all !

Jeremy.

