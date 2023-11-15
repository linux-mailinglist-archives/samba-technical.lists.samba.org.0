Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE97EBAC1
	for <lists+samba-technical@lfdr.de>; Wed, 15 Nov 2023 02:00:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=4qeCQwClnIXesKS1Oug3x0YAxFhGcuAGMJ4BrnSOV4g=; b=2AdBtKmtvt0sLNy2JheqA11+cN
	h/eNXQ8V22ZHCdSTBnrUozAgDCtp555yPjsbWRE93a9MXb613If1K0gIM3xEx1lOl1Qie+ZGWRNEx
	U+Uq4/p7zuUfiP87T8Yaw6W626/v/sNdqPNVIj2k5qDJTm6tmpBpTmxJE6q+wOdQLlfniJEkSywgA
	gM66hZ4GwhtO/DiWTYTJD2NqP13XXM7KzR5xhXNPcqS5eG2zxG1SRbgB6tBslJjs3/aExjXOtkb+s
	IYTacbrBD1vi7g8X0A3Odn0aTrj+a422fY75CLf4gmvbIGi5FOd6HfnUW2IswaxgY67yg8UaIMbKk
	LseMTWbw==;
Received: from ip6-localhost ([::1]:27436 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r34Gb-008NP2-H3; Wed, 15 Nov 2023 01:00:29 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:49012) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r34GM-008NOt-Q7
 for samba-technical@lists.samba.org; Wed, 15 Nov 2023 01:00:20 +0000
Received: from [IPV6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 1B4B7822C3; 
 Wed, 15 Nov 2023 14:00:07 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1700010007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=4qeCQwClnIXesKS1Oug3x0YAxFhGcuAGMJ4BrnSOV4g=;
 b=PdSMx1w7JRXXlNq5jWS6v4oOnY03JjlXPOSm1xKZ8SyBgg5ZXv9LbyNwH+WRB5So2qDhCv
 eBQXEDAHI9fzAFu6sWRvqbq7KgwcBOlzRQsfKG6ZnTkr/JL8jWnECV+zvaMkaW5N0px2I4
 JcgyRxpVCD9CCECYZ2lheeArUVZk3bvz5UUjKq3f5SK+KUt0BJ/+rewiScepYc6ZxAu97W
 1VdemE2oQykZkNBbCoNXIvC4RwWrUlA6/C92F2U0nIgyKU4Ixmu9yKp+dqoHaocFvLWcca
 UJx3uOfhIOnQ2xfTUd2ffh1IKJdAgmjKTj+DVdYXDdMa3uGO/6RANaH+eM1Plw==
Message-ID: <ab80dc2f-2af8-4384-a42e-d605d5e0cbe2@catalyst.net.nz>
Date: Wed, 15 Nov 2023 14:00:02 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: autobuild, CI broken by unix epoch > 1700000000
Content-Language: en-US
To: Martin Schwenke <martin@meltin.net>
References: <eca883c1-c232-499c-b290-fec0978401ae@catalyst.net.nz>
 <20231115113105.535e2ca3@martins.ozlabs.org>
In-Reply-To: <20231115113105.535e2ca3@martins.ozlabs.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.09 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[]; ARC_NA(0.00)[];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 15/11/23 13:31, Martin Schwenke wrote:
> On Wed, 15 Nov 2023 13:22:14 +1300, Douglas Bagnall via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
>> To get a unique OID in a test, we have
>>
>> governs_id = f'1.3.6.1.4.1.7165.4.6.2.9.{self.timestamp[-8:]}.{suffix}'
>>
>> which would have been fine for most of the last 90000000 seconds, but it
>> turns out that an OID field can't start with zero.
>>
>> Today at 11:13:20 NZ time the epoch flipped over to 1700000000, which
>> means `self.timestamp[-8:]` now starts with a number of zeros.
>>
>> We will need to backport to 4.19.
> 
> Awesomely well found!
> 
> For completely unrelated reasons, I noticed this morning that epoch
> had rolled past 1700000000 and wondered if that might break
> something...  :-)

It certainly helped that someone had pointed the change out earlier in 
the day.

https://bugzilla.samba.org/show_bug.cgi?id=15520
https://gitlab.com/samba-team/samba/-/merge_requests/3389

I haven't done a CI build for the whole 4.19, but it passes locally.

Douglas


