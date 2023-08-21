Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7FF7821EF
	for <lists+samba-technical@lfdr.de>; Mon, 21 Aug 2023 05:37:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=6iEhC/EwPcnswq0Z/ACaMfqnOakbGeVKz2D3ntXy9o8=; b=BUpgZDVXNx1DxIXUfLETEOUP+M
	GQ5tPLmtEOQs8f+YCZFG9/ZDpI4acdJKkV5yRUvxWgcxKqS01FUU/TyFPPqxSyjjTh5BlS5xJRXiV
	3pYMxfJDdp0q95vZXj3yQ145S159L9MYoO2fIWc7HeH5FAEbEO9UOHH3cVACqEDWhE4wpScC61iSh
	WIH9XV1Th5y8MQHPX6HDSfVMMDD8R34rMOO4hF47WtV+a53Ed5W0cqozjNB5YBKmVCvm3UneLYukg
	qRMbAj8gQCslqRUiWYQc63Y70NRGgUR+sU5l0UgVViurd8R3wRpnsqXqPOt4yJiJJQi1bnfp9AaA7
	7EA04bSg==;
Received: from ip6-localhost ([::1]:57428 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXviq-00DY8P-4I; Mon, 21 Aug 2023 03:36:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63530) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qXvij-00DY8F-AT
 for samba-technical@lists.samba.org; Mon, 21 Aug 2023 03:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=jvYn1sWORNR2/Y1mJnlZc7LWTEuS8l426KYgBkt9rEo=; b=wIkx2lkQK4+XFwLziMp+bIFMhj
 ZD5zxggPj8yEa0zxMoM4KHhyjFdjgNn7nmNovUEq69In06MI/XQG9cINB2d7FSbAgTy+W2XVEDOcC
 Nutqs3EEKZukDVKZcl/o1pphDbKl3cNrQ3WTrumdtG8wbjC/mZN5zvoI47s4r1Vjruym/nCDa0YtI
 xURc6dNFG6uuXAfcQ3ZtFANVp3BKlFq3SDgjxYD+CQBKzKe+m+tVJ5e/GW0u5O/9EFJ3mHibLtyXN
 YO9i/nLt/fwKCaKhpTXqOckGidDboAEfbkY0tdyct4hH0sI0zw1SvWV480CJXa1JQw0B+hv7xqEtb
 rBOWGmLkjHvcJxaeNdMd3EDq23Qull1ltVtG0vTdYlavBayn2uXbnnMXbIsgsmQiwH2YB53mR+Kyd
 s/Zc79oDKizfbp7uOnk6N4YS83HuIEDU1YBjtNUd0M5Wx/O3XzW4tZMeAC5E9T71fsgFnQSARgFp3
 lh5xUp/VSVyQ6RlMlyjAqE+i;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qXvih-0096Eu-2l; Mon, 21 Aug 2023 03:36:48 +0000
Message-ID: <8acd38a4d8bad00d88dad338c26732384f8dd19d.camel@samba.org>
Subject: Re: Building Samba master from a few days ago on CentOS 8.5 runs
 into a weird Python problem
To: Richard Sharpe <realrichardsharpe@gmail.com>
Date: Mon, 21 Aug 2023 15:36:43 +1200
In-Reply-To: <CACyXjPw2uB5cCERsytg8SDK+3f-69QeZgD81SP22O=1D+byJUA@mail.gmail.com>
References: <CACyXjPzjJTfpx7ad2BQS0CiN0SRazz_7tdSwDnX7+qZR9VFfYg@mail.gmail.com>
 <dd2f4ba33c19cae2271c23c9bfb5e90d5d3172c1.camel@samba.org>
 <CACyXjPw2uB5cCERsytg8SDK+3f-69QeZgD81SP22O=1D+byJUA@mail.gmail.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2023-08-20 at 20:08 -0700, Richard Sharpe wrote:
> On Sun, Aug 20, 2023 at 7:44 PM Andrew Bartlett <abartlet@samba.org>
> wrote:
> > On Wed, 2023-08-16 at 18:50 -0700, Richard Sharpe via samba-
> > technical wrote:
> > Hi folks,
> > 
> > I am trying to configure Samba master from a few days ago on a
> > CentOS
> > 8.5 system.
> > 
> > I ran the bootstrap script and it only complained about lmdb-devel
> > ...
> > 
> > Then when I ran configure --enable-debug, I got this error:
> > 
> > --------------------------------------
> > # ./configure --enable-debug
> > Setting top to                           : /root/src/samba-ad-
> > error-injection
> > Setting out to                           :
> > /root/src/samba-ad-error-injection/bin
> > Checking for 'gcc' (C compiler)          : Traceback (most recent
> > call last):
> >   File "/root/src/samba-ad-error-
> > injection/third_party/waf/waflib/Utils.py",
> > line 833, in wrap
> >     return cache[k]
> > KeyError: (<samba_waf18.ConfigurationContext object at
> > 0x7fb83837d8e0>,)
> > 
> > During handling of the above exception, another exception occurred:
> > 
> > Traceback (most recent call last):
> >   File "/root/src/samba-ad-error-
> > injection/third_party/waf/waflib/Utils.py",
> > line 833, in wrap
> >     return cache[k]
> > KeyError: (<samba_waf18.ConfigurationContext object at
> > 0x7fb83837d8e0>,)
> > ---------------------------------------
> > 
> > In looking at the Python code it seems like there is an issue with
> > the
> > except KeyError clause in the code.
> > 
> > Has anyone seen this issue before?
> > 
> > Richard,
> > 
> > Just checking if you managed to work it out?
> 
> Yes, I did thank you. The bootstrap script had not actually run
> andall I had to do from memory was to remove lmdb-devel from the list
> ofRPMs installed.
> It was confusing at first because I first built it on one of
> ourstandard build VMs and did not have to run the bootstrap script.

We really should fix that error handling.  It is in waf, I wonder if a
newer version handles it better?  Otherwise we should tell upstream.
See also:https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1011163
Which might be unrelated (mjt assures me it is) but better error
handling would reduce head scratching. 
Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
