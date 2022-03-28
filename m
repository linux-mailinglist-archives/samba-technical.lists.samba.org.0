Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D044EA0E4
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 22:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=8JZ4EuYlR5o/spKj8jgDY8OUNkk2/B6nm5hT+9CJ1tI=; b=Ko1gpC8Gxk8GojfHIxhBeDiPSR
	5f9ZtxI54WpWhzSOyn/HQjrWTY49rWMR4CdlSxRcXH81G/HeUjgLOdfUKV/eH6Qd+OIQFjBaD43Bg
	lWAbXorIW3wutkcvd8RQjCAkTT1XBDN0UTP0BZehPppSY4O2l6Qe2jrNcJHx1f0O4HPzMepVtF2mH
	X5mB918L1yaxIzRkRzIZbaYv0qynaFZd9MfN8uSSVClusRiYL2bvjlC+UnoQeVFmMwR0Fxt+hqK4c
	uMUJyijdxKxheFuCI0tEG1OLK+Rhd7swBzn+ztJq+3nWvdAbpKTNDiq8M4wyzr7Wk76HxsPC868EV
	UeK+2tDQ==;
Received: from ip6-localhost ([::1]:57112 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYvWb-0064Qi-Ez; Mon, 28 Mar 2022 19:59:37 +0000
Received: from [104.200.28.160] (port=45074 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1nYvWW-0064QZ-Gj
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 19:59:35 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 43E7B3AA;
 Mon, 28 Mar 2022 19:44:19 +0000 (UTC)
To: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Subject: Re: Are there Python3 libraries for the net commands and etc?
Date: Mon, 28 Mar 2022 15:44:18 -0400
Message-ID: <3853301.dWV9SEqChM@edfu>
In-Reply-To: <YkHeJrztO2KnRMpn@jeremy-acer>
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
 <YkHeJrztO2KnRMpn@jeremy-acer>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, March 28, 2022 12:11:18 PM EDT Jeremy Allison via samba-technical 
wrote:
> On Sun, Mar 27, 2022 at 09:21:38AM -0700, Richard Sharpe via samba-technical 
wrote:
> >Hi folks,
> >
> >A lot of system management scripts these days are implemented in
> >Python and I am sick of using popen and system in python to run Samba
> >commands and then grub through the output to figure out what I need.
> >
> >Are there any Python3 libraries that provide the functionality of the
> >net commands?
> 
> I don't think so. The only python SMB stuff I'm aware of is:
> 
> https://pysmb.readthedocs.io/en/latest/
> 
> I think only Samba does the management stuff. However,
> most of our management stuff is drivable directly from
> python, as that's how we do much of the testing.
> 
> Talk to David Mulder from SuSE or some of the Catalyst
> Team as they know much more about this than I.


There's also https://github.com/hamano/pysmbc that I used in past projects. It 
uses libsmbclient, rather than being pure python.

However, I do think Richard Sharpe meant management stuff. I am also very 
interested in doing less fork/exec/parse and make more use of samba library 
bindings for our `sambacc` project. Personally, I keep meaning to spend some 
time digging around in the samba-tool code. Since there's some overlap there 
with `net` around things like domain join, even for non-AD-DC servers, I think 
there *are* some existing libs to do a lot of these actions. However, the 
documentation is missing/not obvious. One of my big stumbling blocks when I 
see a package/api that seems to be something I want there's often a lack of 
clarity around how to make use of it due to stuff like undocumented arguments & 
some magic numeric constants, etc. However, its been some months since I last 
looked so things may have improved too... so take this with a grain of salt.

There was also an effort to add JSON to some of the commands. If smbstatus and/
or other commands had JSON output we don't have to do low-level parsing of 
output, even if we still need to fork/exec/read. My team was interested in 
this but we didn't have sufficient bandwidth to actively pursue it ourselves. 
However, a teammate alerted me to a new MR on the subject earlier today: 
https://gitlab.com/samba-team/samba/-/merge_requests/2449

Anyway, I just wanted to reply to say that Richard isn't the only person 
interested in this kind of thing. :-)




