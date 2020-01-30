Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C540E14D841
	for <lists+samba-technical@lfdr.de>; Thu, 30 Jan 2020 10:32:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=AG2TV6ZoPT+eCHCisca1prbIoL9p8NQSRk+T1m80kG4=; b=0D5RVOIxvX1r7XR8521Mi0lkS8
	DL3DADt9et50FdGFRW14q5BIX7fEzvCqqWPRaG0KTWQrpRtpXASuYBb5ErIdeYnKzWCYpxDfEA3Bp
	qX27iZfx3Zs1wElg5eEmnqxzxvx2lNLCvXwgj6vHz2nXU6NH45XkS6jhssikvz3pZUqxuRQQsk2Pn
	qvxEPM9XgIYgPNXUN9TmU5OL6MLyNy3eoUWMM/PH6pXG1cMGgY2QTPzRAkpWGCFT6Kt2UHLthsFdm
	H6ZZp2ts330Yc/T8pIuZ66AO5B4kkBmNVAgFDiFIdgXGvfNp+TBVCidqfhW2asMOn3Fi2Zj3+ecT7
	hrrAxJmQ==;
Received: from localhost ([::1]:45526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ix6AS-005THV-Np; Thu, 30 Jan 2020 09:31:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38272) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ix6AO-005THO-SN
 for samba-technical@lists.samba.org; Thu, 30 Jan 2020 09:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=AG2TV6ZoPT+eCHCisca1prbIoL9p8NQSRk+T1m80kG4=; b=ShpOhyqycGzr8DMGSqArl8qUVf
 IahzkbTipHxMiiUmYR4O+OgdwYJdZZH12JNHv3H8MY+mB9k2Imf2b+ktDdzKvPsWt6Nx6C9dkv6yo
 HiTMYCk3zdAb3SqDAs6O1FGbCy95NovNadi4w6UaoeKS4m+sFWxw4WfIA/6RNOJBWvQSFf6neyEBR
 aipktdlwfYXhhdBl/nRiCRb1HEk/HY9pAdP/2257YEQSfRtGG0K4TXtJAycGrdmkelTI2pHO/+lk/
 O6FvdxM26krHiS0G/Pt80aa8uFJPzJRt5g2eUcp8Uexf6zKQAUQyL47+A3FFiwxa6FpfZcR/7G8i9
 Qpv6JItaxCgoLnEvdlrZ11AgWserXACf/qzMdlFImXbEwJygSFbNQy68b0CJcnCYqRs5aIfPjgC9w
 VHUk8F1cmerksjx+iNrQ/olM/ymCCg3Hca1NkytMEgyaiNTFzFPJdD8xX1Dajgb7oqqVd/tIikfdi
 oJXbZwn/18mHK9lmSS5ixVJH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ix6AN-0001E9-Rd; Thu, 30 Jan 2020 09:31:15 +0000
To: samba-technical@lists.samba.org
Subject: Re: The samba3.base.delete test
Date: Thu, 30 Jan 2020 10:31:14 +0100
Message-ID: <2891334.gmRuezT9A3@magrathea>
In-Reply-To: <50d2453f-0412-d41e-a1fa-4f6e1543a816@samba.org>
References: <1772232.gcRF95uoko@magrathea>
 <50d2453f-0412-d41e-a1fa-4f6e1543a816@samba.org>
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

On Wednesday, 29 January 2020 18:11:26 CET Ralph Boehme via samba-technical 
wrote:
> Am 1/29/20 um 5:47 PM schrieb Andreas Schneider via samba-technical:
> > The deltest20 of base.delete works if you run it as a user, but it fails
> > if
> > you run it as root!
> > 
> > Is this a bug or expected behavior?
> 
> sounds like a bug, -v please.

-v see:

https://bugzilla.samba.org/show_bug.cgi?id=14257

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



