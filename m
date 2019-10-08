Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA08D00B9
	for <lists+samba-technical@lfdr.de>; Tue,  8 Oct 2019 20:34:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=khYS1ixZiJs+pQNFxQOrpyk6k4yx4606bFxOaGk6TNc=; b=gyWnmbRTu0XEuij0xty+J8e4RJ
	j1WpN8/I9A870p/Wmm+mcG/+hQzRO2JBGgDhSL5Tt6g74CxPXkm1lSktYkZKnsHnZ+MhzIhsidTH/
	fywKmvLdaQqlFPs8ovCyHJ80RlON6SrXxiJVCTx3U2klepbvDk6Bd+uz017MzJeL7tgnJTUUK3nKe
	xPaoZIOmiFrO+R0b4am4LKxdrWfw7h4U0BvnISEZWs+Pd8YvK5OLkwPT+WUP++VdvQSEqWvaTl6e6
	dVocj8eSdofYe/Ytcs3ZNhKLaaZ3b0VeNPZSR4G2KsHw6GVco0EHyL3p5AX5iTcZdeF9mYnX2iCNb
	APfdOAyw==;
Received: from localhost ([::1]:18966 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iHuJW-002APa-6k; Tue, 08 Oct 2019 18:34:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25130) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHuJS-002APT-6S
 for samba-technical@lists.samba.org; Tue, 08 Oct 2019 18:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=khYS1ixZiJs+pQNFxQOrpyk6k4yx4606bFxOaGk6TNc=; b=TOSmHR7d8X0V3E+2CiIoF1J+gG
 2f5SQrXWujFU8+Se2CvbupmafpjaGTIXNEFuNbqVxg58Gf4SfKGfBsethy/nH3YvuY138GEGmFHA/
 NK7r7ieQdU4oRti1thCL1xHC09BZHlzWYgr8QNPM//1m11SFjT5e9sBzkj9y4rwrCO+k=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iHuJR-00010Z-Of; Tue, 08 Oct 2019 18:34:21 +0000
To: Jeremy Allison <jra@samba.org>
Subject: Re: Samba and legacy Windows support
Date: Tue, 08 Oct 2019 20:34:21 +0200
Message-ID: <1657858.v60hS3BQgh@magrathea>
In-Reply-To: <20191008182451.GA1583@jra4>
References: <5849953.E8HlOTvGIY@magrathea> <20191008182451.GA1583@jra4>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 8 October 2019 20:24:51 CEST Jeremy Allison wrote:
> On Tue, Oct 08, 2019 at 10:59:41AM +0200, Andreas Schneider via samba-
technical wrote:
> > Samba with version 4.11 currently still support a lot of systems which are
> > already out of support. We still get bugs to either fix support for
> > Windows
> > NT4 or OS/2. Also we know that Windows Server 2003 with Active Directory
> > is
> > still deployed.
> > 
> > In order to remove support for those platforms which are very long EOL, we
> > should try to make announcements when we plan to remove support.
> > 
> > ## Steps planned
> > 
> > With Samba 4.12 we plan to disable SMB1 by default and then remove support
> > for it in Samba 4.13 or 4.14. This means end of 2020 or beginning of
> > 2021.
> I think aiming for this by the end of 2020 is possible. There is
> a lot of work to do first though.
> 
> Announcing this is what we're going for is a good first step to
> allow people to prepare to move off SMB1-dependent systems.

Isaac and I will work on migrating the DES code to GnuTLS so that SMB1 still 
works.


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



