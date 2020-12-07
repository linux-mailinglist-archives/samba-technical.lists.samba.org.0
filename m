Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E5E2D1C56
	for <lists+samba-technical@lfdr.de>; Mon,  7 Dec 2020 22:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=T8IncArZJ4BaNMpr9JnvU2CA4i6gZY2nqlF7uqgLWxc=; b=XDOf7A4POx9LaNoMGKqW9etEC/
	WU7gOBId/YOm8MJr9UjDVvqOQw7NbcT9JKwAMCMLQAkRwndMKug5CCPV0lBuF2oFIECfGNE7rqu5H
	0CY7BqRO/qfYBxpjqvX76NnXE9f+cj24LX8wqySl+eO0BYo3oBmT8VOjMOojUUYYZJDRPyxb7ce7l
	2KhBd0SBnXm8YNw0PdTH0mjyQbXl0zffe6ARpw6ymp0BMjitII1JKO+0vnOe29ZL3oa59xg8sx2Fo
	o3Mdu3Pn2/7unkU0akR/+E7Fc9bHjtXGVm9xGb24xhNz5s64/GipQHoJP+ZCby9MR6duEG1bEhpW6
	nIB7o3Mw==;
Received: from ip6-localhost ([::1]:58018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmOQs-0007sG-Je; Mon, 07 Dec 2020 21:52:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36528) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmOQn-0007s9-B8
 for samba-technical@lists.samba.org; Mon, 07 Dec 2020 21:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=T8IncArZJ4BaNMpr9JnvU2CA4i6gZY2nqlF7uqgLWxc=; b=TrlEoerfjfqLVNA7H1iY9UmupE
 3H2CuzwGSl5J5oIDkPKebAGCvLF4EakoSL28thyW3mqJMvnpcTFdof5xclmpvpBg7haLoid8omMXs
 to0F/muGTfp0jIcB4OL29OVtEAEvGoGQ15OiJNYvOOgQlTIX0XxJmYhyPDzluZAJiiIX25WSVWgih
 ecY/oxma4VApBgT4WwyHe5mjlEch0U1R4v2SD7Mi0vY+vKt/9kMKl/yZMefkxBshWrpd/+Vh00fkD
 rPsCXpiOO6smo/UWbmJIXpvNnHL4xmzIlK5fRLfyzIfYyjNK2UJOsYl5WMFLoJg8XRmJmSJ8DUpH4
 G4pH24yuWh4u6uwCJesV9NKtSNwyAn6FVucCKEtc0BbrB/qKphkvCid+LaOqrJFAZwlObVFq+gmzA
 VOydZuI+pH1Bo1AOAp7d0rB19pfcUQP4a6u46EmXItxvR0FECo+hR4o81gs7nmk6vHThb9GM9sCgy
 7yVliNP0AvvVL6WyIMNQwYDj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmOQm-0001j3-Cr; Mon, 07 Dec 2020 21:52:28 +0000
Date: Mon, 7 Dec 2020 13:52:25 -0800
To: Joseph <j@gget.it>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-ID: <20201207215225.GG1800173@jeremy-acer>
References: <81fae2f8-970f-44a4-bb46-fb5237715070@mtasv.net>
 <20201207180509.GD1730617@jeremy-acer>
 <d056cc18-3ef5-4cdd-b25d-bbf86d041787@mtasv.net>
 <CAN05THQvhxFS57zggYz_67A6pzdtztZvuy2rhTRjg5mvj-sTMQ@mail.gmail.com>
 <7870a7a7-72d1-4efe-b4f9-0e07aa670452@mtasv.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <7870a7a7-72d1-4efe-b4f9-0e07aa670452@mtasv.net>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Dec 07, 2020 at 04:36:00PM -0500, Joseph wrote:
>
>So two possibilities:
>
>* is there a way to set an EOF on a file descriptor on exFAT that *doesn't*
>do the allocation? This would require a modification in the exfat driver?
>
>* would it be possible to have a mode in Samba in which it never
>"truncates"?
>
>    [global]
>    no_truncate = yes
>
>The file size would grow when new data is appended when a file is copied
>(like my code in Python before, with only f.write(...)), but no truncate at
>all.
>
>Do you think this would be possible?

No. This will lead to file corruption. You could write a new VFS module
(call if vfs_exfat if you want :-) that lies to upper layers about
filesize an caches ftruncate, but this would have to catch every
stat by name as well as fstat in order to maintain the fiction.

Not a trivial bit of coding, that.

