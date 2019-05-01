Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E10103A9
	for <lists+samba-technical@lfdr.de>; Wed,  1 May 2019 03:15:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=nL5r4VQjhiE9E4BP9Olf4W/wXFZGd3hX9+U+h8Dlw30=; b=TyiZzrxt3D1wTwuH1D20hSgEFC
	uf/qTqghU5wz4rit8rI0ktjTNDfw1iq53kh+ysCkgct+aIpFSSrXFWbvIGcQUQyZhEgEXsv+CWVnb
	DdOTrZIwQP7Y1L8wZNQ0DJv4/mMVDf8W6JYd8M7/Y+bRrMHSLNk6GAFP+M/kIyVO0yBxtWcyY6PGB
	BTZb0xgWeSL5yhzdnKlh6gaPst1PWYvj2sTkbznWNZAxoHTIOtv1naF/ZQcwq9RZLkBPaozUwvrDs
	pVfJMNGWsPphoUPzqptJS+unsK0q+H2eNxym7NLlw7d8Lz97TN6mcyaVhy+YhWQW0sOQYAOXI1mWf
	RKpLLKLQ==;
Received: from localhost ([::1]:36964 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLdqM-001kaf-Jl; Wed, 01 May 2019 01:15:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:33728) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLdqE-001kaY-T1
 for samba-technical@lists.samba.org; Wed, 01 May 2019 01:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=nL5r4VQjhiE9E4BP9Olf4W/wXFZGd3hX9+U+h8Dlw30=; b=ZjjfOfRcaDd4MHDWnRShZ8Nx/1
 ihICQFSF4H2qn/eKwXoelrQ76k+R+zeIu5KnnP3s3/AHXa8sTdHboc7rQX2I4kJHKHNPucR08WEl6
 PqkVUr3I9o2jdkQs8L1qaWeAylLmGNJDXqSOT/vt87VvT16aTDbIrCPIO61CbLgPQ/Es=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLdqB-0008P2-KF; Wed, 01 May 2019 01:15:20 +0000
Message-ID: <1556673316.25595.98.camel@samba.org>
Subject: Re: Python versions and CI testing
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, 
 samba-technical@lists.samba.org
Date: Wed, 01 May 2019 13:15:16 +1200
In-Reply-To: <bc15f454-214e-09d8-7183-7c23d15338e3@catalyst.net.nz>
References: <bc15f454-214e-09d8-7183-7c23d15338e3@catalyst.net.nz>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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

On Wed, 2019-05-01 at 12:57 +1200, Douglas Bagnall via samba-technical
wrote:
> If (as seems the case in another thread) our Centos 7 CI will use Python
> 3.6, will we actually have any tests using 3.4?
> 
> Debian 9 has Python 3.5, which we perhaps ought to support for a while.
> In order to do that we should actually run the Python tests there,
> rather than just compiling. Otherwise we'll end up in the situation we
> had with Python 2.6 which we supported in theory, but in practice only
> by about 4.x.5 because we broke it every time and hardly anyone noticed.
> 
> In the 4.10 release notes we said we'd soon drop Python 3.4 support, so
> it is fitting for us to do so.

The way to do that would be to add a new samba-python autobuild target
(just running python tests, a bit like the old py3 jobs) and run it on
debian-9 along with the samba-o3 test.  Put a comment in the .gitlab-
ci.yml file explaining what it is trying to do.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





