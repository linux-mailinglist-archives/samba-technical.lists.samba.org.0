Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B09713482B2
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 21:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WZiUwT9dE3GkAjagsa7Uyn/O79c2BWC2GMp0ki/FV0M=; b=SlN8qfD2w4x0OiyceDo6zBPK1p
	H2AdzYpnjVL/uZYJ5dZPDTtjcBNkn8hVF4+ax06RqzqJ91Zs36o0jgSnVXz8PdKqcFABw8JM3ZuPp
	skBuMN1GeQQcZGmh6iM46gqJi5D7AepAAO/LZhAmBbfzj2lcj4MsrcwN0YIh85p16x2ZLyx6SlIqE
	WK5aLbEjZH7Sv5J1TqLtNkFOnPrKo/3iBW+hWU9Gs8V5HiZDb5LcAfKH5ljhJVTq+ElwoOCfE5ZT+
	e5LS3Bm0Cpbqm+ujsbcE1C+04BjLvY4xGZn47wDPBP6CTuNj28kv04Zn1pwMjKmIlaiKcistaaV3+
	J++h7nvQ==;
Received: from ip6-localhost ([::1]:50370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP9uv-006eAg-My; Wed, 24 Mar 2021 20:15:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9uq-006eAZ-Je
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 20:15:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=WZiUwT9dE3GkAjagsa7Uyn/O79c2BWC2GMp0ki/FV0M=; b=xeM17GGtDYaOMjrlHAgX01eMbc
 j6wfMeYpAFigIBewI9gYANFKXocjUPO9EJGcOba383HxTQ0k6zS/7MGEas642VFrFPEOur3ffgHbp
 lint+vFxx3YQXH20qG6uz91XChRn+VAM7kgrnbuwpAhMy7bk284v//MS3XDt0ihVXvl7ssnxO5KMV
 AjGFqgeGFI2+FreKIA2UQCWulXg4zrkBc9416+Gy3fKCHFjbIo4AQ1Witjbp66tu9EqNbQPpVFAZD
 5ZJydBykenX+fcDT8PZa1O2GT6KBO6X8rjFkXMi2nBtWudY6lP31mlEZa+g5X32aw4TlaoeMxXbLl
 EjZaPxGU+E/XjvlGOfqyTONaY0ywlwTM5KD1zXNSsCSrR7yYrIzK/pX/0TMJKtfPOhmJeTyzdxJYJ
 K2q2ozhAfjzH/lRN/nk//kc4F71MGKObQelRJ99F1or3nuVyxnQFgq7aAm60y5PW6+B/7DfvnvrA8
 q4IcLtrrRZlZDjO25TdIu87M;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9up-0008AC-30; Wed, 24 Mar 2021 20:15:43 +0000
Message-ID: <947c1d9d04170b3216c769814642eb6a4ed71c32.camel@samba.org>
Subject: Re: Drop NIS support
To: Ralph Boehme <slow@samba.org>, Rowland penny <rpenny@samba.org>, 
 samba-technical@lists.samba.org
Date: Thu, 25 Mar 2021 09:15:39 +1300
In-Reply-To: <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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

On Wed, 2021-03-24 at 21:11 +0100, Ralph Boehme via samba-technical
wrote:
> Am 3/24/21 um 6:57 PM schrieb Rowland penny via samba-technical:
> > On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
> > > On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-
> > > technical
> > > wrote:
> > > > On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via
> > > > samba-technical wrote:
> > > > > Hi,
> > > > > 
> > > > > could we drop NIS support for Samba 4.15?
> > > > > 
> > > > > This means getting rid of lib/replace/system/nis.h and yp_*()
> > > > > ...
> > > > +1 from me. Let's see if anyone else is still
> > > > using it.
> > > > 
> > > > So the current list for 4.15 will be Tru64, HPUX, NIS.
> > > > 
> > > > Any more for any more ?
> > > Just to be clear to others, this is not the so-called NIS support
> > > in
> > > the AD DC which at one point helped Active Directory Users and
> > > Computers managed the rfc2307 user attributes.
> > > 
> > > I'm happy for the real NIS support to go.
> > > 
> > > In terms of other things to trim, what about some of the printing
> > > modes?
> > > 
> > > Andrew Bartlett
> > > 
> > How about idmap_hash ? The one that says 'DO NOT USE THIS BACKEND'
> > at 
> > the top of its manpage.
> 
> ...unless you know what you're doing.
> 
> There are folks out there using this at scale so removing this is
> not 
> really something we should consider.

That's the rub, once you commit to an idmap approach it is a massive
challenge to change.  

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






