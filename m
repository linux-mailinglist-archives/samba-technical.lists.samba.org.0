Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F621EC6E8
	for <lists+samba-technical@lfdr.de>; Wed,  3 Jun 2020 03:44:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=60chrlrF1pjXRb0Cxszx3vj+Itlb0orHl5xaBZol+o4=; b=hcJpgoMS7ZoIKJoxU5q7zth5ga
	WVS8ZGF4yeinOIJS1fJkl2VtSUTT1iiejtqZaPAmD6E4P4lWC94aV3r1aeTDbLYkIWBJV6s/SsVv7
	EB8kqervHiGV9Px0BDqgzTvyJZdZFE/TmKq4YMMbCKeDhZ1htRqSi3STSljCILDYB+47tFaqE1BUD
	ZgtFwiht+YGUB9zXX0WIeYaTWRxym6quTS+IjyzgLAOMl99c6hzcHhmcU5Od4nMd1i7fhJDNHccz3
	HTq87PgtrXGo5VxLYn1qzE9VHpK46gSb7hPXCKqXnzjRawHwi0M3G6rnSfLWmb6M4CaKZ68DBoY4m
	OCCEGt1Q==;
Received: from localhost ([::1]:40242 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jgIRe-008Xwe-Nt; Wed, 03 Jun 2020 01:43:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50176) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgIRa-008XwX-3t
 for samba-technical@lists.samba.org; Wed, 03 Jun 2020 01:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=60chrlrF1pjXRb0Cxszx3vj+Itlb0orHl5xaBZol+o4=; b=xeptJ/tpzT9kPDNP3w9xhBeih7
 Gq7cdG8uaSYY3xXhnZWK8DYwvkTTNfO7U6tpX9m6x3N7IIPwxlXJgRl9tC1ph57VTqqe1JfmvLLsr
 7y2NN8S157nBCeUgtm8jjQiKjOck4b9+dTby415sNDG90xsyeddEP+mrq7tDOW1ZHaEplyGxvRoji
 b+Gic14P4No0NvwlGR6KH1CVy/Sfn+O5H/za+bdJp2LULQzUgNrAfk2+RUiEiC7WebM2d887xAxt4
 /i6HO7wM3smbDYrgfig2lvawdtAnsbUuawKeOyZBfgQHviofyju9O7+8KjBBYaLL62Ff375OXLROc
 XyZLyjdcau4ngYNYHn+c+F2bc3Pt00zkWYT4gXwNe518dAFm7RL7G7FBWhsbKuSPbdrQ6gHN4vHJK
 vdkfOnEAJCbhKDPEdauwLrsXo/9/iZbARd2Oih0YgQAWji3O1FV8w6Yk82YqwsgmyBvX6Ourxu9p4
 loPb20F9rjbq7WbsCO+KK8/n;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jgIRY-0005b2-3o; Wed, 03 Jun 2020 01:43:48 +0000
Message-ID: <c5c46e71b5093b5ba3450d089541a8d431792247.camel@samba.org>
Subject: Samba Developers Guide
To: Karolin Seeger <kseeger@samba.org>, Jeremy Allison <jra@samba.org>, 
 Richard Sharpe <realrichardsharpe@gmail.com>, =?ISO-8859-1?Q?Bj=F6rn?=
 Jacke <bj@sernet.de>
Date: Wed, 03 Jun 2020 13:43:40 +1200
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day,

I recently had the misfortune of cleaning up the docs-xml build system
and removed some old cruft.

https://gitlab.com/samba-team/samba/-/merge_requests/1377

Once I got it going, I looked at the Table of Contents, which is
similar to this old online version:

https://www.samba.org/samba/docs/old/Samba3-Developers-Guide/

I know I was the one who tried to save the Samba HOWTO and Samba By
Example books, but that irony aside: almost everything listed in in
this page there feels outdated, old or misleading.  We now have better
macros to replace CIVAL, for example.

However, it was decided to keep it and those of you in the To for this
mail have contributed to it in the past few years.

Can anybody say some words in support of this, or should this now also
be removed?

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




