Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8DD86D63A
	for <lists+samba-technical@lfdr.de>; Thu, 29 Feb 2024 22:32:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=gTDxuGmmrH1Fvg3Xtr0ILmYk/HfOFw9v+naPSENz4Cg=; b=0t4HXf2dvf2MRH1gj0Z1uzAseU
	YiviK7dhxCmrJd3tJrT2UCdgxDQ9v3tv42ZBAoqRpsaOMcCm7sVFbWbMFKy6DLewlmXIvrRvA2Jno
	SIcEcyUULljBwPDSyX70Vm1GZiJWwW7NNC8bt3qHlbzDtCsOOnSQX7OTVOLsrPX1aDHL1WtBQMLae
	+WEp9pUM1LAosmukOtcL0tVF1Q6C7K8ZosO4JbPkjTVuZLaakK+/wndXiKXvjv6mWIi04765j8x2h
	67G2JzAUKRGx5K2ToAMFx+25h3qEkytdDQt+lBEAkMLacfSeWLUNFNTUs6/Hx6JbinouuXcbHtTEs
	SjykoPpw==;
Received: from ip6-localhost ([::1]:62010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rfo0Y-009kB5-PC; Thu, 29 Feb 2024 21:32:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49792) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfo0U-009kAy-VK
 for samba-technical@lists.samba.org; Thu, 29 Feb 2024 21:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=gTDxuGmmrH1Fvg3Xtr0ILmYk/HfOFw9v+naPSENz4Cg=; b=zNiJ7moP6UUdxSkiOYeoGE4Xbm
 ApTnGoqt5qqU9JApSTAla66bfojDP5RCsyKfo6T5+kdIZsyTlG3DRHWS2/MlLsGj445d0KX3Vzydg
 eAq6kf4mf18Oypi6DQdKkVpFMrANAjZ9gL1c/DHrN0PVIffy+v90cJ4T4jUjaPQMIEBNQSc6bvHCD
 yt50cAHrjXcnhcUCgdfO2tw9FCN3O4CUmDU2iVyHtuOZ4VC29YsHDOQkxYVwTplCkuxWt+mn/f0OF
 dvSiT8YYviCHKcaMMs+93Upbif6SG3mcpyDpN4VocvBo36DZlgMO+yWbJyh+gZ5Dle6nRjV3y6tdJ
 5Hq+m2QqjbZFh5zsh5unRlTi6VpCzrYAQy/Sz/em0JOhDqDiaHdaQVoAwhRcF40JUg/PoH6e0Dp7H
 Qh6zGMsAlcOZMubxABpbU3pUNl6HYxtk4Lxn5zRRjcOkcAXRax04/IZOChntkN/VxQBKPixaDw5+u
 SSMj6rH1SQV6D5tWXgiUS33A;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rfo0U-00FVXf-0Y; Thu, 29 Feb 2024 21:31:58 +0000
To: samba-technical@lists.samba.org
Subject: Re: Regression: ldb performance with indexes
Date: Thu, 29 Feb 2024 22:31:57 +0100
Message-ID: <26313942.1r3eYUQgxm@magrathea>
In-Reply-To: <975d227206d53fe93ef5cb5a3561f5363eae1832.camel@samba.org>
References: <2223722.hkbZ0PkbqX@magrathea>
 <975d227206d53fe93ef5cb5a3561f5363eae1832.camel@samba.org>
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
Cc: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 29 February 2024 21:19:52 CET Andrew Bartlett via samba-technical 
wrote:
> On Thu, 2024-02-29 at 16:36 +0100, Andreas Schneider via samba-
> 
> technical wrote:
> > Hi,
> > my colleagues discovered a performance issue in libldb:
> > https://bugzilla.samba.org/show_bug.cgi?id=15590
> > 
> > As soon as you use indexes, ldbadd will be magnitudes slower than it
> > was before.
> > Could some ldb expert please look into it?
> 
> Your subject says a regression.  What version is this a regression
> against?

Isn't that obvious from the bug report?

Here is the short summary:

$ bash repro.sh 20000 indexes
Added 2 records successfully
Added 20000 records successfully

On Samba 4.10: 0m01.231s
On Samba 4.19: 1m30.924s (that's 90 times slower)


> The very nature of a DB index is that it will take time to create,
> possibly a lot of time, but should make reads faster.

Either the DB index doesn't work at all in Samba 4.10 or there is a huge 
performance problem in Samba 4.19. What is it?


	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



