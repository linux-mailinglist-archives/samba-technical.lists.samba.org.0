Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88E34829E
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 21:11:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lW1nJGuUkGDU0UAbJGB9yaSbr3UmGBhe5JgqB4p2owE=; b=0UlppPMLjXMmGqFkSZ17NAllpd
	HVF7eeMEan/0Jkd1xfUe95h0XUi+4Eh6YP+RuuTOfcX6yVwWFw4Tvy1KsyPfx5DOtCJAROt6Ex03/
	mnBx56Sy9lPJhm/hvY4nAW1GbGPd5D0kDAWKWYfUUXyL25tr3q1tYuskIjMeFfcAD0KyKFk3T1YZ8
	vtRTLzC0xhobgzsJPeCTfNRgv3yD1nNZHAGoTG+b8Ez2t6I5nxFfoaHNYBMiGP1ZcErP7ymrsBByW
	Rnarshwi58qaYEGzDoZu8rwMxnaq3rt3Bx8YK+o2oIhENH3FgrJHElG9PdBe9qMkirOQvKTV0QNM8
	LDig9wGw==;
Received: from ip6-localhost ([::1]:48212 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP9q1-006dsW-8K; Wed, 24 Mar 2021 20:10:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:24558) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9pv-006dsO-9z
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 20:10:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=lW1nJGuUkGDU0UAbJGB9yaSbr3UmGBhe5JgqB4p2owE=; b=FcNqIG3rrmZdYLM3/H3NezwVoy
 8YR/5cQJMnbqn+wE9ZSBh80b9xlxrMALWlKfplZx1BD6oV7SQy+/px119kE0q4qAT2W3skDVQHKTz
 LNDn8Z3j24u8LJZJuCSnLOI9WFga9mZW7dZcX7gcYlYdffaBkiLQNw45Dr076iEIqeAizX6UXkAx6
 1+hMw3naVpj4opRzKBk0t8t94aDiQgbmkjjamTgzg4Lo1TnaToPKR+KAN6669/yLVBoevIBRUBCMo
 O+LYzc66xdKg4dB3kiztiwLhcGTjq8DRuutDbbvj+lKotrmy5vlOmgahyBi/QBSgCaEJ6ZZSRWalM
 msSQ/87ez8Sjloa7tSxlke+KOVVk4+0vOZC4WNTQZxKAWOsUxplrinfCTlf1WAY95jQJfpjubVMu+
 7ySbtOJjrKHBoDZESrWxJkOKses7EEI45SHGYmJSi0RkaUKiSJFcvSoyDQHFUIyz/UFg3VC9Ypvpa
 PAAhE0h3QgsTEnQKmDtpm0l8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP9pn-00083L-Dr; Wed, 24 Mar 2021 20:10:31 +0000
Subject: Re: Drop NIS support
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <953a5e8d4dbb0a915693128fec1520b20c76c598.camel@samba.org>
Message-ID: <93332862-291d-d776-4378-6428d622a238@samba.org>
Date: Wed, 24 Mar 2021 20:10:31 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <953a5e8d4dbb0a915693128fec1520b20c76c598.camel@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 24/03/2021 19:58, Andrew Bartlett wrote:
> On Wed, 2021-03-24 at 17:57 +0000, Rowland penny via samba-technical
> wrote:
>> On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
>>> On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-
>>> technical
>>> wrote:
>>>> On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via
>>>> samba-technical wrote:
>>>>> Hi,
>>>>>
>>>>> could we drop NIS support for Samba 4.15?
>>>>>
>>>>> This means getting rid of lib/replace/system/nis.h and yp_*()
>>>>> ...
>>>> +1 from me. Let's see if anyone else is still
>>>> using it.
>>>>
>>>> So the current list for 4.15 will be Tru64, HPUX, NIS.
>>>>
>>>> Any more for any more ?
>>> Just to be clear to others, this is not the so-called NIS support
>>> in
>>> the AD DC which at one point helped Active Directory Users and
>>> Computers managed the rfc2307 user attributes.
>>>
>>> I'm happy for the real NIS support to go.
>>>
>>> In terms of other things to trim, what about some of the printing
>>> modes?
>>>
>>> Andrew Bartlett
>>>
>> How about idmap_hash ? The one that says 'DO NOT USE THIS BACKEND'
>> at
>> the top of its manpage.
> Is there a way to emulate it on another backend using configuration
> options?
>
> Andrew Bartlett
>

I have no idea, but there is not much point in keeping something where 
its manpage says 'DO NOT USE THIS BACKEND' and 'DO NOT USE THIS PLUGIN' 
(the capitalisation is not mine). So, surely, it is fix it (and I seem 
to remember a discussion about this, where it was decided it couldn't be 
fixed, so the warnings were added to the manpage) or remove it to stop 
us looking stupid (my opinion).

Rowland


