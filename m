Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CE976FE82
	for <lists+samba-technical@lfdr.de>; Fri,  4 Aug 2023 12:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=88+2w85wHcTWCQFL4GtryBQdwUuEeju9PjQFc+1oIC0=; b=pYsnvP/UtWaIxDgxJm0WkmKPBk
	Z4e1to3lNPEb2tjPNxq9ongydJHh9gCHdNIT15La9h2uRCGaqVvGevKnSJolbABU5KphNqjf2QdMa
	FmV5L+fUzkGgNhrPQO37TqR6ERUUVggwWKVpL4bUlRWOUiDr+x8KWRjKYmrJqwG3c0LmTuhLS4Xjb
	7/pPgyrxzuVQtklOgPujoDqbPlNg+gYHhCuOZ0sFsoTTL8MyWsC8FDLRxgDx9dJiVpCSHFUlNR5rp
	1FCXlcVNJF95+o4f2IFNsAgHc9Ow9W2lx5cozKh8xWHU3eJO+hLwgrgELgqiWhJtjqsW8JMOBf7gJ
	YynlL1tw==;
Received: from ip6-localhost ([::1]:51380 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qRs4X-009ds8-Aa; Fri, 04 Aug 2023 10:30:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33604) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qRs4O-009drz-B0
 for samba-technical@lists.samba.org; Fri, 04 Aug 2023 10:30:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=88+2w85wHcTWCQFL4GtryBQdwUuEeju9PjQFc+1oIC0=; b=iegskUMSssMwmBx7Sqx5uUyiAH
 BWyNK6p//U19Y1Zu6S6IeqBR0rYrNAAbwOPABl9FFbqV/LLn9UHmzObbJJfPRkK48JA5PLTozoa3/
 ZCLGbV0znPzlfpWLbTYYl4Jc0JBV33ZmHoh/INBY4AD/X49nnhxOOTh7I5JBppU8qjY2UZ6QA/fzZ
 TLI/YCY4CwQzV2XQrSk0mfK5k8pqnzLQPkSd6uby+H0x7a5WQY3GXeWKnAob6aru9UDUMz2pmmBhM
 B4HEhWRuEGBOn/F+F8cDVQBavAiJvAjScdO+gqo3AdUr5FOaMOwyCBQla5xKVVml7LwvVtWQVBKx2
 llz4s9R5TVYKLc0jOJo2lqltwKe2voXJBhdP481vElWBcIo6ht/jhPBV5GyS4/Bcy3RgDApoucfW3
 dbbYYsNYvI3qk8sf9coN7s3fZ67nJlRjpuN4wk5WX8UorPV7GbJijbMVFQ7PtMJkcNkaLK8wFs73b
 NSq//e0nd1wnC6AVA7bXUaky;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qRs4N-005x22-0C; Fri, 04 Aug 2023 10:30:07 +0000
Message-ID: <ad9bbe2bbb1e17056dbf9c3a87dd2b1ef48b0171.camel@samba.org>
Subject: Re: symbol versions in public libs
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Fri, 04 Aug 2023 22:30:04 +1200
In-Reply-To: <051f35f4-c5cc-9932-6325-99f112b38f0f@tls.msk.ru>
References: <051f35f4-c5cc-9932-6325-99f112b38f0f@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

On Thu, 2023-08-03 at 19:09 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
> 
> This is a JFYI email, to show how we have to fix samba build
> procedure to produce manageable packages for debian.
> 
> During 4.17 stable series, there were a few new symbols appeared
> in libldb, versioned LDB_2.7.1 and LDB_2.7.2.  For example,
> 
>   ldb_msg_remove_inaccessible@LDB_2.7.2
> 
> However, new major version (samba 4.19, ldb 2.8.0) have these
> symbols at version 2.8.0, not 2.7.2.  The result is that all
> binaries linked with ldb-2.7.2 using these symbols does not
> work with ldb-2.8.0, even if all actual code is exactly the
> same.
> 
> This is because symbols "backported" from the next major release
> to previous stable series are marked as belonging to this next
> major release, not to the previous stable where they backported
> to, even if no next major release has been released yet.
> 
> For a downstream distribution this is unacceptable. There are
> two ways to deal with this situation:
> 
>   1) migrate all reverse-dependencies (users of this library)
>      to the new ABI, bumping the soname.  This will divirge from
>      upstream naming, since upstream uses libldb2, while we'll
>      have to use libldb3, libldb4 etc - bumping soname each time
>      such symbol version bump happens.
> 
>   2) provide symbols at older versions for new upstream major
>      release and keep soname.
> 
> Either way means we have to patch upstream build system.
> 
> I've choosen the 2) way, by providing missing ldb-2.7.1.syms
> and ldb-2.7.2.syms files for ldb-2.8.0.  I'll have to keep the
> old/missing .syms forever, they'll accumulate in debian/patches/
> with time.  This is not bad actually, since it's static contents.
> 
> I'm not sure what value such versioning gives if it forces
> downstream to jump though hoops like this. But here we are.
> 
> Thinking about it more, I'd just remove this @LDB_foo suffixing
> entirely, - it will be much easier to deal with.  Unfortunately
> this means we'll have to bump the soname again, or try to provide
> both versioned and unversioned symbols somehow, - which means
> patching waf which is not static target - which I'd try to avoid
> since it means constant maintenance with each waf update.

This is very interesting, and to me just adds to the argument to un-
version and re-bundle LDB.  Our only downstream user (sssd) uses the
modules API which is not ABI guaranteed anyway. 

If we don't do that, I don't see any good solutions.  Security releases
are enough of a pain without coordinating ABI file updates between the
releases, and in any case, if we have these updates:

ldb 2.0.1 -> ldb-2.0.2
ldb 2.1.2 -> ldb-2.1.3
ldb 2.2.3 -> ldb-2.2.4

The symbol won't be present in ldb 2.1.1 or 2.1.2 for example, but if
we put in the ABI file as appearing in 2.0.2 it makes it seem like it
was.  This comes from trying to use ABI versions as package versions,
and having package-version in lock step with Samba major versions.

This is difficult.  Hmm.

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


