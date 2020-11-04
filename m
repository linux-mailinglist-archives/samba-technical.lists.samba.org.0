Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFF02A6EAA
	for <lists+samba-technical@lfdr.de>; Wed,  4 Nov 2020 21:25:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=6bHpKtN7XuqF32Ntdn2AQCvMu4ueQ9UecHzOgOsX5aI=; b=H911CidTGd9TWpP2O8qC4ZHVnp
	cvZsMhXLXetEVlvDlDAo5W+1+ueO0spZf4xk/c7kU6f+58t0dbaM2Uh485s2I9sRW2Zfaq+pUNQbH
	o4Ot3pX67M8IVQ+KSb1JCJjOjqTT5e09Iy8J/6hR4hZRXYFg/zRVyGz9VMRhE2KB3QHQZjt2vrnZT
	AVP5DaVoqybTe3W3hw7JZHjVzHzY8wcSmwBl2H5x70V9dgZtOGiodhE0Nfu9Xjk3jbGRO5zs8dXHj
	XeaYJd9wEcAhuPg2KX9euPeC1WzvsZNINfpeIFjFtqTZtukQdnJfNAJgjtIH1JUh8zXNB6sp5JvLc
	xRi5xQ8w==;
Received: from ip6-localhost ([::1]:19622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kaPL1-00HVuf-Qu; Wed, 04 Nov 2020 20:24:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13830) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaPKx-00HVuY-Pa
 for samba-technical@lists.samba.org; Wed, 04 Nov 2020 20:24:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=6bHpKtN7XuqF32Ntdn2AQCvMu4ueQ9UecHzOgOsX5aI=; b=1O7/NiCIsoIeThh6d1sYAQaDVy
 ftQNqbMYF+wvABeCnXV+hR1gVcy+aEY+nDjByE9fkaN7a/+vO+LkMP6LcCqTjS2zKrOTl1qwa+AHC
 Z62LzPJCBYwmT9wy+Bu+BLSx5dwWnxtX4n0qz4DvhVGB/FX19PjOwYiDscYTIcfiEoN7VSy7TgZwa
 0cSC9LHY0PZTh6ul3Z3xPtLpiSZNRf5lJGe3aOzgS2CZCJABDpRZdyhT+r1SYAVwMr7kr7Vgqxr47
 Kph+fAGTk20vQ3k8wQe9bRmlYRbwqMj8aWwd9FWMcWkgI1+x7x1ilWT+y7lBDJI3W8lLKJy+/ZTcU
 PzFHCc8pmlCCd7AICDm3nrr/rCYDD0Axu1S4vzMzxF0mRud0JabAb/u03RJbVY94XK8zAgtPCrc7c
 6au8/12G2eOsVFCyBMromI8G2+Kk7fJyfcZIMiWois835TsS9dkY2bHzOe0OU07LPn7JGHpJWvt+t
 El4oPoUPDkCNB5faA4ORgtnv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaPKw-0002YT-JZ; Wed, 04 Nov 2020 20:24:54 +0000
Date: Wed, 4 Nov 2020 12:24:51 -0800
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: OPLOCK-> CANCEL
Message-ID: <20201104202451.GA5082@jeremy-acer>
References: <20201104162403.E338C14012A@sn.samba.org>
 <4a335431-8128-36d8-5d6c-463cc7632c66@samba.org>
 <20201104172320.GA571436@pinega.vda.li>
 <a0015fc8e58211b1885b2fd515f9321296d17d76.camel@samba.org>
 <20201104183403.GA7355@pinega.vda.li>
 <044df969077e8ca222d3a8d2a0d0211b6d34d287.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <044df969077e8ca222d3a8d2a0d0211b6d34d287.camel@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Nov 05, 2020 at 09:19:41AM +1300, Andrew Bartlett via samba-technical wrote:
> On Wed, 2020-11-04 at 20:34 +0200, Alexander Bokovoy wrote:
> > My autobuild failed in 
> > 
> > UNEXPECTED(failure): samba3.smbtorture_s3.plain.OPLOCK-
> > CANCEL.smbtorture(nt4_dc)
> 
> Can someone (else) please look into why this has recently become our
> flapping test of choice on sn-devel?
> 
> I've hit it a lot as well.

It has a:

        /*
         * Give cli1's smbd time to inform cli2's smbd
         */
        smb_msleep(5000);

so it's inherently racy :-(. Maybe bump this up a
little ?

