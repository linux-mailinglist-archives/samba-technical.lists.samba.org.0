Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E4C138119A
	for <lists+samba-technical@lfdr.de>; Fri, 14 May 2021 22:18:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=/24s4gSEw8AR9giOgwJ8LmyPvJmtlijkYRcLDPMxzec=; b=CU38bxJMpUJoZk08yA2CS9cBWI
	/sFet2nDb4WWJUi8ZQzkhD3Wti63m/9iyyA1Iwytyw9WjB247abhfwCufknUARJFezNFczsxD99y4
	l7OblEGihOByLyEi6WyCmXGkEAcQ20UEGkRSPpIQRP1w/epOd+/oVnnw0FyCF2SpvZfrCDGNrQcd9
	L56nzaLWoLAyznDWyXIPOZCrgOWbEvy1r/IYjj8G4qWn8g03s+g1bh5VulMnTn+dt5rwGNQWxLkrv
	JhvqFkMjyGjPJ+PLPuJ7+WkChviN9ta8spO/d4mwvJAUezISH+s2P5FyexXxYBIlXP5bx6vHvVobF
	2kJAlbRw==;
Received: from ip6-localhost ([::1]:49608 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lheFz-000MIq-MH; Fri, 14 May 2021 20:17:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49684) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lheFt-000MIc-3e; Fri, 14 May 2021 20:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=/24s4gSEw8AR9giOgwJ8LmyPvJmtlijkYRcLDPMxzec=; b=kjwTkWptbZvWwPIKm91bPoKXBj
 +tUBNB9D6u9uMYPfK3cHWEWFSvLrnaeKwnLnCcQH+1Mj66aFEq3mC+NqQiBcgFERIQLqsQz86fmLv
 ZDhD38Dn2rYcBGdZTp2ZlEJ/6Bo3pgB9LNmOnS0etEC+rrAovyVGHSQhCoO4244dFWtt8GRiAV6ct
 AIL5b1LLBbnX8hgq+hAnEzTwG84v0BJ2ghF05bLelzNMfKaJ4BKRvwNiDrvRbZy3mqQFOvtfQhqRZ
 j9NJRQcs2AJIiwLU2TR2Tehdt0jqMP77c/G6hqbPvworP3SmAsz9W0MFZWfAlQks2G/pR50JLPXs6
 ynAtGCWxHR6ohPrRl1ruarSgoZQrOQfaM7R15MiD9RCPnhEJWOaujTabdODHwO3Kd+fM5ZEsyocQo
 ozKP2I/W0L9SWpubPhxx2hZw9FiULoVS3bqgzrqNOHRBWstZyi4cPGPbxpOFfbe53TdsVQmUx0++d
 kflWmjY/mNQZyvCmKzwqN2MO;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lheFq-00025B-VT; Fri, 14 May 2021 20:17:51 +0000
Message-ID: <0c7b8b6871f8f8cf8e82536a8f90f3277f18dab1.camel@samba.org>
Subject: If you have the skills, please help package Samba on Debian
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>,
 samba@lists.samba.org
Date: Sat, 15 May 2021 08:17:47 +1200
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

G'Day Samba users,

I wanted to mention the Debian Samba Team's RFH, Request for Help:
https://tracker.debian.org/pkg/samba
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=814382

The bug is old - Samba in Debian has been under-staffed for years - but
the need is still quite current.  The Debian Samba packaging team needs
assistance to triage bugs and prepare stable, unstable and experimental
updates. 

I hang around the team to provide some advise - I did some of the big
push to get the merged package built - but this really isn't my area
either.

So particularly if you are involved in Debian, or have those skills and
want to be, please do assist.  It would be much appreciated by many
users here and of course by Debian users worldwide.

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


