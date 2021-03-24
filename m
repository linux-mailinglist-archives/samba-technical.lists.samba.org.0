Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3CE347FD2
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 18:53:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=JzJTkYB/okFUmTJKAPyqDIqkL9U3KwPoYH+t0xxUc2o=; b=qr7s8I9UnuM/MOTAhNK/kTGFzE
	SIz9gYMpmhlKuDV3Z7PwbrUYyfbO/4xU1A6QNg6rqf4c6fJ84sEaBzZHB+at33Nh9c6ctrwuOoSu3
	nAJvGaoRPg95RgixuHeT+nh70J1Ca1DUhwBR+BmpbyfFpWPkkQKEYLpBvjMJyEwmqSiWiNWWNITtW
	hWKT+POGPbWzXyMh71OZAtc2RLUCDOo/2Qnx+z70HBUo9YHvJ3DiEHUwdcCHDAJfPo1eTxsR3MMZV
	ceo2X50bb0dfrtsj7I1z6pBGXIv9kX5Bp3pY0UMKwHQw/Fkr6+Vk4uXSs7RnaC4bWBFm06TNaVHrR
	1WOH/h7A==;
Received: from ip6-localhost ([::1]:44604 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP7gw-006dEq-GX; Wed, 24 Mar 2021 17:53:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP7gn-006dEj-9Z
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 17:53:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=JzJTkYB/okFUmTJKAPyqDIqkL9U3KwPoYH+t0xxUc2o=; b=mFY0VAecdpieMtJbQCj7o1ctW3
 A9C1k0kVbw7zcc0WFziH4ZDvDQ38UFpegG/ii3bTcCnjh26qdKqWN1daSkho+er/eoo5YhESFJJbF
 Ud8Ls0EA7iuJ3XT6E56xXhSWeR5AZuNNqk22dPMU9f4bTBpbOXB/Ng3StWFNxrKCYz2dFKf5wch2D
 6vSd6IhesTiIqVxPi6g27cMLJSfVbcLvI3MH2CSGWopsRt3cAyzZdvoWb+adl31ZQ3iJyC2uALl/L
 oXKiWr2852rlH5Tg073CaEDb2+vm/1mMHs+jsGImN/BnZEN8ker4+iazKGXDCOrLHbdcjI0+LRo/y
 XiIYKg/WMgc9Q1T44i1872zs6xMlvNgE7oetttL9kqvD3AP3XK+PR5d+Q4+HX722PVMIrinu3A9bC
 /mrrHbuTJY4zS39GDs92WtYsu+/EosedMPFyuj2xr0p2dcYxc0pGQdGUp5b1ncLtPnp+b58tbthPI
 6X9UFP02GPXNIMrSgDv1Q4M+;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP7ge-0006yi-HB; Wed, 24 Mar 2021 17:52:57 +0000
Message-ID: <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
Subject: Re: Drop NIS support
To: Jeremy Allison <jra@samba.org>, Andreas Schneider <asn@samba.org>
Date: Thu, 25 Mar 2021 06:52:52 +1300
In-Reply-To: <20210324161244.GB818616@jeremy-acer>
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-technical
wrote:
> On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via
> samba-technical wrote:
> > Hi,
> > 
> > could we drop NIS support for Samba 4.15?
> > 
> > This means getting rid of lib/replace/system/nis.h and yp_*() ...
> 
> +1 from me. Let's see if anyone else is still
> using it.
> 
> So the current list for 4.15 will be Tru64, HPUX, NIS.
> 
> Any more for any more ?

Just to be clear to others, this is not the so-called NIS support in
the AD DC which at one point helped Active Directory Users and
Computers managed the rfc2307 user attributes. 

I'm happy for the real NIS support to go.

In terms of other things to trim, what about some of the printing
modes?

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


