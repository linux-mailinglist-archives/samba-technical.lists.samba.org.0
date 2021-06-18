Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 701C73AD3CB
	for <lists+samba-technical@lfdr.de>; Fri, 18 Jun 2021 22:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=gob3l/GAPUmDR0DsaUDMwl15gtQcRHmxQZc/puhaQ3o=; b=Bd5pgH+G1MlpL0Raf39cM2BPZ1
	+R29YwPfYd4GWNDmf2I95N2HtkfqIZFqdUkVik5m79Z+UtHIIu/qQKAN/MElIMyFGQdip6XJnfmLH
	o8KvDLvLCOx36m9GMTDxkkpFrQN89ffY6OUJK88Bwhsshwv9oAN/5wzn6yN5vJvEjt0Kcfcmfnv1z
	Vn7YHlcYt4rGghG83LJlFyNwxb1DrDsr3tPIVCF8Mp+J9VEHNoxIIQMa53vE/7z4tsButBSU4nNFP
	vq7oaoJalfvN9f5ALS214j2udFcPpCb2utmqE27o6wq+Onvlb7POpgBZ4odDgEqkZHbzKQ98KNVGw
	QbSvXwdA==;
Received: from ip6-localhost ([::1]:36536 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1luLJc-0073Jk-8c; Fri, 18 Jun 2021 20:42:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44426) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1luLJW-0073Jb-6J
 for samba-technical@lists.samba.org; Fri, 18 Jun 2021 20:42:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=gob3l/GAPUmDR0DsaUDMwl15gtQcRHmxQZc/puhaQ3o=; b=HwMeIe0zNhiafH/MhVgXOELmNC
 XMha+QckY0V9Pyysak14Of+GFBwMGSXHEn4m1mCQWkLH9eZW5khYmtNGy9VAqYpJsLCj2kLk0T9NQ
 UVdWbm+neQNpdVxLGlYNoaOpsJOdgkzRSusTbM733VtXk5Hk1cVP8rEwSIlEYM12YexJDMmhXWJKx
 ZfqhCzDjiaq0WP1eQL0XgLXGZjn2MYDYQiWAWGwTuEtRvsrSZZfZwyG1V0uKZohEGmNIITw9v3GYg
 5fhTh98Z4CyiogSJi/2Q2vRwnBz8dAxlpatD3ChMUWSRNQPSTsB/Wk6E5bY9NbeM5GRaldr5P3G+E
 ZbrieHxO1QgP6rLv1iFKv7uEm6ZJK7cmBW78KNJX6eqrX39CbZI1afgWP4m/jdDq7C5+VZc0gVqJm
 VlSyO6eOBNkdFXAHB1csmR9lz8xrVr6dEEvX08uPebP3DPBiB+S6ckMM4641B5ri7gpZMgNeX4adv
 /C7c4MZziYimy/DRaEwm7na0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1luLJT-00057k-Vh; Fri, 18 Jun 2021 20:42:04 +0000
Message-ID: <26713d5cdcc47d0d9fb017b6a1e546d9501d8efe.camel@samba.org>
Subject: Re: Heimdal upgrade, really happening this time
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 Stefan Metzmacher <metze@samba.org>, Isaac Boukris <iboukris@gmail.com>
Date: Sat, 19 Jun 2021 08:41:55 +1200
In-Reply-To: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
References: <b2cb195314281883e378c908784ac6f9f841584d.camel@samba.org>
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

On Wed, 2021-06-16 at 11:56 +1200, Andrew Bartlett via samba-technical
wrote:
> 
> My current draft is up as a MR, and I'll continue to work to upstream
> what I can (into Samba/Heimdal).  I do plan to upgrade Heimdal again
> (perhaps to align to a release in 2021 if they make one) before I
> finally merge the branch.
> 
> https://gitlab.com/samba-team/samba/-/merge_requests/2014

With the current patches on that MR, I think I will have CI passing.
 I'll know more once we rebase on master as 
https://gitlab.com/samba-team/samba/-/merge_requests/2028 fixes some of
the noise-generation. 

It is also Saturday here and I should stop :-)

But while there is much still to do to re-enable tests that have been
skipped, I've cleaned up many conflict markers and dealt with the
upstream changes that have landed in the meantime, which is a pretty
good start.

Joseph is also making good progress on landing the Python based tests
that Metze started a while back, see here:
https://gitlab.com/samba-team/samba/-/merge_requests/1896
https://gitlab.com/samba-team/samba/-/merge_requests/2001

This will give us much more confidence for the merge.  This new
testsuite approach is a game changer, the Python-based tests have found
a number of important differences and helped us fix those.  It makes me
much more confident to pull the trigger here.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


