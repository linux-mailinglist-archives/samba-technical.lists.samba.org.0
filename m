Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA338C01A7
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2024 18:04:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=B9mr1FFqiFJjB5s0jmRdbNuqKdPi2VdCbksYgzYY+jE=; b=0ay0j5LtLwvvbUwknm/+cyQdEV
	9ve01lT64vTbKfVTLXxLu5TUGncVgK68powrnyfLQwvU1QNMR+tyAnln5N55T4lyL/pC2FxmJ6qnc
	/Osi78O7I6esIlhkXxtGHx2JTHhlwTK1rezVjMBrdw3B54H3turFXFFLl73eNeLgkU6aQFiQ3EPZw
	M0nv1OYKjNyqAGuGavfOfyGlVENA27hBSBbr4W1swloUGwQBXvedqVR22Fh7kTjz7FxXTbuPetfnK
	9onrdRNwX5VwwpihV/m9cYttgRsdjr0W1NoSbIbNpCuOR7TfCnpvCarMw+QFoI+DsR9SY88JYgmDj
	z+kH96dg==;
Received: from ip6-localhost ([::1]:27722 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s4jlo-008Xsj-RE; Wed, 08 May 2024 16:03:52 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:46255) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s4jlk-008Xsc-18
 for samba-technical@lists.samba.org; Wed, 08 May 2024 16:03:50 +0000
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e22a1bed91so58832461fa.0
 for <samba-technical@lists.samba.org>; Wed, 08 May 2024 09:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1715184226; x=1715789026; darn=lists.samba.org;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=B9mr1FFqiFJjB5s0jmRdbNuqKdPi2VdCbksYgzYY+jE=;
 b=A5c8Bf3DUd86RYNTWTg7ZWvdA+N2kp3fMPOP1XANXTxipO9YTexn4maA14fjAb1YkV
 zFGAuSuAogDm8BMVEjIc4136tl0mSl8YOtcwAAHB810aKcJeG4qLMTCFYaYsZWKk/oZ2
 Ls9rOOsIlg4AHL0HXkGtSds74rgv7ytWerzeuaFFDcHYIxFZAT31EbweXZ3jofQukdxL
 1YTAWViPj9FtpxIjRTLbGRcBSzTqQBhTBgHPiU4iQC4dvdXXGG2/VBImUExn+Q12gyIC
 B+lqDfG4pE7SgRDslUQ2BZzvBIu1iD9CPTV8zsceCquJdR7/V+60B6LOJCocAae8PXpD
 XgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715184226; x=1715789026;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B9mr1FFqiFJjB5s0jmRdbNuqKdPi2VdCbksYgzYY+jE=;
 b=ahwt5EQkXTLs2LvJbU4cc3/FGxhdW+pnETSNxfAYNa7NRtJvUJhLItjU4Rk5mX5D5I
 XGvVQApNohZYGF4DZ657KCywdSkY7Sz+1Yd/Hf0M1DN4T0qBohnhV9wLJTlgvp2gESa3
 0POJcYVaWqAhsNNkrxW0UyRQOEOopLVebSBr1obuKCnUAPs0JtXMZCGT6I4C84tcutYn
 uS2BJV1v+58AtjTg5ZWJCr1G5ZQyIXQF5tPt3wXK+Yh3/LMioGeu4G29hfx5QzHFStT0
 LIOXw8tjy40nasQqsvPShHqM4BI+Ff7CMwtrOwvqxpmzyqG2KN/YclCLHoCBXEpJTi8W
 681Q==
X-Gm-Message-State: AOJu0Yzm2NcLWf8KvcdFIeE7k6Z4pryQ+UAurbMLnx5DhPyJQNvR5CZc
 hTobORL5X0Nt0Ii+cy9jEKrwK4KubyvnT8bNjHJoiO9QjBUvKpwvMr3wt4DhH68euNf9HQy3L4Y
 N
X-Google-Smtp-Source: AGHT+IEwh5+nYnfycI/h1LUvpdxvCdgjPY7dE804hEY4gH8NYvkohbF8CoB5hrpzoUfqkjjQMDLZfQ==
X-Received: by 2002:a2e:87c9:0:b0:2df:c0b8:2dd6 with SMTP id
 38308e7fff4ca-2e446f7f29bmr20380171fa.21.1715184226007; 
 Wed, 08 May 2024 09:03:46 -0700 (PDT)
Received: from [192.168.1.19] ([69.163.66.79])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a170902e80a00b001e826e4d087sm12009255plg.142.2024.05.08.09.03.44
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 May 2024 09:03:45 -0700 (PDT)
Message-ID: <7b19606a-f1dc-4b7e-9b7f-fb551612e04e@suse.com>
Date: Wed, 8 May 2024 10:03:45 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samba-gpoupdate
To: samba-technical@lists.samba.org
References: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
 <ca6277a8-4b77-4842-a18d-c10b1e93f810@suse.com>
 <8c63936e-3d09-402f-88e5-3115c32da7e6@samba.org>
 <f0a93a6b-ed97-4a67-bfa3-9cbd5fcb7ad5@samba.org>
 <034ae3ad-feef-4f4f-b2fe-fdeebacfec6b@samba.org>
Content-Language: en-US
Organization: SUSE
In-Reply-To: <034ae3ad-feef-4f4f-b2fe-fdeebacfec6b@samba.org>
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
From: David Mulder via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Mulder <dmulder@suse.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 5/8/24 9:46 AM, Stefan Metzmacher via samba-technical wrote:
> Hi David,
>
>>>>> Do we really want to apply all those gp_extensions by default?
>>>>> I would have assumed that the admin needs to configure them 
>>>>> explicitly.
>>>>>
>>>>> Pure ad dc samba internal stuff like gp_access_ext, gp_krb_ext
>>>>> and my new gp_privilege_rights_ext should run by default on an ad dc
>>>>> and only there (the server role is checked in the code).
>>>>>
>>>>> But all others messing with critical stuff in /etc looks dangerous
>>>>> without explicitly selecting them.
>>>>>
>>>>> I'm also not sure how the things from 
>>>>> get_gp_client_side_extensions() work.
>>>>
>>>> That's for loading custom client extensions (for example, if a 
>>>> company has internal policies they want applied). I'm not sure if 
>>>> anyone is using this.
>>>>
>>>> See 
>>>> https://dmulder.github.io/group-policy-book/writing-group-policy-extensions.html#cse
>>>>
>>>> The `register_gp_extension` and `unregister_gp_extension` functions 
>>>> control the policies added by get_gp_client_side_extensions().
>>>>
>>>> Notice the `samba-tool gpo cse register` and `samba-tool gpo cse 
>>>> unregister` commands also.
>>>
>>> Ok, I think it would be useful if all extensions would go via this 
>>> and would
>>> be listed by 'samba-tool gpo cse list'.
>>  >
>>> In addition something like 'samba-tool gpo cse enable' and
>>> 'samba-tool gpo cse disable' would be useful in order to give the 
>>> admin more control
>>> over it. Then 'samba-tool gpo cse list' could list all active once
>>> and 'samba-tool gpo cse list-available' would list all possible once.
>>>
>>> The only question is how this could be done in a compatible way 
>>> compared
>>> to released samba versions.
>>
>> I'm currently working on auto register builtin cses in 
>> parse_gpext_conf()
>>
>> There I'll try to work out if the registration should enable or disable
>> them based on 'apply group policies = yes' and the existence of gpo.tdb
>>
>> And instead of a absolute filepath I think a python module name like
>> "samba.gp.gp_sec_ext" should be possible, that makes it much easier
>> to test without changes with 'bin/samba-gpoupdate' without make install.
>> And also with packaging changes.
>>
>> All registered cses in gpext.conf will also get MachinePolicyDisabled
>> and UserPolicyDisabled.'samba-tool gpo cse update' will let admins 
>> change it explicitly.
>> And get_gp_client_side_extensions() will only return enabled policies.
>
> Ok, I now found that cse GUID are wellknown things.
>
> E.g. MS-GPSB specifies:
>
> CSE GUID{827D319E-6EAC-11D2-A4EA-00C04F79F83A}
> Tool extension GUID (computer policy 
> settings){803E14A0-B4FB-11D0-A0D0-00A0C90F574B}
>
> And these are stored in the gPCMachineExtensionNames and 
> gPCUserExtensionNames attributes.
> And our client completely ignores them.
>
> I also found that we only process single changed policies unless 
> samba-gpupdate --force is used,
> but it's important to process all policies related to a cse in the 
> correct order.
>
> For the [Privilege Rights] feature it's extremely important to get the 
> order correct,
> as per Right/Privilege only the first processed policy should be 
> applied and all others are
> ignored. So 'SeUndockPrivilege = *S-1-5-32-544' in the first policy 
> and 'SeUndockPrivilege = *S-1-5-32-545'
> as well as 'SeEnableDelegationPrivilege = *S-1-5-32-545' in the 2nd 
> policy means that the
> effective result looks like this:
>
> SeUndockPrivilege = *S-1-5-32-544
> SeEnableDelegationPrivilege = *S-1-5-32-544
>
> and the 'SeUndockPrivilege = *S-1-5-32-545' from the 2nd policy is 
> ignored.
>
> While researching on this I found that we apply the policies in the 
> wrong order,
> assume the following:
>
>
> DC=domain,DC=example
> - DomainGPO1
> - DomainGP02
> - DomainGP03 (enforced)
> - DomainGP04 (enforced)
> OU=SomeOU,DC=domain,DC=example
> - SomeOUGPO1
> - SomeOUGPO2
> - SomeOUGPO3 (enforced)
> - SomeOUGPO4 (enforced)
> OU=Computers,OU=SomeOU,DC=domain,DC=example
> - ComputersGPO1
> - ComputersGPO2
> - ComputersGPO3 (enforced)
> - ComputersGPO4 (enforced)
>
> Default-first-Site-Name:
> - SiteGPO1
> - SiteGPO2
> - SiteGPO3 (enforced)
> - SiteGPO4 (enforced)
>
> Gives the following order for CN=computer,OU=SomeOU,DC=domain,DC=example:
>
> SiteGPO3
> SiteGPO4
> DomainGPO3
> DomainGPO4
> SomeOUGPO3
> SomeOUGPO4
> ComputersGPO3
> ComputersGPO4
> ComputersGPO1
> ComputersGP02
> SomeOUGPO1
> SomeOUGPO2
> DomainGPO1
> DomainGPO2
> SiteGPO1
> SiteGPO2
>
> While samba-gpupdate --rsop shows this:
>
> GPO: SiteGPO2
> GPO: SiteGPO1
> GPO: DomainGPO2
> GPO: DomainGPO1
> GPO: SomeOUGPO2
> GPO: SomeOUGPO1
> GPO: ComputersGPO2
> GPO: ComputersGPO1
> GPO: SiteGPO4
> GPO: SiteGPO3
> GPO: DomainGPO4
> GPO: DomainGPO3
> GPO: SomeOUGPO4
> GPO: SomeOUGPO3
> GPO: ComputersGPO4
> GPO: ComputersGPO3
Well that's odd. The GPO order is determined by get_gpo_list, which I 
thought followed [MS-GPOL] 3.2.5.1 pretty closely. It looks like we're 
doing it backwards at first, then have some of them mixed up.

-- 
David Mulder
Labs Software Engineer, Samba
SUSE
1221 S Valley Grove Way, Suite 500
Pleasant Grove, UT 84062
(P)+1 385.208.2989
dmulder@suse.com
http://www.suse.com


