Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F724F6957
	for <lists+samba-technical@lfdr.de>; Wed,  6 Apr 2022 20:23:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/GeRQsRTeBlJayxjUY8RmrIYPnjLlVhLQ7lCTbs+dko=; b=1X24oqB5UeVKMSPDSBgMLFdVvc
	cGdMDbnzNGt6Csmdg47sMEn3v0acoH/RzmLSJNQ9scKocz12WTgMGRFDu5I2s+KfIZevl7zttUYNd
	y+rODeUXonCVGrnEhSrcjXffIe981vWMxPwRG6TwPuoLS0i8PARabA+WzZ3IJbpUyjY8XKCMOsJ6w
	a7BaKjhmnmX60kPJVDx7FzrxKGcO5FpuK/KNXvtLMP2RICe3Zbk9Z4nEvsc7Zzm1eGuR4Z5Cr/JOU
	mYAB6WpKHmZGtA1+JHKhNsxLntzySImEtDNae/bCgf6DRH7uNIZmlX3IA3WsVNUd35P/uFyr9j9YL
	UmgVuY5Q==;
Received: from ip6-localhost ([::1]:23268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ncAJ9-00ATST-1w; Wed, 06 Apr 2022 18:23:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38206) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ncAJ3-00ATSK-92
 for samba-technical@lists.samba.org; Wed, 06 Apr 2022 18:23:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=/GeRQsRTeBlJayxjUY8RmrIYPnjLlVhLQ7lCTbs+dko=; b=Q80lIa/Wz9tc8GCk0xVlqHpZqO
 TxwPNDCBmyHQHA7wmX2MUJFF7oDpBawpX//pdFxvGR4BnKsCZlgWv3Tk+gb531WfTYrdg6/l/r0Ax
 rbKravDcUUlppk40TNbN0a6IUKq8QKEqntz7rkozKFijoUmA/5D+KGoiekh2zEFlHcugEHHampjkf
 5AhSOGe6rY3R6w5F+3bpuXpDCU110R6IJKpVPPJ/8ffcdRXLNbpQeXywTaeTNxoJSa0oCqtVqEzi0
 +4FD8a39uqx+AmRNjmzvijILdcSGPGsbSePyVrLkHvEJRg16TbL1Gz3v7awujN3c9EEM/rz7bWStM
 BoqVGcyPqu69Xa60hBHDALmbLesi5L+/5cuM585NmEsNh0QUbk2v8l2Af8zX96l1KHZnzBA4W7b1E
 bwPgxl64y20752ajb44taBdgItKkUXE4l4+THqTyb2Wp1EZpav9ePvFG+9U3e+X8wvBEd1mAQs7vc
 E9n/2q4MRjt0ABjr7O5S3k/6;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ncAJ1-005gu8-DQ; Wed, 06 Apr 2022 18:23:00 +0000
Message-ID: <fd4c7dea0de35dca3563a4a6a7ede24264443b7c.camel@samba.org>
Subject: Re: doing a test build of samba
To: Michael Tokarev <mjt@tls.msk.ru>, Andreas Schneider <asn@samba.org>, 
 samba-technical@lists.samba.org
Date: Thu, 07 Apr 2022 06:22:53 +1200
In-Reply-To: <b14d999d-ad6b-b080-a5a2-70dc54331bc4@msgid.tls.msk.ru>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <0a7f7fb7724efaa78937a1020ffb110eb5e6b75f.camel@samba.org>
 <1b3f5415-f263-8b56-c66d-77049719b018@msgid.tls.msk.ru>
 <5417159.ZASKD2KPVS@krikkit>
 <b14d999d-ad6b-b080-a5a2-70dc54331bc4@msgid.tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2022-04-06 at 13:34 +0300, Michael Tokarev via samba-technical
wrote:
> 06.04.2022 13:22, Andreas Schneider via samba-technical wrote:
> 
> ..
> 
> > You're aware that the testsuite runs for 4-5 hours?
> 
> 
> Sure.  I've run it a few times already :)
> 
> 
> 
> The --quick version completes within 10..15 minutes though, - this
> 
> is already a good start, but it too requires a --enable-selftest
> 
> build.

We haven't maintained the list for --quick in years.  Somebody needs to
do some work to figure out a list of tests that cover the most things
for the least amount of time and rebuild that list.

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


