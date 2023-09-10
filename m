Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B7A8799FC3
	for <lists+samba-technical@lfdr.de>; Sun, 10 Sep 2023 22:33:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=BolBRMbxPOHv+lLJzgXnXI+186OSikasRNrvIVPOuSs=; b=4UQNDSikvMlVakLFwg8CkoVd8C
	61KCP0F+t0YjMcL2wfyCK6S8LZSyAlKN8M2bmw5FAN7giuIr+7dUG5qGd26KPd9BlxU+Vs3wNxoBy
	yDNbWMoKGiCcME+h/ajpzsE3YhsMWhPK8nkeEhOkduJiRly3vcGNnsJmY3mNvUsuKvuzMu5eWjM/Z
	EjQm1qimWTtJpNM92rjtCqFVdX/fmX7JspjZzrMJGXLKBbA3erN5RUifn9iXlWF1e/BR8GUGNlT4d
	8PyYUK/RxEGN24gAvxJSUwJwyKGNYT0M7cfYc8GRBHQasG7WLQG/cN3kt4YD1br91eC6Wkyy+ElZ1
	MeoWAwsw==;
Received: from ip6-localhost ([::1]:38408 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qfR70-002k15-Qh; Sun, 10 Sep 2023 20:32:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40778) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qfR6t-002k0w-Mg
 for samba-technical@lists.samba.org; Sun, 10 Sep 2023 20:32:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=BolBRMbxPOHv+lLJzgXnXI+186OSikasRNrvIVPOuSs=; b=jCfLo5RnBZUyI7+rDlALN/U+19
 RxoruKbVCEdiWQxgPPsiY8lrAWf9IwRR4DXouaifadaibZWLS9+myzPO4u787DcLFjY2Lp4l+yRoE
 6CTNHlGH48PoM0l4aVslUHszt9rMzAPKb0HYvkIlVhxqgfGTZyI0Hp/YyoeiQxadXknio/tsYUBzr
 Q7EzPhk/MQPsvl91USmSyjAaNGkk48HGjQx39UXfrArm2icSBvbWhk4G9grQO0jAA0xcEtYLUxpUu
 YLnxNKRRKriAdwO/Iy/eWZoCPR0sX7O5Fk4uwvapTPA8hQcFtCaQv9w9toXIsLaxyu/wVzmBQgvxs
 XW/Bn3Z63CNd7k3JO54WQlW2QOgzp20WnD8u7h+HYAxpk06VItasZBqfiLCa9RSxpC6aI7QCiUmc5
 P4U+AbDOGNNuh5N3YeGGYwglVyhrveHibvJlTAYxQkeLhzmEPBZiZiVNLxJu3AUYX2iRDKAyhw77Z
 btteifYHy3NT+rfejxjfzPrm;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qfR6r-00Co1z-2l; Sun, 10 Sep 2023 20:32:46 +0000
Message-ID: <36eefba00b37b81c3feed836295ab5f095597f32.camel@samba.org>
Subject: Re: why does samba build system versions all public-lib symbols?
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Mon, 11 Sep 2023 08:32:41 +1200
In-Reply-To: <57ba45df-732e-2449-1b83-c198e7c0a81d@tls.msk.ru>
References: <57ba45df-732e-2449-1b83-c198e7c0a81d@tls.msk.ru>
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

On Sat, 2023-09-09 at 13:57 +0300, Michael Tokarev via samba-technical
wrote:
> Hi!
> 
> I grumbled on this list before about ABI symbol versioning in samba
> public libs
> already.  Here comes a question, finally: why?

Three reasons, as I understand it.

Firstly, we were told by good and knowledgeable people from the
distribution community that it was the "right thing to do".  Samba
never used to provide public libraries, other that libsmbclient, and we
were trying to grow up as a project and do things right. 

There was a push at the time for the 'subprojects' to grow their own
wings and move out of the monorepo.  We have a bit of this with the
wrapper projects that Andreas maintains, but these are less impactful
on a distribution as they are only needed for testing. 

Secondly, to in conjunction with -rpath, to allow co-installation of
Samba on a system that may have an existing Samba, to ensure we linked
to the correct talloc, tevent etc.  We have had various issues with
cross-linked Samba over the years, and some of the behaviour is hard-
won.

Thirdly, at the time, the public libraries were thought to be
monotonically increasing in master, with very few changes in older
versions and certainly none that would change symbols. 

LDB
---

LDB is not suitable to be a public library on any of these measures.

It is used rarely outside Samba, it is developed and maintained as part
of Samba and backported as part of Samba.  Security releases regularly
require adding to the ABI, and development would be aided greatly if we
could break it more often. 

It should be released from the current release series, with
monotonically increasing versions and no backports for use by sssd, but
Samba should never consume this, and Samba backports should use the
internal ldb with private symbols. 

I would very, very gladly review and champion an effort to try again. 

This might avoid the push-back we previously got (I wanted to remove
the ldb releases and independent build system entirely).

> Most often this becomes problematic when back-porting some symbol
> changes
> (usually newly added symbols) from current "mainline" branch to
> previous
> branches, sometimes multiple.
> 
> For example, ldb 2.8.0 introduced ldb_msg_add_distinguished_name()
> and a
> few others, while trying to fix an issue.  Current samba (4.19) uses
> this
> symbol.  When built against current ldb 2.8.0, this symbol will be
> tied
> to version 2.8.0.  Okay, so far so good.
> 
> This same symbol has been back-ported to previous ldb release,
> introduced
> in 2.7.2 version, and is used by samba 4.18.1.  So when samba 4.18.1+
> is
> built against ldb-2.7.2 which comes with it, it will be linked to
> ldb_msg_add_distinguished_name@LDB_2.7.2, instead of
> ldb_msg_add_distinguished_name@LDB_2.8.0, despite the fact this is
> exactly
> the same function.
> 
> So when I have, say, samba 4.18.4 installed, I can not upgrade ldb to
> version 2.8.0, since this will break samba due to missing symbol of
> version 2.7.2.
> 
> But it is more: the same symbol ldb_msg_add_distinguished_name has
> been
> back-ported to samba 4.17 too, which comes with ldb-2.6.2.  And
> there,
> it is named ldb_msg_add_distinguished_name@LDB_2.6.2 instead.  Which
> is
> 3rd name of the SAME symbol.  And I can't update libldb from 2.6.2 to
> neither 2.7.2 nor 2.8.0, since this will obviously break samba.
> 
> Right now I have ldb-2.8.0 in debian, with 
> ldb_msg_add_distinguished_name@LDB_2.8.0,
> and samba 4.19.0 linked to it.  I can't re-build ldb with added sigs
> file
> from version 2.7.2 or 2.6.2 without recompiling all deps.  So I'm,
> once
> again, in a catch-22 situation, to decide which part to break.
> 
> Even if these symbols are only used by samba itself, - based on which
> I
> can have strong versioned (=binary:Version) dependency between samba
> and
> ldb packages, - this is possible because both are now built from the
> same
> source, - but these symbols are still part of public ABI, and other
> software
> *might* (start) using these symbols, and will be broken by each samba
> upgrade.
> 
> So the question is: why to mark symbols with versions at all, why
> can't
> these be unversioned like almost all other software does?  What good
> such versioning serves?

I've followed your various pleas here and I cannot but agree.

> I looked at the build system, - buildtools/wafsamba/samba_abi.py -
> where
> it generates the ld script file. I'm about to drop the whole thing in
> there for debian and use manually crafted symbols vile instead, to
> fix
> this whole issue.  But even there I'll have to perform some sort of
> transition from versioned to unversioned, or somesuch..

We were trying to be 'good, well behaved' software, and follow
distribution policies and guidance. 

It would break distribution policies of not bundling, but I would:
 - release ldb versions for sssd, with versions.
 - *never* allow Samba to link to a system ldb. 

How we deal with the ldb tools I'm not sure however.  Does sssd use and
administration require them?  Would 'alternatives' be over the top?

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


