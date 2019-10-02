Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C175C471F
	for <lists+samba-technical@lfdr.de>; Wed,  2 Oct 2019 07:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=G7G5uWUCLPZdb/T/S954Tg45xSuLBaUTYophOHSabak=; b=s+5O1vT4CWVgzhq7eioc+kzI8r
	2OTwVMpT0bXcYzEExk9EwaJLOfQoCzGyQAvKGOvHxZxisXCOu0EJm1LjuQrNDsSsSsfpzbAC0amtm
	E7lxuwn9y2yrXSTlVQo0fgQWPWD7/He/2AQCJ8XX8f+m4Jtfdf1ISaYY/vB0GGItsHRnPV0AUS7q7
	Fr2tU8jWQSvY0F4svG2xFRbHna8XA3biCawx5UDbgJo1DuO56ulbgYx/Kc/ZE+NugZJR3r2JIoUz9
	QCcqD1TdGpHKmQoqDodgTZUIGFpkrA/n++MzNraSJXoySoTfD3jFVCLz6OzbEMs2lfuFUnmTjLXsX
	VsjuFjUQ==;
Received: from localhost ([::1]:58520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iFXQS-000GkW-Gf; Wed, 02 Oct 2019 05:43:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20774) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFXQN-000GkP-FI
 for samba-technical@lists.samba.org; Wed, 02 Oct 2019 05:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Date:Cc:To:From;
 bh=G7G5uWUCLPZdb/T/S954Tg45xSuLBaUTYophOHSabak=; b=hqxZFXBcGvbJH9QJQw5fQCHqMR
 Znb7YYtlomXIBOU2/Pp67OFRmtIC7azQiw8T+DPkEmwvk8IgXskQ5yIoWIGJAv4vHIOKDZ4KPL+Mp
 /Kv8/CIFJlP2UyTSBZxAmqJN91WhFwWOMxfSAh/4NRFYHEgKZZSp6XVE/R5wV5KXtzlM=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iFXQL-0000by-Au; Wed, 02 Oct 2019 05:43:41 +0000
To: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Subject: Re: Converting SMB1 tests to SMB2
Date: Wed, 02 Oct 2019 07:43:40 +0200
Message-ID: <2918177.rYeYep3EVu@magrathea>
In-Reply-To: <20191001205535.GC4074@jra4>
References: <f0f71737-cd07-b361-1c26-58116e6e8ed8@suse.com>
 <20191001205535.GC4074@jra4>
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
Cc: David Mulder <dmulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 1 October 2019 22:55:35 CEST Jeremy Allison via samba-technical 
wrote:
> On Fri, Sep 27, 2019 at 02:54:08PM +0000, David Mulder via samba-technical 
wrote:
> > Noel and I are looking at converting any old SMB tests that target the
> > SMB1 protocols to SMB2+. Is anyone else already working on this? Does
> > anyone have some pointers?
> "Congratulations, you've decided to clean the elevator... !" (from
> the movie Dark Star :-).
> 
> No, no one else is working on this I'm afaid. As I add
> new tests I usually make sure they're SMB2+ only, as
> that's what we want to target going forward.
> 
> Best advice I can give is to move them over one
> at a time, probably starting with the isolated
> ones.
> 
> As you move them, take the opportunity to clean
> up some of the old failure paths - ensuring they
> start and end with a clean and empty directory
> tree. Some of our flaky tests have been caused
> by 'old' data being left from a previous test.

Also allow via an environment variable to not do the cleanup afterwards!

TORTURE_SKIP_CLEANUP=1


Also we had a very bad practice with torture tests! We need to change that. 
Make sure that always torture_assert_*_goto() is used and that the goto cleans 
up (memory, connections, etc.). A test should run with asan, ubsan, etc.

In case of a failure the test should return the state and not always true!

An example for a well written torture test is:

source4/torture/rpc/iremotewinspool_driver.c


Just my 2 cents ;-)


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



