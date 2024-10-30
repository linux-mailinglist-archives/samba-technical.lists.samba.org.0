Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C039B6FB4
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2024 23:09:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=cZKroKwZ/t6Byyr0VaCxfdFE91Ns8imFelcBDlz9Q6A=; b=ejw+RlnJlDpbEYWrQByMQJc2EZ
	xc0jj6k2NrEizeR93ZpQhHD/jjCZURKeQVG1X7w10HxxuHDxqey+Qos8OnfZQalb/sxu2hRoNDCLX
	qkinVKSCdebxy1dTOcE86crMbsmSxUlv+uDKzt4NGKn7Jl/YBmsZnuN017tjPn4so1E9hdnVXjzVn
	rtuy3ZDUvZq6fz/mSMmODGr9uAqlBO9pob6PMaAcVE0UdzBBXBy74sFH3SR31SDBdn7eW1HqX+DiE
	oaGdvLOZhr0xKgyGvyLnGF+xz2m/0lw5sHhZWEcF9LeDa2fhjMo38hhGE1ZiIpPOAGT7gjKH0wl80
	UdbiTk2A==;
Received: from ip6-localhost ([::1]:63894 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t6GsP-005dHp-MQ; Wed, 30 Oct 2024 22:09:17 +0000
Received: from cat-porwal-prod-mail10.catalyst.net.nz ([202.49.242.1]:38480) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t6GsK-005dHi-JM
 for samba-technical@lists.samba.org; Wed, 30 Oct 2024 22:09:16 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail10.catalyst.net.nz (Postfix) with ESMTPSA id D9ADF6AD; 
 Thu, 31 Oct 2024 11:09:03 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1730326143;
 bh=J30v9NbT2eQEcfJci7TB2dydbW9j6YdqOBFg1y1qalI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=j3NBRqH612Ayxn23rRL29otxDqvLWv277DJ1Q5lBWqlZFdHSn1CtIeOSpJy2bk+IC
 11SehquHBQFHMHpIq1/tGawn7MdJe/nVCamKwvbAGB0vAkvgLsKWsZWbdKul2h4scy
 A/YigkepfDiRlEb04HpdjnYS0xlPltdVoMaqm7RgHfJLllIe7E+BX/AdVWKKZ/adjb
 2L1VSictSm2MwTGJHUTiJ8pSUl9d4l4QcvhpTNqUpoPxg683wD8eqh8+bH4KZHJmps
 HU0DI514ips+caIYW1QjzdeL9RxBTK/HEBxK7uNemFaEePa6kQd82+fCCasYTnRBIa
 NmY33IGsm970A==
Message-ID: <14ea2ff9-865a-4e85-8cc1-0477ab956a70@catalyst.net.nz>
Date: Thu, 31 Oct 2024 11:09:03 +1300
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
Content-Language: en-US
In-Reply-To: <cc717f18-2a82-4d46-959c-27da326a047f@kania-online.de>
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

On 31/10/24 05:57, Stefan Kania wrote:

> msDS-UserAllowedToAuthenticateTo:: 
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIAAAA
>   BAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkADoALwAv
>   AGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGkAbgAxA
>   DEALQBzAGkAbABvAIAAAAA=
> msDS-UserAllowedToAuthenticateFrom:: 
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIAA
>   AABAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkADoALw
>   AvAGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGkAbgA
>   xADEALQBzAGkAbABvAIAAAAA=
> msDS-UserTGTLifetime: 72000000000
> msDS-ComputerAllowedToAuthenticateTo:: 
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRI
>   AAAABAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkADoA
>   LwAvAGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGkAb
>   gAxADEALQBzAGkAbABvAIAAAAA=
> msDS-ServiceAllowedToAuthenticateTo:: 
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIA
>   AAABAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkADoAL
>   wAvAGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGkAbg
>   AxADEALQBzAGkAbABvAIAAAAA=
> msDS-ServiceAllowedToAuthenticateFrom:: 
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABR
>   IAAAABAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkADo
>   ALwAvAGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGkA
>   bgAxADEALQBzAGkAbABvAIEAAAA=

[...]

> ------------------------
> and this is working :-)
> As you can see, the policy is using UserAllowedToAuthenticateTo and the 
> assignment is different to the one we have in Samba

The policy is *also* using msDS-ComputerAllowedToAuthenticateTo, and 
that is what is active when the policy is applied to a computer.

The msDS-UserAllowedToAuthenticateTo and 
msDS-ServiceAllowedToAuthenticateTo will come into effect if the policy 
is applied to a user or service.

> Here the value from UserAllowedToAuthenticateTo:
> --------------
> root@debclient:~# ldbsearch -H ldap://win2022.winexample.net '(|(CN=st 
> ka)(CN=win11*)(cn=winclient11))' --cross-ncs msDS- 
> UserAllowedToAuthenticateTo  -U administrator
> Password for [WINEXAMPLE\administrator]:
> # record 1
> dn: CN=win11-policy,CN=AuthN Policies,CN=AuthN Policy 
> Configuration,CN=Services,CN=Configuration,DC=winexample,DC=net
> msDS-UserAllowedToAuthenticateTo:: 
> AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIAAAA 
> BAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkADoALwAv AGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGkAbgAxA
>   DEALQBzAGkAbABvAIAAAAA=
> --------------
> I don't know how to translate the Attribut so that it is readable. If 
> you could give me a hint, i translate it, so that you can read it. It 
> should a base64 string but I can't convert it.


What I do is:

$ python3
Python 3.12.3 (main, Sep 11 2024, 14:17:37) [GCC 13.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information
 >>> import base64
 >>> from samba.ndr import ndr_unpack
 >>> from samba.dcerpc import security
 >>> s = '''AQAEgBQAAAAgAAAAAAAAACwAAAABAQAAAAAABRIAAAA
... 
BAQAAAAAABRIAAAACAHgAAQAAAAkDcAAAAQAAAQEAAAAAAAEAAAAAYXJ0ePk2AAAAYQBkADoALwAv
... 
AGUAeAB0AC8AQQB1AHQAaABlAG4AdABpAGMAYQB0AGkAbwBuAFMAaQBsAG8AEBQAAAB3AGkAbgAxA
...  DEALQBzAGkAbABvAIAAAAA= '''
 >>> b = base64.b64decode(s)
 >>> sd = ndr_unpack(security.descriptor, b)
 >>> sd.as_sddl()
'O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.ad://ext/AuthenticationSilo == 
"win11-silo"))'

Though often I just print the result of b64decode() because 
unfortunately I know enough to recognise a security descriptor with a 
conditional ACE in the binary form.

The string is copy-pasted from after 
'msDS-ComputerAllowedToAuthenticateTo:: ' -- you don't need to clean up 
whitespace if you use triple quotes.

Douglas


