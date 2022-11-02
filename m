Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96A616E85
	for <lists+samba-technical@lfdr.de>; Wed,  2 Nov 2022 21:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=sZAGLQU96h91MPxyyrrFNtLcsjd3YS6+yGLqTjOdfJc=; b=4amulE+Il0yiYhT6L35vZuA4fC
	Q9ncYHSsWsT7iLrJYZFpJIvV+1CIip8Zhegf4shQl5MblmwJRkfHPuFJ+SQ4gsmdXVhkZcGWXDB9n
	5MnGH5FqWKqrDJ+YwMH4SYPNSpqDijVFDuPI50u4jqJXDZt4ic5pwSNrX+zKOtGe3J4K1lWRXIonA
	A/fm9lb0OcUHyzRcCuVypnkwmY5D3laPRinSptUkk+oJKPBIqgKN5+Ti7SIFH4hiJ+BWvvHEOpomy
	vF3pVSKORNKopAOWK8lZ58b7oZHurnoEvBajfWRRxLdCBqizgs1yA3khHL9kralwZTI1vXLrwygQU
	HwNG4c5A==;
Received: from ip6-localhost ([::1]:46632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oqKFX-00AAWK-N2; Wed, 02 Nov 2022 20:22:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60680) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oqKFT-00AAWA-2q
 for samba-technical@lists.samba.org; Wed, 02 Nov 2022 20:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=sZAGLQU96h91MPxyyrrFNtLcsjd3YS6+yGLqTjOdfJc=; b=mA05jTh216BCe2G7MuYXLHrqGC
 /p8vfvg7qri7ZygncOwCQ/k5QqfY2oKY4ByzlkpE0kE2BI+R1q8th82vGVFuJ+R01piiGi3AiZFzo
 nE4UnGosiANDAmI3+brTNg4WW/SQcfYXzA5Iejbsv7wR766rXbze6zSJO7cYlXv7KHBE05XNUU+rc
 8uNgwc5Uzd9oO2fMt2qTJF2u+iKQM735tircpC4s6G2gy+x3kl0L0mNEmf+5wOggJeg7+8r0lWIpR
 4k1lmLDvrISn2D/Pf2PPRjXlruvX9ZKRI1IlSCp+KOShY9/KGG3x1uFYlw2mhe1GPrkyRwtg5PhpN
 450DiHkGYBwPYpYQJTUMupd3qhGQVqdApDjD3cdLRFpoMgkNORDBFTeQRiPIVTSzat5wk3MRWcv4e
 yA4NBB6Y8F43F3OwSxZhvFKReCyuz5uwxix2T2SWXzfmjLJl6NXBnzxLHw1ysJPJrGWAJjaM+qI7V
 5I3qoG54m72MHqnGgh2Yf9gK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oqKFR-006v6S-2Y; Wed, 02 Nov 2022 20:22:05 +0000
Date: Wed, 2 Nov 2022 13:22:02 -0700
To: samba-technical@lists.samba.org, metze@samba.org, abartlet@samba.org
Subject: How to push to a non Samba Team member branch on gitlab ?
Message-ID: <Y2LRam/bPaaRWRjy@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'm working with a new contributor here:

https://gitlab.com/samba-team/samba/-/merge_requests/2741

and want to push a modified version of their patch
that corrects some things to help them work with
us here on the Team. Pushing to their branch
helps them see what I corrected so is a very
desirable thing to do.

The gitlab page above shows their branch name as:

vporpo/samba:master

and clicking the "copy" button for this MR gives
the text string: master, which certainly doesn't
seem right as a branch name to push to.

For another Samba Team member MR normally I'd just do:

git push gitlab +HEAD:<copy name>

where <copy name> is the string copied when
I click the "copy" button on the MR. For example,

https://gitlab.com/samba-team/samba/-/merge_requests/2750

"copy" gives: dmulder/smb3_posix_ext

which would allow my changes to overlay the
changes in the MR.

But what is the magic incantation to push my changes
to this MR ?

git push gitlab +HEAD:vporpo/samba:master

fails, as does:

git push gitlab +HEAD:vporpo:master

I can't see any logic or patterns in this, or am I just
missing something about git (again).

Jeremy.

