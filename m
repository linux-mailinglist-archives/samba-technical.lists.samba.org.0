Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A4319AB0
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 08:44:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+Oa3YSQ2JuojquAUjAGDaM+vvbYcaUPfkyIDDiC2Clo=; b=rUfa5Pa/jkaNXuEEe2Bvofr3et
	66d0G23IpCwAwC1h4nxt1f8vpJaG8sqZMxhOAMYUlJ5YnENIt2DqvlRMxBBI2euKzok08Afs0IScl
	XH0bo0xs1I9frQQWBsQ+QYrTig/9PUG98cSJmMT/AyUFKv/guDgXwE+alHxm/foemc4F9KNsic1NV
	OGCocdlpB29IXraWKfxPgVcHTaZv/wq0a4AUQ/YHFSds8lUt1mz/HjrGKis4huVXPK/jWoV9VwrQs
	9xpmLY7GK2O2JLPRq/hAyDKmVYSbYkBUh3GYwJwrdNeX+l5q8jXNezCxj1P6OkUV0EijDkZ4Bb4CJ
	Vw+O+4AA==;
Received: from ip6-localhost ([::1]:21338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAT7e-00CMUQ-BG; Fri, 12 Feb 2021 07:44:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46586) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAT7Y-00CMUJ-SO
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 07:44:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=+Oa3YSQ2JuojquAUjAGDaM+vvbYcaUPfkyIDDiC2Clo=; b=bfa1UAFs44zFPe/bzMVa8pT6k9
 GvS0rzSdn3AHwQFN+W2lzt5U1YOYI1qV5ULuw8FFgeqybJm8gvhOXtj5z3SKtyA8ZZItw+XV4TUo3
 Lqzk9U4puKRzkx/zP4IE0G5IF7k/5qbLyluuJYELeBvU8Ig1Tt3tl7BkscYpq7wB8aSTvxBDUuJVQ
 8epaPWPcvhg17bjtJtuoD1w1Fjc7LBdNKZkdxHNna8xxkJqj0DWPJZshI8XLJNh7YNHJOCtnFFEWA
 s+va9z87CU4XzHi1MK2fD4K3xffjrKXH50NeVZGpNGZwC0IMGCKlPN0biSz3y/ue93T7Sw3dOR4zm
 ipsRh5mc+NZHKhsJp4y3vfqh5EvfiW2bPS37mhHugNKbswQoWdny7FMgQ+FyDZIvYGFOiRZpftCnA
 Wu2l6gfyDonU+ZQtwlA/2pYp2erjBWm4LoLAHBvbpFreEKj3el0EfbkqaZahW27PnBYfPazkEW8Uu
 QOcsqyCA1F/s5A4PnjMnrFeV;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAT7X-0007UN-IK; Fri, 12 Feb 2021 07:44:07 +0000
Date: Fri, 12 Feb 2021 09:44:05 +0200
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Building Samba 4.14 on CentOS 8.0 and gnutls
Message-ID: <20210212074405.GV5029@pinega.vda.li>
References: <CACyXjPzHUBDqMsnGgdenSQJ4xd5c41gzq2+7vv9qkXRe_HZsaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPzHUBDqMsnGgdenSQJ4xd5c41gzq2+7vv9qkXRe_HZsaw@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 11 helmi 2021, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> I am slowly getting Samba to build.
> 
> The latest problem I hit is this:
> 
> -------------------
> Checking compiler accepts ['-Wno-error=unused-result']
>                          : yes
> Using in-tree heimdal kerberos defines
> Checking for GnuTLS >= 3.4.7
>                          : not found
> ---------------------
> 
> However, what was required was not gnutls (which was already
> installed) but gnutls-devel.
> 
> How can this be fixed?

By installing corresponding development packages. Almost all checks in
that configure check do check for a presence of development parts of the
packages, not just binary libraries. Please follow instructions as
provided in the other response.

Perhaps an easier way would be to install 'yum-utils' if they are
missing and do

# yum-builddep samba

That implies you have source repositories available (they'll be
automatically enabled for this specific operation) and it would pull
a list of packages required by the source package.

-- 
/ Alexander Bokovoy

