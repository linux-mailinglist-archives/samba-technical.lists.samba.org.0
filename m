Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D20888BE070
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2024 12:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=OhUZxAVA7x22VWVRRIDZIsRPTtKj084grgNVbxgpY00=; b=Vt649nygmxajgbwyrwJUqk2HnM
	c+MSGuIEjzmLhpnrGSC92hdTZIDQsfn/Z04GrqcMjw8iiX3r8uAOIR+nhZSzyiuyfcZcbHtepkuLc
	gVk8RgB9r9lthkP6jwjvBp87q9aI9iJnr2FEmjWk6jLnodiPjx2s8Xf1N7U+swr6s3aNadlwetkUh
	xouLTjEKSmDc5LiWQQ46GHEPkQH71f4EjGG2VNbfkjv8CDA9RJwaqYPE8UclsHLx0Xfzs2XtB+Ilw
	hnWvyDSddyM93AWD/wtlK14Fk003CIJxP64JalSpKMXGUZoG6Z8b7/m/ZUsLWwyMnyReUncZy/uJ2
	e9NKTkcA==;
Received: from ip6-localhost ([::1]:60632 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4IW4-008QQ7-SR; Tue, 07 May 2024 10:57:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:34904) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4IVz-008QQ0-O8
 for samba-technical@lists.samba.org; Tue, 07 May 2024 10:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=OhUZxAVA7x22VWVRRIDZIsRPTtKj084grgNVbxgpY00=; b=IBbPmh5uBjHgs4ZGawdvvmgFP0
 Whbilm24oJ97loSwoS69+7ELJb/MFlDXHAWcXll4PFd5/dduCUW8K1+2Cqq6jN7NwP30nwsJoN//d
 6gi4ze5ASDIhqnr9Sn476bNXOHjeFvUXwKBPFztnUqPD10zRnvrMQMwx+wFxkHFPz0cqwGk5vzfpM
 qnMxL8vzZ33pgkTEnkDXrU8ef+O9Vg2Cd7zmjJ02yVKiT1VT/bBO6Jb6Z0qK5NP8roVEpSMcT1aib
 4AitENeqrUZNJSw2+qBSV4x0B1KSrmPaWwRpLIuDOvRzaag0CdOXt56N/czKVsIZF/XFxZs1bYu4B
 Cuplacy3CzRkO6alE/c3bjOyYyt4tvSQtfHGVvCYINbtiDTaCIJpMK++yxsBkQ4d6+x8zp8hv1CUH
 /fGSfRRgHNvwYTCFPr/iM26vFTZWNesoFN4f6nU5D63Df9lCWIfP75SJcV8In3Rxr1dGeEuWtukHx
 bgdJL4R9n1/H+LRQnnAi7DfQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4IVx-00ACF1-1n for samba-technical@lists.samba.org;
 Tue, 07 May 2024 10:57:41 +0000
Date: Tue, 7 May 2024 11:57:39 +0100
To: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Subject: Re: Need to rebuild Rackspace gitlab runners - plan to move to
 Ubuntu 24.04
Message-ID: <20240507115739.1fac899b@devstation.samdom.example.com>
In-Reply-To: <99670794c9f69001a8da79519392d647353e6e26.camel@samba.org>
References: <e3375f71e0d24e109832046bfc46bdbfb1429855.camel@samba.org>
 <e8fc29a1-9ca4-4644-8ff0-32fbf1bfc390@samba.org>
 <99670794c9f69001a8da79519392d647353e6e26.camel@samba.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 07 May 2024 22:45:30 +1200
Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
wrote:

> On Mon, 2024-04-29 at 17:56 +0200, Stefan Metzmacher wrote:
> > Am 29.04.24 um 07:26 schrieb Andrew Bartlett via samba-technical:
> > > Just a heads up that due to
> > > https://bugzilla.samba.org/show_bug.cgi?id=15638 I need to rebuild
> > > theGitLab runners we have in Rackspace, so that it still offers a
> > > tag thatour jobs will then expect.
> > > While doing that, if the image is available by then (it isn't
> > > yet), Iwould like to make our runners run on Ubuntu 24.04 as the
> > > runners(which are booted once per job) will start faster as they
> > > won't have asmany updates to run on first boot.
> > > Please let me know if you think that could be a concern.  On the
> > > plusside it should allow the more recent kernel for some more
> > > io_uringtesting.
> > > Naturally I'll check a full private CI run passes before I rebuild
> > > forproduction.
> > 
> > Great! Thanks!
> > metze
> 
> I still plan to rebuild the runners, but Ubuntu 24.04 is not out yet.

I think Canonical might not agree with you there:

https://canonical.com/blog/canonical-releases-ubuntu-24-04-noble-numbat

According to that webpage, it was released on the 25th April 2024

Rowland

> Also, it seems the key is actually to require fewer tags, and that
> shouldn't require a runner rebuild to do that.  
> I will have to do it to allow private builds however, so I am not off
> the hook!
> See https://gitlab.com/samba-team/samba/-/merge_requests/3620
> Andrew Bartlett
> 


