Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71392201108
	for <lists+samba-technical@lfdr.de>; Fri, 19 Jun 2020 17:38:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=H6KdPddEFEOG/dvOcvhjgMvCXFvE7cD0KiK5mg2ifb0=; b=UeeB3hBqJft3+0uEeMw3JKYJF1
	lz4HxAvSwRHH3OBBrmpF8h3SU4va0cKZuQM6KFGg35NdimqnnWao3b5qw9PrAVY+CXG7jQ4i776rY
	PsGkA/ZiidknjXhupC922Ux71q6WcAExQg+pZDI5qYDQTiafilBN6E+U5EXNadJ9Gx+Lhg6ci3F/g
	Sp2LxSMMp+huIDuDhxiI0m0UBxM5huG3Koz4Xm/08kBQjnNa29k712lsOVJyRDAi9U6Mn7uJfBA00
	p9S8qGjngna+0a7ScZliSqHoVqino7orKwf6v2gf04tslAryGaFqdY0KCnCfdfI6uPXm+gI97Z5yx
	YKHY/9Kw==;
Received: from localhost ([::1]:28882 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jmJ5z-001Qx2-0S; Fri, 19 Jun 2020 15:38:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45204) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jmJ5t-001Qwv-2i
 for samba-technical@lists.samba.org; Fri, 19 Jun 2020 15:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=H6KdPddEFEOG/dvOcvhjgMvCXFvE7cD0KiK5mg2ifb0=; b=k41QnRxC4COriWZowOPFPn5fqU
 cUEi+svJTP/1tdWKUdzYqIgZ+AksjxArCdaJCQVidh3wQhusNHPYG0/Xk8JAmH6U6Ix7mol2MoSUH
 uevPEnxtzpnvVsltTWLZfOWmF7IbAuqxlK46t4PPU0gofu2BzV/iXcQQH8XYJRdJxk8On34CCv7U5
 HCjTgy+DvnKaIduGl+ynq1CDd9G2OgzTdACi1EGQLinQV1paZ4Hm+Bug3b8yhih5/mG4Osj3k4BB0
 buH4OiADnoDfxi6Yk0rRtK1/c9EsrPTRbxbObGmWWrycuHCwd7PWqiHYZbW5mNSRIbBX0ADontBwY
 6weSha+mYsB8UyKFdkM7jCl5tJCkGAaGDmW+5o/bSCjVVsttwiohheAyDYhMrmn33XUZLtvkWmccj
 7S0XGlJiHILWki3rGFzWRlGJ7oDWo6PMacUm1uIhzVq5k93HvnpmX/JyoUfMvlRrw/NEjcc9z2cF6
 WP0s6bDbBXDvPJrZDHdlAbsF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jmJ5s-0006C0-H6; Fri, 19 Jun 2020 15:38:16 +0000
To: samba-technical@lists.samba.org, jim <jim.brown@rsmas.miami.edu>
Subject: Re: samba.tests.docs max worker count was: [SCM] Samba Shared
 Repository - branch master updated
Date: Fri, 19 Jun 2020 17:38:14 +0200
Message-ID: <1780362.zTFG4TRhrx@magrathea>
In-Reply-To: <ac6f6687-dd7b-2b1c-3bdf-9a182222740a@rsmas.miami.edu>
References: <20200619110010.02B25140341@sn.samba.org>
 <ac6f6687-dd7b-2b1c-3bdf-9a182222740a@rsmas.miami.edu>
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
Cc: jim.brown@rsmas.miami.edu
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 19 June 2020 16:07:53 CEST jim wrote:
> If you want a minimum of 2 workers then why do you allow a result of 1
> worker?
> The second test should be '< 2' and 'return 2' to match the limit of the
> first test.

Hi Jim,

thanks for the suggestion, I've opened:

https://gitlab.com/samba-team/samba/-/merge_requests/1407

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



