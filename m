Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE928ACB74
	for <lists+samba-technical@lfdr.de>; Mon, 22 Apr 2024 12:56:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7cf4v7fEpANZwHMqkyx7ILWD38xdf6Q3SGEqB4Vl/sg=; b=0tMcKm/tDNQqVHk0DK+dkKE3Mt
	tReRRwRraIko6x5n/BLE/VF/JKcAOJqu/4F7YsOwoB3daWjs3HI7RIJZOjTO2xqv1JqfMrmQ79UzV
	KrWu86Tp0DawVZeHC+jO0E/H4bcH2bEgFoxXicmbqdz3fHTDQ2FgoTPW+Khv4Vde0hc72XMgtxEkC
	wPXeP7UW4mvpmLih88VIrmdcvp9C3GFH7MAelCiNLE+i604EVOCa2Fh4hBs3vDCCGrKrx7+I6HP5W
	5qPYYYVyGGrTTLU+rmrRoEs3c+fXDVDIzobDw563MP0UazOoOD9ZCsCRaW7yB2+/zrLwBk5+PPCS8
	DXmbiVPw==;
Received: from ip6-localhost ([::1]:18300 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ryrLi-005MYX-AA; Mon, 22 Apr 2024 10:56:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46400) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ryrLe-005MYP-1m
 for samba-technical@lists.samba.org; Mon, 22 Apr 2024 10:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=7cf4v7fEpANZwHMqkyx7ILWD38xdf6Q3SGEqB4Vl/sg=; b=olMHcPsOjdoRcfFaJQYyHOcpHs
 S7eEHl163vMOiPHjjA7CU/9T/NA9zImRuXERT06Uo17RijwYZZ6cre9FnUlTBeUBX8UQYATBI6Dzw
 Y4g3SAVFoG+FQq6KSwcEMnPe5mYAgIZJ/VRUwoJDk4a/lr9Ub5Gsv4n57VwR3zPd/dZsj5JXlW25A
 vPTm3CXJrRlx2DodYKzX6gr6BvxSZK74ErKsPTw3JQEDQvFpZXTKe8PVpIYl1QR7g/QxAc2hO2DRZ
 9WLZ3jftckatdjh1CgIz1Z6aH0uKyHuEKrTXN1P6RJlm9WIX1oToZV07oISrzVaEX9rpMgdF33WDb
 jzI7aIwrOBiZjLxdjVD144YhWNp7h7WPSqaI0yIl2WNM8L8v338A94gf2mfoK3hHOjVK5EN5k0BJr
 G/rPpzcTIm3RV/Lm6Hwr247OopkBzxfGldMhr3lGbQhy3p43FpJodkXa2VUfbMPoSOQiz51rL+24x
 hAewKQP2bBM4ZwnkgTKmTlIt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ryrLd-007gv1-0y; Mon, 22 Apr 2024 10:56:33 +0000
Message-ID: <5a4351b1-ef92-4072-85e6-65752e3a5a5c@samba.org>
Date: Mon, 22 Apr 2024 12:56:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Proposal for changes in become root
To: Xavi Hernandez <xhernandez@gmail.com>, Ralph Boehme <slow@samba.org>
References: <CAO9H7P_oqwoJoC_8mWNZVYZ-pxrYt9TrEt3t0LJsEvS32EorEg@mail.gmail.com>
 <4249c3b6-3b4e-4bd3-95e5-864158e5797f@samba.org>
 <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <CAO9H7P8Cttbg6v-Cn+rRR5cKc06K1pid9oQqsjPnHL49iCE=ig@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Xavi,

>> On 4/22/24 11:11, Xavi Hernandez via samba-technical wrote:
>>> What do you think ?
>> the future plan is to move the impersonation to the VFS by passing an
>> abstract impersonation object to all VFS functions and then let the VFS
>> modules do the impersonation.
>>
>> metze and I have designed and implemented 75% of what would be needed here:
>>
>> <
>> https://git.samba.org/?p=slow/samba.git;a=shortlog;h=refs/heads/impersonation
>>>
>>
>> The top commit has a few notes and TODO.
>>
>> <
>> https://git.samba.org/?p=slow/samba.git;a=blob;f=Impersonation_Plan.org;h=ea6fe04825ec57ba4c0a7e6476255129e3f3133a;hb=f4ca9ebfc1269bbe7c3319eb991e1d0ea44a08a9
>>>
>>
>> This is probably not what you were asking for, but I'm afraid tunneling
>> become_root() through the VFS would further complicate the current logic
>> and also doesn't allow avoiding all impersonation changes, eg the logic
>> around change_to_user_and_service_by_fsp() and
>> become_user_without_service_by_fsp().
>>
> 
> That's very interesting. I wasn't aware of this work.
> 
> I've just started to take a look, but if I understand it correctly, the
> user credentials will be set just before doing the system call. I've not
> seen any reference to become_root() (I may have missed something, though),
> but I guess it needs to integrate with that and, in this case, it won't
> issue any syscalls to change the current process owner, right ?
> 
> That approach could be very useful for what I really wanted to do. If I see
> it correctly, the credentials switch happens in vfs_default, so modules are
> free to implement the credentials as they want.

Yes, exactly, the generic 'struct samba_impersonation' is passed
to each vfs call. And the impersonation would happen where needed.
The become_root() case would just pass a 'struct samba_impersonation'
representing 'root' or the overwrite_dac capability.

Then the vfs modules are free to do what is needed.
vfs_default would do the change to the correct context before each syscall (in a cached fashion).
vfs modules for userspace filesystems can use samba_impersonation_cache_id() in order
to have a unique cache id for there own context structure.

metze

