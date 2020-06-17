Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EEA1FD569
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jun 2020 21:24:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bw1Q3vnPbmbbusPPQ6mxCK7zhLxTquk6WUwK4H6GB1c=; b=3KFAgc8y5kkf+6/cpYcH1NPzRG
	lQ/g6784lgQYomO3jocPYDFno258jLSUW4W9m1x3DybLBiHh+BKvrw4ILfik9mmv9pWKAFE8ucbm9
	c2jLF1b8+6EQYF6NYYbwYoT/BaUabwaagN69fXgbzxwaNdyAJFNmX7owLvf3UXDW7kWbrjozsk/Cf
	IgH61iKJ1evJaZeeHS4wr6XvlhgqVmrWQQQxx9AnPrd2+KIPcI5lMrOoK6yL54lsA4Agly7XzLCDj
	qbnB7hUY8L0sOrgi3rX/AwyNgPX9r+/77AUMx7x0dKr+XZxyXj5vYilplMdicCg7KeuqTWz7lTJqs
	qccdXoxQ==;
Received: from localhost ([::1]:64488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jldf4-0013uT-2w; Wed, 17 Jun 2020 19:23:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32820) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jldex-0013uM-R1
 for samba-technical@lists.samba.org; Wed, 17 Jun 2020 19:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=bw1Q3vnPbmbbusPPQ6mxCK7zhLxTquk6WUwK4H6GB1c=; b=iMwWpNPEkHV2PjSKWsXXxZFN1O
 +q+UPH+VcZzI9Bu+C3DC6mcMnsVNi9Qiuvm6d+4LA5++C/FCrqW/axAxPIfVI2Qe1bOhBihLcBKBG
 8CTCZkxCUoo1OfB0lY8OgjrHaZEqw5MncUgwwzfxfi1IhjPJMIDwBRwBnCzQFxkf5adiazTRECsll
 sP5NIWaXwonurLY6r8qX6oJTCsFonYibAxhLhez1EbhR0JGwv+Pfc/iqMBYBBpt8ZCYmPiXBf0cEe
 Z8DBfTsIPyHC0dAkam+HxWKbskckWhnPweQ+ElliO4d3kL4LkeNMU0NZPkr48/aJIiMmoAwLVsI9i
 N0EQla5Ad6/hlgZgupaFCe5EsBB59qzhek8cMP0ypI9CCF7YxiiPV7NriaKfPEPChu0cV3yoforlO
 I09WAKnsuldW3TM3sd/0WHZlg4thEtWOV6khWzIQy2qvREb730VKxCQmun+edyntDTZeF5p9W6zTk
 VfConMol9COzYOWOEWDGC+TQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jldeu-0006mL-0C; Wed, 17 Jun 2020 19:23:40 +0000
Date: Wed, 17 Jun 2020 22:23:36 +0300
To: Jeremy Allison <jra@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
Message-ID: <20200617192336.GJ3036357@onega.vda.li>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
 <20200616082636.GD3036357@onega.vda.li>
 <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
 <20200616095350.GE3036357@onega.vda.li>
 <20200616172929.GD11432@jeremy-acer>
 <20200617053530.GF3036357@onega.vda.li>
 <20200617171931.GE3710@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200617171931.GE3710@jeremy-acer>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ke, 17 kesä 2020, Jeremy Allison wrote:
> > I am not sure what is 'crufty' about this code. It actually works and
> > works surprisingly well. Sure, we might change smbldap to be based on
> > something else but what does it actually give us in reality? I am
> > genuinely asking because to me it would look like a lot of churn for
> > relatively small gain, if any.
> 
> Well what I mean when I say 'crufty' is that it isn't being
> refactored/updated in line with other parts of Samba.
> 
> The goal (my goal at least) is to reduce the number of
> different ldap client stacks in use in Samba. The less code
> we have to support internally the better.

In that case, both libldb and tldap are things we support internally.
smbldap is a rather thin wrapper over OpenLDAP libraries. It provides
an abstraction that is needed anyway. It sure assumes use of OpenLDAP in
some of the API (LDAPMessage, LDAPMod and similar structures) but that's all it
has, the rest is useful to consumers.

For example, Current PDB API expects paged searches (see SAMR OpenDomain /
EnumDomainUsers / EnumDomainGroups). libldb hides handling
of paged searches in a paged_searches module, some additional work would
be needed to allow communicating a starting point for the search offset
and a requested window size. It means direct 1:1 conversion is not
possible.

With tldap it is much better, the API is more or less equivalent of what
is already assumed, just better with asyncronous way of processing the
requests. And there is helpers API that can be reused to implement
things existing in smbldap.

That could be a plan for refactoring. I need to understand how to plug
in keytab-based authentication into tldap_gensec_bind() but since that
uses cli_credentials structure, it must be possible already.

> > I had somewhere an unfinished tree with some of smbldap refactoring but
> > I couldn't find it anymore. One of bigger refactoring was to move to use
> > tevent-based approach but it was not really needed for PASSDB because
> > this API is synchronous and doesn't care whether operations underneath
> > are asynchronous themselves.
> 
> Sure - that's right. This is very similar to the libsmb client work,
> async tevent API's introduced underneath which drop seamlessly into the sync
> calls using a private event context wrapped with tevent_req_poll()
> calls to wait for completion.
> 
> It doesn't help the sync operations at all, but basing everything
> on async calls underneath causes everything to go through one code
> path for testing, and the exposed async calls mean we have the flexibility
> to do non-blocking things later (even if we don't yet know what
> they will be :-).
> 
> Synchronous-only API's are a dead-end IMHO :-).

I agree with that approach.

> 
> > My attempt to see if I can use libldb for the same purpose led to
> > immediate crashes because libldb code is not capable to run against LDAP
> > servers with a schema that doesn't include (in DSE) attributes expected
> > by libldb. It makes it useless for the purpose of pdb_ldap and ipasam
> > PASSDB modules, for example. The crashes need to be fixed but it shows
> > there is very little testing of libldb against real world LDAP servers.
> 
> That needs fixing. Can you log a bug for that explaining
> how to reproduce ?

I demonstrated it in my first response in the thread already, full with
a gdb session output showing the stacktrace and where the problem is. I
didn't file a bug, though, due to a lot of activity at the $DAYJOB.

> 
> > I think adding a test environment that imitates a typical pdb_ldap usage
> > can also help with libldb testing coverage.
> 
> 100% agree.
> 
> > > Well that's good to know. But if Synology and QNAP need
> > > this also, then if would be good to hear from them directly
> > > on what their usage requirements are.
> > 
> > This can be said about almost all our users embedding Samba components
> > into their products. We hardly hear from most of NAS vendors on public
> > mailing lists, yet there is a lot of effort to maintain stable and
> > predictable API around file server operations.
> 
> Actually we do hear quite a bit from the vendors using Samba,
> but many of them don't use the public lists for that. Most of
> their concerns are around the fileserver internals or winbind
> use - I've never heard any questions or comments raised around
> the passdb modules.

There could be multiple reasons for that. Perhaps, the code just
works and does not cause any problem for them, so no need to communicate
back. Given that it is definitely in use by products on the marked for
quite few years, I don't think it is because nobody uses them. ;)

> > I find this a bit
> > amuzing: there is a need to be fair at a treatment of various code paths
> > and yet somehow there is simply a rejection of that.
> 
> I don't think that's completely fair - now I know
> you need this stuff there's no fear it will get removed,
> I now know who to bug when I need things looked at :-).

:)

-- 
/ Alexander Bokovoy

