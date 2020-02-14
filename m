Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 981BA15F860
	for <lists+samba-technical@lfdr.de>; Fri, 14 Feb 2020 22:02:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=dTAF4VJ0fuSsdtao1vQiDRZtIL4+btYC/IBvzNqwwgM=; b=Z6omJxt8jyo6bnN79hBnIfZc/l
	hcXHvyF36RI6qM5wRr8RoifQdTneZbtiHThG/n7ZUjcCkpiuyXnhaHtCVWPo1Z/JhAVY9EanFziSX
	sxOzM22gpFN3lSlywiTydPMW5ra8AkS9g/DRd+rLq4zBUXIGmqIZM0op66TqL22dtp7qX6ojms65E
	xoM16L/ALLofaZ68kMU3xef1yn6dFd5okZx/oDTwMN8LTYuoKvc+MOvoZf5eoNFK1ikzfLfe4MKuP
	OaPRbYO2baYo7EK1y2anE7P/2sevKW4LZ43Mqc9mbGF7BFudYLxunNMA7nw6ODDewNjmymj4ZLbhI
	yZ5p+1EQ==;
Received: from localhost ([::1]:49760 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j2i6N-009xL7-HT; Fri, 14 Feb 2020 21:02:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27708) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2i6I-009xL0-Ar
 for samba-technical@lists.samba.org; Fri, 14 Feb 2020 21:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=dTAF4VJ0fuSsdtao1vQiDRZtIL4+btYC/IBvzNqwwgM=; b=MNY8CnecvaZfi7bzlnjQsyMUs4
 LxNZr4disCFyON7bAqj6vK7ATcMwpbJOLPRcPDA48tsw0IW/UMwcC3GzMPyi2MkSJ6Rx9uaeFNyQK
 D4Ca5BBsIwkDv/qNc1wwhRw9Lg9z0f58jH3qbcLeaHv6Mlw4L9Aw6teD9hYN2HFnvBhpHsyR/kfu7
 ehULchPHDDDW6tkkjvGoSX0dvBa2RFAeibv2DUApgJp6ZYvAjFWjjEFG4J67esQE4vM/6VYJHcFW8
 cUCMB4fYmahgFAPlnUXwObO/roEujNMPnwHIw5We8B8ZUq6dyz1VsGMQn+laYgsWp9pP3C9mPz2z2
 LbCN07SokqZ59nkIhKoHm7Ye3OkO/aWKo5ksygDhrMsu+HD+lwl7mlfv2elEoz+XTOKS4YFWvH6kw
 BRRnmBYgHDIIg90oJPukIMublJ1dxfzylDD1ubUP1GFGgsyfXKxk7fzaMwr+J0LZZoBqeFdmpqRbr
 oUIcxPuBxhHbmub8nM0ovF+Y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j2i6H-00048q-A4; Fri, 14 Feb 2020 21:02:13 +0000
Date: Fri, 14 Feb 2020 13:02:10 -0800
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: DFS/VFS failures in GitLab CI
Message-ID: <20200214210210.GB56355@jra4>
References: <1f5483b6c7349f261b79990f3daea501d7636ffe.camel@samba.org>
 <20200214205049.GA51881@jra4>
 <ffbb3c2912a79ca4c32232280b0ce689597aa99c.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffbb3c2912a79ca4c32232280b0ce689597aa99c.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Feb 15, 2020 at 09:57:58AM +1300, Andrew Bartlett wrote:
> On Fri, 2020-02-14 at 12:50 -0800, Jeremy Allison wrote:
> > keep getting (for example):
> > 
> > https://gitlab.com/samba-team/devel/samba/-/jobs/438181318
> > 
> > Failed to start up environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/target/Samba.pm line 125.
> > 7206 samba can't start up known environment 'ad_member' at /tmp/samba-testbase/b21/samba-admem/selftest/selftest.pl line 840.
> > 7207 ==> /builds/samba-team/devel/samba/samba-admem.stdout <==
> > 7208 [1(0)/138 at 0s] samba.tests.pam_winbind(local+krb5)(ad_member)
> > 7209 ERROR: Testsuite[samba.tests.pam_winbind(local+krb5)(ad_member)]
> > 7210 REASON: unable to set up environment ad_member - exiting
> > 
> > The code changes I'm making (DFS/VFS stuff) aren't anything
> > to do with this.
> > 
> > Any ideas on what might be going wrong ?
> 
> I'm pretty sure it is your changes.  This looks generic enough to
> reproduce locally, so try that to get good logs. 
> 
> make test FAIL_IMMEDIATELY=1 TESTS='--include-env=ad_member --include-env=ad_member_idmap_rid --include-env=ad_member_idmap_ad --include-env=ad_member_rfc2307'
> 
> It does say this a lot earlier, which does look like DFS/VFS stuff:
> 
> checking for winbindd
> wait for smbd
> tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
> tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
> tree connect failed: NT_STATUS_CONNECTION_DISCONNECTED
> 
> Sorry,

Don't be sorry, that's really helpful info to help
track stuff down - thanks ! :-).

The way the test environments are set up and
invoked is still a mystery to me unfortunately :-(.

Jeremy.

