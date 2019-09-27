Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97683C0362
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 12:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Lu3ULsU56xcIy0d+bFPbEjBsL1zggI7DxER2ncW9PRw=; b=Ml9160OlspGJ7RYMcpG/Q2ltWO
	IHXmsR/mWVp7fUceVAzJdHxTwWQvBb3zwvZd+4GegEOQ8L3HJ1ADMOqeq6poEBy+0/YNOySP8Knv6
	o6oJRBUW/JVkHfhBbhicuNDOMPzdpqY8qAA+fXH+dQ+VH91R16jSJMj8MgXTYwtC1Uwu8zsZefPqv
	NazTbmz3cFiYqnmWPudIRxYwRXw44yeYch3CT/s/6Al6aKtLdj+7wxEfSMiM3zW+3n4TjaPPVilTX
	RIHEa2cHU1hXXAZ8LpwKSshWGE+YSl82I0vOJA7/nXiV5c4MgDw16TOTwylI0QufBBCk0acU411P6
	oULziYGQ==;
Received: from localhost ([::1]:42670 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDnQg-0096M4-CA; Fri, 27 Sep 2019 10:24:50 +0000
Received: from grace.univie.ac.at ([2001:62a:4:25::25:115]:54192) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDnQc-0096Lx-5k
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 10:24:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=univie.ac.at; s=rev2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lu3ULsU56xcIy0d+bFPbEjBsL1zggI7DxER2ncW9PRw=; b=sGeAm/CjkC8I98bjFd4LyBG2h7
 cd1UxvgC9IzVcC+Jegze6ey4gbscoi32jgfWTE+uJW9uPhJ+cXNTgSF8tEK9bYCNTCanduL3a36+8
 jBZ5Z8ppSJLPaIIbQtqGxPJPGwRYfsjYT/UcVWQeXtP/W8orcPs832eNhOXnVLcvzFOI=;
Received: from joan.univie.ac.at ([131.130.3.110] helo=joan.univie.ac.at)
 by grace.univie.ac.at with esmtps (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.1) (envelope-from <Heinrich.Mislik@univie.ac.at>)
 id 1iDnEr-0007F4-IG
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 12:12:37 +0200
Received: from wsmi.cc.univie.ac.at ([2001:62a:4:202::200]
 helo=wsmi.cc.univie.ac.at)
 by joan.univie.ac.at with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.1) (envelope-from <Heinrich.Mislik@univie.ac.at>)
 id 1iDnEr-0006f8-ED
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 12:12:37 +0200
Subject: Re: CTDB Assigned IP not on an interface
To: samba-technical@lists.samba.org
References: <848DA573-7DDC-4B8B-BECE-A0C5B15E704F@ieeeglobalspec.com>
Openpgp: preference=signencrypt
Message-ID: <557c4a52-b8a4-c320-155e-4333890fffd8@univie.ac.at>
Date: Fri, 27 Sep 2019 12:12:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <848DA573-7DDC-4B8B-BECE-A0C5B15E704F@ieeeglobalspec.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Univie-Virus-Scan: scanned by ClamAV on joan.univie.ac.at
X-Univie-DANE: verified lists-mx.samba.org
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
From: Heinrich Mislik via samba-technical <samba-technical@lists.samba.org>
Reply-To: Heinrich Mislik <Heinrich.Mislik@univie.ac.at>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

I think, the package ctdb-4.9.1-6.el7.x86_64 is somehow broken. After a fresh install I had to do several things, to get it working:

Create missing directories:

/etc/ctdb/events/legacy
/var/lib/ctdb/state
/var/lib/ctdb/persistent
/var/lib/ctdb/volatile

Create missiong symlinks in /etc/ctdb/events/legacy/

ls -l /etc/ctdb/events/legacy/
total 0
lrwxrwxrwx 1 root root 44 Sep 20 17:06 00.ctdb.script -> /usr/share/ctdb/events/legacy/00.ctdb.script
lrwxrwxrwx 1 root root 47 Sep 20 17:06 01.reclock.script -> /usr/share/ctdb/events/legacy/01.reclock.script
lrwxrwxrwx 1 root root 46 Sep 20 17:06 05.system.script -> /usr/share/ctdb/events/legacy/05.system.script
lrwxrwxrwx 1 root root 49 Sep 20 17:06 10.interface.script -> /usr/share/ctdb/events/legacy/10.interface.script
lrwxrwxrwx 1 root root 47 Sep 19 17:40 49.winbind.script -> /usr/share/ctdb/events/legacy/49.winbind.script
lrwxrwxrwx 1 root root 45 Sep 19 18:27 50.samba.script -> /usr/share/ctdb/events/legacy/50.samba.script

The SPEC file in samba source handles the symlinks in a post install script, thats where I got that list.

Hth

Cheers

Heinrich

-- 
Heinrich Mislik
Zentraler Informatikdienst der Universitaet Wien
A-1010 Wien, Universitaetsstrasse 7
Tel.: (+43 1) 4277-14056, Fax: (+43 1) 4277-9140

