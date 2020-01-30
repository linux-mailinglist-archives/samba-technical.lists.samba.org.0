Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 564A514DDF2
	for <lists+samba-technical@lfdr.de>; Thu, 30 Jan 2020 16:34:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ERra8OdXMkIOhK4ECWEOKGWfop19HQYwdW6ogPyMH5Y=; b=TdoXceid3Rzv714qMub9+RWm4n
	8BfG49QoODLQn6UZdYU37c9VFEe9R7P23PhQfZrnUMrPsJKfp6dqHS4NHDCJiuJrUunInXIRHk12y
	r92voloF23pMGeKnmuN8gpE4a5idRsvGu/9EuVdpBMqqKIDdrHdM2sHZ2OP9R/yFo7Cnnj0mGW1TA
	0ooMNfLxmqRjq3Igeml+NPDoNe6xhw6M1HaWEeLbEHlB95e0y/sBp16ET5YhTPIG9hmx5q+zYsFyI
	sXbH1ytKsoJ4en4MePqqq+COdvLRbL+qwC73ShFFscoPnzFr1wBB1D8pFg9045E3zyPhLYY9vCe/t
	NBAiUOAQ==;
Received: from localhost ([::1]:22552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ixBps-005X3l-M8; Thu, 30 Jan 2020 15:34:28 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:33730) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ixBpm-005X1x-QS
 for samba-technical@lists.samba.org; Thu, 30 Jan 2020 15:34:25 +0000
Received: by mail-lj1-x244.google.com with SMTP id y6so3854252lji.0
 for <samba-technical@lists.samba.org>; Thu, 30 Jan 2020 07:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=keepertech-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fgsYggnY9rxX7oMHHZS0KMgqGD69uTcpJVq1ep9uRgw=;
 b=hON18sjrcQXc9hh98cR83qrkQgFWqKHvN+9LCpok9KJ4N6Yhb/yhlTf9ZPrB4f6riE
 iq+lM5uYfQS7Bp4wiXng3ujX3jRW3rEP+GGZ7EQbhAHCwBBtaI8R5IS5V1NwAGoywvyB
 hOdj1Wpd/FUepY5blEX/F23LekK9G2QDCOxo+aeHKXZH7JiShvoflc7QNr+RidOwsm4d
 rAFf0uAXPPDry8yUGQXOvkLB9Wm16qV4awYrXNT8wr3XFdV0JJtV/mTg3q4X2mHjhouF
 RGJM7v+EmLcIt4I/4QKv7fqiMuEj+UtuGD45Ewyr0KRqQ9XIqDXYOHkY38agyVf4cDOn
 1Q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fgsYggnY9rxX7oMHHZS0KMgqGD69uTcpJVq1ep9uRgw=;
 b=klvukNa24uw2asuXMf+2N4M+mtEwICIPyz/EENmSkCCuTpgVRn3RwLcWpUinMyXYyd
 KqTSxf2e2R2gG4wHa38lK6Janv5wh/31vahOdOa5Hvzo2++fXl4+36tCrQxAu7MYWxwm
 +fZtjPQx7l/oEhHJ5OTcnE5f4n+CWcdrBZZu1y/0T8du7rrc7293qFNIu26L1BugT0Hp
 faAEpkZwc7i9B8z15PSfBxNh1KUYugQ7W89lfQlOlEklaO+Q8Ud1Hd/3DXLiVQ3ZETLH
 5XvIJ7wHtarTdi7PPoSQLRGRDtWk0fGPaGnayqyg9BuFmGqXZ1XOpPRDbIipMh8apMfI
 64Yw==
X-Gm-Message-State: APjAAAUcvkS+pId+8cJvw4LuvtH40+bOR+/8pTrwsD3f3Fw/TTWIJqhW
 20hF/4iZINzM8EeKnbEHoteAgfbP4vZLEIZB70O7XaEET/E=
X-Google-Smtp-Source: APXvYqyrPe1X+g0r5dk6ZzkClR3CGrAzBPTq8OADmnLKWu4NK8pu/DOnuydcL3qnFSwv/9dTSIuV/uNQIjWBjREsc/s=
X-Received: by 2002:a2e:3e0d:: with SMTP id l13mr3335151lja.70.1580398461831; 
 Thu, 30 Jan 2020 07:34:21 -0800 (PST)
MIME-Version: 1.0
References: <CAGbvivLQB+MfGGX-DH+7VUSB2RjPm2qr7CfpgzZZwoui3w6fdw@mail.gmail.com>
 <20200130161536.271df9ca@martins.ozlabs.org>
 <CAGbvivJ4-ZPpz9iaqPT_BEuRX5qUm9E8yQ4ePYQYHydUg_vr4g@mail.gmail.com>
 <CAGbvivKRKSQhgXqO8h+DMrJYPUBDdDrzV+fKE0JUaQ5Zr02GzQ@mail.gmail.com>
In-Reply-To: <CAGbvivKRKSQhgXqO8h+DMrJYPUBDdDrzV+fKE0JUaQ5Zr02GzQ@mail.gmail.com>
Date: Thu, 30 Jan 2020 10:34:11 -0500
Message-ID: <CAGbvivJL8NFWzc0_aBYu4aUMsRdu7ZhQ=HFmE9OCGChiJ0W02A@mail.gmail.com>
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

Follow up - got it working.

The problem I was having was that the ordering of the IP addresses in the
"nodes" file was different on each of the nodes.  I didn't think that the
ordering would matter if I had specified "node address" in the ctdb.conf
[global] config section, but apparently it's important.

Now both nodes are in OK status and I can mount shares through an IP
address managed by haproxy.

Thanks for the help!



On Thu, Jan 30, 2020 at 9:42 AM Wyllys Ingersoll <
wyllys.ingersoll@keepertech.com> wrote:

> Updated to 4.10.13, and now it doesn't get into an endless loop of failure
> like before and flood the logs, but the 2nd node still isn't able to rejoin
> with the first, the following logs appear every minute or so.
> Note the recovery lock is on the shared filesystem (/cephfs).  The first
> node shows "OK" status for node1 and UNHEALTHY  for node 2, but the node2
> says that both are UNHEALTHY.
>
> 2020/01/30 09:38:16.811921 ctdbd[174621]: 192.168.113.14:4379: node
> 192.168.113.13:4379 is dead: 0 connected
> 2020/01/30 09:38:16.811999 ctdbd[174621]: Tearing down connection to dead
> node :1
> 2020/01/30 09:38:16.812527 ctdb-recoverd[174724]: ctdb_control error:
> 'node is disconnected'
> 2020/01/30 09:38:16.812554 ctdb-recoverd[174724]: ctdb_control error:
> 'node is disconnected'
> 2020/01/30 09:38:16.812568 ctdb-recoverd[174724]: Async operation failed
> with ret=-1 res=-1 opcode=80
> 2020/01/30 09:38:16.812577 ctdb-recoverd[174724]: Async wait failed -
> fail_count=1
> 2020/01/30 09:38:16.812585 ctdb-recoverd[174724]:
> ../../ctdb/server/ctdb_client.c:1920 Failed to read node capabilities.
> 2020/01/30 09:38:16.812593 ctdb-recoverd[174724]:
> ../../ctdb/server/ctdb_recoverd.c:370 Failed to get node capabilities
> 2020/01/30 09:38:16.812600 ctdb-recoverd[174724]:
> ../../ctdb/server/ctdb_recoverd.c:2756 Unable to update node capabilities.
> 2020/01/30 09:38:16.813127 ctdbd[174621]: 192.168.113.14:4379: connected
> to 192.168.113.13:4379 - 1 connected
> 2020/01/30 09:38:16.813258 ctdbd[174621]: 192.168.113.14:4379: node
> 192.168.113.13:4379 is dead: 0 connected
> 2020/01/30 09:38:16.813279 ctdbd[174621]: Tearing down connection to dead
> node :1
> 2020/01/30 09:38:16.814436 ctdb-recoverd[174724]:
> ../../ctdb/server/ctdb_recoverd.c:1342 Starting do_recovery
> 2020/01/30 09:38:16.814479 ctdb-recoverd[174724]: Attempting to take
> recovery lock (/cephfs/ctdb/.ctdb.lock)
> 2020/01/30 09:38:16.816249 ctdbd[174621]: 192.168.113.14:4379: connected
> to 192.168.113.13:4379 - 1 connected
> 2020/01/30 09:38:16.816507 ctdbd[174621]: 192.168.113.14:4379: node
> 192.168.113.13:4379 is dead: 0 connected
> 2020/01/30 09:38:16.816532 ctdbd[174621]: Tearing down connection to dead
> node :1
> 2020/01/30 09:38:16.817054 ctdbd[174621]: 192.168.113.14:4379: connected
> to 192.168.113.13:4379 - 1 connected
> 2020/01/30 09:38:16.817555 ctdbd[174621]: 192.168.113.14:4379: node
> 192.168.113.13:4379 is dead: 0 connected
> 2020/01/30 09:38:16.817580 ctdbd[174621]: Tearing down connection to dead
> node :1
> 2020/01/30 09:38:16.819106 ctdbd[174621]: 192.168.113.14:4379: connected
> to 192.168.113.13:4379 - 1 connected
> 2020/01/30 09:38:16.819276 ctdbd[174621]: 192.168.113.14:4379: node
> 192.168.113.13:4379 is dead: 0 connected
> 2020/01/30 09:38:16.819324 ctdbd[174621]: Tearing down connection to dead
> node :1
> 2020/01/30 09:38:16.819825 ctdbd[174621]: 192.168.113.14:4379: node
> 192.168.113.13:4379 is already marked disconnected: 0 connected
> 2020/01/30 09:38:16.823817 ctdb-recoverd[174724]: Unable to take recovery
> lock - contention
> 2020/01/30 09:38:16.823972 ctdb-recoverd[174724]: Unable to take recovery
> lock
> 2020/01/30 09:38:16.824173 ctdb-recoverd[174724]: Retrying recovery
> 2020/01/30 09:38:17.816679 ctdb-recoverd[174724]:
> ../../ctdb/server/ctdb_recoverd.c:1342 Starting do_recovery
> 2020/01/30 09:38:17.816731 ctdb-recoverd[174724]: Attempting to take
> recovery lock (/cephfs/ctdb/.ctdb.lock)
> 2020/01/30 09:38:17.824619 ctdb-recoverd[174724]: Unable to take recovery
> lock - contention
> 2020/01/30 09:38:17.824907 ctdb-recoverd[174724]: Unable to take recovery
> lock
> 2020/01/30 09:38:17.825121 ctdb-recoverd[174724]: Retrying recovery
> 2020/01/30 09:38:18.818706 ctdb-recoverd[174724]:
> ../../ctdb/server/ctdb_recoverd.c:1342 Starting do_recovery
> 2020/01/30 09:38:18.818752 ctdb-recoverd[174724]: Attempting to take
> recovery lock (/cephfs/ctdb/.ctdb.lock)
> 2020/01/30 09:38:18.824518 ctdb-recoverd[174724]: Unable to take recovery
> lock - contention
> 2020/01/30 09:38:18.824671 ctdb-recoverd[174724]: Unable to take recovery
> lock
> 2020/01/30 09:38:18.824784 ctdb-recoverd[174724]: Retrying recovery
> 2020/01/30 09:38:19.822390 ctdb-recoverd[174724]:
> ../../ctdb/server/ctdb_recoverd.c:1342 Starting do_recovery
> 2020/01/30 09:38:19.822439 ctdb-recoverd[174724]: Attempting to take
> recovery lock (/cephfs/ctdb/.ctdb.lock)
> 2020/01/30 09:38:19.823006 ctdbd[174621]: 192.168.113.14:4379: connected
> to 192.168.113.13:4379 - 1 connected
> 2020/01/30 09:38:19.827168 ctdb-recoverd[174724]: Unable to take recovery
> lock - contention
> 2020/01/30 09:38:19.827369 ctdb-recoverd[174724]: Unable to take recovery
> lock
> 2020/01/30 09:38:19.827511 ctdb-recoverd[174724]: Retrying recovery
> 2020/01/30 09:38:20.820622 ctdbd[174621]: pnn 0 Invalid reqid 2649 in
> ctdb_reply_control
>
>
>
>
> On Thu, Jan 30, 2020 at 7:46 AM Wyllys Ingersoll <
> wyllys.ingersoll@keepertech.com> wrote:
>
>> Thanks, Ill try it and let you know.
>>
>> -Wyllys
>>
>> On Thu, Jan 30, 2020 at 12:15 AM Martin Schwenke <martin@meltin.net>
>> wrote:
>>
>>> On Wed, 29 Jan 2020 16:43:07 -0500, Wyllys Ingersoll via
>>> samba-technical <samba-technical@lists.samba.org> wrote:
>>>
>>> > I have a cluster in which I want to use both haproxy AND ctdb on the
>>> same
>>> > nodes - haproxy to manage NFSv4 (ganesha) and CTDB to manage SMB.  The
>>> > reason for doing this is that I've read several warnings about NOT
>>> using
>>> > NFSv4 with CTDB.
>>> >
>>> > haproxy + keepalived require that the net.ipv4.ip_nonlocal_bind flag
>>> be set
>>> > to 1 which breaks ctdb's ability to manage the virtual public IP
>>> addresses
>>> > (among other things).
>>> >
>>> > If I do not configure any public_addresses and just let haproxy
>>> configure
>>> > the virtual public IP addresses, CTDB is still unable to startup on
>>> both of
>>> > the nodes in my test cluster.  It will start on one or the other, but
>>> they
>>> > never sync up and come to an "OK" state on both nodes.
>>> >
>>> > I have the "node address" value set in the [cluster] section of
>>> ctdb.conf
>>> > on each node to be the private address of that node and both private
>>> > addresses are listed in the nodes configuration file and the nodes are
>>> > connecting to each other privately, but they don't stay connected and
>>> the
>>> > 2nd ctdb node never fully initializes and starts up.  At some point it
>>> just
>>> > begins flooding the logs with messages like this "node
>>> 192.168.113.14:4379
>>> > is already marked disconnected: 0 connected" and pegging the CPU at
>>> almost
>>> > 100% until the disk with the logging completely fills up (which sounds
>>> like
>>> > a bug, btw).
>>> >
>>> > Does anyone know of any way to make this sort of configuration work ?
>>> >
>>> > Currently running Samba 4.10.10, haproxy 1.6.3, and Linux Kernel
>>> 4.19.34 on
>>> > Ubuntu 16.04.4
>>> >
>>> > Any help would be much appreciated.
>>>
>>> Using "node address" should make this work.
>>>
>>> However, you're being bitten this bug:
>>>
>>>   https://bugzilla.samba.org/show_bug.cgi?id=14175
>>>
>>> This is fixed in Samba 4.10.13.
>>>
>>> I hope that upgrading makes this work for you.  Please let us know if
>>> it doesn't...
>>>
>>> peace & happiness,
>>> martin
>>>
>>
