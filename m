Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BBBFFC7
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 20:33:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=i9CcJf4OtImuXZYBZM8Pr1setA+4amgdyqOPwRqCaBA=; b=CxLATHCapAoAP2n6kP5ERL+0wc
	GrrJhuPTmW/R86FxbH+1pVvaiY/uAEDmQPzKvnhqqen0utfT3OLwdmcRTRY5bmf4Z3ctvIYZjyTpt
	kt8hPp5kL5AyvTqRo2PGc2YjycHs2R7hKJcB0ng+N71qmoL1Z3Ye7KxyfQZKaeowBBIc46jKLj6ba
	iGgonv5HroHsllI1Dd1N2aKuqiX7nNpLVy7dQ5A4FiYQlIY4MVIXQdZ3qu7o1AfyskAWQcWaqGZPW
	ZB65VBBePaDY6nMubtmYGoF30dsNYhoddzEx34UP+uBVj2NHo8MjkRVz0ZOVqvO6IiwSGs9U/2TSD
	u6OH9mZg==;
Received: from localhost ([::1]:25298 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLXYm-0002g3-4w; Tue, 30 Apr 2019 18:32:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:25620) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLXYh-0002fv-Bg
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 18:32:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=i9CcJf4OtImuXZYBZM8Pr1setA+4amgdyqOPwRqCaBA=; b=tAumqOXdCFwp8latVF6f85iruE
 vAidpsjtkwF5rWyR7ARvo+U+TQnhQPrkHjAA9Yhf1D3apnSakKevdWQSHmZ/zv1VgOZDiHfaPTFqE
 tU2x3pcC8XyM2mt6D2s0I8MfWsOV8meQiUg4aZJPFwqyuUwfdfY7qKztNngZy0pVdjfg=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLXYf-0002md-Q2; Tue, 30 Apr 2019 18:32:50 +0000
Message-ID: <1556649164.21278.13.camel@samba.org>
Subject: Re: getting centos7 into bootstrap and gitlab CI
To: Nico Kadel-Garcia <nkadel@gmail.com>
Date: Wed, 01 May 2019 06:32:44 +1200
In-Reply-To: <CAOCN9rwVF-E3x4jJytPadM2r=PTr0HFq9zjkBwK2uT3042qU+Q@mail.gmail.com>
References: <20190429193555.GA28948@samba.org>
 <606612F7-D9E4-4043-BBDE-4A2C1CE0ABBB@samba.org>
 <1556598606.25595.91.camel@samba.org>
 <1634253.Q9F5WFE65d@magrathea.fritz.box>
 <1556611116.21278.7.camel@samba.org>
 <CAOCN9rwVF-E3x4jJytPadM2r=PTr0HFq9zjkBwK2uT3042qU+Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
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
Cc: =?ISO-8859-1?Q?S=E9rgio?= Basto <sergio@serjux.com>,
 Andreas Schneider <asn@samba.org>, Christof Schmitt <cs@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-04-30 at 08:12 -0400, Nico Kadel-Garcia wrote:
> On Tue, Apr 30, 2019 at 3:58 AM Andrew Bartlett <abartlet@samba.org>
> wrote:
> > 
> > 
> > On Tue, 2019-04-30 at 08:38 +0200, Andreas Schneider via samba-
> > technical wrote:
> > > 
> > > On Tuesday, April 30, 2019 6:30:06 AM CEST Andrew Bartlett wrote:
> > > > 
> > > > 
> > > > On Tue, 2019-04-30 at 06:21 +0200, Ralph Böhme wrote:
> > > > > 
> > > > > 
> > > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > 
> > > > > > > Also, could you please look into adding CentOS 7 as a
> > > > > > > supported
> > > > > > > platform via our bootstrap system so we don't regress
> > > > > > > here in
> > > > > > > the
> > > > > > > future?  There is partial support already, but it wasn't
> > > > > > > finished
> > > > > > > (mostly to avoid chasing two rabbits at once).
> > > > > > That is a new area to me. I see that CentOS is listed under
> > > > > > bootstrap/generated-dists/centos7/. Would the only missing
> > > > > > piece be the
> > > > > > centos7 entries in .gitlab-ci.yml, or am i missing
> > > > > > something? I
> > > > > > can give
> > > > > > that a try tomorrow.
> > > > > that would be much appreciated and I can help with that, but
> > > > > it's
> > > > > certainly not a requirement to get your patch for the
> > > > > missing-
> > > > > field-
> > > > > initializers in. I'll review later on.
> > > > Thanks Ralph for offering to help.  It has been really cool to
> > > > see
> > > > so
> > > > many folks stepping in to maintain and extend our package
> > > > list.  It
> > > > is
> > > > lovely to have this task, but even more so the knowlege of how
> > > > to
> > > > do it
> > > > practically, distributed around the team!
> > > > 
> > > > I totally agree this is not a pre-requisite, thanks for making
> > > > that
> > > > clear!
> > > Here we go. Should be fine as GnuTLS and KRB5 are not that old as
> > > on
> > > Ubuntu
> > > 14.04 :-)
> > > 
> > > https://gitlab.com/samba-team/samba/merge_requests/399
> > I've CC'ed Sérgio and Nico who recently had a thread about building
> > modern Samba on CentOS7.  They may be able to help here.
> > 
> > Their work is online at:
> > https://github.com/sergiomb2/SambaAD
> > https://github.com/nkadel/samba4repo
> > 
> > Thanks to everyone working to show Samba master can be built and
> > developed on CentOS7, much better to confirm this now than find out
> > at
> > RC4 ;-)
> I'm concerned that the necessary building tools for "compat-nettle32"
> and "compat-gnutls" from Sergio are not apparent in that merge
> request. I found those necessary because I disabled the "experimenta"
> MIT KRB options, and gnutls is not recent enough on RHEL 7. Sergio
> For my work, I also have a full build structure and a set of git
> submodules with all the libtdb, libtalloc, libtevent, and libldb
> libraries to build up for a full deployment: sergio used the "build
> the libraries internally in Samba" option.

For our testing of our git tree, the latter is what we want, building
the libraries internally. 

> I'm not sure how to merge the work into the existing bootstrap
> procedure, since they'd also expect these other modules to be built
> and available in the bootstrap and yum deployment. Do these bootstrap
> environment ssupport the use of "mock" ? I've also just noted that
> mock, on RHEL 7, does not support "file://$PWD" syntax for finding
> the
> local repository that my setup drops generated RPM's in. Works great
> on Fedora, not on RHEL 7 or CentOS 7. That means the build
> environment
> needs a web-based access to the built repository, which I'm doing
> with
> "nginx", on RHEL 7. That.... makes it more awkward for an individual
> software builder to be access their local working repositories. It
> can
> be done stably, but it needs to be really locked down for a safe
> build
> environment.

The bootstrap code generates a shell script which is run in the
Dockerfile to build the docker images.  This is stored in git in
bootstrap/generated-dists.

The contents of that file is controlled from the python scripts found
there, and are templated from data in from bootstrap/config.py.

It takes a bit to get your head around, sorry, but is very powerful
when we have so many distributions to manage.  The idea is also to be
able to publish authoritative package lists which have been tested in
links from the wiki.

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




