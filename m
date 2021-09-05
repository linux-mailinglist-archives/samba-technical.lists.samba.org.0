Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F484011AF
	for <lists+samba-technical@lfdr.de>; Sun,  5 Sep 2021 23:11:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Mtk79vo1QsZvUZD4GjH2T6PQNVZQBSiLaPcpJon8UWk=; b=DU9WRDU/rnvC+3JzLNJBXn3diN
	oIu9yvSwB8vvshVZNivubsrvGbJpNjBkdB40OwJfsZMihLsBvsm8c4pfkAezMdtpAdunlDFsNjXo1
	SfOB37fEA7t3UmtDRwx8+1EgOvWCkdC6CS7hsovjSxY+q+PqFde0oe/mYg6O8c45wT5JZRHmvsepw
	AmX5CsaH5NjABrjg/VdMZvEwphFqigGSuNciA5IG7ITHFpvfFjs1CpTXTD/66wRRYo5XbS2XYxbU8
	1eS4Mjfd4iCBAIUyilTch6x96/t/0kX5sYtYLTuA/lRJoeEPWex7X66oSn8E/Q0lHNL7DqSnYu31C
	s4aXFUSg==;
Received: from ip6-localhost ([::1]:30650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMzOa-00DQLu-D1; Sun, 05 Sep 2021 21:09:44 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:44546) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMzON-00DQLl-W0
 for samba-technical@lists.samba.org; Sun, 05 Sep 2021 21:09:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Mtk79vo1QsZvUZD4GjH2T6PQNVZQBSiLaPcpJon8UWk=; b=GbDcUDVVF1hYsJ066688SiV27v
 wCLwFgB3Vdgm7aUNre7xAbn+nI3vxnB2ZcVff6Ia9VjWvKvGuiZOXdDRV4JRumHwzsNdLgxbCiV9j
 pMnE/81CXLPckqaUvzIg33nnD/miEBjnv4KiWhwQqMrrwK3lGuujfzKbfP3oMEm405WKfICkc/9MN
 NP0BxDKCRnC/+V5qOPapYVFwdysYRzEBGqUWGjFT/f5EOk1UtL2abM4HQPoKcAEfaj5YdA8tVXp4R
 BaDF+CH04yIqEn5j4hEM5LIGN4PNJevm1rd1C9giYcUAXbtgDaIn8y6DQlJhSTgFoB0Wfi0rA0LwH
 jUgvOVMnUzDWdQZH6iTRZQufb8oCFvBZ58Uo79nPHsAtWqkadDJIh2C+GAvGr3Uptb2JjFlLN4jA5
 h6b9r/yOyZQU0h7wR//hhKq6UBbD58pZG1/fLHnXs9T3mF+57tGf0H4iT0HiIBkK7+eAoQnAFibLO
 LZw3bOBPrI1AhiXmXY/DyVqW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMzOL-004mx5-Cp
 for samba-technical@lists.samba.org; Sun, 05 Sep 2021 21:09:30 +0000
Message-ID: <ac892f11889324c9c242da347ae12cbbd7ffd53b.camel@samba.org>
Subject: Please report flapping tests in the AD DC
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Mon, 06 Sep 2021 09:09:20 +1200
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

G'Day folks,

We just landed a fix in master which dramatically improves Samba's AD
DC performance (addresses a regression that was in for far too long,
sorry!).

https://gitlab.com/samba-team/samba/-/merge_requests/2130

This of course changes the odds in the flapping test lottery, so the
things that flap will have changed.  If you see a flapping test, please
see if you can fix it yourself (to spread the load), otherwise at least
let me know so I can look at it.

Example fixes:
https://gitlab.com/samba-team/samba/-/merge_requests/2151
https://gitlab.com/samba-team/samba/-/merge_requests/2154

I know these things are a real frustration, so I do make it a priority
to address these as best as I can.

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


