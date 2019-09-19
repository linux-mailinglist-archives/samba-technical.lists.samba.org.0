Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A825B7178
	for <lists+samba-technical@lfdr.de>; Thu, 19 Sep 2019 04:17:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=IOxrcxt/OdSjCzoN1VCt4PzXkxjAG6t+awdsQw1YpbU=; b=UVIdEzGO2C9BwpUBwxzLHNHsqn
	Q2tDOgjsz5sy0MK/Jj2F224kpM4QCgNnIksxHLGNW3Q9ZKXGcwSiYTp9rlxrg/k8txMEoPWCUP5zi
	hP7p5lhWQX3VV1NWCD/geHLiLIli0l5GVlF77YD8cf/fHIs2sBBvzosT+R+BMttIgP8zOh+/DbbPm
	2WFsN0gnqyxiNGimue7AVkcCmiUH5IJmP0sC1kOj3ktTN851PDhC/YjP8ZVQfkTpVpLjTcTmJoGUE
	GaEq8zoN6wb3csQrJ3RT9rst9j4CJCdruZGjldgOHOFcTUgFoUz2btddDZa++FmJbmgR3hx84N1+I
	fR/Z4NWg==;
Received: from localhost ([::1]:52348 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAm06-006kmn-Tc; Thu, 19 Sep 2019 02:16:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54256) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAm02-006kme-Gy
 for samba-technical@lists.samba.org; Thu, 19 Sep 2019 02:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=IOxrcxt/OdSjCzoN1VCt4PzXkxjAG6t+awdsQw1YpbU=; b=EQVs1ywgtg4ZzeXnJRQvEdK/XR
 9aPHLya0268fAByuyGPvpCHuMoYI1N/xD3ivpRWE74zMwhlm46oEzKCJJV7/v4W+Xzw47axOd3kXP
 VmCY8u0Ue+kLKYTyfkER5YPfLOahvhc7RPLQ/pQvG/4264knqYkfwdWVSl2MBfRD2c9A=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAm00-0005iG-BN; Thu, 19 Sep 2019 02:16:49 +0000
Message-ID: <1568859404.4377.73.camel@samba.org>
Subject: Re: Building Samba master on CentOS 7 (gnutls)
To: Nico Kadel-Garcia <nkadel@gmail.com>
Date: Thu, 19 Sep 2019 14:16:44 +1200
In-Reply-To: <CAOCN9rzCshckhzed96biz2QaopixuwsE13JQYCNcWSYd0BbkTA@mail.gmail.com>
References: <1567482029.19432.46.camel@samba.org>
 <20190903144445.58591c90@martins.ozlabs.org>
 <1568849556.4377.70.camel@samba.org>
 <CAOCN9rzCshckhzed96biz2QaopixuwsE13JQYCNcWSYd0BbkTA@mail.gmail.com>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-09-18 at 22:01 -0400, Nico Kadel-Garcia wrote:
> On Wed, Sep 18, 2019 at 7:33 PM Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
> > We can't easily add comments like that to the bootstap.sh, but a README
> > might work.  Only trouble is that you will need to modify
> > bootstrap/template.py to also exclude that new file from the sha1sum
> > calcuations.
> > 
> > Getting a better gnutls34 or later package into EPEL without the
> > conflicts would also be really helpful.
> 
> The published compat-gnutls34 and compat-nettle32 from have "devel"
> packages that conflict with the default gnutls and nettle packages.
> There are probably more graceful ways around them, but they'd need
> some hooks in the samba building tools to *find* and use the
> alternative locations.

We are already setting 

> Is there any chance that the alternative, mit-krb5 based Kerberos
> setups are good enough to use for samba-4.11?

This was also asked by someone else yesterday.  The answer is still no.

>  Fedora has been enabling
> them in rawhide, but I don't know if all the older components in RHEL
> 7 or now RHEL 8 are recent and play nicely, and I for one have not had
> the spare stable build environment to test it out lately.

The issue isn't with MIT Kerberos per se, but the whole combined work
is not supported as an AD DC.  The effort largely stopped before RHEL8
branched from Fedora, so the right packages will be in place, but that
isn't the problem.  

The problem is resources to support it (issuing security patches etc),
the additional tests needed (because everything has changed) and the
missing features.

https://wiki.samba.org/index.php/Running_a_Samba_AD_DC_with_MIT_Kerberos_KDC

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





