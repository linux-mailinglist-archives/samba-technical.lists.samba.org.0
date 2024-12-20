Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C119F90DE
	for <lists+samba-technical@lfdr.de>; Fri, 20 Dec 2024 12:06:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=gk0oDnoLZESfC+jR1kACYgbIp2BFFKzXjx+/B6nm2ho=; b=eAvsHvp0mdBaejYO9ysuLYnkbM
	vh1gvioVqUA36Cv+uhPXai/HqIhNVoF6Cum2Nt3JQczUrIzjK+kQkJyxaWyRyYHyqVz5zHJEETK03
	MZ/+lOvWSODKoNHjcwOWUydM87FrKPC0d3liPkme7MCX/QN40ImNphTn4X6+t32VFGvhyik1S/YY1
	OhbvJthSnbH4Z5Z3WsDBaRUpHYZE/IjmwQlqMj4Ub1hsjq4gpDa/XvRhkdvrhXSVeTwURY4M9z5bP
	F4anM2aurGUuvAgN6dkOKTiP6zWV4777v1GP2W8wX8f0etK3+r3nJ9ujalsIKsdn1fxPRtSz9RFkb
	aWRm8abA==;
Received: from ip6-localhost ([::1]:29398 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tOapN-004doO-2k; Fri, 20 Dec 2024 11:05:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53586) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tOapI-004doG-61
 for samba-technical@lists.samba.org; Fri, 20 Dec 2024 11:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=gk0oDnoLZESfC+jR1kACYgbIp2BFFKzXjx+/B6nm2ho=; b=kJNvkIKiZkpu3X8rAPQ9FHKtLB
 G3tYZ5pQs7LpnMOPpym2ChFloDaG5Tb5DLCQTofLpswVWyWqfG3zUA0JPo5dQnlBfPAXm3/DGJnyc
 vDn1TOoqJgU+vqVJkqWI+s1S2HfxjmaLFIMe4OALPiHdbNi/Sv/pKf/hzgM+bZ0YLroW6oWs046/I
 92+jtFc4pfomuq7G9NchFL85Gldoq6otsL0AyQsb+aUuM+7r039K3STCZ1ziYG9F2SdWeCl7WbeLV
 bR0J3MvOzZ3qyXkPFKgcdoWiuNEzNO5VlQDxMOFDw2ewVeb/QBSUTqRUlla+NXfjYuBUBof8gEZ30
 QyoF9Ruvdqbe4iiZKGlOt1XwEDiR1pcyjnp8A93Yu3EVpd6xg0aEubhEQjLIZ44XIiI09/W+K+sFb
 huASkDrtt/YqtLXUWKfXlJZwMndBlRU0022MhfAUBZnFTvEbZecDKspKVzF+P+KkL6UgrxClZGwfX
 G/WsjFZe+LyJMnIo/6+EW0/l;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tOapH-003Sup-05; Fri, 20 Dec 2024 11:05:47 +0000
Message-ID: <eb5d5dd6-3ab1-496d-a215-add1161f0e9d@samba.org>
Date: Fri, 20 Dec 2024 12:05:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: opendir()/readdir() bug in smbd
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org,
 jra@samba.org
References: <9807376.eNJFYEL58v@magrathea>
Content-Language: en-US, de-DE
In-Reply-To: <9807376.eNJFYEL58v@magrathea>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

For true concurrency there will always be a race and afaict true 
concurrency is actually not the problematic scenario.

The problematic scenario seems to be an application bug in our torture 
test doing the following sequence of operations:

- open directory
- create "file" in directory
- list directory and expect created file to be present in the list of files

This is an application bug, because as specified by POSIX, it is 
undefined whether "file" is returned.

While adding a rewinddir() would fix the application problem, I'm 
reluctant to changing our server code in a way that would at least 
require tracking of the state of directory fsps and whether an incoming 
list request is the first one or not.

So what about just keeping the application fixed and moving on?

Thanks for looking into this!
-slow


On 12/20/24 11:51 AM, Andreas Schneider via samba-technical wrote:
> Hi,
> 
> we have a bug in Samba which I discovered by running tests on btrfs.
> 
> The POSIX specification for readdir/opendir is the following:
> 
>    If a file is removed from or added to the directory after the most recent
>    call to opendir() or rewinddir(), whether a subsequent call to readdir()
>    returns an entry for that file is **unspecified**.
> 
> See https://pubs.opengroup.org/onlinepubs/9799919799/functions/readdir.html
> 
> ext4:
> 
> $ ./repro
> opendir(foo)
> creat(foo/bar)
> readdir() loop
>    readdir entry: .
>    readdir entry: ..
>    readdir entry: bar
> readdir() detected the newly created file foo/bar
> 
> 
> btrfs:
> 
> $ ./repro
> opendir(foo)
> creat(foo/bar)
> readdir() loop
>    readdir entry: .
>    readdir entry: ..
> readdir() did NOT detect the newly created file foo/bar
> 
> 
> I've discussed this with our Kernel people and it is a bug in Samba, we have
> to call rewinddir().
> 
> 
> btrfs:
> 
> $ ./repro rewind
> opendir(foo)
> creat(foo/bar)
> rewinddir(foo)
> readdir() loop
>    readdir entry: .
>    readdir entry: ..
>    readdir entry: bar
> readdir() detected the newly created file foo/bar
> 
> 
> I'm not a file server expert, so I would appreciate if someone could look into
> that.
> 
> Either we call rewinddir() after a file has been created or deleted, or we
> call it before a directory traversal is started. rewinddir() is actually doing
> an lseek().
> 
> The following commits should be reverted once we have a fix:
> 
> fe96aa111cdcc0f753075cccb8f1fd44791abaab
> 38b8a4f2232ca3e8dc4596c080df770f07fa49a8
> 
> 
> 
> Best regards
> 
> 
> 	Andreas
> 
> P.S. tmpfs also behaves like btrfs
> 
> 


