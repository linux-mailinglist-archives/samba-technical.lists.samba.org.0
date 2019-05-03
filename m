Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49150129FC
	for <lists+samba-technical@lfdr.de>; Fri,  3 May 2019 10:44:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=ply4k/0IFyAvKjWvD03fVBKIwIeUH6WgVo4K7p5gek0=; b=2NOFHYDc9qjpb7wiJv29Sn1W+Y
	csQEVBefGVvctcaogKVILNYo8aTLWZ9QnsZgSihROv4+V7wyRuE3fF/RlDXHzxm40ydDaFqn8V9YR
	1/5DO9wpw0zEg6y4uAcEMmbt0myKaR/sB+V0/AVGh5iYJzqjpnUuZd+qrJIoavzyogPUXzDY1/eQ8
	do+3Ooe6EWvcfhDR/5OQAgfo0p59hjQgC9Rz6NcFhLHxon0AvwruIHeI2bMu14fbfWLxkqYpJPXTE
	dA0N1+oIUBOjOsMz7bqjeQUKlByTvJDV2FyruuXy+AKbMXtdaEs5yEuGoCJp7CbOHG4NWdXGnV09a
	ewQ0owiw==;
Received: from localhost ([::1]:37032 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMTn8-002DIj-RC; Fri, 03 May 2019 08:43:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:58582) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMTn4-002DIc-FJ
 for samba-technical@lists.samba.org; Fri, 03 May 2019 08:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=ply4k/0IFyAvKjWvD03fVBKIwIeUH6WgVo4K7p5gek0=; b=lMdcAeuQCuPaSM0l/XqnAwKLF6
 emyeoXRlZyS1MNd7XmCHfOKEa7WxmEbQK3TH6eKP5UAIK8Q8TfrAbJP8jmtCTXEEhdNNefbFKBW/T
 wMFURrwNrygTes6T4O0E6z8YWk8yz8oBlIjU1sGzVRcQx1fZWbcmCKRG9urGsvhknrw8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMTn2-0001lw-V2; Fri, 03 May 2019 08:43:33 +0000
Message-ID: <1556873008.2951.60.camel@samba.org>
Subject: Re: [PROPOSAL] Release ldb with Samba on the 6-montly release cycle
To: Alexander Bokovoy <ab@samba.org>
Date: Fri, 03 May 2019 20:43:28 +1200
In-Reply-To: <20190503073156.GB5460@onega.vda.li>
References: <1554694013.25595.6.camel@samba.org>
 <1554971819.4812.88.camel@samba.org>
 <3375324.H8Nz3ShdPD@magrathea.fritz.box>
 <1555011274.4812.106.camel@samba.org>
 <c06c2c6c113c64ddbd4974c8ca14355e94bd044a.camel@samba.org>
 <1556509193.25595.71.camel@samba.org>
 <b04df37b39526bedddcb95992542026836835038.camel@samba.org>
 <1556822561.2951.25.camel@samba.org> <20190503065538.GA5460@onega.vda.li>
 <1556867924.2951.44.camel@samba.org> <20190503073156.GB5460@onega.vda.li>
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
Cc: Simo <simo@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-05-03 at 10:31 +0300, Alexander Bokovoy wrote:
> On pe, 03 touko 2019, Andrew Bartlett via samba-technical wrote:
> > 
> > On Fri, 2019-05-03 at 09:55 +0300, Alexander Bokovoy wrote:
> > > 
> > >  
> > > Basically, my personal opinion is that this situation is pushing
> > > more
> > > unjustified work into hands of our downstream consumers
> > > (vendors).
> > > I'm
> > > not talking about it on behalf of my employer, it is purely my
> > > own
> > > opinion, but I can see this an additional overhead for some.
> > So, perhaps this is a useful approach.  
> > 
> > First, stop tagging ldb versions in master. 
> > 
> > Second, merge MR 374 (which leaves the ability to produce tarballs,
> > and
> > tests this in autobuild, but aligns the version numbers)
> > 
> > https://gitlab.com/samba-team/samba/merge_requests/374
> > 
> > Third, stop producing ldb tarballs in the release process.
> > 
> > I'm not convinced such downstream consumers that have the needs you
> > indicate above exist, but you suggest they do and I'm not sure we
> > have
> > a good way to tell.   So perhaps they do and are forced into such
> > burdens, then I'm sure they will ask and we will know for sure. 
> > 
> > In that case either they can either run 'make dist' themselves or
> > we
> > can, knowing they really exist.
> > 
> > How does that sound?
> I have hard time understanding how all these proposals from you
> differ.

Not very much really, MR 374 is the version number, MR 371 removes the
tarball generation.  It isn't a big change technically, but policy wise
it seems to be a whole different thing. 

> They all seems to hang around the willingness to not produce a proper
> libldb
> tarball at all. 

I'm most concerned not to produce it during master development.

> I think this is where we disagree. A version is a minor
> think in this context, at least to me.

Great, so can you review MR 374 for me?

I'm happy to leave the tarballs as being generated.  There will be a
few more because Samba tarballs come out more often than ldb has in the
past, but as everybody keeps saying, that is just a script to run
during the release.  

I got hung up on avoiding those because of a comment from metze that I
now can't find and may well have imagined. 

I hope we are in agreement now,

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba




