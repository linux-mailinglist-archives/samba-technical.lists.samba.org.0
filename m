Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7ACF29EA
	for <lists+samba-technical@lfdr.de>; Thu,  7 Nov 2019 09:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/7Tvl3XJYktxqvHPTiwCBXE3ENEWOSseLVPkt8Kgzwc=; b=Tx+oBal9qeTy7tp/N/WeUIIYzl
	J2QuIYNji9Fj3oQxjOmPb63dXm5c/RI7Xlp9wfYxZnQ64nkpUNXhlYQItMkiNLgnulY/xnvWsFDKm
	bTOdeNufh0F/4qEKBjokRoHWgshQhXu4s+ThYdL508IpyZexEcWZPh/6DNsWvOAJ7PZd5QLCqjUky
	X/2HguU/Jak6HPerjt2LBncSNgCwUgyqsraMKP1TmxohDIYPzdzlg9qhkUh1JeHCcHheIlaJZM16+
	RPh9QNG+v775jjQ4rT4aJcg0ABcwmnVxyh+hMxe2oRuApKgK/0TpqClfjziiA6snaWF4Oxb73T/zn
	sAfcWgEQ==;
Received: from localhost ([::1]:30954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iSda2-007GOi-Ev; Thu, 07 Nov 2019 08:55:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55598) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iSdZx-007GOS-Ox
 for samba-technical@lists.samba.org; Thu, 07 Nov 2019 08:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/7Tvl3XJYktxqvHPTiwCBXE3ENEWOSseLVPkt8Kgzwc=; b=A7o/EHDBtI2DoFoNeoKeTKlN83
 zhauAVo4snz690UCAKw11d0Y3ToQVmlcKvdKxHJnL512Zvmp+W5zQEd0tC4VvKloqzyaPY5NcCw/G
 r4B8HF8jLrh+pzXh+eFaVwFf87nZo8/hH96JWSSpOVr/Yo/HPocM07xw+0mh/zFEFbomXcCMSRXBb
 BfEQgZSTVGuQ5sEfIHYeNOW7nP+mHVLozYBq7an15/M7qwfnP+lAMBEy+OzpvTyNCAkl4XgDoNjae
 cA3x8TGeryUu075Lkw4NId9cqw/pGUf174o50cjy749DrAJ/9wbOMt9OgGwxyFEXiiHSpHboWXAYZ
 QF6wQB5NnaTjxDjmdRwa57wUnWlPMYnvKTw++aM9E1Oqkta4Ab/+22QE6OK6yXTPDDNmWRv9F4B55
 8m3ivJIopqMKNcyrQPkGRcFMyT2Xf4PBbVFefMIp4EQabZKZOsPGrm2kbmaDT4L5qOXg3UEgzxlb8
 aPIvN6sKbKz5Hz4xavnEZBDd;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iSdZv-0006pH-SN; Thu, 07 Nov 2019 08:55:44 +0000
To: Christof Schmitt <cs@samba.org>
Subject: Re: bootstrap: Fix centos7 image creation
Date: Thu, 07 Nov 2019 09:55:43 +0100
Message-ID: <24991601.T20UtDr9EF@magrathea>
In-Reply-To: <20191106234619.GA21747@samba.org>
References: <20191106133603.2F5431404C0@sn.samba.org>
 <343cb710c4bb9936e0d6c75f82c81ab0f3d35bf9.camel@samba.org>
 <20191106234619.GA21747@samba.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 7 November 2019 00:46:19 CET Christof Schmitt wrote:
> On Thu, Nov 07, 2019 at 06:34:38AM +1300, Andrew Bartlett wrote:
> > On Wed, 2019-11-06 at 14:36 +0100, Andreas Schneider wrote:
> > > The branch, master has been updated
> > > 
> > >        via  35bb734d638 bootstrap: Fix centos7 image creation
> > >        via  6a3b19fb170 bootstrap: Add Fedora 31
> > >        via  1ba0a32e707 bootstrap: Remove Fedora 28 which is already EOL
> > >       
> > >       from  bf99f820778 ctdb-tests: Make process exists test more
> > >       resilient
> > > 
> > > https://git.samba.org/?p=samba.git;a=shortlog;h=master
> > > 
> > > 
> > > - Log -----------------------------------------------------------------
> > > commit 35bb734d638e273f2fd1a19220db5f200d3e7489
> > > Author: Andreas Schneider <asn@samba.org>
> > > Date:   Wed Nov 6 08:43:05 2019 +0100
> > > 
> > >     bootstrap: Fix centos7 image creation
> > >     
> > >     Signed-off-by: Andreas Schneider <asn@samba.org>
> > >     Reviewed-by: Alexander Bokovoy <ab@samba.org>
> > >     
> > >     Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
> > >     Autobuild-Date(master): Wed Nov  6 13:35:17 UTC 2019 on sn-devel-184
> > 
> > G'Day Andreas,
> > 
> > I actually think we should remove nettle entirely, it is incorrectly
> > listed as a dependency.  It came about due to some work we did for the
> > encrypted passwords support (which metze then changed to use our
> > internal AES, now removed in favour of pure GnuTLS).
> > 
> > I picked this this when Christof proposed the same patch here:
> > https://gitlab.com/samba-team/samba/merge_requests/875#note_239077036
> > 
> > He was able to successfully drop the nettle dep.
> > 
> > Sadly he had trouble with the ktest environment I also asked him to add
> > so it hasn't merged yet.
> 
> Yes, i can confirm that nettle-dev can be removed, as it will be pulled
> in as a gnutls dependency. I just got distracted by customer work and
> still need to debug the ktest issue.

I'm fine with removing it, I've just wanted to fix CentOS7 quickly.

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



