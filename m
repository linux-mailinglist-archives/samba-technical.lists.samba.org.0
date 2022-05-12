Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8338A5242F8
	for <lists+samba-technical@lfdr.de>; Thu, 12 May 2022 05:05:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=LFgpPeyFNmyLBQiypih2qBl6KgKEpBul/01jmjQ4s9A=; b=3laXNyfPQK8rT5WjVetXgTyFqB
	6112IcVPrryX8Z7SuXM+PQJpgW9iFqJYMntBDW5/eVTGZ6vRtyv5BkvAGuavWtrBdvyYkNmMPBCVn
	x3PbI6yfXHLTifI8MBZacZmJl2G5XjWwnNdVNyyZ84Nz1ThXOAZHaJ/dcX93PXCvb8mtfU0SCjCTs
	Dm2opFqSBzvPYeP7OWGpSR7JtoZU6tpqp3a6XigZbo/VtFucPNDHFhGzqV+AID5jVNwP8fl+V1vvw
	rp84pvUDnNYUm7z4zyds/hromP3IOQvjcAh7pkrJ3ZBQPP7e0KuWHw9YogEgqHYnrwebcBSYVGFBC
	bmc31QOw==;
Received: from ip6-localhost ([::1]:18050 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noz7P-000qV8-V5; Thu, 12 May 2022 03:04:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61548) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noz7K-000qUy-V4
 for samba-technical@lists.samba.org; Thu, 12 May 2022 03:03:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=LFgpPeyFNmyLBQiypih2qBl6KgKEpBul/01jmjQ4s9A=; b=NeQB3p2tlTW7bCWzTz5xGbhz6S
 f9CdXNoRyoMHUFMynEGj8ZiCEI3yhlFuOCzWuPq5xsXJe26dqTLcZEiYZDbC79GCjxvJKPV0/H6oC
 p0BfSG3Cn7UxSM+SLyU3csfKmdtfAYu7iwzQIN2mubjiz2onqNF6gHV5nwzWB/cVMFTJrksulS8gY
 3L2YwFqNhoAL4dJunoWPILpJSetdfBwTRsmuyRdt2SSVzXSZMWVScuwX7J4CyCEYlUUldWjFWiOMP
 MLCROYDcCNxiVms7tWgJIxO+CAZUx5kggD704Sr18Utw1MWs9Q34LGKM2CN8gltn1pPxnmEy5dxef
 qn5/H16YuBkwNzfELC8oi0EBqru9tKmJMF8j9QdOcRMCZP5gSAZ/c5XBBhfPP1qmgJ4KxuyBqxycf
 eHHZaN/YnKlQIICRmmwKsh43NIgCr5PSw/AimkCaMsZgSl0km+p5VbCPZus68SXaPRIkvH46kKNmY
 z92KltYoh9RB3S2oF7Uwhnvu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1noz7J-000Rbj-F4
 for samba-technical@lists.samba.org; Thu, 12 May 2022 03:03:54 +0000
Message-ID: <b2e7c521b206ae21889e7409735dca2107e78e38.camel@samba.org>
Subject: Remove last bits of DCOM code?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Thu, 12 May 2022 15:03:49 +1200
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

Bits of Samba that were implemented in the hope of doing DCOM cause us
work, be it from users who dare to hope that there is a future for wmic
in Samba, or from oss-fuzz when it finds inefficiency in our NDR
parsing.

It is just a dead weight on the project.

Does anybody object if I remove it? (I will submit a MR if there are no
objections)

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






