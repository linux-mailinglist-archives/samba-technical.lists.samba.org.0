Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D09616978E
	for <lists+samba-technical@lfdr.de>; Sun, 23 Feb 2020 13:30:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=SEgyGvJnPGm5psFjSDxiGpz7dumzEQ0y6qK03tVAETI=; b=Xsi1lveWH199c+j7Cb4Kh6W/yP
	TyhJi1q1MUm/fGsU5wam1sLJDBQvrrCmElVwzUkQetuoq0XzxLfBimDZpol3kQdZystPgfqO/2aIY
	m2MNg2jLd29H00VHmCrzRILyGsHoyM2Mf0YyPH7LmxY3aliE+qR+14N/WWnSBAc2clPOVx9ur5bDI
	9NwMdCarxW5jm/+NIQAJROMfDuWrAYSQlgsdSWqy2Z08CnLmVhvtKUAvKwo7lxh8RNx5eKjB0eove
	U9Kxvh7nsvrrv5JhD+aGTqIdqQDx5f3lv/63AbehH3U5VGFrFjLpDV6TYp20vQjYkg7OtKT6B+xfV
	blni5eUg==;
Received: from localhost ([::1]:26880 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j5qNj-00BAvf-5n; Sun, 23 Feb 2020 12:29:11 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17504) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5qNe-00BAvY-24
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 12:29:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=SEgyGvJnPGm5psFjSDxiGpz7dumzEQ0y6qK03tVAETI=; b=u8HYeu/ADkhOCgaC3n+cwHpFGT
 1h/PC1mOYLsm6d7efPwZfwfFNXCTXONCSfepgovP4vZddkpwI31EfZM24A0P6V/Gr7YFRCy26bHBP
 B+QtL1hNoscBjm/pnRkPhSbNauuFZOV9r3Dynah+zuDb+snjDJSnMMDyPGwGFSuEHhh3+DV4OaLIu
 Wd4trXLimNBXq8NLRJyy//66SLiilpYKsTH7GS8WxoEynYXgJI8PmqwPGeEiFX6/TSVPq4t8iPqRY
 YErWf/VLfOqMM31FzchfpJ39S9fdsA0tqret3xb2bIVfSh041lHb+OuAjJf9/7gKtX+zFl9BqxGLN
 50LuHK0qb/T8c1+YRYYGwhlt3+tMUF56GMUTpBupDOWArdOpSor/oKzVrpBSu8epl1hLAFZiZeudz
 l5CWjMfNN2/4MAD9nxJU2V0mauWm85uef3VoIWPnGVAgF+LXn+4MVy2iONjhmWdCXuS26Nu9TOrLM
 GYdI5n0tkcumsMr3MPbZtgQa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j5qNc-0004oa-K7
 for samba-technical@lists.samba.org; Sun, 23 Feb 2020 12:29:04 +0000
Subject: Re: Samba 4.12 rc3: bind DNS say "named: client update denied"
To: samba-technical@lists.samba.org
References: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
Message-ID: <5b43a40c-9d80-a6d1-cb63-046cef3bbf77@samba.org>
Date: Sun, 23 Feb 2020 12:29:03 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a144cd2c0219399cea4473f6cf7e86b3dba5d6cf.camel@solinos.it>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 23/02/2020 10:31, Dario Lesca via samba-technical wrote:
> Hi, I'm doing some tests samba DC 4.12.rc3  MIT Kerberos  + Bind DNS +
> Dhcpd script  on Fedora 32 beta.
I wouldn't suggest using this in production, MIT on an AD DC is still 
experimental.
> All work fine except this issue:
>
> The dhcp for a workstation "win10a.fedora.loc" NOT joined to domain
> work great, name and reverse are added to Samba Bind DNS.
>
> But after this join, some time (10/15 minutes) into syslog I get this
> error:
>
> named[718]: client @0x7f128c3e5eb0 192.168.122.103#54566: update
> 'fedora.loc/IN' denied
> But despite this, everything works well

First, there is no point in asking Fedora about this, the dhcp script is 
supplied by Samba (or to be more precise, by myself).

Secondly, it looks like your clients are trying to update their own 
records in AD, which they cannot, because they do not belong to them, so 
stop your clients trying to do this..

Thirdly, this is the wrong place to ask, you should have asked on the 
samba mailing list.

Rowland



