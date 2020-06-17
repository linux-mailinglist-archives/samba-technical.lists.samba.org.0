Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 821C41FD351
	for <lists+samba-technical@lfdr.de>; Wed, 17 Jun 2020 19:20:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ukMT7FgW8F0Xlp5HHFiof1mvEtHDx519psILmH9EIog=; b=Raf9k1fc2PjaxIgm5YG2EucHMY
	dnqPKhUDuEZgwYtG0KMxZJuWwbLueLwHtOvINyKeEFk6uU2NadRDMUatKiPREMXV2vicdIf/LzgL+
	9aA/6J72wqOwUp0SA298CmwkAY4S/9sxwjqsOaJgDpvSF9+5/ErXiGwvQD4kihuP6BAavFxcBX1Kg
	kmCuXlWxEHIefPVAfNClgNDS+iI9TIQ/PEOYGsV3Y2bxoIP5qV/jufme+NqkvN2Mrh/zegW6h0v9e
	jEtzE2tsjuqiolsV1yC0QYIslBIZdbnyCpasEqufP1JyMrb1qzx0FtQyBsF7K8HE6DYK1OOm+GvmI
	rZC+wwjw==;
Received: from localhost ([::1]:54608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlbj4-00120W-25; Wed, 17 Jun 2020 17:19:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41816) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlbiw-00120P-BL
 for samba-technical@lists.samba.org; Wed, 17 Jun 2020 17:19:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ukMT7FgW8F0Xlp5HHFiof1mvEtHDx519psILmH9EIog=; b=AmnlKPFQO5ymiP8QY/G7xcGt31
 TQu0mjBS75Q+4aGhvS0zDRDiLfmYURgkmV8BD0Z3t1AV1vuww/QmCEm5/0+cnXSdYZnmr2zBweRO1
 Ucqt7zrZDJbW9iWnK7Bz791g06RO4zE9g6I3cnXMQajUjkofnsuEm6eC4SIeuUIUCFzh0ZUbtvRRs
 74eVmF69qJpP4e6Mek1o35hx3mySaiwGbimdvT4DbV/075tk9ezg5kdSSFBCe9UgRA4KzIHQDeHu4
 ZUKHClwD/eVod6cQywfCrJm6sQD+nMegjrhGlx/XEjH0iSZqPa+b2spKos6g7Yf+R09nzXN0mi/LL
 SaNSZXZXioSXgbT+A58Af/KAvUVMngMhyg5o/tQ9CEK/PiiSVReP+md/1T1w2yqilinjlfZEVuJvl
 XaqWVvwKmHQvx7dqq3q01GOkxvNsPt0cwWr5IZIcIa/yiuFFg0kvgchRYYOAJda0geP1FKe5XaGha
 C0vf8nW3yXoBkModNz1Mc2fv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlbir-0005iA-D1; Wed, 17 Jun 2020 17:19:37 +0000
Date: Wed, 17 Jun 2020 10:19:31 -0700
To: Alexander Bokovoy <ab@samba.org>
Subject: Re: deprecate pdb_ldap and "NT4-like" domains in Samba 4.13 to allow
 removal for Samba 4.14 in March 2021?
Message-ID: <20200617171931.GE3710@jeremy-acer>
References: <d48e22dab11b2cc72cd1e402730814a506e7c363.camel@samba.org>
 <20200616082636.GD3036357@onega.vda.li>
 <bac9c345a806ece858c12211b176fd6bb6d49996.camel@samba.org>
 <20200616095350.GE3036357@onega.vda.li>
 <20200616172929.GD11432@jeremy-acer>
 <20200617053530.GF3036357@onega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200617053530.GF3036357@onega.vda.li>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 17, 2020 at 08:35:30AM +0300, Alexander Bokovoy wrote:
> 
> ipasam implements all but few passdb calls. I need to complete some of
> group/group type lookups and then it would be more complete.
> 
> The problem I see is not FreeIPA usage of those but rather lack of
> testing in autobuild for the code paths that lead to the PASSDB calls.

That is an excellent point !

> For example, tdbsam has no support for group lookups, no trusted domains
> support, and that means any related RPC calls will not get tested
> upstream even though they are used in environments like FreeIPA.
> 
> It is on my side to add those tests and I am working on them. Since the
> whole set is simply missing, it is not an easy job and requires time.

Thanks Alexander, that is much appreciated.

> I am not sure what is 'crufty' about this code. It actually works and
> works surprisingly well. Sure, we might change smbldap to be based on
> something else but what does it actually give us in reality? I am
> genuinely asking because to me it would look like a lot of churn for
> relatively small gain, if any.

Well what I mean when I say 'crufty' is that it isn't being
refactored/updated in line with other parts of Samba.

The goal (my goal at least) is to reduce the number of
different ldap client stacks in use in Samba. The less code
we have to support internally the better.

> I had somewhere an unfinished tree with some of smbldap refactoring but
> I couldn't find it anymore. One of bigger refactoring was to move to use
> tevent-based approach but it was not really needed for PASSDB because
> this API is synchronous and doesn't care whether operations underneath
> are asynchronous themselves.

Sure - that's right. This is very similar to the libsmb client work,
async tevent API's introduced underneath which drop seamlessly into the sync
calls using a private event context wrapped with tevent_req_poll()
calls to wait for completion.

It doesn't help the sync operations at all, but basing everything
on async calls underneath causes everything to go through one code
path for testing, and the exposed async calls mean we have the flexibility
to do non-blocking things later (even if we don't yet know what
they will be :-).

Synchronous-only API's are a dead-end IMHO :-).

> My attempt to see if I can use libldb for the same purpose led to
> immediate crashes because libldb code is not capable to run against LDAP
> servers with a schema that doesn't include (in DSE) attributes expected
> by libldb. It makes it useless for the purpose of pdb_ldap and ipasam
> PASSDB modules, for example. The crashes need to be fixed but it shows
> there is very little testing of libldb against real world LDAP servers.

That needs fixing. Can you log a bug for that explaining
how to reproduce ?

> I think adding a test environment that imitates a typical pdb_ldap usage
> can also help with libldb testing coverage.

100% agree.

> > Well that's good to know. But if Synology and QNAP need
> > this also, then if would be good to hear from them directly
> > on what their usage requirements are.
> 
> This can be said about almost all our users embedding Samba components
> into their products. We hardly hear from most of NAS vendors on public
> mailing lists, yet there is a lot of effort to maintain stable and
> predictable API around file server operations.

Actually we do hear quite a bit from the vendors using Samba,
but many of them don't use the public lists for that. Most of
their concerns are around the fileserver internals or winbind
use - I've never heard any questions or comments raised around
the passdb modules.

> I find this a bit
> amuzing: there is a need to be fair at a treatment of various code paths
> and yet somehow there is simply a rejection of that.

I don't think that's completely fair - now I know
you need this stuff there's no fear it will get removed,
I now know who to bug when I need things looked at :-).

