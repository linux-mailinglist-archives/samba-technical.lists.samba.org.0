Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBFC178961
	for <lists+samba-technical@lfdr.de>; Wed,  4 Mar 2020 05:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=B+YUq24WvOXTFOeoN8SD9TkzbMamvWdNW9PmLfDt4fA=; b=EGPylu1829TJdCQQIxjZ8khO1D
	hNLWrX5sZswtrlLQ76kjQB0nLWgKS3Xfpcd6JdNfj1M3ge5LhaCsLveU80Hnz1ePM4xpqzJuWXJkS
	cfRls5rQjx+CXcjR1DstuEE8wISjbi69AiEgIltFwsy2ziGD6iZTkWRRtf0ee+vf5R83odwLhCRXp
	6QEskDOD2JQ2/av+sef4mhsc57+j6t+CzITh0aNIWh0/lCzFvRT5+mTP+qcdpuPg2Ox0aSsA/LsQH
	Oad+zxt69LYB4YG0Ol0Qaj2qi68dI8TlJQLtURX0a7uCo9j1EHtclkYf6LLl1ScFzly3Fvdo49EfE
	z3T5Zrfw==;
Received: from localhost ([::1]:63486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j9LJA-00ErTo-HU; Wed, 04 Mar 2020 04:06:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42712) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9LJ3-00ErTg-6p
 for samba-technical@lists.samba.org; Wed, 04 Mar 2020 04:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=B+YUq24WvOXTFOeoN8SD9TkzbMamvWdNW9PmLfDt4fA=; b=r8MnJH0SmZgWv9PJtXro3tyO10
 2YTSQDb33JUhG1g3RwPl39Cg+lLGKch3jMmhZ39rPlaE6XpCdXBKQNLX1PP/BP8O7EifA0sf+Ttcq
 ovkqC3cujmgoycc2jH+hhmkLpYVTUossvupdmWgfPCpaXcHeWsHNqt8Rx7fTGQfdg9QDGORkaZO0V
 8KCtqelNxeu0wgN7NhSS6AEzKc/GlOd2UZaQ4LqwyuXu0tNeSDgIQa7AkFDAZh+avSm9SuvKpLoLU
 L0MT/ZXBKQhPPx+5ijAlml+pI7a4Sm7Ol0nB7qb3v/Q05QSEvNCS6cpY1kFOUtv93gfEnPJ1tH7Bk
 Y4McVyw88BumXNgMgJpV8kxHiCLbpkPs5QE7W3RKt9/nvWPGELPUg6lAGoIpFrcR0HQRCFEorET2L
 js2RUREdzMG0ATzzX0buYy80foi26D9JjYZJ86ZNgCEGV3yXuKW7Clj83Aqz8dgRY85omydJpTVa8
 tCsAKZ+ObPRdopFt7Hulveys;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j9LJ1-0003XL-An; Wed, 04 Mar 2020 04:06:47 +0000
Message-ID: <5b5200796a2d31c585fa20c5fcbb3cb4ef2eb4f8.camel@samba.org>
Subject: Re: Python 3.6 for Samba 4.13 in Sep 2020?
To: "Morgan, Andrew Jason" <morgan@oregonstate.edu>, Upstream Samba
 Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 04 Mar 2020 17:06:42 +1300
In-Reply-To: <BYAPR11MB378209425F94DF58453AE96CD1E50@BYAPR11MB3782.namprd11.prod.outlook.com>
References: <7fa9094832aa924f9526d656e1dc21de823c0075.camel@samba.org>
 <BYAPR11MB378209425F94DF58453AE96CD1E50@BYAPR11MB3782.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2020-03-04 at 02:19 +0000, Morgan, Andrew Jason wrote:
> How long can we expect to receive support for Samba v4.12 (the
> version that will work on Debian 9)?  Will that support align with
> the support timeframe for Debian 9, etc?

Samba releases are supported for 18 months after the release.  

https://wiki.samba.org/index.php/Samba_Release_Planning

Debian's schedule is here:
https://wiki.debian.org/DebianReleases

Assuming other things stay equal it looks like Samba 4.12 would EOL in
2021-09 and debian will EOL in 2022 sometime.

> We tend to lag behind on upgrading our OS versions because it's a bit
> painful on a large file server.  I know that's not a great reason,
> but it's nice to stay on a supported platform as long as possible. 
> 🙂

Sure.  That's why we ask these things.  

Additionally, you will always have the ability to install a backported
python3, or build just the fileserver (eg --disable-python) with
something as old as Python 2.6.

I hope this helps clarify this proposal.

Thanks!

Andrew Bartlett

> Thanks,
> Andy Morgan
> Identity & Access Management
> Oregon State University
> 
> From: samba-technical <samba-technical-bounces@lists.samba.org> on
> behalf of Andrew Bartlett via samba-technical <
> samba-technical@lists.samba.org>
> Sent: Tuesday, March 3, 2020 5:25 PM
> To: Upstream Samba Technical Mailing list <
> samba-technical@lists.samba.org>
> Subject: Python 3.6 for Samba 4.13 in Sep 2020?
>  
> G'Day,
> 
> I wondered if we could set our minimum python version at Python 3.6
> for
> Samba 4.13?
> 
> It has useful new features like PEP 498: Formatted string literals
> 
> https://docs.python.org/3/whatsnew/3.6.html#whatsnew36-pep498
> 
> More particularly, recent tests showed that the only two platforms
> without it are Ubuntu 16.04 (Xenial) and Debian 9 (Streach).
> 
> Debian 10 has been released for 6 months now, and will have been out
> for more than a year by the time we release Samba 4.13, and likewise
> there will be a new Ubuntu LTS 20.04.
> 
> This came up because a small helper script failed to parse when we
> extended the samba-o3 tests (which run on each host) to include the
> local "none" tests 
> https://gitlab.com/samba-team/samba/-/merge_requests/938
> 
> I realise it would be 'simpler' to just change that script, but I
> wanted to raise the broader question in the hope that we could
> steadily
> increase that minimum version.
> 
> See https://gitlab.com/samba-team/samba/-/merge_requests/1193
> 
> Thanks!
> 
> Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







