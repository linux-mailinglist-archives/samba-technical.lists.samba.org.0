Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C086CD33
	for <lists+samba-technical@lfdr.de>; Thu, 29 Feb 2024 16:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=CgwytfHGmJy2Q8M/JIRky/7rF6cbR87NA9s5JlJleDA=; b=jxeBd+RApSCjfaQzTF9pdEuQSF
	eSoTnOffjV+lVM1/v4RtH74GBfQnvaRYeKRWzc/hywZV6aystu0kzKiArlLzWn7pf8N5A/B0LXtkh
	k7BWm6G1XP7JQCr+4T6b/s/TvtjYv4nQG3CoRk2rK8DUNVYgcGDN66b98mUQe8VpivCKMTCwORWCp
	71ieM/v/bwjBSCz4Fa7H/Qyde+9V8f63MBA6kZrUexY3OQe0GIu4xQZ2eFvjtIxVfuFH7EXFNkZe5
	FLhIVWC3I38JiULOWDk/FgUgZ9/RZzjvPb3hHbrMj5CWrYvgvyUEaB6VQMOmD5S5IIp0ElCQi/WI0
	otVEL6qg==;
Received: from ip6-localhost ([::1]:39250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rfiSZ-009i19-3w; Thu, 29 Feb 2024 15:36:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45882) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfiSV-009i11-GL
 for samba-technical@lists.samba.org; Thu, 29 Feb 2024 15:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=CgwytfHGmJy2Q8M/JIRky/7rF6cbR87NA9s5JlJleDA=; b=SZZb749yTF6XgPL6huK2jloRjc
 edM1hQk2GzoD2jupm5SWgPPjeL0Lv0nXYgSMu8m1/DA60q1xXXtQ5HelNb0Jme7XtAEslwuvprJml
 0BChJfnfIHJJ4PDPl5qfUighggECR8VQKcc40mSxrFmTfpIdRTRi8ew9Uo8S9IeK3tUJKohGvKKdj
 V7vVBruXB2Y6F4vTl7XGGT4MLDUtHla6PvxM+Z77hhhgGgo8MbshSocw9G+zbFkNxgBAYkaa7qC+d
 O/c06plh8jtTcTVk0ZqWX4hd6oGPuVaPNpccINbtOJfRGeUPKDvUBEfj2XPXU0sI8IRS+WkRIGdz6
 SHDrO/zGggVZOcL74yBRClrNz0S09BsBE1UWmHlFw/jD97UvqWEk0azF21TCwLHo8Yf4CY3SOwtY4
 /+DXvAc6Hk0H8eOcRIGhN3bHkz607qd3ldQq/9E7h040S6eW5bIdtYoS34mi/2nAO6I8E6pps2GOp
 4Okp7HDvNvM+MJvp/i8468Fy;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfiSU-00FSuw-2w for samba-technical@lists.samba.org;
 Thu, 29 Feb 2024 15:36:30 +0000
To: samba-technical@lists.samba.org
Subject: Regression: ldb performance with indexes
Date: Thu, 29 Feb 2024 16:36:30 +0100
Message-ID: <2223722.hkbZ0PkbqX@magrathea>
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

my colleagues discovered a performance issue in libldb:

https://bugzilla.samba.org/show_bug.cgi?id=15590

As soon as you use indexes, ldbadd will be magnitudes slower than it was 
before.

Could some ldb expert please look into it?


Thank you very much!


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



