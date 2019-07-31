Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 679FB7B8A8
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 06:27:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=n3XPR28lhpPjEx92RU008hibWiYM39ZGbiYCUhvkO0A=; b=dLym3QthqkxmHIv/NtiNY6ZDFz
	lMx+/X6DRCcrO423eHUh+oivBQZubAMba/WkWCf//mIqf27xVQ1+ArepoaknQPijFBSgq9GlWMB5v
	FfggGWJXJ4+uZ7/iCtlPBTw7PzuOqkeZTSqP0yKyohV3UyQAcecvBPRPh7CCG9jfCnd6/umSTSJzM
	ly1wex7PBol9ECCO/aeFdRpXARLjZo3INSs8AQAeJs/NL63vX2iVaTTOwaI9Q0PSag7XMLEvPg979
	b7O52sLXR76f8GbaviQWLEU9WqTNFNrLTIVPbRLiDWgit5PFvOxI/CKEemTCtLOmkqSxhpqZi4UOM
	5dyEgiUw==;
Received: from localhost ([::1]:61862 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsgBh-0017ci-6h; Wed, 31 Jul 2019 04:26:05 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsgBc-0017cb-J1
 for samba-technical@lists.samba.org; Wed, 31 Jul 2019 04:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=n3XPR28lhpPjEx92RU008hibWiYM39ZGbiYCUhvkO0A=; b=JdoONgsfJ3fTt7VQ4EYyXYJTMp
 OjeE9rrcv3Gz81um94tkU5KnZH7IDgujjn4asPclS8hwRSp759hvzMq/JHZNXZ4QwtQwYHsKn8BqG
 5ksRgr2N1DTNdX2aEdembeHisvdie8IRYDxCK/imkwj93A76Y+6IVsWL7oVr1Gk7fpKw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsgBb-0002AB-6w; Wed, 31 Jul 2019 04:25:59 +0000
Message-ID: <1564547155.4261.48.camel@samba.org>
Subject: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 31 Jul 2019 16:25:55 +1200
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
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
Cc: asn@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I'm reviewing "Use GnuTLS AES ciphers if supported by the installed
GnuTLS version" for Andreas.

https://gitlab.com/samba-team/samba/merge_requests/669

The one thing I really don't like is the #ifdef on HAVE_GNUTLS_AEAD.  I
would prefer we just chose to rely on GnuTLS. [1]

Duplicated code is bad, duplicated crypto code is particularly bad and
I would really like to remove our existing duplicates rather than add
more.  

Not only are we short on maintainece resources, we would also need to
restructure our testuite to force a non-GnuTLS build to ensure we
actually test this at all. 

In doing so I know many folks really like running current Samba (both
as an AD DC and fileserver) on older enterprise distributions. 

In this case, RHEL 8, Ubuntu 16.04 and current debian stable 
all have GnuTLS versions later than 3.4.7.

So, what do folks think?  This would be for Samba 4.12 to be released
in March 2020.

To see how much can be removed, I'm exploring the idea in this WIP MR:
https://gitlab.com/samba-team/samba/merge_requests/676

Note, for CentOS 7 and earlier it may be possible to use
https://github.com/nkadel/compat-gnutls34-3.x-srpm

Andrew Bartlett

[1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
requires AES-CMAC-128, but the impact would be far more constrained.

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





