Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 501814EA11E
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 22:07:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=M5WmChtOoto97BTCwyYkOJBxyHAdJxDqCO7QpKduagY=; b=mmHERYsougZLJZba7tb/KqPNBS
	Qiz0qq6JRzd/h8SZPUxRIwFXfFg+DfimZktYXrbY8d2DOOviXz9+SbVDPg0HGwhunwMjc6XNvxrcZ
	rHzBNbBDcwcxorZvUvKogvFZvNNXUrydzhPQ9ieGRP8vkPB/w/bxUbE6vlvAcrK+kcSzDgDONyhMg
	B14O3NGQ+hN3JQ3pzLLcbaYzo6XOU3Ply5IyS6QZ46kEZDJUSFReT6WpE6hNKodfV2e9t/h+4YJQ4
	bu8Of3DZj33s0Dv36IlFauvwT/4PVJWj3nYr10ClfnkM332ICqFemOYi9j5+XU2HKKKbcKAF1Olp1
	D94UVOcw==;
Received: from ip6-localhost ([::1]:57772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYvdo-0064l2-7U; Mon, 28 Mar 2022 20:07:04 +0000
Received: from [104.200.28.160] (port=45076 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1nYvdi-0064kr-Vj
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 20:07:01 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id D766D3A1;
 Mon, 28 Mar 2022 20:06:55 +0000 (UTC)
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: Are there Python3 libraries for the net commands and etc?
Date: Mon, 28 Mar 2022 16:06:55 -0400
Message-ID: <2292509.7Z3S40VBb9@edfu>
In-Reply-To: <CACyXjPwFhse8VtiuitVco-Q9UtpzUSwk3xxUz020rK7M=gtp4w@mail.gmail.com>
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
 <3853301.dWV9SEqChM@edfu>
 <CACyXjPwFhse8VtiuitVco-Q9UtpzUSwk3xxUz020rK7M=gtp4w@mail.gmail.com>
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
Cc: Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, March 28, 2022 3:44:46 PM EDT Richard Sharpe wrote:
> On Mon, Mar 28, 2022 at 12:44 PM John Mulligan
> 
> <phlogistonjohn@asynchrono.us> wrote:
> > On Monday, March 28, 2022 12:11:18 PM EDT Jeremy Allison via
> > samba-technical> 
> > wrote:
> > > On Sun, Mar 27, 2022 at 09:21:38AM -0700, Richard Sharpe via
> > > samba-technical> 
> > wrote:
> > > >Hi folks,
> > > >
> > > >A lot of system management scripts these days are implemented in
> > > >Python and I am sick of using popen and system in python to run Samba
> > > >commands and then grub through the output to figure out what I need.
> > > >
> > > >Are there any Python3 libraries that provide the functionality of the
> > > >net commands?
> > > 
> > > I don't think so. The only python SMB stuff I'm aware of is:
> > > 
> > > https://pysmb.readthedocs.io/en/latest/
> > > 
> > > I think only Samba does the management stuff. However,
> > > most of our management stuff is drivable directly from
> > > python, as that's how we do much of the testing.
> > > 
> > > Talk to David Mulder from SuSE or some of the Catalyst
> > > Team as they know much more about this than I.
> > 
> > There's also https://github.com/hamano/pysmbc that I used in past
> > projects. It uses libsmbclient, rather than being pure python.
> > 
> > However, I do think Richard Sharpe meant management stuff. I am also very
> > interested in doing less fork/exec/parse and make more use of samba
> > library
> > bindings for our `sambacc` project. Personally, I keep meaning to spend
> > some time digging around in the samba-tool code. Since there's some
> > overlap there with `net` around things like domain join, even for
> > non-AD-DC servers, I think there *are* some existing libs to do a lot of
> > these actions. However, the documentation is missing/not obvious. One of
> > my big stumbling blocks when I see a package/api that seems to be
> > something I want there's often a lack of clarity around how to make use
> > of it due to stuff like undocumented arguments & some magic numeric
> > constants, etc. However, its been some months since I last looked so
> > things may have improved too... so take this with a grain of salt.
> > 
> > There was also an effort to add JSON to some of the commands. If smbstatus
> > and/ or other commands had JSON output we don't have to do low-level
> > parsing of output, even if we still need to fork/exec/read. My team was
> > interested in this but we didn't have sufficient bandwidth to actively
> > pursue it ourselves. However, a teammate alerted me to a new MR on the
> > subject earlier today:
> > https://gitlab.com/samba-team/samba/-/merge_requests/2449
> > 
> > Anyway, I just wanted to reply to say that Richard isn't the only person
> > interested in this kind of thing. :-)
> 
> To be more specific, here is what I am interested in:
> 
> A python (3) library that provides things like:


You motivated me to look a bit. Note I have zero idea if any of this works or 
works for a domain member server (vs. a DC server). I am just looking around 
in the sources:

> 
> smb_mgmt_net_ads_join/smb_mgmt_net_ads_leave

samba.netcmd.domain.cmd_domain_join

samba.netcmd.domain.cmd_domain_leave

(Where samba.netcmd.domain modules are imported first. The sources are in 
python/samba/netcmd/domain.py the samba tree)


> smb_mgmt_net_ads_status

Unlike the above two, nothing jumped out at me immediately for this one.

> smb_mgmt_net_conf_list
> smb_mgmt_net_conf_setparm
> 

I also want these, along with a `net conf import` api equivalent. :-)
I have not seen a wrapper for these, but I may need to look deeper.

> and every thing else :-)

Of course!  :-D





