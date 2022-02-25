Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F62A4C4079
	for <lists+samba-technical@lfdr.de>; Fri, 25 Feb 2022 09:49:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=W2SL+ZtObBZ4KjixstBODf0pQPvIQzCm8Qku+s7Iv30=; b=sqXG1gpAlyK5Z1m94yRisIHWYk
	RkSG9xkyNYVoorglWPv3Eeq6KUoS+ckkw6yojSyx6D8mqvilCJykmHJgNBXz/q3OzVlknxMcNmh35
	lDqriZgS4YuzF+z+rei2ZxzQhDf8ZGcM2Dce1+OBw62oEt25/mSABeEJGmBd4Kv084eUA3heP2HEr
	HU+1XqMzNtak6ZAIdYoL0/SUwR5ISngKT/7l+azizXupc9ZdYNkSbJ4qGdhEhNdGZtZOGD/KQBqVE
	Vo4bLooyrhJU0o4PKcn698Pi91wsBgXeYtU6Dx/To6PR1T62VuVW9a0V5VTkxPrujWzdk3MvWF43h
	BE6OZ7Rw==;
Received: from ip6-localhost ([::1]:47096 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nNWHi-00BcjU-0K; Fri, 25 Feb 2022 08:49:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49204) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nNWHc-00BcjL-Ix
 for samba-technical@lists.samba.org; Fri, 25 Feb 2022 08:49:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=W2SL+ZtObBZ4KjixstBODf0pQPvIQzCm8Qku+s7Iv30=; b=bgfTCLWWUQC9Udx/QpTZIw5vzv
 uBwNqZE2P7Upi9wYkwpHaLRd0RgaysqKMHEhUPT2BlrX20iQrDYoMeiZeQCkRmtl236CWnWFCxE1z
 XzHNiOPaxJ3pRLLHPT7yi0yF/fLTevSzIHmuYgWZHtZqK+LdDuDZJNLl8ETrV++MinlQ4aqw/Dd7D
 YyBu5H0n69AsC/0TprU6bNSbaVPqaD9xn4bNlQs+ShTNl/HmaBDC8Jtzq+qfGs1ekoO2/oM6CCm9G
 E+aRPmLZj5M5/LAbK9fRyHADRHzYdlteFGpa5VwzHTE2nnqTdGRPaPFo6NNTbGyZRNomRDOwViCR+
 0V849djwvrTh4iY4BsLoetfNokOpeM7dLJas/4y0a+U9IJ+rRG/cTxQ6WI28QmL02ISMun0ZF6FNC
 eEZy8/UsCW15lVyrh1gc1K4+d2JnuCRQP/JoeGA8nBeyR3wBHUE7SPCZnTgGOIfgPMTaJwxzFtKzF
 DIXbqFyooozqB+z0pk8Hy3Ph;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nNWHa-005R2N-MC; Fri, 25 Feb 2022 08:48:59 +0000
Message-ID: <23462492d1a7b61ee1c40313445f737296421f2a.camel@samba.org>
Subject: Re: Samba | Bronze bit, S4U and RBCD support with MIT Kerberos 1.20
 (!2330)
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 25 Feb 2022 21:48:52 +1300
In-Reply-To: <note_855084458@gitlab.com>
References: <reply-4ecf65ee6e5c0adbf25c57ec268d6f8e@gitlab.com>
 <merge_request_134944865@gitlab.com> <note_850167638@gitlab.com>
 <note_850253323@gitlab.com> <note_853178160@gitlab.com>
 <note_853623706@gitlab.com> <note_854613918@gitlab.com>
 <note_855077698@gitlab.com> <note_855082159@gitlab.com>
 <note_855084458@gitlab.com>
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

I think this is a discussion worth having somewhere a little less
hidden than a MR.  So sent to Samba-technical, but BCC to the MR.  Lets
see if that works...

On https://gitlab.com/samba-team/samba/-/merge_requests/2330#note_855084458
Andreas, Alexander and I are caught on the philosophical point of what
MIT krb5 versions we should be including runtime support for in master.

My point is that we test MIT 1.20 on Fedora.  The non-Fedora builds all
build Heimdal.  That is, with these changes the MIT 1.19 support is
untested in our CI, so we shouldn't put untested code in such important
codepaths. 

I'm honestly not making this argument to destroy the MIT KDC effort, on
the contrary I want it to succeed!

But for it to be a long-term success we must also be able to learn from
the past 6 months in particular to ensure we have a viable, practised
process for changes need to be made in both codebases.

In particular, I'm concerned that the AD DC 'will build and securely
operate against the MIT version found on enterprise distributions' is
just not a promise we can keep, so setting that up as the baseline
expectation sets us up to fail.  

Instead, it needs to be much closer to that, particularly in the
development of master the AD DC 'will build and securely operate
against a particular MIT release (plus patches potentially) or pre-
release', and we continue to work to get those changes upstream so that
sometimes, when things go well, that also means 'will build and
securely operate against the system MIT krb5 of a distribution like
Fedora'.  

When that happens if things go well, then an enterprise distribution
could also operate Samba as an AD DC against a system krb5, by freezing
both at the right time, but no enterprise distributions will ship the
AD DC so we shouldn't really target that.

(I'm also happy to have a video chat about this if it helps).

Andrew Bartlett


