Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DBA1E0AEF
	for <lists+samba-technical@lfdr.de>; Mon, 25 May 2020 11:44:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=IWv5kx5cjCSbhaDkDIeL7/CfYve4BmhKyN+zy24vKDY=; b=e/fji8Vx5AYJyCbZd8YJ6H0Y55
	07bUzJOpMb9Jtj+3v1JomOA/ZainfcTAcgQMTb/kqscQqEY/Q9bIZyMUP+fg+PhLFC4vOfnT410eo
	GCkNPHQXavaa0NC118qYRIFjBVd2f2i0yiTtM9tFre+kB0flPcksCWtgu8ge7pkj5WinNYns25zbI
	1xi5BkQ3Zge09QUUFPTOUxANfw2UIOu0Ae2liuqdKF+4fDLMj9y/B/6oFWZvsdFg3eXwYYGnMop+k
	56MmX5IULc/BpLH1+B0sEk1XH8iy2MQXc4OeEfGmxe2+JBG+f4u/0Xlsa+es079cv9R1FivcjBszN
	zVmFN/Wg==;
Received: from localhost ([::1]:20770 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jd9ee-005jN1-Im; Mon, 25 May 2020 09:44:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19380) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jd9eZ-005jMu-3v
 for samba-technical@lists.samba.org; Mon, 25 May 2020 09:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=IWv5kx5cjCSbhaDkDIeL7/CfYve4BmhKyN+zy24vKDY=; b=AKKgrKJzWqpRpp2BUYsvjdWRRg
 AZmJ5B0x+yhBPJPG7W9GPKiHT4ATwqq0a/OwoVE4SqmHUSMZ58f5MphbeImO+ZcA/tUfo5Qt3wLc1
 av32pN59Y7zluI0UVISlo+jH9JSVoJjK1gfhsPHR0lkh1rmSVwwqE2UWt5qIGO9pQcudD1ZPS+S8M
 ODrJbMy0K8zn1zKJc3bHUQxr163+UaeXBvIACj5RDI4rPRg4dAeXK2A75dT0xt1R11tjjRZCRZLG1
 lLudj0FaiKHWzCZK/YTxzVbVH1SxuWzmAhDUZqALHSRTFnmywpZHHre7WhWq6rcVFIrG81D3hZczt
 pFUO+R3YAFAn8pHDao8/wh4m5aRr5YMoBvhT7oMKj4sxofY5Dg9f3IU2m0YIYqYP5OCUGWvPCDtB6
 +IUjScYGUd17AybUWQcc1zrRFE8b0LpCWemOwWyycwiUOMEPPLGFqKXxYWm8rbbf4E8JiQ6v95Twn
 gHBd5nIOWBm4IKIXTt/VrNIV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jd9eX-0006yt-67; Mon, 25 May 2020 09:44:13 +0000
Message-ID: <b20bcf09b119aa0d0585d27b24076bdd17157caa.camel@samba.org>
Subject: Re: Avoiding further (LDAP) stack proliferation in Samba
To: Stefan Metzmacher <metze@samba.org>, Christof Schmitt <cs@samba.org>, 
 Jeremy Allison <jra@samba.org>
Date: Mon, 25 May 2020 21:44:07 +1200
In-Reply-To: <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
References: <7f08ecb52a4a94d95e39af436e94ab852cf0da55.camel@samba.org>
 <20200521012158.GB10353@jeremy-acer>
 <4ce022a6c65422e40e1a583f95cefbbc7585393c.camel@samba.org>
 <20200521021959.GB12847@jeremy-acer> <20200521214312.GA12586@samba.org>
 <854ac3b5d75279a13ebf3c5a6e9f4fd5b9eb8943.camel@samba.org>
 <437a7ad7-5158-9124-9ba3-939a3bfcee53@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
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
Cc: swen@linux.ibm.com,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks metze for your reply,

There is much we agree on, and other things that we have different
perspectives on here.  

My opening thought is that in this, I recognise that I need to be
careful what I wish for.  Broad scale lift-and-shift operations have
been popular in Samba of late, and this is another of them in a way.

At the start, they appear very simple, but as noted here there is much
complexity in the end result, and a very risky transition that needs to
be done by experienced developers and reviewed incredibly carefully.

Even if we didn't have my concerns about the API and implementation of
tldap, as you note in (3) below the "ldap ssl ads" parameter (which is
used enough that we have a WIP patch set to fix it for channel
bindings) and "client ldap sasl wrapping" parameter are not
implemented.

And I do have concerns about tldap.  My view since the inception, which
I think I expressed - I've not checked the archives - is that tldap
should:
 * Use the struct ldb_request, struct ldb_parse_tree, struct ldb_dn,
struct ldb_message and the related structures.  Not because they are
divinely inspired but because they enable a suite of utility functions
that will, as the library becomes mature, be duplicated (like dumping
to LDIF, parsing extended DNs, extracting a GUID etc).

I've re-checked the code more recently, and I'm sorry to see so much
inline ASN.1 parsing.  It really should re-use ldap_message.c for the
ASN.1 parsing, so the ASN.1 encode and decode can be tested (see the
recent tests added in test_ldap_message) and fuzzed (fuzz_ldap_decode).

Why do I raise this again?  Because as noted, lift and shift is risky. 
So if it is ever to be done, it should be done while tldap supports
only one small, optional winbind module.

That is why I appreciate but don't accept the "but this is not
something new" (i.e. it is already in use) argument.  This is is a
significant new use that makes it harder and much less likely that
tldap will ever be overhauled and suggests that tldap is already the
"future ideal" API and implementation.

Of course I now wish I had raised these objections again in 2015, but
we both know that would not have been a good idea. 

But here in 2020 I would be much less opposed to winbindd using tldap
directly if these matters were addressed, which is why I tried to leave
this as a possible way forward in my original mail.  It would mean that
tldap would just be a different API to a common LDAP client lib, not an
standalone creature itself. 

But whatever we do, it must not become an independent, fully featured,
LDAP client stack, it must complement and integrate with what we have. 

Swen and Christof,

All this does however really bring into question if for the nominal
purpose, there is some way to get the timeout handling we need out of
the OpenLDAP libraries under libads in the meantime.

I'm sorry this has become a can of worms.  That happens in Samba
sometimes.  Perhaps start by proposing just your tests, and someone can
look at them in isolation?

Andrew Bartlett

On Fri, 2020-05-22 at 15:02 +0200, Stefan Metzmacher wrote:

> As you know I like the idea of having things implemented just once!
> But as found out in the past this is a lot of work and
> replacing everything at once is often not possible.
> We learnt that we sometimes have to do small steps with intermediate
> states, which we sometimes not like, but at the same time require
> in order to make progress at all.
> 
> There're a lot of things I'd like to see:
> 1. The ldb api should not be used for pure LDAP users,
>    it's bad enough that the strange async model exists at all!
>    We should hope that it's only used for LDAP for command line
>    tools in a sync fashion.
> 2. source3/lib/tldap_gensec_bind.c should use gensec_update_send/recv
> 3. tldap makes use of the "client ldap sasl wrapping" and other
>    options, which are use by source4/libcli/ldap/ and
>    source3/libads/
> 4. We can add some helpers to get/pass 'struct ldb_message' from/to
>    tldap c.
> 5. users of source4/libcli/ldap/ should move to the tldap api
>    - lib/ldb-samba/ldb_ildap.c can become lib/ldb-samba/ldb_tldap.c
> 6. libads should go away it, at least it's low level internals
>    maybe it can be build on top of tldap as a first step in
>    order to avoid a rewrite of all non-winbind users.
> 7. winbindd should avoid libads and only use tldap.
> 
> But the goal of
> https://gitlab.com/samba-team/samba/-/merge_requests/1351
> is moving along with 7.
> 
> And I'm not seeing why we would require 4, 5, 6 before doing 7.
> They would be nice to have, but they tasks for another day.
> 
> BTW: I'm not saying that I'm happy with the current patchset of merge
> request 1351. But that's a different discussion.
> 
> metze
> 
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




