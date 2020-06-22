Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB12036F2
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 14:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Cr1UDdna8c32TVmWeZDufuqfxHupMCOiJnShOyvUy78=; b=YMcWAP0+ki4hRW8/niCw8JMsBY
	lmbEXglZtELGsfCI8Ee4ok1L3GD3jEz3+ZYtxT7Eb/5XnqPbf7lUWE8inWWrRoVGVwDqTIPRWfF9t
	+/3ZD4GVkyxap/ExDZSf2Gh081TMW+n5nhH+2aIJGS0892J30JjSZMny63YZDIDcQxHmQ7Rk7fNV9
	52M9dkn49VD5lmlLT5eFyCgnmcHqC+HfANH5bJuRQF8Om1WyaT1tPpbiLgns5nDv7BIVhLow9lx4C
	Xn7OvX1CGvA0NuEATOuvmtYPuPmVqsRNPA8C7hTKfV1fJM9DrwBvuDkNNU3zXYvT3caCYjQaenHF0
	yuTifFHA==;
Received: from localhost ([::1]:38292 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnLiR-001nFM-5a; Mon, 22 Jun 2020 12:38:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58670) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnLiK-001nFF-7Y
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 12:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Cr1UDdna8c32TVmWeZDufuqfxHupMCOiJnShOyvUy78=; b=z7b6AZv4czAXgr3/ngdtLvK2Z3
 a2BlPZOP4N/wQlACv6PDm/+HBhjNF44J2yvzwfahEN7OdsLr0uBf1iDCvoqQLfbseEeoSU2lCifdp
 pbjyhwouvx4bN04s7hGPGqFf3ed0gs4PQZS6uoE2z5GzYQl11ct/+UgPi9zdoRYCJfN75QR0mgCHu
 2vSrls9fZFkNwLB+f0ToJ44oxuWEYNtwLJPWbTshFeuarix7jeM+uPvj924LdURBZSywUzqAgzflX
 A6x5WG1l/fd7XXy9a3XnrbZ+k9+VEJMV4jOWULfsDVu767tYBSkESfJV45TH2Q6E9xY9RgHKIi92j
 bJJ8u4+hqe766KwDzw63iFE2zLoAN6MGq87Zg0LTPs1C+zUZ0xm2k9iLE3zSBtryjwcvfNW9fs+w/
 oRckVzdJB8XIgudonvryfnNNCEWtn/WSf1NDLedFXSaBNA1HO7f26vekxZgqTm27HZ1zrgaIE9AfC
 zoHB36CwGaFg1GiKc+EenKoA;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnLiJ-0000QU-5Y; Mon, 22 Jun 2020 12:38:15 +0000
Date: Mon, 22 Jun 2020 15:38:13 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC: Week 3 Progress Update
Message-ID: <20200622123813.GL3036357@onega.vda.li>
References: <CAH72RCU=2HPWJHjgtMFx7wM061n-Jjo7aYRinxLPDtq8fo-OrA@mail.gmail.com>
 <20200622100601.GK3036357@onega.vda.li>
 <CAH72RCVF2NCzTgZim1V7D8MfmZed00+ujKydLw4eyxrLEsrC4w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH72RCVF2NCzTgZim1V7D8MfmZed00+ujKydLw4eyxrLEsrC4w@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org, "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 22 kesä 2020, hezekiah maina wrote:
> Thank you, Alexander.
> 
> In the first image, Sites Management and Time aren't present, was there an
> issue with them?

I can see them fine in the screenshot -- maybe you need to scroll to the
right side? I took almost full screen 1080p screenshots so they aren't
fitting into the screen on that improvised page.

> 
> On Mon, Jun 22, 2020 at 1:06 PM Alexander Bokovoy <ab@samba.org> wrote:
> 
> > On su, 21 kesä 2020, hezekiah maina wrote:
> > > During the week I worked on the following:
> > >
> > >    -  User Management
> > >    - Organization Units Management
> > >    - Added the patches Alexander recommended
> > >    - Changed the UI of components written in Week 1 & 2
> > >
> > > Next week I will be on working on the following:
> > >
> > >    - DNS Management
> > >    - Forest Management
> > >    - Group Management
> > >
> > > Last Week's changes are in the develop branch of this repo:
> > > https://gitlab.com/HezekiahM/samba-ad-dc
> >
> > Thank you, Hezekiah!
> >
> > I made a short gallery of screenshots here:
> > https://www.samba.org/~ab/samba-ad-dc-cockpit/
> >
> > The code now builds and works mostly fine on Fedora 32 without any
> > additional changes. I had to disable SELinux on the system but this can
> > be looked at later.
> >
> > --
> > / Alexander Bokovoy
> >


-- 
/ Alexander Bokovoy

