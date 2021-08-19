Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 695933F12BE
	for <lists+samba-technical@lfdr.de>; Thu, 19 Aug 2021 07:24:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=FKXJJR+E/d8HbrkHuWmDXOz37OkPecELRHt/LNShliU=; b=NFdi3d0vTATHdOppIj2T9eaSy7
	ARIKgpufOne7aik9dtKSEX9x/rI8rqTDyBxuXBEpt2jXs+P9Kl5b2nJ+LkrsWAvDgDYzpIxlJOQnp
	rWlGJA/4lv+2by9Rb/v8wjDlgDM6V86TCtE8AgseONa3rillPfVhuP5kipjiBJW1oakcsm9rawnvd
	Am53eRBS6XmuRxwjBthiGgr4D3ZgKTpsHgNXkOOOxhgudO+sAciK9p6Y86+LXAisxCJxkVBzCpoBZ
	zbzt7gETj/paFKOOL4SXBBVvoZN4iVqSx4iKzQRZp2mLJYFQ0ltvo8BhmkMN3eGNiMItSluaLtCWi
	0bmkCjmA==;
Received: from ip6-localhost ([::1]:38018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mGaWs-007gmz-LX; Thu, 19 Aug 2021 05:23:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26300) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mGaWl-007gmp-GN
 for samba-technical@lists.samba.org; Thu, 19 Aug 2021 05:23:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=FKXJJR+E/d8HbrkHuWmDXOz37OkPecELRHt/LNShliU=; b=huKyadOm7s+DNRYIGOpDDkpH2S
 obnwZPzaIGeW7jkSCpclmxk7tQT/XngBfUbT8+0xZ6HngQFeAUK+D1MMpKnOT9w/e6U4rY9ryFvAP
 lCyyw2cc8ovxUQlT7kszBcF2kwCtdQDGbojJadVLB0Zh9cPv3QvUCutMFgzTkaVFsGKyXN5TAhMGZ
 OFMLsAbrrEcWD4kdO6o01vjDbcUqUhLBK9XX5RHuRxrj++U5g1bg1rLWzYeigxA7g/KgNjaNtWnhf
 Mg4w97sc9fc5ohclNm6OGo1x1/UJt5A+HQwt8n1435WwID8SnS9U7lTlbDpvBm0A36PpXMaqMsKyM
 5lYPN2Yamatzw3/HcbWAE9SztrFLmGFq3IB4tsH8uX9lWsLCrDg2b0vOK4sewKuQCi+Kx55a/7xz2
 rDgu+m7GI41GedbKS+11yCYizWmCF1ct3nALgsPc1Lllf3QU6DbMLpR3TYlpSjCOMDbs0n4563DJi
 M9lPqnFFf3Hl48nfqp4oQYbi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mGaWi-0020ip-MC; Thu, 19 Aug 2021 05:23:41 +0000
Message-ID: <ba396d64c1ed0336530c465aff55f768fae8d95d.camel@samba.org>
Subject: Re: [PATCH 0/2] crypto: remove MD4 generic shash
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 19 Aug 2021 17:23:30 +1200
In-Reply-To: <YR3pi9HEbhknJdl6@sol.localdomain>
References: <20210818144617.110061-1-ardb@kernel.org>
 <946591db-36aa-23db-a5c4-808546eab762@gmail.com>
 <CAMj1kXEjHojAZ0_DPkogHAbmS6XAOFN3t8-4VB0+zN8ruTPVCg@mail.gmail.com>
 <24606605-71ae-f918-b71a-480be7d68e43@gmail.com>
 <CAH2r5muhHnrAbu-yX3h1VPjW+2CUyUtSCzyoOs7MXw=fE7HA_Q@mail.gmail.com>
 <YR2E2FZNdMj2xl+0@jeremy-acer>
 <d08c99b8550cc48fe04cc9f4cd5eca0532f5733d.camel@samba.org>
 <YR3pi9HEbhknJdl6@sol.localdomain>
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, Steve French <sfrench@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 David Howells <dhowells@redhat.com>, Steve French <smfrench@gmail.com>,
 keyrings@vger.kernel.org,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Allison <jra@samba.org>,
 Denis Kenzior <denkenz@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2021-08-18 at 22:18 -0700, Eric Biggers wrote:

> I'm not sure you understand how embarrassing it is to still be using
> these
> algorithms.  MD4 has been broken for over 25 years, and better
> algorithms have
> been recommended for 29 years.  Similarly MD5 has been broken for 16
> years and
> better algorithms have been recommended for 25 years (though granted,
> HMAC-MD5
> is more secure than plain MD5 when properly used).  Meanwhile SHA-2
> is 20 years
> old and is still considered secure.  So this isn't something that
> changes every
> month -- we're talking about no one bothering to do anything in 30
> years.
> 
> Of course, if cryptography isn't actually applicable to the use case,
> then
> cryptography shouldn't be used at all.

I'm sorry that Samba - or the Kernel, you could implement whatever is
desired between cifs.ko and kcifsd -  hasn't gone it alone to build a
new peer-to-peer mechanism, but absent a Samba-only solution Microsoft
has been asked and has no intention of updating NTLM, so embarrassing
or otherwise this is how it is.

Thankfully only the HMAC-MD5 step in what you mention is
cryptographically significant, the rest are just very lossy compression
algorithms.  

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


