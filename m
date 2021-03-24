Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D58348252
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 20:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=qAgbvP1gKsrs3RdEUKUnHmuC21t+RrWfF/sT+VD7PTY=; b=T63GhNR2Q7j12kdrXUj5jHRJS8
	WvdHgkBodakpY9PDvhgVSArsR4NpF61SeVT56DMeax8dUGILnyNZ+ft2xoXwMjP5GCs4PKWWVGQWn
	9JlHrjSJEzYPp4oDY6QvagFwsTJczhQYd/tJX+8yfd05hM8axHgEThq1206Ng8byRTpDN6L49KUjq
	6fxZKMnCRNlAnDEbUJ5QHFXiBWz/e2POAUPQnWK4xmRxq/H9bgYgfmwPoBGdQjN31ouN/0sm6knrP
	36oxpEevWJYQhNnzrS1aKVNtJYmEl+9PvmzCiCZZ73q/bK0mDeVCAvZfyX7cU5GuDQISdjW7bDAd2
	cAmRQZrQ==;
Received: from ip6-localhost ([::1]:47498 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP9eN-006dm2-5y; Wed, 24 Mar 2021 19:58:43 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20954) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9eI-006dlv-6d
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 19:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=qAgbvP1gKsrs3RdEUKUnHmuC21t+RrWfF/sT+VD7PTY=; b=h+9RxFt2h9j3tejSvwFtSmJ/tw
 0KvYSkAIWfckw6rR+srzWtFu2pxk43AWoBdB9P0LR2JEjyP1lzdZ3q7MzZ/SFYrzK4VcGIQl+6cXa
 3lFGBnOQu3czPeAkMikp120do8Qlg4FQdXQxAG4ru9jOTdRYy0o0QMqE0f4QQJOXGWGMP01GoRUfe
 I7zhOtAkXbb2BVG/fCp/EEK1qhpPROWdV74Ns9hFu636+qaZPWpXH6fyEyk1rhX4RSOJFLfUi4Y4v
 ZniOGpVTf6L415ltcmNjHpVIblhXXJFJt8vM+U2t+G6Cw0TQU0N1Onui+IQZGLiIK+ZAf8xNUsZB9
 4QW6zTqxG4jR8iSDVJf/LJtFQNzf561Bu0K9u6/h7FGYN3HE2gQ1Wghxwh/3/W++9Sd2N8NIdUIOZ
 3FMC9mUu4bp2SEQP3t1/bAAm3DBUgdc3TxQwlem8E68tEuukOJL5LxM6w3/1aot0mBm2kXq/sa7w5
 zJBRHOXAOgNUfRB5QSeZlgNv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9eG-0007xI-Ab; Wed, 24 Mar 2021 19:58:36 +0000
Message-ID: <953a5e8d4dbb0a915693128fec1520b20c76c598.camel@samba.org>
Subject: Re: Drop NIS support
To: Rowland penny <rpenny@samba.org>, samba-technical@lists.samba.org
Date: Thu, 25 Mar 2021 08:58:31 +1300
In-Reply-To: <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2021-03-24 at 17:57 +0000, Rowland penny via samba-technical
wrote:
> On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
> > On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-
> > technical
> > wrote:
> > > On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via
> > > samba-technical wrote:
> > > > Hi,
> > > > 
> > > > could we drop NIS support for Samba 4.15?
> > > > 
> > > > This means getting rid of lib/replace/system/nis.h and yp_*()
> > > > ...
> > > +1 from me. Let's see if anyone else is still
> > > using it.
> > > 
> > > So the current list for 4.15 will be Tru64, HPUX, NIS.
> > > 
> > > Any more for any more ?
> > Just to be clear to others, this is not the so-called NIS support
> > in
> > the AD DC which at one point helped Active Directory Users and
> > Computers managed the rfc2307 user attributes.
> > 
> > I'm happy for the real NIS support to go.
> > 
> > In terms of other things to trim, what about some of the printing
> > modes?
> > 
> > Andrew Bartlett
> > 
> How about idmap_hash ? The one that says 'DO NOT USE THIS BACKEND'
> at 
> the top of its manpage.

Is there a way to emulate it on another backend using configuration
options?

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






