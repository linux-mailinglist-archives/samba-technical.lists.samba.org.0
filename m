Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D17202A6E9F
	for <lists+samba-technical@lfdr.de>; Wed,  4 Nov 2020 21:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=k3kkgtwVYP5j7UUrPGL2OvcYjSEEtkYBm0tDm0/FgSI=; b=qKsHoBSKg5tMtQKb44XPzWbG2S
	QWW62/Ka7TffMm7ROx7JY+3cHB73KfM4fbYzOYbXNrlRjeS/YFaG94DP4/c1/POl32YaVbKM2G4UB
	9KhAnrgX/tZP58YSGTwz5pkdFDakkcanLakmb8GVfUiOD/K8zkTXG8Zo6iZZUVV+indE2Aw+5O7Kq
	RYh78ThHcWweCoI7IGfLQOgR/rr82clCDzzhhGsYav1BsBFjAKxpERl0EKIos+2fRYITbEwWzoXBz
	W7+rYMM8PReuOIZp5a7OD9L5VBwpupM9pM74AaXVmuHeL+92vLIrF50vCJe3DsA0NJTiPNUTX/6AY
	iDWLTLow==;
Received: from ip6-localhost ([::1]:18912 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kaPG3-00HVod-70; Wed, 04 Nov 2020 20:19:51 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11948) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaPFy-00HVoW-C0
 for samba-technical@lists.samba.org; Wed, 04 Nov 2020 20:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=k3kkgtwVYP5j7UUrPGL2OvcYjSEEtkYBm0tDm0/FgSI=; b=TtPa1NIGm8e9/bFMKczX2p0mEt
 y6wtKA+PbtRDmxV0DnXK4NuFR+NQZ/OOj95+BHNQ9Scv85jvZ8ROWYQ/YwYqBsDP56B73OmPkMntL
 vXOQK2p72JjUbCAQTZYmjUyWf45xSUWhXICNCwRwyEq2MpieFdprpj3IGnlOKPLC0RpYfhcv7/PXe
 LUz97sUhS4dM1UDsfiIH8YLe45UyYdksPBSINN3FvpYJmSB3LxwaajyhYzIYDC8Mdy+62FSxq1BgO
 aOp1HEM1twDF6s784wmwWOsP5UBoR8FexRczzktUEnqzPHomhnfgOSqV2a3JPFy1JKJCf6o7Fmb1o
 D4ygnFxIg7/c+bDpoC+HRcSZseC/n7Yizy98nX+3GXAQZM+6S6JmXgIRZRmznJ4IDFc+b2ctl6Xar
 e/s6YY3O7ydU/+m2pTYoBGQm0YSpqhfsTCWzRhLqbALjOSNEJYhhfIJ+b/LiwJn7mvofZCvGGIRC4
 m+8RObgWG0D4M3zlLcQ16OM8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kaPFx-0002T2-FU
 for samba-technical@lists.samba.org; Wed, 04 Nov 2020 20:19:46 +0000
Message-ID: <044df969077e8ca222d3a8d2a0d0211b6d34d287.camel@samba.org>
Subject: OPLOCK-> CANCEL
To: samba-technical@lists.samba.org
Date: Thu, 05 Nov 2020 09:19:41 +1300
In-Reply-To: <20201104183403.GA7355@pinega.vda.li>
References: <20201104162403.E338C14012A@sn.samba.org>
 <4a335431-8128-36d8-5d6c-463cc7632c66@samba.org>
 <20201104172320.GA571436@pinega.vda.li>
 <a0015fc8e58211b1885b2fd515f9321296d17d76.camel@samba.org>
 <20201104183403.GA7355@pinega.vda.li>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2020-11-04 at 20:34 +0200, Alexander Bokovoy wrote:
> My autobuild failed in 
> 
> UNEXPECTED(failure): samba3.smbtorture_s3.plain.OPLOCK-
> CANCEL.smbtorture(nt4_dc)

Can someone (else) please look into why this has recently become our
flapping test of choice on sn-devel?

I've hit it a lot as well.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







