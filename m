Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E97A13FAE57
	for <lists+samba-technical@lfdr.de>; Sun, 29 Aug 2021 22:10:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=rEgJh4q1HS/+z6CnHNZ9Lix606yWrqDUyeO3On1WAe4=; b=R8TwkoDgIX6voltF5z2BNVaqsB
	1X2EyKjg2cJdBMTHQMRPyqa616XgYaQKz5/0jMrPNrUG+Sp5oBymDcv3RH4Y5jwLLYaWcc87S6X2B
	Cd/mgcew7/zTqvUrO09Mhyp9V4Pl/YQ2seaCEA0cAGjY76H9ytrKAPQn/KwPiG8xo+LVTrfSPjnqs
	xmvyrLFnNCMVZkCYLOvCsIELPPQP/6/iq67KGizXm8q4zC/Ce9Vs7aJODNo6WCT0Qc8pwF/Lukqz2
	8F/NOIvpVacFwvzXhqhlyZj6X8uaBoln6YbofxY244lU1Avctm7O01O2alMM/GtDnCWeSjvklQiRU
	QnYmLP2A==;
Received: from ip6-localhost ([::1]:24272 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mKR7S-009mAb-7G; Sun, 29 Aug 2021 20:09:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63068) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mKR7K-009mAS-Dv
 for samba-technical@lists.samba.org; Sun, 29 Aug 2021 20:09:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=rEgJh4q1HS/+z6CnHNZ9Lix606yWrqDUyeO3On1WAe4=; b=WAyxEnwwk5R2mUtYonXSQZpUmv
 Pz4Z7JkR8i78YvZHlaz5Gz0P79ebr0RLpUeilNahneI3FYv+CJf2KPx97Fs+K7dBnBcGI1D4CuldT
 xtfr78E7qCfJfI7M/KPFUPGqPPiS+aKDEgWKCsVc104YgbTjAAyi2Qpl5GKH7BEZBL5X5yq8dirqZ
 iiOMgDERg6IsO+3Tve6Eji58acRpWJuJbSzlh5tGk/cmqn3vgLfa9l8Whl+5ENNZjAo52O4evIWe1
 5m7Q3uDUDek7f9jNw4XamBVMY1mXdoUcriviW2s0KX2qQXtAQ7y0CMlWE5ds5Y6lb1/b3IMu1YZ/9
 v/7gpuJg3Deb5TknwR4LCQj9N7Lal1hVko6lxyeLxr/fmS0wHp+Rhe5imaJUPJF7r16aFYrfqXqOM
 DM2keAzOvC3PHPkboF9bRHY4IxUwic3CkdE3NObLRCmrkhPb+rSPcff5FQH9R2fgUxbM/tJMCva7P
 P/5ousCRL2hDfpjfGwq1hPvY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mKR7I-003bVy-Kc
 for samba-technical@lists.samba.org; Sun, 29 Aug 2021 20:09:21 +0000
Message-ID: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
Subject: OSS-fuzz needs some love
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 30 Aug 2021 08:09:15 +1200
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

It looks like OSS-Fuzz upstream has moved to Ubuntu 20.04 - perhaps
only in part - and this has broken Samba on their platform.

https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=37748

This in turn seems to have given those of us on the CC for the bugs a
flood of mail complaining that the tests are unreproducible.

An upgrade to Ubuntu 20.04 is a good thing, the older 16.04 was the
oldest platform we supported and we had to have a special exception to
allow the old python found there.  Leaving 16.04 behind will make
upgrading our minimum Python and GnuTLS easier in particular.

But this breakage means we won't get fuzzing results for a while until
someone has some time to work out what is broken and fix it.

I know everyone is super-busy, but if by some miracle you are not and
fuzzing is an area of interest then these links might help you help:

https://google.github.io/oss-fuzz/advanced-topics/reproducing/#reproducing-build-failures

https://wiki.samba.org/index.php/Fuzzing

I'm always happy to give advice and review patches.

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


