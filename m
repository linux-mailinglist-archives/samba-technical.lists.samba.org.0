Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC221CBAD0
	for <lists+samba-technical@lfdr.de>; Sat,  9 May 2020 00:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=O1VzNyrQRiWmtmwBXzqwohOptPRicBR4eAbadBBV4jo=; b=lloOvCHXHs85XO6Zi3iRRo5nrI
	leme6SbA093xmw988+AffcYWU3YEAeAuzC4SuLsUXaSDe+bUXMnhI//8HEf+tSDEmop6Y6M8but3W
	hdPKR0K0DEajCS/DKGPagLwnyMYQfSxIkooXHUq1xLqd8RdffmKH62BJ6YQHSmWGMoRqlcusbtyny
	nqRUO/MXK4BLw4pqZXVcO7C60DEK3FyVk2I+EI4g9Xhg68LR/aEncUtVxDvdyDgMv3z3v2Gfj2FlO
	7jLzXh/hdWllGG1az/Qlce+zarD1GqpcMdhaeYgE/Z9Lvd3u7RXgXofQgaSwDpOqnufcEFwRi+jvk
	w4q96T6w==;
Received: from localhost ([::1]:45796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXBbF-003K3U-ES; Fri, 08 May 2020 22:36:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54276) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXBb7-003K3N-DS
 for samba-technical@lists.samba.org; Fri, 08 May 2020 22:36:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=O1VzNyrQRiWmtmwBXzqwohOptPRicBR4eAbadBBV4jo=; b=mfvE9IRvc3Knu70TPSb54yLBmJ
 Ld6oH2xnMJsBVzbH5T1UyUrGUYvxuL5JiL1FKT/QjTnjh0SR7enHo/iQbmY/pSwhO6dy+PgJL/sM0
 QrcKVLMD7WNv7kzc8Ea8tbbHPUkjdsCc/fGb12ff0RGzKc6Db7/y3o+58g2UkhstmKwEoK9OhqfAA
 fCKUPiq9Hc1ewfiOXp9T2ovS3gr6gvLXPBbst8yCWIS/y/6v1J/0WIJ/Lqb5iWZlR0KQ7H2MGBMPg
 baydQy6CZxkb5TAVyL15acVyey9J8L77+0uXNa9zdYYvcCRozbUUaBHMUV+O9dZD2sS6xDhrPN6+k
 QC4eFzEZJFrZs/QUAmSH5FWjKfuno2vdzVz9AeiR+FwOMGjsL04Jc22VaAJlZqLblo9BcoPkHH+Q2
 iRhj9M3sZurUP5xTdrdLOarbEV6pxU3ZL3s+VsWIwVGq+Hqt3ToejiE0UrHdbxKNHqdCuYIdAT22L
 k4+7iEsr9KXiT23i+EsuHfws;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXBb4-0001SP-SY; Fri, 08 May 2020 22:35:59 +0000
Message-ID: <ad425374b09645fd9b7b366c9ca1725e00176ca7.camel@samba.org>
Subject: Re: [PATCH] snapper: add configure option to control build
 (default: auto)
To: Matt Taylor <liverbugg@rinux.org>
Date: Sat, 09 May 2020 10:35:54 +1200
In-Reply-To: <CALSyjX7RkiukckU5P1xL4FBX6tWpZFB9E1t0CrO+t+0EwNaNWA@mail.gmail.com>
References: <CALSyjX5G7ps8Pafurh5L+6U_JYBA9uTRxJaEhwKL5jTvU=2ZOQ@mail.gmail.com>
 <20200508222441.4f74c615@samba.org>
 <29c6778ebf0a22d063042589526b98922d06301d.camel@samba.org>
 <CALSyjX7RkiukckU5P1xL4FBX6tWpZFB9E1t0CrO+t+0EwNaNWA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Matt Taylor via samba-technical <samba-technical@lists.samba.org>,
 David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks.  We just need that declaration and we won't be looking for the
DCO paperwork, but please do still include the Signed-off-by.

Thanks!

Andrew Bartlett

On Fri, 2020-05-08 at 18:25 -0400, Matt Taylor wrote:
> As long as the option to disable is there that works for my scenario.
> I figured since it was automatically including snapper if dbus was
> found previously I would keep that automatic behavior.
> 
> Updated patch attached.  Snapper is enabled by default and configure
> will error out if dbus is not found and --disable-snapper was not
> passed.
> 
> I'm contributing as an individual with no corporate
> involvement/restrictions, so does that mean no Signed-Off-by tag is
> needed?  I have another trivial spelling patch to send after this.
> 
> Thanks,
> 
> -Matt
> 
> On Fri, May 8, 2020 at 4:36 PM Andrew Bartlett <abartlet@samba.org>
> wrote:
> > 
> > On Fri, 2020-05-08 at 22:24 +0200, David Disseldorp via samba-
> > technical
> > wrote:
> > > On Fri, 8 May 2020 14:05:16 -0400, Matt Taylor via samba-
> > > technical
> > > wrote:
> > > 
> > > > Recently the samba packages on Gentoo Linux had a hard
> > > > dependency
> > > > on
> > > > dbus added.  This is because the vfs_snapper module is enabled
> > > > automagically on the existence of dbus headers with no option
> > > > to
> > > > disable it.  See: https://bugs.gentoo.org/721320 for the Gentoo
> > > > bug
> > > > where it was suggested this be reported upstream.
> > > > 
> > > > This patch adds a configure option to control the build of
> > > > snapper
> > > > similar to other vfs modules.
> > > > 
> > > > Signed-off-by: Matt Taylor <liverbugg@rinux.org>
> > > 
> > > Thanks for the patch Matt!
> > > The change looks reasonable, although I think I'd prefer to see
> > > the
> > > default be True, so that existing packagers aren't affected.
> > > 
> > > Also, if this work is contributed on behalf of your employer,
> > > you'll
> > > need to sign the DCO as described at:
> > > https://www.samba.org/samba/devel/copyright-policy.html
> > 
> > I agree.  I do not like ./configure parameters that default to
> > 'auto'
> > (and the same goes for features), because of the inverse of this,
> > that
> > the absense of a header on a build machine would mean that a
> > feature is
> > unintentionally lost.
> > 
> > The recent practice has been to have a configure option to allow a
> > distribution to disable a feature (as is desired here) but to
> > otherwise
> > give an error if the header/library is not available and point to
> > the
> > flag.
> > 
> > Andrew Bartlett
> > 
> > --
> > Andrew Bartlett                       https://samba.org/~abartlet/
> > Authentication Developer, Samba Team  https://samba.org
> > Samba Developer, Catalyst IT
> > https://catalyst.net.nz/services/samba
> > 
> > 
> > 
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




