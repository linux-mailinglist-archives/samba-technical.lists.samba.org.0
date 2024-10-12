Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D0E99AFCA
	for <lists+samba-technical@lfdr.de>; Sat, 12 Oct 2024 02:56:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=syPasUAywPGgOCjNmmPrhlA+75Zh4A63U2Wm9GKPpqY=; b=EcA7J6t6TC0N0nLknzEdRBViu2
	WLs6kQE6oCeaaPmzSFR3Bqa5GRRamI8a1O51uuajIANI+IE+mHBQytzYrM4IIPJfuExU95FZTawvw
	7WA/ikLaCa8wGJWtimogFCs/omvCvjWIzPvi+0vM+nyhup5soOUfD+vEjN7dMFnEdyEgL9VFWT1T7
	MDErNlz3DrqsMeKgbQCEIep5TBrff9dBPUSZ7WnIO8ssmjaUSneIzQLgluTfod9p/+UCrMFdH8W+a
	CjBZ1uOY/5fpujtDufpGdhubt36EcwNY8sx1jHYSR+IVbZLirikJjMn2WTmisNje06mTa6CLoJGvt
	Rtfyu6Qg==;
Received: from ip6-localhost ([::1]:23108 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1szQPj-003gAH-DH; Sat, 12 Oct 2024 00:55:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43788) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1szQPf-003gAA-KI
 for samba-technical@lists.samba.org; Sat, 12 Oct 2024 00:55:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=syPasUAywPGgOCjNmmPrhlA+75Zh4A63U2Wm9GKPpqY=; b=KMhKQcmEwv3ZUXQq7mJh2K1TKT
 Ops84XfV1aRDyNR9qWrbc0koDxejrth/zWx3qq3xKcF39M+fKioi6IRxQTBniYppTImp3ZloTldAM
 oUnuERKm8tWJUDvXlD6dLgfUgT1PuOqReBCGOFvIM10b7c8uP3Wo/FIfa6UdEQPVi4a55tJU4eR34
 hegjESTdnCz4vNcUB39So0qSOglP/yU9miwLo/xJ/GPT8pSmdR54N4zjhinGXDmL5FwDQseBzL2U+
 Gsif4laONfr7rSPToBFjzoDvgPU6KWsWXxgLoDA0QiB1wAInUCh9/+3irVAlol8usZQuUECzVdrY1
 zbFq/F1VJmvM03WgjaC13EIBb7W0NvszKhLx0FUY3Do7hRTIY9mpMCbFQa6U/TAhf2JJPpK0BapHJ
 of7mGrtwuuNB6isnIAm+yfnlLR9TIAWCPneo4RIcQ5/z8sxx6IQfa8amP6z61PCJ1HbjBwQ4l1g6t
 1rFAosyFWtqyKWh7wLCodGAF;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1szQPe-004QDM-10 for samba-technical@lists.samba.org;
 Sat, 12 Oct 2024 00:55:18 +0000
Message-ID: <1eb80efc-4bb2-4b7c-b339-5b92277e782e@samba.org>
Date: Sat, 12 Oct 2024 13:53:06 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: authentication policies in Samba 4.21
To: samba-technical@lists.samba.org
References: <df1213a5-5153-463b-bacd-5d93ff8d2f6b@kania-online.de>
 <297faa9c-6788-436b-bfb3-8d2107b8596d@catalyst.net.nz>
 <48c2847c-7d05-4e1a-9e85-52b1ba5d0b30@catalyst.net.nz>
 <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
Content-Language: en-GB
In-Reply-To: <ef60d0ef-25df-4081-9764-5dbc05bfc655@kania-online.de>
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

On 12/10/24 6:49 am, Stefan Kania via samba-technical wrote:
> Hi Douglas,
> 
> Am 11.10.24 um 03:36 schrieb Douglas Bagnall:
>> On 11/10/24 10:21, Douglas Bagnall via samba-technical wrote:
>>> hi Stefan,
>>>
>>> On 11/10/24 05:11, Stefan Kania via samba-technical wrote:
>>>> I'm just testing how it's going on with the auth-policies in 4.21 
>>>> and I see now it's possible to set conditions with:
>>>> user-allowed-to-authenticate-to
>>>> ...
>>>>
>>>> When I set a condition I see:
>>>> "msDS-ComputerAllowedToAuthenticateTo": "O:SYG:SYD:(XA;OICI;CR;;;WD; 
>>>> (@USER.ad://ext/AuthenticationSilo == \"win11-computer\"))",
>>>> I can allow the users from the silo to authenticate
>>>> But in the Windows-world it's possible to disallow the 
>>>> authentication, then it looks like this:
>>>> "msDS-ComputerAllowedToAuthenticateTo": "O:SYG:SYD:(XA;OICI;CR;;;WD; 
>>>> (@USER.ad://ext/AuthenticationSilo != \"win11-computer\"))",
>>>>
>>>>
>>>> Am I missing something or is it not yet possible?
>>
>> OK, now I see that maybe we are talking about different things.
>>
>> When you say "possible", you mean "possible using samba-tool or 
>> something".
>>
> Yes, exactly :-)
>> I was thinking more along the lines of "will it work if it gets in 
>> this state?".
>>
>> In that case, I think you are looking for something like this:
>>
>>      samba-tool domain auth policy modify  \
>>              --name foo  \
>>             --user-allowed-to-authenticate-to="O:SYG:SYD:..."
>>
>> The other way is a shortcut to allow the most common thing.
>>
> That's what is missing. What is needed is another option to:
> 
> samba-tool domain  auth policy computer-allowed-to-authenticate-to set 
> --by-silo=win11-computer --name=win11
> 
> Something like --deny and --allow. That's by the way how it is done on a 
> Windows-System.
> 
> Take a look at this howto:
> https://thesleepyadmins.com/2024/07/16/active-directory-authentication-policies-and-authentication-policy-silos/
> 
> You will find a picture (nearly at the end) named "Create control 
> conditions" This picture is showing that you can choose between allow or 
> deny.
> 
> I try to set the XD or != via a ldif-file:
> ----------------
> dn: CN=win11,CN=AuthN Policies,CN=AuthN Policy 
> Configuration,CN=Services,CN=Configuration,DC=example,DC=net
> changetype: modify
> replace: msDS-ComputerAllowedToAuthenticateTo
> msDS-ComputerAllowedToAuthenticateTo: 
> "O:SYG:SYD:(XD;OICI;CR;;;WD;(@USER.ad://ext/AuthenticationSilo == 
> \"win11-computer\"))",
> ----------------
> 
> But when I try to view the policy I get:
> ----------------
> root@dc01:~# samba-tool domain  auth policy view --name win11
> ERROR(runtime): uncaught exception - (11, 'Buffer Size Error')
>    File 
> "/usr/lib/python3/dist-packages/sernet/samba/netcmd/__init__.py", line 
> 353, in _run
>      return self.run(*args, **kwargs)
>             ^^^^^^^^^^^^^^^^^^^^^^^^^
>    File 
> "/usr/lib/python3/dist-packages/sernet/samba/netcmd/domain/auth/policy/policy.py", line 163, in run
>      policy = AuthenticationPolicy.get(ldb, cn=name)
>               ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File 
> "/usr/lib/python3/dist-packages/sernet/samba/domain/models/model.py", 
> line 286, in get
>      return cls.query(samdb, **kwargs).get()
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File 
> "/usr/lib/python3/dist-packages/sernet/samba/domain/models/query.py", 
> line 87, in get
>      return self._from_message(self.result[0])
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File 
> "/usr/lib/python3/dist-packages/sernet/samba/domain/models/query.py", 
> line 65, in _from_message
>      return model._from_message(self.samdb, message)
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File 
> "/usr/lib/python3/dist-packages/sernet/samba/domain/models/model.py", 
> line 148, in _from_message
>      obj._apply(samdb, message)
>    File 
> "/usr/lib/python3/dist-packages/sernet/samba/domain/models/model.py", 
> line 162, in _apply
>      setattr(self, attr, field.from_db_value(samdb, message[field.name]))
>                          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File 
> "/usr/lib/python3/dist-packages/sernet/samba/domain/models/fields.py", 
> line 402, in from_db_value
>      return ndr_unpack(security.descriptor, value[0])
>             ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>    File "/usr/lib/python3/dist-packages/sernet/samba/ndr.py", line 48, 
> in ndr_unpack
>      ndr_unpack(data, allow_remaining=allow_remaining)
> ----------------
> And here again it the working condition from a Windows-domain
> -----------
> msDS-UserAllowedToAuthenticateFrom: 
> O:SYG:SYD:(XA;OICI;CR;;;WD;(@USER.example://ext/AuthenticationSilo != 
> "winclient-silo"))
> -----------
> As you can see, it stays "XA" only it changes from "==" to !=" and this 
> is handled by the option "deny" or "allow" in the condition.
> 
> Stefan
> 
>> Douglas
>>
> 
> 
> 
> 

The problem is that SDDL has two separate representations: the encoded 
binary representation, and the SDDL string representation (like 
“O:SYG:SYD:…”. msDS-ComputerAllowedToAuthenticateTo uses the binary 
representation, and if you set it to an SDDL string instead, 
ndr_unpack() will be unable to decode it, as you see here.

The recommended way to set the SDDL is like so:

samba-tool domain auth policy modify --name win11 
--computer-allowed-to-authenticate-to=SDDL

Does Windows cope with an SDDL string in the 
msDS-ComputerAllowedToAuthenticateTo attribute?

Cheers,
Jennifer (she/her)

