Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FDBD9B6FDB
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2024 23:30:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=lKmMZdwVtrH4V8OAmxPGhGkbz5X0bf/GtKjGOsDQ9S4=; b=ws7bDSTVJaNl2su3Hk+p3RDzFs
	05sQ7IDiXQv2Mhe8lgh91eaDLM6EyXkIfFyNSDHNdlfFEinJw/O4kqZCcZh2bfYV6WkCAvU3Haf8E
	F/Krdp4F5w1Y6j7FLVosxUlQXWwazCa3fO3cjNfXQmX3b8R6e0TKOY9ca0rNUK4NiV+DDSFXj3b5Z
	d9X7b7SdTS+8+p2wsg37mYvHCM4pNJSDr3rFPFJiE5ZUvX8YbV0u21btpTyG3bGRsSioT06V2Miz0
	L8zxFmFwZRSKvZkF0PtCrCbxgrgRQPN3BIn6SrmA/wtMCHFX0vG76iv3e4/Ist26OIYIuHRLgGxeg
	V22V5WqQ==;
Received: from ip6-localhost ([::1]:43218 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6HD2-005dQ6-7o; Wed, 30 Oct 2024 22:30:36 +0000
Received: from cat-porwal-prod-mail10.catalyst.net.nz ([202.49.242.1]:56558) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6HCv-005dPz-Ot
 for samba-technical@lists.samba.org; Wed, 30 Oct 2024 22:30:33 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail10.catalyst.net.nz (Postfix) with ESMTPSA id 54A916CC; 
 Thu, 31 Oct 2024 11:30:23 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1730327423;
 bh=pduW0jaQFGp+3QKHLPuMqpYemMHKvAk+RfSsciGIiag=;
 h=Date:From:Subject:To:References:In-Reply-To:From;
 b=QDHvW15kQHNmB2S7Q/DPVPqnFqSh6oN2BZTzUsDAu2/GgkF/zhD1zYB1a3Ju12Zcb
 CxvjgydyQcdKUcuefz0TUdiqLA7q2RUE2+dvyKwfjVUxUzm5wKxEqsf6zzIXjN1B3S
 hxQ4D6599KJ1r1odFR02eCzrlAnwaSepMY1LUQbx5K1dgUe80s0v5053EztIry+o/k
 eEJKDYqUUKSrvFODdBVNyAtg2YrnAQ6vx8lqeE8UTp6CI/CT++Y3vAnKH+WoXS0xeH
 B5Ab71FZXHj94rSPGddcweXI9T+Z90MBEPP67tZUCI6W0agKQ+H0kOyVZ2Y0KheP5F
 Gm9kJJVgVaIjw==
Message-ID: <9076ae93-ffed-4f04-89f4-f482c218f858@catalyst.net.nz>
Date: Thu, 31 Oct 2024 11:30:22 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: Stefan Kania <stefan@kania-online.de>,
 samba-technical <samba-technical@lists.samba.org>,
 Andrew Bartlett <abartlet@samba.org>
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
 <49b4b9af-033a-4534-90e3-ac633ff8bfd8@kania-online.de>
 <7bf96a40-7472-47ca-b81c-7e9121c598b4@samba.org>
 <68fe1182-281f-42ea-ac18-b0a2bf49961d@samba.org>
 <afa75a49-2ae4-4e14-9363-d5c31d7ef2a9@kania-online.de>
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
Content-Language: en-US, en-NZ
In-Reply-To: <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 31/10/24 05:57, Stefan Kania wrote:
> the assignment is different to the one we have in Samba

Just so this part doesn't get lost, these are the differences we're 
looking at.

policy, windows:

> msDS-UserAuthNPolicyBL: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Configura
>  tion,CN=Services,CN=Configuration,DC=winexample,DC=net
> msDS-ComputerAuthNPolicyBL: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Confi
>  guration,CN=Services,CN=Configuration,DC=winexample,DC=net
> msDS-ServiceAuthNPolicyBL: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Config
>  uration,CN=Services,CN=Configuration,DC=winexample,DC=net 

policy, samba:

>> msDS-AssignedAuthNPolicyBL: CN=stka,OU=firma,DC=example,DC=net
>> msDS-AssignedAuthNPolicyBL: CN=WINCLIENT11,OU=firma,DC=example,DC=net


silo, windows:

> msDS-AssignedAuthNPolicySiloBL: CN=WINCLIENT11,OU=firma,DC=winexample,DC=net> msDS-AssignedAuthNPolicySiloBL: CN=st ka,OU=firma,DC=winexample,DC=net
> msDS-AssignedAuthNPolicySiloBL: CN=WIN2022,OU=Domain Controllers,DC=winexample 
> msDS-UserAuthNPolicy: CN=win11-policy,CN=AuthN Policies,CN=AuthN Policy Config>  uration,CN=Services,CN=Configuration,DC=winexample,DC=net
> msDS-ComputerAuthNPolicy: CN=win11-policy,CN=AuthN Policies,CN=AuthN Policy Co
>  nfiguration,CN=Services,CN=Configuration,DC=winexample,DC=net
> msDS-ServiceAuthNPolicy: CN=win11-policy,CN=AuthN Policies,CN=AuthN Policy Con
>  figuration,CN=Services,CN=Configuration,DC=winexample,DC=net 

silo, samba:

>> msDS-AuthNPolicySiloMembers: CN=stka,OU=firma,DC=example,DC=net
>> msDS-AuthNPolicySiloMembers: CN=WINCLIENT11,OU=firma,DC=example,DC=net


user, windows:

> msDS-AssignedAuthNPolicySilo: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Con
>  figuration,CN=Services,CN=Configuration,DC=winexample,DC=net
> msDS-AuthNPolicySiloMembersBL: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Co
>  nfiguration,CN=Services,CN=Configuration,DC=winexample,DC=net 

user, samba:

>> msDS-AuthNPolicySiloMembersBL: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Co
>>  nfiguration,CN=Services,CN=Configuration,DC=example,DC=net
>> msDS-AssignedAuthNPolicy: CN=win11-policy,CN=AuthN Policies,CN=AuthN Policy Co
>>  nfiguration,CN=Services,CN=Configuration,DC=example,DC=net


computer, windows:

> msDS-AssignedAuthNPolicySilo: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Con
>  figuration,CN=Services,CN=Configuration,DC=winexample,DC=net
> msDS-AuthNPolicySiloMembersBL: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Co
>  nfiguration,CN=Services,CN=Configuration,DC=winexample,DC=net 

computer, samba:

>> msDS-AuthNPolicySiloMembersBL: CN=win11-silo,CN=AuthN Silos,CN=AuthN Policy Co
>>  nfiguration,CN=Services,CN=Configuration,DC=example,DC=net
>> msDS-AssignedAuthNPolicy: CN=win11-policy,CN=AuthN Policies,CN=AuthN Policy Co
>>  nfiguration,CN=Services,CN=Configuration,DC=example,DC=net 


Douglas

