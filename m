Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D43266D1
	for <lists+samba-technical@lfdr.de>; Fri, 26 Feb 2021 19:17:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ayt+jQYpp+dP9PxvXwM+FYLhVGIa9aee/kiMm9taS4s=; b=WDq5//Z7/lR45+Mzegaxb1jpkj
	UMUzZjkUu/ZeNG2HC18EzPvavPcvelXerxLMZSB8Mzmsfsrl8PmaGZLF6RoDsLmwq/e6EV6kxb8jw
	Iz/7AGb4hIl9Gsa3UbzEWA92Rt4nEEQQo27TK29B0BFDzQuKKlkYvqFSCjeYzt+Nuu+bVT3BHXHJC
	L+VubDrDKmGkRAiKAVtVG+7j/73MqPf2Ej4VwmUJyyPoHge7qaSxBQAAfBxQSVkXkzU6F/RHSY9oZ
	TWLD+C+7WI37Y7o4YEDT8yMOrAcsFV0HQ6cd3pFJXDoY62FjESHXTgNTcQrcL5gn4awKHzAvlKcKg
	gcxTliEQ==;
Received: from ip6-localhost ([::1]:60878 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lFhfs-001crc-I4; Fri, 26 Feb 2021 18:17:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39540) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFhfn-001crV-RJ
 for samba-technical@lists.samba.org; Fri, 26 Feb 2021 18:17:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ayt+jQYpp+dP9PxvXwM+FYLhVGIa9aee/kiMm9taS4s=; b=fzpVAIc8yggqWtt6jdzvr1oaJ2
 FDLYa0SzRNu55N+qvfXyZF8N2Qx2f/yXFjyQJ9I8Pa3TxThEm49OepiRLhp7DEM46IZHohChv9xW0
 oBdVI5ieOUEeQhLtpC1G25CJp/YWbrU7EitUR0ErZwNG3ez5bTeQtyGFB9UUCnne4gMaLLk+bmPxF
 VVfczhhKYxHeeXcfyg3gMWs0Y5W15IQw3rDXKgjjCVAJeLgOuNYy60H1L6XNu/+cn0TUmA73sf+/J
 mRl8lESDjU7vfrGzGFGW/Kkveeg72KBpcVb7UjPE465fJJFe/FvXHhWaZ91tOKv3iGiRjuMevQ8ji
 C+bv3sSIl6yjXwIO/cOYTO1/41BPp01hUPThg8D9p693OJOImdHyYAlxAX4d3f+FRNODZr7CaXmvW
 +lgYcunkPgrxP3DKWqNR1DOEXf1JETRCiXOkUmmZzrph7XyqM8+ShGuc50Uu06m+VGKFFUqKHTpc0
 CR5hcYnvwYHqEcgPV9vKvYm0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lFhfl-00019Y-Nk; Fri, 26 Feb 2021 18:17:06 +0000
Date: Fri, 26 Feb 2021 10:17:02 -0800
To: =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>
Subject: Re: flock possibly missing in SMB3 POSIX extensions?
Message-ID: <20210226181702.GA94004@jeremy-acer>
References: <878s7aztu8.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878s7aztu8.fsf@suse.com>
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
Cc: Steve French <smfrench@gmail.com>, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 26, 2021 at 05:17:51PM +0100, Aurélien Aptel via samba-technical wrote:
>Hi,
>
>While debugging cifs.ko customer issues we found that flock(2) seems to
>be impossible to properly emulate using SMB.
>
>On first sight it looks like they could be emulated with SMB locks but
>the main difference is that FLOCKs are completely advisory, the application
>is free to ignore them and sucessfully do read/write, whereas with SMB
>locks WRITE/READ will fail on locked areas.
>
>The flock syscall is avaible on most unixes so it would make sense to
>support it I think. Maybe via a special flag for LOCK.
>
>Given the number of options to control locking behaviour in Samba and
>given how NFS doesn't support it properly either maybe there are
>problems I'm not seeing.

Yes, flock has historically not been part of UNIX
extensions. I think you *could* emulate it by converting
them into UNIX extension fcntl locks over the whole
file.

Indeed, from man 2 flock:

        Since  Linux 2.6.12, NFS clients support flock() locks by emulating them as fcntl(2) byte-range locks
        on the entire file.  This means that fcntl(2) and flock() locks do interact  with  one  another  over
        NFS.  It also means that in order to place an exclusive lock, the file must be opened for writing.


