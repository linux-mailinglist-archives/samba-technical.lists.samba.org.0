Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A79CF7B3AAE
	for <lists+samba-technical@lfdr.de>; Fri, 29 Sep 2023 21:27:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Bob+dkgxqlplYRdn+IiyNHxfhRxeSl0qz1LD4HgGysQ=; b=P9mfWI4bD4zv9+ZjOjRbYEUGQ3
	zdX4XlxjskXnoPPt6HygxZOAiHelc4TdeLgUMos1qs2Q6nlFDp4Yu6nLxmqLSFf/+GmiNSu+PWXFT
	NNcKJ4gPbhGGYLtFThYE1gkFIBPTC/mUeh51cwtrAwreYNu+7N5MvJyxqHADO6yIJ4c8c3EA3qEii
	CdBPoP0rLLDYCqO3ilT7Qf+NOzKEFwolC9mAELlzsC5Sech1ajQBfg7ar/6HEx200OUXJxHuzkBwB
	2xkFS3GZ1xMLqBP0NF7lXVVb0VMrI3gq0CVhUReaeu2OhoXAlxyKIikwuxgim94hshab09gy5dcny
	CCNeh0vA==;
Received: from ip6-localhost ([::1]:56466 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qmJ99-007JYS-Dn; Fri, 29 Sep 2023 19:27:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41502) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qmJ91-007JYJ-DF
 for samba-technical@lists.samba.org; Fri, 29 Sep 2023 19:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Bob+dkgxqlplYRdn+IiyNHxfhRxeSl0qz1LD4HgGysQ=; b=jurpPb9rm6y+WllPK8VtO9wv18
 YR+OnjCDm2buNzarvF5o/pRJB8/F8SmI5ScJ+91wYbmVEz/w+gBWtZDGphFbdPqXCZj0k4mdO9OES
 kYS4eWAX8f3zSOztmA+2RADplvTS+mC/KTgcgqkcVgQP+o0Eyg5v6IDE/eTvQQU+KLh8e4Yj9NEZg
 bdPzILU/Cq/CORSeCcPFnBIl+4hHMKg3BxLxSxKgaN4miIFGKJX3gQNZFCE8mwmJmNqJwEPqTYiCA
 iVUVZIRhrosPcAh+AJg3idhRnzkRZIF7iEj7tQkLyI45WM3ownCw4VoYSCY9w/pP2+Odx0NgV0+lK
 vVqteWc0VRwpzCBWrADR/gtADv2tJhmW5jiEJjERYedbwbHcDorGcnGj5614XercHLeV8JVHzh15i
 u/WuhaG2r9s20P1ncEdWULEdukN2hH0qRnCevU5g8EenSX6m5bfVKse1SHFD4wxX2WjXGlukZJX2s
 GxFcP6G1w4K3ML/IfQa4hF3f;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qmJ8z-00G1Vl-33; Fri, 29 Sep 2023 19:27:22 +0000
Message-ID: <643a21235980f0b0d14d9facfc766d9ed39bc828.camel@samba.org>
Subject: Re: Does the Samba AD functionality support setting up a Samba
 server as a DC in a subdomain to an existing forest?
To: Richard Sharpe <realrichardsharpe@gmail.com>
Date: Sat, 30 Sep 2023 08:27:18 +1300
In-Reply-To: <26d2e0d49f039519491e1c1f85697c2da587894c.camel@samba.org>
References: <CACyXjPycDO5qNT=ibbS=4Wqvua+tDVtn3dhQ-dw1gJaktMOj6w@mail.gmail.com>
 <cf543da39afc8785f1ad3ccef17097868548c039.camel@samba.org>
 <CACyXjPwqcrMmevR3__EDXVSUzJkKd6TBxGcOB5FE=94FcjPUsw@mail.gmail.com>
 <26d2e0d49f039519491e1c1f85697c2da587894c.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2023-08-28 at 09:15 +1200, Andrew Bartlett wrote:
> On Thu, 2023-08-24 at 07:35 -0700, Richard Sharpe via samba-technical
> wrote:
> > On Wed, Aug 23, 2023 at 11:51 PM Andrew Bartlett <
> > abartlet@samba.org
> > 
> > > wrote:
> > > On Wed, 2023-08-23 at 22:28 -0700, Richard Sharpe via samba-
> > > technical wrote:
> > > 
> > > Hi folks,
> > > 
> > > 
> > > I want to set up one (or two) Samba DCs in, say test.qa as dc1
> > > and
> > > 
> > > dc2. There seems to be clear documentation on how to do this.
> > > 
> > > 
> > > Then I want to set up another Samba DC in subdom.test.qa as
> > > dc1.subdom.test.qa.
> > > 
> > > 
> > > Is this supported by Samba 4.19 and how would I go about doing
> > > it?
> > > 
> > > 
> > > 
> > > Not as a subdomain in an existing forest.  Only as a distinct
> > > forest.
> > > 
> > > I started the work but never finished it.
> > > 
> > > Sorry,
> > 
> > What would it take to complete that work? Not that I have lots of
> > spare time, but ...
> 
> To finish it would take a lot of time, but to get something to a
> state
> where you could use it for error injection and basic tests might be
> simpler.  And I love having more developers on the AD code.
> 
> 5583208aed0e4647269e48aa1d3c5c48a73001ac removed the ability to
> access
> the code that is in master, we deliberately didn't remove the
> underlying code, just the point of access that was confusing to our
> users.
> 
> There are some branches here that might have bits you need:
>  
> https://git.samba.org/abartlet/samba.git/?p=abartlet/samba.git/.git;a=heads
> 
> 
> Metze might also have some patches in his tree, I'm sure he will
> mention a reference if he has one.
> 
> His repo is here: 
> https://git.samba.org/?p=metze/samba/wip.git;a=heads
> 

Hi Richard,

Did you ever decide to dig into this?  I'm still happy to answer
questions and help you progress this a little - some of the inno.tech
folks seem to be interested in the same space and so it might be a good
time to get some of the basics in place.  We should still hide this
behind a selftest flag however.

Andrew Bartlett


-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions


