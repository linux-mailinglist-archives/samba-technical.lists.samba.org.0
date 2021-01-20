Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 740712FD78E
	for <lists+samba-technical@lfdr.de>; Wed, 20 Jan 2021 18:56:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=9zRWOK5Kc2R7Sx2XGB4yefp33zDSt+o/LCJA+Dk7uwY=; b=gjeT5QEnnM0kODba5Ycj18a3dO
	k4WLS6vf+rOi7eBW2+bhyavzWpDvo/TzEfD4eay7/nNqlgrBbfKD7eCn9qHB7784ZVH413okl9o5M
	dG6uCPNIIwDCQpVcfuyNaB/Fg7wIxmUO3M9B4PEQ8toPpc6PyViB4XvG+R5/nBSQgtkp1CHptpIfg
	+ADqopLifHnnYyHxm1voAGpBEKpVzFQ0f6izPnwmMWwNclN1EmptGYOlWBQuBzjY1pleq7NGXXX2/
	KxjsBGHINg/tC2IGisL2amS3m9hymThCKfYAXt3cumJBPyAcIQ7SNBIJmcPrYB8eDEJrr2DKzwizZ
	/C3GaDLA==;
Received: from ip6-localhost ([::1]:65104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l2HiN-006NE5-VJ; Wed, 20 Jan 2021 17:56:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23700) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l2HiE-006NDy-Qp
 for samba-technical@lists.samba.org; Wed, 20 Jan 2021 17:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=9zRWOK5Kc2R7Sx2XGB4yefp33zDSt+o/LCJA+Dk7uwY=; b=pJGUn4AfxqfDzMRJ5uci68jw+7
 hjU7SmUCJ3lxJNeVIj7J27j21RmgninvqKM59HzEMA2o3dKtw+OQfgKnR1ODNMEdlz7K4Y+zMkb2e
 BKau9nIdcaC19RXz9qRw+L+cuEgFT0/068cUbtDIOboL5gWaq62RHaZVGE5n6cA9KCbN/BvDovK0r
 8BJjP29n1KmCX5+nWlwZF1GgY3liVju98wtWln99Y3rvzBnuzgNEHEhMQ3ROS7rvR4WcdJfX1/lrU
 5Z2QEDxBIPbUJIpsKaeYDwA8EnCNd6ZMuiGySb15p460lH5n/f/lgXWZakfrVhsjOXhmxmJjUi78L
 X/qOq7moMhlztFVBFwzDRHgLFTMVNlbF+8jZmMgm9rEfG5aKpDxH4zJXGAYIPMpoPCBieZUc9NiYk
 UmW13UhwSbv5NbR3acZmoiMvcnXRUwxe0Rn3eJEofSsMv9mieJPnOf59KnwcCR/iMA2wWq1pdikq7
 /obtmBrkpXRDvFEQDLzsuxsz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l2Hhw-0006c5-1Z
 for samba-technical@lists.samba.org; Wed, 20 Jan 2021 17:55:52 +0000
Subject: Re: Fwd: Help Needed: Samba share slow to query not existing files
To: samba-technical@lists.samba.org
References: <CAGha7mH29snpcpmK14800yWynZVgJDEVTvQBTi31u5-9HBP3JA@mail.gmail.com>
 <CAGha7mEdy-B29PMUzkxtiznNZJvwdo21fiwnh2kq7hf7tYKBAg@mail.gmail.com>
Message-ID: <e0255d9a-9b29-ce56-91c7-35f93c0ffb35@samba.org>
Date: Wed, 20 Jan 2021 17:55:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAGha7mEdy-B29PMUzkxtiznNZJvwdo21fiwnh2kq7hf7tYKBAg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 20/01/2021 17:37, Jônatas Hudler via samba-technical wrote:
> Hello everyone,
>
> *(First mail in this mailing list, so take it easy if I'm infringing any
> good manners here)*

Welcome to the list 😁

Unfortunately it is really the wrong list, you should have posted to the 
samba mailing list, not samba technical.

Having said, lets try to help you.

>
> In a samba share we have a directory with lots of files - binaries and
> resources to run our ERP application (around 20K entries).
>
> The application is taking too long to load. The found reason is that the
> application tries to load several files in a trial/error fashion, looking
> for extensions in a particular order (e.g: file.dll, file.lbr, file.gnt,
> file.int). Many of these files are not required and doesn't even exist.
>
> Every "not found" hit take ~0.2 seconds. And there are lots of these events.
>
> The thing is that apparently samba is not caching this result. My guess is
> that every new not existing file open request causes a full directory's
> entries lookup.
>
> If I run this code (in a Windows Command Prompt) in this samba share, it
> takes considerable time, whereas in a native Windows share it is
> instantaneous.
>
>    for /L %i in (1,1,50) do @dir \\server\share\not_existing.txt >nul
>
> Anything that can be done?


Two things might help, stop using a Samba AD DC as a fileserver

> ------------------------------
>
> Current smb.conf content:
>
> # Global parameters
> [global]
>      netbios name = ***omitted***
>      realm = ***omitted***
>      server role = active directory domain controller
>      workgroup = ***omitted***
>      idmap_ldb:use rfc2307  = yes
>      dns forwarder = ***omitted***


The other is to remove everything (that you appear to have added) from 
here onward from your DC's smb.conf

>      vfs objects = acl_xattr
>      map acl inherit = yes
>      store dos attributes = yes
>      #
>      aio read size = 1
>      aio write size = 1
>      aio write behind = true
>      socket options = TCP_NODELAY SO_RCVBUF=65535 SO_SNDBUF=65535
>      read raw = yes
>      write raw = yes
>      max xmit = 65535
>      dead time = 0
>      getwd cache = no
>      max connections = 5000
>      time server = yes
>
> ------------------------------
>
> Environment Details:
>
>     - CentOS Linux release 7.6.1810 (Core)
>     - Samba version 4.8.3
>     - Application Runtime: Microfocus NetExpress (Cobol) v3.1


Where did you get the Samba packages from ? You normally cannot 
provision the Centos Samba packages as a DC, also Samba 4.8.3 is a bit 
old (the latest version is 4.13.3).

Rowland




