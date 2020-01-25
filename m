Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 234C314924C
	for <lists+samba-technical@lfdr.de>; Sat, 25 Jan 2020 01:22:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=4iJJPPykQInAhPntkUSB4+0bwjPciU2J3zQI+Kmwfcw=; b=yH7iu81fMhGZMMA4C4xZ2EkSMQ
	WuhQnZL1s2UzlGipB9eOpwl0U4VzIdtm9+wrEhPuMdfhMasG5x3SgJq1t5LSOyVbWyt9ruipu77n8
	OQVptXazsOZo3qz0NTRYEmZous2bXRn5QRCCNc4nXRlJveTmw5EWRcYhPz4KWImEQJNLowh5OuQK2
	uUV4N0GwcMu2eMiZk0O2z9fN1Z4EMOmvDqpm+2sH4Bb2/Ve29dca7xdSbRX37c/pUBW8E23KPvM1H
	+o1YSoLLUclx2dMv85NyeemdFPL1CoMiqqshFW0TwwCt6OjksoArzbJxeG2ipP7vvednsqWuHl/oa
	lyXhuOtA==;
Received: from localhost ([::1]:20378 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iv9CL-004g2m-TE; Sat, 25 Jan 2020 00:21:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18018) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iv9CF-004g2f-Rf
 for samba-technical@lists.samba.org; Sat, 25 Jan 2020 00:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=4iJJPPykQInAhPntkUSB4+0bwjPciU2J3zQI+Kmwfcw=; b=DER5+OLHRQPeJ/wiPaPRvsVIA0
 4P9Df3IXaLKcNE475K2NdtjyXpqp4hig0d9umKS7VwMVLSiIqF78vEj1hPje07rzpovBMFlqqgIM2
 dakIlnALiYF6rtZxFByLuyHMJkBBCBZMl76grxPs7XCB0y/06A9ad3q6pgsDYB0CmGSThpefZF17t
 cO/ZbFrgYo0hFVM/SqAGueSKOjNduNmETP8neAsgAs2fYQk77YP6eVqnqHWTwajDC0NYPzaNOclj3
 PcFdtJXy5F/v+zsswR1GOf+t5g4oIyVChv4UQ3lwI7hlUQ4oFMub1lEdJeZ2YHr7+1I4AXoriL5ry
 /GaxUaH8e1y0jJZi8R2z0Sfd94QO6dnV6qkqz9vs2HiUaTDt70ruSIU3Y4KVr/Zq3cIrGH7KDNDk7
 D4yE3Kz9jhNpfPBRd/toV7AC7A+ZJC5WjXyzimQH+TMuDtvhhUhmeecl2oLRgL137YSN+9wxp2egg
 Whtrlk/mj5ERmvUWEvm9+lNP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iv9CE-0000UB-Qo; Sat, 25 Jan 2020 00:21:07 +0000
Date: Fri, 24 Jan 2020 16:21:04 -0800
To: samba-technical@lists.samba.org, metze@samba.org
Subject: Linux io_uring VFS backend.
Message-ID: <20200125002104.GA188423@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Metze,

Any chance we can get the io_uring VFS
code checked in for 4.12 ?

Would love to see that as an option
for Linux users.

I'm happy to review / test !

Cheers,

	Jeremy.

