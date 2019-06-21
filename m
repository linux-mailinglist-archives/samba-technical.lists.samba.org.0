Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D94EEC6
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 20:28:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=UKhRIgAYEfZr/FRHhY92Ph4iHfFIa2qW4DP2bJCJvp0=; b=4F7j0rdN6r9dklmPUxATvhK5pB
	sSm0c/v44q3SbCGIM0TtGzX9lroRDqADgA9ysY5bsGrmiWBWwl0WAHQyMOJ/s5jgXKX4A9rtiZtjf
	DbbF8JDoe8nCmpXsdhTQCBXaG3l0IZfYXwdC/zKy0uA0eZSjW/cLlZEYe/mfDdKL94UNH6xH4OfRY
	itTqE7JzTCIcIlDL71WLvu/GYSLsz+Rk0yPQRf0K5wkDv2jCrwKsZxFfRMV0BqOiA2PdzA6TyjlJ1
	n8Y/6JPpB8HMQovQyp6z8ugP+u0aolZ+yJYeqonQ3TZUrXDwQc9i+EjRItw/kZFcNnxEgcx1uZylp
	48RL+pAg==;
Received: from localhost ([::1]:41648 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heOGh-0014f7-OX; Fri, 21 Jun 2019 18:28:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20888) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heOGd-0014f0-VQ
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 18:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=UKhRIgAYEfZr/FRHhY92Ph4iHfFIa2qW4DP2bJCJvp0=; b=fQrZAkCf/M8l/ELDR2Nw67G92V
 yxnZXV01gtgugZfAREluPIViYCx1NspflXr3mdtdtvT5tqHdsfaL+puNysag+wkkn/IB6J5CGub7U
 fFyoe2cxEUxfH5uR1GVZdyU5/q0scWL7TF/n0mPAae2iXVn8Lr7M6p6/zH5HnwZgg6+k=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1heOGb-0007n3-OS; Fri, 21 Jun 2019 18:28:06 +0000
Message-ID: <8d6f3d4789e15dec9863c1eb9797497892dafd3e.camel@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Christof Schmitt <cs@samba.org>
Date: Sat, 22 Jun 2019 06:28:01 +1200
In-Reply-To: <20190621164357.GA10488@samba.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
 <1561082290.28284.28.camel@samba.org> <20190621164357.GA10488@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2019-06-21 at 09:43 -0700, Christof Schmitt wrote:

> Hi Andrew,
> 
> i might have been slow in adapting to gitlab, but my last patches
> went
> only through gitlab. The quicker feedback on the autobuild results
> and
> the verification across different Linux distributions is very
> helpful.
> Right now i don't see a reason not to use gitlab.
> 
> Christof

G'Day Chrisof,

That is great to hear.  Thank you so much for the positive feedback!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




