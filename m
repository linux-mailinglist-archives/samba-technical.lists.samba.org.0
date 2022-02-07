Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 592FF4ACBF3
	for <lists+samba-technical@lfdr.de>; Mon,  7 Feb 2022 23:19:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=ZuTNCrqsRjiug+7NuGxJgf6fNmuyDijYq7ZSQKWg0nA=; b=aJvLHwA4eH0z7e4m+y7vDmjFRF
	3o7QYq0MUyVq5g3+zyYZLzTip0XSrX4kl3M/GmD2xA1N3+Y+0ugEyOZAmfSbtErvzc8ZbMV3Qi12k
	+TlzmhYst2xJFyVmqPxVbFIV/NeRETeLq7PDTg64Ia1/aRd+3mTE7tTyxE+lrWWFXVIxIIchyjaGH
	Wt9d60mMTHq5kd9gBMLSgEuXhAUaDalree7cwPk9W7nTauFDvxch+u8xRUwP2aafmrDvCu84VWw8a
	ASQfHNRRN8ycgdXUpZHLzhGfGMIEfD5NQfXTKUXgJ258gTStmRIMSxT5+urfJ8o8SkNzDx8cwAzgE
	xxwCwntw==;
Received: from ip6-localhost ([::1]:53708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nHCLQ-005XDR-4C; Mon, 07 Feb 2022 22:18:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nHCLL-005XDH-28
 for samba-technical@lists.samba.org; Mon, 07 Feb 2022 22:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ZuTNCrqsRjiug+7NuGxJgf6fNmuyDijYq7ZSQKWg0nA=; b=cTnKXH2fYsMniSyQR/CQlQOXUs
 9nN1Z8DJ69hoCbRRlFKNtzruj/UWomRWUXSCLcOWWYSkxZDevL8vB2jlMSXSUNctAy8lM4TW7vjum
 6aCQr+yo5+bRK+qUDRTjOj+MjbAP8C5711dkYOsjNyE49TcHS/PAdMQs6vqrkocS9j5pcCzQa8tb1
 W71fIAJDiNY2e1N7PLuM0q8Pfz/Eagt492tm/BoEp8sJhOWzn6bM/DZhGGKv7azTzFBDsj8u+o9Qr
 DdFQCsnRAazYD6yWEjb25inrhSYJ5nd6T5qGat9koTTZmTsezCodxUkjhbTpIiH/5z12JXK/jH1R+
 5/QaCo5LN9uxr7469waXorC/QTbmcMP8slf8J1Sw3s65G/mymsA7dVlm2VRhO6EiQB5HLUBmRieBM
 uOBu8vPEVJuTtYrNHQg5AJGJQm5LZb62JdA/HMRQMzKb8YB9emLpOc/Xl5DivhW8izxRbgaUUvKaQ
 yTzUZ8ZZKWQU/pfNIelOu+Uh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nHCLJ-002bZo-Dg
 for samba-technical@lists.samba.org; Mon, 07 Feb 2022 22:18:42 +0000
Message-ID: <93b98d9cdb3bdfb42fc4c0745c2d39d28d9a93f3.camel@samba.org>
Subject: Debian Samba needs help
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 08 Feb 2022 11:18:37 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
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

I don't need to tell anyone here that Debian is an important Linux
distribution, but it is worth remembering that improvements to the
packages there also help our many users on Ubuntu as well.

We all know well the amazing work by Louis to package Samba's currently
supported versions, but this is a different task, more about supporting
the base distribution. 

Our users in stable distributions could also really do with some
assistance to ensure that security and high-severity issues are
addressed in a timely manner, but perhaps more strategically there is a
big advantage in ensuring that new distribution versions have current
Samba versions - so they can benefit from upstream support for longer.

So if you are a Debian Developer or have Debian packaging skills,
please do consider and see 

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=814382#52

I maintain a presence to provide advise to the Debian Samba Team, but
I'm not actively maintaining the package either.

Thanks,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


