Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C103207E73
	for <lists+samba-technical@lfdr.de>; Wed, 24 Jun 2020 23:27:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=E3tK05XTLa4mNtpHR2+dpSPYW9NOT4kU6OUil5Yzq2U=; b=s2eHxLFje+t4qXCTy5N+mT8BcK
	pev6HCih+lnUqtFjA3LFaxWrFguP8j+KGmahcL+ZCxLs4RczsLOm+58Pm7mH1W6pm+eNffdz4j+ka
	h/rMqkJU5+DG82B89deb8QvqRfAvnvOHS/YGK9XUuWiOOcNX55H4sqNdezI6x+Q2invUaZ0PhX/JC
	XV5x2mlWM//visGEEcJ6kpU6+L4MYpDi5Twgu4zw2fn31xZ1awgw/vo/4zOUbSrB936OZktNPV41C
	B6HrsVzTgadrinORAZMl++C4+uc1xV2r4ChiHmWLL+EYLfNPrXEZx3HQn2rPfzC/wN2CY+TXVlKjg
	+5w3gp/Q==;
Received: from localhost ([::1]:52310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1joCvE-002CdG-09; Wed, 24 Jun 2020 21:27:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63088) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1joCv7-002Cd9-W0
 for samba-technical@lists.samba.org; Wed, 24 Jun 2020 21:27:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=E3tK05XTLa4mNtpHR2+dpSPYW9NOT4kU6OUil5Yzq2U=; b=U1NeJ1pIEOVyrocbk+UzAWRqM0
 45u5bxouG/Dj0HSK70292eBwv2j3rGYNHp5VOTfwrI0aVcSembJv5AvF85v1pmIrXc91nZmkJ2xM5
 79JJTUSQcwoE7ykXtHeqBx7x0TfZKrtT9pk5aWqUAIOG6sPP6ezjoq786C0o9vE4xX8hJkq7OeVWo
 ZKeq0Mtf/1iBgxYwB/uktqV3cZf1Lyb/k1c8jUtL2iCgYZoemPNnhTTXQ3KaWc7WRZ4D6gfYlyAQ9
 qYyixKOayvb50QhqG/Wi5KjYjheFj5UldFMMIhi2xqXTpLFt/lM0Ei9rJICp0TvRqujVGJ+prmKDH
 TRmrWh/5GcP9wogbycXgrkbBkoiRxD09eB7GaRBSybpgyasXSJ/mAEEfaLnJ+s+9IPVjG9IgLqsqC
 JXbAXKJjCm7QP6IqHjNcisivZkfI3JebFsxrSvXaHsvYSiTmI/PT/n/zXiw7N2hyGQTAX5uQhz8OY
 YX0p+WF4yV6i90nhoTWSHRt/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1joCv6-00036G-K9; Wed, 24 Jun 2020 21:27:01 +0000
Message-ID: <47a88e529f7a94c1b8a2c6c510bf4a21884f9f48.camel@samba.org>
Subject: network namespace support in selftest (was: Re: socket-wrapper
 fd-passing)
To: Stefan Metzmacher <metze@samba.org>, Anoop C S <anoopcs@redhat.com>
Date: Thu, 25 Jun 2020 09:26:55 +1200
In-Reply-To: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
References: <35bfe7ee-5c75-c785-8648-4c8191a9974a@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-06-24 at 23:14 +0200, Stefan Metzmacher via samba-
technical wrote:
> Hi Anoop,
> 
> I rebased your fd-passing patches on top of socket_wrapper master.
> 
> See https://gitlab.com/metze/socket_wrapper/-/commits/fd-passing/
> 
> Please also notice my commit on top where I added some more hints
> on a better design:

I've not looked into this in any detail at all, and I'm sure you are
aware that with the network namespace mode for selftest we can avoid
socket_wrapper and so base ourselves directly on kernel sockets.  

This of course requires privileges so has other implications, but I
wanted to mention this more broadly in case this helps us get out of a
tight spot here.

This is the work Tim Beale did a year or so ago.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







