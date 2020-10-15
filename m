Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8573628F998
	for <lists+samba-technical@lfdr.de>; Thu, 15 Oct 2020 21:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=UeYctc35lMWvVVwroMVDCmtbmqEvZBQxYABhxFvtbEk=; b=049MpvJVNemgDY1wx3K1TF2hBm
	KepBJAClMye4/LcvsJBDP0L3sVVMEL2nrVG7rHgOK/JUpZbhvoXOGl+PBl2zabZLtRFW+6K2UhZ2g
	oeWZxxKK+8jn/J4Ih+p0UYk3DWVa7/2CQvbDP0nY39d9Nl2c8F+CHySsTZgNA0FnwwHVqHNXhUKSi
	KK/7yQYkqz0S43YfMyCsXyYFvke/wz4U4/giAjFfxsxShXgNboti8dkMREFX2NsppBXzlqAyDHxuJ
	qNXa684glSbuwGeOnpfLaC26cLV+NJ13bvAE2Q7jFVmfM9rLX5cWdPQ/diqBrBoGJV5dz0IHtCWU2
	hxHLoFVg==;
Received: from ip6-localhost ([::1]:63852 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kT94a-00CJoZ-CP; Thu, 15 Oct 2020 19:38:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52750) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT94V-00CJoS-91
 for samba-technical@lists.samba.org; Thu, 15 Oct 2020 19:37:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=UeYctc35lMWvVVwroMVDCmtbmqEvZBQxYABhxFvtbEk=; b=wabqax69qjxOX2JNAn7VgAZtYv
 smtuvF7sOpoBPrAxJvd4LsflKnsm+snWz0gjpBb/Hnjk4ias6b3gMuSQKkDGu3zln63tdFGtQ81XY
 Z8arXtKOxfSbVxA2QPDXC7YpuqwY3hl0VCmquBHdrFsCuTwQECOVz8SFEo6L4A2iZYjx6mPHyVGny
 8eJ9+NZFITdcwp1YoJC6BPq3eSvV+1FbistemrP4NcRK+8bNXIpHzqhTxVO3GSEfK0h6ezfNW5ToG
 fBCrrQSMkw8crnlOAsKMct/gpU/4ap72g8miP3nvq3QC4tBEwdTIlQSKUjjSReyKCBbj4YekvAWsZ
 yv4WfTlDJ7fgs5uRw39j0D5qqzA8EKVyt4O2k8pZSwDatZPS9uLRnJnDfBzLJMiWJvFr6PaBn6XFs
 4A5Omyz1q2PVf7r4WpQazW+CSMZFjZXjUc6tQ4aMUrR/G2zoe8Lgpusyz8e+OrfCo55jxZTlZj4Ki
 hLXjmAucEQ5720AEy6zwibLa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kT94U-0003jQ-BQ; Thu, 15 Oct 2020 19:37:54 +0000
Date: Thu, 15 Oct 2020 12:37:51 -0700
To: Simo Sorce <idra@samba.org>
Subject: Re: [PATCH] Documentation: Rename Samba's DCO to Samba Contributor
 Representation
Message-ID: <20201015193751.GJ3840862@jeremy-acer>
References: <87mu0nidll.fsf@ebb.org> <20201015180510.GE3769001@jeremy-acer>
 <2231b5de-fa06-db61-feb0-08ad0374673e@samba.org>
 <f70291dc95eb0eae98e23c2897cbcfa9376e90e9.camel@samba.org>
 <20201015192330.GI3840862@jeremy-acer>
 <09b466404b11983f992ac2f89c369b33d3a1a135.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09b466404b11983f992ac2f89c369b33d3a1a135.camel@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 15, 2020 at 03:33:22PM -0400, Simo Sorce via samba-technical wrote:
> On Thu, 2020-10-15 at 12:23 -0700, Jeremy Allison via samba-technical
> > 
> > Well it's not just Samba that uses DCO. Look here:
> > 
> > https://probot.github.io/apps/dco/
> > https://www.dita-ot.org/dco
> > http://www.gearvrf.org/about/certificate/
> > https://www.docker.com/blog/docker-code-contributions-require-developer-certificate-of-origin/
> > 
> > for just a few of the other projects that use "DCO"
> > to do exactly what we do.
> > 
> > Right now it looks like the term "DCO" has become
> > synonymous with what we're doing here.
> > 
> > Even Linux kernel developers use it in this way:
> > 
> > https://blog.hansenpartnership.com/a-modest-proposal-on-the-dco/
> > 
> > "When one of our developers posts a patch to a project under
> > an OSI approved licence with a DCO Signed-off-by: from our
> > corporate email domain, we authorise that developer to be our
> > agent in the minimum set of patent and copyright grants that
> > are required to satisfy the terms of the OSI approved licence
> > for the contribution."
> > 
> > Note that the above text doesn't say "to the Linux kernel
> > project" here - only "to a project".
> 
> Yes I am aware, and I do not think we have any strong obligation to
> change the Samba DCO name, but if we do not want to change the name I
> think we should have a new document drafted from scratch so that we do
> not violate the license of the original DCO text, unless you argue that
> "Samba DCO" is not a "similar name" enough.

Changing to a new document is like a license change - what
happens to all the existing signers of the old document ?

Keeping the name and modifying the underlying text IMHO
is the worst of both worlds.

Personally I think we should just add the CC-By-SA
attribution and be done with it.

