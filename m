Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A35D516D77
	for <lists+samba-technical@lfdr.de>; Mon,  2 May 2022 11:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=49lKwILOPrlG+D4OMPXB4v9nOFuPPIfgalHG4XkPfio=; b=OMeVDZ2ATRW7N3MM/HuIm2/jSP
	n8S1ynE44jtL5mMQ6SS3bAElyAHZw3NRNzZqkcTEpHYL22Sku3xJkRXNRUVcIxv0b3fNdXnXu0q9y
	LE62Ht7yIcIQI/QLfIRQzWMNVfXXQXTCkWAbQwfx5evpUEVNzAHcmoUwf6Qtv3KEo294RA3Oby3HI
	bu7kCLwq6YvQYmJGvvyywyP6SVisb5UugQjrv8IIQNjwqVO1wkdWqDysHqMpFURrXQD+uqerbz4Nt
	ZNBKwAmlYih3Y5S4sf3ogIWzEY8Vdyu3WrYvNbh47x5AJ+2RnhG+JrHBfNjhU3O3ixKzv2UkxZ6Xr
	R3V5vTyA==;
Received: from ip6-localhost ([::1]:24002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nlSTE-005Vc6-Ie; Mon, 02 May 2022 09:35:56 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49568) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nlSTA-005Vbx-23
 for samba-technical@lists.samba.org; Mon, 02 May 2022 09:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=49lKwILOPrlG+D4OMPXB4v9nOFuPPIfgalHG4XkPfio=; b=nxbatn69D9ACegLIHpKSlEBaRA
 um3gW79UkGK8o/B2jcXnxyLzIiUlbx91tRQpbNi5OQ3V/C0IPgzoNDS+2rmS7mR/892kZhE0obfUe
 LuzrbbRMst+Ty8NxJwPl0DcrgXWIcK5POIBAz+V8c1+tuqnLCpNwkvTqn9IJwrTpW2C/RdK48LN/3
 XyqcLwralBhZAETE0lDwOwkgtQV91mLQQOO3IkibJGxz4sUeOHdO4AToU15bxd6gVB2TKbHRmWxWK
 /FdIcR4XOTR+bXXqj68fZg7V57RND3DErf7y/HWJdCP0k7QsEkr/b4aRlfA1596NH5yCRmOVtYK51
 1aw8E2E153yF7q07LE52tH7gBlVFE0zZ0FmHYy7yyxOc5z32cwsnWxZCrd4YX/0DZ7bggGtLxUvbT
 jSGzpzAQ7pAa5bHc1WyK3cZPHXuXPYJsC5O9B2EPThyv05r5E0UMi5QqYYwYLd6Srpd1S4SQAMQMR
 zCjlP59//k0KApFz2VS8IJeT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nlST5-003aiF-Kd; Mon, 02 May 2022 09:35:47 +0000
Message-ID: <08dee2ea-8f43-1be1-4fcc-f2e0ded56716@samba.org>
Date: Mon, 2 May 2022 11:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <172238861939f1348299509fbc3bd897e2526e91.camel@samba.org>
 <445534d75c399bef4429d72d9ae17abbaf6b0b09.camel@samba.org>
Subject: Re: Samba CI mins now totalled: ~145,000 per month: Help needed
In-Reply-To: <445534d75c399bef4429d72d9ae17abbaf6b0b09.camel@samba.org>
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

Am 02.05.22 um 04:55 schrieb Andrew Bartlett via samba-technical:
> On Thu, 2022-03-17 at 09:17 +1300, Andrew Bartlett via samba-technical
> wrote:
>> Posted publicly to samba-technical as nothing here is really private,
>> and perhaps our broader community can step up and help.
>>
>> [feel free to follow up to the team list if you need to say something
>> private]
>>
>> Just saw that on the public runners we use 10million mins per month
>> per
>> GitLab's stats.  These stats have only just become available.
>>
>> That's a lot of mins.
>>
>> See attached and at
>> https://gitlab.com/groups/samba-team/-/usage_quotas#shared-runners-usage-quota-tab
> 
> Just an update, I've grabbed a new screenshot and it is now saying 147k
> per month, which is more reasonable.  The tooling here hasn't been
> great.
> 
>> It is hard to follow exactly what GitLab.com's plans are for moving
>> from what must be rather un-sustainable for them, but there are
>> clues:
>>
>> https://gitlab.com/gitlab-org/gitlab/-/issues/243722#proposal makes
>> it
>> clear our free run will end soon.
>>
>> I'm sure we, as free users, bring value to their platform but that's
>> a
>> lot of CPU, even just environmentally!
>>
>> I think they plan to give public open source projects a 'cost factor'
>> of 0.008, and 50,000 mins free, so that would be billed at only an
>> extra $290 USD per month (((9.87 [million mins] x 1,000,000) * 0.008
>> [cost factor] - 50,000 [gold plan free limit]) / 1000 [mins per $10])
>> *
>> 10 [price for 1000 mins].
> 
> In the meantime that 'cost factor' has changed to only a 50% discount
> 
> The new math would be:  (((147,000 * 0.5 [cost factor]) - 50,000
> [ultimate plan free limit]) / 1000 [mins per $10]) * 10 [private for
> 1000 mins] = $235 per month.
> 
> This is on top of the $600 per month we currently pay Rackspace (the
> counted mins only count shared runners).
> 
> Thankfully running 147,000 mins at another provider need not be
> impossibly expensive, eg at Catalyst Cloud (just because I can find the
> price sheet quickly) it would be ~384 USD (assuming optimal use of 8GB
> 4CPU instances at exactly 1 hour blocks).  The real world will be more,
> but not an earth-shattering difference.
> 
> Thankfully this is also the kind of amount we can feasibly ask OSU OSL
> to host (I think) or even if we bought at Rackspace (more $$$) it
> wouldn't bankrupt us.

We could also rent a machine (or two) like our hrx0.samba.org
(which hosts our autobuilds) and let them run runners for us.
That would just be ~94 USD for each of them.
Or a version with 32 instead of 16 cores, for just ~125 USD.

And our autobuild runs much quicker than a pipeline, so it's likely
that one machine would be enough for our workload.

metze




