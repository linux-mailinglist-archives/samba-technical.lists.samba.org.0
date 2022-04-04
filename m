Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E904F1DF2
	for <lists+samba-technical@lfdr.de>; Mon,  4 Apr 2022 23:53:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=DS+IJuy+JNGCIAtOYJb6Uii+m1WciykEf7DUsVkj9yI=; b=OPPVUWMc+i/Mzoipbne6irFPUS
	JVvYMzj/gDExhnMMT+DEINvI8FavkEg8FjTs/vLHia6Z2fTQcbvRf84I9Xx54ePNKYeqkATmmxTrl
	82VEVp2gQzChn3feDWHalS7oinfwmOhbxW1g0cDIZmvAfWfTq0wqY+pUAcEdf1aNk4dUn8TKvAj9J
	1Ji4S0eD6p1iiDuvcgepwDYu6KQT1UOr9qh6HlEx2qSaxiH/Ij3N27mUcSt0vjumVNL+WMJWEKK2K
	oESAw9iuLkLebzQVcjE8YeXS0SzMLeEMD+g2a4Mr8a7UMRWdsOTit24ub0KIlon4LUiOPqyrx1Idp
	50EzcDvA==;
Received: from ip6-localhost ([::1]:44908 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nbUcI-009sZd-2e; Mon, 04 Apr 2022 21:52:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38128) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nbUcD-009sZT-AG
 for samba-technical@lists.samba.org; Mon, 04 Apr 2022 21:52:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=DS+IJuy+JNGCIAtOYJb6Uii+m1WciykEf7DUsVkj9yI=; b=xTo56eRypFy31LhSCZV6teL0JS
 Vdie1B5XpSYORdPaPHJDBeHh1ab9DlRxHi83QrvgrmoBxQmWRVc3vUQcR34JKEFUDFEqI7bBhGgrH
 qEFzAtK1+UmwznHqF+zwThWuAT/gQUHnKEq3If9Ow/9fASdmUMVjjSz0Uvm8vTd1ecwaJnmxsUdpP
 gipiYx++2zZKzW+ExtSJye1S9O+NXeRmDfGKKrW+b5iMqtbl3WSffE6oIhoMsn+DpiKJuSUdaNYuA
 1nhWdCc+2va7g2AA4TZEts1ChJz6WbuzWF6tXFES9gnoDhFsmKDAGe47CAgeVneTLWeRAE0hMpr/7
 +y1hLOwP0a5PKBMKOaTCmU7Q8/Xez9B4O+CX8//ivIOwJwMQqgeesURdFPw7aakrs9kldYWFUNeS8
 +zo4YgG4wlbx98WIzDYzLQW3om4Nb/t9Uk3U0U70Ps4J5XGNiyWoTrCyRfi4UU4pMC7gad0Qqp10m
 1V8ZK+WhzCdJ6sogwGiE73NZ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nbUcB-005JI6-2k; Mon, 04 Apr 2022 21:51:59 +0000
Message-ID: <2165e797b4fab04bd8b625b7b182bf2d9982d2d3.camel@samba.org>
Subject: Re: doing a test build of samba
To: Michael Tokarev <mjt@tls.msk.ru>, samba-technical
 <samba-technical@lists.samba.org>
Date: Tue, 05 Apr 2022 09:51:55 +1200
In-Reply-To: <942d4519-909a-22d6-6e45-75b976a9f29b@msgid.tls.msk.ru>
References: <245e18ba-a620-6a19-33d5-8794f010a617@msgid.tls.msk.ru>
 <942d4519-909a-22d6-6e45-75b976a9f29b@msgid.tls.msk.ru>
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
Cc: Mathieu Parent <math.parent@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2022-04-04 at 19:56 +0300, Michael Tokarev via samba-technical
wrote:
> 04.04.2022 13:30, Michael Tokarev via samba-technical wrote:
> ..
> > I've been told that the --enable-selftest build should not be
> > used to install things for production.
> 
> So I took a look at what --enable-selftest actually does. Here's the
> list, for reference:
> 
> two new functions (not used in samba code) now return true:
>   is_selftest_enabled is_ntvfs_fileserver_built
> 
> two new "printers": test and lvp
> 
> dns lookups can use file pointed to by $RESOLV_CONF variable if set,
> instead of using system-wide /etc/resolv.conf.
> 
> 2 ipc messages are enabled: sleep and inject (fault injection)
> 
> 
> build enables -D WITH_NTVFS_FILESERVER=1.
> This one, in turn does this:

This MUST NOT be enabled in production, as Samba upstream provides no
security support for this code, which remains because it is hard work
to remove due to the support it provides to some of our tests. 

If you want to do a selftest build, do a selftest build but don't put
it into the production binaries.

If Debian can't handle that, talk to Debian :-)

Sorry,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


