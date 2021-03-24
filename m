Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D7A347FE3
	for <lists+samba-technical@lfdr.de>; Wed, 24 Mar 2021 18:57:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=2sIyj/UhYNF7rMABjc4klcPpsKIDn/f20OC1fWLCc38=; b=DZEaEjjy3NieE0hhjlTvvHieTL
	YulvdKbYMzUVu0xE/V5m+wkOZL37MrkB5W8j8krMaR/gTsjsI9dLFqt7DvtOldvP1R3QFWllnfJjy
	7a3uLYDpt4Tgx11kEc3qFVISURS88qbW8gBBCSsQ6fC2oL4I/KHW24TxZ5dz4JucylPO1jxIMUeP8
	R2AcE2ePJHDpMVQ39wOO+UzQCg+ZzWlWK8BofFQcTUiCAtudViY8Wh8t/hfreRzekX4QZSBrWXtDH
	5tJceCtDn1NUBgIVdxpWtgZeqKLU7NNgRBKC72Il+EtOWyUJXsqEjPJv8fo3f++11ehvVrwszByVl
	W5aSQjJw==;
Received: from ip6-localhost ([::1]:45330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lP7lF-006dLy-4f; Wed, 24 Mar 2021 17:57:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39630) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP7lA-006dLr-Rm
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 17:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=2sIyj/UhYNF7rMABjc4klcPpsKIDn/f20OC1fWLCc38=; b=I0C4tbXMCOf2BS1dglVys5woWC
 gpt8Ui6U7Fy6kRzQ7uJge+fCF8yge1IM/3cARzykjvVERu+OdCAerNQd/sOEzi/bIOnAPU2AwvI17
 HfSUgJQIaL4pNz/xoyKPfvbP7aqiwvduN8B8h2yYpc4V8sgx7jLQbJZMVJMDzbcrERrTkUt31oOEn
 Ucr79+WjkOZNVzyK+sEdFXe5lzvqnBh/C+AVXGBSNsgAUuijailSF7hs7zrTC3TF1dzhkhuRAgR0A
 kv1EAT9xad8UxI2qIU+APBq1uBVH2R2tcM5GevOdi8jY5DyHZloO+SV8bsBRx6cLDlcTSRLF7Q/aU
 C8Lsx6qLzuNZ3EIKb+CaT9zP2kRS/2Vg2/5p1b6SpJKI3BuJ5dxtLJf0zEbUbr5jW4ANUwRu8JZB3
 72AyuApk/WJyBFmz+i92znMGIeLcypKGKac9VugN4saJuukGwhQS0XNw7Dd5kTZX+24HK3WSLa3dr
 PLZSrhq2+ZK/PVyJ3Jn5FLDg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lP7lA-00071Z-AW
 for samba-technical@lists.samba.org; Wed, 24 Mar 2021 17:57:36 +0000
Subject: Re: Drop NIS support
To: samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
Message-ID: <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
Date: Wed, 24 Mar 2021 17:57:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
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

On 24/03/2021 17:52, Andrew Bartlett via samba-technical wrote:
> On Wed, 2021-03-24 at 09:12 -0700, Jeremy Allison via samba-technical
> wrote:
>> On Wed, Mar 24, 2021 at 05:10:15PM +0100, Andreas Schneider via
>> samba-technical wrote:
>>> Hi,
>>>
>>> could we drop NIS support for Samba 4.15?
>>>
>>> This means getting rid of lib/replace/system/nis.h and yp_*() ...
>> +1 from me. Let's see if anyone else is still
>> using it.
>>
>> So the current list for 4.15 will be Tru64, HPUX, NIS.
>>
>> Any more for any more ?
> Just to be clear to others, this is not the so-called NIS support in
> the AD DC which at one point helped Active Directory Users and
> Computers managed the rfc2307 user attributes.
>
> I'm happy for the real NIS support to go.
>
> In terms of other things to trim, what about some of the printing
> modes?
>
> Andrew Bartlett
>
How about idmap_hash ? The one that says 'DO NOT USE THIS BACKEND' at 
the top of its manpage.

Rowland



