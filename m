Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C211AC95EA
	for <lists+samba-technical@lfdr.de>; Fri, 30 May 2025 21:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=WDiOQTKL0PKOU24ytgRdpcQ8yDKwwKYO8DpOjSZC2r4=; b=z3PIoYMOVoP2/9GalqnVwzycg5
	yYbixpbpgRUDjcQyXZ0MYAepI2Ba/lkSV/1PdP12MjDsQex2xGy8qoeKcYj4IaCUmiLfHtXAugBz2
	zPoNw5xpoeDPImFOe9QZu56Xn8M5Ok6SpiLQ43xlB+FmANXzvKc4gKRc2xVVdGuILK/LqjSUxhoSV
	uRZi3YRqDpTv513bylZlZ5Z3r0aoODO4dT5nJc7/zEvc0a9eHS3aBuOADTwMiWZtTg2Wn7pBFp+24
	YQ7IOf3/SjZUYk/W8BEDbfxZ7lJJPCyA8JQXL5XicywmQpmHa1eSABEhn/IksvqaXlvOJ1yW32i37
	LO3yopmA==;
Received: from ip6-localhost ([::1]:42226 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uL514-004UCi-RN; Fri, 30 May 2025 19:03:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40112) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uL50z-004UCb-NS
 for samba-technical@lists.samba.org; Fri, 30 May 2025 19:03:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=WDiOQTKL0PKOU24ytgRdpcQ8yDKwwKYO8DpOjSZC2r4=; b=xQRXJqliNvr8yaDiptNQqGjYR2
 ZKBnqB1JTHQ6i95tkEOHmDz5JOjO8mn+0P4o6Shn7Pknz0f+drxPI+ieqLo5tqDLAZa3+F/eXXc63
 jw8wwcvWW2pklA8P7Aa9AL71G0ZoGyexdyv2G7CJNPBMlbnVqiOvaKRPjoEHfXoG7w51qVdiyRe/6
 hdiOt7PYvuzyXrmAIXw4mLWM9bvJ2HFqB9UvZw7JquMxcz/c4DJdvBAxZfZc5Ka1o4aEvoWUMYW33
 JVUKvOllE1dBBsVEcPfR3b+D4wBmkMQA30zlI3stA5SU9GbO275ij4t3ApJpsPwI56v0HecM7NN6G
 x2BoG6vpsczLwRAeW0PNpginIc9Mf+R15ThRCNJrOup9WpNdcl1Uf/kFBrtdDkC1a/waQbQXMO5ky
 Jm8TOXZXcXW7JPUH4W1kIQWT8bDl95iLytdwWKVN4j6xMFLO/ntePT8+cl1xX5VWR1FBsy8XE9oVM
 r80oUElyzBe/jYyJeTaCFrvb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uL50y-0083yb-1C; Fri, 30 May 2025 19:03:36 +0000
Message-ID: <096f20e9-3e59-4e80-8eeb-8a51f214c6f1@samba.org>
Date: Fri, 30 May 2025 21:03:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/12] smb: smbdirect: add smbdirect_pdu.h with
 protocol definitions
To: Namjae Jeon <linkinjeon@kernel.org>
References: <cover.1748446473.git.metze@samba.org>
 <b43ee94c3db13291156e70d37a3e843ad7d08b31.1748446473.git.metze@samba.org>
 <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAKYAXd_df0mwgAbJb3w_r_8JmJOAZjPfhjoFpWgTkWJFdMWUMA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, Hyunchul Lee <hyc.lee@gmail.com>,
 Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 29.05.25 um 01:28 schrieb Namjae Jeon:
> On Thu, May 29, 2025 at 1:02 AM Stefan Metzmacher <metze@samba.org> wrote:
>>
>> This is just a start moving into a common smbdirect layer.
>>
>> It will be used in the next commits...
>>
>> Cc: Steve French <smfrench@gmail.com>
>> Cc: Tom Talpey <tom@talpey.com>
>> Cc: Long Li <longli@microsoft.com>
>> Cc: Namjae Jeon <linkinjeon@kernel.org>
>> Cc: Hyunchul Lee <hyc.lee@gmail.com>
>> Cc: Meetakshi Setiya <meetakshisetiyaoss@gmail.com>
>> Cc: linux-cifs@vger.kernel.org
>> Cc: samba-technical@lists.samba.org
>> Signed-off-by: Stefan Metzmacher <metze@samba.org>
>> ---
>>   fs/smb/common/smbdirect/smbdirect_pdu.h | 55 +++++++++++++++++++++++++
>>   1 file changed, 55 insertions(+)
>>   create mode 100644 fs/smb/common/smbdirect/smbdirect_pdu.h
>>
>> diff --git a/fs/smb/common/smbdirect/smbdirect_pdu.h b/fs/smb/common/smbdirect/smbdirect_pdu.h
>> new file mode 100644
>> index 000000000000..ae9fdb05ce23
>> --- /dev/null
>> +++ b/fs/smb/common/smbdirect/smbdirect_pdu.h
>> @@ -0,0 +1,55 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + *   Copyright (c) 2017 Stefan Metzmacher
> Isn't it 2025? It looks like a typo.

I took it from here:
https://git.samba.org/?p=metze/linux/smbdirect.git;a=blob;f=smbdirect_private.h;hb=284ad8ea768c06e3cc70d6f2754929a6abbd2719

> And why do you split the existing one into multiple header
> files(smbdirect_pdu.h, smbdirect_socket.h, smbdirect.h)?

In the end smbdirect.h will be the only header used outside
of fs/smb/common/smbdirect, it will be the public api, to be used
by the smb layer.

smbdirect_pdu.h holds protocol definitions, while smbdirect_socket.h
will be some kind of internal header that holds structures shared between multiple .c files.

But we'll see I think this is a start in the correct direction.

I try to focus on doing tiny steps avoiding doing to much at the same time
or even try to avoid thinking about the next step already...

metze

