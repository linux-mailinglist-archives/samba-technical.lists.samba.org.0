Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD7A4048D2
	for <lists+samba-technical@lfdr.de>; Thu,  9 Sep 2021 13:00:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=JUqUB5cARqh5uAlw0IMirVs+uCwHE1JtgMPPWFrV0FA=; b=ClzlumLkFzt8+EjuKsJ87xAqkA
	ZbqqZ+1u9JzXND36+xUE06bqGIGY6E+iD0LzFd8GhPQsgGgr5lccSQT7IR3V2xTiWotZ+B64dlwho
	QgZa7Dm002987v2meyG7oZ1/egCkShXoufuKu9VPf3OgcxS9PUk3akNvfN4yt9rPrtUEC7OTUWBFY
	bstlCUCZQUwbpbHaUaxQhXIEp9AErWRo7pdDOgegvnQ1Gd4SkNOJTvgQhzYco5VpunEq2dE9jEFyj
	KkjQMTgTP3kZm4eCDNiHh5TpCrlD7gN/2w/GbUPBsEQKULFpGdyAE+9vQ2CBCvjjy+Lun0Bq8HhYN
	3WycfXKA==;
Received: from ip6-localhost ([::1]:23412 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mOHmq-00E4AH-CH; Thu, 09 Sep 2021 11:00:08 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60580) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mOHmk-00E4A7-R7
 for samba-technical@lists.samba.org; Thu, 09 Sep 2021 11:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=JUqUB5cARqh5uAlw0IMirVs+uCwHE1JtgMPPWFrV0FA=; b=2Q7VahFi62RoIpHSQpMJBefOM+
 ujYQnQBFUpmIePLZgGsStLujFJejPqQaEERYTcNAWTS4meh2kNeyuund+pDd5sCH292udvU3xeMTJ
 UwUYeLcxWczD2LzOF4AlUQiv87yjLRJgWmer7YXR5rtJUmKGQ8vPW7vRJk3ajKB3IS2Vid3LmtHyl
 eYNCUVXK4QD0JK2ldPHA0HiWTEv/NGb1pUgaOE70bV0CzB1iATXquWL+vr5S6fyPvDqZTt8xeURIL
 I32dJnsL0IbN77SW2iBu0eqjo94FPQIb3pt4mp/HpVGOIif1PNlnNeWdwiNXBfq47Ty8rkKPll3Ve
 xyg8bBv+j/rkfnErEyfuqlNfbK41P8x5L3Goe2jBkB1519k+BoyBeAfnnP8JU3RZn05wRY/emyOel
 yZZb+QGknRQ/qB5PuT1WDJravhEVpKB5zqrTrIJv9a0RuB+oVlI3Kr+596CUtUwKw4EVWcXmBCb68
 iRz0GV46BwEjKvKvDeUua95X;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mOHmj-005OZ9-4D; Thu, 09 Sep 2021 11:00:01 +0000
Subject: Re: No Tsocket Unit tests? - Re: Samba | libcli:dns: SAMBA_INTERNAL
 DNS, set forwarder port (!2148)
To: Matt Grant <matt@mattgrant.net.nz>
References: <reply-031540943ffd4db283b8bf3147bd656a@gitlab.com>
 <merge_request_115283584@gitlab.com> <note_671906917@gitlab.com>
 <CAHA-KoNQo0VmBccX1FyzvoYepu9=Vq8eWPzWS8HtYNXTNOv2Hw@mail.gmail.com>
Message-ID: <538f0db3-a91a-662b-98b7-368f53e19d3b@samba.org>
Date: Thu, 9 Sep 2021 14:00:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHA-KoNQo0VmBccX1FyzvoYepu9=Vq8eWPzWS8HtYNXTNOv2Hw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/9/21 8:16 AM, Matt Grant via samba-technical wrote:
> Hi Uri!
> 
> Thank you for helping me while I drill into the tsocket library code.
> 
> I have been working  through things, and thought I should check to see if
> there are any unit of CI tests for the lib/tsocket code and I cannot find
> one single written test for that library.
> 
> Please show me where these tests are if they do exist, otherwise I am
> asking questions about whether I should be proceeding to touch that library
> with new code for stability reasons, until a full test suite is written for
> it.  I believe that should be a separate project covered under a different
> MR, not this one.
> 

tsocket indeed is not tested as a library, as far as I can tell. 
Historically Samba had torture tests (sending packets to a server and 
observing the outcome), then blackbox tests (running command-line 
utilities which interact with a server and observing he outcome), and 
Python tests (calling C code via Python bindings). A few years ago we 
finally added good-old unit tests with cmocka - this is good for testing 
pure "stateless" functions such as in this case, and also allows mocking 
where there are side effects and environmental dependencies.

Tsocket has been written in other times, and I think that in today's 
standards, a new host:port parsing function is a prime candidate for 
unit-testing, and the cmocka infrastructure should make that fairly 
easy. I've already pointed at lib/util/tests/test_util_paths.c as a 
possible example.

I'm going to add this test myself to ease the burden a bit.

Thanks,
Uri.

