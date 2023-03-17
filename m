Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7852B6BEEFC
	for <lists+samba-technical@lfdr.de>; Fri, 17 Mar 2023 17:56:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Rpkd90lVdDC1Z8HN6+FfGxxFWveKaQIGags8F57gTzU=; b=sgz4LEjLR1MK8UoAaY0VDBQUVj
	24WjhhWE/uJX62F7FOk78GyYZQWpneKmB3h4591aWk6Jmlo872xB/LSVmbybgSlBsrXvG7MUHbQoD
	6IyjllIiduArTB3fJpT4p3E5A+iztE40kZ+c+IylVdNIqSb0PrX1nQ0rtgaXs869klku+BG3wDJGm
	zBrWVAbHPZSmbF7eQ/cpWIG9DUqEQK30AiJNM3h50yvHUo4x6HbvOSdORWCrNpYRTQhhhHT8k64//
	YScwIqtRPJq3qNXBfd4UcF6CGigwfBq2f+RbdLTt97d+mjZY+1dZMpoVz1P8b7n8wJv88JxytASxf
	ifdXo42Q==;
Received: from ip6-localhost ([::1]:32824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdDNI-00314h-4e; Fri, 17 Mar 2023 16:56:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11438) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdDNB-00314Y-DG
 for samba-technical@lists.samba.org; Fri, 17 Mar 2023 16:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=Rpkd90lVdDC1Z8HN6+FfGxxFWveKaQIGags8F57gTzU=; b=Wckl49dJMmayxxLdRpUe3HyQ1u
 6C8rY8DERgIJI0YTZ5g94pNnNw1/UxGQ6Q5CnHc9tzxerKtFup5tWIHeJ2ac2n2i3EyZTuA2gMDRS
 Qc6BkwQeoSDl1f0Fl+4B47rWKnPa/pAGYuZ1HlA4EUNmLxFllrdZV49AVqAcJwwgboQ9UsZwRhzCB
 3NpyUtGhIgjWkJzesTbjEONC2ESh005dYej+oST0IAUM7JUp2jy2zDvfbqoHBSGP+OifpSqUqnGaz
 s/GdUvjU+sbwzA8h7lek2bbqIFigjlJgYzw1kY762uFmfTddyvM7B1D+wMzePuAUAXgDOdeYYEvrg
 bRAbRzsu1l1UWpkd8h3oZsWTc5aqwxJEOka+MI7Prf/CP03LAdz2oDU8dfryP7VKhodJaizZgfQfl
 eBduc8Ij/RBhtRrI6P5kQhbNwI0xWymG7j2rTbSWzVKe9QV1iCAo1fhblX+NRnMTcEhA3WiA/IOC1
 6rnV52f8kNqgXFMCsftvRKuH;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pdDNA-003s8W-SH
 for samba-technical@lists.samba.org; Fri, 17 Mar 2023 16:56:08 +0000
Message-ID: <7a61fdc9-1cbe-b5f7-2059-6c2effb1352b@samba.org>
Date: Fri, 17 Mar 2023 16:56:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Nesting of local groups (SID_NAME_ALIAS)
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <c730b289-ff34-aef0-be61-ebd5973ccb03@samba.org>
 <d6cc1768-ebf7-24ec-bdd7-efc28fe364c9@samba.org>
 <768e0b4b-88d3-2164-621b-af942fad0026@samba.org>
In-Reply-To: <768e0b4b-88d3-2164-621b-af942fad0026@samba.org>
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 17/03/2023 15:37, Pavel Filipenský via samba-technical wrote:
> 
> On 3/16/23 20:47, Rowland Penny via samba-technical wrote:
>>
>>
>> On 16/03/2023 19:20, Pavel Filipenský via samba-technical wrote:
>>> Hi,
>>>
>>> windbind does not correctly display members for e.g. BUILTIN/users. 
>>> It shows nothing:
>>>
>>> ./bin/wbinfo --group-info BUILTIN/users
>>> BUILTIN/users:x:100001:
>>>
>>>
>>> Given that "BUILTIN\Users" has 1 member "ADDOMAIN\Domain Users", it 
>>> should instead show:
>>>
>>> ./bin/wbinfo --group-info "ADDOMAIN/domain users"
>>> ADDOMAIN/domain 
>>> users:x:100006:ADDOMAIN/joe,ADDOMAIN/jane,ADDOMAIN/samba2008r2$,ADDOMAIN/samba2003$,ADDOMAIN/administrator,ADDOMAIN/krbtgt,ADDOMAIN/testallowed account,ADDOMAIN/testupnspn,ADDOMAIN/testdenied,ADDOMAIN/alice,ADDOMAIN/srv_account,ADDOMAIN/bob
>>>
>>>
>>> I am working on the fix. One part is to call 
>>> dcerpc_samr_GetMembersInAlias() instead of the wrong 
>>> dcerpc_samr_GetAliasMembership() in source3/winbindd/winbindd_rpc.c.
>>> Another part is to change the code dealing with nested groups / 
>>> aliases. For that, I need to understand if aliases (SID_NAME_ALIAS) 
>>> can be nested, like groups (SID_NAME_DOM_GRP).
>>> Reading the Microsoft documentation 
>>> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-authsod/597504d8-5408-4629-9d81-aab661e6c953:
>>>
>>> /A local group can contain user accounts that are local to the 
>>> computer and user accounts and global groups from their own domain./
>>>
>>> It looks that "Local groups" which I believe is BUILTIN/users 
>>> (SID_NAME_ALIAS) cannot contain another "Local group". I have tested 
>>> that also on Windows server using lusrmgr.msc and such nesting was 
>>> not possible.
>>>
>>> However, samba server allows such nesting:
>>>
>>> bin/net sam createlocalgroup TestGroup1
>>> bin/net sam createlocalgroup TestGroup2
>>> bin/net sam addmem TestGroup1 TestGroup2
>>>
>>>
>>> Can I assume that SID_NAME_ALIAS cannot be nested?
>>>
>>>
>>> Best regards,
>>> Pavel
>>
>> My understanding of the BUILTIN groups is that they do contain 'local 
>> groups', but that is 'local' to the domain, not the computer, or have 
>> I misunderstood something.
>> There is also the point that I have never used BUILTIN\users and never 
>> missed it.
>> What is your use case for this ?||
> 
> The story started with fixing getgrouplist(3) in nss_wrapper. The next 
> step is to bring the new version to samba (third_party: Update 
> nss_wrapper to version 1.1.15) . But with the new nss_wrapper existing 
> tests (smbtorture local.nss.membership) are failing. When analyzing the 
> test failures, we have found bugs in samba code. One of them is here:
> 
> https://gitlab.com/samba-team/devel/samba/-/blob/master/source3/winbindd/winbindd_rpc.c#L509
> 
> dcerpc_samr_GetAliasMembership() is wrong, should be 
> dcerpc_samr_GetMembersInAlias()
> 
> There is some more work needed (already in progress and somehow working) 
> to make the alias membership to work correctly. The question is, if we 
> should completely fix the alias functionality (given it is not needed in 
> a real scenario) or if we should only change the tests.
> 
>

If there is a bug, it definitely needs fixing, but in a way that suits 
Unix and Windows.
There is this parameter (that a lot of peopled do not like) 'winbind use 
default domain =yes', if this is set and nested groups are fixed so that 
BUILTIN\users shows users, is there a chance that the group will just 
become 'users', which will clash with the Unix group 'users'.

Rowland



