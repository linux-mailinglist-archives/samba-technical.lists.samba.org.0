Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E39E18BFF96
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 15:55:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=78+cqAKPy45tLo9rHoUVZLB4TWDztjps9KV7dO5ckvA=; b=Bt4sv8hl5FfUEQn2sbG8zbIVXB
	fpWo1K/gdLaV0cJsb9tXlHaGc2tXtXoRcfutqjK51ofKos/lU53XXEgCb56Ek/bxFTaAc5z0uaO9G
	DGsk+g4MIAeDfKBVO15Fc72m3OzHVwPGN4dgy1hf60tpxs/mLJ8tEhicP20oI/8fcN8oNQYQoI/9A
	nHC39HACPVt8CKIYt21FKXP3ReT62sU8SucwKtUNjqRJDq4bUnTcZ40pwUYU3x9Xs9937vO6/1MlU
	7f/UcH4NAsZrZL1RuvA41z+W74IHoTTegcUBkZe6Aa5qewhD9w0Ohv3V20OrPE3JtsB2GGmHHfezE
	mCOtjVKg==;
Received: from ip6-localhost ([::1]:46230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4hkn-008XNt-J7; Wed, 08 May 2024 13:54:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15466) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4hkj-008XNm-3b
 for samba-technical@lists.samba.org; Wed, 08 May 2024 13:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=78+cqAKPy45tLo9rHoUVZLB4TWDztjps9KV7dO5ckvA=; b=HKlInqjYaFiz9z1ImAYC33GOmt
 IWgH4sAjo0NTY2G9DcMkiKBcXXp+cElPkKCCYfNlvbI6M3uPz6rDU7jVU/q8Ge1PmPagNpq5QcWDk
 Qq6jaHD1wUN5knyQc4g39UitQu0drN+NPdecWdF11AHYdksUdAHcGTm2h7+nrn4XwWoort3cmkiMq
 D7lOBbFUbFpbc8ydtoJHUW7/K/UeQ4HyfY5vPTuypdlrLf11J7/eQLuosmunEeaymFAQn0+ZZeImF
 wJA5b0aUC0jFGO8Uo7czFctCZ5WCM0ZFcECEfeYi6PBjnPj7dvjBSjPogFDXDOTOFwQXG+2l/fn+B
 lM9V2I63gh22wCdNfqMEu8pCPMlT+A49mCuBKHSqHd68KnP4N5PITkCaBB3TUYSnj/boJYaFQu/wq
 E0J/rsus6qRavHYjWnl1NVGBnrZLbnPGdrQoSYIsbG5+EH+1K3VvolPVJVy5bKsDGJERDM7iQDh3Y
 MRaEeDyUAjf98Tah0mvurDYi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4hki-00ARjX-1J; Wed, 08 May 2024 13:54:36 +0000
Message-ID: <3788e216-2309-410a-8840-6bc88256d587@samba.org>
Date: Wed, 8 May 2024 15:54:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Gitlab CI fails
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2650765.fDdHjke4Dd@magrathea> <2823827.DJkKcVGEfx@magrathea>
 <2a68e98b-a3a0-4ef1-bf36-2dc9a99e32df@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <2a68e98b-a3a0-4ef1-bf36-2dc9a99e32df@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 08.05.24 um 14:00 schrieb Stefan Metzmacher via samba-technical:
> Am 08.05.24 um 13:50 schrieb Andreas Schneider via samba-technical:
>> On Wednesday, 8 May 2024 08:15:41 GMT+2 Andreas Schneider via samba-technical
>> wrote:
>>> Hi,
>>>
>>> the CI fails for me for all o3 runners [1] with:
>>>
>>> [70(1029)/303 at 3m36s] samba.tests.ntacls
>>> UNEXPECTED(failure):
>>> samba.tests.ntacls.samba.tests.ntacls.NtaclsTests.test_setntacl_forcenative(
>>> none) REASON: Exception: Exception: Traceback (most recent call last):
>>>    File "/builds/samba-testbase/samba-o3/bin/python/samba/tests/ntacls.py",
>>> line 87, in test_setntacl_forcenative
>>>      DOMAIN_SID, self.session_info, "native")
>>> AssertionError: Exception not raised by setntacl
>>>
>>> I can reproduce this locally as my home directory is ext4. On gitlab
>>> runners, the filesystem is also ext4.
>>
>> The test succeeds if I run it on btrfs.
> 
> The main thing that changed compared to yesterday is from
> kernel 5.4.109+ to 5.15.109+.

Locally I see this being raised:

PermissionError: [Errno 1] Operation not permitted

And strace shows:

2503678 15:46:31.316876 setxattr("/st/tmp/tmpg6d30pxu/test", "security.NTACL", 
"\1\0\1\0\0\0\2\0\1\0\4\200\34\0\0\08\0\0\0\0\0\0\0T\0\0\0\1\5\0\0\0\0\0\5\25\0\0\0007\325\341\203\232\333\244\240\353q@}\0\2\0\0\1\5\0\0\0\0\0\5\25\0\0\0007\325\341\203\232\333\244\240\353q@}\1\2\0\0\4\0,\0\1\0\0\0\0\3$\0\377\1\37\0\1\5\0\0\0\0\0\5\25\0\0\0007\325\341\203\232\333\244\240\353q@}\0\2\0", 
128, 0) = -1 EPERM (Vorgang nicht zulässig) <0.000012>

I'm on a 6.5 kernel...

metze

