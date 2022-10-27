Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C918260F477
	for <lists+samba-technical@lfdr.de>; Thu, 27 Oct 2022 12:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=K7FNmZvQnFk7QZc7O6l3/l0VAVYLlPM6l/EM9PPm2pE=; b=ljHkt34DM8yUD6eH/8PXB8L/uV
	UYnONgCGVw9q+TBZyrv5g1cNvnbFy1I4/sgbYjpGsPFcodh5ru1OX00Sqwp6Bo9M6syIxPT6fcIiS
	hIXYQGGe/b+OnQHXVrdsjwIrzjxOOhvlMZ0ItFxhppK5GkhvRMaV9gov09Zh4brtNNK1i38pftVk1
	i+eRTHAFrkIf1gHMQilxO+wlsSXXAvnqFqPNLEjGqzUorPCDy5jPV/NNexqJkuPJt9OUA3uHAr4mp
	bM9QhAly5Q60gS87LPas6udp/ZKGQOidIEtcKw3lndaaRYclofjLTfmdbQhF7Q3p8AHM1H78nskAn
	oDzy6pMw==;
Received: from ip6-localhost ([::1]:49122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1onzop-006MwR-GF; Thu, 27 Oct 2022 10:08:59 +0000
Received: from smtp.arcada.fi ([2001:708:170:33::246]:46080
 helo=hipper.arcada.fi) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1onzoh-006MwG-JU
 for samba-technical@lists.samba.org; Thu, 27 Oct 2022 10:08:56 +0000
Received: from penti.sit.fi (penti.sit.fi [IPv6:2001:708:170:33:0:0:0:237])
 by hipper.arcada.fi (8.15.2/8.15.2/Debian-14~deb10u1) with ESMTPS id
 29R9vwmh087556
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <samba-technical@lists.samba.org>; Thu, 27 Oct 2022 12:57:58 +0300
DKIM-Filter: OpenDKIM Filter v2.11.0 hipper.arcada.fi 29R9vwmh087556
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arcada.fi; s=2013-11;
 t=1666864678; bh=9FEW00d6Lg2LJIiH5aJXHmtZMo1QfYOSAto7pBs9uSM=;
 h=Date:From:To:Subject:From;
 b=hD366Oc9yrSxlztTouEEF1zAimvGuDgmAX3tRLDy95Hd+ZFGOkukyjWg2fUaKTcUC
 hDwzNJoo4PEhqfWSXbqbOHk3/5dhQP6iYKVoBvR4RQSls8GOdv/92cqAr9LAYHTgSl
 opJnxL7coUCmFQpyY4CYkvY9A55F8wjLCqbf0BnY=
Received: from penti.sit.fi ([IPv6:::1])
 by penti.sit.fi (8.14.7/8.14.7) with ESMTP id 29R9vvpv014383
 for <samba-technical@lists.samba.org>; Thu, 27 Oct 2022 12:57:57 +0300
Received: from localhost (harald@localhost)
 by penti.sit.fi (8.14.7/8.14.9/Submit) with ESMTP id 29R9vvWL014379
 for <samba-technical@lists.samba.org>; Thu, 27 Oct 2022 12:57:57 +0300
X-Authentication-Warning: penti.sit.fi: harald owned process doing -bs
Date: Thu, 27 Oct 2022 12:57:57 +0300 (EEST)
To: samba-technical@lists.samba.org
Subject: Upgrade AD DS from 4.9.5 -> 4.13.13, cannot resolve usernames on
 member server 
Message-ID: <6611f3fb-6ff-565f-c3c9-9476c33fb31d@arcada.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Virus-Status: Clean
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
From: Harald Hannelius via samba-technical <samba-technical@lists.samba.org>
Reply-To: Harald Hannelius <harald+samba@arcada.fi>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


Hi there,

I upgraded my AD DS servers from Debian 10 to Debian 11 bullseye which also 
upgraded Samba from 4.9.5 to 4.13.13.

Now I notice that I am unable to resolve usernames on the member servers. I 
have only numbers in the processlist for example. 'getent passwd 
"DOMAIN\harald"' doesn't return anything.

Did I miss something in the upgrade process?

Now when I restarted the smbd, winbind and nmbd I am unable to connect to 
the member server.


-- 

Harald Hannelius | harald.hannelius/a\arcada.fi | +358 50 594 1020

