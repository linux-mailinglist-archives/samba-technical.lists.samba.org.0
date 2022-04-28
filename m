Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87575513B6D
	for <lists+samba-technical@lfdr.de>; Thu, 28 Apr 2022 20:21:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=IkbN/KFhh8l+OlJ4fkp1shiKxXsGi73twGE8X/od5Ig=; b=cQCqAO0zRSKSpUhhcm+Ciocz7s
	zQwWvmxHl+KHokPqYO+Ukv2HEh4e8dxlM50reTs3JVx20/0SNnZWPzFRacCiqJ4yYEk7qO0xZRvcj
	kuxoYrRjwa5p00iplIa0qf8DLZ/pwXYnTF0m4iIS0VpaX/s5sjuy2fYDjudifCMDVRJIUdry2tB5o
	lg6QQC8s+sSnCUvP5NO46/NUhpZu+QB82ZOeDAw10j3Nq84TZc1vHk4Exeg3m99D69cAuCo+wwP5O
	ZR6HMD22AE/Gc9yZ6F5hOMY+ncnUxxVqEl9hfF8PkMcsnBt/trKaHfjf9NiOJg887gbHOB2chaYsy
	sgzyAEuw==;
Received: from ip6-localhost ([::1]:18628 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nk8kw-003F5y-Fh; Thu, 28 Apr 2022 18:20:46 +0000
Received: from [104.200.28.160] (port=45090 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1nk8kr-003F5o-IM
 for samba-technical@lists.samba.org; Thu, 28 Apr 2022 18:20:43 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 8A3703AA;
 Thu, 28 Apr 2022 18:20:37 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Re: ctdb client python bindings
Date: Thu, 28 Apr 2022 14:20:36 -0400
Message-ID: <8863985.OV4Wx5bFTl@edfu>
In-Reply-To: <CAB5c7xrbN6UUuSOnOg+AHVeV6-VNQtgvHQ5KFqJKkF=X7LBxZQ@mail.gmail.com>
References: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
 <CAJ+X7mTv5xR0J5e7OxLzhsnbHuB0wuECwL9Zn7pS+gu3LL2mBw@mail.gmail.com>
 <CAB5c7xrbN6UUuSOnOg+AHVeV6-VNQtgvHQ5KFqJKkF=X7LBxZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Cc: Andrew Walker <awalker@ixsystems.com>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, April 28, 2022 11:03:54 AM EDT Andrew Walker via samba-technical 
wrote:
> On Thu, Apr 28, 2022 at 4:14 AM Amitay Isaacs <amitay@gmail.com> wrote:
> > I appreciate the efforts to implement python bindings for ctdb client
> > interfaces.  However, I fail to understand the motivation behind this
> > work.  Is there a requirement from some applications to have a python
> > interface to CTDB?  Or do you have some other plans?
> 
> Well, I was working on this because our own (truenas) has python-based
> middleware and I was wanting to be able to get ctdb status info without
> having to launch subprocesses. I was also planning to write python-based
> collectd plugin to gather stats from ctdb at configurable intervals.
> 


I'll second the desire for python bindings for samba functionality that, while 
doable by running CLI tools and scraping their output, are more elegant and 
efficient when using an API.  Specifically, I'd (probably) also be able to make 
use of these CTDB related APIs in my code.


> > In the past, Martin and I had considered developing python bindings
> > for client interfaces.  The motivation there was to rewrite the ctdb
> > tool in python. However, we never got around to doing that.
> 
> That's a good idea. I could go that route, which would reduce code
> duplication. Basically keep existing behaviors and arguments for ctdb tool,
> but have it be python tool. Then it will probably not increase maintenance
> load.

May I humbly suggest that re-implementing the ctdb CLI not be a strict 
requirement to adding useful Python APIs.  There's been a number of cases with 
regards to Samba where a small-enough task suddenly gets bigger in scope and 
then either takes a very long time to get merged (if ever).



