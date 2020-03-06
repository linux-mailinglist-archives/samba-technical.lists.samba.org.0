Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBF917BB66
	for <lists+samba-technical@lfdr.de>; Fri,  6 Mar 2020 12:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Mp3C3qGr22lDet9CMqD5Ilu1KaUbZEn6lyCM0HInFdc=; b=BgVd6oJpRKi1mKyyx57Et4S7cN
	KMTlfBd+UETHbzABk/WQ0b0Dh63EHfjqjiWBnydCOkoN57IKetBV1B1dEtYGiwqr2l9Pfl97hRdGi
	pcLRs3E7oaishKizXq9Yq3iYTEKhAZnSVPctHMMbuRiD9bDd2Ve7yjPos5C7EMbghi3URKl2N4kL2
	GzR03RnzfdGsMNHtr097UL0RNNyeNvSY0jnDZY7s1UdDarOEKmxBLhsDVoBv4jyfDKj47C4ga/Uk5
	BKzblND3nvKu0aCElVsqLUY6QIJQp7QKO/gYpGDg10of85OfnQd8zH06+GE9nVzW1kPaXSJShuEEJ
	uHWdNOMA==;
Received: from localhost ([::1]:20954 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jAAxw-00FHbU-Lq; Fri, 06 Mar 2020 11:16:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28602) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jAAxr-00FHbN-Bf
 for samba-technical@lists.samba.org; Fri, 06 Mar 2020 11:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=Mp3C3qGr22lDet9CMqD5Ilu1KaUbZEn6lyCM0HInFdc=; b=qYvxm9l9xu6H7Eco8aFNme3VYi
 SND5So6XN8t7GHI4vxKWYy+i40c4CSsAtgtsAK1QlXjFkIPouo+QhWq2R0DcJM05p4X1rYWuwwB3Y
 /gg66tN/SWRqDZEdkWDvuPagIaK8tmQpiaZFUDSY2GTj4xlqEmY7GyW5YmrnXP5i6Rgmkv9Exzsog
 9WoXG+dcSqxKEJG+z5T13C1Z4/3V2VT1X/Cu7c4rkSJw7jM0YoVlDbLVxSFLGnLxB1bPiKN9suV9v
 /aioa1BBns2xk0xg04wb3LtFRH9GA6ZYuUSUzq3pyBl1rqk0RXPF/vmdSNEgL7xgZWCp6E4xTd0oa
 cBBRCBlRMUYyvkF5h4C91ItqGNKh3B8oinxvxwuB+1+xkwBTCbTqUUz8fYSJkvvaJBGbHZLEnxID/
 4gRK1hfXB9b4Hr2lD//MYkOTYeVjurTe7IoxMGgx/6NE37q6AfB+ipVDmTHKad43jx4iTS4dz/mtm
 VqBBhlLKiB1+cz3F8QXrtEsL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jAAxp-0005P7-PQ; Fri, 06 Mar 2020 11:16:21 +0000
Subject: Re: Using vfs_fruit alongside vfs_recycle
To: Isaac Boukris <iboukris@gmail.com>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <CAC-fF8Tc=3A=fBU5DpstKcg7YxYvi0ugFSBTAGSMz2tp6H1MFA@mail.gmail.com>
Message-ID: <73341d2e-2a86-a43f-6fa5-dd1473cdef6e@samba.org>
Date: Fri, 6 Mar 2020 12:16:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAC-fF8Tc=3A=fBU5DpstKcg7YxYvi0ugFSBTAGSMz2tp6H1MFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Am 3/6/20 um 12:02 PM schrieb Isaac Boukris via samba-technical:
> Hi,
> 
> The manpage of vfs_fruit states that "This module is not stackable
> other than described in this manpage.", is this still correct?

well, everything is is simply not tested systematically. Many
combinations may work, with some you may run into issues...

> I'm looking into a bug report which I can reproduce on master, where
> usage of vfs_fruit alongside vfs_recycle causes an error log at level
> 0 upon deleting a file, failing to find "._filename". So I wonder if
> this configuration is unsupported or is there a logical bug here.

Iirc I've never worked with systems where vfs_recycle was configured
with fruit, so I haven't seen this before.

> [2020/03/06 12:28:48.627691,  0]
> ../../source3/modules/vfs_recycle.c:239(recycle_get_file_size)
>   recycle: stat for ./._test.txt returned No such file or directory

Hm, maybe just a too high log level in vfs_recycle? You may want to
check a log level 10 log of a reproducer to check that trail that leads
up to this error message.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

