Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D214A266618
	for <lists+samba-technical@lfdr.de>; Fri, 11 Sep 2020 19:21:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=fGHN/Pz8J5NSYqUgzv1tL3t+X6TSIqPAGFyqRRgwna8=; b=r1yh68K5LQyGBjkhGzMNvbxFS/
	LJVOH3Qhzr0A4dGQwIoCt+f3wS+tFYxCGPEEBqKeciFa1gsksm2MNNxJMlWCjihw5ZyM75w8+ggt3
	zuxQqMJ2Kcup9EvH85FKcjTeRQ0DPKJe8vgYkB6JUe+yqmO6KA/b2s7TVi0jEqakh4Z+vd4jR4T0D
	A3mRwZ9fDY8hcyyi7kin1ltxtWY5c1ueIQhHaP33Z05eZ85hcf1nV7YGmb01Jmc1vZOy+wbeOdlT6
	v7I7PiuGlNyAKwHT1prOh4VI+5ezqyfsFz91tySiATmLn9CaDs9+YscdRf9GlibbXAqpFMd4XMOHc
	mHsFHTSA==;
Received: from localhost ([::1]:20968 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kGmiu-0059QZ-PF; Fri, 11 Sep 2020 17:20:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62808) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGmiq-0059QS-2d
 for samba-technical@lists.samba.org; Fri, 11 Sep 2020 17:20:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=fGHN/Pz8J5NSYqUgzv1tL3t+X6TSIqPAGFyqRRgwna8=; b=SeAr7/jUeJ//qSP5fQHZl/9kdm
 CtQTc8uL6wQl15sRCY0I0kih9q15HAbFK+vZz7S7ebYvssh5gVwH1tqJJEUG+fUdWodVFAqZQDGDG
 W228PloXwM+oomh+PX3LJFVHnLHlccwiGaCyoXK20la9ulbmG5De+f6FHMj8bCMdbKnFDwD2W/kvC
 Nxx3f04ehh7vl4CxRWScpj+QxMU88sg2yQRi4s/v28xOMIjUN/8F38j64g1J88RLprFZWrXKGYHAf
 tYulKlt/vMq8YqLs+Cac2Eu6bcxvpyLvZq/GbcPYP/0wGYm754oHY+rIDozSTjVNG1b/NZQ9B7psL
 T3xqCopXwQP5BEqH9Gxb+XXBNbyxAAyvqC8Zakkp4Q/gE+z15i31OEM+0QPH7w3VQ3sSY6YyWEEtP
 7YMqcfeAYt1vDUfFjKlUyK8/o0N4h4eigg1U1yKiF4QwNe+ZtsXrsaYVSe+j+4ytT0WEf+7HpHhWz
 vzB2PAfn9keYYDxCWW63XmwX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGmio-0004fX-Jq; Fri, 11 Sep 2020 17:20:27 +0000
Date: Fri, 11 Sep 2020 10:20:20 -0700
To: Stefan Metzmacher <metze@samba.org>
Subject: Re: winbindd main process hangs on samba-dc
Message-ID: <20200911172020.GA1002893@jeremy-acer>
References: <CAC-fF8TWw1_JZaY_i9_n5U7vc96_+8XwfwzGoXZYQoxQAZwNjQ@mail.gmail.com>
 <CAC-fF8R4+mJ1LG1xK2+3hEws7=Pj6TYd-+FgHf6=eXEPn5pwyg@mail.gmail.com>
 <CAC-fF8RRAQbAgNA9R3kwKwt69DJY7fQwGvC3Yhz732Vmo_sh1w@mail.gmail.com>
 <501d9ca8-a49c-532f-48a3-201eed82bb1c@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <501d9ca8-a49c-532f-48a3-201eed82bb1c@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Isaac Boukris <iboukris@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 11, 2020 at 05:32:40PM +0200, Stefan Metzmacher via samba-technical wrote:
> Am 10.09.20 um 12:06 schrieb Isaac Boukris via samba-technical:
> > I think there is no point trying to maintain domain->online per domain
> > in the parent process, we should just ask the domain child (fork one
> > if needed), and avoid ever trying to talk with a DC (sync) from the
> > main process.
> 
> Yes, the parent should only ever to talk to the children.

Yep, this is the goal, although there still may be
remnants (as you have found) of old code that still
tries to talk directly.

Flag 'em, log bugs and let's fix 'em all !

Thanks,

Jeremy.

