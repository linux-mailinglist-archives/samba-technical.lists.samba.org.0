Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBC78461C7
	for <lists+samba-technical@lfdr.de>; Thu,  1 Feb 2024 21:09:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=j9u7bwneJ6E+kvSJDr3Uc4ywAQAcKeQYROQiFMmsUW4=; b=d+3HtZ79wn/4TYrBEDGAW2IeCH
	elNLYuhRudnM8HADYOErCd2/rxvbkuPaUXNWehnlycfEqXmpchNNIiCNUIqE1TDy7kORQFxABh/B0
	P6M7q6RZEm17ErjMvrJ4+AnOT1LG/yO9hVTkwFGs7Ks5XGIVAJ6E5ZPSQFzb9YStzX/+EOJCFos4i
	aboPREhFJq4K+8x1iCkTnJMfOZ2ly7iCB7EbQV7qsmUTS+mqcJnxViAekaKt6ywcyExrwSEPoGQSG
	BXJPaA16amgS7i9h66Nn509277RFpqchHKSqANwbU4uEM30i3djHp9EHzqyvULNtjkHha9wKpDL7g
	pQMqagBg==;
Received: from ip6-localhost ([::1]:21386 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rVdN4-007Ili-Bx; Thu, 01 Feb 2024 20:09:14 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44914) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVdMz-007Ila-Oo
 for samba-technical@lists.samba.org; Thu, 01 Feb 2024 20:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=j9u7bwneJ6E+kvSJDr3Uc4ywAQAcKeQYROQiFMmsUW4=; b=hAdC9vUB1bhC/4A/fWgVtI6tir
 i5yZEF1/SLeAoloMaGaZEzNWWmEduQatj1EuKV/Sqxsi185mw+molHE5lp1gpjfIuIVeRstXn0VLQ
 ScGZS6zXCzrX0vY9ERa27zzL7o0IRETvyGj6BOiZbBG4JDvHUlfuR1RpVzFvgvW3F14naDyS81ujf
 aTgX3A/LkFoZeSAKAnYRyA9SNTUfhu4Xdv6tN+4uT1gbu4YZg5m9g8ygYVIPd/rI84CaXV55cFLyZ
 wMEkGvi0SibdTFMBj9rmurj3a6fGzUXfApPwZzhUqsbifV+xWNpvo9ABMKXEA/dzQc6kxxmHRD+wI
 MmFXdiEqV0MRXgk0C06SUeN/5DTtE/+AG+ZQOBXU0+d8PfZUGD18IjBfYNpM+c49+TbYz3iYAquFs
 bxQ2E44ARG/JVOTbjRvK7Ov9ROLylQgViWgI950pm04mx7qlt15Wpl7czPhN5M0Ojrf3sJn1JvsUj
 be/bwdJVZt8rk8LxZmVqm7sG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rVdMy-00B4kO-1B; Thu, 01 Feb 2024 20:09:08 +0000
Date: Thu, 1 Feb 2024 12:09:05 -0800
To: lukaro <lists@lrose.de>
Subject: Re: State of unix extensions and symlink support
Message-ID: <Zbv6YVRRuyluQM3i@jeremy-HP-Z840-Workstation>
References: <2c310e00-84ac-49d7-88f4-e742d9170088@lrose.de>
 <CAH2r5muS+w+pv-32pYhui7yyvitdmCgbkfZdmbTyo3ffOHKpqA@mail.gmail.com>
 <B3566794-B5EE-48C7-AEF4-EC9E9477ADA4@lrose.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <B3566794-B5EE-48C7-AEF4-EC9E9477ADA4@lrose.de>
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
Cc: Steve French <smfrench@gmail.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 01, 2024 at 08:41:14PM +0100, lukaro via samba-technical wrote:
>You're right, mfsymlinks is a workaround, but I need the symlinks to be symlinks
>on the Server as well.

That creates a *HUGE* security problem and a rich source
of future CVE'. Samba will likely by default not implement
server-side symlinks created from an SMB3 client.

