Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 234B28D2051
	for <lists+samba-technical@lfdr.de>; Tue, 28 May 2024 17:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=gVE8OFnqDQ1kCD2ibj65C7unv1G/xsNCS29woZdMJxE=; b=aXShpfMMKiM/NOqkdhwe7ibAWp
	9irTfWVdvgrTEKYgO7W1o1z0JXT9OFGsWdyknPm6er0M5/2aYp9hhthdyoSopDjlFlp5JdcpwNFoq
	xmn4Okh0USWHM8tXuoDcsA5zv0I6feug4/qslZKKK9x/PL2Obsk2IqybXmKkWQkXpF6X5TYlPsjUS
	2PVUxBCWnALmZy/mkYBTifMAfMxcex9XqLbuzQAeU6OMIHAeH0XjsZZlxXYFE4WQy4mbA4ggCOMJV
	FC3vul4ErBYE5SXDjbifkQSFeL/yBg1uhw5MLO7L4rxLm+ufcyy9ZtNH2wLNJ81JQMEDt4EAs5Rv/
	XCvQDCNg==;
Received: from ip6-localhost ([::1]:46056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sByiP-00A9eF-Sa; Tue, 28 May 2024 15:26:17 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51114) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sByiK-00A9e8-NT
 for samba-technical@lists.samba.org; Tue, 28 May 2024 15:26:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=gVE8OFnqDQ1kCD2ibj65C7unv1G/xsNCS29woZdMJxE=; b=MyJo3zmQ1YI9O2gZWUhRwQi3M2
 auX/etffCYcQa/TwIi6RCSp6nXmTIRqjy7uzSzu026lzF/10sI4XHJNKeMmXooxUsIokWAM0ffojm
 trkYTzjSBivEG4Ns3l+15kp90z+KEwx6R+KEtm56ZMgqxa0Acmz9mdNqSYOVHauZ6okxH+cYZdWRr
 +VP5tZoFrIi1ZF/vqMUONOAUZqHDf1Q3zVZJkPhgpYnZHGm92WUsUkQ6YfhdJr+BjldiTTCMBXsMp
 t8lpVZ8B+AfUDluCOz2L/sZ9u3JazQk5LHWkJn7HkjMKRKypqGnyEUoe90B6F/JhFEdhhlgzkE3KL
 I+4ERjn0RiSE9u1kqg7FADNdBDsoTf+VInAHLhdNGCNgvLYy3b4gSyASN3MuColhKPD9AIj/qv3ze
 wO1ehnuNIozBFqXzRI9RUro7Ar+nes9xb2WtJglaCUT4JRv7uzEc4Ht+Kv45O8UEbQMWnmSrD1Vmv
 heuNb9hhYz8fMnXiwvqhwnAB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sByiK-00De7N-0W; Tue, 28 May 2024 15:26:12 +0000
Message-ID: <02447030-cca9-4b33-bd11-54368035005e@samba.org>
Date: Tue, 28 May 2024 17:26:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samba-gpoupdate
To: David Mulder <dmulder@suse.com>, samba-technical@lists.samba.org
References: <a41d2cce-e9d5-4322-80f1-e04aae0505c7@samba.org>
 <ca6277a8-4b77-4842-a18d-c10b1e93f810@suse.com>
 <8c63936e-3d09-402f-88e5-3115c32da7e6@samba.org>
 <f0a93a6b-ed97-4a67-bfa3-9cbd5fcb7ad5@samba.org>
 <034ae3ad-feef-4f4f-b2fe-fdeebacfec6b@samba.org>
 <7b19606a-f1dc-4b7e-9b7f-fb551612e04e@suse.com>
 <a6b7e04e-1605-48b0-9e6a-31f506f841d1@samba.org>
 <38141c0b-34b2-4777-844b-d6a52b97481b@suse.com>
Content-Language: en-US, de-DE
In-Reply-To: <38141c0b-34b2-4777-844b-d6a52b97481b@suse.com>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 10.05.24 um 16:46 schrieb David Mulder via samba-technical:
> 
> On 5/10/24 4:39 AM, Stefan Metzmacher wrote:
>> Hi David,
>>
>>>>> All registered cses in gpext.conf will also get MachinePolicyDisabled
>>>>> and UserPolicyDisabled.'samba-tool gpo cse update' will let admins change it explicitly.
>>>>> And get_gp_client_side_extensions() will only return enabled policies.
>>>>
>>>> Ok, I now found that cse GUID are wellknown things.
>>>>
>>>> E.g. MS-GPSB specifies:
>>>>
>>>> CSE GUID{827D319E-6EAC-11D2-A4EA-00C04F79F83A}
>>>> Tool extension GUID (computer policy settings){803E14A0-B4FB-11D0-A0D0-00A0C90F574B}
>>>>
>>>> And these are stored in the gPCMachineExtensionNames and gPCUserExtensionNames attributes.
>>>> And our client completely ignores them.
>>
>> Do you have any comment on this?
>>
>> samba-tool gpo cse register invents a random uuid, so each client will have its
>> own uuid, so it's a completely separate thing from the wellknown values
>> used for gPCMachineExtensionNames and gPCUserExtensionNames.
> Ok, so we probably need to have a fixed guid for each extension. Then we need to set gPCMachineExtensionNames and gPCUserExtensionNames when we enable the extension?

Yes.

>> samba-tool gpo load --help talks about this:
>>> The --machine-ext-name and --user-ext-name options are multi-value inputs
>>> which respectively set the gPCMachineExtensionNames and gPCUserExtensionNames
>>> ldap attributes on the GPO. These attributes must be set to the correct GUID
>>> names for Windows Group Policy to work correctly. These GUIDs represent
>>> the client side extensions to apply on the machine. Linux Group Policy does
>>> not enforce this constraint. {35378EAC-683F-11D2-A89A-00C04FBBCFA2} is provided by default, which
>>> enables most Registry policies. 
>>
>> So why are gPCMachineExtensionNames and gPCUserExtensionNames ignored
>> on Linux?
> Because of an oversight on my part, probably. IIRC, I added these because I saw Windows does this, not because I understood their purpose.
>> Can we change it?
> I don't see why not.

I mean that existing setups would no longer execute the extensions missing from
gPCMachineExtensionNames and gPCUserExtensionNames

>> MS-GPOL 1.8 Vendor-Extensible Fields
>>> The Group Policy: Core Protocol allows vendors to define Group Policy extensions to the protocol.
>>> These Group Policy extensions enable vendors to store vendor-specific data in a GPO on the Group
>>> Policy server. For the Group Policy client to access that data, it needs to be able to identify a
>>> system component that can retrieve and interpret that data.
>>> To facilitate this, the GPO Active Directory object schema has two attributes,
>>> gPCMachineExtensionNames and gPCUserExtensionNames, in which a vendor can append both
>>> a CSE GUID (as specified in [MS-DTYP] section 2.3.4.3) that identifies that GPO as having that
>>> vendor's particular extra Group Policy extension data stored inside it, and a tool extension GUID
>>> that allows the vendor to associate an administrative tool that can update the data. The vendor
>>> obtains the UUIDs of the CSE GUID and the tool extension GUID by generating them according to the
>>> standard GUID algorithm, as specified in [C706]. After they are generated, the vendor includes the
>>> GUID in these attributes, as specified in section 2.2. Vendors do not need to collaborate or obtain
>>> GUIDs from a central authority; the GUID generation algorithm ensures that no two vendors make use
>>> of the same GUID. Vendors can specify a NULL GUID for the tool extension GUID.
>>> Each CSE GUID and tool extension GUID defined by a vendor MUST be treated as a standards
>>> assignment to the gPCMachineExtensionNames and gPCUserExtensionNames attributes that
>>> MUST be declared in the Group Policy extension documentation that is associated with the CSE GUID
>>> and tool extension GUID.
>>
>> Maybe we could have the wellknown CSE GUID in addition to the random UniqueGUID
>> reports.
>>
>> And multiple of our local cses would specify the same cse guid,
>> e.g. gp_krb_ext, gp_access_ext and gp_privilege_rights_ext would specify
>> {827D319E-6EAC-11D2-A4EA-00C04F79F83A} from MS-GPSB.
>> Or should we merge them into one extension?
>>
>> I'm not sure about it, but I guess it would be good to have a way to
>> enable/disable them separately.
>>
>> This seems to be a bit like what MS-GPOL 3.2.1.24 Extension List specified:
>>
>>> The list of Group Policy client-side extensions present in the local machine. The Extension List is in
>>> ascending order by CSE GUID. The following information MUST be maintained for each extension:
>>> - CSE GUID
>>
>> This is the wellknown CSE GUID
>>
>> I guess we could let class gp_ext have a list with gse guid, so
>> that samba-tool cse register would not need a --cse-guid.
>>
>>> - Implementation Identifier: A string that uniquely identifies the implementation-specific
>>> reification of the CSE GUID.
>>
>> This would be our local UniqueGUID
>>
>> For our builtin extension, we should even use wellknown value too.
>>
>>> - MaxNoGPOListChangesInterval: An integer value that SHOULD<15> specify the maximum
>>> number of minutes to skip the extension when the policy has not changed.
>>
>>>> I also found that we only process single changed policies unless samba-gpupdate --force is used,
>>>> but it's important to process all policies related to a cse in the correct order.
>>
>> Any extension without cse-guid would be called for all policies,
>> but if one or more cse guids are specified they should only be called
>> with gpos having at least one cse guid also specified on gPCMachineExtensionNames
>> or gPCUserExtensionNames.
>>
>> With the above I'd think we should pass in all gpos for the cse as changed_gpos,
>> even if only one of them actually changed.
>>
>> Do you see any problem with such a change and already existing cse registered
>> in the wild.
> 
> I'm only aware of one person who has ever contacted me about custom cse registration. Either way, I don't see how it would effect a custom implementation given that the 
> example in https://dmulder.github.io/group-policy-book/writing-group-policy-extensions.html#cse shows to use a static ext GUID.
> 
> Also, sounds like we haven't been registering the existing extensions correctly, so it should be fine.

Ok, but still the value is not configured in
gPCMachineExtensionNames and gPCUserExtensionNames


>>>> For the [Privilege Rights] feature it's extremely important to get the order correct,
>>>> as per Right/Privilege only the first processed policy should be applied and all others are
>>>> ignored. So 'SeUndockPrivilege = *S-1-5-32-544' in the first policy and 'SeUndockPrivilege = *S-1-5-32-545'
>>>> as well as 'SeEnableDelegationPrivilege = *S-1-5-32-545' in the 2nd policy means that the
>>>> effective result looks like this:
>>>>
>>>> SeUndockPrivilege = *S-1-5-32-544
>>>> SeEnableDelegationPrivilege = *S-1-5-32-544
>>>>
>>>> and the 'SeUndockPrivilege = *S-1-5-32-545' from the 2nd policy is ignored.
>>>>
>>>> While researching on this I found that we apply the policies in the wrong order,
>>>> assume the following:
>>>>
>>>>
>>>> DC=domain,DC=example
>>>> - DomainGPO1
>>>> - DomainGP02
>>>> - DomainGP03 (enforced)
>>>> - DomainGP04 (enforced)
>>>> OU=SomeOU,DC=domain,DC=example
>>>> - SomeOUGPO1
>>>> - SomeOUGPO2
>>>> - SomeOUGPO3 (enforced)
>>>> - SomeOUGPO4 (enforced)
>>>> OU=Computers,OU=SomeOU,DC=domain,DC=example
>>>> - ComputersGPO1
>>>> - ComputersGPO2
>>>> - ComputersGPO3 (enforced)
>>>> - ComputersGPO4 (enforced)
>>>>
>>>> Default-first-Site-Name:
>>>> - SiteGPO1
>>>> - SiteGPO2
>>>> - SiteGPO3 (enforced)
>>>> - SiteGPO4 (enforced)
>>>>
>>>> Gives the following order for CN=computer,OU=SomeOU,DC=domain,DC=example:
>>>>
>>>> SiteGPO3
>>>> SiteGPO4
>>>> DomainGPO3
>>>> DomainGPO4
>>>> SomeOUGPO3
>>>> SomeOUGPO4
>>>> ComputersGPO3
>>>> ComputersGPO4
>>>> ComputersGPO1
>>>> ComputersGP02
>>>> SomeOUGPO1
>>>> SomeOUGPO2
>>>> DomainGPO1
>>>> DomainGPO2
>>>> SiteGPO1
>>>> SiteGPO2
>>>>
>>>> While samba-gpupdate --rsop shows this:
>>>>
>>>> GPO: SiteGPO2
>>>> GPO: SiteGPO1
>>>> GPO: DomainGPO2
>>>> GPO: DomainGPO1
>>>> GPO: SomeOUGPO2
>>>> GPO: SomeOUGPO1
>>>> GPO: ComputersGPO2
>>>> GPO: ComputersGPO1
>>>> GPO: SiteGPO4
>>>> GPO: SiteGPO3
>>>> GPO: DomainGPO4
>>>> GPO: DomainGPO3
>>>> GPO: SomeOUGPO4
>>>> GPO: SomeOUGPO3
>>>> GPO: ComputersGPO4
>>>> GPO: ComputersGPO3
>>> Well that's odd. The GPO order is determined by get_gpo_list, which I thought followed [MS-GPOL] 3.2.5.1 pretty closely. It looks like we're doing it backwards at first, 
>>> then have some of them mixed up.
>>
>> I guess some details of MS-GPOL 3.2.5.1.5 GPO Search are wrong.
> If you can figure out what is mixed up about the ordering, notify doc-help.

The confusing part is that all tools (the Windows GUI and gpresult /R)
report the gpos in a priority order, while the apply order is
exactly the reverse.

With that bug is the fact that enforced gpos should be
grouped in reverse order.

Normal GPOs have this order:

       priority: SUBOU, OU, Domain, Site
       apply: Site, Domain, OU, SUBOU

Enforced GPOD have this order:

       priority: Site, Domain, OU, SUBOU
       apply: SUBOU, OU, Domain, Site

Within each gpLink the order is the same.

The documentation has this:

>     3. For each element in the SOM GPLink list, beginning with the first element:
>       1. If the Enforced field is FALSE, and Allow-Enforced-GPOs-Only is set to FALSE, the GPO
>       DN MUST be prepended to the beginning of the Non-enforced GPLink list.
>       2. The element MUST be removed from the SOM GPLink list.
>    4. For each element that remains in the SOM GPLink list, beginning with the first element:
>       1. GPO DN MUST be appended to the end of the Enforced GPLink list.
>       2. The element MUST be removed from the SOM GPLink list.
> ...
> 3. For each GPO DN in the Non-enforced GPLink list, beginning with the first element, GPO DN MUST
>    be appended to the end of the GPLink list.
> 4. For each GPO DN in the Enforced GPLink list, beginning with the first element, GPO DN MUST be
>    appended to the end of the GPLink list.

So there's a difference between 3.1 'be prepended to the beginning of' and
4.1 'be appended to the end of'

But by strictly following this, the order of enforced gpos in the
same gPLink is reversed.

But this patch fixes it for me:
https://git.samba.org/?p=metze/samba/wip.git;a=commitdiff;h=a044459d3752c8db3b3318251e06af5956e29227

There are also other important changes like this:
https://git.samba.org/?p=metze/samba/wip.git;a=commitdiff;h=8dfb2e52484cb5652494c7acb415ba40625857b8
where we make use of GPO_FLAG_MACHINE_DISABLE and GPO_FLAG_USER_DISABLE

As well as this, where an extension can say if it wants to be effective for a given gpo:

https://git.samba.org/?p=metze/samba/wip.git;a=commitdiff;h=725676f85159e9e1d77b67b0a44ec7dcd8365810

There are more random unfinished hacks in:
https://git.samba.org/?p=metze/samba/wip.git;a=shortlog;h=refs/heads/master-gpo

metze

