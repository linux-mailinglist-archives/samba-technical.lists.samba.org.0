Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5251B37499E
	for <lists+samba-technical@lfdr.de>; Wed,  5 May 2021 22:46:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=waYw0FfHuXFwJi0SoAPInXkcyx1XQQ24Gb77GTAqSDs=; b=fxr0Y999788aMo4MeacTTkKdH/
	KBgoQpzVjgo6wTqlyFQLRDeldSTx09Ke0nFqgSTbzGGU/P4FlH9U9ZY8XwTAbwzvHKCmLF23WCAzJ
	S9GNKstk1Xf/14w5wyofrMgbY0tBi3NIltrlNeQ5cfqwiC1FMWUKh4MdqK+w+V/T/IQROgFUljWmF
	cqE4FVJ37VVTzbs2fGatCvV3VldAtiIhqEXkbQ5Vt9dhkVt7Jhi533VT1nzCCZd3JCyI4rkt5BcFb
	2N2dzr0ojQ0sai7SvQldaJ2YiU2/siEByS9eGDnTjefWUA9Dv905C5MeuXbfQ0skXyfCKKA786GgN
	XbskSKJg==;
Received: from ip6-localhost ([::1]:34878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1leOOl-00FbnE-Tr; Wed, 05 May 2021 20:45:36 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:64096) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1leOOe-00Fbn5-LB
 for samba-technical@lists.samba.org; Wed, 05 May 2021 20:45:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=waYw0FfHuXFwJi0SoAPInXkcyx1XQQ24Gb77GTAqSDs=; b=1RMg7yIUdJRQpPzNYa2ESWUQ4A
 DXxItI13Efl3tNVycjBVc7wCAH8aa1CoQVh/dY4qIaX+U/BeNxRY6YryTTodZdcw7yA0hJCusmwot
 SPFHRU4DI1298M3SDaEA4UPh6KhWrm4Qu+t1xs87iltt50Qzp/P5bHbMFwVm9NZlgYfXBkIuCs2G5
 B+Bu77RAZs6wC9c2B4bFix7tawnH+a/dnR6gErF+QeZPDbfkgCVI6gMMRWwurSZmW4v8hVj+NYKqg
 NFi8DX7ZDkytyrjWYUPMGTz7CmeNvEXFT2plERQXfo9ufU7caT5d6frbnVXvR4npp0Sr8ZzTrOyTQ
 X3bjw4S1pf/V1wpjUDrq0k5cKZXF7ecHXnb1Sq2xRjhUy/iQwBE1FAk/HrT6oREzeWNfL8M3V72rM
 Pho0RPaLe18vs+2CXnpF8hN+a27a/EjAikSAlVOSXWN8X0HS/qE/eFGVx1RYejVLV/a3wYw8sG4Jx
 K6iTvGr88yop6cDhBfdvBKIi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1leOOc-0006Qt-5G; Wed, 05 May 2021 20:45:27 +0000
Message-ID: <ac6f194144b94fad8fd93feda57f804027f7fa2d.camel@samba.org>
Subject: Offline Join
To: gd@samba.org, Upstream Samba Technical Mailing list
 <samba-technical@lists.samba.org>
Date: Thu, 06 May 2021 08:45:17 +1200
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

Awesome talk at SambaXP on the offline join work, much appriciated.

I thought this sounded familiar, and I'm sure we (Catalyst) were asked
to quote or work on this, because I've got references to us asking
Microsoft if this was documented.

(They said it was out of scope and undocumented at the time,
interestingly).

So glad you found IDL for this, it makes it all much better!

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


