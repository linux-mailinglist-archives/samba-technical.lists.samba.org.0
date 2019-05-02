Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207E11FD6
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2019 18:13:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=VuM0c/hbgvi1y3rlHKYVnjQnv4Da8SPRt1yYOsd9b4M=; b=f3cBLXX9bGkKncquATBRtLMuvL
	lnDmoNSpRqglri17ZaB/3bL+V48w/vVF/m/y4qJFePBWJmrG/CIqBO3oDU+g/kvgGLi/1CZ9SVvmW
	ALqSflvuu710sfKUYmQ0BCVcmSx1kQ5T/ksfgwBo6MYOOv8DT6dgpo+7Bvn35y44BXe4BdlRAfgf2
	Kf6rbiYZCzjfjhheMRyjUaNYxkklPvUfK3GiQbDh9z5pyMSnxxzmwT48XFkWz6getIJSMUHs+kFgi
	5fcTD5Yxsglmvm0SJYRMwkxDs4xkoX8vyL4FefA6FxnAfmJC0qInMLjdork3oncQPuH6zwQSvgP09
	iRoUQu+w==;
Received: from localhost ([::1]:35228 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hMEL1-0025jy-0N; Thu, 02 May 2019 16:13:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:45200) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hMEKw-0025jr-DW
 for samba-technical@lists.samba.org; Thu, 02 May 2019 16:13:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=VuM0c/hbgvi1y3rlHKYVnjQnv4Da8SPRt1yYOsd9b4M=; b=cMty0cC4HvddzAlNanDLHXhEq1
 Jgd39rBhyjn/4FUGBtou1jsrHMGFHH7GehWOv5lSjHAKuzSk4xFO2DL705XvDdNlKO2OafykunXP4
 6B0VaoXBKORSgpnlFR8a+tmRd5C6EXZ2RjMVxuJbLn9XVGqYi/CVVT2TXeKeZQUE8jmE=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hMEKv-00038V-Cd; Thu, 02 May 2019 16:13:29 +0000
Message-ID: <b04df37b39526bedddcb95992542026836835038.camel@samba.org>
Subject: Re: [PROPOSAL] Release ldb with Samba on the 6-montly release cycle
To: Andrew Bartlett <abartlet@samba.org>, Andreas Schneider <asn@samba.org>,
 samba-technical@lists.samba.org
Date: Thu, 02 May 2019 12:13:27 -0400
In-Reply-To: <1556509193.25595.71.camel@samba.org>
References: <1554694013.25595.6.camel@samba.org>
 <1554971819.4812.88.camel@samba.org>
 <3375324.H8Nz3ShdPD@magrathea.fritz.box>
 <1555011274.4812.106.camel@samba.org>
 <c06c2c6c113c64ddbd4974c8ca14355e94bd044a.camel@samba.org>
 <1556509193.25595.71.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Simo via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo <simo@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2019-04-29 at 15:39 +1200, Andrew Bartlett wrote:
> On Sat, 2019-04-13 at 16:35 -0400, Simo wrote:
> > On Fri, 2019-04-12 at 07:34 +1200, Andrew Bartlett via samba-technical
> > wrote:
> > > On Thu, 2019-04-11 at 15:27 +0200, Andreas Schneider via samba-
> > > technical wrote:
> > > > On Thursday, April 11, 2019 10:36:59 AM CEST Andrew Bartlett via
> > > > samba-
> > > > technical wrote:
> > > > > Looping back to the top of this thread to put a reduced proposal.
> > > > > 
> > > > > I've posted a new merge request here:
> > > > > https://gitlab.com/samba-team/samba/merge_requests/374
> > > > > 
> > > > > The scope is reduced to aligning the ldb version with the main
> > > > > Samba
> > > > > version, so ldb would share the Samba release cycle.  There is no
> > > > > merge
> > > > > with the main Samba build, just a change to the version number
> > > > > calculations (and so release process). 
> > > > > 
> > > > > The primary motivation here is to decouple ABI changes (eg adding a
> > > > > new
> > > > > function) from release points, and so slowing down to a 6-month
> > > > > release
> > > > > cycle matching the main release cadence of Samba so that new
> > > > > features
> > > > > have time to bake in master before they are released.
> > > > 
> > > > Yes, I absolutely agree that SO_VERSION number should be decoupled
> > > > from 
> > > > release version numbers. This should also be done for the other
> > > > libraries.
> > > > 
> > > > 
> > > > If I understand you correctly there will be a libldb release:
> > > > 
> > > > libldb-4.11 and then libldb-4.12
> > > > 
> > > > 
> > > > Samba 4.11.1 and 4.11.2 will depend on libldb-4.11.
> > > 
> > > The current WIP patch has the main Samba version string directly used
> > > for ldb, therefore allowing ldb to change during a release stream (eg
> > > for a security release).
> > > 
> > > Please look carefully at the MR for the details, I would certainly not
> > > wish any more miscommunication!  
> > > 
> > > > If I understood it correctly than this sounds like a good idea! :-)
> > > 
> > > Great!  I was sure we could find some common ground.
> > > 
> > > So from here we just need to know if this (eg) libldb-4.11 needs a
> > > distinct tarball to be generated by the release team.  
> > > 
> > > Now that we are clear on what is being talked about, I have also re-
> > > opened this:
> > > 
> > >  https://gitlab.com/samba-team/samba/merge_requests/371
> > > 
> > > If we decide not to burden the release team with a distinct tarball,
> > > then distributors building ldb would just need to use the main samba
> > > tarball and add a 'cd lib/ldb' to their build scripts. 
> > > 
> > > Finally, this is all just WIP proposals, other variations on this
> > > approach are most welcome.  But if you do agree with any of the above
> > > please mark that on the relevant MR so I can keep track.
> > > 
> > > Thank you very much for your thoughtful consideration of the above,
> > 
> > Creating a separate tarball should be an automatic process that takes
> > no manual work, and will make life easier for people that just want to
> > build *and* distribute ldb and nothing else.
> 
> Are you otherwise OK with the MR?
> 
> On the tarball question, is 'cd lib/ldb' in the ldb rpm build scripts
> (and a larger tarball size) a particular engineering problem?

No, neither is cd lib; tar cf ldb-x.y.z.tar ldb/

>   I've
> tested and the independent ldb build works from the Samba tarball. Can
> you spell out your specific concerns here a bit more?

If you are distributing ldb source (for example because they have to
given our license requires it) as a dependency you want to do just
that, of course people can make the tarball themselves but then you
risk having messy, unofficial tarballs around. 

> It is just a pile of shell-scripting I would rather avoid tackling in
> script/release.sh if I don't really need to.
> 
> Given the strength of the push-back I feel like there is something I'm
> missing here, because while I had more radical ideas in my initial
> writeup I've taken feedback and looked at the minimal practical change
> which shouldn't badly break anyone but will make ldb development a
> little more smooth. 

I honestly do not know what this changes in ldb development, but
releasing a tarball surely won't make it harder.

> I don't propose to remove the ldb build system.  It also wasn't ever
> proposed to remove the ABI checks or any of the public libraries.
> 
> Is the real concern here that ldb would loose one of the final elements
> of it's 'independence' from Samba?

It *is* used independently of Samba, so yeah it would be a sort of a
backwards move to have people need go and do a bunch of unpacking and
repacking by themselves each differently.

This is also useful in CI systems for example, to reduce the amount of
space and build time, etc...

>   It is sad that the goal, that sub-
> elements of samba would encourage new developers to work on contained
> subsystems never really worked out.

You should qualify this statement, what were the goals?

As far as I can tell they are used independently so it worked.
Sure we didn't get *tons* of development back, but we definitely got
lots of testing and bugfixes (although that may have not been evident
to you).

>   But ldb has been an incredible
> success!  Being the absolute core of the AD DC, with scale and utility
> totally unimaginable to all of us involved in the early days, it has
> the attention of a much larger team and far more testing then ever seen
> before!
> 
> Thanks,
> 
> Andrew Bartlett
> 


