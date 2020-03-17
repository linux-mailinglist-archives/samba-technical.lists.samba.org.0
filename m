Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D61891AA
	for <lists+samba-technical@lfdr.de>; Tue, 17 Mar 2020 23:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=dzWt98zC0p4bF/75dzVngxTyyymWpFiw/RnKCx3889w=; b=SAPQVJf4WRgr4Gxem5RqqUJD2A
	iuP0CDckMj9srVtEEvCX/ekU2wJixXr8QpOJTzhNluLbHIZpRDrAYSQ6SmMepfRhS8NdUqjb9lmKD
	UPBctLYumAsBYrGC5BnGXr2+Xvy4airllQMI8qaXKWmGOBbEh7Qof4O5UsKLcnn4Gr7acZczG6vD/
	/w5ZczRLh4y81QE+0G/Bj+rhb2a5w1pGdH+u1Z7rd/5p7lHr5zxNrJtwQ7W3AatBtTHomhkwCZcxx
	iT65yRfRywBcq0C7qW5vZUIkWhR5XCY0n7Ed1m6EGvIK29wRziJh81c7Le0IB6Sa0K/foo159z4nH
	aHaBXMtg==;
Received: from localhost ([::1]:26540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jEL92-000GSZ-A4; Tue, 17 Mar 2020 22:57:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46242) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jEL8x-000GSR-B9
 for samba-technical@lists.samba.org; Tue, 17 Mar 2020 22:57:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=dzWt98zC0p4bF/75dzVngxTyyymWpFiw/RnKCx3889w=; b=vaoPG2HD2IvcP7iIL+aoa+YI/5
 Ouyr2jG5l5TxMTiZc8jpNW57q2LC/pUmK8tRZlozHOj545NS+K1wNburH3Yu+8EJYbwThAka5PzQp
 zsXstujcIs+EqlRlLzIzz1N4JTYUN4eQJ+QkF0VsILqCVJDTSHgLgkanbxt05tj5xwDykTpWSa5j7
 TRe0E/x0+Tuqr+6kFgVlAjdj0VJM1jJ+wtnkfhTQPuzADs3XZNZLReYj8ICu0MM/4bdOmkoVnPmYW
 JwyYcBisBCJzyrLTz7fu3TLS2brLiktDagyM9CHxyuvBy71f2TrFODcbGlYaMycNh0iCPwWT5+7nw
 6Uc5uTWVc87vodH0ZvbIr4pKZ52NCi945jR/VYzNTvu+zs6SVRc8y9xa8/Sgrrv7L7wI4u8wuFKyL
 Pe26A8etcyAS7xyZj52yaczSXJRaNp1KCIRd/LWYu4HLoIReaPtzfuQ7xkRtfOong4nZ51K5a0q8x
 S6sKLOXdaAeP+mpCDZuL/Tvu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jEL8u-0006im-5a; Tue, 17 Mar 2020 22:57:00 +0000
Message-ID: <9f1bf5c1b5451967788a77167bbc840e78ffc49a.camel@samba.org>
Subject: Re: [Samba] Make/Build Error on armhf
To: ArtMG <smblock@artmg.org>, Art MG via samba-technical
 <samba-technical@lists.samba.org>
Date: Wed, 18 Mar 2020 11:56:55 +1300
In-Reply-To: <c64556c8-9b10-4d9c-8536-c087d5481036@www.fastmail.com>
References: <0a4f01d4e99b$791af700$6b50e500$@laurenz.ws>
 <vmime.5ca5f235.56c2.3109a1736f468505@ms249-lin-003.rotterdam.bazuin.nl>
 <0feb01d4eb7a$cffa4590$6feed0b0$@laurenz.ws>
 <af43e77b-49ac-63d0-b959-63603fe1c718@gmx.ch>
 <c64556c8-9b10-4d9c-8536-c087d5481036@www.fastmail.com>
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
Cc: dariuszb@me.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2020-03-17 at 22:18 +0000, ArtMG via samba-technical wrote:
> Great news! I had this issue with 4.11.5 last month, and I have just
> retried the build with 4.12.0 which passed just fine, with little
> more than a smattering of deprecation warnings. Well done, to whoever
> :) Naturally I will let dariuszb be the judge for his bug.
> 
> Re AB's comment on bugzilla, I can confirm that I have made NO
> updates to the toolchain on the device used since building, I merely
> cloned from the --single-branch --branch=v4-12-stable and rebuilt. So
> the fix WAS in the code and I am happy to run compile tests if
> someone wants to direct me to potential bisection point branches.
> Cheers
> ArtMG

Just use git bisect with 'old' and 'new' if you can.

Thanks!

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT - Expert Open Source
Solutions
https://catalyst.net.nz/services/samba







