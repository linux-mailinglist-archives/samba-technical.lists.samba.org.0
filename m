Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 415FC46F5CD
	for <lists+samba-technical@lfdr.de>; Thu,  9 Dec 2021 22:17:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Z4t3ULBbQqJ34wXAmjhsGKG/YNpMXeUSqZ2C7S6bjig=; b=nmJaZPm8C0lGxS7wpuNW/ErE9F
	c16QwQU8Is4cB7gXNWdNvmI6sna/o4erBehMNZEyYAS5o46eKERqxkFD1/JY/YnWv4lIsi6fEZUSG
	SkcL473gdfbxBvnb8mENcx9UWYDC7ElLugWe8lKwYw6tetrO9QLHXMrZlnQaw8BRphRNBJhbjSBLT
	WWKZ94s767NpP9PmxsTeqU9Nlbwz8rQSfxxBJ98FIs/YGKTCfeihUCU5CMHMEDhw/nJ/9ggVL/3Dm
	XLyLrRqtmGc0b8K5xpvE5UG2X3/S5EE9scdgrGDSfGtUrOXKf/Yk4jUS8U4yIiPu24y71R5S8b/Eb
	2u4/4VnA==;
Received: from ip6-localhost ([::1]:43600 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvQmX-004j2F-5f; Thu, 09 Dec 2021 21:16:49 +0000
Received: from p3plsmtpa09-09.prod.phx3.secureserver.net
 ([173.201.193.238]:54892) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mvQmQ-004j26-GE
 for samba-technical@lists.samba.org; Thu, 09 Dec 2021 21:16:45 +0000
Received: from [192.168.0.100] ([98.118.115.249]) by :SMTPAUTH: with ESMTPSA
 id vQkAmzg1TjHgNvQkAmZGkG; Thu, 09 Dec 2021 14:14:23 -0700
X-CMAE-Analysis: v=2.4 cv=LM2j/La9 c=1 sm=1 tr=0 ts=61b271af
 a=T+zzzuy42cdAS+8Djmhmkg==:117 a=T+zzzuy42cdAS+8Djmhmkg==:17
 a=IkcTkHD0fZMA:10 a=hGzw-44bAAAA:8 a=yMhMjlubAAAA:8 a=bZwIJP9oYGyM1WlQb6sA:9
 a=QEXdDO2ut3YA:10 a=HvKuF1_PTVFglORKqfwH:22
X-SECURESERVER-ACCT: tom@talpey.com
Message-ID: <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
Date: Thu, 9 Dec 2021 16:14:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Andrew Walker <awalker@ixsystems.com>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
In-Reply-To: <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAwKEraLsXrnWkjHfS2Jbqlx6shJotrxJh4CI3/RUZIPGqZjArEqQXl6Z3ydxlyz0GMsPd6iHAiFpwHSIu+WReJArsnhtX0vTjHRSqjnZPB+gz24qZKn
 xVCBdxr9yW+CkzkdjYTKdROdZLL6ZFnjuQgX5VU7noKQlAAmnuR5OxWIvUqskjA31aqSSHEAF35loWEkp0qPqpBbUmRKXcdFAd8ONNDGn8JKiGpoNSWOdgdw
 H5cm+LE0tWgDtygUFp+M7kEEleP21Fdi3yGC2yKRt0RkcRCHqfThQVEfh92ouL7Hoo4V49Z4d9cUPxVnzbAEeg==
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Steven Engelhardt <steven.engelhardt@relativity.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 12/9/2021 3:40 PM, Andrew Walker wrote:
> 
> 
> On Thu, Dec 9, 2021 at 3:28 PM Tom Talpey via samba-technical 
> <samba-technical@lists.samba.org 
> <mailto:samba-technical@lists.samba.org>> wrote:
> 
>     On 12/9/2021 1:58 PM, Ralph Boehme wrote:
>      > Hi Tom,
>      >
>      > On 12/9/21 19:48, Tom Talpey wrote:
>      >> I really think you need a bulletproof mathematically correct
>      >> uniqueid generator here.
>      >
>      > Patches welcome. :)))
>      >
>      > I guess all we can get is an approximation.
> 
>     But, the penalty for a collision is data corruption! It's unacceptable
>     to wing it.
> 
>     Can't TDB help here? Stuff a number into the database and save it.
>     Increment it by one for each new fileid needed.
> 
>     Carve out a hundred, or a thousand, so you don't have to do a
>     transaction every new handle. Increment that by the carveout for
>     the next call. 64 bits will last you forever, so you could even
>     use it across server restart.
> 
>     Make it fancier, if monotonicity is too easily forged, or misused.
> 
>     Tom.
> 
> Tom,
> 
> I was glancing through MS-SMB and noticed that it states that file ids 
> must be unique, but may be re-used if the file is deleted. 
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb/44c3cf8d-0931-4923-8fdc-738537ba70ba 

Death to SMB1. I dearly hope we're talking about SMB2/SMB3 here.

The SMB2_FILEID is a 2-part structure, 64 bits for each handle (id):
https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-smb2/f1d9b40d-e335-45fc-9d0b-199a31ede4c3

SMB2 and SMB3 allow recovery of these after a disconnect, in certain
cases. So it's more complex.

> Is that not the case? Or maybe discouraged?

SMB1 loses all context on disconnect, so the fileid's are toast along
with the rest of the session state.

> Out of curiosity, why can't we use device/inode?

Device and inode simply map to the underlying file object (and they
may not be perfectly stable depending on implementation too). The
SMB2_FILEID conveys the handles which map the state of the "open";
this includes much more than the underlying file and its cached
contents.

I'm pretty sure the Windows SMB2/3 server just bumps a counter for
the volatile id's. Don't recall if or when it recycles.

Tom.

