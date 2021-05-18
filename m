Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C2D386EA8
	for <lists+samba-technical@lfdr.de>; Tue, 18 May 2021 03:02:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=anKijYGCxRdJ8ZxO7zEgX0ZwSflaBcUVfc6BLksrevY=; b=1nlwUM3qdpIno9SeLhdffwigwU
	WhxHJVZdtFqm6tQ1TYNG8h24yzNkLc/8TmN+ocH6nip2ECnCtlIo5Gynpf7DQZrTaxz8uXVNsNNnJ
	TxW8WksJSNyUOz6OLJz0UpOapEvQ+LUgwaHHapwwZFUfhfrS93aSJxy8AHnFktj7zKyxKYjZxZTLz
	hlXu49C7axQ4CJFPcpEUl7Atix5lqPIZwvnFHnHRK84ZRdWNPAQrhzlEKwYp/iW3JkNd4DmMyBnJA
	Pt/NKMM8YzNXIEzLstQhCYKrU9f1vEAge4S64D/VU4dxoOqbsB+aJ7D4g9BW5zMGJXVv2J1Mw98yY
	eAX1r+FA==;
Received: from ip6-localhost ([::1]:44048 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lio6p-0015UI-PT; Tue, 18 May 2021 01:01:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13892) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lio6i-0015U8-O3
 for samba-technical@lists.samba.org; Tue, 18 May 2021 01:01:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=anKijYGCxRdJ8ZxO7zEgX0ZwSflaBcUVfc6BLksrevY=; b=G/z2NZsbzcUDu/kl4JBrE/mzfu
 HBhgFDq8uwhRzbpGYufgf0UC8yfzW/ZkjnUtobd3Do8xRT4bK6QvzqAP+0c/L1fNRffPU7F96aVG0
 JpZtsBSIUx9iUIP9UqgTNuC6xvsdHalJnii0anzzOAtoykG5IMuyPO60S9k3dFuhAWUCnE34HA+gR
 f2xHmD2UJZHEg8JpmlIYdz9t/hfwffCk4kyhXRA9OIl3c26SkfltXSXxa8ccOS+tdlH3zmhMTWVsr
 FGNTPyY9ClGjLKm806y742uEGoPW3iKyIl2ZI0zMnfUuRar3DOjex8j82wfE/xm/LjlNyBKdcGYOv
 TGU2XAzUt3tI+yXV85WtRLMryzd7q1chqrRbDhA4eW5GaQgq+e0eZdpnyEQr+de0vw8bAZl46JejU
 SV9tKWtYZbVawLC4YzVQwRkAJKPfcME89+6jq9C0BZH/OYAHQsIL1d7mvTMcq2dEEMyctsKhHj2P4
 LMr9mhqH7q953PII/La6ATSw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lio6g-0001Yj-Mj; Tue, 18 May 2021 01:01:11 +0000
Message-ID: <c91785ea2d0b29ed00d6bbdb4b76a1d59849a5ee.camel@samba.org>
Subject: Re: Offline logon flapping in autobuild?
To: Jeremy Allison <jra@samba.org>
Date: Tue, 18 May 2021 13:01:05 +1200
In-Reply-To: <20210517191909.GB1795539@jeremy-acer>
References: <516bd798642997a15016d81f9ae6e17e9250f677.camel@samba.org>
 <1949061.8nGXxLBRy0@magrathea>
 <97407ae87bceb340ed01e5a60f0417810d8ec3f6.camel@samba.org>
 <20210517191909.GB1795539@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
Cc: Andreas Schneider <asn@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-05-17 at 12:19 -0700, Jeremy Allison wrote:
> On Tue, May 18, 2021 at 07:01:14AM +1200, Andrew Bartlett via samba-
> technical wrote:
> > On Mon, 2021-05-17 at 10:38 +0200, Andreas Schneider wrote:
> > > On Thursday, 13 May 2021 10:17:48 CEST Andrew Bartlett wrote:
> > > > My most recent autobuild, with (I hope) unrelated changes,
> > > > fails
> > > > with:
> > > > 
> > > > [141(1068)/143 at 6m5s]
> > > > samba.blackbox.offline_logon(ad_member_offline_logon)
> > > > ERROR:
> > > > Testsuite[samba.blackbox.offline_logon(ad_member_offline_logon)
> > > > ]
> > > > REASON: unable to set up environment ad_member_offline_logon -
> > > > exiting
> > > > could not obtain winbind interface details:
> > > > WBC_ERR_WINBIND_NOT_AVAILABLE
> > > > could not obtain winbind domain name!
> > > > failed to call wbcPingDc: WBC_ERR_WINBIND_NOT_AVAILABLE
> > 
> > I got the same failure again re-pushing today.
> > 
> > > It doesn't really have to do something with the offline logon.
> > > winbindd did
> > > not start and was failing, the error why it didn't start would be
> > > the
> > > interesing one. However for this we need the logs
> > 
> > I tried a --nocleanup build on sn-devel-184 for samba-admem-mit but
> > this passed this time, so I'm trying another with all the jobs.
> > 
> > Hopefully I'll get some information.
> > 
> > Is anyone else having trouble?
> 
> Nope, all my recent gitlab-ci's and autobuilds have gone
> through without incident. Sorry you're having trouble,
> hopefully we can get this tracked down soon.

I just had another fail, ironically trying to push Andreas' command
line changes.

Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






