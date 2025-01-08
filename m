Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4DA0616C
	for <lists+samba-technical@lfdr.de>; Wed,  8 Jan 2025 17:16:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=w8lmu4nYTfUaaSfjNUWF0Sb23cGQE80dFwL7CqueDyw=; b=UH/aO5yDEt+vF+Mm7bIq52lzr6
	6T1ghwZ0xWI9NWYCJxarDkcB0H7OmkLqsmKyWvOgfK4hGfmGcPlJlMnGHWUxIzzzuhmD37Mkj0Tpy
	WF+IJe0ttFz7s1oLZCtDqUNBaZVMlRRSjtfHeKDfGTVp8XWITcgxtOWMWZ6Hd40svEQEcUGjPGL7K
	cpir+pa9FYfY3c6WLASdR40ZEk+LcER5J1+uUNCpj7cAGKSTZdOwyX0hkRQWp+yo//UebVQ3Pi/o2
	bDxHmS9ydbqHjbFyMop3NgIbskxMU9UJAm92Sj1Y0WE/4OAAX0fQppiUw3Bw1f/jAkQjKHhRB2aQs
	J7gRKgtQ==;
Received: from ip6-localhost ([::1]:48720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tVYia-007c9Q-6j; Wed, 08 Jan 2025 16:15:40 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42330) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tVYiV-007c9J-Ru
 for samba-technical@lists.samba.org; Wed, 08 Jan 2025 16:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=w8lmu4nYTfUaaSfjNUWF0Sb23cGQE80dFwL7CqueDyw=; b=Q/sfbFAbHX8bsSN/EHBb6OEnf7
 Xdw+lYKUvJSIOfe3SPFD1M/KbQHVqw2h87Qz6FONTlaAQa/z6TPG0rYEWPkJxANeldgooj7Z0SJ5f
 L6lA8wVfftXzmMqE1icOSn1S2zFGYyvriEIKxAEe9bvx5lzePzhUlL5n+E3+yGw6pHzvesTGVO5XC
 mslo15vn6UvvoQYF9Bg5v+SbPW2l1Kb8kTjbSg/vWV5gbPPf0OiFm80/KRyDa6dAKggOK2zxLmsrl
 4BrSXFCwdFccCpHInGAlT5E2Qu9gHNyF1nDSNHpl6xjWmptSDJZku2qMfl1dLP+5tiEOdO7gUY74y
 A7exuhcnqEUDzFpo8tF79zxZoLDYbnCnSZCyA6WAcy5uqT7B8/C7+sRdop90NF8gr/PrMBeAuuMYX
 8VMsXlsRXiBApc97ML8xkWz09ZAdc4gIqVorxX5iTl74VRTbkfKu3Kb2DcsaLKiSumUTCYw8yeJO2
 YmrPYDjh3DeXvs11dmruOhlz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tVYiU-005tuv-3C; Wed, 08 Jan 2025 16:15:35 +0000
Message-ID: <0e9252d9-8dd0-45f6-b9fb-0fc083dd0253@samba.org>
Date: Wed, 8 Jan 2025 17:15:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Open SSH kerberos auth not working with 4.21.x keytabs as server
 principals are in caps/mixed case - keytab breaks RFS 4120,
 section 6.2.1, fix for 4.21.3 please?
To: Ralph Boehme <slow@samba.org>, Matt Grant <matt@mattgrant.net.nz>
References: <06ffa961-fc2f-4d22-9e47-e2c007e62b3e@mattgrant.net.nz>
 <e283dd4c-8fb9-4912-b5c9-2da171c92e1a@samba.org>
Content-Language: en-US
In-Reply-To: <e283dd4c-8fb9-4912-b5c9-2da171c92e1a@samba.org>
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
From: pfilipensky--- via samba-technical <samba-technical@lists.samba.org>
Reply-To: pfilipensky@samba.org
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Matt,

I am sorry, I have missed this mail. I will look at it now and if needed 
I will add the fix to samba-4.21.4.

Thank you!

Pavel


On 12/21/24 12:53 PM, Ralph Boehme via samba-technical wrote:
> Hi Matt,
>
> thanks for bringing this up! Besides a behaviour change we'll also 
> need tests to cover this.
>
> @Pavel: iirc you've ween working on the keytab generation code 
> recently. Would you be able to look into this?
>
> Thanks!
> -slow
>
> On 12/21/24 8:03 AM, Matt Grant via samba-technical wrote:
>> Hi!
>>
>>
>> Any thoughts on including fix for Bug #15759 for 4.21.3 please? 'sync 
>> machine password to keytab' sync_spns is producing non functional key 
>> tabs - patch below to lower case default generated parts of service 
>> principal names in Unix keytabs
>>
>>
>> Its a major functionality breaker.
>>
>>
>> Thank you!
>>
>>
>> Matt Grant
>>
>>
>>
>>
>>
>

