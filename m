Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B531349817
	for <lists+samba-technical@lfdr.de>; Thu, 25 Mar 2021 18:34:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=S3ADTozioE73Ng01rUgnW9KIKETwpOpt0F/TMxXEPD4=; b=c5C8xXREYPPkUwGE7UU66/3i04
	gX46uF/xOsP+T6Sal4LxMIP8e13MjWMs97PcRObRNpc3f6IJvYKqEd6d3ewvQiQ486vgJtrVPT9mN
	YUEwmUolHAvELv+s3iMMKok6v6ozG7CGJ6tpRdrE6y3PQSOfq2XRVCgB0qEqWkg7D5IVzDRyAe8Zu
	0ONocbe8L+y37gkihoOddVOJfEJykhVyZK1sUpUO+zZtcmeWZAF0/3SepX2puSu+JUN7CVHWYH58m
	9c0USYstzQTbK9u9fq6HboVMvwoTXKTU31GFznvUJ5IOkGLq8ccADQIG6ARkqwl0Uap+F3Fsbz4eI
	aKgg+vvg==;
Received: from ip6-localhost ([::1]:41068 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lPTs4-006l8q-DS; Thu, 25 Mar 2021 17:34:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46114) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPTry-006l8j-Qh
 for samba-technical@lists.samba.org; Thu, 25 Mar 2021 17:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=S3ADTozioE73Ng01rUgnW9KIKETwpOpt0F/TMxXEPD4=; b=AqPtYxNGifPIlme6fdL2qzyeFd
 9b5G+Qvrs99E5CckR81CcHTN0hCF0Y4+vntM4HP1lGkmD+SBhJvpJLOHkyin5tVYcCVszyWonhRFH
 kvDe0ZomUd1ckIDeFm9E2EoJmOwwYfEHNx5ErXcTVMhN+wxdtxPVRsnQaK2KIrG+/6H18e/hZgXPp
 qtU0QwKxmA6NtHBa8qJyfFnUvs+UkJHAilcbcMEK8zjoxK/Zjf8BqoD1Zz3Pk3NjWO3YFYka272te
 COvl2qaxteFKWpAgKZ7fgqvbjdFZv+aYb982s+9KcWVTnQKEjFwsZBw5ftofx5Qs3PUgChGf4f+aA
 YUL+GSOLL7gp2gWeq806Nn9hOYmjPG6yUEfZCL1vPPIe1awFJQKP+e5y3m6WvtYf/VQhQwdAdNy8c
 UVSkFZezA+UxzCSf6G/rkEV72DAS7HxmQorfJxPFNSEX52ffBvh7R0PSETjTR+qEGQdbblXuo6tVM
 HA8UAg57locehlLo4H5xNSJk;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lPTri-00025F-CB; Thu, 25 Mar 2021 17:33:50 +0000
Subject: Re: Drop NIS support
To: Ralph Boehme <slow@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 samba-technical@lists.samba.org
References: <4045140.l1vqqZ3lm0@magrathea>
 <20210324161244.GB818616@jeremy-acer>
 <3742e07eba544478383ae1a7e9e56197beb12616.camel@samba.org>
 <359f492d-7dbd-2e95-1c8c-3178d9e51344@samba.org>
 <5f50518b-d317-f5ff-d9dd-a34497c21873@samba.org>
 <4e8cd599-96e5-361d-28c7-ff26082a7644@samba.org>
 <190c273a00fe5b37f6dd494d4296acfcceb2ca2b.camel@samba.org>
 <eae366ce-7751-27bd-bb7b-fe4b7c5bc286@samba.org>
 <a76c4d92-4b3a-0d42-15eb-aea8951781da@samba.org>
 <d38770d4-0665-efc1-1ab4-6d41f3868497@samba.org>
 <7ca521b0-b710-0069-0360-1aceb6694346@samba.org>
Message-ID: <aae767b3-f1b5-8e6a-da1f-b5819cb8fc4d@samba.org>
Date: Thu, 25 Mar 2021 17:33:49 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <7ca521b0-b710-0069-0360-1aceb6694346@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 25/03/2021 17:26, Ralph Boehme wrote:
> Am 3/24/21 um 11:19 PM schrieb Rowland penny:
>> You might want to read this thread from 2017:
>>
>> https://lists.samba.org/archive/samba-technical/2017-February/118705.html 
>>
>
> the stuff Michael said in
>
> <https://lists.samba.org/archive/samba-technical/2017-February/118808.html> 
>
>
> would be a great enhancement for the manpage.
>
> -slow
>

Which part ?

'DO NOT USE THIS MODULE!' which he says three times

Or:

What I personally want or would like to do myself is
to remove the idmap_hash module altogether. But
unfortunately that does not seem to be feasible,
since it is used out there.

Or:

The idmap_hash module calculates a Unix ID for a given SID as
follows:

- Write the SID as DOMAINSID-RID.
- The module calculates a 12-bit hash value of the DOMAINSID,
   i.e. a value hash(DOMAINSID) between 0 and 4095.
- The unix-ID for SID is then calculated as

     unix-id(SID) = hash(DOMAINSID) * 0x080000 + (RID % 0x080000)

   (Note 0x080000 == 524288 and 4095 == 0x0FFF.)


Hence:

- Each domain has its predefined fixed range of

     hash(DOMAINSID)*0x080000 -- (hash(domainsid)*0x080000 + 524287)

- The overall required range to be able to map all SIDs is

     0 -- 4096 * 524288 - 1 = 2147483647

This leads to a few issues:

- Any range smaller than 0 - 2147483647 will filter some SIDs.
- Since we can not start the range at 0, some SIDs can *never*
   be mapped.
- Some domain SIDs will be mapped to the same range.
- RIDs will wrap around, i.e. DOMSID-RID and
   DOMSID-(RID+524288) will be mapped to the same ID.

Hence the recommendation is:

    DO NOT USE THIS MODULE!

If you have to use it, then make the range as big as possible.
I would say start as low as you can afford, i.e. 1000 or 10000.
That way, you'll at least catch some IDs of those domains
that are unfortunate enough to fall into hash value 0...
(Note to Andreas: If you want to start at 520000 instead,
completely filtering hash value 0 domains, that is a point of
view as well, which comes closer to not using the module at all...)

All in all, I can only repeat:

    DO NOT USE THIS MODULE!

Rowland



