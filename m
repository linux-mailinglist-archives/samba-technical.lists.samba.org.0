Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C9F180A48
	for <lists+samba-technical@lfdr.de>; Tue, 10 Mar 2020 22:22:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=XQdMkzx9DHTztPbvEJchPnyqohW/bpqF9b0AUrTkwF8=; b=Z/ZiFTNdn4lEHHj1j6KO5s9DYT
	GGpFGEBDsKYuGg4UNTlveChTvQc6TiibcLTyke7kna1wqkK6NXseUym+Q8rwrVoFcHtJ2b4Bi/1dK
	HG7ymPYCKPOz9FjdENoXyOJ4tu4qOfbQu6v3jljB4yVHv+AAk2Gg+4dgvp5MssnLffpPtea4rxs84
	ULrABHgwRCfPHEMInLkTjahZFKrXI0/Q35GLbIjnGVV0FovtuUrKq5crim1zRJDuvXwP2mtXAHGNe
	UDD4wteGJ859LX1m/0M7bYVm8GZEBVal3ouCXleEmp5sxc2+GR/yRHL0233WDc34DB8suRnE0UP2X
	ZFpoUe9w==;
Received: from ip6-localhost ([::1]:49760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jBmKC-00FlsC-2T; Tue, 10 Mar 2020 21:22:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19706) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBmK6-00Fls5-Pu
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 21:22:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=XQdMkzx9DHTztPbvEJchPnyqohW/bpqF9b0AUrTkwF8=; b=hBWkayIoa2stbwcxeco36RxR79
 cAUzMKFlW1L+8gB2t1LEqWJijjnGl+n+UM9B6T350oGRZ4G1/fXPGh0v85+FjyH9UHp1eD6EXtOq5
 KneZWNKF1HjZX9zORMeGasl2Kg3snldGCtUurE905MW9WJHolE4mOMnOEJocq1fboGUC1osfKH5r9
 YsbEhFw5VfY0Z3gXWqr2Nm7SBiosXbmGuek82+jbBE78V3ZdbgI01sl8Z4I4wdGrjElzczU5hzFBh
 JGaE+QJdFjHDk3GKrh5zfOxwsACPNRGKbGBuz2IAVzCBFeSMtyrHp8ZTRuIht5PfFh981I2SluRwh
 vQQn/I0AUgTP04bsvWUl+yyzYn+ow2JBMqCw9VzXX3LEVfMtiXxLBnXj+K2mTlolQWJtYM+FwvLhU
 PtrnoN/I7f+qZD9j0L33VqFOot0uO+JmpWIMDoPgJU1CJJn1aetpsQy2D8JsxbDCXkjSwLP/RGpsy
 mxxhMQ8NAx+ifZ10AMoEBbFo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jBmK5-0004Ll-Kk
 for samba-technical@lists.samba.org; Tue, 10 Mar 2020 21:21:58 +0000
Message-ID: <6288bb3c3367182cf773c932d85e0144de6fa3a3.camel@samba.org>
Subject: Idea for someone:  Run with python warnings in --enable-developer mode
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 11 Mar 2020 10:21:54 +1300
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

We got a wake-up-call with "samba fails to build with Python 3.9:
invalid open() mode U"
https://bugzilla.samba.org/show_bug.cgi?id=14266

We need to find a way to run waf and selftest with python warnings
turned on.

It might be as simple as setting an environment variable in autobuild
or .gitlab-ci.yml, but my current gut feeling is to control it in waf
so we can see it during routine pre-commit testing.

I would like, just with our C warnings, for --disable-warnings-as-
errors to work, so we can still build older versions of Samba with
developer features on newer python (which might have deprecated things
we use). 

https://docs.python.org/3/library/warnings.html

I think we want to set PYTHONWARNINGS=error into the environment and
have waf set on itself
 
import warnings
    warnings.simplefilter("error")

Is anyone interested in taking this on?  Of course what follows would
be no doubt a pile of warning fixes, so it may not be a small task.  

Or should we put this up for GSoC?

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







