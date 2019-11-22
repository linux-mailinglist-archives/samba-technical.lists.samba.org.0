Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 157F8105E98
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 03:23:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=STitR2O0kio6P7RXEgF+gG2cYXJE5pDW4oP+Utz1V9U=; b=CctUdrXfOxVnUgVT+5X4Y1pBqW
	4mq+yJhZD0cTXcLxTXHHiU4EukWhwyjG9Co13tyjSAaiQS5O/CFrQkaEOIyE4udn7jw4mUWkWeer5
	o+1NvVw3jPqj025+Wo8Biaj+NiXc4ME3FRdcsV7b6eXwTlSmRp9jZlDsHU4vgr50XEyKc+npJAuzL
	06Omvu9RWqUirQY1T1gbqCCSKMq9g8JF6729BMjZ/GqSLzuLtg7OCrW2XhZrG8t4YUq+fFSeE79TO
	VFdnxIqaNHhkGXYOzgIMr6oqzw0Um4BxA3UWBPcyzSro2wLKzyNRS6K7D8yxKyM+hen9L6k6EUCtD
	cnEIQ2kw==;
Received: from localhost ([::1]:47562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iXyal-001zc2-Qo; Fri, 22 Nov 2019 02:22:39 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:37462) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iXyah-001zbv-8E
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 02:22:37 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 52EDACC1144DF;
 Fri, 22 Nov 2019 05:22:31 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id P23otujOPTgo; Fri, 22 Nov 2019 05:22:30 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 7D1D1C44B08E9;
 Fri, 22 Nov 2019 05:22:30 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru 7D1D1C44B08E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1574389350;
 bh=STitR2O0kio6P7RXEgF+gG2cYXJE5pDW4oP+Utz1V9U=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=oQFEaJdXlYFXjdEPGNrUy6HO950oDGTQCSwsfPkwlSXhBq2+PFealUyBh2DMmdIYE
 WHAIegaSu9LmBta89cfkVp+gu16vIRNq9YSkPa/fUJOSxLyKAEg5ev+TWseCkk25b0
 hIKKEvvKMWV9efVKRcfdmLlmMI66bMl6QwC5DBcF6B33eXt63UWG4ulg2Nyumjzfuu
 LP/AcZ9x2ipqC8qlSbC+A1J36uckn2mkgZfEUBroTtVmJ3hsA25hkqNh4o8dVO8dzr
 vP+nQlb352dLzet5cu/jbk7pFCRlNU1efp+qY8pNO/KCrVMi8szEwCvnFQbqWLlDg3
 uX4IP5eedMKSw==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id lkT7O-vy1wJk; Fri, 22 Nov 2019 05:22:30 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-190.ip.moscow.rt.ru
 [90.154.71.190])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 5389BCC1144DE;
 Fri, 22 Nov 2019 05:22:30 +0300 (MSK)
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <18291618.dcJLbluVCs@magrathea>
 <7e571555-5d87-a566-dbf1-4a1c33c67ea8@rosalinux.ru>
 <5586929.0Fyjv50KOk@magrathea>
Message-ID: <0a9d2586-38ab-7c6c-7bcc-8ffc94303495@rosalinux.ru>
Date: Fri, 22 Nov 2019 05:22:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <5586929.0Fyjv50KOk@magrathea>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: ru-RU
Content-Transfer-Encoding: quoted-printable
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

14.11.2019 12:51, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Sunday, 3 November 2019 01:03:43 CET Mikhail Novosyolov wrote:
>> 29.10.2019 10:29, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Monday, 28 October 2019 20:38:08 CET Mikhail Novosyolov wrote:
>>>> 28.10.2019 11:47, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via
>>>>> samba-technical>
>>>>>
>>>>> wrote:
>>>>>> 28.10.2019 10:44, Mikhail Novosyolov =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> <...>
>>>>>>> There are 2 possible solutions:
>>>>>>>
>>>>>>> 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto
>>>>>>> smbspool;" if env does not contain "negotiate" instead of chekcin=
g to
>>>>>>> be either null or 0 - how correct will this be?
>>>>>> I mean this:
>>>>>>
>>>>>> diff --git a/source3/client/smbspool_krb5_wrapper.c
>>>>>> b/source3/client/smbspool_krb5_wrapper.c
>>>>>> index bff1df417e8..000a613291e 100644
>>>>>> --- a/source3/client/smbspool_krb5_wrapper.c
>>>>>> +++ b/source3/client/smbspool_krb5_wrapper.c
>>>>>> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
>>>>>>
>>>>>>             env =3D getenv("AUTH_INFO_REQUIRED");
>>>>>>            =20
>>>>>>              /* If not set, then just call smbspool. */
>>>>>>
>>>>>> -       if (env =3D=3D NULL || env[0] =3D=3D 0) {
>>>>>> +       if (env =3D=3D NULL || env =3D=3D "none" || env[0] =3D=3D =
0) {
>>>>>>
>>>>>>                     CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not set =
- "
>>>>>>                    =20
>>>>>>                                    "execute smbspool");
>>>>>>                    =20
>>>>>>                     goto smbspool;
>>>>> This is obviously wrong :-)
>>>>>
>>>>> Did you see the code below? The question is if we should map
>>>>>
>>>>> AUTH_INFO_REQUIRED=3Dnone
>>>>>
>>>>> to anonymous. I've created a patchset you can find here:
>>>>>
>>>>> https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/head=
s/master-sm
>>>>> bs
>>>>> pool
>>>>>
>>>>>
>>>>> However you need to try all combinations, username/password, kerber=
os
>>>>> and
>>>>> none for anonymous.
>>>> Thank you! I did not test these patches yet, first tried to understa=
nd
>>>> how it works.
>>>>
>>>> Could you please explain a bit how it works?
>>> That's a good question as documentation from CUPS side is missing. So=
 we
>>> need to find out what CUPS does and then try to write tests for it if
>>> possible. This allows us to make sure we work correctly. The repo abo=
ve
>>> shows you where the test is in the samba source code. I've tried to a=
dd
>>> more tests in the past to avoid regressions and verify we work correc=
tly.
>>> This needs to be extended as much as possible.
>>>
>>>
>>> The two patches were just a quick shot.
>> CUPS developer has clearified documentation:
>>
>>    * https://github.com/apple/cups/issues/5674
>>    *
>> https://github.com/apple/cups/commit/025b8ce8f637009f0df7a5bb5fa0a460d=
bb32b
>> 10
>>
>> "'negotiate': Kerberos is required - this keyword can only appear by
>> itself and causes cupsd to collect the UID of the printing user."
>>
>> I've switched smbspool_krb5_wrapper from failing if value of
>> AUTH_INFO_REQUIRED is something not known to just ignoring that and
>> passing the task to smbspool. smbspool will fail itself. Added a test
>> for that. Patches on top of asn/samba.git/master-smbspool are attached=
.
>>
>> I've not tested those changes yet, just checked buildability. Testing
>> will require making a complex set up, I will try.
>
> They look fine, let me know if it works!
>
>
> Thanks.

How to make Samba AD domain controller make all local printers available=20
only to domain members? I've made a local PDF printer which writes to=20
PDF files in CUPS and want to use it for testing and be sure that=20
Kerberos authorization is used to access the printer.

[printers]
 =C2=A0=C2=A0=C2=A0 path =3D /var/spool/samba/
 =C2=A0=C2=A0=C2=A0 printable =3D yes
 =C2=A0=C2=A0=C2=A0 #guest ok=3Dyes
 =C2=A0=C2=A0=C2=A0 security =3D domain

Is it correct? I am not sure about "security =3D domain".


