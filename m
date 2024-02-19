Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE3085AFE7
	for <lists+samba-technical@lfdr.de>; Tue, 20 Feb 2024 00:54:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=GE4dXIWI6lPDgjZ/kvM38i+9RMWD2IdG6SgmZOu57Zc=; b=1dO1xqgWeRXuZJazjtcUtRtXEG
	8R8U0Z3Tt39bmO4EvOAWuLiQR+70f7TUu5WpvUG5B5jBnQ6YgbXoHlSsEZE5wxkeXwtBr9POEhUP5
	Wc04cKPPU8hB4hy4dKrbqaTKMYYKbdR/Y3XKwdAVqPRlVlQGrKXz1Fs1/A1POiQ2klesfoSzatTxK
	Lso3Y4uC1UVSx5jSNZLojcjtuSz2gSxu6LWes/SlwFZV2GNb2KjtdwdSkkMAgIMBTNHcykrLQA5Uc
	n0y7/ZPFsZjAcm5DCs9qwEEQC2Nu9cb5P6G6PeJ3f8l8vKtHCSIVDA14+sC+ZLUYMvs/kI0eL3bf2
	kOyHbsPg==;
Received: from ip6-localhost ([::1]:21862 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rcDS9-008x8O-Sy; Mon, 19 Feb 2024 23:53:41 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58250) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcDS5-008x8H-8P
 for samba-technical@lists.samba.org; Mon, 19 Feb 2024 23:53:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=GE4dXIWI6lPDgjZ/kvM38i+9RMWD2IdG6SgmZOu57Zc=; b=pxEFbs4LPnHRy7fxkRtofmniIL
 FH3KotsP/4N8SdcSx6I7a+7z551nzYoPem1HSdJ7w5RgBL8AeujQWj7iugaAXodSHYKqs8b+fKQUI
 XFU6rIsqbcJTlVE3bCn9c+SlcSAdNCxDpzCFZdNJhykUT7ZDogd/fBEljoIPk5gFcwcWTGi5eQ+9m
 /P2ECNrdeyW2NJ2b6jvg6XA4AJ+DnYCgZSpveS5RGLKZriJpDW+CBh5Nb6FECc3XTGe48a0LDuDOE
 Gs6Xn1y2pItzvf5ks3FFRBdTYSSUEsNNBnBaJITCJeDT2DpYP0uwBV/LQVEX9Mfsi29K8jgBcdE2k
 kT0L/42BlVjaQv2y0iBI9ju0VXzUMLWVN4HYqKMryynwU+dz5xRQ8lEy3hJwtCkwU5e07ocwM/5Pa
 OKt6pwEomzRKsPJVE6T1IjlbrJYJ2N4Tebsg/TA+GD1ZvzBOkwTD51dKk55rKqIuC8Rp7VwKr7em5
 J3Xz1Ilnx66jUs9KMMMlDtEK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rcDS4-00DrKK-1Y for samba-technical@lists.samba.org;
 Mon, 19 Feb 2024 23:53:36 +0000
Message-ID: <41970043-2f0a-44a5-b1eb-249f3ed7a219@samba.org>
Date: Tue, 20 Feb 2024 12:53:28 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: setting up authentication policies in 4.20rc2
To: samba-technical@lists.samba.org
References: <e8210ddc-4506-4255-bcbe-f24ff86b2f0a@kania-online.de>
 <d7e23578-1526-4835-9438-306da6a95ac1@samba.org>
 <f16c0d4d-0040-4179-ad24-e40a98d5f0ac@kania-online.de>
Content-Language: en-GB
In-Reply-To: <f16c0d4d-0040-4179-ad24-e40a98d5f0ac@kania-online.de>
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

On 20/02/24 5:28 am, Stefan Kania via samba-technical wrote:
> 
> 
> Am 19.02.24 um 02:48 schrieb Jo Sutton via samba-technical:
>> On 18/02/24 6:11 am, Stefan Kania via samba-technical wrote:
>>> Hi to all,
>>>
>>> I just tried to setup authentication policies and authentication 
>>> silos in 4.20rc2.
>>> Following these steps:
>>> 1. create a policy
>>> samba-tool domain auth policy create --enforce --name winclient-pol
>>>
>>> 2. create a silo
>>> samba-tool domain auth silo create --enforce --name=winclient-silo
>>>
>>> 3. adding a at least one user and one host to the silo
>>> samba-tool domain auth silo member grant --name=winclient-silo 
>>> --member=winclient\$
>>> samba-tool domain auth silo member grant --name=winclient-silo 
>>> --member=padmin
>>>
>>> BTW: In 4.19 it was "silo member add"
>>>
>>> 4. Set single policy for all principals in this silo. with 4.19 that 
>>> was possible and that's by the way also possible with a windows DC. 
>>> That's on a windows DC called "Use a single policy for all principals 
>>> that belog to this authentication silo"
>>>
>>> In 4.20 the option --policy is missing, you have only the option to add:
>>> --user-authentication-policy=
>>> --service-authentication-policy=
>>> --computer-authentication-policy=
>>> So it would be nice if the option --policy will be back
>>>
>>
>> We removed this option in commit 
>> c22400fd8ef961e472ce2803cf4a2ec58b778795. I don’t remember our exact 
>> reasoning, but we must have thought that it didn’t make much sense for 
>> a user and a computer to share the same authentication policy.
> 
> 
> In this picture us see the screenshot from (soory it's a german DC) that 
> you cann select either all policies or select one.
> 
> https://ibb.co/kGB3XhR
> 
> I think, with Samba we should have the same possibility.
> 
>>
>>> The next step after creating the silo and the policy and adding the 
>>> clients and users to the silo would be adding:
>>>   --service-allowed-to-authenticate-from=SDDL
>>> and/or
>>> -service-allowed-to-authenticate-to=SDDL
>>>
>>> But were can I get the SDDL for the user and the client?
>>>
>>
>> Can you explain what you’d like to accomplish in this scenario? If you 
>> want to make sure the user ‘padmin’ authenticates from the computer 
>> ‘winclient$’, you can use 
>> ‘--user-allowed-to-authenticate-from-device-silo=winclient-silo’, and 
>> make sure the user and the computer both belong to the silo. Or if you 
>> want to let only users in the silo authenticate to the computer 
>> ‘winclient$’, you can use 
>> ‘--computer-allowed-to-authenticate-to-by-silo=winclient-silo’.
>>
> 
> 
> 
> I wan't to disallow the user padmin to login at the computer with the 
> name winclient. So all users who are member of the silo winclient-silo 
> should not be able to login to the computer winclient.
> So for example I create a policy login-to-DCs, than add the group 
> "domain users" to the silo and the DCs. In a windows-Domain now I can 
> configure to allow all userers are equal to a list of users or not equal.
> As you can see in the next picture, I can choose either if the user is 
> equal to the list to allow the access, or the user is not equal to the 
> list to allowed to access.
> 
> https://ibb.co/SxgRzZW
> 
> I'm missing the part of selecting "member of the list" or "not member of 
> the list"
> 
> 
> 
> 
> 
> Stefan

First, I think you’ll want to do:

samba-tool user auth silo assign winclient\$ --silo=winclient-silo
samba-tool user auth silo assign padmin --silo=winclient-silo

to assign the silo to the user and the client.

I don’t think you want ‘--service-allowed-to…’. Those options apply to 
Managed Service Accounts, which you don’t appear to be dealing with.

I think this might be the command you want? —

samba-tool domain auth policy modify --name=winclient-pol 
--user-allowed-to-authenticate-from='O:SYG:SYD:(XA;OICI;CR;;;WD;(Not_Member_of 
SID(S-1-2-3)))'

where winclient’s SID is substituted for ‘S-1-2-3’.

That should prevent any users in the silo from authenticating, unless 
they use FAST from a computer other than ‘winclient’.

Is that what you’re looking for?

Cheers,
Jo (she/her)


