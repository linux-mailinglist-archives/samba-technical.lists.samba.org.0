Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3877B13B894
	for <lists+samba-technical@lfdr.de>; Wed, 15 Jan 2020 05:04:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=k7MC4++A9RXgT67x846YIGFmf6xCuTo9ddNdWFQ36zY=; b=Ta1NhiUe5uq8Dv/V0QkMq428MR
	5w/QBwdOFEMjnOQPdsoMd7ru9dUu/1m/qozxFQ1FWHB8TqbVYmZcg1WREbDgc1E0Ddb0qYxLlwxwz
	q97Y1aUZZDdQ4LvVs/80K/Fjsg3epEA2IYGVJg1527CZ/EDniYbwCvL5BilHqZA+T2PRGcFgpnt8F
	ADLmJgtiHJkhGFGKAUKuYiwYGT88vEYjlxYz4ctf37mQlDsqYAPn38w9VW7YIGh/R8YsCjHDkEQ3d
	sq+8liS+yPwgFgYRykwjHJ0+3Q+erSu1ln38/Dy36bVOye5mNwMqbFe5gkR+DbC8ncCB7IFwVv5zK
	ZuRm/GyQ==;
Received: from localhost ([::1]:29930 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irZtd-003Tra-Hp; Wed, 15 Jan 2020 04:03:09 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:53040) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irZtX-003TrR-KN
 for samba-technical@lists.samba.org; Wed, 15 Jan 2020 04:03:07 +0000
Received: from [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f] (unknown
 [IPv6:2404:130:0:1000:2225:64ff:fe75:8a7f])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 4D40380E4D; 
 Wed, 15 Jan 2020 17:02:52 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1579060972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp:autocrypt:autocrypt;
 bh=k7MC4++A9RXgT67x846YIGFmf6xCuTo9ddNdWFQ36zY=;
 b=WOW3KlpeyZV1qNcuvhUj6taZpYrw2+Q72qPO7h0qK4cvp3nIhA1Gwly2qYfo+gVLmOOsWc
 /SfNs+7Nv4rPh1zbTCYSU1SyQrgRgnW0mIWICV796zgNdCUmSu08ZjhUG1vfjIcLgUALDR
 XCXdoTYoji1Co5AgogsyPNXA0Gu5C3V7aRVrhGY4IMy5PRzyyeaDARosnTzYjoh59cNA2b
 np+4vuT1HuH5FTgyUZHyJmQ/n4Fc7P0uwdU/av0w96BCKy++p2KBx9y4uG/JaJaAqIQncN
 ZJdfQazibVxkfa3ZJk8/hWR+BWYTMvaydvNcJj18pJEsPuLgDzjLQeSM5mortQ==
Subject: Re: [EXAMPLE] How to add a source3 fuzz target
To: Jeremy Allison <jra@samba.org>
References: <5af970f9-d9e1-5993-f5e0-480139c2ad2e@catalyst.net.nz>
 <20200113213841.GB111855@jra4>
Openpgp: preference=signencrypt
Message-ID: <454ccfed-8b35-29e8-e074-0ec8df418def@catalyst.net.nz>
Date: Wed, 15 Jan 2020 17:02:51 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200113213841.GB111855@jra4>
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 14/01/20 10:38 AM, Jeremy Allison wrote:

>> Needless to say, I have found no crashes with this particular patch,
>> and I suspect it is not actually a very good target. But perhaps it is
>> an excellent target and we just happen to have very good code!
> 
> Thanks Douglas, this is a *really* helpful guide - much appreciated !
> 
> nmblib_parse_packet is old code that has been kicked *very hard*
> over the years, so I'm hoping it's just good code now :-).

Yes, though you are too wise to venture beyond "hope".

The question of target scale and selection is actually quite tricky. If
you include a vast tree of possibilities the fuzzer gets lost, winding
through a million paths without ever meeting the interesting bits.

If your target is too narrow and simple and robust (like parse_packet,
we hope), the fuzzer is doomed to spend eternity beating itself against
a few dozen impregnable branches. And this eternity is not entirely
theoretical, thanks to Google's oss-fuzz. The resources used are not
just contributing to climate disaster, etc -- they are taking compute
time that would otherwise go to better fuzzers from Samba and other free
software projects.

So if we *really* think a fuzz target is wasting its time, we should not
build it. I believe this one is above that threshold. Right now, in the
dark corner of a Google cloud data centre, oss-fuzz is thrashing the
daylights out of bin/fuzz_ndr_icoffeemachine. We might want to revisit that.

BTW, the patch in question is now a merge request:

https://gitlab.com/samba-team/samba/merge_requests/1057

Douglas

