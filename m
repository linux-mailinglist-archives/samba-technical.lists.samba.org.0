Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEDA2D8024
	for <lists+samba-technical@lfdr.de>; Fri, 11 Dec 2020 21:46:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Zme30zMjfV95ccv7HxnA1tTjOZkDhx1MJiXQffnYYsI=; b=HJtsD5DsnXrxbwWrBKSRXngeJW
	Ox0BOd68ySGgMoMCIGZoUATby1i/euSghqCZDclp6WvXRyeHPPv5wLpI8YN7KWxvYGxEOnh/opyb2
	Ox4kOPuKdiYxgaLHOtHswLlhn3jnYPEd0k13KIFjrSoB3OjGt+rtDuK1J7MKnYhUKogM0JoHIWVS7
	keea/F4VZd0zGzj7Y+d/xtIu3lZZMYFT2Be3ckp+njurqumjlew9FqyOqHHlzuelAasa5QQHDqEeu
	K6VoRv4kbCbCitMzoPqtaNo2RMzcpDJga2eYezu/QbkTzGid0sMJyEtbSa1oIRA7W4K3+r1Uz6sSS
	SnmmEpjQ==;
Received: from ip6-localhost ([::1]:62490 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knpIe-000cu6-3t; Fri, 11 Dec 2020 20:46:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34432) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knpIY-000cta-OR
 for samba-technical@lists.samba.org; Fri, 11 Dec 2020 20:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Zme30zMjfV95ccv7HxnA1tTjOZkDhx1MJiXQffnYYsI=; b=cjBdVSskbBqNhlgEXW8ukIKQk0
 dtvNcD7s9lhSI8h3bnTmGG3QVEpGNzGGq6GnDrdtl4IF9bosAI35KYOty1K9iWavSJ3j2irLNxiCk
 6a2I1ZXmXJWef/fKw5UbvgK5UNz447R/v96c4yZwvjZt+eKuyTEcke2FPnXa38b1vlgeJloI7lLFw
 tuqpIxZtzpUPnrc/pFwP3pZIfzpJLr1pzcGxZApb7U85woKKZgYNuliegBKz1iumG51g/Fo9WEmxm
 UFpSUQbE6kdt67EEM4YUzOFcAkXwtTYz2Hk/b+yEOh6ERhCt5kOg5tPB0JA02pRwiljHLiftzkY7/
 zgbL3AZL5twmDg7cE5kK3g3FWjitNpi/fc71Ol/FQka1cG15KQSo1f1H/VK/MtH5RUgL7+V4tQSTM
 RpVE0aE2LIHvIjX27EqBeDY5oh8iTxjRw7kRXSj0Lg440u82EObbN9cpceFBhRqspidI8/WBadWPJ
 VYcnjaktMoWrTwaUzVNqE17S;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knpIW-0003D8-K8; Fri, 11 Dec 2020 20:45:53 +0000
Message-ID: <380efeccd76b37a958da2a49656a5c1c959a0173.camel@samba.org>
Subject: Re: Samba testing on CentOS 8
To: Martin Schwenke <martin@meltin.net>, Rowland penny <rpenny@samba.org>
Date: Sat, 12 Dec 2020 09:45:44 +1300
In-Reply-To: <20201210142744.398a7e75@martins.ozlabs.org>
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
 <20201209003132.328ca229@martins.ozlabs.org>
 <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
 <20201210142744.398a7e75@martins.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-12-10 at 14:27 +1100, Martin Schwenke via samba-technical
wrote:
> Hi Rowland,
> 
> On Wed, 9 Dec 2020 15:42:27 +0000, Rowland penny via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
> > Hi, based on what is all over the internet about the future of Centos, 
> > should we continue to test anything on Centos 8 ? I mean, we may get to 
> > a point where we do not know whether a fault is down to Samba code or 
> > code that isn't in RHEL but is in Centos stream. Just a thought and I 
> > could be talking out of my hat.
> 
> You make sense and I agree.  When CentOS becomes a rolling testing
> stream then it will no longer be a stable platform for testing.  Amitay
> and I were discussing this yesterday and we didn't come up with a good
> answer. One reason why there is no good answer is that we want a stable
> testing environment but sometimes Samba moves faster than the stable
> distros (e.g. CentOS 7 and GNU TLS) and this might happen again,
> possibly with other distros (e.g. Debian stable).
> 
> However, right now I have limited time available to make changes to our
> testing environment.  So my pre-Xmas goal is to open a bug, "fix" the
> CentOS 8 bootstrap script, backport the fix to 4.12/4.13 and have a
> working test environment again.
> 
> Hopefully in the new year I'll find time to update autocluster to use
> something else as a test environment.  Part of this is probably to add
> support for the Debian family of distros.  At least then we will have
> flexibility if things change.

One advantage of the current bootstrap system is that as long as nobody
deletes the CI images that are built, the existing images remain a
stable snapshot.  It is 'just' the bootstrap scripts that break for
others, and of course building a new image now becomes more difficult.
 
It is particularly sad that the end-user use of the bootstrap script
could become less reproducible, that was a really nice feature.

I'm assuming that, in the space of a few years another CentOS
replacement will grow up into this same space, rebuilding the SRPMS of
a specific RHEL release, but in the meantime this is going to be
awkward...

Of course I must say I greatly appreciate the efforts put in by Red Hat
and Red Hat's staff to building this ecosystem to which we have enjoyed
for so long.  

Thanks,

Andrew Bartlett


-- 
Andrew Bartlett (he/him)        https://samba.org/~abartlet/
Samba Team Member (since 2001)  https://samba.org
Samba Developer, Catalyst IT    https://catalyst.net.nz/services/samba



