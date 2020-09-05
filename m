Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A89E25E584
	for <lists+samba-technical@lfdr.de>; Sat,  5 Sep 2020 06:32:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=pwAJiv1sQXVBllKO3R5tXklAsmEFSHRTwqQLIQ2I9as=; b=nb+z7DmbGAd+klPPjlTi581oLt
	PIe/iTeBo026kGzc9+PCLx2j9OCZH4BCEC6rd0B68wAeHXJxLdtizlfPOXMCg1RcbNd84sXlExYQQ
	Aq4n8KLD5Nd3PaNcOdIzNDmc9I3yliKAzOXtHixZ8lk1zCPKuZ/SYMNf1fWh73//0pfOLifEOMb3W
	YbQqdcF+PZkXnbrXowsn2oCjByI6Cem5y33mpxh1GvTzjltzEfiarCPd8QIvpOdYnN8JbbCPX0ZzC
	/489sC23gH4q3lvIM4MU5X02a66umANBOhdIAZQ00iWIfX3eK5NtSl9lf2sEbrMQeGh2ATOOgf1Vb
	InCrIumw==;
Received: from localhost ([::1]:33646 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kEPra-0045mE-5Z; Sat, 05 Sep 2020 04:31:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49582) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kEPrT-0045ly-OF
 for samba-technical@lists.samba.org; Sat, 05 Sep 2020 04:31:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=pwAJiv1sQXVBllKO3R5tXklAsmEFSHRTwqQLIQ2I9as=; b=UVKzK6sTyIQ+GDHOmpLloUnzPb
 Gjm6gN1AXelRu+JPHJgwJCVvkW6U2fgR3bOYKECdG8g6vT4+6kSOlJUDbWS7zxQ83zPIRdbcXHdNp
 S0XIiilV9YCgrVMxicfKK6+W+i57m1DREo4LRczK+8/wYXk7BphYsBskvJ+mYuHdR7gK/MCI7o3I2
 1oBUbqU9oAiMtR/O5nT3vvE8YJhafKL/s45sULzVGzndndpfwZG+qN4Y/epD2y1dr5lluZYsh2bjo
 QNy/uyBdUPpojqj3aK6/435N3Sn2HS4Eo/BZR9gH8h+yIjhfkKfbez9vdpB0FrdqSr4zFcJmKR32n
 X5BoO7pCfXOtG63VBpPWy7WcleN+nYlr17ITiDaTKX2KtvSUjLXQ4ELoZwJiQDNw6U9CxAKnEpNRG
 yola694ASaGxfvVUoY9h4UKOJmjsjKMATnN8ZLEuEFU8ulfHWtDGs+/ACsBt+7bNBTWChpPauETOY
 8TAmPam8EIsG8fpe/bqiqHC2;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kEPrS-0001ob-9r; Sat, 05 Sep 2020 04:31:34 +0000
Date: Fri, 4 Sep 2020 21:31:29 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Drop Python2 for the build?
Message-ID: <20200905043129.GB289359@jeremy-acer>
References: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3abac97b731ed0d37ea4dec28e2792128f527dd.camel@samba.org>
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

On Sat, Sep 05, 2020 at 02:22:34PM +1200, Andrew Bartlett via samba-technical wrote:
> Just wondering when might be the time to drop the python2 build?
> 
> This came to mind because David Disseldorp recently had to adjust build
> system changes to cope with python2, so I figured it might be time to
> revisit this.
> 
> March 2021 will be 12 months after the long-delayed EOL for Python2 and
> since we made last made big decisions around this area Python3 has
> become available in the default package set for more platforms,
> particularly including CentOS 7.
> 
> We currently spend CI resources building and smoke testing Samba with a
> python2, which we could save, as well as the (small) complexity of
> targeting both python versions.
> 
> The simplest change would change the minimum python to build Samba to
> 3.5, the same as we set the minimum to for fuzzing, or just 3.6 the
> same as we already require otherwise (this would be better tested).
> 
> As background, the first Samba release with python3 support, 4.10, was
> released in March 2019, so if we did this for 4.14 this would be a two-
> year gap.
> 
> What do folks think?
> 
> Importantly: beyond Linux, how is python3 platform support better now?

A cautious +1 from me, but I don't build on FreeBSD or anything else :-).

