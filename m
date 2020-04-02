Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC06D19BF6C
	for <lists+samba-technical@lfdr.de>; Thu,  2 Apr 2020 12:36:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=emeljDmeU3EebUFWHnPb/OnFiOi999QZBMXpWGfR9/g=; b=BUQXVfYev0yQgSuzj6zSi3HPSk
	gvnADJmCpnKRciLf+p+8DI7bj4y/vaF2nYEFO4mu/mF1RPIOzIz+xMG18jpSTkXNGecclnmbMy4q2
	kmca/CUmhVW5wCbbrAYlyv28aV0RfA2yuaTh6xuMffLs1+n37ZSd2yW/DYkUlZkAmRDELF6bimvmV
	Vee/NJpgHpwtgP5zo/aWRDGMb5oAZpveThBPAtxzOKnJbwClHCLkSGUFvoE82PrhcTb3j2PEAymko
	pAiYrGHr+zbfZt+wcMzVjfG9jp0S0jzbP6qhnQNh3P0mQVG2xeFFPB5+iJqSOmvvUnhzlmopH94YN
	5tbmYoqg==;
Received: from localhost ([::1]:64500 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jJxCZ-00368Z-8u; Thu, 02 Apr 2020 10:35:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15044) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJxCS-00368S-4d
 for samba-technical@lists.samba.org; Thu, 02 Apr 2020 10:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=emeljDmeU3EebUFWHnPb/OnFiOi999QZBMXpWGfR9/g=; b=3QddpH8bbOLCSPLbzgtM1qa7Xk
 3h8KqwWq/xfUieA6vih90T42mC+4iDCS98K0KPfvNZuVtkka9RLUzyhnWLc5XPHIn+McABmB1mbgo
 VNtSa+j8BrlBxuuL0STD+S3lXtL1f3ifU7IA8AwSNUdrpQzYdhFlR14K3EuEyXvR7/lufgBX25+dN
 KRsARQyCnukFi/2jLxN71WQkE9NmvKfUZ/jepWwsSF0BKWRb1Pk+zSz9WimV6XUZlI5RF7S3bPgDU
 6Mw5mHZJEm8d8Oac2FvBAXKhN3JjufbUZFO+r3Bii8zp979RvDhxRjpOmXpzXx4RW5FYjOAkS0+sn
 mSw4A3T8D4JTzfp2/SrKsDURIZqPTwF86GMBRsJYuQrtzX1Cg4sTjGAwQZ7oJHbS79u2E64nITjdO
 ynPgVfYQpuAlkjeKdrD36JAKv1OGW2X30M6BcnmnW36oV7eaPo/z+kPx1pRtGLqIKzBKwKX1fwO9c
 NOQ02mBHtRueBk1XUdznx+vt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jJxCR-0000UD-NP; Thu, 02 Apr 2020 10:35:51 +0000
Subject: Re: [PATCH] samba-tool group show
References: <0acb2828-a298-4a79-421d-683a771d9a93@samba.org>
 <9a67100a-d672-5765-227e-641ced43e683@sernet.de>
To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>,
 samba-technical <samba-technical@lists.samba.org>
Message-ID: <ebeb8392-183a-8eed-9efe-14bbc40ec31f@samba.org>
Date: Thu, 2 Apr 2020 11:35:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9a67100a-d672-5765-227e-641ced43e683@sernet.de>
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

On 02/04/2020 10:58, Björn Baumbach wrote:
> Hi Rowland,
>
> On 4/2/20 10:44 AM, Rowland penny via samba-technical wrote:
>> Hi, <samba-tool group show 'groupname'> will only show the groups info
>> if it is a global security group.
>>
>> The attached patch fixes this.
>>
>> See bug: https://bugzilla.samba.org/show_bug.cgi?id=14335
> Thank you for fixing this!
> I wonder about the use of "objectCategory=group". I would expect the use
> of "objectClass=group" instead. But I tried the patch and it works - I
> did not try to understand why, yet. The objectCategory looks like
> "objectCategory: CN=Group,CN=Schema,CN=Configuration,..."
> I checked the samba-tool code and see that we typically use the
> objectClass attribute.
> Is there a special reason for the use of "objectCategory"?

 From my investigations, this is the recommended Windows way of carrying 
out searches

For instance, you can use '(&(objectCategory=person)(objectClass=user))' 
to search for all users.

>
> If "objectClass" is also fine, I would adapt the patch, add my RB and

Nope, I am fairly sure my way is the best way, so can I still have your RB ?

If so, can I also ask you to push it, I haven't a clue how to do this. ;-)

Rowland


> push it.
>
> Best regards,
> Björn
>


