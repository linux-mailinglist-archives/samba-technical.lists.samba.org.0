Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 312B34E92DB
	for <lists+samba-technical@lfdr.de>; Mon, 28 Mar 2022 12:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=gXWFGta8ecVMggQtyiIBBMr8TemQUoIfFR7ouyqo4QA=; b=mUo7peTN61hWwkTYjPI2nBY4YO
	Pk4wk1k8a2HxM/015Km2P/+NJDMt0y2NfOMOp8HPkkQkxmxiSJZatKrO0O9Xl2kt4fwVBVeWRizYX
	+cJul89GbqwrfZRPWUmuXH3Q0vcYslfrGMw4gQmUR1GKxH9TYa8QtQF3ntW8VsknzMotdV9tr+wjV
	d0ntMMkwTkZvgyxia7kz6S2foin6xfSMx2ZSHiJZPihva+3kTlzXudNFAh2dID/xBflvtCc4kWv8R
	odpmYTsB/s172G8wot4979JYnWLNVSJ5QwFXBNmKQfPL1fXm59Gbld1HaVYSZ3hsDgnKaS+Q1Y6ks
	kJJxeLhg==;
Received: from ip6-localhost ([::1]:40482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nYn27-005vko-HP; Mon, 28 Mar 2022 10:55:35 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:42291) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nYn23-005vkf-2d
 for samba-technical@lists.samba.org; Mon, 28 Mar 2022 10:55:33 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8A68B40A1C
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 13:55:28 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 4A953352
 for <samba-technical@lists.samba.org>; Mon, 28 Mar 2022 13:51:42 +0300 (MSK)
Message-ID: <cf23e9ec-10f8-cc3f-d2a5-af39516f5d14@msgid.tls.msk.ru>
Date: Mon, 28 Mar 2022 13:55:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: hex_encode_talloc() in libwbclient
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <5e2f2d0c-a182-30e7-8e18-00b239042cb1@samba.org>
 <97e26db1-4dd1-149d-d01e-d6431ce5ecac@msgid.tls.msk.ru>
 <a2240c745392efe4c8ebceb4ce8cddf73271cd22.camel@samba.org>
In-Reply-To: <a2240c745392efe4c8ebceb4ce8cddf73271cd22.camel@samba.org>
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

28.03.2022 02:52, Andrew Bartlett via samba-technical wrote:
> On Sat, 2022-03-26 at 20:12 +0300, Michael Tokarev via samba wrote:
>> Right now, I'm trying to deal with one missing symbol when
>> dynamically
>>
>> linking libwbclient.so: it misses hex_encode_talloc symbol since
>> obviously
>>
>> lib/util/util.o file is not included into the wbclient library link
>> line.
>>
>> Is libwbclient.so supposed to be buildable as shared library?
> 
> libwbclient as an LGPL shared lib must not depend on lib/util/util.o
> 
> We need to work out why we have code that gets brought in to
> libwbclient.so that needs this symbol.

There's nothing, actually. The whole issue was again due to PYTHONHASHSEED=1,
ie, it was an ordering issue, not LGPL-compat issue.

The name libwbclient sneaked in wrongly due to error on my part.
After whole day dealing with all these numerous libraries, I
wrote libwbclient instead of libsmbconf. It was libsmbconf which
failed to build, not libwbclient.

So here, there's no problem, except PYTHONHASHSEED= requirement.

Thanks!

/mjt

