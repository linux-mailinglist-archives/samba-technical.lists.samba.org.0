Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 558B4DAD7
	for <lists+samba-technical@lfdr.de>; Mon, 29 Apr 2019 05:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=WJ9pJ78HmZa0R87jy8T4ZbvWwtDWKcgaYdpnDPLM9TM=; b=eRxY0CeEDCFtor0Bg+RcYAC3Ma
	4RPX+yoWStmDz3B+xoMDESFd62jizH4wwrTMDIBb9iXZ7G+ToeRyJLwseqjtbaJkgrN9wYyZ8i5GA
	uqnbd2z0yDA8eoJK7xk0gRFy2trGVr5lfT/4M7qoaC/i9IhF1NNTxNsDSas/qi/BAIEKeO1EtThFb
	zNXtbqoJ7MeMxr+ZhIeKVu0OUqlcEgDEYKjSVrvHt6792MepjpLHlrdN61w0bdsAOVHrvilUCt0Y0
	A2MTYnMzPW4wZFJdbtD9q+AIXOb2gHyLkKOydDTaC7btqTd7TiKMaLI7f702eEVyj5GAjPrEZXY1V
	4lrfjPGA==;
Received: from localhost ([::1]:26732 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hKx9D-003DGP-Nn; Mon, 29 Apr 2019 03:40:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:32656) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hKx97-003DGI-K5
 for samba-technical@lists.samba.org; Mon, 29 Apr 2019 03:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=WJ9pJ78HmZa0R87jy8T4ZbvWwtDWKcgaYdpnDPLM9TM=; b=m7aRNyp9MyRuYdlFxJ1cpiZ45F
 d8Cv6WryYJlofbhfdRjD+W4NIlemlhU1nQObBdO5BirfETN/7qYZkJjmKmIDu5auhmOBzij+diPY0
 Q3FDqP4izJXFI0ZFsCHeP1uyO7BxzSHf2eyz4I3AUGRFjok283ua0v3+TJ8hloyAOouM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hKx93-0005wP-Aa; Mon, 29 Apr 2019 03:39:57 +0000
Message-ID: <1556509193.25595.71.camel@samba.org>
Subject: Re: [PROPOSAL] Release ldb with Samba on the 6-montly release cycle
To: Simo <simo@samba.org>, Andreas Schneider <asn@samba.org>, 
 samba-technical@lists.samba.org
Date: Mon, 29 Apr 2019 15:39:53 +1200
In-Reply-To: <c06c2c6c113c64ddbd4974c8ca14355e94bd044a.camel@samba.org>
References: <1554694013.25595.6.camel@samba.org>
 <1554971819.4812.88.camel@samba.org>
 <3375324.H8Nz3ShdPD@magrathea.fritz.box>
 <1555011274.4812.106.camel@samba.org>
 <c06c2c6c113c64ddbd4974c8ca14355e94bd044a.camel@samba.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u1 
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, 2019-04-13 at 16:35 -0400, Simo wrote:
> On Fri, 2019-04-12 at 07:34 +1200, Andrew Bartlett via samba-technical
> wrote:
> > On Thu, 2019-04-11 at 15:27 +0200, Andreas Schneider via samba-
> > technical wrote:
> > > On Thursday, April 11, 2019 10:36:59 AM CEST Andrew Bartlett via
> > > samba-
> > > technical wrote:
> > > > Looping back to the top of this thread to put a reduced proposal.
> > > > 
> > > > I've posted a new merge request here:
> > > > https://gitlab.com/samba-team/samba/merge_requests/374
> > > > 
> > > > The scope is reduced to aligning the ldb version with the main
> > > > Samba
> > > > version, so ldb would share the Samba release cycle.  There is no
> > > > merge
> > > > with the main Samba build, just a change to the version number
> > > > calculations (and so release process). 
> > > > 
> > > > The primary motivation here is to decouple ABI changes (eg adding a
> > > > new
> > > > function) from release points, and so slowing down to a 6-month
> > > > release
> > > > cycle matching the main release cadence of Samba so that new
> > > > features
> > > > have time to bake in master before they are released.
> > > 
> > > Yes, I absolutely agree that SO_VERSION number should be decoupled
> > > from 
> > > release version numbers. This should also be done for the other
> > > libraries.
> > > 
> > > 
> > > If I understand you correctly there will be a libldb release:
> > > 
> > > libldb-4.11 and then libldb-4.12
> > > 
> > > 
> > > Samba 4.11.1 and 4.11.2 will depend on libldb-4.11.
> > 
> > The current WIP patch has the main Samba version string directly used
> > for ldb, therefore allowing ldb to change during a release stream (eg
> > for a security release).
> > 
> > Please look carefully at the MR for the details, I would certainly not
> > wish any more miscommunication!  
> > 
> > > If I understood it correctly than this sounds like a good idea! :-)
> > 
> > Great!  I was sure we could find some common ground.
> > 
> > So from here we just need to know if this (eg) libldb-4.11 needs a
> > distinct tarball to be generated by the release team.  
> > 
> > Now that we are clear on what is being talked about, I have also re-
> > opened this:
> > 
> >  https://gitlab.com/samba-team/samba/merge_requests/371
> > 
> > If we decide not to burden the release team with a distinct tarball,
> > then distributors building ldb would just need to use the main samba
> > tarball and add a 'cd lib/ldb' to their build scripts. 
> > 
> > Finally, this is all just WIP proposals, other variations on this
> > approach are most welcome.  But if you do agree with any of the above
> > please mark that on the relevant MR so I can keep track.
> > 
> > Thank you very much for your thoughtful consideration of the above,
> 
> Creating a separate tarball should be an automatic process that takes
> no manual work, and will make life easier for people that just want to
> build *and* distribute ldb and nothing else.

Are you otherwise OK with the MR?

On the tarball question, is 'cd lib/ldb' in the ldb rpm build scripts
(and a larger tarball size) a particular engineering problem?  I've
tested and the independent ldb build works from the Samba tarball. Can
you spell out your specific concerns here a bit more?

It is just a pile of shell-scripting I would rather avoid tackling in
script/release.sh if I don't really need to.

Given the strength of the push-back I feel like there is something I'm
missing here, because while I had more radical ideas in my initial
writeup I've taken feedback and looked at the minimal practical change
which shouldn't badly break anyone but will make ldb development a
little more smooth. 

I don't propose to remove the ldb build system.  It also wasn't ever
proposed to remove the ABI checks or any of the public libraries.

Is the real concern here that ldb would loose one of the final elements
of it's 'independence' from Samba?  It is sad that the goal, that sub-
elements of samba would encourage new developers to work on contained
subsystems never really worked out.  But ldb has been an incredible
success!  Being the absolute core of the AD DC, with scale and utility
totally unimaginable to all of us involved in the early days, it has
the attention of a much larger team and far more testing then ever seen
before!

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





