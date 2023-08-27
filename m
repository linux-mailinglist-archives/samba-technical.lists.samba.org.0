Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA5B78A1C9
	for <lists+samba-technical@lfdr.de>; Sun, 27 Aug 2023 23:16:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=1ohQPdowGLmLEs6QMA3XDeI9DdHpNx2YFCxJjfYt6JQ=; b=TDei7FEevvyOX+ebaOi0kC52pZ
	2mov/EFdgYziMGkArUg+4g953Z+xiVuAuDd30bPPpEI7/bOrMVx5NrLetPlAFHNdXeKwUVEBZ9NBq
	TgRPLwy5IrtkMwlkXC22tncQSHWlCntpJ+cSwI6P6FeA3nGxHDVQcZo6YARQaNm+YFlDsK49QZqSH
	LxnKc4T5+OCS+eaI44PiFQT6QTuM6ESL0lMKZiOwS7FRRdLP4OYL8rOOYad9zdJTQMbdXJRvIW6UR
	GDyZ1wfTfUloLcG3cJSa+DpbyqFiYO3+8t7QfJJBFZgoFaT7aPkiVSBvfRK2TvQvcpw8qIkjfspo/
	Smf/gXZQ==;
Received: from ip6-localhost ([::1]:61396 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qaN6X-00EuRS-Bv; Sun, 27 Aug 2023 21:15:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43764) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qaN6P-00EuRJ-Jj
 for samba-technical@lists.samba.org; Sun, 27 Aug 2023 21:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=1ohQPdowGLmLEs6QMA3XDeI9DdHpNx2YFCxJjfYt6JQ=; b=kzyH4lyspBSkijuhadO4QXbeUS
 BpLb9gP/hl6BR7chRSSQr+RsuPMk9iHShjnxtDeCxUGO6bI2BLg2wNlug7CPtO/ZtbUwd/DbdzuNe
 LQooI5TbDtXGc39GYp+j2AVrq/N25ENhP/ls2vYYcBjEltL9J36jdGQVCC8Qe4YTEIlU88T+LBxJu
 GXwJNZIR0n6KChcS+3Jzhn8AarrfRGnyzZNYwgkNf2E2AlgTV2mWqVujIi2Et512K+GRMS+7sO6vT
 yQQ5dms01InJWlBBfeJfznp4mrPoo38jYTcQxst1DR+tAfggxuSa8xcy7iwYfzG25sEYcvgA3+1lN
 3UAzzjl2alj990jZyKUFG/F7EwQfvkCUEr1Jj4hiP2n+wwgMH59TTFoz1RyJM2IT0MoLndJAQK+N2
 pl7JEqBFoWvSYFN58ssJi2C0YSaQNfA6KzMWmSHlD263RAPTkgmPINbFktYt1bFnfcDQF6462wIP0
 V3NWtnXI2Nja2AwbZDajbOAD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qaN6O-00AEKW-0p; Sun, 27 Aug 2023 21:15:20 +0000
Message-ID: <26d2e0d49f039519491e1c1f85697c2da587894c.camel@samba.org>
Subject: Re: Does the Samba AD functionality support setting up a Samba
 server as a DC in a subdomain to an existing forest?
To: Richard Sharpe <realrichardsharpe@gmail.com>
Date: Mon, 28 Aug 2023 09:15:17 +1200
In-Reply-To: <CACyXjPwqcrMmevR3__EDXVSUzJkKd6TBxGcOB5FE=94FcjPUsw@mail.gmail.com>
References: <CACyXjPycDO5qNT=ibbS=4Wqvua+tDVtn3dhQ-dw1gJaktMOj6w@mail.gmail.com>
 <cf543da39afc8785f1ad3ccef17097868548c039.camel@samba.org>
 <CACyXjPwqcrMmevR3__EDXVSUzJkKd6TBxGcOB5FE=94FcjPUsw@mail.gmail.com>
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

On Thu, 2023-08-24 at 07:35 -0700, Richard Sharpe via samba-technical
wrote:
> On Wed, Aug 23, 2023 at 11:51 PM Andrew Bartlett <
> abartlet@samba.org
> > wrote:
> > On Wed, 2023-08-23 at 22:28 -0700, Richard Sharpe via samba-
> > technical wrote:
> > 
> > Hi folks,
> > 
> > 
> > I want to set up one (or two) Samba DCs in, say test.qa as dc1 and
> > 
> > dc2. There seems to be clear documentation on how to do this.
> > 
> > 
> > Then I want to set up another Samba DC in subdom.test.qa as
> > dc1.subdom.test.qa.
> > 
> > 
> > Is this supported by Samba 4.19 and how would I go about doing it?
> > 
> > 
> > 
> > Not as a subdomain in an existing forest.  Only as a distinct
> > forest.
> > 
> > I started the work but never finished it.
> > 
> > Sorry,
> 
> What would it take to complete that work? Not that I have lots of
> spare time, but ...

To finish it would take a lot of time, but to get something to a state
where you could use it for error injection and basic tests might be
simpler.  And I love having more developers on the AD code.

5583208aed0e4647269e48aa1d3c5c48a73001ac removed the ability to access
the code that is in master, we deliberately didn't remove the
underlying code, just the point of access that was confusing to our
users.

There are some branches here that might have bits you need:
 https://git.samba.org/abartlet/samba.git/?p=abartlet/samba.git/.git;a=heads

Metze might also have some patches in his tree, I'm sure he will
mention a reference if he has one.

His repo is here: https://git.samba.org/?p=metze/samba/wip.git;a=heads

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


