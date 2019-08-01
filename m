Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E38CF7E29D
	for <lists+samba-technical@lfdr.de>; Thu,  1 Aug 2019 20:48:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=61ma88TxLOL3f3D44/524v749fsvY/R55FQXvRKZygw=; b=lhelWrkJRuM6Capvyvm5FUoapN
	irShhR/lIjxK/XJPynowwY9Ugidq6vrR5k3wEfol5ajgISv5aLQKTplIX6Yrg/lyOyPknuBHkXqfZ
	vnPq9zzuJsQeF17wjrpIrGWJgTufD/sN3gh8kVj4/Z08gutEyEoLvYHkVtENkSsmeTZY54NQLIFtm
	QyO9NYJyo+VaPNkxhVuAByYfn9B6q32Jqdl28dchmledhkUDjT0jvwat8PHYD03QI+07p5t6Ti0vj
	6ZhBHXkv3t5+WhZfuUGDn9wj3NFRvWbtN+g9+woufpFrVpYGgK0uw+A2fCRE/LQsPQECbhvY+nJ4z
	rwrMRoaA==;
Received: from localhost ([::1]:43130 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1htG76-003RxV-Ka; Thu, 01 Aug 2019 18:47:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47642) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1htG72-003RxO-3i
 for samba-technical@lists.samba.org; Thu, 01 Aug 2019 18:47:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=61ma88TxLOL3f3D44/524v749fsvY/R55FQXvRKZygw=; b=qUkUr7seZi5dX4qVP8Wrn/ratP
 55Pan9ytFS9yvA08r5GOtNs/c3I6aY+POVmjJcqJSGVroufWtjBGixK5b2IT0PuIcdcyIq2oFThB/
 UOpqjVsn3dI3E5JvwPbiqDZFyrZeUB6/Yrd6zGuQ7TGd7TgGIeDH8HbwN+yx3/EmIwqA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1htG70-0007iO-P9; Thu, 01 Aug 2019 18:47:39 +0000
Date: Thu, 1 Aug 2019 11:47:35 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
Message-ID: <20190801184734.GA22596@samba.org>
References: <1564547155.4261.48.camel@samba.org>
 <11267207.3DhDtICzHl@magrathea.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11267207.3DhDtICzHl@magrathea.fritz.box>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jul 31, 2019 at 07:56:23AM +0200, Andreas Schneider via samba-technical wrote:
> On Wednesday, July 31, 2019 6:25:55 AM CEST Andrew Bartlett via samba-
> technical wrote:
> > I'm reviewing "Use GnuTLS AES ciphers if supported by the installed
> > GnuTLS version" for Andreas.
> > 
> > https://gitlab.com/samba-team/samba/merge_requests/669
> > 
> > The one thing I really don't like is the #ifdef on HAVE_GNUTLS_AEAD.  I
> > would prefer we just chose to rely on GnuTLS. [1]
> > 
> > Duplicated code is bad, duplicated crypto code is particularly bad and
> > I would really like to remove our existing duplicates rather than add
> > more.  
> > 
> > Not only are we short on maintainece resources, we would also need to
> > restructure our testuite to force a non-GnuTLS build to ensure we
> > actually test this at all.
> > 
> > In doing so I know many folks really like running current Samba (both
> > as an AD DC and fileserver) on older enterprise distributions.
> > 
> > In this case, RHEL 8, Ubuntu 16.04 and current debian stable
> > all have GnuTLS versions later than 3.4.7.
> 
> Also SLE15 offers newer GnuTLS via an update.
> 
> Also note that the older the distro the more likely it is that there is no 
> python3 available. RHEL7 will have to stick to 4.10 as it is the last version 
> supporting python2.
> 
> That you can build a newer Samba version with python3 support is only possible 
> because of EPEL7 repositories. I'm not sure something like that is offered.

FYI, the RHEL 7.7 beta includes Python 3.6:
https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7-beta/html/7.7_release_notes/new_features#enhancement_compiler-and-tools

Christof

