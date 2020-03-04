Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 011F3178793
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 02:26:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=OaUo1cV0A4HpPE+hq0yXLjaoxwgmqdr4CR3E3siTMYA=; b=3LSD9u6tNjCOUIsm2eWj8PUo/j
	trsdj7AhEIvAKFXvI7HVOvtpiWkTRNSdQKRuV9Uay8I0vvZLtz7XyGf+szX9SLhXa7o30Q8D7Tr28
	HYPKwR0osj/CuMBB5mZJZ3C1gjGNna0t6nwSfm4DMTIleb1RMi+ZjOyQvqSa0bCn7RGc9i+3GVyyt
	L3s6rV7ZNX7BEkK1dyGn+wCwXS6itdFFshhPrWUuEGNWnG/JBH59/9XKqVAVxiMLeABMHrMJBF6w9
	8kGjJhoxAzxlpyVy8mPehLd8vWNL5rW3Q5WWKhNFZ471BOnMskv2xbKVg1hpV49LjRiKwLkoTh/tK
	4s/lCDqg==;
Received: from localhost ([::1]:61960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9InP-00Er3q-DZ; Wed, 04 Mar 2020 01:25:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55596) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9InG-00Er3j-Gv
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 01:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=OaUo1cV0A4HpPE+hq0yXLjaoxwgmqdr4CR3E3siTMYA=; b=v/CGEVHQUcLOLlBCeBT8+gDEnk
 YGwncYmSJOBzx7vXHZVK2H5DPG1NUyOKpTc8LO7C0VkMH48RUwe+9iRU/wX4zEDFTSOHtjFGfeRxb
 +CI6MOjevbXJpTRrINCA7mnsJWKG0dwgF+RsEGOoliZCVyZ26qyCpBH1OnGUbxOoOzOUpIxDqC8xB
 pL1VpNS64CdvUfq0lMIhcX2gTV1xUjwkI2kNYT6pPwd2unus1Evoxj713nRlGLmXLTNkZn7u/uQNY
 bxe0wL84nKzFr1dNVlwDE9E67sS/ZUEDNnThLCwW+TBUwPvQx7HnsPuquCC5NhiXl3kIQgs32rNvv
 BfYGzicHIJjUO24FmInVcauM2l15Qxts+hCKeBYYeGO5wL9BforPVfaAh6TmzZ07e8IqURsVL7Eh+
 GGUK1qWCuXN86vqZJkCGsRrkPohQN6FXwsaj5HuXAnd2uZWffiMobtUSBMjQSOUm253GlGa4Z1rL6
 TbncJMKZXwVdROXX7swK/85k;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9InE-0002lw-SH
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 01:25:49 +0000
Message-ID: <7fa9094832aa924f9526d656e1dc21de823c0075.camel@samba.org>
Subject: Python 3.6 for Samba 4.13 in Sep 2020?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 04 Mar 2020 14:25:44 +1300
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

G'Day,

I wondered if we could set our minimum python version at Python 3.6 for
Samba 4.13?

It has useful new features like PEP 498: Formatted string literals

https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep498

More particularly, recent tests showed that the only two platforms
without it are Ubuntu 16.04 (Xenial) and Debian 9 (Streach).

Debian 10 has been released for 6 months now, and will have been out
for more than a year by the time we release Samba 4.13, and likewise
there will be a new Ubuntu LTS 20.04.

This came up because a small helper script failed to parse when we
extended the samba-o3 tests (which run on each host) to include the
local "none" tests 
https://gitlab.com/samba-team/samba/-/merge_requests/938

I realise it would be 'simpler' to just change that script, but I
wanted to raise the broader question in the hope that we could steadily
increase that minimum version.

See https://gitlab.com/samba-team/samba/-/merge_requests/1193

Thanks!

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







