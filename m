Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DF68BE109
	for <lists+samba-technical@lfdr.de>; Tue,  7 May 2024 13:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=psS2yX64u4OCF8jJ+lRIFdpsX5FjunX4FIYfIcBB1jI=; b=j6fhgEwdRVjA2d5DPpbYRV1kVx
	4O4i4TeiftMi+LhKB/ZGaUiWSmcNswc86RcL9wTLxBCqKzXH6U9qlzSM+SeAVCPFdzQ+jCYeL6jBP
	EJGRcfxWdDmB4bBdy9sfcGXtzQfL7wq1ALuy66M7cRPliApkR5fVpLht7RB45ZXMXq01691c5erza
	BLgp4hv9HqJwQCAcaiYSkK5ah9Rxvg3KE7ar16r+aX/c2phkGZY3zaFyzAztdCObG5WP2b/rP9j/x
	UJvpYqlP1b8PH23SquiGrsvfwuCqkJQRXCp5IFSImF4xtOhBVmn0InLZ8OszeHC2/SMiIEykLeLNt
	tM8Y4pdg==;
Received: from ip6-localhost ([::1]:53598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4J2q-008QXe-7d; Tue, 07 May 2024 11:31:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13910) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4J2m-008QXX-1g
 for samba-technical@lists.samba.org; Tue, 07 May 2024 11:31:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=psS2yX64u4OCF8jJ+lRIFdpsX5FjunX4FIYfIcBB1jI=; b=OeGif6PJWx0kPTauP81h4O9Jpr
 KnTwsvrT4AHMrfQh0CSvwqwD1odQsuavOTAs7tvykkdRrP/h2CaZs4FFE+GABF9HFHCOJYICIONDs
 ADnRr83WHIlu+AWi27pa6A+8VcKyOZ4MQQ4b1duisKrJ7d/DwIaEXKBlwsN5M/7ZJaTZKy4V8DuWd
 +bXz4K5QRkPyxgOO/FUUZKVw5aNaq6ghsY1mdfdvI/x8mgbWRhqlC3cQzC27OsqgaYVetcOoqa+ut
 +kQk0W89/DlMyRSi77M95fJik5l3FLYcfK8Yvx2+Q1bX39f/AkrvlAchSl+piDqSU1MEI9P6d2Qh6
 S+JUHpt+wBgPCP4vNWJXYsu/e6tMrlIMzqkM6ZVOv3Rwk3AIDjMKq2OiqLQTqKhLg+IVxqFnp/VTY
 JK23JvO8h9ofJb7Y4X+Ee4ZGEXPas4bKi8VXzdLeYmBGdny0K+JW/pgCclIqr+Qo2dq4Rz6pO1ZNx
 OmRPOI1/G2URCGc2iyis0H76;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4J2k-00ACgh-1t; Tue, 07 May 2024 11:31:34 +0000
Message-ID: <6909499f-6708-4c0a-a119-30e15c9676d5@samba.org>
Date: Tue, 7 May 2024 13:31:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Need to rebuild Rackspace gitlab runners - plan to move to Ubuntu
 24.04
To: Rowland Penny <rpenny@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <e3375f71e0d24e109832046bfc46bdbfb1429855.camel@samba.org>
 <e8fc29a1-9ca4-4644-8ff0-32fbf1bfc390@samba.org>
 <99670794c9f69001a8da79519392d647353e6e26.camel@samba.org>
 <20240507115739.1fac899b@devstation.samdom.example.com>
Content-Language: en-US, de-DE
In-Reply-To: <20240507115739.1fac899b@devstation.samdom.example.com>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 07.05.24 um 12:57 schrieb Rowland Penny via samba-technical:
> On Tue, 07 May 2024 22:45:30 +1200
> Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
> wrote:
> 
>> On Mon, 2024-04-29 at 17:56 +0200, Stefan Metzmacher wrote:
>>> Am 29.04.24 um 07:26 schrieb Andrew Bartlett via samba-technical:
>>>> Just a heads up that due to
>>>> https://bugzilla.samba.org/show_bug.cgi?id=15638 I need to rebuild
>>>> theGitLab runners we have in Rackspace, so that it still offers a
>>>> tag thatour jobs will then expect.
>>>> While doing that, if the image is available by then (it isn't
>>>> yet), Iwould like to make our runners run on Ubuntu 24.04 as the
>>>> runners(which are booted once per job) will start faster as they
>>>> won't have asmany updates to run on first boot.
>>>> Please let me know if you think that could be a concern.  On the
>>>> plusside it should allow the more recent kernel for some more
>>>> io_uringtesting.
>>>> Naturally I'll check a full private CI run passes before I rebuild
>>>> forproduction.
>>>
>>> Great! Thanks!
>>> metze
>>
>> I still plan to rebuild the runners, but Ubuntu 24.04 is not out yet.
> 
> I think Canonical might not agree with you there:
> 
> https://canonical.com/blog/canonical-releases-ubuntu-24-04-noble-numbat
> 
> According to that webpage, it was released on the 25th April 2024

Andrew means the required cloud image at rackspace in order to
build our private runner.

metze


