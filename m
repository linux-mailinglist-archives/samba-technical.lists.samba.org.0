Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FC4841705
	for <lists+samba-technical@lfdr.de>; Tue, 30 Jan 2024 00:39:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Zz3Ml8bO8d0FDy/XJ9G0B7PQ4y6iD2bIwee/16J5/Tk=; b=r9lDOhKGU3p/ut8y1TrD69m41V
	lFtcfSwjXoYE6PSdG0TpafF4Pa/KO5QiCq/Y8yg+Nx4Qir8VKRvOEEEsRhFHlRD7bnuMl7OfcWh43
	art+oOhK7p16o/TEXMfi08jlqW6khfZxp7neo4ulkSN9uLWUPY9IbydYpH9zKyr0Am2DdKAmvJ5o/
	EpQ+pqQH7ryjpHLbQKE79t0gb5cPlD7QpYh4I1ZOkQGKwShH67CCwowLPxvwqh8dnpDqccFGQ9BaG
	jwfnWDKn5Xii223zzgfRKK4hHBB8QrPnobQK1ryLLPwX75FT8rqdjpmzuax4wf2aB9tvmXd3rPl7A
	9IDdgw5w==;
Received: from ip6-localhost ([::1]:33576 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rUbDG-00521p-BZ; Mon, 29 Jan 2024 23:38:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56778) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUbDB-00521i-TV
 for samba-technical@lists.samba.org; Mon, 29 Jan 2024 23:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Zz3Ml8bO8d0FDy/XJ9G0B7PQ4y6iD2bIwee/16J5/Tk=; b=1jWCpt7rFMX9nlRd4SGCYf8pov
 Bxv6IFjt5tVLmQj0uuPwyL3nDngvlGcAmuWg3nfwjlKUYr5qbciRm0z9+nlgJll2OxIbvarDIrrlR
 6euIBCAOpMiAWsrzW8hwgXsOn2Dk6KXjDRcy7YJOVKTclW4dOkA1xQuqpsizz2lxn+0KpK8MbHeWW
 vdWvLhwP+iIaA7WHB5NsTnnaso/LUmZIZ2R8nO61U9SOlBiy2s0WaZTDa6KHp73o+7TmI7L+q8X0u
 Q0mT0PgoTdPvD5d0qrwGfDyLz79d1s6n0aBWEXF5LGu2LAAZsEatNdBOrqey/dnKMfI9ckpOS49GA
 KYJyN5OYSOFCdHKjvlGTi5grwQmOG1h1W+yLK4W9ET4PfKmxC6QfsqdU9W4LG1OZ0Gyvq4uCiKmcB
 fgLTKrpk0x/DBrDPgw0RL2HGdMFwMTm1cmbthtH1KgHuN7qXpDO74iDP82g43AyNF2OTIhfNaLLCx
 HLVhgoKoU3ZEwq/XRiNcztK8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rUbDA-00ASbn-1V; Mon, 29 Jan 2024 23:38:45 +0000
Message-ID: <9dbc25ad89a932a035c943c7a4b9c1de37441996.camel@samba.org>
Subject: libndr 4.0 issues.
To: Michael Tokarev <mjt@tls.msk.ru>, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Tue, 30 Jan 2024 12:38:40 +1300
In-Reply-To: <9aa8499f-c764-4963-8112-a3f571f2a237@tls.msk.ru>
References: <e7c468ef-5466-4ae7-97c9-39c9fe6d627e@samba.org>
 <9aa8499f-c764-4963-8112-a3f571f2a237@tls.msk.ru>
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

On Tue, 2024-01-30 at 01:25 +0300, Michael Tokarev via samba wrote:
> I uploaded 4.20.0~rc1 packages for debian bookworm and ubuntu jammy
> to
> the usual location, 
> http://www.corpit.ru/mjt/packages/samba/
> , together
> with debian experimental.  This is just a first build, so handle with
> extra care.
> 
> Since samba 4.20 changed libndr interface in an incompatible way
> breaking
> ABI, this update of samba-libs *will* break sssd and freeipa if used
> together with samba, - there's no solution for this problem so
> far.  I
> do not plan to rebuild dependent packages (including for debian
> backports)
> just to make samba 4.20+ installable on older debian/ubuntu systems
> together
> with sssd and/or freeipa.
> 
> The only fix for this breakage (which was trivial to prevent in the
> first
> place)

Can I get some detail on the trivial steps that could have avoided
this?   

The reason we make a release candidate, and the reason we so
greatly appricaite your efforts in packaging it, is to see how ideas
that seem reasonable in development impact on the real world.

Note that the libndr flags that are now 64 bit are included in
the ndr_pull and ndr_push structures, not just in the function prototypes, so I don't think symbol versions or munging etc would do the trick.  

But your feedback is valuable: we didn't end up needing the 33rd flag
quite yet.  The work was merged into master to ensure that the idea
landed while it was all ready (rather than needing to be re-worked
after being dragged back out of the attic).

So we could include a patch in Samba 4.20.0rc2 to remove the 4.0.0 ABI
and instead have a 3.0.2 for this release series, and punt the problem
away for 6 months.  I would note that this still creates some of the 'non-linear ABI version' issues you have noticed in LDB, but perhaps if we plan properly we can sort that as well. 

Anyway, please let us know your thoughts.  We know we don't to this
public library thing very well, and the experience of those who live in
this world more broadly is most valuable. 

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


