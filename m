Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B08C8E22
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2019 18:18:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=cfAUwMXTGbuQTFC/JV63wO2CUSI4xv5M89v3UiHxH+U=; b=Bd/C8LuFwhutPDeWKqzkOWY+G4
	za1KAfQ/5j9SRmByphtSuu1sr54GnNiqKdpx+KYXuQ6Qiay0Z4YHBk4kS/Yawew9z5X919CQjpcij
	vx6yG+67+oXQSikSTEfe+dNz040yXr9IN0kGmB/WrkAQvUQq5ZiqlskemGHuf0pGmBw2npzoIkwOo
	KBIMuIb12lnXOO02n3XvZBMiz6SwmS3my6PuzB8MVuLQnJoVxSxS+WYVIPtS0HXWhzPV/ovc0yVMZ
	nlpqpsL7gsJwF4RPbIUN9KUNDUQvHWMk/FFBcfBHPrCAfNDLJlS4HlMB6Ie36GFPzSOjrENlNFglR
	4/0f3RkQ==;
Received: from localhost ([::1]:33184 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFhKm-000V9Q-5P; Wed, 02 Oct 2019 16:18:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11044) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFhKi-000V9J-Iy
 for samba-technical@lists.samba.org; Wed, 02 Oct 2019 16:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=cfAUwMXTGbuQTFC/JV63wO2CUSI4xv5M89v3UiHxH+U=; b=rbV9KnXXThqdc2fysU5HbTBv1f
 ytsoVUh6+Y8No9ASi+tEOQw4AduFqo5z8GuSs5IDSnGBNylY92x7KnBfTMKOSj7C8CbPAH7YPoDCS
 yNGY6Wryu52GK4Yw/wYXwUpg6Rw1aD7LiYhgRGO0/S+g7SwiZUsn8lN0PZiatZORlra8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFhKh-0007Io-LZ; Wed, 02 Oct 2019 16:18:32 +0000
Date: Wed, 2 Oct 2019 09:18:29 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
Message-ID: <20191002161829.GA150912@jra4>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <20191001205535.GC4074@jra4> <2918177.rYeYep3EVu@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2918177.rYeYep3EVu@magrathea>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: David Mulder <dmulder@suse.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 02, 2019 at 07:43:40AM +0200, Andreas Schneider wrote:
> On Tuesday, 1 October 2019 22:55:35 CEST Jeremy Allison via samba-technical 
> wrote:
> > On Fri, Sep 27, 2019 at 02:54:08PM +0000, David Mulder via samba-technical 
> wrote:
> > > Noel and I are looking at converting any old SMB tests that target the
> > > SMB1 protocols to SMB2+. Is anyone else already working on this? Does
> > > anyone have some pointers?
> > "Congratulations, you've decided to clean the elevator... !" (from
> > the movie Dark Star :-).
> > 
> > No, no one else is working on this I'm afaid. As I add
> > new tests I usually make sure they're SMB2+ only, as
> > that's what we want to target going forward.
> > 
> > Best advice I can give is to move them over one
> > at a time, probably starting with the isolated
> > ones.
> > 
> > As you move them, take the opportunity to clean
> > up some of the old failure paths - ensuring they
> > start and end with a clean and empty directory
> > tree. Some of our flaky tests have been caused
> > by 'old' data being left from a previous test.
> 
> Also allow via an environment variable to not do the cleanup afterwards!

Oh that's a good point to be able to debug test failures,
thanks Andreas !

> TORTURE_SKIP_CLEANUP=1
> 
> 
> Also we had a very bad practice with torture tests! We need to change that. 
> Make sure that always torture_assert_*_goto() is used and that the goto cleans 
> up (memory, connections, etc.). A test should run with asan, ubsan, etc.
> 
> In case of a failure the test should return the state and not always true!
> 
> An example for a well written torture test is:
> 
> source4/torture/rpc/iremotewinspool_driver.c
> 
> 
> Just my 2 cents ;-)
> 
> 
> 	Andreas
> 
> -- 
> Andreas Schneider                      asn@samba.org
> Samba Team                             www.samba.org
> GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
> 
> 

