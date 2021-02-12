Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3112C319D6C
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 12:38:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ZKXdWxyQncQ2n0L+5xhhtFdW4XI7Z2x9ZiP+jN13vEc=; b=q3zT+BO3gvvAAb2OcyUIqKr7nn
	2n7aGS/mcqfFSkE9y+9tFd+mxTUZHGsUrCulCrost+s7yY8BbTjlgLKd0hyJkXItvGXS1GI4zicLj
	UyVLRmGU2eLUB7HldzyRigzj3qkCbMYIlLf4U/yvcQp0so/vVvDSaqZ4253iM02NqnaBsyCBfNIBG
	tjvS25von3JurdhquzhTmk22RyCYquoZwaIe5siNenhxRcwurf1LK70R9fze9ohc/g22UFhgZRfin
	AeQeWb4PjoIrOLxqjVv1rvrgeY/Q5kfIckCfrC0LibwGE51mqukq4U1zvEvgmKM8Ss3oe8c8Ly+Mw
	JLoXCm7Q==;
Received: from ip6-localhost ([::1]:29562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAWmH-00COJi-Te; Fri, 12 Feb 2021 11:38:25 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15110) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAWmC-00COJb-RM
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 11:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ZKXdWxyQncQ2n0L+5xhhtFdW4XI7Z2x9ZiP+jN13vEc=; b=FmB2dx0MizQPiGGBhTyA4/7i8i
 irJXwzowwpA/wipsAQw+Tc68cAt603KiKWZ8sZcztPAEJGKUSjsFIgjPGz5yTYZfs4BqybxZnSKyf
 LDdlCcdZBh40FzDAU4ptxRC5jmtEEI0rZOhnI+mEbEgEjsxkWOgKG5oq3gdMwcDT6+Qne3zfAghoV
 WSQSYD4ZIxW3GDcn7w5SZNmB2sDrF9/XWlkI9Vy0McUuQiOyYi1ZA6hntMc34Y4lLMD39SWUz1d1d
 44hC6WwsyteUCAR0TaaHGWg+7UTUSE4EoXM8g2EanvS/9wAJw6acnQe48M63cHvUtWLl177oJ34+k
 Hz3Sk46sr4/ON4znOEgMH40Kz3eWvQnLL+7ggL9Z2PfkAeFN6I2pCp/yk6kFtmUQVDmGOZMGmZH4x
 YnfKAtA9L/dwKWwqcPfWMoiLuZFPp/JrvUxoFKioNoN8Yqy2X5b2AHBYFAQ22o6UKS30WgRl3W5RF
 NVhV9zwzMUKI7OLm1yN/E36A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAWmB-0000HX-B9; Fri, 12 Feb 2021 11:38:19 +0000
Date: Fri, 12 Feb 2021 13:38:16 +0200
To: Nico Kadel-Garcia <nkadel@gmail.com>
Subject: Re: Building Samba 4.14 on CentOS 8.0 and gnutls
Message-ID: <20210212113816.GW5029@pinega.vda.li>
References: <CACyXjPzHUBDqMsnGgdenSQJ4xd5c41gzq2+7vv9qkXRe_HZsaw@mail.gmail.com>
 <CAOCN9ryq_P0j6brW+UW7v_4d0hX12MP293e5TwkieTNNh7z9ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCN9ryq_P0j6brW+UW7v_4d0hX12MP293e5TwkieTNNh7z9ZQ@mail.gmail.com>
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

On pe, 12 helmi 2021, Nico Kadel-Garcia via samba-technical wrote:
> On Thu, Feb 11, 2021 at 10:03 PM Richard Sharpe via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Hi folks,
> >
> > I am slowly getting Samba to build.
> 
> Take a look at the branches for samba-4.14 in my repos at
> https://github.com/nkadel/samba4rrepo.
> 
> The RPM's that RHEL 8 published did not include the python3 "devel"
> RPM's for various dependencies, so the Fedora style .spec file is not
> compatible with it. It's really frustrating and demanded rebuilds of
> other Samba related libraries.

In addition to that, we run CentOS 8 builds in Gitlab CI, there is a
bootstrap file bootstrap/generated-dists/centos8/bootstrap.sh which is
generated from the list of packages in
bootstrap/generated-dists/centos8/packages.yml.

There is an effort to extend the list of -devel packages available in
RHEL and CentOS Stream. Andreas and I added Samba requirements there
some time ago. It'll take some time to get that fully implemented for
various reasons unrelated to us.

RHEL 8.4 will also be providing samba-devel for other uses.

-- 
/ Alexander Bokovoy

