Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 446D97893B2
	for <lists+samba-technical@lfdr.de>; Sat, 26 Aug 2023 05:44:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pvrkTtsmm5GdNisINCysW+cT3Wq806c5HaeOFtu9a/c=; b=dJmKhxYHyxYrinPapiKJ3g5jkp
	Cd4comwXWLZxv5JfgVyLKNZ2DXiwn2USQPNdoEmys6AkYU8k9TeuAz3jURITSWZBfTk2fm3VjWrLU
	Iw535yrh3J3jiSAUOrsEphxD0UY21PlQ0l5WikR3RTWo0uRv/xzQDqbiOMp7LA+sHzdhG5OVMW4YZ
	BOsbFFeCZmj3l74pLJbN9coS6pCz8yVHaMcx8N6vI++OXUd1Nlsw+y34dT4oJM0l1M/0o9AxTwSGI
	rzZhifNvnluVeFHgyACgjQXkkuHnia5ulFO/JOUwnlb23Q6FPz+BlOxyxqSjy1PUvFsDcrfckKkcN
	W8n/VfXw==;
Received: from ip6-localhost ([::1]:38682 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZkDS-00EXcA-QH; Sat, 26 Aug 2023 03:44:02 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:37905
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZkDL-00EXc0-HN
 for samba-technical@lists.samba.org; Sat, 26 Aug 2023 03:44:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1693021408;
 bh=pvrkTtsmm5GdNisINCysW+cT3Wq806c5HaeOFtu9a/c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XdTWqWZmgL2tzZxrgYsWDq5LYfSahTIzVQS9mZ+kaMuBBHRcAZJk3TCwHFr4305/e
 qKfOZia4yXkX+6XWGvAGXcbq7sNiDhwuS2LL4QxA/trFhTqEBxZcPI2XBn2CPgegr/
 EHuemFy/vRUds1zflep0dAA+Btyk0MWl2fK9ARJqtf+1qysnbUnv0oCom3r6tXWqH9
 am8GkwirNaGy1gyfmH63DTNntJmeZ9PwBmnkbrgY5nJ99iXKWw92foaJZ9aPyHzdPd
 qjFAJ4ZeOilnK+lEVeqsl6jWPrLngea+JLASQprmqcWUbdQjDF529Rn+/tu5kOqvL1
 IowOSj1kKDVEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RXjN007B3z4wy6;
 Sat, 26 Aug 2023 13:43:26 +1000 (AEST)
Date: Sat, 26 Aug 2023 13:43:25 +1000
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Subject: Re: increased `make test` logging in syslog with "debug syslog
 format = always"
Message-ID: <20230826134325.1e7a11f4@martins.ozlabs.org>
In-Reply-To: <0b6e0b93-ac34-da36-287d-7581a177ba54@catalyst.net.nz>
References: <6a0d3223-321a-624d-111e-1c1a67ef4396@catalyst.net.nz>
 <d37fb34bffdc0ef6f3bae57eef17a399f46d37f6.camel@samba.org>
 <bb9223b0-ec58-83ff-bad8-a241fa003ec6@catalyst.net.nz>
 <20230726203352.6c6cfa15@martins.ozlabs.org>
 <0b6e0b93-ac34-da36-287d-7581a177ba54@catalyst.net.nz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Douglas,

On Fri, 25 Aug 2023 15:15:59 +1200, Douglas Bagnall
<douglas.bagnall@catalyst.net.nz> wrote:

> On 26/07/23 22:33, Martin Schwenke wrote:
> > 
> > Can we just call debug_file_log() directly when necessary, like this?
> >  
> 
> The answer is yes.

Yippity!  :-)

> > [...]
> > I haven't tested this.  
> 
> I did. It worked -- or at least it returned things to where they were at 
> some point in the past when syslog would get just the copyright lines 
> from every make test.

Thanks for testing it!

> I forgot about this all because I had `logging = file` in my working 
> tree's selftest/target/Samba4.pm, which made even the copyrights shut up.

I also forgot about it.  Thanks for remembering...

> > If it is OK, I think we could also revert the changes to
> > dbghdrclass(), though we would be generating a header for no
> > reason... but I think we did that before.  

I ended up leaving those changes.  I can't remember why I thought they
could be reverted.  Looking again, I think they're all necessary to
force the syslog-style header for stdout/stderr and to handle the
switch from bool to enum.

I'd be happy to hear an an alternative explanation that says we don't
need those changes.  :-)

> Yeah. I will make an MR in a few days unless you do first.

I decided it was my turn to do the next part of this...

https://gitlab.com/samba-team/samba/-/merge_requests/3239

It is still going through CI, but I thought I'd create the MR.

peace & happiness,
martin

