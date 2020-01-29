Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA4014D2AB
	for <lists+samba-technical@lfdr.de>; Wed, 29 Jan 2020 22:43:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=CNZJ92jFTzaihOtjKpuE5ujv29wiHhLGQPCRH7NQ1Zs=; b=sItTnj2SFqsZq1Eb1w8gv4fB8k
	+uk22i3gSUuZ4FO2wk4vlbIYsmOptQcsXMO2y4xuDX3UD7afDSxpb9/2OyRZtwibi6D94BP++TF/3
	vSoVHBoAoc59vbhj39mX45Jbuqgr86cTx5t12oDVrB2sFbY9r12Md+NiwaWsT4UUAjEvTZ3BKPrWP
	Z3h3bNcb7OmA2j2vfzX1tEzhaARKdioCF/xbJ2/hZ/L0ZbIUS3m+Dj0xKFusEpnbO8/BpmA6AHQ9X
	9ui9Ujv1ECCXO5cOhFM8cdAHX5gMKP9YWhzqNiUJvTEkNKh3Z7iJkRsoaIWtcohCDd5Nj7X2JRGCw
	723dVT/g==;
Received: from localhost ([::1]:20960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iwv7N-005ONZ-0c; Wed, 29 Jan 2020 21:43:25 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:44293) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwv7H-005ONS-Vx
 for samba-technical@lists.samba.org; Wed, 29 Jan 2020 21:43:22 +0000
Received: by mail-lj1-x241.google.com with SMTP id q8so1002515ljj.11
 for <samba-technical@lists.samba.org>; Wed, 29 Jan 2020 13:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=keepertech-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=5w6Ch8CzPKaQ/xLJ0wpAeLoNFGTaa8maUZM8CFuTQAY=;
 b=alKsfnWozXWBJHVhIfmHfveevzevHee6q+Nj44jfU3KrsF7704wIDZOvEr4vQNqP0y
 A+5ILigknJHR6u6oOsilzuQD8a7dUv08+mIxjiahuO/tYGrtnEWrbXqqX0ucM6LFR6DL
 oG9TQ5s/7pZZk4ll9kcQJQ5vMItRt6LA8VRHzL6fy8hXl/00TP3admbargJnSP2+LpVz
 dQ4iowz7PkRJdW7Ge5ZKBXcSxMOc7hCjthkz2SiAQU6CStfXqMPUQX6SqESsPZRAMkxL
 eEf6gzuCLqSoSdJTMFMKPjVHDzxNH+mGoTRTtYkcansy5/iN4MxTujm6TxiGnq0Orz6M
 TLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5w6Ch8CzPKaQ/xLJ0wpAeLoNFGTaa8maUZM8CFuTQAY=;
 b=qnKRfDz/ocF9epvF75cA0fAdCh5gUkFTJzW6LSPwzbltyuOlnxHYcO760dhr+xlbW0
 zYtzXYOfVpaZqggJnfthaFM91pFspHER3vUtAmy2itujZ0fZHISEGZhuqVazinx+N6HO
 rWDt95xYzhuAkab1xmbgQfZCTsY1gBUT1A9uOPxGoMz949yz+0LuaovJWdQq+TXikMGy
 uIXs0oHOc3xQLKoO4SH7wP7acAbDkPcAoRDh4rmlhpAtRHu6Zr5X6fAOfQcsE30fC/lq
 mVkeW6wa1k5Vsi5LFL8JpFDCiDoMauqQVhexpxtdXl5le9TlpxMvhZGIZdGH6Ndkt7ep
 9Aeg==
X-Gm-Message-State: APjAAAXLuNZb4ecscF7bxKb6qCWvLFhCF4jk7SjwEiFe7k/bKtPZsZLJ
 lIHAnPc8MgRMgB9btOt+ClV4v/RU8IC5TFKgqsjcvTvHc0y+og==
X-Google-Smtp-Source: APXvYqxqr0H7pXbFdGeie6qOKLQ63ZPme74nxIne/Y6Ly8ayqjr3Vbr7ukRbkR5V+T+r0ZT6f2NxAvxMDTv7eiewnxw=
X-Received: by 2002:a2e:b4f6:: with SMTP id s22mr704288ljm.218.1580334198524; 
 Wed, 29 Jan 2020 13:43:18 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 29 Jan 2020 16:43:07 -0500
Message-ID: <CAGbvivLQB+MfGGX-DH+7VUSB2RjPm2qr7CfpgzZZwoui3w6fdw@mail.gmail.com>
Subject: ctdb, haproxy, and ip_nonlocal_bind
To: samba-technical@lists.samba.org
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I have a cluster in which I want to use both haproxy AND ctdb on the same
nodes - haproxy to manage NFSv4 (ganesha) and CTDB to manage SMB.  The
reason for doing this is that I've read several warnings about NOT using
NFSv4 with CTDB.

haproxy + keepalived require that the net.ipv4.ip_nonlocal_bind flag be set
to 1 which breaks ctdb's ability to manage the virtual public IP addresses
(among other things).

If I do not configure any public_addresses and just let haproxy configure
the virtual public IP addresses, CTDB is still unable to startup on both of
the nodes in my test cluster.  It will start on one or the other, but they
never sync up and come to an "OK" state on both nodes.

I have the "node address" value set in the [cluster] section of ctdb.conf
on each node to be the private address of that node and both private
addresses are listed in the nodes configuration file and the nodes are
connecting to each other privately, but they don't stay connected and the
2nd ctdb node never fully initializes and starts up.  At some point it just
begins flooding the logs with messages like this "node 192.168.113.14:4379
is already marked disconnected: 0 connected" and pegging the CPU at almost
100% until the disk with the logging completely fills up (which sounds like
a bug, btw).

Does anyone know of any way to make this sort of configuration work ?

Currently running Samba 4.10.10, haproxy 1.6.3, and Linux Kernel 4.19.34 on
Ubuntu 16.04.4

Any help would be much appreciated.

-Wyllys Ingersoll
 Keeper Technology, LLC
