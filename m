Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E87C4FAC7C
	for <lists+samba-technical@lfdr.de>; Sun, 10 Apr 2022 09:07:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=o1MYPvHVCmOT1XT9tpyKlEFn/GemE95po3Dzx/3csmg=; b=eieuMZxT299FTG1chZHtE4wjfm
	MmzmZOChY+9VmPTo0hb30383rwmqEjDX6KqKTdUHVJ2EQwiL27dg+YJOYC654nEWKw+fwFYwEykGx
	Ggm2Lxg4ZoqKE9c7TLmrwRAYDNIMVAH+/9WasjrbWi/pLYFvRANUlIUGD7kSdjzlNheadgwfBkWTz
	QWTD6Ak5HBV54z+EpeJ28O3EVpYL38Z+dt8+GV5lGzxObhTq5quWNuVkp5Ybd4vlv0kS84cnV20mP
	QbP6L9o+uqab5fGoQTDkSpOgTnrzArnz8m40p8w8+kv7wzGkBpHZFlB6NfRIHbIlnCxb9gOpcEta+
	vvfsXwOQ==;
Received: from ip6-localhost ([::1]:40706 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ndReb-00BLrN-GN; Sun, 10 Apr 2022 07:06:33 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:43799) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ndReB-00BLr9-PW
 for samba-technical@lists.samba.org; Sun, 10 Apr 2022 07:06:12 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4D5DC4016D;
 Sun, 10 Apr 2022 10:06:02 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 00CA52A;
 Sun, 10 Apr 2022 10:02:16 +0300 (MSK)
Message-ID: <efc8a9cf-4f1a-6950-13ec-15cdb276be4f@msgid.tls.msk.ru>
Date: Sun, 10 Apr 2022 10:06:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: waf and building python modules for multiple python versions
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <d210d52b-40f2-9420-9c12-9b5207fda5a1@msgid.tls.msk.ru>
 <8368b49259376d59184da5aadc7c156226b950a4.camel@samba.org>
 <bb99e0b1-ceaf-fa70-8830-6eb2f145f273@msgid.tls.msk.ru>
 <3b7bbcfff82c15a6e6fb8e186e75e4e8e54c6fa6.camel@samba.org>
In-Reply-To: <3b7bbcfff82c15a6e6fb8e186e75e4e8e54c6fa6.camel@samba.org>
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

10.04.2022 07:26, Andrew Bartlett via samba-technical wrote:
[]
> Just run the whole thing twice for those, right from the top, picking
> out the different modules.  The 'used elsewhere' libs are much simpler
> and only have python -> C deps thankfully.  They are also really fast
> to recompile.

I did exactly that yesterday as an experiment for talloc. That worked.
FWIW, the configure step takes about two orders of magniture
more time than compiling it - even if for talloc about 99% tests which
are done at configure time are useless :)

(For talloc it really is trivial to build it with just 3 commands to
build the 3 .so libs with about 5-10 -Defines for configure-generated
variables which re _actually_ used in there.  For other parts it is
not _that_ simple :) )

Thanks!

/mjt

