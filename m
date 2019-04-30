Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 455F5ED7E
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 02:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=3FDRwmbwojbSEumZU69Dt4ClHwBUEJp/bMTsJHimlqU=; b=FoDYNPrmBOVlUEgacA9OLtA4Wp
	zRUouWmQvBEcyDpN5H83stdgSm6id4viC2qS51Q1If0bQGlJV9qCIq9CtmIN1qZMtYdT9k+jeSDfM
	amEGoeGuGdOOdu0giV7ZAnS4o5mAdeLZw3qeiinZJE3xCNKlkZsWbWIUJ9ZBb0Mll1Xmm16WV8Miz
	5vN3ZS+D8S0FBGzaNg4BZJy3kPcQfrBfi2gZWUQ1RNy4AoyySFHvC0hrIDKBDp66ohX9FUeT/Y5Ws
	YjaOVZoW/SlWmmTQ50RnwIIrRnLRJ56KFoZlrSKc0oWRjTPqRsSWAd2weFO3F5gxcnSyuwRwa7AZi
	daH0s16A==;
Received: from localhost ([::1]:64742 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLGJb-003m3r-Nd; Tue, 30 Apr 2019 00:08:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:32888) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLGJW-003m3k-R6
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 00:08:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=3FDRwmbwojbSEumZU69Dt4ClHwBUEJp/bMTsJHimlqU=; b=cWS4hdXX3sKwSK1JFiEtLrkLJY
 aRe85wkhDX0xjL5FHmLxZs7zeeQXKkTmCw72/4VORaoOpqbriqAE9W/ReobAV/fPdR05vAdhIz655
 IutwGJnslAjRDRbu8eJmBl4DbpeKuiDV0lfdiBWaXTGUw2Qojf6lOFhqDdcaZrgQS4Kg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hLGJV-0002hK-AV; Tue, 30 Apr 2019 00:08:01 +0000
Message-ID: <1556582877.25595.80.camel@samba.org>
Subject: Re: [PATCH] Revert "wafsamba: Enable warnings for missing field
 initializer"
To: Christof Schmitt <cs@samba.org>
Date: Tue, 30 Apr 2019 12:07:57 +1200
In-Reply-To: <20190429232148.GA875@samba.org>
References: <20190429193555.GA28948@samba.org>
 <634FD7C2-DD12-4714-9AE8-A95BD3EF40E9@samba.org>
 <20190429200808.GA26142@samba.org> <20190429223210.GA23900@samba.org>
 <1556578686.25595.77.camel@samba.org> <20190429232148.GA875@samba.org>
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
Cc: Andreas Schneider <asn@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-04-29 at 16:21 -0700, Christof Schmitt wrote:
> On Tue, Apr 30, 2019 at 10:58:06AM +1200, Andrew Bartlett wrote:
> > On Mon, 2019-04-29 at 15:32 -0700, Christof Schmitt via samba-technical 
> > wrote:
> > > On Mon, Apr 29, 2019 at 01:08:09PM -0700, Christof Schmitt via samba-technical wrote:
> > > > On Mon, Apr 29, 2019 at 09:51:53PM +0200, Ralph Böhme wrote:
> > > > > Hey Christof
> > > > > 
> > > > > > Am 29.04.2019 um 21:36 schrieb Christof Schmitt <cs@samba.org>:
> > > > > > 
> > > > > > Revert the patch adding the warnings since that causes problems when
> > > > > > compiling master on RHEL7. Many C99 initializers of nested structs
> > > > > > are flagged as problematic, so it seems easier to remove the
> > > > > > additional compiler checks.
> > > > > 
> > > > > sorry, didn't thought about older compilers...
> > > > > 
> > > > > Can we have a compiler check that ensures {0} works included with
> > > > > nested structs and then only enable the -Wmissing-field-initializers
> > > > > if it does?
> > > > 
> > > > That should be doable. Let met try adding the check.
> > > 
> > > See attached patch. That works for me on RHEL7 (skipping the compiler
> > > option) and Fedora 29 (using the compiler option).
> > 
> > Could you make this a merge request please, so we can see it working on
> > all the platforms tested there?
> 
> Yes. CI is running now at
> https://gitlab.com/samba-team/devel/samba/pipelines/59040252

Thanks, then you just need to make it a merge request please.  That way
we can see the patch and pipeline together, and it is in the todo list
of merge requests here:
https://gitlab.com/samba-team/samba/merge_requests

Instructions are at: 
https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Creating_a_merge_request

> > Also, could you please look into adding CentOS 7 as a supported
> > platform via our bootstrap system so we don't regress here in the
> > future?  There is partial support already, but it wasn't finished
> > (mostly to avoid chasing two rabbits at once). 
> 
> That is a new area to me. I see that CentOS is listed under
> bootstrap/generated-dists/centos7/. Would the only missing piece be the
> centos7 entries in .gitlab-ci.yml, or am i missing something? I can give
> that a try tomorrow.

The main task is to make the build pass, but that is what you are
wanting anyway.  

See https://gitlab.com/samba-team/samba/blob/master/bootstrap/READMD.md

The idea is to make the image work by setting
SAMBA_CI_REBUILD_BROKEN_IMAGES="yes" in 
https://gitlab.com/samba-team/devel/samba/pipelines/new and once that
works, modify this:

https://gitlab.com/samba-team/samba/blob/master/bootstrap/.gitlab-ci.yml

To remove the _force_broken.

You might need to fix Samba code, make configure less strict when
running the -o3 build, or add packages.

The others CC'ed here should be able to help also.

All the best!

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





