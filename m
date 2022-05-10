Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 534745210AD
	for <lists+samba-technical@lfdr.de>; Tue, 10 May 2022 11:20:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=ySH6NPplKZQJEDt8F6VBH0Vf2AurFre9JuqkKlbO028=; b=Fuw/vbr8FFOBuqTEay1xnUUnW3
	cCQ00UaZ0U7T4KHjeyzu8UCClFAEvem9SduBw37SxBOvE7eIaqD7AqyXroHqPKvoXw4IPmocwie/c
	wEeGjGYmiR0F9BcKrKKNpflO4e+khmKjIOi5l3JJuZsd9vI7N/n8Mkd9fRvs7bVKVUonhL18++eTw
	9TISIRHgpwvhJxlneYtXVl7+vNI8D38WC8z1n4wphtZInM2fHJeXxYxifOu8vLWpn7FfuXpKEwT2X
	527gMUpXAPr7N0CU3dWZp0qUjLZqP6846SYufO3GuwKD7G28GfirTXFoR0Bky3hbxJ1nhskI4LcPz
	tV8xRQUA==;
Received: from ip6-localhost ([::1]:33506 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1noM1Y-000EHZ-Le; Tue, 10 May 2022 09:19:20 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:41217) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1noM1R-000EHO-Lh
 for samba-technical@lists.samba.org; Tue, 10 May 2022 09:19:18 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id AEDE140353;
 Tue, 10 May 2022 12:19:05 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 18D9F13A;
 Tue, 10 May 2022 12:19:05 +0300 (MSK)
Message-ID: <32a069f2-ecf5-ee08-ee80-30183e72e428@msgid.tls.msk.ru>
Date: Tue, 10 May 2022 12:19:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: waf, PYTHONHASHSEED & -I order on other architectures
Content-Language: en-US
To: Thomas Nagy <tnagy@waf.io>,
 samba-technical <samba-technical@lists.samba.org>
References: <E1noCjW-0005xO-Fz@rmmprod05.runbox>
In-Reply-To: <E1noCjW-0005xO-Fz@rmmprod05.runbox>
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

10.05.2022 02:24, Thomas Nagy via samba-technical wrote:
...
> About the guts of waf:
> 
> When changing the PYTHONHASHSEED value in the Makefile and adding traces (--zones=deps):
> """
> WAF_BINARY=$(PYTHON) ./buildtools/bin/waf --zones=deps
> WAF=PYTHONHASHSEED=20 WAF_MAKE=1 $(WAF_BINARY)
> """
> 
> A full rebuild is observed here. The library link order changes as reflected by the traces below:

As I already wrote in another email, it is not "just" the link order.
Well, it is, but sometimes it even produces an executable (or a library)
which starts but crashes later.  We have such a broken build of samba in
debian i386 stable right now - at the time we didn't know about this
PYTHONHASHSEED thing at all, so it was a random thing, and one of the
values it choosen resulted in a broken build with us puzzled entirely,
thinking it is due to some 32/64 bit issue.

...
> They take their origin in the file buildtools/wafsamba/samba_deps.py before reaching the Waf parts. That file contains a significant amount of non-trivial set() operations.

Yes.

> Even if a hash seed is provided, the link order may change with a new Python version or on a different operating system.

And it *does* change with different python version and on different
architectures as I already mentioned in this thread.  It did change
when switching from pythin3.9 to 3.10 too, and here it is the sparc64
build which does not work at all.

/mjt

