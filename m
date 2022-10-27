Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27360F572
	for <lists+samba-technical@lfdr.de>; Thu, 27 Oct 2022 12:39:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=eVAUOf1lqNG+FvJxyXQKiS5GM4qHEK2vRGgDeyWYA54=; b=xmel5qzksFZyofUGP5PevlSiUN
	MgnyyN8gfgNCLilLqiJH/5obGBlInFOeZviEKtxiqjM94DZZ8Jrr/iHrtVLKXrJa0fa0hSH90Zdfs
	ZflDpdKjAC4zXZbZxYjGRY+hBN4FTR3Ig2IypTxBCXo7sU9MhZX8eOPLiNxzmv5+qBnwTDtoUGs2/
	/QaWfsJLSi/KIkS7nza3ltiK8HqWTr0YT06TOB7Da/QXqiAQJxdjGzXXMU5zCXH0j6VPsEoWBssft
	2v8fpPpuvpGYdYln+rVAX2ERlE4pISpM5teHjnbT7g71yEbF1dRrjbvpkmvV9jf/rpWmpAbLnVv1s
	ashA7Csg==;
Received: from ip6-localhost ([::1]:37100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oo0Hf-006NGa-0v; Thu, 27 Oct 2022 10:38:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48746) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oo0HZ-006NGP-Uh
 for samba-technical@lists.samba.org; Thu, 27 Oct 2022 10:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=eVAUOf1lqNG+FvJxyXQKiS5GM4qHEK2vRGgDeyWYA54=; b=aBSKLY2dGXh/AsXMSTjvBjx7+v
 gJdSIsLua6P2LnqrTliluPz4vMdhG0pNqnOEFKurawfOgvyO6Zx+nSBS8SJFjzG2gDgpx1n6WytNY
 Mpi0On4LTohr7f8THt9lK82LTMtrtjb4CwFa+hRX0aGdsORCx/WGyjXI0xBLsO5waUGotFP7FXYi6
 qqrNN2+VleqnC3uNdKjwZUk+mYCpu387aByy0HHdU10ecCNoAbl9J54hy47Bystuuu72JmHYIcQFQ
 1Xdme72KTuywZfQoyyMu1BzWeYDxeiFozNaJ3AKVd+vmf3QhPVHVu0+ejV3PxVCAWraz2zHybPJWP
 ZebT8Pv3jzSmzmcdfBEsdqgjq4ZM5q7Hxj+Uy2deuEF8FO9IvYip+nIfdg5BNzgogRdt81iBjSHOw
 4tkPxsagP/1iRDxYmT4W8lEmaXVtzfxPyPm0e2yjW2pD+nC66v9GFT8tuGcA7SKpuMR5ao64zj82b
 tA2kqwZWcCQw4hyFF+VEUjnG;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oo0HZ-00618c-2f
 for samba-technical@lists.samba.org; Thu, 27 Oct 2022 10:38:41 +0000
Message-ID: <eca6131a-3c87-d4e8-963b-e00f918e9d67@samba.org>
Date: Thu, 27 Oct 2022 11:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: Upgrade AD DS from 4.9.5 -> 4.13.13, cannot resolve usernames on
 member server
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <6611f3fb-6ff-565f-c3c9-9476c33fb31d@arcada.fi>
In-Reply-To: <6611f3fb-6ff-565f-c3c9-9476c33fb31d@arcada.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 27/10/2022 10:57, Harald Hannelius via samba-technical wrote:
> 
> Hi there,
> 
> I upgraded my AD DS servers from Debian 10 to Debian 11 bullseye which 
> also upgraded Samba from 4.9.5 to 4.13.13.
> 
> Now I notice that I am unable to resolve usernames on the member 
> servers. I have only numbers in the processlist for example. 'getent 
> passwd "DOMAIN\harald"' doesn't return anything.
> 
> Did I miss something in the upgrade process?

No idea, you haven't given us enough to work with.

How did you upgrade your DC's ?
Did you upgrade them in place or did you create new DC's and demote the 
old ones ?

What idmap backend are you using on the Unis domain members ?

> 
> Now when I restarted the smbd, winbind and nmbd I am unable to connect 
> to the member server.

Sounds like a possible dns issue.

This isn't really the place to be discussing this, you should have 
posted to the samba mailing list.

Rowland


