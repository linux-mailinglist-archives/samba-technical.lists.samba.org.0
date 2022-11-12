Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC18626BD3
	for <lists+samba-technical@lfdr.de>; Sat, 12 Nov 2022 22:15:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JuzoGUHJYafYURDwQVR+pCesJYGie1ZFuvR+QImzdvc=; b=KXtRukPrWmQBtZBUI2VTqfcHDs
	UbzfMO3GJCqpKQvPA1LzG079GQjm9FNPlhwEIkm5l2qd3GP3xNfruNm8ji5AnRZOX1y+WwsWHqibY
	gR5SnYa5WWcLPmwVschvEMdM+IGORi5KcHWHwhZPowFRlXgOJ/A2MWuc3yX9Mbc3hXEDlqqXElP9V
	IkqYJznatqgFeYcjWalcuS1BHpXr+DbPjd3qMnEt8+Qqf8kRO769pSc/yKPVq5FrmVaqTzQDkcqN7
	rUfvSXhljCZ27fVawvMaz3nkiGXLlmEyXAIOymaBN37hslc+ebbhOAd05rE19Ni+XF3e77uKlOYZH
	KXrkBcIg==;
Received: from ip6-localhost ([::1]:21492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1otxq9-00CajY-SS; Sat, 12 Nov 2022 21:15:01 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:53801) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1otxq5-00Cab0-Om
 for samba-technical@lists.samba.org; Sat, 12 Nov 2022 21:14:59 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A73D440199
 for <samba-technical@lists.samba.org>; Sun, 13 Nov 2022 00:14:47 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 5A6146B
 for <samba-technical@lists.samba.org>; Sun, 13 Nov 2022 00:14:52 +0300 (MSK)
Message-ID: <919e7519-7787-f0dd-12ea-99ba664ac312@msgid.tls.msk.ru>
Date: Sun, 13 Nov 2022 00:14:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: failing tests in the testsuite on debian
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <4197c161-ef1e-3710-f50e-7631ddaf5f3f@msgid.tls.msk.ru>
 <06c4ce9f-0dfb-8deb-7ef0-78ffd78e630c@msgid.tls.msk.ru>
In-Reply-To: <06c4ce9f-0dfb-8deb-7ef0-78ffd78e630c@msgid.tls.msk.ru>
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

12.11.2022 23:24, Michael Tokarev via samba-technical wrote:
..
> NSS_WRAPPER_HOSTS='/build/pkg/samba-4.17.2+dfsg/testbuild/st/hosts' SOCKET_WRAPPER_DEFAULT_IFACE="21" 
> RESOLV_WRAPPER_HOSTS="/build/pkg/samba-4.17.2+dfsg/testbuild/st/dns_h>
> failed to start up environment 'rpc_proxy' at /build/pkg/samba-4.17.2+dfsg/testbuild/selftest/target/Samba.pm line 126.
> samba can't start up known environment 'rpc_proxy' at /build/pkg/samba-4.17.2+dfsg/testbuild/selftest/selftest.pl line 824.
> no output for name[samba4.rpc.echo against rpc proxy with domain creds(rpc_proxy)]

I can't seem to be able to 'whitelist' this.  Adding

  samba4.rpc.echo against rpc proxy with domain creds\(rpc_proxy\)

or some variations to the knownfail list makes no difference. Adding
samba4.rpc.echo.* makes whole lot of false positives which also fails.

How to mark this failure as "known" properly?

/mjt

