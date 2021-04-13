Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 333FA35DC6E
	for <lists+samba-technical@lfdr.de>; Tue, 13 Apr 2021 12:22:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=DA3gI8JLrikIsAne0S1d2XjfgmuhYcW+gA1nAb6CZB8=; b=qJwOwuHuhiqI/8EOuKSo7ItRwq
	11zfzXhvvR5wdcZ/yfyMaRt1lGe0pllFodk2UBImmKhScN0DJ/OlP5N4j9gnulQwJ5CRgXlfoStWN
	WnYPPTphME5em8Z6MBOJFH/5FEqDA6lfTTA3ev/UTOHS+y3+CpeX7xQkwBJFB+3UQL2rws4+XSkSb
	DOcsw9ctV9g6WJubPrSnaeJe3GrVWef654V+qAeiERP+MWztu11lET5jGk1Um2k+p7D8KQAPMcLSx
	dOU82CfiUvGeKq71yk0sDTK31LBejuc9NXx9D15bPfPE4lXKhz3+ro2I+IbUERhP1Bi0cruG9kAmZ
	owRhzutg==;
Received: from ip6-localhost ([::1]:18802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lWGAK-00B620-1x; Tue, 13 Apr 2021 10:21:04 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:51458) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lWGAD-00B61t-5x
 for samba-technical@lists.samba.org; Tue, 13 Apr 2021 10:21:02 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 3729380E74; 
 Tue, 13 Apr 2021 22:20:33 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1618309233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DA3gI8JLrikIsAne0S1d2XjfgmuhYcW+gA1nAb6CZB8=;
 b=UePHJedSQgPJ5LN7FZO0U0QmOYmSxIzQxkdod0xqf9rCYpn/5+A7LvzwMZ8KEdhGzsTKJq
 /xp9ixd0X6yEtsB+bDKsWr/YprgbGDW0+dKnn0z43aDf8kQRCf+FiWWeTKX5RXH07GHy0F
 WAJ+DrLL0U8Q502uj3noW09lNGjQiLtzz6GGT0N7VY7aGx6JR3UHAqbCI9sUUtosw9B9rj
 9RxaEEptlANJfS/rOo5tgTB1QjbYD9AYhQQO0vMTGo4RquYgTkuYcgaxB/E+b/Fd4ZBmkI
 V2BW1ClsXFZeq2+/UTvP2NBXY1CJVeStfqip17y3U18xeDJjmb0defI0bJREng==
Subject: Re: CI failure on account of C99
To: samba-technical@lists.samba.org,
 Philipp Gesang <philipp.gesang@intra2net.com>
References: <YHVls6bU63Xhd32H@crust.home.phg>
Message-ID: <380b9ca0-3322-b8cd-36da-8ba84b017b1a@catalyst.net.nz>
Date: Tue, 13 Apr 2021 22:20:31 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHVls6bU63Xhd32H@crust.home.phg>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 13/04/21 9:34 pm, Philipp Gesang via samba-technical wrote:
>     ../../lib/util/tests/time.c:119:2: error: ‘for’ loop initial declarations are only allowed in C99 mode
>       for (int i = 0; i < sizeof(data) / sizeof(data[0]); ++i) {
>       ^
>     ../../lib/util/tests/time.c:119:2: note: use option -std=c99 or -std=gnu99 to compile your code
> 
> AFAICS there’s numerous C99 constructs all over the source and
> README.Coding explicitly mentions it. Is there a special
> precaution that must be taken for this test target to work?

The Samba style is to declare all the things first.

We work in a grey zone somewhere close to C99, which we enforce by making
our default compiler GCC-with-various-flags. What has happened is that the
GCC defaults have gradually become more and more C99- or C11- or C17-ish,
and our flags are no longer regressive enough to match our standards. So
now the only build that actually follows them is Centos 7.

When we leave Centos 7 behind we will either have to fiddle with compiler
options or drop this requirement. I personally don't mind which.

Douglas

