Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 322873D668B
	for <lists+samba-technical@lfdr.de>; Mon, 26 Jul 2021 20:10:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=hs0yzVQnDuzLxEWbGP8w6Bnsjz/AZQkoJUrELJ7O7oc=; b=rqmL6qMc+IbDz7t+5DiAzzyiWi
	pZeXMTKJUvc4XMs3a8Nrj/DJfrRQYp0iJisYjL0RitbHJSYAHcUfsyDu7EoPeG0g+KErP/4ZwjvZV
	5QLPLqCKMqycLvcCg9iQkn0SItEPcnetdoaxVJjdTBJPT/ryz6lc32+BorNQUm3kZ2WUQZXX4ffCD
	7Z5m6yU0RyyuoBce0JYot/shimOo8y9XgvcHSwqwbGPUH9WBh/bsXdN/zS5YFD7MqKbsX6agwMpxe
	E0chZRkDosvV2d7jmDHIFIDpznD0cQNedGCOVoc3Nf845HGqZGwqK+x3Ysp5vEYF4Ps7mqMxLDtjS
	ipB7LG6g==;
Received: from ip6-localhost ([::1]:45990 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8534-000ruR-Li; Mon, 26 Jul 2021 18:09:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47500) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m852z-000ruI-Ny
 for samba-technical@lists.samba.org; Mon, 26 Jul 2021 18:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=hs0yzVQnDuzLxEWbGP8w6Bnsjz/AZQkoJUrELJ7O7oc=; b=g38QPru2hq3KeFwYNCJuFo7hXe
 oNatQclkrwK7CLKG6itZjfFmAMWzCvkVYkW6U/BGC47SAqSN5tFNH2j8NECXLu+qwVttlfnRCL+mc
 APbYFvZN6uABJ2f6o7Lw6URIzk6++5bHtDh59AkJUUDGcYOdumpI3yXaKeipAjQJL3Dj31vdWyR5H
 c9YRiW/ZCFERMMr0FUaA7jHe1bYMpsSP6LtEFrO8Fc0+fHikEeUxa2vkUxBzH23MKlRlMPK9zbT8H
 K2FuNlULulMtxvLfx1gJgCZWTFrY/EZz+owBZeH8ScdbmK2iLCc0aFABU/+kaThehII0rk4iFCmkX
 jnmCw/kIaULYglR1Ld0wO3RLk+czH59K+YefTUoPcsBXhYEChW5EaxzBN5VbsgzA1kN9E/2tCds+d
 bd7pb9TeaqEg28MRfzo4XvKDBW/WfzTLvbcpDWmZRK0OvtshV3FMD8OPs+TahlOR2OQL0N2fDeSsc
 NpXEXn84MFzdkR0MyrvVEmMN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m852x-00086M-Ql; Mon, 26 Jul 2021 18:09:48 +0000
Message-ID: <a079cb3012ed6d394ca1d0471d9ef5b51cd988da.camel@samba.org>
Subject: Re: Given PrintNightmare, should spoolss go the way of SMB1: off by
 default?
To: Andrew Walker <awalker@ixsystems.com>
Date: Tue, 27 Jul 2021 06:09:40 +1200
In-Reply-To: <d16ec56b50d93d52f39cfff40c4e42bc7b6f593c.camel@samba.org>
References: <e95c3ab28e222f9e5edc8eb6993cd34fd862a3ff.camel@samba.org>
 <CAN05THQbpJQbeRrt-rAF6K0tpnqRi9rRrg8xRxA34d=_Sy9EKQ@mail.gmail.com>
 <CAB5c7xrm79T2A_bL2DNx+irnv1s95PNhVrf1ZPrmsH21nHkFHg@mail.gmail.com>
 <d16ec56b50d93d52f39cfff40c4e42bc7b6f593c.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'm quite swamped right now, so could another team member please take
on the task of flipping this default for Samba 4.15 please?

Thanks!

Andrew Bartlett

On Fri, 2021-07-02 at 13:26 +1200, Andrew Bartlett via samba-technical
wrote:
> On Wed, 2021-06-30 at 23:39 -0400, Andrew Walker wrote:
> > We've had it disabled in FreeNAS for ages. I think it's an easy /
> > quick win to reduce default exposed attack surface. 
> 
> Any chance you could work on the patch to disable this for the next
> release?
> 
> I can help advise, but just need to be careful what I promise to
> invest
> my own time into.
> 
> We could add an alias with a easy to explain name, but I'll settle
> for
> the default being changed, selftest still working and this all
> documented etc.
> 
> We do need to double-check that it makes all printing code
> inaccessible, via all methods.  (The manpage is a lie these days, as
> everything should go via spoolss under the hood, but do check). 
> 
> I would love, later, if we could actually compile out the printing
> code, like we can compile out the AD DC. 
> 
> Andrew Bartlett
> 
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


