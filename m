Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 54AF41DE321
	for <lists+samba-technical@lfdr.de>; Fri, 22 May 2020 11:33:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=11p0B8rHNjqqL8cHGVEjJLrTly4+Oqa4FAp4qO0XU0o=; b=lgLlEap1FUd66+DWp2dbtXacdB
	kmI7/UB+Vngtey4eljWkQ5xMsmQaQMiSNcB5YE8lInPi3u27jQ9F6dyHcJxFRv7AWhHLH6U5End1R
	KBPOuh7lMBaUYN2npIpRu4wInooUaoSkc76l3SIr/4T1lO0K5btdmUYCM+6FNUlOQMmK85unCV7ny
	+CSj8Ug2E8Ezvjr+CSnswBWc4ivkylVuSDSzwp4LD582ItWK2RitdSexW8KsYrZu/JRTJht7pWGj4
	0vH00TtEu9R8TS5j2hzJ6NVle22K2PglQLHDIQln8Y8EIhtWi3NPsLw2ZkG3v2gTRqy2Vr5JrZ0TK
	p1aMChTg==;
Received: from localhost ([::1]:25090 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jc42O-005TLF-3N; Fri, 22 May 2020 09:32:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14604) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jc42J-005TL8-BU
 for samba-technical@lists.samba.org; Fri, 22 May 2020 09:32:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=11p0B8rHNjqqL8cHGVEjJLrTly4+Oqa4FAp4qO0XU0o=; b=luh6KQfdh4Icg/JqIozJ67uhB1
 E99cYFAd00f6f4eM+1xaWYP87BX5kKvCSrKwr2r1QU5HiFH47ikTtPOtUkQLtzZoOQIOs2Tez02tp
 /FaWAHwHV60KwyJQ88MzKQxcJpfuMyPb8w9suuBBZYbLElKG5zHVFxqReoilWpi/MFTuLgsq6CLr8
 6z1p6H2MIN5SIM4VDGzE0rotxRK8ZaZ2PQ/7CJFZrtTORaDtAKE3EERMBmpQGg7GgkKCYq9vQemEg
 gLODv6sKVGRvgsKNvx3nAMqtwRfd7gmyteaPA/gt4QHcRlIfM4mh3SMnsh+1n1Qnk89odNYoqZDNK
 CbX4FrHsw8uWcgncZ1keMfGismRgD+bXOXXT46QOV69hGiUPnf7RAjxdzctn6hTMT3lWPtzFEhhb7
 wx4yMRIsvBsHMyroVhhH+dEpD3KC5gmvQMbLn2ssPrOyEd9fTvCt6uTvBxx6VVCSv2QYiTqHrHmH6
 yahuqRrqbRDbkrtjvuspshDi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jc42I-00069d-B2; Fri, 22 May 2020 09:32:14 +0000
Date: Fri, 22 May 2020 12:32:11 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC: Community bonding questions
Message-ID: <20200522093211.GF5779@onega.vda.li>
References: <CAH72RCWL=4v4Ek9c-YbH0JYLX64iYK2NA83NOTYOHMN0uZ7A4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCWL=4v4Ek9c-YbH0JYLX64iYK2NA83NOTYOHMN0uZ7A4A@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org, abartlet@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 21 touko 2020, hezekiah maina wrote:
> G'day everyone,
> 
> Please correct me if I am wrong. So when you provision an AD DC using the
> samba-tool command line utility the following files are created or modified:
>   smb.conf
>   *.ldb / *.tdb
>   krb5.conf
>   resolv.conf
>   /etc/hosts
> 
> Are there any other files that Samba creates or changes?
I don't remember the full list but you can generate a difference by
using 'find' command with -newer check:

 - touch a file before running samba-tool on a system
 - run samba-tool ...
 - run find after running samba-tool on a new system

For example, create a reference point by creating an empty file:

 # touch /root/timestamp

Run samba-tool and then run 'find' to see files in /var, /etc, /tmp that
were newer than the reference file:

 # find /var /etc /tmp -newer /root/timestamp -fls /root/list

The /root/list file will contain an output of everything that was
created or changed since the /root/timestamp file was created. It will
have some cahnges unrealted to samba-tool because other applications run
on the system anyway (for example, there might be a journal update) but
it should be able to capture all changes done to files by samba-tool.

For example, on my desktop system, when I ran the test above, without
running samba-tool, just 'touch' and then 'find', the resulting content
of /root/list was

538817386     12 drwx------   2  root     root         8192 touko 22 12:21 /var/lib/NetworkManager
569212108     12 -rw-r--r--   1  root     root         9184 touko 22 12:21 /var/lib/NetworkManager/timestamps
 24183816  24580 -rw-r-----   1  root     systemd-journal 25165824 touko 22 12:20 /var/log/journal/93d3bf53b5f243388193a0c43a1dba1f/user-1000.journal

So, there was some activity from NetworkManager and a systemd-journal
wrote some entries into a user-specific journal, most likely because
some of applications in my desktop session produced some background
'noise'.

We can filter out those unrelated changes manually.

This output corresponds using 'ls -dils', you can see definitions of
options in 'man ls'.


-- 
/ Alexander Bokovoy

