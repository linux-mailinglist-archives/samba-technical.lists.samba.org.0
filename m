Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F6785CE56
	for <lists+samba-technical@lfdr.de>; Wed, 21 Feb 2024 03:51:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=5rAR7O/w22UsxIAIuLDWI1ooEkDlFIyQQ8+OCHmjNKI=; b=KzmM/9gX/C68Xhb0JIVUbcOo8+
	LrK+jgt9tOy7RpVIaYuxctYbZMr7rJrmLpH4gz/iLfp7UOlzIqer8xodRiExH6us+o0oPbNm4MdWo
	oFNrKzsIAMp6LRXKdY/SVWChQyEae+oM+wE1VExSWXtrz/yrAyb9nBiiWGaAMm6szS8drUzJtMhen
	zlNhllVYBHOYq0GWREQh5qs2WjJ6vDt0eWt9JFMeSJiDfadnNl4aeJ/a2kAwc0f5QSq8EeUPv2pdf
	FfiA+WrEKjfn7o+LRSkTYoUTLINomMYyWf6gM/IPjPQ2D6dX2vOyIk1LIKa+ReOhMSNRBYbDP3CQc
	DcbTTjRg==;
Received: from ip6-localhost ([::1]:44008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcch7-0091C2-KV; Wed, 21 Feb 2024 02:50:49 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:30536) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcch2-0091Bu-Fc
 for samba-technical@lists.samba.org; Wed, 21 Feb 2024 02:50:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=5rAR7O/w22UsxIAIuLDWI1ooEkDlFIyQQ8+OCHmjNKI=; b=Fe6xK2hYdHnVB0fTU9i6tZ3iGU
 9arjvFLLx0JrzsPAMxCJWbT79pZ+BBoWkdpzvjmKJKfEC6gDgaQPoBqaSk6OP8cwjF1GnQMwcnK74
 hIVaZVFtBbAhrWefU1ymqllsl5btnhiy1+bQAnLfEDNhh5+g+mMAyiLhrbmRrwqoBYQYIanFFXXDI
 1QYgdbTjlFpyvVNcVBBNEwwn+wwCXFChXH49wXaKhEnlvo2O0WKFnMg0dFmj1a9b0lv0J5N/U3qDX
 yfKtMy2hT99YiMCxGBcORJjZTypj/+mKtkZb2SOWU9NDOyS5jyVBVPivnGnRSMka+dCLZYe0iTCOJ
 r4EEV7OVtwlYioIfqxEpghr9Oz3ESdnLsyIiy12Ejcy1oN16hUwkXynu8RHLxsyU7zilMhb35DTlT
 xy7T8JwvQrVsdLnrL8Gu3Hy3zh+T7ysR+iYVThtJLyIlw9e1KozF/NuiEB68HfaeasZMTlNMQEkzj
 Xmn75b8RswbW0oRFJ1Eu5c8P;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcch1-00E32A-1I for samba-technical@lists.samba.org;
 Wed, 21 Feb 2024 02:50:43 +0000
Message-ID: <49439c3b-6562-486a-acfa-26ed990e8082@samba.org>
Date: Wed, 21 Feb 2024 15:50:36 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: setting up authentication policies in 4.20rc2
Content-Language: en-GB
To: samba-technical@lists.samba.org
References: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
 <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
 <f16c0d4d-0040-4179-ad24-e40a98d5f0ac@kania-online.de>
 <41970043-2f0a-44a5-b1eb-249f3ed7a219@samba.org>
 <dd0574da-8fd6-4218-9876-b07be2f97fd4@kania-online.de>
In-Reply-To: <dd0574da-8fd6-4218-9876-b07be2f97fd4@kania-online.de>
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
From: Jo Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jo Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 21/02/24 4:57 am, Stefan Kania via samba-technical wrote:
> 
> 
> Am 20.02.24 um 00:53 schrieb Jo Sutton via samba-technical:
>> On 20/02/24 5:28 am, Stefan Kania via samba-technical wrote:
>>>
>>>
>>> Am 19.02.24 um 02:48 schrieb Jo Sutton via samba-technical:
>>>> On 18/02/24 6:11 am, Stefan Kania via samba-technical wrote:
>>>>> Hi to all,
>>>>>
>>>>> I just tried to setup authentication policies and authentication 
>>>>> silos in 4.20rc2.
>>>>> Following these steps:
>>>>> 1. create a policy
>>>>> samba-tool domain auth policy create --enforce --name winclient-pol
>>>>>
>>>>> 2. create a silo
>>>>> samba-tool domain auth silo create --enforce --name=winclient-silo
>>>>>
>>>>> 3. adding a at least one user and one host to the silo
>>>>> samba-tool domain auth silo member grant --name=winclient-silo 
>>>>> --member=winclient\$
>>>>> samba-tool domain auth silo member grant --name=winclient-silo 
>>>>> --member=padmin
>>>>>
>>>>> BTW: In 4.19 it was "silo member add"
>>>>>
>>>>> 4. Set single policy for all principals in this silo. with 4.19 
>>>>> that was possible and that's by the way also possible with a 
>>>>> windows DC. That's on a windows DC called "Use a single policy for 
>>>>> all principals that belog to this authentication silo"
>>>>>
>>>>> In 4.20 the option --policy is missing, you have only the option to 
>>>>> add:
>>>>> --user-authentication-policy=
>>>>> --service-authentication-policy=
>>>>> --computer-authentication-policy=
>>>>> So it would be nice if the option --policy will be back
>>>>>
>>>>
>>>> We removed this option in commit 
>>>> c22400fd8ef961e472ce2803cf4a2ec58b778795. I don’t remember our exact 
>>>> reasoning, but we must have thought that it didn’t make much sense 
>>>> for a user and a computer to share the same authentication policy.
>>>
>>>
>>> In this picture us see the screenshot from (soory it's a german DC) 
>>> that you cann select either all policies or select one.
>>>
>>> https://ibb.co/kGB3XhR
>>>
>>> I think, with Samba we should have the same possibility.
>>>
>>>>
>>>>> The next step after creating the silo and the policy and adding the 
>>>>> clients and users to the silo would be adding:
>>>>>   --service-allowed-to-authenticate-from=SDDL
>>>>> and/or
>>>>> -service-allowed-to-authenticate-to=SDDL
>>>>>
>>>>> But were can I get the SDDL for the user and the client?
>>>>>
>>>>
>>>> Can you explain what you’d like to accomplish in this scenario? If 
>>>> you want to make sure the user ‘padmin’ authenticates from the 
>>>> computer ‘winclient$’, you can use 
>>>> ‘--user-allowed-to-authenticate-from-device-silo=winclient-silo’, 
>>>> and make sure the user and the computer both belong to the silo. Or 
>>>> if you want to let only users in the silo authenticate to the 
>>>> computer ‘winclient$’, you can use 
>>>> ‘--computer-allowed-to-authenticate-to-by-silo=winclient-silo’.
>>>>
>>>
>>>
>>>
>>> I wan't to disallow the user padmin to login at the computer with the 
>>> name winclient. So all users who are member of the silo 
>>> winclient-silo should not be able to login to the computer winclient.
>>> So for example I create a policy login-to-DCs, than add the group 
>>> "domain users" to the silo and the DCs. In a windows-Domain now I can 
>>> configure to allow all userers are equal to a list of users or not 
>>> equal.
>>> As you can see in the next picture, I can choose either if the user 
>>> is equal to the list to allow the access, or the user is not equal to 
>>> the list to allowed to access.
>>>
>>> https://ibb.co/SxgRzZW
>>>
>>> I'm missing the part of selecting "member of the list" or "not member 
>>> of the list"
>>>
>>>
>>>
>>>
>>>
>>> Stefan
>>
>> First, I think you’ll want to do:
>>
>> samba-tool user auth silo assign winclient\$ --silo=winclient-silo
>> samba-tool user auth silo assign padmin --silo=winclient-silo
>>
>> to assign the silo to the user and the client.
>>
>> I don’t think you want ‘--service-allowed-to…’. Those options apply to 
>> Managed Service Accounts, which you don’t appear to be dealing with.
>>
>> I think this might be the command you want? —
>>
>> samba-tool domain auth policy modify --name=winclient-pol 
>> --user-allowed-to-authenticate-from='O:SYG:SYD:(XA;OICI;CR;;;WD;(Not_Member_of SID(S-1-2-3)))'
>>
>> where winclient’s SID is substituted for ‘S-1-2-3’.
>>
>> That should prevent any users in the silo from authenticating, unless 
>> they use FAST from a computer other than ‘winclient’.
>>
>> Is that what you’re looking for?
>>
>> Cheers,
>> Jo (she/her)
>>
>>
> looks good on the first view but:
> 
> I started from the beginning:
> samba-tool domain auth policy create --enforce --name winclient-pol
> samba-tool domain auth silo create --enforce --name=winclient-silo
> samba-tool user auth silo assign winclient\$ --silo=winclient-silo
> samba-tool user auth silo assign winclient11\$ --silo=winclient-silo

I guess you actually ran:

samba-tool user auth silo assign padmin --silo=winclient-silo

right?

> samba-tool domain auth silo member grant --name=winclient-silo 
> --member=winclient\$
> samba-tool domain auth silo member grant --name=winclient-silo 
> --member=padmin
> samba-tool domain auth policy modify --name=winclient-pol 
> --user-allowed-to-authenticate-from='O:SYG:SYD:(XA;OICI;CR;;;WD;(Not_Member_of SID(S-1-5-21-2545884418-1286714830-2149023192-512)))'
> 
> But still the same, it dosn't matter if the user is member of the group 
> 'domain admins' or not, he can login.
> listing the policy is showing:
> --------------
> root@addc420:~# samba-tool domain auth policy view --name winclient-pol
> {
>    "cn": "winclient-pol",
>    "distinguishedName": "CN=winclient-pol,CN=AuthN Policies,CN=AuthN 
> Policy Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
>    "dn": "CN=winclient-pol,CN=AuthN Policies,CN=AuthN Policy 
> Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
>    "instanceType": 4,
>    "msDS-AuthNPolicyEnforced": true,
>    "msDS-StrongNTLMPolicy": 0,
>    "msDS-UserAllowedToAuthenticateFrom": 
> "O:SYG:SYD:(XA;OICI;CR;;;WD;(Not_Member_of 
> SID(S-1-5-21-2545884418-1286714830-2149023192-512)))",
>    "name": "winclient-pol",
>    "objectCategory": 
> "CN=ms-DS-AuthN-Policy,CN=Schema,CN=Configuration,DC=example,DC=net",
>    "objectClass": [
>      "top",
>      "msDS-AuthNPolicy"
>    ],
>    "objectGUID": "fab89c1a-fa93-4014-ba0e-172e26f08d80"
> --------------
> And the silo:
> 
> --------------
> root@addc420:~# samba-tool domain auth silo view --name winclient-silo
> {
>    "cn": "winclient-silo",
>    "distinguishedName": "CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
> Policy Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
>    "dn": "CN=winclient-silo,CN=AuthN Silos,CN=AuthN Policy 
> Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
>    "instanceType": 4,
>    "msDS-AuthNPolicySiloEnforced": true,
>    "msDS-AuthNPolicySiloMembers": [
>      "CN=WINCLIENT,OU=stka,DC=example,DC=net",
>      "CN=p admin,OU=stka,DC=example,DC=net"
>    ],
>    "msDS-ComputerAuthNPolicy": "CN=winclient-pol,CN=AuthN 
> Policies,CN=AuthN Policy 
> Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
>    "msDS-UserAuthNPolicy": "CN=winclient-pol,CN=AuthN Policies,CN=AuthN 
> Policy Configuration,CN=Services,CN=Configuration,DC=example,DC=net",
>    "name": "winclient-silo",
>    "objectCategory": 
> "CN=ms-DS-AuthN-Policy-Silo,CN=Schema,CN=Configuration,DC=example,DC=net",
>    "objectClass": [
>      "top",
>      "msDS-AuthNPolicySilo"
>    ],
>    "objectGUID": "8e272b33-fa8a-4e76-8972-990a16624d87"
> 
> --------------
> 
> Looking with ldbsearch at the two objects "winclient and "padmin" is 
> showing:
> ----------------
> ldbsearch --url=/var/lib/samba/private/sam.ldb "cn=p admin"
> ...
> msDS-AssignedAuthNPolicySilo: CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
> Policy
>    Configuration,CN=Services,CN=Configuration,DC=example,DC=net
> whenChanged: 20240220152158.0Z
> uSNChanged: 4406
> msDS-AuthNPolicySiloMembersBL: CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
> Polic
>   y Configuration,CN=Services,CN=Configuration,DC=example,DC=net
> ...
> 
> 
> ----------------
> ldbsearch --url=/var/lib/samba/private/sam.ldb "cn=winclient"
> ...
> msDS-AssignedAuthNPolicySilo: CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
> Policy
>    Configuration,CN=Services,CN=Configuration,DC=example,DC=net
> whenChanged: 20240220152138.0Z
> uSNChanged: 4405
> msDS-AuthNPolicySiloMembersBL: CN=winclient-silo,CN=AuthN Silos,CN=AuthN 
> Polic
>   y Configuration,CN=Services,CN=Configuration,DC=example,DC=net
> distinguishedName: CN=WINCLIENT,OU=stka,DC=example,DC=net
> ...
> 
> So no change :-(
> 
> I again tried to set up the same with Windows and it works. The only 
> diffrence (using the same names) is that the condition is different to 
> the one samba is showing
> condition in Windows
> ------------
> msDS-UserAllowedToAuthenticateFrom: 
> O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.example://ext/AuthenticationSilo != 
> "winclient-silo"))
> ------------
> 
> 
> Stefan

I think the problem is the SID in the authentication policy’s SDDL. 
S-1-5-21-2545884418-1286714830-2149023192-512 is the SID of the Domain 
Administrators group. Thus, what the SDDL means is “users with this 
authentication policy applied may authenticate from devices that don’t 
belong to the Domain Administrators group”. Note that it’s the *device* 
that the condition applies to, not the user. So it won’t make a 
difference if the user is in the Domain Administrators group or not.

If you want the policy to prevent users from logging into the computer 
‘winclient’, try using that computer’s SID instead of the Domain 
Administrators SID.

Cheers,
Jo (she/her)

