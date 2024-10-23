Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 138D19AD758
	for <lists+samba-technical@lfdr.de>; Thu, 24 Oct 2024 00:07:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=tFwnpmMVV2UbIieiPM71M5GV6WAIHWTkJxU0MG93jaM=; b=sp+41a/Dq9CUYj88xSr4BqlcbO
	pZHc5s4vz++PpVJ/YOLwYr84NvTdQFQ5JwNJk4GSkz37N5kWCYXDCiVztB0w5HL3IM79WF4ocyV7s
	lPVzB7LClthTpic4M+nSXjTFk9jWt9kZTSnm2eEeB8qG5NGf9Tl87a9n2s+NA7bQEmDZPtIrQe9mP
	2SpbDgRk2AYZqZYc8LFOAzUEF7Tputg65nL06DT/L2s95vMkpAvN2b5GBoO5DDrc3gOG6+voue4I1
	3b1R+YL3CMRnvoBaeF9CChgpa6wDcsSKfWOJqa7R57quxvwCzMFiwD+6AOgERlpAHg/dEbiw3Mu5L
	z8gxaIfQ==;
Received: from ip6-localhost ([::1]:50636 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t3jVY-004rOI-FD; Wed, 23 Oct 2024 22:07:12 +0000
Received: from cat-hlzsim-prod-mail21.catalyst.net.nz
 ([103.250.241.204]:54354) by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t3jVS-004rOB-Pe
 for samba-technical@lists.samba.org; Wed, 23 Oct 2024 22:07:10 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail21.catalyst.net.nz (Postfix) with ESMTPSA id C6E4C5D;
 Thu, 24 Oct 2024 11:06:56 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1729721216;
 bh=6Hb7DRFv4ZfKmXiSWIoISEdwTf1SjHqlLjwvmkdicFY=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=WDA4Vlqui5moTCIV/ubQiMqeNBnhR4SKSuBph7Y0V3iJ/ykLGoM1Md5d0xVEYhfri
 pDpUjULAi3eIeBaIK0Aj+vuiWCEkswkIOQXNU0gth03v5+i0ZWgKDfnTlWvrIQArnt
 xAzdgfYhFZbM8Rrd43IKtdWGmsCVNAzefYzcR7JKgZNEc9aZk2KGaC+BtWpzZjAAS7
 cvw90rUejohh5veXV3meAERMKuTY5P3zQXh8RTJY2w50blOM04h0Vxa8BKCbbBIKAs
 5RosZeZZAF1sUFDC46kyBkpBTTKg7ufMR8aFkAcYPYw0GHFRyfEFIK86UWlimsQl63
 BK5jj6WhE98vg==
Message-ID: <ab589c2f-f13b-4560-bd18-7a1e88634a0d@catalyst.net.nz>
Date: Thu, 24 Oct 2024 11:06:56 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
 <b5f3c39b-43c8-4b43-943d-cd851128173c@kania-online.de>
 <5d10619f-c4ed-4190-a4d1-1cec480ee108@catalyst.net.nz>
 <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
Content-Language: en-US
In-Reply-To: <c420e24b-562d-4592-a9df-d0dddd069e22@kania-online.de>
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

hi Stefan,

On 24/10/24 06:35, Stefan Kania wrote:
>> Another possible problem is you have a policy, but the policy is not 
>> associated to a object. If it was, it would affect that object.
> That's exactly what I think, that's what you have to do in a Microsoft- 
> domain.
>>
>> There should be something with the msDS-AssignedAuthNPolicy attribute 
>> pointing to this policy, and that thing will what members of the 
>> win11- silo can't log into. The samba-tool command to do that might be 
>> missing.
>>
> The attribute msDS-AssignedAuthNPolicy is not set at the users object:
> What I have is:
> msDS-AuthNPolicySiloMembersBL: CN=win11-silo,CN=AuthN Silos,CN=AuthN 
> Policy Co
>   nfiguration,CN=Services,CN=Configuration,DC=example,DC=net

I think the "msDS-AssignedAuthNPolicy" should to be on a computer 
object, not the user object. That computer is the thing that users are 
"-allowed-to-authenticate-to" or not.

>> In fact, the policy could just as easily use a real group, which would 
>> look something like
>>
>>    --user-allowed-to-authenticate-to \
>>      'O:SYG:SYD:(XA;OICI;CR;;;WD;(Not_Member_Of(SID(S-1-2-3-4))))'
>>
>> which could be useful in debugging.
> Ok, now I changed the setting to:
> samba-tool domain auth policy modify --name win11-policy --user-allowed- 
> to-authenticate-to="O:SYG:SYD:(XA;OICI;CR;;;WD; 
> (Not_member_of(SID(S-1-5-21-1359888689-2238436679-1068688124-512))))"

The logic here says

1. XA: this is an conditional *allow* ACE
2. Not_member_of: we're allowing anyone NOT in this group
3.  S-1-5-21-1359888689-2238436679-1068688124-512

which does not look like what you have here (it misses the NOT):

> So as I understand, only members of the group 'domain admins' are 
> allowed to log in. But I still can login with my "normal" user.

Instead did you mean
"(member_of(SID(S-1-5-21-1359888689-2238436679-1068688124-512)))" ?

> My conclusion: As long as it is not possible to (or maybe I can't figure 
> out who it works) assign the policy to a user by adding the attribute 
> msDS-AssignedAuthNPolicy the auth-polica / auth-silo stuff is not 
> working with samba.
> 
> I would like to test more to maybe help to get it working.

Thanks for persisting! I hope this leaves a trail others can follow (or 
avoid, as the case may be).

Douglas


