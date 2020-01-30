Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0B714DCF1
	for <lists+samba-technical@lfdr.de>; Thu, 30 Jan 2020 15:43:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Q0dq7nksdO7L5DbFNCc6i9vrmhi9DlA8Hd/cbK/f/3E=; b=IruYr6NFfcK0Pl5Or7qzxVrXIk
	BFZB1RB2XmJgR15020iyGzRxjzWwu8qWRb8INwrYqpf145rhxv9Ozgp+++ECuOzZ7krGStt3P4qpu
	15xywCzxBqZpeEzWOJKpgQAsKunIFZfot1S+kYIAMdVv/Ptqmpp+zOrZ0AmAUUqjk/TxfzV8yHmAw
	8Jx/29ncwNY9B8TbKdJRxBCgsj/SG6aHhdUiILTmxo1CSeAyx38sxIdVXCEQG/hFcCHqcVLDKHLgq
	+KUDEL78Mc7HQInv3HD1xHwrVSgWZ5h9JcrlxI1n/oI4tg3d2zuqI5zR8mhsJmZaQoGFgtt+5WjvD
	UEqfHpTg==;
Received: from localhost ([::1]:58338 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ixB24-005VQx-Kp; Thu, 30 Jan 2020 14:43:00 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:34461) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ixB1y-005VQq-MP
 for samba-technical@lists.samba.org; Thu, 30 Jan 2020 14:42:57 +0000
Received: by mail-lj1-x244.google.com with SMTP id x7so3659480ljc.1
 for <samba-technical@lists.samba.org>; Thu, 30 Jan 2020 06:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=keepertech-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bAoqBToUuh0KoPZlCDwoi6hlxc6rakgScNVg8wJAaYM=;
 b=V1mEkSq+CqrIok/PowLLESOY7h03HwAXIuHqOo5kxiSIC8jn+gdqSzMrdwkyhDnN65
 ucakElyKk5AEX4AFIZawc+Hi0JaeMNtgb88Tz/lN5r4Oq0+0cAPIY+D7ytNVwSFRX4/s
 0LU6vh5QkicIvRGIQv0aVo5uKSdKjOc6rFOfpzm3rqlajiYIRn5reCDQPBtI9VCtUF5B
 MCMHzKk/I2QOxLZsHrco/S9eNS5Ovva864Anwjt5/L92qEeo2bEXzVzBwnHtcV4+H82e
 ej6Vdaie0dyJGWR+fTp1BFRPFCkwODyc1+mB0rcQY/zcQzIXVYPbRUCT95hjVi5uQVEf
 IhhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bAoqBToUuh0KoPZlCDwoi6hlxc6rakgScNVg8wJAaYM=;
 b=dAMf8Bc4NbBpUmztsB+VQC3sterP0g6IJvgbLy8btSAeZfKu5o2IXKzqLD4XWHAXaK
 4NyYsYGRgzUgagZsi4cFAcALA2LEvqJHmfObCqk+b2/tf4qveBWcBi5HysR7ZLeTNMsn
 9HoLuYespQ4+6zJnPWVyqa8OoLIm7U0MEygJ+/YvhheM46ybL+TajVhnv8lwWeNnHBgX
 RJYQ3pN+9xZ+yjbk/QESK34zmXqYjyMPhs0BFyrdt+ltCHWep1kCAZNNqCtfts/dACfs
 wclOYhjPIAC2FN+hfanhqv3DzYVqOzrShabeHIEFw2X/hCDzgRC9q5sHiFdwfrrFk4dU
 pk3g==
X-Gm-Message-State: APjAAAX3EapvNQNE6TRcLDZSakcPqoS//TGf5J3P5wB5JWmhYI55L5jn
 OHtejFbsAosCAxCz5RraKI5DNdsRMRUZ8aECoXa//YG0z6POxw==
X-Google-Smtp-Source: APXvYqwp6K1hXNy8ZF66ug3qIgJYs5SmHE3rbHKXhnkDgnlTyAlYpMed9Lt9Pe2S8RkU9OuZb3OMLaWZ5YQNLij3wXQ=
X-Received: by 2002:a2e:3e0d:: with SMTP id l13mr3187103lja.70.1580395373573; 
 Thu, 30 Jan 2020 06:42:53 -0800 (PST)
MIME-Version: 1.0
References: <CAGbvivLQB+MfGGX-DH+7VUSB2RjPm2qr7CfpgzZZwoui3w6fdw@mail.gmail.com>
 <20200130161536.271df9ca@martins.ozlabs.org>
 <CAGbvivJ4-ZPpz9iaqPT_BEuRX5qUm9E8yQ4ePYQYHydUg_vr4g@mail.gmail.com>
In-Reply-To: <CAGbvivJ4-ZPpz9iaqPT_BEuRX5qUm9E8yQ4ePYQYHydUg_vr4g@mail.gmail.com>
Date: Thu, 30 Jan 2020 09:42:42 -0500
Message-ID: <CAGbvivKRKSQhgXqO8h+DMrJYPUBDdDrzV+fKE0JUaQ5Zr02GzQ@mail.gmail.com>
Subject: Re: ctdb, haproxy, and ip_nonlocal_bind
To: Martin Schwenke <martin@meltin.net>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Wyllys Ingersoll via samba-technical <samba-technical@lists.samba.org>
Reply-To: Wyllys Ingersoll <wyllys.ingersoll@keepertech.com>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Updated to 4.10.13, and now it doesn't get into an endless loop of failure
like before and flood the logs, but the 2nd node still isn't able to rejoin
with the first, the following logs appear every minute or so.
Note the recovery lock is on the shared filesystem (/cephfs).  The first
node shows "OK" status for node1 and UNHEALTHY  for node 2, but the node2
says that both are UNHEALTHY.

2020/01/30 09:38:16.811921 ctdbd[174621]: 192.168.113.14:4379: node
192.168.113.13:4379 is dead: 0 connected
2020/01/30 09:38:16.811999 ctdbd[174621]: Tearing down connection to dead
node :1
2020/01/30 09:38:16.812527 ctdb-recoverd[174724]: ctdb_control error: 'node
is disconnected'
2020/01/30 09:38:16.812554 ctdb-recoverd[174724]: ctdb_control error: 'node
is disconnected'
2020/01/30 09:38:16.812568 ctdb-recoverd[174724]: Async operation failed
with ret=-1 res=-1 opcode=80
2020/01/30 09:38:16.812577 ctdb-recoverd[174724]: Async wait failed -
fail_count=1
2020/01/30 09:38:16.812585 ctdb-recoverd[174724]:
../../ctdb/server/ctdb_client.c:1920 Failed to read node capabilities.
2020/01/30 09:38:16.812593 ctdb-recoverd[174724]:
../../ctdb/server/ctdb_recoverd.c:370 Failed to get node capabilities
2020/01/30 09:38:16.812600 ctdb-recoverd[174724]:
../../ctdb/server/ctdb_recoverd.c:2756 Unable to update node capabilities.
2020/01/30 09:38:16.813127 ctdbd[174621]: 192.168.113.14:4379: connected to
192.168.113.13:4379 - 1 connected
2020/01/30 09:38:16.813258 ctdbd[174621]: 192.168.113.14:4379: node
192.168.113.13:4379 is dead: 0 connected
2020/01/30 09:38:16.813279 ctdbd[174621]: Tearing down connection to dead
node :1
2020/01/30 09:38:16.814436 ctdb-recoverd[174724]:
../../ctdb/server/ctdb_recoverd.c:1342 Starting do_recovery
2020/01/30 09:38:16.814479 ctdb-recoverd[174724]: Attempting to take
recovery lock (/cephfs/ctdb/.ctdb.lock)
2020/01/30 09:38:16.816249 ctdbd[174621]: 192.168.113.14:4379: connected to
192.168.113.13:4379 - 1 connected
2020/01/30 09:38:16.816507 ctdbd[174621]: 192.168.113.14:4379: node
192.168.113.13:4379 is dead: 0 connected
2020/01/30 09:38:16.816532 ctdbd[174621]: Tearing down connection to dead
node :1
2020/01/30 09:38:16.817054 ctdbd[174621]: 192.168.113.14:4379: connected to
192.168.113.13:4379 - 1 connected
2020/01/30 09:38:16.817555 ctdbd[174621]: 192.168.113.14:4379: node
192.168.113.13:4379 is dead: 0 connected
2020/01/30 09:38:16.817580 ctdbd[174621]: Tearing down connection to dead
node :1
2020/01/30 09:38:16.819106 ctdbd[174621]: 192.168.113.14:4379: connected to
192.168.113.13:4379 - 1 connected
2020/01/30 09:38:16.819276 ctdbd[174621]: 192.168.113.14:4379: node
192.168.113.13:4379 is dead: 0 connected
2020/01/30 09:38:16.819324 ctdbd[174621]: Tearing down connection to dead
node :1
2020/01/30 09:38:16.819825 ctdbd[174621]: 192.168.113.14:4379: node
192.168.113.13:4379 is already marked disconnected: 0 connected
2020/01/30 09:38:16.823817 ctdb-recoverd[174724]: Unable to take recovery
lock - contention
2020/01/30 09:38:16.823972 ctdb-recoverd[174724]: Unable to take recovery
lock
2020/01/30 09:38:16.824173 ctdb-recoverd[174724]: Retrying recovery
2020/01/30 09:38:17.816679 ctdb-recoverd[174724]:
../../ctdb/server/ctdb_recoverd.c:1342 Starting do_recovery
2020/01/30 09:38:17.816731 ctdb-recoverd[174724]: Attempting to take
recovery lock (/cephfs/ctdb/.ctdb.lock)
2020/01/30 09:38:17.824619 ctdb-recoverd[174724]: Unable to take recovery
lock - contention
2020/01/30 09:38:17.824907 ctdb-recoverd[174724]: Unable to take recovery
lock
2020/01/30 09:38:17.825121 ctdb-recoverd[174724]: Retrying recovery
2020/01/30 09:38:18.818706 ctdb-recoverd[174724]:
../../ctdb/server/ctdb_recoverd.c:1342 Starting do_recovery
2020/01/30 09:38:18.818752 ctdb-recoverd[174724]: Attempting to take
recovery lock (/cephfs/ctdb/.ctdb.lock)
2020/01/30 09:38:18.824518 ctdb-recoverd[174724]: Unable to take recovery
lock - contention
2020/01/30 09:38:18.824671 ctdb-recoverd[174724]: Unable to take recovery
lock
2020/01/30 09:38:18.824784 ctdb-recoverd[174724]: Retrying recovery
2020/01/30 09:38:19.822390 ctdb-recoverd[174724]:
../../ctdb/server/ctdb_recoverd.c:1342 Starting do_recovery
2020/01/30 09:38:19.822439 ctdb-recoverd[174724]: Attempting to take
recovery lock (/cephfs/ctdb/.ctdb.lock)
2020/01/30 09:38:19.823006 ctdbd[174621]: 192.168.113.14:4379: connected to
192.168.113.13:4379 - 1 connected
2020/01/30 09:38:19.827168 ctdb-recoverd[174724]: Unable to take recovery
lock - contention
2020/01/30 09:38:19.827369 ctdb-recoverd[174724]: Unable to take recovery
lock
2020/01/30 09:38:19.827511 ctdb-recoverd[174724]: Retrying recovery
2020/01/30 09:38:20.820622 ctdbd[174621]: pnn 0 Invalid reqid 2649 in
ctdb_reply_control




On Thu, Jan 30, 2020 at 7:46 AM Wyllys Ingersoll <
wyllys.ingersoll@keepertech.com> wrote:

> Thanks, Ill try it and let you know.
>
> -Wyllys
>
> On Thu, Jan 30, 2020 at 12:15 AM Martin Schwenke <martin@meltin.net>
> wrote:
>
>> On Wed, 29 Jan 2020 16:43:07 -0500, Wyllys Ingersoll via
>> samba-technical <samba-technical@lists.samba.org> wrote:
>>
>> > I have a cluster in which I want to use both haproxy AND ctdb on the
>> same
>> > nodes - haproxy to manage NFSv4 (ganesha) and CTDB to manage SMB.  The
>> > reason for doing this is that I've read several warnings about NOT using
>> > NFSv4 with CTDB.
>> >
>> > haproxy + keepalived require that the net.ipv4.ip_nonlocal_bind flag be
>> set
>> > to 1 which breaks ctdb's ability to manage the virtual public IP
>> addresses
>> > (among other things).
>> >
>> > If I do not configure any public_addresses and just let haproxy
>> configure
>> > the virtual public IP addresses, CTDB is still unable to startup on
>> both of
>> > the nodes in my test cluster.  It will start on one or the other, but
>> they
>> > never sync up and come to an "OK" state on both nodes.
>> >
>> > I have the "node address" value set in the [cluster] section of
>> ctdb.conf
>> > on each node to be the private address of that node and both private
>> > addresses are listed in the nodes configuration file and the nodes are
>> > connecting to each other privately, but they don't stay connected and
>> the
>> > 2nd ctdb node never fully initializes and starts up.  At some point it
>> just
>> > begins flooding the logs with messages like this "node
>> 192.168.113.14:4379
>> > is already marked disconnected: 0 connected" and pegging the CPU at
>> almost
>> > 100% until the disk with the logging completely fills up (which sounds
>> like
>> > a bug, btw).
>> >
>> > Does anyone know of any way to make this sort of configuration work ?
>> >
>> > Currently running Samba 4.10.10, haproxy 1.6.3, and Linux Kernel
>> 4.19.34 on
>> > Ubuntu 16.04.4
>> >
>> > Any help would be much appreciated.
>>
>> Using "node address" should make this work.
>>
>> However, you're being bitten this bug:
>>
>>   https://bugzilla.samba.org/show_bug.cgi?id=14175
>>
>> This is fixed in Samba 4.10.13.
>>
>> I hope that upgrading makes this work for you.  Please let us know if
>> it doesn't...
>>
>> peace & happiness,
>> martin
>>
>
