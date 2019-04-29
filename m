Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3011ED15
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 00:58:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=q7rBanYb+5AtUEpb6usdn5UCVBFvQBcKYzIotbGaLzc=; b=HBZbS+gh++vtJ7rOeC76Hp5gVX
	HHYPZL7OVDKJGjAhq54nMnltcAbvk1i5dTdwCnpC8lJgri4xNo+aV10h4o2Uk9kRNWQMuiCDOfYBf
	3/AMzGpiiAs4gAcGJa3WkOihE1qUvv8FI9hecauFc4+cRkXVbEk+lxz3DPDqibe0LiQhqD4rLssRW
	v1zwf5vo7e+FQX/4tpWV/eIywH4zXXWfYVaGJCeCyBpzkjBjmAfsaQc4W+JTKnQilCz09NtG9fH2X
	/q/Pes8tl/lMofV99JmoJSwhQyBBGMOnzzuDAXiRYFivWI84d6UudF0WO/t+gPYIkQxqQ0jsc8Oom
	Sq1sIMRA==;
Received: from localhost ([::1]:63250 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLFDz-003lpt-MX; Mon, 29 Apr 2019 22:58:15 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:64656) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLFDv-003lpm-EM
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 22:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=q7rBanYb+5AtUEpb6usdn5UCVBFvQBcKYzIotbGaLzc=; b=rLFkUMeU4LEz+IL4KJMqIxy4Cx
 V76EWUV7DGiXJUmygCEjXDev9ruaTZtzqf8XTYOMNPPeycpyx90ts603rkz2ylF177EJaMsMcjEf3
 exJBdI8VGSA/mLq0KJiYM8yxEbtwfoApciW4zx0xzCTumrDSe4YTosEAIleurRqGyOII=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLFDu-0001sr-0g; Mon, 29 Apr 2019 22:58:10 +0000
Message-ID: <1556578686.25595.77.camel@samba.org>
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
To: Christof Schmitt <cs@samba.org>, Ralph =?ISO-8859-1?Q?B=F6hme?=
 <slow@samba.org>, Andreas Schneider <asn@samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 30 Apr 2019 10:58:06 +1200
In-Reply-To: <20190429223210.GA23900@samba.org>
References: <20190429193555.GA28948@samba.org>
 <634FD7C2-DD12-4714-9AE8-A95BD3EF40E9@samba.org>
 <20190429200808.GA26142@samba.org> <20190429223210.GA23900@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Mon, 2019-04-29 at 15:32 -0700, Christof Schmitt via samba-technical 
wrote:
> On Mon, Apr 29, 2019 at 01:08:09PM -0700, Christof Schmitt via samba-technical wrote:
> > On Mon, Apr 29, 2019 at 09:51:53PM +0200, Ralph Böhme wrote:
> > > Hey Christof
> > > 
> > > > Am 29.04.2019 um 21:36 schrieb Christof Schmitt <cs@samba.org>:
> > > > 
> > > > Revert the patch adding the warnings since that causes problems when
> > > > compiling master on RHEL7. Many C99 initializers of nested structs
> > > > are flagged as problematic, so it seems easier to remove the
> > > > additional compiler checks.
> > > 
> > > sorry, didn't thought about older compilers...
> > > 
> > > Can we have a compiler check that ensures {0} works included with
> > > nested structs and then only enable the -Wmissing-field-initializers
> > > if it does?
> > 
> > That should be doable. Let met try adding the check.
> 
> See attached patch. That works for me on RHEL7 (skipping the compiler
> option) and Fedora 29 (using the compiler option).

Could you make this a merge request please, so we can see it working on
all the platforms tested there?

Also, could you please look into adding CentOS 7 as a supported
platform via our bootstrap system so we don't regress here in the
future?  There is partial support already, but it wasn't finished
(mostly to avoid chasing two rabbits at once). 

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





