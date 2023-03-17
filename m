Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 737576BED20
	for <lists+samba-technical@lfdr.de>; Fri, 17 Mar 2023 16:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5eyxx+zHGbZBQLl3gAM5sOQ0cvuNP/GWlr7pPfn2HIQ=; b=4lTSMfNQTTawjg464huq7xOYfx
	H+Xb8d4y1CKYJXGHrrN9wqia5RHGLVrNbzlKxufncmr8v4195CQ0+dAs4WUfS5FWVnFVysBKzk8Q7
	EUaWAF9lCM15/gvIGDSpELmQZsf5uoIarFFpv44XWuLk7Och/LPaclKWH0vIzZtAiMLK6jC+pm2Oq
	JJEJcWRvvcbJXtiH5XzE7Qh+S4C0zWji4He7BM97TUapn3/iMcbMFsuRaozhFPiUdHqPOKr9VOB7S
	pY+TNSw2camcAywrCaTN7b0u2hwF7habXgtweJF9xqQLvN2I8E0Yl2wob/vZXQSjR/amM6LHZWdyy
	KZODUDhg==;
Received: from ip6-localhost ([::1]:38330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pdC9K-002zj6-Vp; Fri, 17 Mar 2023 15:37:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53254) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pdC9G-002zix-KK
 for samba-technical@lists.samba.org; Fri, 17 Mar 2023 15:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ZiqMEqy0Q49JB5xG3lu3LobN1RDxvXsnHPERc1+s1MM=; b=bfI7OlBHCP8Sryyuhfw8k+Haio
 0+c3fH7KzHJWQnK+eSM1fU1dYDIwNPddndatOERsi+jJhffZ45wvqqCOVlB0mzv4fWsINKbXwBGRn
 BFY4ZMe3ykKBSJal1ChC7Z1WFWMYVpH/4rVg/I+YPMQWjWlaiEszd8BECNWJ2EDOT+nVP82bIP60Z
 Cz4YsZHZ0EZp6wfSQpCUtxpRydg/LuufYUcnJysc/WoHyD2Z+bMieD0yI2/c8ozkhx/Z/ajC8MDkH
 02ctFC75a2gdeeXTlphFptLy2kFSZ/l/LbIS1Llgc1FdH316dX2SgFUbWQWg4cUyKpUZK+TXztv/I
 huUdgx+0sAxV7NGmOKxlHCne3whEW3NyAts7pKVC5BeA5iEBwfJ9q52JVSCHRSYpWiVPGC5CFs1tL
 YxJmJ5aCRyNpWwF6YN2NCW3UbT77PWweIHzyH7KyA9oMD7y4dMdpvXP7c0LouFk1lUiyuEPynnUDv
 W+2fDH3k8kfAzJmCmiAYKYNT;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pdC9C-003rQ1-QZ
 for samba-technical@lists.samba.org; Fri, 17 Mar 2023 15:37:39 +0000
Message-ID: <768e0b4b-88d3-2164-621b-af942fad0026@samba.org>
Date: Fri, 17 Mar 2023 16:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Nesting of local groups (SID_NAME_ALIAS)
Content-Language: en-US
To: samba-technical@lists.samba.org
References: <c730b289-ff34-aef0-be61-ebd5973ccb03@samba.org>
 <d6cc1768-ebf7-24ec-bdd7-efc28fe364c9@samba.org>
In-Reply-To: <d6cc1768-ebf7-24ec-bdd7-efc28fe364c9@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 3/16/23 20:47, Rowland Penny via samba-technical wrote:
>
>
> On 16/03/2023 19:20, Pavel Filipenský via samba-technical wrote:
>> Hi,
>>
>> windbind does not correctly display members for e.g. BUILTIN/users. 
>> It shows nothing:
>>
>> ./bin/wbinfo --group-info BUILTIN/users
>> BUILTIN/users:x:100001:
>>
>>
>> Given that "BUILTIN\Users" has 1 member "ADDOMAIN\Domain Users", it 
>> should instead show:
>>
>> ./bin/wbinfo --group-info "ADDOMAIN/domain users"
>> ADDOMAIN/domain 
>> users:x:100006:ADDOMAIN/joe,ADDOMAIN/jane,ADDOMAIN/samba2008r2$,ADDOMAIN/samba2003$,ADDOMAIN/administrator,ADDOMAIN/krbtgt,ADDOMAIN/testallowed 
>> account,ADDOMAIN/testupnspn,ADDOMAIN/testdenied,ADDOMAIN/alice,ADDOMAIN/srv_account,ADDOMAIN/bob 
>>
>>
>>
>> I am working on the fix. One part is to call 
>> dcerpc_samr_GetMembersInAlias() instead of the wrong 
>> dcerpc_samr_GetAliasMembership() in source3/winbindd/winbindd_rpc.c.
>> Another part is to change the code dealing with nested groups / 
>> aliases. For that, I need to understand if aliases (SID_NAME_ALIAS) 
>> can be nested, like groups (SID_NAME_DOM_GRP).
>> Reading the Microsoft documentation 
>> https://learn.microsoft.com/en-us/openspecs/windows_protocols/ms-authsod/597504d8-5408-4629-9d81-aab661e6c953:
>>
>> /A local group can contain user accounts that are local to the 
>> computer and user accounts and global groups from their own domain./
>>
>> It looks that "Local groups" which I believe is BUILTIN/users 
>> (SID_NAME_ALIAS) cannot contain another "Local group". I have tested 
>> that also on Windows server using lusrmgr.msc and such nesting was 
>> not possible.
>>
>> However, samba server allows such nesting:
>>
>> bin/net sam createlocalgroup TestGroup1
>> bin/net sam createlocalgroup TestGroup2
>> bin/net sam addmem TestGroup1 TestGroup2
>>
>>
>> Can I assume that SID_NAME_ALIAS cannot be nested?
>>
>>
>> Best regards,
>> Pavel
>
> My understanding of the BUILTIN groups is that they do contain 'local 
> groups', but that is 'local' to the domain, not the computer, or have 
> I misunderstood something.
> There is also the point that I have never used BUILTIN\users and never 
> missed it.
> What is your use case for this ?||

The story started with fixing getgrouplist(3) in nss_wrapper. The next 
step is to bring the new version to samba (third_party: Update 
nss_wrapper to version 1.1.15) . But with the new nss_wrapper existing 
tests (smbtorture local.nss.membership) are failing. When analyzing the 
test failures, we have found bugs in samba code. One of them is here:

https://gitlab.com/samba-team/devel/samba/-/blob/master/source3/winbindd/winbindd_rpc.c#L509

dcerpc_samr_GetAliasMembership() is wrong, should be 
dcerpc_samr_GetMembersInAlias()

There is some more work needed (already in progress and somehow working) 
to make the alias membership to work correctly. The question is, if we 
should completely fix the alias functionality (given it is not needed in 
a real scenario) or if we should only change the tests.


>
> Rowland
>
