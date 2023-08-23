Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D1698786051
	for <lists+samba-technical@lfdr.de>; Wed, 23 Aug 2023 21:05:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Xnm3LKXKxL9h4YGJuj6MydEWnwt1g970UJkDxzI2pck=; b=bSd5oiuhfdRT88qlzp2HFHSvmk
	CMm+TF56fJ/paNGPztMFk/QKNQdHIGaN6AYF1r9nm2vpGVYRUw+iNIgLwUNUvjOpRmeBX12kXpDws
	R/TwWh5eZkUNcI8QptZIoVBsf1uAK80YePYy7+01/tv3fY4ifor5lOICyfAfZnzCvFe16pqEk3szr
	FHooPlCycWBI6pQnitT1AGMYk375/6jrC1gJmWpsf4uSnjOMJSKCF3d0ieGFR/raQU8FblbQ4kXUr
	gVR6RGLkFdFsnrpqWLDh2dY7oy73yf77VOULonG9OSYf2z6HzIONu2T2dIP5jVXcv8A47y4PKwWdz
	8FsXVFLA==;
Received: from ip6-localhost ([::1]:32658 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qYtAF-00EBMW-MW; Wed, 23 Aug 2023 19:05:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41218) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qYtA7-00EBMK-DI
 for samba-technical@lists.samba.org; Wed, 23 Aug 2023 19:05:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Xnm3LKXKxL9h4YGJuj6MydEWnwt1g970UJkDxzI2pck=; b=c+kcll666uooA6sG1Tr9/tr82A
 oLbqQuuYm1ByHzUY6ozhL+rgNAQzbOu8UXQ9kkZ9VelUdBL9HaIF67DToqNR3qlP2iwyVCOhmuWWz
 uK4PEVwUqAQT9aKoPPZ5qJa0GgJuXlYTpDilPnRR+81VG/IUPE2arQ/QUE/kritam3+nFmHWyg1e5
 iArHxO7wir5mR2Dq8rxv3eTrlkd40HWddf4geCTONhu/nTniD7uAZGQwXl2ZgN9QnY/ABY0s7trU2
 44+4PqE3zIx/FxennQuKOaxa9aPFr0fGr7SkYjQEEkzopti9VBQ0rcnK7fIXOJigF+w4vXQOopWMZ
 h2XkoMa8LBFbA5rKUS29+r+3E8KT23jErI/dw/lrjE1VgbYQy6EuVDfXbJy40+qd+gzf/7LlylS6y
 R3xt0QlJBGf/edi6bf8djWOYeURTyNOzz5iTrzxGeNfRouSwG72VApVJUam6jN2vLVMJnbVDsTu4R
 H3lYnWSxXueoaQHVjiJnINqq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qYtA2-009dxp-1z; Wed, 23 Aug 2023 19:04:59 +0000
Date: Wed, 23 Aug 2023 12:04:53 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
Message-ID: <ZOZYVWXwm8yL4z4V@samba.org>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Aug 18, 2023 at 12:08:00PM +1200, Andrew Bartlett via samba-technical wrote:
> On Fri, 2023-08-18 at 11:52 +1200, Douglas Bagnall wrote:
> > On 18/08/23 11:20, Andrew Bartlett via samba-technical wrote:
> > > We need to reduce our CI time, and one way to do that is to
> > > reuseobjects as much as possible, creating read-only objects once
> > > per class,not per test.
> > > This is much cleaner if with the addCleanup() and
> > > addClassCleanup()methods, so I would like to be able to do that.
> > > To do that we need Python 3.8.  The primary blocker for this is
> > > theCentOS 7 build which uses Python 3.6 from EPEL, and a newer
> > > Python isnot in that repo.
> > 
> > I had a look at the Python 3.8 git history for Lib/unittest to see if
> > it would be simple to backport/recreate the ClassCleanup code into
> > our TestCase wrappers (like we used to do for various assert
> > methods), and the answer is NO. Thankfully.
> > I have no opinions about Centos 7, but I do agree that the supported
> > Python versions need to be exactly determined by CI.
> > Douglas
> 
> I would note that times when we didn't line up the CI version and
> Python 'supported' version, it kept breaking. 
> I note that RHEL7 ends 'maintenance' in June 2024, just after the 4.20
> release March 2024
> https://www.redhat.com/en/blog/end-maintenance-red-hat-enterprise-linux-7-almost-here
> Those dates I think give good cause to drop CentOS 7, but other views
> still welcome.

Maybe based on the comments in this thread, dropping CentOS 7 and
requiring a newer Python version could be takes as two separate steps?
Whoever is running something based on CentOS 7 might not be upgrading to
the latest Samba?

And what are the Python dependencies? That obviously affects ADDC and
testcases, but maybe not the file server and AD member parts?

Christof

