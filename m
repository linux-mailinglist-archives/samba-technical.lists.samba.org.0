Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C052ACC14C
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 19:05:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qYWboYmBeEKw/dWcAoUvRE51abgE4RC3+PaK2VuKTTU=; b=YEwFTw7WIY4MbODzmKMUumbxKI
	ffMccjZI+URgo5GQ9403A+7TRgrGywtfkIwwlT1ZSqMTgQW6a92f3eQiDsNfGXXL1FRb5cpDh1et0
	80/NzDx6Cz7EqigvmvGer0yF0Zlj4tmVhlLAXvSMaj+1X9BkT+Pdn5lzuL/n4PtI9p5RPYpOcgR3b
	u+4WY2RhXDgHuBwE0yQ9M9vVi06SsEO0qQjw8E790Zj/ZwS4vLFeEhJbBGUzrNkUVrP3C/D6m9bPI
	Nq7Ntf3SKS8OMYG8y8kJLGT5GC/kwxBPAZEiZPOW7Q8Z/wmNplJC02ImaLCG5T20HYQ8pHKtk09RR
	1OOoiCAg==;
Received: from localhost ([::1]:41854 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGR05-001DMu-Cc; Fri, 04 Oct 2019 17:04:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26686) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGR00-001DMn-BX
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 17:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=qYWboYmBeEKw/dWcAoUvRE51abgE4RC3+PaK2VuKTTU=; b=BUbeVANAGt62vTfJomGpkcSiVd
 XbtAjd0xX5DvmYgpEe9Z1wSvOhpTWkKFo7ykhooAuFEcMpKXG2cmcThm8bwc0Izh+IQkURNRLE5az
 WRxdB5HwE5J1iki5Q13oHV+xuIxvmxkrLuzMOS+jW+fswkJevKcUZHGMhMXblW05nQG8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGQzz-0002JK-Jf; Fri, 04 Oct 2019 17:04:11 +0000
Date: Fri, 4 Oct 2019 10:04:09 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Has anyone seen a Windows Server return zero results to a CLDAP
 query for NetLogon servers?
Message-ID: <20191004170409.GD159071@jra4>
References: <CACyXjPy5LL=yj6i_T_W0J=DOXHxHB_D=0-ir60opyEV7ftaQ=g@mail.gmail.com>
 <CACyXjPzDX=F2BJX3N7PNMGpTmZCJZ2NU4O9B0uBvyLVKSaQi=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACyXjPzDX=F2BJX3N7PNMGpTmZCJZ2NU4O9B0uBvyLVKSaQi=Q@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Oct 04, 2019 at 06:40:22AM -0700, Richard Sharpe via samba-technical wrote:
> >
> > After that Samba seems to declare that DC as a negative connection
> > entry and cannot find any DCs.
> >
> > Has anyone seen this? Does anyone know how to configure Windows to do that?
> 
> Hmmm, according to the following a DC returns such a result if the
> filter is invalid:
> 
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-adts/249949c1-484c-48ad-b548-a31dd0ab2c93

So the relevent question for Samba is - should we consider that
a negative connection entry and add it to the cache ? Or just
drop the reply and not add anything to the cache in the hope
we can get a better response ?

