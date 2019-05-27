Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D59B12B0B4
	for <lists+samba-technical@lfdr.de>; Mon, 27 May 2019 10:50:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=grEP7bN+xePvs5C8Uhr6cZ/m4KxCOKqHHpzIZQsUR0c=; b=HWftbwx8TFJefRYmxtrkpQ46dN
	LS4ebhcR2tQrYCLp1UYrjxsMKXZpdtj7Lmb2a//Y9Bxr5pcdWRPPIqHZxMQnp2EyMQmsl4vDQrNIG
	jrLRwYX0smo5+bD1b33JJB0VqgSxP2TLkAnhI0lkpuVrZzBFOQgySa3veFmhQ25zTFqvdF8gE57Jk
	uQwy+LaOzy229WOlJfc15c/YngCghaGsZNRWXBIa8kFct8qqz9kvuNGZkA6CipAe1FYIUBhQBW4De
	oxxMA5ssp27tD3fxToUF6ewXL0dIqe9UL5R6fRLse828fkEveoaCPaOLtJ+WJkKY2ZJAMTZVpuMRv
	oPY2sWLg==;
Received: from localhost ([::1]:52304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hVBKm-00299j-2R; Mon, 27 May 2019 08:50:20 +0000
Received: from [2a01:4f8:192:486::147:1] (port=22072 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hVBKc-00299c-68
 for samba-technical@lists.samba.org; Mon, 27 May 2019 08:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:Cc:To;
 bh=grEP7bN+xePvs5C8Uhr6cZ/m4KxCOKqHHpzIZQsUR0c=; b=s4YjTUphOgVbXB8/1zTNlHeW6z
 ORkWvSsWPn7hwhfhbzcU7mfUJuEd7G7EfeUHeC9AIirc3k9gmHmiBpIdhettHnowN94lyEDwf637j
 TheaYHRGOvK+6dVj0e0/TCqt+FkyD1ogB7CJwmtb8DjpCR7e4mlXkFiNjZK/d2tTaxEQ=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hVBKV-0004dE-VP; Mon, 27 May 2019 08:50:04 +0000
Subject: Re: [PATCH] Re: samba-tool fsmo transfer - uncaught exception
To: Alexander Bokovoy <ab@samba.org>
References: <642f86fb-36b6-e647-ec52-e6e93bab2950@linagora.com>
 <b2b6f46b-c819-c917-37f7-ead663bf4cf4@samba.org>
 <1c97651b-c97b-6f38-249b-aff5a091b24e@linagora.com>
 <4f70f827-6b7d-ff57-beaa-6519a8d80633@samba.org>
 <c636364e-f0d9-5c50-4d8e-dddfdda43a67@catalyst.net.nz>
 <9e8c741c-e144-0cdf-2136-d72b8764f2a3@samba.org>
 <228e33ff-1224-fb1e-2f30-60d8934d5675@catalyst.net.nz>
 <1e16699e-5067-325a-ba19-eb05013ffd5d@samba.org>
 <20190527082719.GA4871@onega.vda.li>
Message-ID: <aed6ac60-f128-6890-5ac3-8178e67cab06@samba.org>
Date: Mon, 27 May 2019 09:50:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190527082719.GA4871@onega.vda.li>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Cc: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>,
 =?UTF-8?Q?Julien_Rop=c3=a9?= <jrope@linagora.com>,
 samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 27/05/2019 09:27, Alexander Bokovoy wrote:
> On ma, 27 touko 2019, Rowland penny via samba-technical wrote:
>> On 27/05/2019 02:28, Douglas Bagnall wrote:
>>> On 26/05/19 11:22 PM, Rowland penny wrote:
>>>
>>>> How do you test for something that works on some computers, but not on
>>>> others ?
>>> With Gitlab CI.
>>>
>>>> Which is correct, it working, or it not working ?
>>> Well, when I go
>>>
>>> PYTHONPATH=bin/python python3 -c 'import samba; samba.drs_utils.drsException'
>>>
>>> I get "module 'samba' has no attribute 'drs_utils'".
>>>
>>> Maybe Python 2 was different.
>>>
>>>> If you have a problem with the test, take it up with Andrew, I initially
>>>> created the script following his advice, he later 'improved' it, obviously
>>>> not enough ;-)
>>> Yes. It only tests 'samba-tool fsmo show', not 'seize' and 'transfer'.
>> That is what Andrew wanted at the time, feel free to extend the test.
>>>> Anyway, NACK to your patch, but only because you haven't remove the
>>>> 'import samba' line.
>>> OK, though I don't it would work with the line removed.
>>> For example, it would break
>>>
>>>           forest_dn = samba.dn_from_dns_name(samdb.forest_dns_name())
>>>
>>> and it *might* break other things too because, as discussed, Python
>>> imports can be a bit weird with unexpected side-effects.
>>>
>>> cheers,
>>> Douglas
>> So how do you propose to test for this ? When having just 'import samba'
>> fails for 'samba.drs_utils' but works for 'samba.dn_from_dns_name' ? To me,
>> this looks like a bug in python.
> https://docs.python.org/3/reference/import.html is the canonical
> documentation on how module import works. When you do 'import samba',
> you are importing samba/__init__.py implicitly. That file defines what
> is in the 'samba' namespace as imported. It has no references to
> 'drs_utils' so the only ways to get 'samba.drs_utils' is to do 'from
> samba import drs_utils' or 'import samba.drs_utils' explicitly -- in the
> former case we'll get drs_utils directly, in the latter --
> samba.drs_utils.
>
Thank you very much for explaining that Alexander, much clearer now.

It still doesn't explain why it seemed to work with python2, but I will 
put this down to one of the reasons that python3 was written ;-)

In which case, I remove my 'NACK' and change it to RB+

Rowland



