Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BCA8C0156
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 17:47:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Au3hW7vZCK6TJMIQ7okYzLmiFEzPrtXJbiFGyaDcBPk=; b=R/8TB3bSulyWnfLdl9WAjF90xM
	tpCLD0GRHtSBhwURx0W5m6QY/8YHJGwMGVNOFCM5Wfx7Y2fxS3D1+vpW/mMZCLAQ/YuFeTsMh/F8r
	b66A0us4R0IihEe4KiBDtqZFhGbC6X6yshtlq/aFvekxr+bcjpPAo6O9LeSm7aG+CflHkNWOt3njU
	qf6IBYWEcQHAvjlmvD8VUN3yyyN526genaAy9npiBUP49RFxLu81cEASmMl12PRWQG/cTOiOm0Z25
	Vj4uQaeInVClfRyr5qPEqR0UdG8GcM/R6anwd/mNWkf+F1cffkdGx6rbaw1knKik5l0NEG5bDMHYZ
	1jvz1PxQ==;
Received: from ip6-localhost ([::1]:40458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4jV0-008Xj7-GH; Wed, 08 May 2024 15:46:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61728) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4jUw-008Xj0-8T
 for samba-technical@lists.samba.org; Wed, 08 May 2024 15:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=Au3hW7vZCK6TJMIQ7okYzLmiFEzPrtXJbiFGyaDcBPk=; b=Av2x6bw93Fe/B/LF9gLTDkfVEC
 m6CX6w8zKJ0OvQwPSzTA58NAHpmhKuWStSbfX4OjAeaxIBzQRXiyYWBGD+vZEkft3Fz0yPdnm9EEd
 uvZ1ykF5irn44h9nXv+6vuAVdc8K+mYB6sPufop8nlt3csYd77Xyg093i8fX0tA1D5nQr7PVCzHip
 5gXGBQrvHbitzCB4UXJsas84Wd9vhYQdXtpX7VqrIeMjCDhat35VDGcnA2Rnj6aa5VXnOnKM47vL2
 XP7LBKKG7ERrmIJPF5WMgvoyfcJw/AQA4af+Cu+s9YbR1mwn468YI1x8/xqC/j7vyts32iOMwNGgF
 Gqy/kWb+4mFhFtAIP09axy4Upa05lfAdjeGwak8nTk7YhFDy1v2dMfJTJZ954qclQQh38ly+HCjOS
 FwWAaupyIjLJYjXGn1KXt8PjGhQFR1IG04xQqTTtaV6TKVq8L8qX7BWOkHgsVTsCDw6hjttUt7AjJ
 bJnErLx8nWpknYFuKoqyHna3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4jUv-00ASaL-29; Wed, 08 May 2024 15:46:25 +0000
Message-ID: <034ae3ad-feef-4f4f-b2fe-fdeebacfec6b@samba.org>
Date: Wed, 8 May 2024 17:46:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samba-gpoupdate
To: David Mulder <dmulder@suse.com>
References: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
 <ca6277a8-4b77-4842-a18d-c10b1e93f810@suse.com>
 <8c63936e-3d09-402f-88e5-3115c32da7e6@samba.org>
 <f0a93a6b-ed97-4a67-bfa3-9cbd5fcb7ad5@samba.org>
Content-Language: en-US, de-DE
In-Reply-To: <f0a93a6b-ed97-4a67-bfa3-9cbd5fcb7ad5@samba.org>
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi David,

>>>> Do we really want to apply all those gp_extensions by default?
>>>> I would have assumed that the admin needs to configure them explicitly.
>>>>
>>>> Pure ad dc samba internal stuff like gp_access_ext, gp_krb_ext
>>>> and my new gp_privilege_rights_ext should run by default on an ad dc
>>>> and only there (the server role is checked in the code).
>>>>
>>>> But all others messing with critical stuff in /etc looks dangerous
>>>> without explicitly selecting them.
>>>>
>>>> I'm also not sure how the things from get_gp_client_side_extensions() work.
>>>
>>> That's for loading custom client extensions (for example, if a company has internal policies they want applied). I'm not sure if anyone is using this.
>>>
>>> See https://dmulder.github.io/group-policy-book/writing-group-policy-extensions.html#cse
>>>
>>> The `register_gp_extension` and `unregister_gp_extension` functions control the policies added by get_gp_client_side_extensions().
>>>
>>> Notice the `samba-tool gpo cse register` and `samba-tool gpo cse unregister` commands also.
>>
>> Ok, I think it would be useful if all extensions would go via this and would
>> be listed by 'samba-tool gpo cse list'.
>  >
>> In addition something like 'samba-tool gpo cse enable' and
>> 'samba-tool gpo cse disable' would be useful in order to give the admin more control
>> over it. Then 'samba-tool gpo cse list' could list all active once
>> and 'samba-tool gpo cse list-available' would list all possible once.
>>
>> The only question is how this could be done in a compatible way compared
>> to released samba versions.
> 
> I'm currently working on auto register builtin cses in parse_gpext_conf()
> 
> There I'll try to work out if the registration should enable or disable
> them based on 'apply group policies = yes' and the existence of gpo.tdb
> 
> And instead of a absolute filepath I think a python module name like
> "samba.gp.gp_sec_ext" should be possible, that makes it much easier
> to test without changes with 'bin/samba-gpoupdate' without make install.
> And also with packaging changes.
> 
> All registered cses in gpext.conf will also get MachinePolicyDisabled
> and UserPolicyDisabled.'samba-tool gpo cse update' will let admins change it explicitly.
> And get_gp_client_side_extensions() will only return enabled policies.

Ok, I now found that cse GUID are wellknown things.

E.g. MS-GPSB specifies:

CSE GUID{827D319E-6EAC-11D2-A4EA-00C04F79F83A}
Tool extension GUID (computer policy settings){803E14A0-B4FB-11D0-A0D0-00A0C90F574B}

And these are stored in the gPCMachineExtensionNames and gPCUserExtensionNames attributes.
And our client completely ignores them.

I also found that we only process single changed policies unless samba-gpupdate --force is used,
but it's important to process all policies related to a cse in the correct order.

For the [Privilege Rights] feature it's extremely important to get the order correct,
as per Right/Privilege only the first processed policy should be applied and all others are
ignored. So 'SeUndockPrivilege = *S-1-5-32-544' in the first policy and 'SeUndockPrivilege = *S-1-5-32-545'
as well as 'SeEnableDelegationPrivilege = *S-1-5-32-545' in the 2nd policy means that the
effective result looks like this:

SeUndockPrivilege = *S-1-5-32-544
SeEnableDelegationPrivilege = *S-1-5-32-544

and the 'SeUndockPrivilege = *S-1-5-32-545' from the 2nd policy is ignored.

While researching on this I found that we apply the policies in the wrong order,
assume the following:


DC=domain,DC=example
- DomainGPO1
- DomainGP02
- DomainGP03 (enforced)
- DomainGP04 (enforced)
OU=SomeOU,DC=domain,DC=example
- SomeOUGPO1
- SomeOUGPO2
- SomeOUGPO3 (enforced)
- SomeOUGPO4 (enforced)
OU=Computers,OU=SomeOU,DC=domain,DC=example
- ComputersGPO1
- ComputersGPO2
- ComputersGPO3 (enforced)
- ComputersGPO4 (enforced)

Default-first-Site-Name:
- SiteGPO1
- SiteGPO2
- SiteGPO3 (enforced)
- SiteGPO4 (enforced)

Gives the following order for CN=computer,OU=SomeOU,DC=domain,DC=example:

SiteGPO3
SiteGPO4
DomainGPO3
DomainGPO4
SomeOUGPO3
SomeOUGPO4
ComputersGPO3
ComputersGPO4
ComputersGPO1
ComputersGP02
SomeOUGPO1
SomeOUGPO2
DomainGPO1
DomainGPO2
SiteGPO1
SiteGPO2

While samba-gpupdate --rsop shows this:

GPO: SiteGPO2
GPO: SiteGPO1
GPO: DomainGPO2
GPO: DomainGPO1
GPO: SomeOUGPO2
GPO: SomeOUGPO1
GPO: ComputersGPO2
GPO: ComputersGPO1
GPO: SiteGPO4
GPO: SiteGPO3
GPO: DomainGPO4
GPO: DomainGPO3
GPO: SomeOUGPO4
GPO: SomeOUGPO3
GPO: ComputersGPO4
GPO: ComputersGPO3

Any comment would be highly appreciated!

metze

