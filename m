Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8171B9BD86A
	for <lists+samba-technical@lfdr.de>; Tue,  5 Nov 2024 23:23:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=FRsI5kR4xDURGUljXkSa7dVKeiImah21XQz5ncNiyQk=; b=oToX2u4mE5R7jtuCOyLgNo+g5h
	mcIc0DY0MbFsbWIAOh4yujs/kuuFWuzHI3q2G/vdFzo2Ndjdtbz/KIcKNkLl1UWdSZxwSPmcToDca
	B1hjlnxr/wTjrrcJ5/7hRksEljOoTmmIjgjuMB1Ct2LXnKzcunVUHH1JAJ2wKNmR6Fmz+YJCj09Fx
	rAtTmJ0PUxFSWSI98lOo5i2XurT0gxrBAh7nRnW1KnXuYIjcCYiGeNLaJ2t0XBa+PyGqb2DyXdBjD
	P+M10R2QicYKOHbQJBD2CBT6h04gP86c89L/rXi/IIz6nZiyif6qdGEvgIAudnm0xfZemgsaSWRfv
	ukCeQppQ==;
Received: from ip6-localhost ([::1]:28780 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t8RwT-007sM4-7y; Tue, 05 Nov 2024 22:22:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39346) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t8RwP-007sLx-9O
 for samba-technical@lists.samba.org; Tue, 05 Nov 2024 22:22:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=FRsI5kR4xDURGUljXkSa7dVKeiImah21XQz5ncNiyQk=; b=YlNpQmh+e5TSmEBf7MXW1con/8
 QcYDPXwbu3P7EI0I+FBYkCNLDqjFsybA+/OqVmN/8Nx0xf4h+5Z0reciTdLajUCUUAJjp6boxxPK0
 WyKrz/lnqHXv2I6f9+uakkeIWQZ+elJZ4oqgxttEKYlOk1y/zDnd1IXHhzRLEsGJ4pBHGotH3yTxK
 hDvXQf1k0NGqb/dJx+dvfI5dpftxZBnBeVV9FaWgRkay1BfWQLh8kMMRGo4Rt3IfFIehkHxaFNNAD
 eCaTOjyJig6HEBCQtli3Jr4EsaX2Qy6nASO36Ir5Y++jFtvjKu1VX2OMnC9EqiwfAvJP85gjIPJ3G
 5T2ZfQS1M0sZLtkuifMtGXtedjxWQ/9olbMlhm2+aqZgwFoJ4vzLQk3oMIATlMukyhIW4QShICuQ+
 U3WExAvp7ZwfdXCvLMViEgzsiO/YJsA0H7ew0QM5i0ynJwH10QKbJSjIqxeBuGodn9bsYC+P/sR00
 lNWNcasj1EYmW2xIQjaDHXe0;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t8RwO-009F6r-0v for samba-technical@lists.samba.org;
 Tue, 05 Nov 2024 22:22:24 +0000
Message-ID: <5784a449-b6e9-4aa4-9198-5f176b7dd3ca@samba.org>
Date: Wed, 6 Nov 2024 11:22:14 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
 <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
 <1a14a7d4-3d56-4212-9420-0affed9ffd18@kania-online.de>
 <0f4e2d3b-12b2-4dfc-88ef-0b52c12bf6db@catalyst.net.nz>
 <70db5ba2-8cfc-42f4-a493-0228954debdb@kania-online.de>
 <84bb05ba-823e-40a7-ba6b-d3c7ec6f2af1@catalyst.net.nz>
 <664df4a2-5133-4094-a233-5c6838413072@kania-online.de>
 <898167c5-b7d7-4bb2-9f3e-979f41608bb4@kania-online.de>
 <489883dd-1318-4172-b0b0-0f379714f927@catalyst.net.nz>
 <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
 <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>
 <eb80a2b2-2ab5-4ce3-8734-7c4d41fccb43@kania-online.de>
 <4e9d2eec-6d2a-492f-8c4c-bab7d66ae90b@samba.org>
 <d442b972-9bd6-400a-ba81-9aee20fe1ef8@kania-online.de>
 <32bc3d0e-212f-4c73-a758-014e913abaf6@kania-online.de>
Content-Language: en-GB
In-Reply-To: <32bc3d0e-212f-4c73-a758-014e913abaf6@kania-online.de>
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
From: Jennifer Sutton via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jennifer Sutton <jsutton@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/11/24 5:43 am, Stefan Kania via samba-technical wrote:
> 
> 
> Am 05.11.24 um 11:13 schrieb Stefan Kania via samba-technical:
>> Hi Jennifer
>>
>> Am 04.11.24 um 21:22 schrieb Jennifer Sutton via samba-technical:
>>> On 5/11/24 7:27 am, Stefan Kania via samba-technical wrote:
>>>> Inside the policy (comparing to a Windows AD) I still missing:
>>>> msDS-UserAllowedToAuthenticateFrom
>>>> msDS-ServiceAllowedToAuthenticateFrom
>>>> It's not possible to set this values with samba-tool
>>>
>>> Have you tried --user-allowed-to-authenticate-from=SDDL and 
>>> --service- allowed-to-authenticate-from=SDDL?
>>>
>> No, not up to now. But now I changed the settings. On both, the 
>> windows AD and the Samba AD all the settings are the same, but still 
>> not working with Samba AD.
>> The user who is a member of the silo can't login on the computer who 
>> is member of the silo BUT he also can't login to any other computer in 
>> the domain. He is getting the same message, that he is not allowed to 
>> login on this computer (what is right for the computer who is member 
>> of the silo). BTW now it's the first time I'm getting the correct 
>> message.
>>
>> All other users can't also not login to the computer from the silo, 
>> but on any other computer. Getting a message "This computer is 
>> protected with a authenticainfirewall".
>>

Can you post the SDDL you’ve set on the authentication policy?

>>
>>>>
>>>> I'm missing:
>>>> msDS-AssignedAuthNPolicySiloBL for all members
>>>
>>> You don’t set this on the silo. You assign the members to the silo 
>>> with ‘samba-tool user auth silo assign <username> [options]’.
>> I know, but this is still the only attribute that is set in the 
>> windows AD but not in the Samba AD.
> 
> Found something more: if you take a look at the silo from my 
> Microsoft-AD you see:
> msDS-AssignedAuthNPolicySiloBL: 
> CN=WINCLIENT11,OU=firma,DC=winexample,DC=net
> 
> msDS-AssignedAuthNPolicySiloBL:
> CN=stka,OU=firma,DC=winexample,DC=net
> 
> msDS-AssignedAuthNPolicySiloBL:
> CN=WIN2022,OU=Domain Controllers,DC=winexample ,DC=net
> 
> ------------
> 
> msDS-AuthNPolicySiloMembers:
> CN=WINCLIENT11,OU=firma,DC=winexample,DC=net
> 
> msDS-AuthNPolicySiloMembers:
> CN=st ka,OU=firma,DC=winexample,DC=net
> 
> 
> The Domaincontroller (WIN2022) is listed with the attribute 
> msDS-AssignedAuthNPolicySiloBL, but the DC is NOT a member of the silo. 
> Only the user and the computer.
> 
> I tried to assign the DC to the policy and make it a member of the silo, 
> no changes.
> So still the only difference between windows and samba is the missing 
> attribute  msDS-AssignedAuthNPolicySiloBL for all members and the DC.

You can disregard the msDS-AssignedAuthNPolicySiloBL attribute; it’s not 
used for anything. The important one is msDS-AssignedAuthNPolicySilo, 
which should be set on the members of the silo.

Cheers,
Jennifer (she/her)


