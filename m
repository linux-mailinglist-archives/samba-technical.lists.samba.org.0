Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 582024EE44A
	for <lists+samba-technical@lfdr.de>; Fri,  1 Apr 2022 00:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=oyQalBHVZz+V+cznQRdovT6WDo3AfuO89mnaF5IAxxU=; b=4zdlwugGHbogDPktRInf20Gr/4
	RHpCHJ9DD+MOfjh8MTUo2nj5zkI668TBCb5JvlUwww8cLVYjxs7oYaJm4KRBhrzfrj4AFBtVo2WCQ
	jfEmefZCH0eMmRO+Bt5Tx3M9qxOlmfrDtuxKURuTXAOapHB0mnx4qN8PMjWTuE2SNCUVcRf3R2K8i
	eRwliJ/bGPDGquHdBnXAIe8kMeNv6JySu8jfRAHmNnA+gGQh9LnICJoDoFZ+dlqTYHJLdlFE7DtWY
	5Wb8I4jn+j/QGYjDPntHA92pYz0EiWkqWzkHMnm91nkDBtdKq4iddz2Nn2AAy1emb1ffaytsdoTWZ
	GUdUBtew==;
Received: from ip6-localhost ([::1]:55004 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1na3Sl-007H36-Jk; Thu, 31 Mar 2022 22:40:20 +0000
Received: from [104.200.28.160] (port=45080 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1na3Sb-007H2x-Dj
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 22:40:11 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id B4A132617;
 Thu, 31 Mar 2022 22:40:05 +0000 (UTC)
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: Are there Python3 libraries for the net commands and etc?
Date: Thu, 31 Mar 2022 18:40:05 -0400
Message-ID: <2564963.hkbZ0PkbqX@edfu>
In-Reply-To: <CACyXjPxfpMvWT8qBfwWw57y1N9fwYUJsvp7zGm05FOWrqqXRFw@mail.gmail.com>
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
 <2421934.YKUYFuaPT4@edfu>
 <CACyXjPxfpMvWT8qBfwWw57y1N9fwYUJsvp7zGm05FOWrqqXRFw@mail.gmail.com>
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
Cc: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, March 31, 2022 4:02:32 PM EDT Richard Sharpe wrote:
> On Thu, Mar 31, 2022 at 10:57 AM John Mulligan via samba-technical
> 
> <samba-technical@lists.samba.org> wrote:
> > > We don't have bindings for these right now. It probably wouldn't be
> > > difficult to add them though.
> > 
> > I'm interested in contributing patches for this. I've already looked at
> > the
> > code needed to be wrapped (lib/smbconf and source3/lib/smbconf). I've even
> > started prototyping.  I've done C/Python APIs before, but it's been a
> > while
> > and I'm rusty, so I'll probably start by making a draft merge request for
> > a
> > subset of these API to get early feedback.
> 
> How were you planning on dealing with the 'net conf list output'? As a
> list of dictionaries, one per section or a dictionary of dictionaries?

The bindings are a bit low level, so my plan is to map the `struct 
smbconf_service` to a tuple, like so:
(<name>, [(<param-name 0>, <param-value 0>), (<param-name 1>, <param-value 
1>)...])
That's a two-tuple of the share/section name, an then a list of two-tuples 
each as a pair for the param name & param value.  It's very easy to go back 
and forth between a dict and a list of key-value pairs.  Once the low level 
bindings are more in shape we can also discuss if there should be a more 
"pythonic" wrapper on top.  

For example, I want to have a python function that implements the equivalent 
of `net conf import` but I'd rather (re)implement the logic in python not C. 
And if so, we'll need another py file in the samba tree for that. It could 
contain other useful wrapper types and functions. We'll see what others think 
when it comes time... :-)

I just filed a draft MR with my prototype. Please feel free to provide feedback 
on this attempt so far: https://gitlab.com/samba-team/samba/-/merge_requests/
2469



