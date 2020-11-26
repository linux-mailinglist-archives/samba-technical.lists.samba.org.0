Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C7B2C5741
	for <lists+samba-technical@lfdr.de>; Thu, 26 Nov 2020 15:42:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=viq6WM9aQXPiSX86y6KWU89j5A5iQk2zBlb0pJGi/RM=; b=5GS/FPviXpHbJaQXH7muEjKDP1
	vsYHMIRbCCSk8mPdezGi7/AGFfbQ9T74vMMz5MHksNvugBPQDlaPoT+oGtXWwgPHTLmVC7MY+/bqF
	Zlx2VqtfAaw0LAWPcTdmOqrZQUFbB0oaFoxgfcJNYT311d7GyQ1r/zabJoAAi+Gl8DKBBt6mHVLzu
	tPEDQRQSUmOq2FttQhfl+98Xi5OFncO1Q8HEvIQkbyNcmqtVhEANh+jJCLssisAJQkXj/d9KoRgIP
	hGmtf3P44RnRkT69n7LcVSxlnljilw6P9iFWV90anS7ZdUxEj1O94l1D48HIow56uKrse++wYPL71
	wnn31VYQ==;
Received: from ip6-localhost ([::1]:39010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kiISW-002pH6-Cc; Thu, 26 Nov 2020 14:41:20 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13604) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kiISP-002pGz-Lk
 for samba-technical@lists.samba.org; Thu, 26 Nov 2020 14:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=viq6WM9aQXPiSX86y6KWU89j5A5iQk2zBlb0pJGi/RM=; b=0ymbmFGSzIyEzzURekZs/ELOtE
 SNFkH57OI+rjXtRKCbHvW/Nq7EiCFsCaoI9NaGMSihNwTFp66iTS7iLXpImnm+iEzBxHrMWqqd7sp
 RWkE/VWi7Feg6ELM9mSSYGph/V+e7ZFXntRe4SOX9bZWkXhdezeOtlFe7h9mW6DRUUHuFv3ccm1aV
 Q79YcEAcgeeaE8u0rLnvpWqqhxGZfH2TUq7bLhADlFusdj/0M1ptTxX11KO9OKOFrivgZ+lImAOWz
 msBM9kQ0KdmjHDLuYMXopMWr9B+mH33KKDc7qf5OkIfxYIAcgkxZ1ZRpa81QkfiWheRoKVcnhu/Kc
 F6nmB3dBeLVQKYIHjY278ljIeXJvW2124+VZy55bqYIT3p08alNhfhZJrOcJuRhlqiTOUjd2ac6AT
 sMl4Lv/ZQnPfS7rQDIq8afmv5Rzc5CTj1HYSSer1PbwK1GQNfzfCd2fyDmNPdi3qW6UVF1nNZBUjK
 aVdfcebaeSuyPCUKyu5ZAdtc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kiISP-0002BP-2R
 for samba-technical@lists.samba.org; Thu, 26 Nov 2020 14:41:13 +0000
Subject: Re: about "ea support" parameter
References: <5C9D413C-7EF4-47EF-975B-ACE19B40B2AB@vmware.com>
 <01389598-12D7-4F10-9490-99441D905D34@vmware.com>
 <7f4d9057-921b-a6e8-acb2-1df1e4d5a255@samba.org>
 <1429DB9B-9F4B-421F-AC67-6DA2C4B72945@vmware.com>
 <760bd41b-f907-6f60-2264-5b5ea9536a5f@samba.org>
 <6c6ab928-70ec-e70a-3f1d-b7b03e37db61@samba.org>
To: samba-technical <samba-technical@lists.samba.org>
Message-ID: <8204acce-58bb-1dce-8ef0-0a1b2a50f59c@samba.org>
Date: Thu, 26 Nov 2020 14:41:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <6c6ab928-70ec-e70a-3f1d-b7b03e37db61@samba.org>
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

On 26/11/2020 13:56, Ralph Boehme wrote:
> Am 11/26/20 um 2:38 PM schrieb Rowland penny via samba-technical:
>> On 26/11/2020 12:31, Leo Fan via samba-technical wrote:
>>> Hi Ralph,
>>>
>>> Thanks for your quick response!
>>>
>>> Glad to know both Windows and MAC apps make heave use of streams but 
>>> not EAs, I am more confident that we can disable EA support.
>>> Both Data streams and EAs are used to store extra (meta)data of 
>>> files/directories.
>>> I am curious which kind of applications would use EA.
>>>
>> I am not confident you can disable EA support. Why do you think the 
>> default was set to 'yes' ? Could it have anything to do with an EA is 
>> where the Windows ACLs are stored by Samba ?
>
> yes. But see my initial mail.
>
>>
>> If you set the permissions from Windows, the ACES etc are stored in 
>> an EA, ergo, if you are using Windows, you really need EAs.
>
> no. See my initial mail. :)
>
> -slow
>
Are you sure about that ?

Running 'ls' against 'sysvol' gets this:

root@dc4:~# ls -lad /var/lib/samba/sysvol/
drwxrws---+ 3 3000000 3000027 4096 Jul 22  2018 /var/lib/samba/sysvol/

Which shows that there are xattrs:

root@dc4:~# getfacl /var/lib/samba/sysvol/
getfacl: Removing leading '/' from absolute path names
# file: var/lib/samba/sysvol/
# owner: 3000000 # S-1-5-32-544 # BUILTIN_ADMINISTRATORS
# group: 3000027 # S-1-5-18 # SYSTEM
# flags: -s-
user::rwx
user:3000007:r-x # S-1-5-11 # AUTHENTICATED_USERS
user:3000026:r-x # S-1-5-32-549 # SERVER_OPERATORS
user:3000027:rwx # S-1-5-18 # SYSTEM
group::rwx
group:3000000:rwx # S-1-5-32-544 # BUILTIN_ADMINISTRATORS
group:3000007:r-x # S-1-5-11 # AUTHENTICATED_USERS
group:3000026:r-x # S-1-5-32-549 # SERVER_OPERATORS
group:3000027:rwx # S-1-5-18 # SYSTEM
mask::rwx
other::---
default:user::rwx
default:user:3000000:rwx # S-1-5-32-544 # BUILTIN_ADMINISTRATORS
default:user:3000007:r-x # S-1-5-11 # AUTHENTICATED_USERS
default:user:3000026:r-x # S-1-5-32-549 # SERVER_OPERATORS
default:user:3000027:rwx # S-1-5-18 # SYSTEM
default:group::---
default:group:3000000:rwx # S-1-5-32-544 # BUILTIN_ADMINISTRATORS
default:group:3000007:r-x # S-1-5-11 # AUTHENTICATED_USERS
default:group:3000026:r-x # S-1-5-32-549 # SERVER_OPERATORS
default:group:3000027:rwx # S-1-5-18 # SYSTEM
default:mask::rwx
default:other::---

Note I annotated who the 'numbers' are

But if I look at the EA:

root@dc4:~# samba-tool ntacl get /var/lib/samba/sysvol/ --as-sddl
O:BAG:SYD:PAI(A;OICIIO;WOWDGRGWGX;;;CO)(A;OICIIO;GRGX;;;AU)(A;;0x001200a9;;;AU)(A;OICIIO;GA;;;SY)(A;;0x001f03ff;;;SY)(A;OICIIO;WOWDGRGWGX;;;BA)(A;;0x001e01bf;;;BA)(A;OICIIO;GRGX;;;SO)(A;;0x001200a9;;;SO)

It is much finer grained on the permissions AND there is another 'owner' 
that getfacl doesn't show 'CO' 'CREATOR_OWNER'.

You might think that you can get away with not using EAs, but I think 
differently, so I suppose we will have to agree to disagree 😁

Rowland



