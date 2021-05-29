Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7A2394BB0
	for <lists+samba-technical@lfdr.de>; Sat, 29 May 2021 12:31:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6lhniC83ESRj+/1mm/kNoGpfNQ9E/hrS4QBUS/IZVcQ=; b=an9KuEJvLCcegqy1dAWdIBVB79
	70VWMsSs+/4zJLxBiTTbBJFF4Y1NDAJS+V7jEqQgLa39BSW+DCBA3a6F/zNrI2ppIBS8m9CF+qM5Z
	99/MgGa1ZeHIsokDODgT9o1JL6G4lENQbbIVUo/0A7oA0aiVkS+91C0hvd7YLmufQJfpcUP9pZR2m
	XJGVsHYCfGVbKpSWyZn20lUlA4sfDta4sJe2CEY2zgG79uOyQaHEayjSvRqyGrHORkPZhlbm75KVZ
	FSXKnkHArGUl5I1n4aGC/k9I5SJZb+i39tToClh2FKQctYMl4nc+oRN8WcrAQDLPoRnk/mOpK1O3C
	uKPHGpZw==;
Received: from ip6-localhost ([::1]:18358 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lmwFV-005BSR-Jy; Sat, 29 May 2021 10:31:21 +0000
Received: from bilbo.ozlabs.org ([203.11.71.1]:34383 helo=ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lmwFP-005BSI-Gr
 for samba-technical@lists.samba.org; Sat, 29 May 2021 10:31:18 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FsdBP2ZvLz9sW4;
 Sat, 29 May 2021 20:31:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=meltin.net; s=202004;
 t=1622284269; bh=reyv3Of6ndg69N/QgUolvd8x8BrFUElMeJJnbosJffU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JFk2jdKndM4kBBdtF8TMNXQ7YB5R9Uqk9+xo0ZTLcWjD6ZWbQ4Oa6Z+nuQhA8+L5e
 93vZWODF3hh8WLpzE5y75WuvGnWVer0sHNRwPvn/u1lZob1L6k+DRcRCBIhH/BtDaJ
 AEKnfUmFa8lktSH3SJ7d0DaNBD088BZb87KiWZxtSc6qa/dGXKvx21nM3W9n15QYfe
 FCGRtkOekgXkrh3zZLDyInDsvH4d5QVaXUQkgcV7SM3jnsEEJeuQ5c9jsCHG3PHcW6
 qw1qN9rxy/ZjtmpgSSPqEt79hX0PuYQc5fW/f6OvDR9wfoBcqkV8zr5j2ZJBLXs6T9
 3pxuPCZ+9i8eQ==
Date: Sat, 29 May 2021 20:31:08 +1000
To: Andrew Walker <awalker@ixsystems.com>
Subject: Re: JSON input / output for CLI utilities
Message-ID: <20210529203108.4c718729@martins.ozlabs.org>
In-Reply-To: <CAB5c7xrQu3qTxP3pmaBt2ZqrFABDTovESBA3j6WVaHp7H4Htrw@mail.gmail.com>
References: <CAB5c7xqUC9mZ8-VFDmM44b=EL49yBiWkMikf8BWgU0FjC+25MA@mail.gmail.com>
 <20210529195550.3dc109c0@martins.ozlabs.org>
 <CAB5c7xrQu3qTxP3pmaBt2ZqrFABDTovESBA3j6WVaHp7H4Htrw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 29 May 2021 06:23:10 -0400, Andrew Walker
<awalker@ixsystems.com> wrote:

> On Sat, May 29, 2021 at 5:55 AM Martin Schwenke <martin@meltin.net> wrote:
> 
> > Hi Andrew,
> >
> > On Thu, 27 May 2021 17:42:20 -0400, Andrew Walker via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> >  
> > > I know we've added JSON output to a few of the CLI utils. Over the past
> > > year or so I've added this to various utils in FreeNAS (using  
> > libjansson).  
> > > Is there an overall strategy for this? I'd be happy to upstream what I  
> > have.
> >
> > Sounds good!
> >  
> > > Also is there an effort to add support for JSON input to them?  
> >
> > Your effort appears to be it!  Thanks for that!  :-)
> >
> > One wishlist item to think about... and my example is for CTDB...  :-)
> >
> > If adding JSON output and, perhaps, input it would cool to have the
> > command-line tools be able to run in a mode where they stay connected
> > to the relevant Unix domain socket.  The most useful example would
> > allow "ctdb statistics" to be repeatedly run within the one session, so
> > a reporting tool can periodically collect the output without the need
> > to reconnect.
> >
> > This could go hand-in-hand with addition of an interactive mode on
> > tools that don't have one (e.g. "ctdb").
> >
> > If this is an interesting idea then I'm happy to try to work on that
> > with you in whatever time I have available...
> >
> > peace & happiness,
> > martin
> >  
> 
> Yeah, I have some added for most of the ctdb commands.
> 
> truenas# ctdb -j status | jq
> {
>   "nodemap": {
>     "node_count": 2,
>     "deleted_node_count": 1,
>     "nodes": [
>       {
>         "pnn": 0,
>         "address": "192.168.122.176",
>         "flags_str": "OK",
>         "flags_raw": 0,
>         "partially_online": false,
>         "this_node": true
>       }
>     ]
>   },
>   "generation": 1598490685,
>   "size": 1,
>   "vnnmap": [
>     {
>       "hash": 0,
>       "lmaster": 0
>     }
>   ],
>   "recovery_mode_raw": 0,
>   "recovery_mode_str": "NORMAL"
> }

Looks good!

> This one will take a little more time since in the patchset I duplicated
> many functions from /lib/audit_logging to separate library
> "/lib/json_minimal" to have some minimal set of JSON-related functions to
> make bolting-on JSON support somewhat simpler.

No hurry...  :-)

peace & happiness,
martin

