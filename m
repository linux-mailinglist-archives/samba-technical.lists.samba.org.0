Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5788C2258
	for <lists+samba-technical@lfdr.de>; Fri, 10 May 2024 12:40:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=UoD9CFSEVda3ysTxHm8X4+C4HUItAnpJ1FYXjntkyMY=; b=amzJvLTm1oINxB0jUb7maqP7sn
	KQK4M2Ux9VHWzyUfSJ5w6AYemeNMBtVz2MqqKWwsictzWofHtrZzjKi8bINr7IolMbbVjyP5XQkkC
	fOYqnqEnHvth8MDzSlQ2pcTsPUvwNBg0wBWJN6ovY6SEhnOV+xFD2h/OzGRV3Tv7zhde3s/Z0P7lL
	Q6VEfpV0jPdbEEe5U5moN0cFo9A/6Nyqpbgj9LZw+Gsl2qhjzsGKvxmwKmGg0xe0zTyUK9Gws3DZi
	58OwiZsIF7TZeO4kBcLOH4U41Zsf+pI2m2DaQM+JRySX1WLgaVummDSrTe+Fa1Yvld2Hqy2sj+RgF
	JcFAAncA==;
Received: from ip6-localhost ([::1]:18752 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s5NfO-008d2i-To; Fri, 10 May 2024 10:39:54 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57764) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s5NfK-008d2b-26
 for samba-technical@lists.samba.org; Fri, 10 May 2024 10:39:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=UoD9CFSEVda3ysTxHm8X4+C4HUItAnpJ1FYXjntkyMY=; b=gTdOR0NHwm1wSgg/SVIb3628oF
 WFviZUrQJu0BXiN6RTCmGS4QQR9T9Wwqpm9kbvxlPdfHXi/LEXwf8QstUKMrXj2OlcAg+kckljEha
 w+u+MIZT/h3oMiAtyrc1bFbXO+MrieT6Nqi6SAPKKUJ/bDSqj2hUZq+0ukR5FnNSdPWtWhS0qI2xd
 9a9PcDd3hu4xYWeh5G/qX22uuyOdYrKzgXMK76xpsqFjQLqCsaoxc0Iyh6atdHG1jpc3FekkYdumU
 i/+rdTiM0vKL8egAfwIpg5p1YmuSO9r7eedT7j162UMWnsNSZEq19XpXt28CMlcwXsezA7RERNYvm
 +J6bLp9KN1OpDasgSJAITmsNaBj3Q15h1IrO/g9Zzw2M9anmRSXiMRibP8iZH6jcwhedOGN/l58rB
 bQG+V9E7DwfkitgzuiXiMthAA53ydrlj36EpCSfvqkg/fnqFSyobDYuEhSeWa1Ngkosj0NxmmPRab
 Qxl93ztLz7SaziqNF/AMYsMq;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s5NfJ-00AlVq-1h; Fri, 10 May 2024 10:39:49 +0000
Message-ID: <a6b7e04e-1605-48b0-9e6a-31f506f841d1@samba.org>
Date: Fri, 10 May 2024 12:39:44 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <7b19606a-f1dc-4b7e-9b7f-fb551612e04e@suse.com>
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

Hi David,

>>> All registered cses in gpext.conf will also get MachinePolicyDisabled
>>> and UserPolicyDisabled.'samba-tool gpo cse update' will let admins change it explicitly.
>>> And get_gp_client_side_extensions() will only return enabled policies.
>>
>> Ok, I now found that cse GUID are wellknown things.
>>
>> E.g. MS-GPSB specifies:
>>
>> CSE GUID{827D319E-6EAC-11D2-A4EA-00C04F79F83A}
>> Tool extension GUID (computer policy settings){803E14A0-B4FB-11D0-A0D0-00A0C90F574B}
>>
>> And these are stored in the gPCMachineExtensionNames and gPCUserExtensionNames attributes.
>> And our client completely ignores them.

Do you have any comment on this?

samba-tool gpo cse register invents a random uuid, so each client will have its
own uuid, so it's a completely separate thing from the wellknown values
used for gPCMachineExtensionNames and gPCUserExtensionNames.

samba-tool gpo load --help talks about this:
> The --machine-ext-name and --user-ext-name options are multi-value inputs
> which respectively set the gPCMachineExtensionNames and gPCUserExtensionNames
> ldap attributes on the GPO. These attributes must be set to the correct GUID
> names for Windows Group Policy to work correctly. These GUIDs represent
> the client side extensions to apply on the machine. Linux Group Policy does
> not enforce this constraint.                                                     
> {35378EAC-683F-11D2-A89A-00C04FBBCFA2} is provided by default, which
> enables most Registry policies. 

So why are gPCMachineExtensionNames and gPCUserExtensionNames ignored
on Linux?

Can we change it?

MS-GPOL 1.8 Vendor-Extensible Fields
> The Group Policy: Core Protocol allows vendors to define Group Policy extensions to the protocol.
> These Group Policy extensions enable vendors to store vendor-specific data in a GPO on the Group
> Policy server. For the Group Policy client to access that data, it needs to be able to identify a
> system component that can retrieve and interpret that data.
> To facilitate this, the GPO Active Directory object schema has two attributes,
> gPCMachineExtensionNames and gPCUserExtensionNames, in which a vendor can append both
> a CSE GUID (as specified in [MS-DTYP] section 2.3.4.3) that identifies that GPO as having that
> vendor's particular extra Group Policy extension data stored inside it, and a tool extension GUID
> that allows the vendor to associate an administrative tool that can update the data. The vendor
> obtains the UUIDs of the CSE GUID and the tool extension GUID by generating them according to the
> standard GUID algorithm, as specified in [C706]. After they are generated, the vendor includes the
> GUID in these attributes, as specified in section 2.2. Vendors do not need to collaborate or obtain
> GUIDs from a central authority; the GUID generation algorithm ensures that no two vendors make use
> of the same GUID. Vendors can specify a NULL GUID for the tool extension GUID.
> Each CSE GUID and tool extension GUID defined by a vendor MUST be treated as a standards
> assignment to the gPCMachineExtensionNames and gPCUserExtensionNames attributes that
> MUST be declared in the Group Policy extension documentation that is associated with the CSE GUID
> and tool extension GUID.

Maybe we could have the wellknown CSE GUID in addition to the random UniqueGUID
reports.

And multiple of our local cses would specify the same cse guid,
e.g. gp_krb_ext, gp_access_ext and gp_privilege_rights_ext would specify
{827D319E-6EAC-11D2-A4EA-00C04F79F83A} from MS-GPSB.
Or should we merge them into one extension?

I'm not sure about it, but I guess it would be good to have a way to
enable/disable them separately.

This seems to be a bit like what MS-GPOL 3.2.1.24 Extension List specified:

> The list of Group Policy client-side extensions present in the local machine. The Extension List is in
> ascending order by CSE GUID. The following information MUST be maintained for each extension:
> - CSE GUID

This is the wellknown CSE GUID

I guess we could let class gp_ext have a list with gse guid, so
that samba-tool cse register would not need a --cse-guid.

> - Implementation Identifier: A string that uniquely identifies the implementation-specific
> reification of the CSE GUID.

This would be our local UniqueGUID

For our builtin extension, we should even use wellknown value too.

> - MaxNoGPOListChangesInterval: An integer value that SHOULD<15> specify the maximum
> number of minutes to skip the extension when the policy has not changed.

>> I also found that we only process single changed policies unless samba-gpupdate --force is used,
>> but it's important to process all policies related to a cse in the correct order.

Any extension without cse-guid would be called for all policies,
but if one or more cse guids are specified they should only be called
with gpos having at least one cse guid also specified on gPCMachineExtensionNames
or gPCUserExtensionNames.

With the above I'd think we should pass in all gpos for the cse as changed_gpos,
even if only one of them actually changed.

Do you see any problem with such a change and already existing cse registered
in the wild.

>> For the [Privilege Rights] feature it's extremely important to get the order correct,
>> as per Right/Privilege only the first processed policy should be applied and all others are
>> ignored. So 'SeUndockPrivilege = *S-1-5-32-544' in the first policy and 'SeUndockPrivilege = *S-1-5-32-545'
>> as well as 'SeEnableDelegationPrivilege = *S-1-5-32-545' in the 2nd policy means that the
>> effective result looks like this:
>>
>> SeUndockPrivilege = *S-1-5-32-544
>> SeEnableDelegationPrivilege = *S-1-5-32-544
>>
>> and the 'SeUndockPrivilege = *S-1-5-32-545' from the 2nd policy is ignored.
>>
>> While researching on this I found that we apply the policies in the wrong order,
>> assume the following:
>>
>>
>> DC=domain,DC=example
>> - DomainGPO1
>> - DomainGP02
>> - DomainGP03 (enforced)
>> - DomainGP04 (enforced)
>> OU=SomeOU,DC=domain,DC=example
>> - SomeOUGPO1
>> - SomeOUGPO2
>> - SomeOUGPO3 (enforced)
>> - SomeOUGPO4 (enforced)
>> OU=Computers,OU=SomeOU,DC=domain,DC=example
>> - ComputersGPO1
>> - ComputersGPO2
>> - ComputersGPO3 (enforced)
>> - ComputersGPO4 (enforced)
>>
>> Default-first-Site-Name:
>> - SiteGPO1
>> - SiteGPO2
>> - SiteGPO3 (enforced)
>> - SiteGPO4 (enforced)
>>
>> Gives the following order for CN=computer,OU=SomeOU,DC=domain,DC=example:
>>
>> SiteGPO3
>> SiteGPO4
>> DomainGPO3
>> DomainGPO4
>> SomeOUGPO3
>> SomeOUGPO4
>> ComputersGPO3
>> ComputersGPO4
>> ComputersGPO1
>> ComputersGP02
>> SomeOUGPO1
>> SomeOUGPO2
>> DomainGPO1
>> DomainGPO2
>> SiteGPO1
>> SiteGPO2
>>
>> While samba-gpupdate --rsop shows this:
>>
>> GPO: SiteGPO2
>> GPO: SiteGPO1
>> GPO: DomainGPO2
>> GPO: DomainGPO1
>> GPO: SomeOUGPO2
>> GPO: SomeOUGPO1
>> GPO: ComputersGPO2
>> GPO: ComputersGPO1
>> GPO: SiteGPO4
>> GPO: SiteGPO3
>> GPO: DomainGPO4
>> GPO: DomainGPO3
>> GPO: SomeOUGPO4
>> GPO: SomeOUGPO3
>> GPO: ComputersGPO4
>> GPO: ComputersGPO3
> Well that's odd. The GPO order is determined by get_gpo_list, which I thought followed [MS-GPOL] 3.2.5.1 pretty closely. It looks like we're doing it backwards at first, 
> then have some of them mixed up.

I guess some details of MS-GPOL 3.2.5.1.5 GPO Search are wrong.

metze

