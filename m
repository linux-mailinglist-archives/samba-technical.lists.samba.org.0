Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2843D9D1D
	for <lists+samba-technical@lfdr.de>; Thu, 29 Jul 2021 07:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=mmVetg04FiIC7tNa8lV0DD5rtwqhVEmR9dj48WrGnk8=; b=l9Gk7HMzGrsmQf7dN/CC23obWO
	fDkqj7DFIrL6YI/Xhfh+TGBTmwKr/7t1yYT4mSbTMa8psuSklVmI0/y05JLtvF1xy034rrr19Etjk
	8EY6T6dbFX2c7sfHNtB7uDyZ/OrzxvvgD55/hSrzISStw9Bpj2xeNw6myGe9K6HxgMmpUNFypDyNd
	0ZyeKnUV3SVJi8ZSXQhXs3RNQWOqhXZzvDNJtrFs9ZMtlziCwYHb/E0Lso8JPmdCxdf2dlMAFb29e
	cqdP51i7TEWEwWJxsVL1CdrVzkcPA3PAXGUX+wfhEtdJmgwRy2femzEJdlq6ilMdjhtSRLueD0WHp
	tCPdHs5Q==;
Received: from ip6-localhost ([::1]:21800 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1m8yid-001QMR-NP; Thu, 29 Jul 2021 05:36:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17306) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8yiY-001QMI-Ev
 for samba-technical@lists.samba.org; Thu, 29 Jul 2021 05:36:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=mmVetg04FiIC7tNa8lV0DD5rtwqhVEmR9dj48WrGnk8=; b=mWmaflDh7p/2LKwwzwMIQ5YH4P
 XfvJHYfmAISXsQ2VPT+2V/fWhvAIE08qePa1QMhF6j9tAw/RtTPzk9zU5DMEeGaBSEkRQ0IoLF1Uh
 7scMJy5hwR+NJPqoLirysOdl6Qvrf/Vzr28akjTPVtxdTvE8yYlXccRrdn0i6MS94D9/m9dMBbxRC
 RmmC4gIegAcJMxkANkQGddwFi2f9farO129bxFBSuPtNEPaXWzFnbhMB8NUrMaKPRB+8YVXMKRfT6
 gkSr9AY5auhLXmGiARv/ftpH7QntWgZFqzDYdxX6zK50WyuOqIoz1IGlwk4ELyHGv5OIY4lbSSKxD
 XbSgIy+PMtay/sWnnGhkk+KmxAKQCAseOGJAMmP/0H7CPGld+gvMy4tj9cbN7DJHfjjRjodU1yVGz
 AP7LPKI9yHxQpMAs2+bROebfhwuEXO+9wVvc+hkDiKz8ialVd4CiodsR9VP8LrEnW+UQaOCDqX/0R
 epvI7tqmIF2d3Q06sOP7czMd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1m8yiX-0002x5-3U; Thu, 29 Jul 2021 05:36:25 +0000
Message-ID: <9033d9cf90911552526380635de02a6ae327fbd8.camel@samba.org>
Subject: Restrict MIT KDC tests to latest Fedora (and not sn-devel)?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 29 Jul 2021 17:36:22 +1200
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
Cc: asn@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'm wondering if we might be able to, just as we do with ad_dc_fips,
restrict the MIT AD DC tests, eg samba-ad-*-mitkdc to running on the
latest Fedora image?

This would be like the samba-fips test currently.

The reason I ask is this:

https://gitlab.com/samba-team/samba/-/merge_requests/2095/diffs?diff_id=221975070&start_sha=f9988cef700dbab487cdaaab4c4875b5bb319853

This is a good, un-embargoed test for a bug - CVE-2021-36222 - fixed
upstream and included in Fedora.

However it is not included in Ubuntu releases, so if we included it in
samba our pipelines would not pass, which is why Joseph needed to back
it up. 

But medium term we want to include this test, to ensure such a bug
doesn't come back, in both MIT and Heimdal.

It would mean an sn-devel build would be a little less comprehensive
(but faster, due less duplication), but would put off for now the need
to address more complex ways to co-evolve Samba and MIT Kerberos.

(This relies on our good relationship between our Red Hat team members,
MIT Kerberos and the ability to push packages into Fedora, but as we
have that I think we should leverage it). 

What do folks think?

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






