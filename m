Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F056287A1
	for <lists+samba-technical@lfdr.de>; Mon, 14 Nov 2022 18:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=qgb3vMfYxVabzJ6/dALzxYjUnB1qM3Scl+sbpBdSe9o=; b=IGpbDMo9fRQDTBqEgZYUcfzt5e
	00U/9zrL6GysjCB8AlIZAN+HY559Afij9HTBlhNxwbHUpYvuLxOakBfdXkPBF0ElcdQYWGspctrWY
	+DHBWbmdICOiAolCPKmxXfvdMce2Ih0X6y6wSdtF7G3GYMQKaQ7jM2lr701MIdqJVE5cCDA6UL5mG
	0bJrUQA4o2h1GfD67f1WJZhLG5jMfB4kk+FjiGDpcZ+KDtb6PSgAyzVixCfkAT2SL/P76p4PLMXeT
	UthOQv2lUgutx3Fya1TaktPQpKC54IJiVgpeVBpMnC8gMf0YXilrIUR/+rBcpNmbicSJ/MHw8hjqO
	2/hles/A==;
Received: from ip6-localhost ([::1]:38306 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oudjN-00DCFf-5o; Mon, 14 Nov 2022 17:58:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16458) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oudjJ-00DCFW-BS
 for samba-technical@lists.samba.org; Mon, 14 Nov 2022 17:58:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=qgb3vMfYxVabzJ6/dALzxYjUnB1qM3Scl+sbpBdSe9o=; b=QXjqM9Rky4tBPzSmSrzjBjLv0D
 Y1XlbpLGuwvUHuovflWnv2MtoS/IDr065EOC8MxW+Z0mTWyg0JEKzW0tT4YsPKspBLv+Dt1O9OaB+
 6ZEjj7H28m5Oy0Aa55iZBGDnU1MexD+C6GKRhu7Z894vZovyB5+61fDyzQiDQwMn2148SKFDTSn4v
 KFMzi7giOp+x+KbGz2mJ4KV+Sjoipg1c9VjTiSy4t7wPyw645dmhcIsn6MqlwR4L/8MwjD/xxoHOv
 svnWhIe1tcNJvQtD4/MsEZdZWW7Ah1vmmS6bjseB4eBfJby9GkJBt83eZb5y51uHo7KBfagezdQ+6
 eIpNbQwgxF8LTX36xK6EfmkiNFAdsyDcu1UJKJzO7TUmzK+qTJBKGNJtn7QY7cF935YV0bXNGOrS0
 XjbF8LjZrQIqC5DaGuI+SC0QnSNTWOvIFYOrEcqdaD/pXIFS45m8KrcGngjH0GXGdGoikGv2ishHQ
 q1GklTtwmqOzo1Q/XVJDuHlL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oudjI-008ZqU-GL; Mon, 14 Nov 2022 17:58:44 +0000
Date: Mon, 14 Nov 2022 09:58:42 -0800
To: Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: failing tests in the testsuite on debian
Message-ID: <Y3KB0gz+EtO3RSzP@jeremy-acer>
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <06c4ce9f-0dfb-8deb-7ef0-78ffd78e630c@msgid.tls.msk.ru>
 <919e7519-7787-f0dd-12ea-99ba664ac312@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <919e7519-7787-f0dd-12ea-99ba664ac312@msgid.tls.msk.ru>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Nov 13, 2022 at 12:14:45AM +0300, Michael Tokarev via samba-technical wrote:
>12.11.2022 23:24, Michael Tokarev via samba-technical wrote:
>..
>>NSS_WRAPPER_HOSTS='/build/pkg/samba-4.17.2+dfsg/testbuild/st/hosts' 
>>SOCKET_WRAPPER_DEFAULT_IFACE="21" RESOLV_WRAPPER_HOSTS="/build/pkg/samba-4.17.2+dfsg/testbuild/st/dns_h>
>>failed to start up environment 'rpc_proxy' at /build/pkg/samba-4.17.2+dfsg/testbuild/selftest/target/Samba.pm line 126.
>>samba can't start up known environment 'rpc_proxy' at /build/pkg/samba-4.17.2+dfsg/testbuild/selftest/selftest.pl line 824.
>>no output for name[samba4.rpc.echo against rpc proxy with domain creds(rpc_proxy)]
>
>I can't seem to be able to 'whitelist' this.  Adding
>
> samba4.rpc.echo against rpc proxy with domain creds\(rpc_proxy\)
>
>or some variations to the knownfail list makes no difference. Adding
>samba4.rpc.echo.* makes whole lot of false positives which also fails.
>
>How to mark this failure as "known" properly?

Getting the wildcarding right for knowfail is a bear :-(.

Ensure you escape spaces with \.

