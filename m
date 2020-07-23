Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382B22B40C
	for <lists+samba-technical@lfdr.de>; Thu, 23 Jul 2020 19:01:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=1CTGiZiiblicNnVnh5cQ/MDI+GNcVG8OcKHeEOJVZlc=; b=A8m89MzwHWvJSQADuuBqqctW/y
	Q8bR5V5j5RDWAz2XQEdtbnOdSiWhVwy2UuWpAneH6QyaMMg457YhK7GpJp0vZcW+NM/kP46SO09fy
	RPc+dtf+LEfW2zEvGiDUYHmZzmSKSQlv6YKJDPvixB7iBWaTsM1xr3+b3+kuFwKVzUnsWo4sZvDWN
	s9LssYFt08QFIZm400TuQpG9KjPuAw7x9kY+NJgvI8QVRUb7AVhbjAqWOODTP8pWbM17ThwhiXfYH
	ydXu10PppH7KVrkZEvugUM/vi5DKn897eE5SIUgn5ALSvn4EsJ9tkV1VILzEPZwudtCiUrb0yMmEa
	p/D0cw2g==;
Received: from localhost ([::1]:45442 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jyeaY-009S7V-MJ; Thu, 23 Jul 2020 17:00:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62538) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyeaS-009S7O-F7
 for samba-technical@lists.samba.org; Thu, 23 Jul 2020 17:00:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=1CTGiZiiblicNnVnh5cQ/MDI+GNcVG8OcKHeEOJVZlc=; b=FbA0cjaMPrrDx/pnaV25qYEzLX
 bFHMhGIo9nAyLas8K43qU9Yks9vGuuRPGBS+u1IarySn0WW6ZYN9GyERDdseIyz3Wdjhwb0tYbd2i
 kuwVDz65JxLnWOr8E6Ge5efe3cup+527WKDUHKIa/kqRH/lD3nj8GUNdYQHgUDu+7Opi+uU0LVKS5
 qI6LKC16pf2zBfN4kjAIU6LJJPmlZoUI4hkGBMDjCptiT3GEn0mWnwLBWuMSfWi4BAWVkj2Cu42IP
 SZDr768Tsq41kvsbYF2LcJ/1EN/tQPXpvFG94F4oF/oP7RxdDQggx0+jGmeT5eLwvFhqk9clHaQoc
 wBQ/vTaGmUThKxmgVJHkqrNYgCGo/hnrTponpSfCzNzgeuPxBecCPxF/8LoK+jAs867xjj5J4pADw
 +OT7JNeGvocLnRRu+CmhynzrG1/Vxe/ihdO6Ba8uK27ay64NNfpseaMYY+11wQQ5ITJ6AcT0rXrht
 /ma88M1DHt5pd4FZ2UVbbBvU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jyeaQ-0006tU-3r; Thu, 23 Jul 2020 17:00:50 +0000
Date: Thu, 23 Jul 2020 10:00:47 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: Massively excessive DNS lookups in ads_XXXX code.
Message-ID: <20200723170047.GC4157@jeremy-acer>
References: <20200722222945.GA3385@jeremy-acer> <7713308.QliZi8XY78@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7713308.QliZi8XY78@magrathea>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: metze@samba.org, samba-technical@lists.samba.org,
 Samuel Cabrero <scabrero@samba.org>, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jul 23, 2020 at 07:22:57AM +0200, Andreas Schneider wrote:
> On Thursday, 23 July 2020 00:29:45 CEST Jeremy Allison via samba-technical 
> wrote:
> > Hi all,
> 
> Hi Jeremy,
> 
> > Do you concur ?
> 
> Yep :-)
> 
> Have you ever called 'net ads join' in a big network with 200 DCs? Once we get 
> the list with DCs we will resolve *every* name we got to an IP address. Yes, 
> one would be enough. If we run into timeouts (30sec) a 'net ads join' takes 
> about 5-10 minutes to succeed.
> 
> Take a look at the while loop in discover_dc_dns() :-)
> 
> 
> Thanks for looking into this! ;-)

Do I have a patchset for you ! :-) :-).

It isn't actually the large network
(200 DC's) that is the problem, my
customer has more.

The problem is that we aren't doing
the DNS lookups in parallel, and are
waiting for all requests to return
before returning.

I have a 3-element patchset.

1). Preparatory work to clean up a lot of the
libsmb/namequery.c code to modern standards.
This already passes CI and I'll try and get
a MR ready. Happy to add you to the review
list.

2). Add the dns_lookup_list_async()
function. This is working and already
being tested on my customer site. It
parallelizes both A and AAAA record
lookups by using lib/addns/dnsquery.c
(with a few new functions). Currently
it has a hard-coded 10 second timeout
on a list of names resolution, but
I'm planning to add a "dns timeout"
parameter (default value 10 sec) that
allows it to be set in smb.conf.

This is the core of the fix - even
on a network with 300+ DC's it sends
all the name requests in parallel and
collects all it can get back in the
timeout period. It's not an error
to timeout. This puts a hard limit
on the total time we spend waiting
for DNS replies, and allow us to
easily pick one at the end.

I have this working for the resolve_ads()
code now, and I'm finishing up fixing
it for discover_dc_dns() (these
functions are very similar). Once
this is done I'll submit an MR
and add you to the review.

3). Fix the fact that the way we
use ADS_STRUCT currently drops
information on servers we just looked
up via DNS + CLDAP and for subsequent
operations does the whole DNS + CLDAP
lookups again inside ads_connect().
My patch allows an ADS_STRUCT that
is being re-used that already contains a valid
ads->ldap.ss address to use it without
further DNS or CLDAP lookups. This is
an optimization.

With all these fixes the 'net ads lookup'
'net ads info' commands do *one* set
of DNS lookups, and *one* set of CLDAP
pings - in parallel, and this should
speed up all 'net ads' operations by
an order of magnitide !

Jeremy.

