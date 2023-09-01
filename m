Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B62979010D
	for <lists+samba-technical@lfdr.de>; Fri,  1 Sep 2023 19:04:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=kMuoZQgFXwGKkPEJ8RUwLKYBxf8zHDZunrF1HaLmjdc=; b=dBkU/F9mAcQ4/xopatwRlCMrI7
	9Xg7TjL9PLwti/PMAScxq+UlBC/ulOtpPZNQVnb8WC9UH5zsfWAYyv7WqrOaBOhEumsx2SI0U9W+I
	Dm2wbrsz4uNe+X1NahAB4m9rgRhAR7h5POzsQk1fj3k1JsJLFl5tZWzqaYbWavU4JHF5clyeOPXvO
	JN7ZhWryiXbOY6vRqGS1zvExkaBbjT8lk2jnBVWAy09g+9awxjVfkXdtwl1UXfZh3BMsChMGtMpqO
	d5GMXRUA6M4Md/yzjayzvHRfAZlyVdlevqhHCVEhyR/sj1v2YGUNXwmq1/6ig/dvDq1Tb0VQxbf7k
	SazWHymg==;
Received: from ip6-localhost ([::1]:25984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qc7ZD-0009ZV-TA; Fri, 01 Sep 2023 17:04:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23992) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qc7Z8-0009ZM-9I
 for samba-technical@lists.samba.org; Fri, 01 Sep 2023 17:04:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=kMuoZQgFXwGKkPEJ8RUwLKYBxf8zHDZunrF1HaLmjdc=; b=jv7uqN50rPw+J98oXuD2jJ6s96
 5vz6qdw4gTZAYheQZhKPiqSC4buZZLA31NS/zVn+QnCCia/TmKh2pFhhv185rG7TcG+erwcGdEMhv
 968Q23ZDMFS2RdjRP9o3e3PlupJY+WXw7fRQuepIExUbYeME/efzkgyzGtI1QzsFQG3kmMfmNVB8y
 52YYfUjvVEHDXL6jiW1y3Q2iItOMnBf4/FfGOBayGwHPyKYf1DlZSjaBVxsrluT74ifgfGFRr+V6b
 NdHgRTn3VkIYYlqR55n9fQA+onipu6NONo8LFLojueDDnVyphxr294dBocxagT5cJKdopz1G5rZ9p
 4YlYH0voq5HHKuJkSOgeR2AFCSjVeTxQ1gucKHuu/AMOWDjWM9MJUhNNkR7gUXPW2QIfVgduy5JGh
 BP4KzJ9d3z1jA8euROBkbMq8GvLcYEETu+CRsqBcEpwH3y339OCYY9iHb0jh8MLKTzoptyVrpMEOD
 j6WqxZu2moHl2Nf6nC4Ooijh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qc7Z6-00BHOE-1K; Fri, 01 Sep 2023 17:04:12 +0000
Date: Fri, 1 Sep 2023 10:04:10 -0700
To: Richard Sharpe <realrichardsharpe@gmail.com>
Subject: Re: Stupid users cause weird crashes in the DNS code ...
Message-ID: <ZPIZij6tviIwnAP+@jeremy-acer>
References: <CACyXjPx2amrwUZRYoMZOu+XGshLCRQtEDGsx_dfVVoLVP=VTbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CACyXjPx2amrwUZRYoMZOu+XGshLCRQtEDGsx_dfVVoLVP=VTbw@mail.gmail.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Sep 01, 2023 at 09:21:09AM -0700, Richard Sharpe via samba-technical wrote:
>Hi folks,
>
>I didn't follow the instructions carefully enough.
>
>I set up resolv.conf to point at 127.0.0.1 and an upstream nameserver
>(10.20.1.100).
>
>During provisioning that created an entry of 'dns resolver = 127.0.0.1'.
>
>That resulted in the following crash. Looks like a bug.
>
>Provisioning should not use any of the aliases for the current system
>as forwarders.
>
>In addition, perhaps the code should not crash if it gets a timeout.
>
>4.19.0rc4.

Can you add a "panic action = /bin/sleep 99999999"
and catch it in gdb. Knowing *exactly* what line
it goes down on will help. A lot :-).

