Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BB55D2D21F6
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 05:22:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wKyEymWTPiNcGPpxEl3TQQ+IAGnap6ssTTsk24K+CCM=; b=hzMjUu1I299B6EGj9rWDXo5fYL
	8djUkS7XD9E9Edfc8HXC+U+2ict86TwObPz/Xoimde4PC62+7Zkc8rhkiWbhbb5o0Z/ydx4vREJyp
	RVf0t9fLjLrY4QUIjvEMEVa0XaQfxkA0FWCz9+3wp/ae4b4ncSyYDcxzt99zuOqqBRNVDDlbUNXqC
	gXZYPooiS0G3usGunMGx3hnWQVRzkbI4/XwVWracfeNwKtrsQOiWpVQCcvoqTtIGfFPMgeGQiSnXd
	bQvforq//U5zk+yC7133YabwAKq38csRlwJNNqHRx7eHxMPkNdfw32qGBqBESg6kmd496gDEJT6iP
	ZSZ+ovYg==;
Received: from ip6-localhost ([::1]:20370 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmUVm-0009kL-VW; Tue, 08 Dec 2020 04:22:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmUVb-0009kD-MJ
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 04:22:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=wKyEymWTPiNcGPpxEl3TQQ+IAGnap6ssTTsk24K+CCM=; b=CTLL6gW504VSLdFjZXs9YF8AEx
 RdsSzW3kmk7ut3ikduibgxtRvlNE75z2rh9AGPWW+tLNz39pIPwdtjuKNNmu2Lqg56X4UYexXFD07
 iC4t0Q//7KCAE5aYfhKueZVbE2BwTDLCdlP/g6SSNuLXZKflmCSyXO3n70zBPD6i84K/1BilfdPZy
 tIR417mexSjxZQIWvmqzJ1uqkqR3Mlua9eXV7OccgyMKkLaJW1+SSA9t4GL8ROJAdf8f+O0U+aivK
 RCoGgfi4xBiQWQwhMKqXyj6f1uHpt4JiVl/jJTqsS+WWqTUrnTKdabr9zwkQn+vL7WAEQuuU8+fqZ
 ua76dPi/i7ILLDjpAuk7i97DarE1r+WddEkrCyLWXG8YWdZlFLgYVCaeVdxKUgdi38vV+CPZ6dEdM
 c5J9ftwSK0RtfjpUjkbf7UXkeCkrsz71VYtkke46Ovz6Ck2UHKP5O3F1ZLCny1pUwzVi0mvulxlm5
 /mk+qRmp/xTDfo/dlisdN26/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmUVL-0004Ph-Et; Tue, 08 Dec 2020 04:21:35 +0000
Date: Mon, 7 Dec 2020 20:21:32 -0800
To: Namjae Jeon <namjae.jeon@samsung.com>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
Message-ID: <20201208042132.GB1875689@jeremy-acer>
References: <CGME20201208011550epcas1p26cebc8a4d2812fca862990739a059d43@epcas1p2.samsung.com>
 <007f01d6ccff$aad6f7f0$0084e7d0$@samsung.com>
 <008101d6cd05$0faa5500$2efeff00$@samsung.com>
 <CACyXjPwvNSfw9PLtUBxQQF4ysedpOE_TriTuX-JajRmFAHhQMQ@mail.gmail.com>
 <008201d6cd10$d5187910$7f496b30$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <008201d6cd10$d5187910$7f496b30$@samsung.com>
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
Cc: 'Joseph' <j@gget.it>, 'samba-technical' <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Dec 08, 2020 at 12:18:43PM +0900, Namjae Jeon via samba-technical wrote:
>I didn't want to remove ftruncate before writing in samba. I mean that there is

Well the ftruncate call comes from the SetEndOfFile, not the write.
We don't call ftruncate on write.

>an improvement if exfat fallocate is implemented. One misunderstanding is that
>the FileEndOfFileInformation request must change the size of the file.

Yes it must (unless it's setting EOF to the same value as current EOF of course).
That's the purpose of the call.

>Because of that, We may not use keep size flags of fallocate(). BTW, Why do
>windows call FileEndOfFileInformation instead of FileAllocationInformation
>of smb2 setinfo before writing?

As Ronnie said,

FileEndOfFileInformation == ftruncate();

FileAllocationInformation == fallocate(.., FALLOC_FL_KEEP_SIZE, offset, len)

