Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 334842D5518
	for <lists+samba-technical@lfdr.de>; Thu, 10 Dec 2020 09:03:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=/kMGG3mpJuvlSLsPSht9Kko06Qm54ow/3OcUF7H8p1k=; b=tajjYYF+Vx8ozh8lZcKqVhXUi8
	lQ9l/Yj5bg2oC+4AZCaARAXKY0mw1bChrhp1y4LsNZAmNnmkSOCg4Po8HzeRlmdEHmIL11PFqTEqE
	O2vzxEQj6HOeMttSW2ArmPVbFpO0PEOT7bMaCRFG1PUyu0zRmoo+7uGGMpW3wBT1RNKJt9SlqFDD5
	lslTitDI8bz2l5x4m3bU+tMwXj0y0oNK0DHjGsDCm/sINCmXouTNqc3c85RO0ZIlk07HzCT/i27Uu
	9we49YDWMal63zaPyX5DY1Ue8j43IuBf3h9N9V4MAsx8QBP0kl90PCj/MIpZr1etX4YbJbrq3ka2s
	ijFtFALg==;
Received: from ip6-localhost ([::1]:36460 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1knGty-000Op4-Re; Thu, 10 Dec 2020 08:02:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40994) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knGtq-000Oow-9W
 for samba-technical@lists.samba.org; Thu, 10 Dec 2020 08:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=/kMGG3mpJuvlSLsPSht9Kko06Qm54ow/3OcUF7H8p1k=; b=MEnEc+RP6tfQ3zSpDUB3z31Kaz
 WadVFOHy+XhL/DQKN9xnMWRG2/eU7wneuqetMtvfvWjdMCc8kbfp5ulbHmADtKILeA6TJTWbg0dPe
 Bk87sc57XlFz34Zi9F+znl0WKnTy53a0iwHVhLYJOIPsOivTcUoWXPnD+KcNbilQt8I/2gSDpR6M3
 BorqnabMj2QSsiS4uLYIuzrVeAyLfcXMb6haN/kSE/eF2FpdM3Xl8P4t93VYzE5FR+EF62BVVcvg+
 pToZ5FTACJsphgbDYkpDljq5ORV3PfVUJsXvw+Og9Efsbo1zYpqbi70GxQ2blSZnhcrARMjasljMw
 ef7NuWZKER6pGI/pm7DT6AjVdw4Xtpmyc5BqJ0YBXExfI/B+zUq1ejJk3jShAfy4RySztBrSdrUZg
 u1Xw/AsHVbpCUQyUU9+zUz0xccuuQLhruvCkV8eIgDSK7xKQYyIehFg3ukWixIfj91f+7fuT39fSC
 OF5FURKQ2QaRkbTaAwsgOBst;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1knGtZ-0000xD-Vs; Thu, 10 Dec 2020 08:01:50 +0000
Date: Thu, 10 Dec 2020 10:01:48 +0200
To: Martin Schwenke <martin@meltin.net>
Subject: Re: Samba testing on CentOS 8
Message-ID: <20201210080148.GG5029@pinega.vda.li>
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
 <20201209003132.328ca229@martins.ozlabs.org>
 <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
 <20201210142744.398a7e75@martins.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201210142744.398a7e75@martins.ozlabs.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 10 joulu 2020, Martin Schwenke via samba-technical wrote:
> Hi Rowland,
> 
> On Wed, 9 Dec 2020 15:42:27 +0000, Rowland penny via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
> > Hi, based on what is all over the internet about the future of Centos, 
> > should we continue to test anything on Centos 8 ? I mean, we may get to 
> > a point where we do not know whether a fault is down to Samba code or 
> > code that isn't in RHEL but is in Centos stream. Just a thought and I 
> > could be talking out of my hat.
> 
> You make sense and I agree.  When CentOS becomes a rolling testing
> stream then it will no longer be a stable platform for testing.  Amitay
> and I were discussing this yesterday and we didn't come up with a good
> answer. One reason why there is no good answer is that we want a stable
> testing environment but sometimes Samba moves faster than the stable
> distros (e.g. CentOS 7 and GNU TLS) and this might happen again,
> possibly with other distros (e.g. Debian stable).

I don't think there is a need to overreact now. As FAQ on
https://www.redhat.com/en/blog/faq-centos-stream-updates  points in Q10,
https://www.redhat.com/en/blog/faq-centos-stream-updates#Q10:

---------
In the first half of 2021, we will be introducing low- or no-cost
programs for a variety of use cases, including options for open source
projects and communities, partner ecosystems and an expansion of the use
cases of the Red Hat Enterprise Linux Developer subscription to better
serve the needs of systems administrators and partner developers. We’ll
share more details on these initiatives as they become available. For
those converting to RHEL, there is guidance available today for
converting from CentOS Linux to RHEL.
---------

I hope an improvement on the RHEL Developer subscription would allow to
run RHEL in Samba CI runs, so this would be just a retargeting.

Right now, CentOS 8 is there for about at least a year and by the time
CentOS 8 Stream is fully implemented, it is not going to be a testing
bed that changes every single day. Remember, it is the next RHEL 8.x
target, so it is not like Debian Sid or Rawhide or even Fedora branched.
There is quite less of a move there.

As I wrote on freeipa-users@ yesterday,

---------------------------
With most of RHEL development moving into a public space in C8S and
Fedora ELN, the feedback loop should get shorter. Many of the changes
were already discussed during last two years at Flock and other
conferences, ongoing work in the infrastructure and processes to support
this certainly make life of RHEL packagers 'interesting' but the end
result is an increase of a attention to details and a lot more stability
to the 'pre-release' composes.

I can only talk about FreeIPA and few other projects I am involved with.
For example, we are getting incredible feedback from both Rawhide and
RHEL 8.x QA processes for FreeIPA 4.9.0 release candidates. The packages
are not yet in RHEL 8.x development composes as we do fixes to issues
found through the QA pre-verification work. Once overall state of the
release candidate is at the level RHEL IdM QA team accepts, those
packages will get to RHEL composes and eventually land in C8S (once the
infra is ready). Once C8S is there in full capacity and running upstream
CI tests on it would become a reality, we'll see even more shortening of
that feedback loop length.
--------------------------

The same, I think, stands for Samba, though Samba will most likely get
more win from the additional availability of stable RHEL releases for CI
use.


> However, right now I have limited time available to make changes to our
> testing environment.  So my pre-Xmas goal is to open a bug, "fix" the
> CentOS 8 bootstrap script, backport the fix to 4.12/4.13 and have a
> working test environment again.
> 
> Hopefully in the new year I'll find time to update autocluster to use
> something else as a test environment.  Part of this is probably to add
> support for the Debian family of distros.  At least then we will have
> flexibility if things change.
 


-- 
/ Alexander Bokovoy

