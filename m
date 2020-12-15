Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB7E2DA7AF
	for <lists+samba-technical@lfdr.de>; Tue, 15 Dec 2020 06:28:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=cDFFy9deo570SAl4jJe5S1pRDW0bUjRsJki8AZWUUNo=; b=0af5WKRDpZeeA/J0y0DlVMs8OJ
	IxM4GN8h2R/cccfO7ItqT8ViagRHJ8i37JzpTDTYW1Ul8zhSf9/tl3+9ySxGhrefC2Nme0EuYmJxm
	RQw7ViU/y54rxE52gbSyK+PctVy52Y4dKyfhHhs1z2k0FkhoirH08cblkdcExT8kS6wE7XOegzVno
	AHzgIVxYU+cCUbACc2aj/fYLcoi9llO9i3fISa4wEbAEQ9lXmrFrc6QAdam3yKE6qujViooT3hmc7
	6YG4S/hJtvYeITiYfHZ/voaz1w2kuQDsjp5sBueuoKtEz2ruvGHokXUU92Cyy8OR0tlIqwpxixNOw
	khaZqCUg==;
Received: from ip6-localhost ([::1]:45018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kp2s7-001Hus-IW; Tue, 15 Dec 2020 05:27:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kp2s1-001Hul-RB
 for samba-technical@lists.samba.org; Tue, 15 Dec 2020 05:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=cDFFy9deo570SAl4jJe5S1pRDW0bUjRsJki8AZWUUNo=; b=EoI8b1ySlujoFCPcil+KeuP7l9
 xJ5JQbx+c4OmaKe7Lstwzr5H/MvJYg2/vflhIn/5qLoDwawuurbX61xNwkonU533ljc+QqMs/8jUI
 QBrvwVUoXKo8eQ2af3VO/6RzzcnxL4v01SYnPxeH10fhSM15Ul1z5BF7jQL7z/oT4scOAqKPoM8Li
 yPe5y1Dc/K4OKT1ZBSpFTSHEGWCmntpacEGfxKu2PBoe8RpHVfrTUop4JGBmnafdIrvslwHL9wHfM
 KUPeqUrKvaU+F2yuwunJjL54RtE4wjRly7abWo3Ib+l0wu55ht2Y6KM2YtKX9t5jJc9v75ZVRvIeV
 /PxMqbHUhltP9ARyZH0alRA2DjYF8fEKN3umt02AYKKcWds1ku4Rnd0MVkHMScJmiVHYWq+XCN7+e
 t8dmcDc6Duq1AFKNm45cbmpxeWHJBKWAN9fDLoyoCbKuEsIyLmmOUJlo5CFkgCiT48L43gq1z7uP4
 pm46WHC1zHghmUgngm/1qPNx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kp2ro-0006Hy-JD; Tue, 15 Dec 2020 05:27:21 +0000
Message-ID: <869254670a3cd07b8320d32c81beb6a4fdac39a7.camel@samba.org>
Subject: Re: Samba testing on CentOS 8
To: Martin Schwenke <martin@meltin.net>
Date: Tue, 15 Dec 2020 18:27:13 +1300
In-Reply-To: <20201215154043.3b1c5876@martins.ozlabs.org>
References: <20201208231746.3c15f5b0@martins.ozlabs.org>
 <20201208124406.GF5029@pinega.vda.li>
 <20201209003132.328ca229@martins.ozlabs.org>
 <df4952fb-87d9-6cc8-e55c-a08487ff34aa@samba.org>
 <20201210142744.398a7e75@martins.ozlabs.org>
 <380efeccd76b37a958da2a49656a5c1c959a0173.camel@samba.org>
 <20201212112535.48699809@martins.ozlabs.org>
 <20201215154043.3b1c5876@martins.ozlabs.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-12-15 at 15:40 +1100, Martin Schwenke wrote:
> On Sat, 12 Dec 2020 11:25:35 +1100, Martin Schwenke via samba-
> technical
> <samba-technical@lists.samba.org> wrote:
> 
> > On Sat, 12 Dec 2020 09:45:44 +1300, Andrew Bartlett
> > <abartlet@samba.org> wrote:
> > > One advantage of the current bootstrap system is that as long as
> > > nobody
> > > deletes the CI images that are built, the existing images remain
> > > a
> > > stable snapshot.  It is 'just' the bootstrap scripts that break
> > > for
> > > others, and of course building a new image now becomes more
> > > difficult.  
> > 
> > Thanks for hammering that observation home!  I found it slightly
> > annoying when I had to build new images to test my branch on GitLab
> > but
> > I now realise that the stability is a core feature.
> 
> Of course this is also a bit dangerous.  The worst case is very
> unlikely, but if a change accidentally depends on a 3rd party libray
> bug and all of the test platforms later fix the bug then our test
> framework won't notice the breakage because we're using "stable"
> (i.e. out-of-date) images.
> 
> It makes sense to update our CI images every so often to make sure
> our
> tests still pass on current versions.  I'm not sure how we would do
> that.  The technical part is quite clear
> (SAMBA_CI_REBUILD_IMAGES=yes)
> but the process part is more interesting.  For example, how do
> we do out-of-band CI image builds to ensure that new images are OK
> before the CI system defaults to using them.

So we verify the images are OK with the same task that we deploy on
them, being samba-o3.  So you can just rebuild them any time you want
and if they pass (and so will pass the next master build) they will
overwrite the existing images.

> I guess the easiest way would be to add a comment to
> bootstrap/.gitlab-ci.yml like:
> 
> # Rebuild: 1
> 
> (or make it actual YAML data) and increment this for every rebuild.
> That would change the sha1sum so that old images are not overwritten
> and the new images can be confirmed OK before pushing the change with
> the incremented rebuild number.

This would indeed not trigger the overwrite.  But we do check.  

At the time this was built I really did think the bootstrap system was
over-engineered, but it has been really awesome to be able to rely on
it so comprehensively.

Thanks Joe and Metze!

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba



