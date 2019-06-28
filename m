Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4423B5A5E6
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jun 2019 22:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=vfWUEsctlBsqQOIERbgHsw3U54U6QgLGlqbspatugVU=; b=gPwH/nwPNxzuV91C32UUcR/Xte
	M+hESosnbJBX1+9Tkkh9irIOaaqDBYqnv7O4FhpAwt72xVjgJK0/th9wgH35z/BpYkzDtPhWrgTpW
	2+NHlmRyz/6YqqZHi2W+ShTg0DvuoSoePxNJHrMSHM2OYXT5YWIn5mlXJdnh4hzK5kDRWbqvBCpHz
	tlPiP9+QagjzKwW0Oomd0kHeconZqBN2hp8kF6JpAxJDOJsObPb4myUC0+pDJ+FvpCmradUVEvz+c
	gcGYYStE6io3zkPDYc8P1CGr18lBvdIwfF9jGLg9QQLup+y/NqPAVJ3MQ/MyqdjJ6yrgT3dzpRKrv
	56mwpzlA==;
Received: from localhost ([::1]:18992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgxVC-002P0b-RM; Fri, 28 Jun 2019 20:29:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57214) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgxV5-002P0U-JT
 for samba-technical@lists.samba.org; Fri, 28 Jun 2019 20:29:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=vfWUEsctlBsqQOIERbgHsw3U54U6QgLGlqbspatugVU=; b=Vd3faSWTjLvQIlRdxF5oGGW+lY
 pf9s97wvgHLioCivMWapNeUBZf1oCkygukJHIr+Gmg8uhr60jaiImcvNqOAwk8nkncelY9qE9kLYV
 iQ6A7PLuQ7GM3osHZILxtZJ+wLdUoXuit5qigNxZF5I1WuOsKlyR8kN9U0nWI+A1jCVI=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgxUs-0005w7-QH; Fri, 28 Jun 2019 20:29:27 +0000
Message-ID: <2bf77950a3762982c3f8b2666f906656a1a64e42.camel@samba.org>
Subject: An even better GitLab CI (was: Re: Document GitLab as the only way
 to contribute to Samba?)
To: Michael Adam <obnox@samba.org>, Uri Simchoni <uri@samba.org>
Date: Sat, 29 Jun 2019 08:29:22 +1200
In-Reply-To: <20190628124010.GC5892@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190628104624.GF32415@samba.org>
 <62bc808700dca7a08f3a61c6d7e676119c301843.camel@samba.org>
 <20190628114651.GB5892@samba.org>
 <d2f00126-4507-23de-df51-d41ee28b639a@samba.org>
 <20190628124010.GC5892@samba.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-06-28 at 14:40 +0200, Michael Adam wrote:
> On 2019-06-28 at 15:08 +0300, Uri Simchoni via samba-technical wrote:
> > On 6/28/19 2:46 PM, Michael Adam via samba-technical wrote:
> > > Ugh. That's really strange. Is this a gitlab design choice?
> > > Because if it is, it's finally a thing (and quite a major one),
> > > where gitlab is way worse than github. ;-)
> > > 
> > 
> > To be fair, I don't know if GitHub even has CI. What I've seen in  FLOSS
> > projects is that they have their Jenkins/Travis instance or something of
> > that sort (and who knows how many runners), and each PR would trigger a
> > run there, and success/failure would annotate the PR. GitHub just
> > provides the webhook.
> 
> That is true. CI is always external.
> But you typically configure the repo to require those CIs passing
> for a PR to become merge-able.
> 
> > I do agree with the bottom line though...
> 
> And don't get me wrong: I'm not advocating for github here.
> I was just comparing with something I know better.
> And if we could somehow tie the beefier CI with the core repo
> and run it on every MR, that would be great.
> But I probably need to read up on gitlab and it's ci etc.

When we used Travis CI on GitHub we did the same thing, except we never
had the full set of tests, it was always a cut down set.

It started as just a compile and very few tests, but enough to catch
the typical python whitespace errors and mixups between docs and
loadparm.  Just before we killed it we got it similar to the 'shared'
set on GitLab (I had to tweak it hard to get the run under an hour
total). 

I'm also kind of glad the CI is attached to the repo in one sense only:
The private runners are (after credits) at the Samba Team's cost. 
Abuse of free CI runners is a real thing, and so I'm more comfortable
with the risk when we can manually vet/ban users.

The fix is to:
 - Reduce the time spent in each job by:
  - use the pipeline feature in GitLab more to split the compile into a
different job
  - passing the compiled output (or primed ccache cache) to the 'test'
runners.  

 - Remove the dependency on an ext4 file system in our SMB tests or
find a way to get to ext4 on the shared runners (and not unionfs)

 - Reduce further the resource use of our tests
  - shut down smbd/samba processes when we are done with them in
selftest.pl
  - optimise the memory use of smbd/samba even more

All very much practical tasks, we just need help.  I'm always available
to consult, but I can't take on this much myself.  It would suit a
(new?) enthusiastic developer who is keen to make a mark and is willing
to streach the boundaries and try the 'impossible' to prove it isn't
really.

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



