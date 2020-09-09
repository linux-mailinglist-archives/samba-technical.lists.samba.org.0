Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC2726364E
	for <lists+samba-technical@lfdr.de>; Wed,  9 Sep 2020 20:55:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=WQbmReaYkpBAujYjFvfTW3Z3AFPf54sKId1925EQAXc=; b=DYP9KblHnTNf1+s/FWzlwg+CDJ
	wBJdYQMXHdRYd4SUaiGavuF72sU28Hcw5AV7C9tL75PcWYnTAaw8qIOK7EV8hAiPU0RHIwvlux5jl
	KjYnZhsoOLAIB0U8mWAp0r9ePJgkLiKJP5tPa/2snPk1g8pZGpVEytYr0oCN0KfRHlS5TFO8uT1eQ
	u3An1f5CFY3YqQq2MyP4pcWeAK306UZ/cHNfza2HJKRzy5I5LFyUtujhPOecVZthgv8PWYM0efl6K
	IZLYaHO5cZ7IUhKsnnZUQgDp+tnXpjXjQwW5EYl4ZJq6E7udpXY6Bx2qhBHh6hL2bMQAgqsyS2Q1S
	gWNXStNg==;
Received: from localhost ([::1]:34244 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kG5EH-004nO0-QF; Wed, 09 Sep 2020 18:54:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17802) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kG5ED-004nNt-4f
 for samba-technical@lists.samba.org; Wed, 09 Sep 2020 18:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=WQbmReaYkpBAujYjFvfTW3Z3AFPf54sKId1925EQAXc=; b=SWb+FnY0SjgTIDBZZc+QxiihOs
 ZUibvPKg5lx/HmUVBIjyHkUYZTuO/jpuDvEKFqK10ThI74bQtKieI1BFbu3fUY9DoDqC3l6upt41s
 m39T21R7xqTZ/or66FOGbAb+1QgVbUlYjnrWYcWQnylkXbgzC/B+/4FbXze5HQOL3A5TEjiZYf7is
 HbnIn+XwOC49D4QbOWyUMtdZZF0KwLZBGe9iANITrgMJW0LMzc01IsE0+IOAgG7Um8MbB2a6jO+cY
 Q19rm7LvpbXoF8aXIWJLToJ2wDY/0RphUylGiu0erOrPEFuT3+F6ceKYrq0WZdCd7/cjHNuhCeUhL
 uf3Xhd7yfn6V0kYpBXZdf3zNS2aMpClmGi/AdDhj4RVeRGDU/A8LL0WILKhtaYe/wS/XbRwP/zE/m
 v7iPrJQoNKzUj1eqaWLa8V2qlX4IpRDUZcESCJf0nfhS0wOpdBLy1DXVsaoqYc5J8KZIxjCN1rxPc
 tuXyX/hHttt5izaYtZ6sGqtR;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kG5EB-0007YS-CX; Wed, 09 Sep 2020 18:53:55 +0000
Date: Wed, 9 Sep 2020 11:53:50 -0700
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC 2020 Samba Experience
Message-ID: <20200909185350.GA790903@jeremy-acer>
References: <CAH72RCWUM8nqnOt=HeG1j4P-VEH4H+mF=2yo-yn3=uG6zxSx9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCWUM8nqnOt=HeG1j4P-VEH4H+mF=2yo-yn3=uG6zxSx9A@mail.gmail.com>
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
Cc: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 09, 2020 at 11:32:37AM +0300, hezekiah maina via samba-technical wrote:
> 
> I'm really thankful to the entire Samba community for having me as part of
> the GSoC 2020 program. I'm particularly thankful to Alexander Bokovoy and
> Andrew Bartlet. They both were my mentors for the program and were glad to
> help me resolve problems I encountered along the way. I'm also thankful to
> members who used the plugin, discovered bugs and informed me and my mentors
> about them and to all those that answered and clarified my questions on
> samba-technical.

Congratulations Hezekiah, and a big thanks for Alexander
and Andrew for being great mentors !

Hezekiah, I hope you stick around and help us improve
Samba in the future, but no matter what - good luck
in your future endeavors !

Cheers,

Jeremy.

