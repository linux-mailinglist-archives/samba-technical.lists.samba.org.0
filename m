Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D08B6830ED
	for <lists+samba-technical@lfdr.de>; Tue, 31 Jan 2023 16:10:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZtoHDNV7OnoB61VhXvccxwq58ecDbYgDXNemVGXZngk=; b=TvYl8Hcf0gRzkrRbMpnCVkSdjW
	cr7c9KmpYDrbLFiY2TMMF/2md69Hd2Wplt/y1aR8dZsEN6HOyoP53FtMwf3gRF4igfXfyQ6me/Drs
	MvBYBbScUsutC8p/tCedb9HeLq+kpvMlMntk0AxY/ZGMpUUcZFhSLMM5ssa5mF2mVDFSeLP1lfvyD
	8gIyWc6lq51wI2iFwDBxK2vPATm04T/QhD+bwL06i8JFy9iiRyY9+AzyICD9yygWZ4RoyxrF7EpSf
	KzMEFVKAfQ9jxLMzI8h3zsITuhbMxP6ELwlsrbNqX4ibruyYb2HtpgQLgOKZoXmH9s2G7z/Lw6k/t
	WNyrPMzg==;
Received: from ip6-localhost ([::1]:41224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pMsGY-0054Rw-C1; Tue, 31 Jan 2023 15:09:46 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35708) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pMsGS-0054Rn-Vt
 for samba-technical@lists.samba.org; Tue, 31 Jan 2023 15:09:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=ZtoHDNV7OnoB61VhXvccxwq58ecDbYgDXNemVGXZngk=; b=zxyVlR2ovf/YtbTIsEyh4hGNEj
 Kty9RIZ3NmqU7fffjc1+X9aXT5tJGQH4Ro0gkV5BEuwuIri7udoJRk45/W3JjFf8F/o/w/mu4WlGc
 BSqxvwk46RlKH6BByIidSJlRKsjJFsB2wBqPpDKt/ERlhE53/fRaL1ZyjB6Bt0iRn/TNhuCXsFmzg
 Mej97cBOeXAGsYRraayEYx8/PlOv/TD0PewglFTO+88gXE36ZTq9DbLnGbh3lb9mszHiMy8eZ6Sla
 H38uaBTBSTQkQD4/WaDP0TZU/7THL0vb6eVK45CipIE7T+jx+Oo9FlTXpKX4gib1UNkzjLuQhNEYT
 vzCDlvnvAbPqToBwqryohbdXIr055jQGofreNYNzrKJ7h26ItgQW8fCzZA0gofiuJL6E7SdxEHpvG
 G88YH/50MVbdokd3g1vOIXbGphVuGE5grfOfSRxmlYJ2434LooL6ITtYQo2KcUf4svZcoD3MDIY1X
 V+3OztucTjIbgPGGcyACHqCC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pMsGS-00B5ba-2e
 for samba-technical@lists.samba.org; Tue, 31 Jan 2023 15:09:40 +0000
Message-ID: <bcad6c3a-045b-a717-ff48-b7345d7e976b@samba.org>
Date: Tue, 31 Jan 2023 15:09:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: problem with GPO Policy after rename
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <3E14DFAD-1094-4089-8897-88AF7CA133EF@grown-up.com>
 <e0eb8658-8c7f-b270-df2e-c19bfa5c9841@samba.org>
In-Reply-To: <e0eb8658-8c7f-b270-df2e-c19bfa5c9841@samba.org>
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
Reply-To: samba@lists.samba.org
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>



On 31/01/2023 14:49, David Mulder via samba-technical wrote:
> On 1/30/23 11:46 PM, itdept_head via samba-technical wrote:
>> Samba 4.14.4
>> Migrated a domain. with a  Rename.
>> The domain is up and resolving correctly and logs in etc. (seems to 
>> function totally correctly)
>>
>>
>>
>>
>> As stated in documents the GPO point to the old domain.
>>
>> Old: ns01.Jim.com
>> New: org.bob.com
>>
>>
>> However this hangs the windows 10  gpmc.msc tool.
>>
>> Forest: org.bob.com
>> Domains: org.bob.com
>> org.bob.com
>>
>> as soon as you select the “org.bob.com” to maintain the tree of 
>> users/gpo ,etc you get into an endless loop since  “ns01.jim.com” 
>> cannot be found (also you might not want it referencing the old domain)
>>
>> “Domain: ns01.Jim.com”
>> “The specified domain either does not exist or could not be contacted.”
>> This then puts the MS tools into a tight loop with no cancel options.
>>
>>
>> QUESTION:
>> Where is this reference to  “Domain: ns01.Jim.com”. kept in the LDAP.
>> Totally deleting the GPO from SYSVOL AND  going into 
>> CN=Policies.CN=System. To delete any used GPO links ,  and restarting 
>> the  samba does not remove the references.
> IIRC, these are kept in 'CN=Policies,CN=System' in ldap. I think the 
> objectClass is 'groupPolicyContainer'. I'm just skimming through code to 
> see these. You should be able to do a subtree search for 
> '(objectClass=groupPolicyContainer)' to find all your GPOs.
> 

The problem is, if I understand it correctly, Samba doesn't support 
renaming a domain in the long term.

The 'rename' tool was added at the 4.9.0 release and it states this in 
the release notes:

Note that the renamed tool is currently not intended to support a 
long-term rename of the production domain.

It also says this:

Currently renaming the GPOs is not supported and would need to be done 
manually.

I haven't seen anything that says differently (there might be something, 
but I haven't seen it if there is.)

It would be great if renaming a domain does work, but I wouldn't 
recommend trying it in production.

Has anyone renamed a Samba domain and if so, does it work long term ?

Rowland


