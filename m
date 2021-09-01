Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 580FA3FE38F
	for <lists+samba-technical@lfdr.de>; Wed,  1 Sep 2021 22:11:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=32pqeBkClor+TtOlHtDoR3RA2l6vx8Rrm+Dvb9xWBc8=; b=LykBzy3XT1wmE2KPFRdGsRTv+O
	XNVDhXJrsATK5IjmMOyQ0fzwh+YAKHs+1AkXmmn86nHTjszh0EmSg1Z8PNuX0XfkKXn0s3+BY3RyB
	29XLh7cIWJPSomR12SToybfzkZTw0ho97eM/8ENb+aYI22Dsx0Ilorc1jidVud2AI77MPL7v5ARdW
	R+f/gOUgOUVKgEkiQiyU7Y5U5gRC5apagG4/2YeHxWi1g0b9K5I0jn28icfnNjjogTc7HkIqcJeHR
	gCyjm+sbop1+T+vftEtJ0MBZA898oub9ixruCx06zdks5suwBDJeKMoJKiMpvB/T85ZZVAtje5/dH
	RderLjbw==;
Received: from ip6-localhost ([::1]:37910 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLWZ5-00CfYt-2c; Wed, 01 Sep 2021 20:10:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30294) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLWYs-00CfYk-LR
 for samba-technical@lists.samba.org; Wed, 01 Sep 2021 20:10:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=32pqeBkClor+TtOlHtDoR3RA2l6vx8Rrm+Dvb9xWBc8=; b=ScuIW7hSCG9URu3qk/lwrqAxUG
 7VVAsnFqypgqmIHemW/r3i9hiRFZKH6kJGE4S9gZm1pBaFxE0bp8YDxeZ8eO4jiO09CsQy8cKdYVn
 zTT1UvgAWSWXSwQx+gEB4e0iQJXmIkM8TcMBDkXaA8N5woYVsbHDaDt+ubXn8JhdMKWJEBkXYT14D
 /bOd+nR0QimvTx6FFwAYgbdQ1Qs9yE8+GyE6HibNA1qvAttmW6XzC8UKAA7qt3GQJ6JWKbkftI4a/
 mQMYFLMp8+ViRpumU3qYEkvTciyHHRh25O5Xr3ehH3l0xPlA6PbYvZQtrgCZJ4SFzNpFApQBx9R97
 lXPQ3994GXFZWGS+gcS9OsTA43hF+7nvfz/KcU2sPjXw6LdUS+rQnVS0OzJrGdCMy1MJEsD/TehXK
 8jFzTpWfKHa2nYtcNLWPflsjowIV1sxKTuH7xqZzuTGAVO4LZY4GplnFthuR5ZSw34+JntR+ODZNI
 kSvGVFiIz4YpDSaZUoXBZiw0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mLWYp-0047gd-GD
 for samba-technical@lists.samba.org; Wed, 01 Sep 2021 20:10:17 +0000
Message-ID: <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
Subject: Re: OSS-fuzz needs some love
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 02 Sep 2021 08:10:11 +1200
In-Reply-To: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
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

On Mon, 2021-08-30 at 08:09 +1200, Andrew Bartlett via samba-technical
wrote:
> It looks like OSS-Fuzz upstream has moved to Ubuntu 20.04 - perhaps
> only in part - and this has broken Samba on their platform.
> 
> https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=37748
> 
> This in turn seems to have given those of us on the CC for the bugs a
> flood of mail complaining that the tests are unreproducible.
> 
> An upgrade to Ubuntu 20.04 is a good thing, the older 16.04 was the
> oldest platform we supported and we had to have a special exception
> to
> allow the old python found there.  Leaving 16.04 behind will make
> upgrading our minimum Python and GnuTLS easier in particular.
> 
> But this breakage means we won't get fuzzing results for a while
> until
> someone has some time to work out what is broken and fix it.
> 
> I know everyone is super-busy, but if by some miracle you are not and
> fuzzing is an area of interest then these links might help you help:
> 
> https://google.github.io/oss-fuzz/advanced-topics/reproducing/#reproducing-build-failures
> 
> https://wiki.samba.org/index.php/Fuzzing
> 
> I'm always happy to give advice and review patches.

Some more context for anyone who takes this on:

https://oss-fuzz-build-logs.storage.googleapis.com/index.html#samba

https://github.com/google/oss-fuzz/issues/6301
https://github.com/google/oss-fuzz/issues/6180
https://github.com/google/oss-fuzz/issues/6291

Looks like work needs to be done to confirm we build in oss-fuzz mode
on 20.04, upgrade the Dockerfile on their side to say so, then on our
side drop the 16.04 build (and the old python exception for the fuzzing
case in buildtools/wafsamba/samba_python.py).

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


