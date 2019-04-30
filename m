Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 933A3F1B2
	for <lists+samba-technical@lfdr.de>; Tue, 30 Apr 2019 09:59:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=fcEVZ4UX2dgsGX+JhjmkzBjkH12wmYptbeEGJ7oAPZs=; b=lI0Ht7w5bSno18NjxTSE0jBUwR
	I6l0iRAI2MOAnDEjVPbH9NmSl/WSeAfdCfYKBGgVDMPfiKOoRweQ1gTgSX7ZmQ63uaeqkdiRE/8Ep
	5L5nPvlxUgseDDgqqPT1WsgwcvSpUGIuF6dMxrYDJljjd2LUR5U7ut6UroanT5m4TEP173tVZK6Q8
	anCz5wP5H1Ytp9b+xtkKrfCA/S4fV56LL+zOWEsR1IcfsFSDpRBASGg5FXcKz0n+uBQ8Q4GBQb6kp
	DzQZMckko+Ty2Yii6sb0y0jFQdQpWS6ADcPLbkKkZWYPi9VQSATsAztO8rde3xAcYVFVYVLANHNCX
	2/LDOdEA==;
Received: from localhost ([::1]:30796 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hLNf8-003oNT-8F; Tue, 30 Apr 2019 07:58:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:37840) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLNf4-003oNM-6K
 for samba-technical@lists.samba.org; Tue, 30 Apr 2019 07:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=fcEVZ4UX2dgsGX+JhjmkzBjkH12wmYptbeEGJ7oAPZs=; b=Mw4m30d/7CJK8HeTsW8C3kpmbp
 KKeSpRMCwXljNtEYJGyrmM3wpuSyhwrpihca+DaYtzF0pcdjQTj9T49LOBCDO7ad3PjM50uFyAyzv
 Hj2OSX5EqT++hKUBI6F0+5tmxq2gvYcscE7ac1B/oQyZiARON7tdrN/UBLjt6modRDqw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hLNf0-0007pB-W4; Tue, 30 Apr 2019 07:58:43 +0000
Message-ID: <1556611116.21278.7.camel@samba.org>
Subject: Re: getting centos7 into bootstrap and gitlab CI
To: Andreas Schneider <asn@samba.org>
Date: Tue, 30 Apr 2019 19:58:36 +1200
In-Reply-To: <1634253.Q9F5WFE65d@magrathea.fritz.box>
References: <20190429193555.GA28948@samba.org>
 <606612F7-D9E4-4043-BBDE-4A2C1CE0ABBB@samba.org>
 <1556598606.25595.91.camel@samba.org>
 <1634253.Q9F5WFE65d@magrathea.fritz.box>
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
 Christof Schmitt <cs@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2019-04-30 at 08:38 +0200, Andreas Schneider via samba-
technical wrote:
> On Tuesday, April 30, 2019 6:30:06 AM CEST Andrew Bartlett wrote:
> > 
> > On Tue, 2019-04-30 at 06:21 +0200, Ralph Böhme wrote:
> > > 
> > > > 
> > > > > 
> > > > > Also, could you please look into adding CentOS 7 as a
> > > > > supported
> > > > > platform via our bootstrap system so we don't regress here in
> > > > > the
> > > > > future?  There is partial support already, but it wasn't
> > > > > finished
> > > > > (mostly to avoid chasing two rabbits at once).
> > > > That is a new area to me. I see that CentOS is listed under
> > > > bootstrap/generated-dists/centos7/. Would the only missing
> > > > piece be the
> > > > centos7 entries in .gitlab-ci.yml, or am i missing something? I
> > > > can give
> > > > that a try tomorrow.
> > > that would be much appreciated and I can help with that, but it's
> > > certainly not a requirement to get your patch for the missing-
> > > field-
> > > initializers in. I'll review later on.
> > Thanks Ralph for offering to help.  It has been really cool to see
> > so
> > many folks stepping in to maintain and extend our package list.  It
> > is
> > lovely to have this task, but even more so the knowlege of how to
> > do it
> > practically, distributed around the team!
> > 
> > I totally agree this is not a pre-requisite, thanks for making that
> > clear!
> Here we go. Should be fine as GnuTLS and KRB5 are not that old as on
> Ubuntu 
> 14.04 :-)
> 
> https://gitlab.com/samba-team/samba/merge_requests/399

I've CC'ed Sérgio and Nico who recently had a thread about building
modern Samba on CentOS7.  They may be able to help here.

Their work is online at:
https://github.com/sergiomb2/SambaAD
https://github.com/nkadel/samba4repo

Thanks to everyone working to show Samba master can be built and
developed on CentOS7, much better to confirm this now than find out at
RC4 ;-)

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




