Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF79F883
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 14:13:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rL0sO4PHu7OA2W3FQNjxX2rm3Pa/J+ygFw3yL2mFlJ0=; b=QmHTPllOgSXj0WqjrnsIxvEsoD
	VwhEzPtthx08sKcOKCywKMLzVWBw0XMOA614eC8JhEXClFAhpDbyCksmC0qj63+VhPef37A7te0Mn
	J35u8Yv/qFDCuX0KlXrSYJppppy2T3w8CM87vZkWlPwcraaFh0uU5WpX+C0h0JbPJdGa/5e6U1x1x
	yQGqWjYh+KWDtYiBskMSFWsuCBvhSWAFlWBxD+zSkdd7If35YQNchoZ91LnuVZawT+QZAxQ/n7pce
	g1CvQi6cyLK4k+WhAm8MX0sHm5rlu9DVYtGmhQeNMjDl1PQaefhOkNT4XVj0qCWSTXqONZtBQaA7T
	QqI2hOSw==;
Received: from localhost ([::1]:42104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLRdN-003q9V-C8; Tue, 30 Apr 2019 12:13:17 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:45146) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLRdH-003q9O-NK
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 12:13:14 +0000
Received: by mail-ed1-x52d.google.com with SMTP id g57so5509244edc.12
 for <samba-technical@lists.samba.org>; Tue, 30 Apr 2019 05:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=rL0sO4PHu7OA2W3FQNjxX2rm3Pa/J+ygFw3yL2mFlJ0=;
 b=ILQDUJlkueXVJ9/xqYgu25zDEwS8vafFh/46zomEcU68+tkYInt4zm3GlfN5finZEx
 NJdTUuRWPNDW/yvIlc+/5W8xMQbrN//C+xyptvzPBNIWgyjagza7thDEwTOx3Zwrae0x
 VOLBy82GEj5XDZPh1kacbDFOWpJl8jGcwyTCZEppSW6NVJy+WQQloHlFVjvz1Z+eaUjb
 8J8J7RVKdmW3WyzQTHRki6p6qVNE0qkQmmqw0kCYX4+4/iYS67DqkgPkZoHB8RsgctN+
 48x1MOunpnTb+fy6J9v2QrDdt+0Gy6uUlBGU55sraNbrSCLXkRvxvlkAAOdSrh32+fUB
 5NIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=rL0sO4PHu7OA2W3FQNjxX2rm3Pa/J+ygFw3yL2mFlJ0=;
 b=AnPp5FUQVxsc2nN6qIqrxLFUrfC1z7mCbLZr/nXiGLPiI5CYU+hXoz9ptkYL6o5LOB
 wPnrp49vTELS/V7wxKO22sEW2nHoLsUOEuTGkjB+dJ74N2bLnZ30xbfsVVLg3Q/5aBoK
 7JDv7fYA4WGTopsqstwG9trh/Ueb4A9G5MGXEviEZUfUrp84MjiIuaLGVVKN3IEaFyI3
 0d7vZ58ZDBiDDbVDYwSBf66ZVVZKdcnfjLBoYvgjpvIJ6IzU1CYySSURXDee+80QTcXd
 j2H2Pxisx3ASGursBg+ppq0HxcDokxpZ6MuD6e4hT7FehC20Pe2KiX7cW75lxkKLpSjc
 N20Q==
X-Gm-Message-State: APjAAAWBu8Tq0biNJEI9B8mBdeyG2DQh6baS1M92kwYzlgZ/9kT2Afz2
 DZxhtYqEOsYz9sl5PA0Zeu0mW/OTfkw3KG/WlL5MOw==
X-Google-Smtp-Source: APXvYqytt8UiUx0Oa7rjlf7zMM573C+5EOI01MRjD1acKd1Vva9uAKhx1g05uiy/ciSbVtBhnRZICoAp8ZzMWcWrt5o=
X-Received: by 2002:a17:906:c7c1:: with SMTP id
 dc1mr33621899ejb.35.1556626390839; 
 Tue, 30 Apr 2019 05:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190429193555.GA28948@samba.org>
 <606612F7-D9E4-4043-BBDE-4A2C1CE0ABBB@samba.org>
 <1556598606.25595.91.camel@samba.org> <1634253.Q9F5WFE65d@magrathea.fritz.box>
 <1556611116.21278.7.camel@samba.org>
In-Reply-To: <1556611116.21278.7.camel@samba.org>
Date: Tue, 30 Apr 2019 08:12:57 -0400
Message-ID: <CAOCN9rwVF-E3x4jJytPadM2r=PTr0HFq9zjkBwK2uT3042qU+Q@mail.gmail.com>
Subject: Re: getting centos7 into bootstrap and gitlab CI
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Nico Kadel-Garcia via samba-technical <samba-technical@lists.samba.org>
Reply-To: Nico Kadel-Garcia <nkadel@gmail.com>
Cc: =?UTF-8?Q?S=C3=A9rgio_Basto?= <sergio@serjux.com>,
 Andreas Schneider <asn@samba.org>, Christof Schmitt <cs@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Apr 30, 2019 at 3:58 AM Andrew Bartlett <abartlet@samba.org> wrote:
>
> On Tue, 2019-04-30 at 08:38 +0200, Andreas Schneider via samba-
> technical wrote:
> > On Tuesday, April 30, 2019 6:30:06 AM CEST Andrew Bartlett wrote:
> > >
> > > On Tue, 2019-04-30 at 06:21 +0200, Ralph B=C3=B6hme wrote:
> > > >
> > > > >
> > > > > >
> > > > > > Also, could you please look into adding CentOS 7 as a
> > > > > > supported
> > > > > > platform via our bootstrap system so we don't regress here in
> > > > > > the
> > > > > > future?  There is partial support already, but it wasn't
> > > > > > finished
> > > > > > (mostly to avoid chasing two rabbits at once).
> > > > > That is a new area to me. I see that CentOS is listed under
> > > > > bootstrap/generated-dists/centos7/. Would the only missing
> > > > > piece be the
> > > > > centos7 entries in .gitlab-ci.yml, or am i missing something? I
> > > > > can give
> > > > > that a try tomorrow.
> > > > that would be much appreciated and I can help with that, but it's
> > > > certainly not a requirement to get your patch for the missing-
> > > > field-
> > > > initializers in. I'll review later on.
> > > Thanks Ralph for offering to help.  It has been really cool to see
> > > so
> > > many folks stepping in to maintain and extend our package list.  It
> > > is
> > > lovely to have this task, but even more so the knowlege of how to
> > > do it
> > > practically, distributed around the team!
> > >
> > > I totally agree this is not a pre-requisite, thanks for making that
> > > clear!
> > Here we go. Should be fine as GnuTLS and KRB5 are not that old as on
> > Ubuntu
> > 14.04 :-)
> >
> > https://gitlab.com/samba-team/samba/merge_requests/399
>
> I've CC'ed S=C3=A9rgio and Nico who recently had a thread about building
> modern Samba on CentOS7.  They may be able to help here.
>
> Their work is online at:
> https://github.com/sergiomb2/SambaAD
> https://github.com/nkadel/samba4repo
>
> Thanks to everyone working to show Samba master can be built and
> developed on CentOS7, much better to confirm this now than find out at
> RC4 ;-)

I'm concerned that the necessary building tools for "compat-nettle32"
and "compat-gnutls" from Sergio are not apparent in that merge
request. I found those necessary because I disabled the "experimenta"
MIT KRB options, and gnutls is not recent enough on RHEL 7. Sergio
For my work, I also have a full build structure and a set of git
submodules with all the libtdb, libtalloc, libtevent, and libldb
libraries to build up for a full deployment: sergio used the "build
the libraries internally in Samba" option.

I'm not sure how to merge the work into the existing bootstrap
procedure, since they'd also expect these other modules to be built
and available in the bootstrap and yum deployment. Do these bootstrap
environment ssupport the use of "mock" ? I've also just noted that
mock, on RHEL 7, does not support "file://$PWD" syntax for finding the
local repository that my setup drops generated RPM's in. Works great
on Fedora, not on RHEL 7 or CentOS 7. That means the build environment
needs a web-based access to the built repository, which I'm doing with
"nginx", on RHEL 7. That.... makes it more awkward for an individual
software builder to be access their local working repositories. It can
be done stably, but it needs to be really locked down for a safe build
environment.

