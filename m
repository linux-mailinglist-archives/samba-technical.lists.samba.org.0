Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E274109718
	for <lists+samba-technical@lfdr.de>; Tue, 26 Nov 2019 00:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=eLZAIr8QDF58o8mUUM3IDTnV7CnBSpqctDEfrQvPRjY=; b=F67qyihLWtGkjQ6cdakvyPjVnp
	eN4Rskv6vEUPnVuIp8U1j0WG/4CVeztEgH7X+1Eo7SiQqMPCZPlo41KoO4OOfnP35v27u7kwBumXB
	wLp0e8I3LBqM4FiJvfxwMXLttscXWrj5HcBWnhyKYpF+IWGNc0m8mMRId0pQgjkBXuJNpEbxc4z9P
	p2p06wSW8ADzksF9zt6L157bNtW6c2SeXtIhk1uuSKf+EIUnYIU110mkYNNqBN4gkvUlsPdYMpX9j
	+da+uk0rZzCxVPD9GdyKzIpZwPb5Lhnh3E/7QjfhUoirYlvy4ijCYZe+LLleYPLduVrvLzk3YJXcc
	oxcYZV1A==;
Received: from localhost ([::1]:29122 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZO6Z-002O2Y-08; Mon, 25 Nov 2019 23:49:19 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:41246) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iZO6T-002O2R-LZ
 for samba-technical@lists.samba.org; Mon, 25 Nov 2019 23:49:16 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id A668AD4C93D06;
 Tue, 26 Nov 2019 02:49:10 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id oVp5v99tGWlH; Tue, 26 Nov 2019 02:49:09 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id AD911D4C93D3E;
 Tue, 26 Nov 2019 02:49:09 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru AD911D4C93D3E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1574725749;
 bh=eLZAIr8QDF58o8mUUM3IDTnV7CnBSpqctDEfrQvPRjY=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=mguPlOxRHDWUCsDD9VWvqCLQO8sO1DwpxOw6Z7gF3eQq30xRVQqvqnVungyMyWaHs
 wLOtaV42xgxSmSSXd7B1SmruvD7C52o/Ml+crDIu7yyG10hs5O8lREhk1+Pf8C7Tvy
 OE2bBsA1ZOVWR/soOvsaWoZq9JEaADO4HUOVY0Qz75W0Apzh0TDeO8Q+MoDw6M9JBU
 Kn0rH3F2vjge78MnsKRFsf17eJqeXAHb5HfRr/Uqv998TQ3HqWr3CgLlu06r1ZiScr
 7TltTxbni4qwywd3QlhARLGYiYgEu6IOtbwwNM4ujwvnnLKHlsC/F9n4SuqDde5nGg
 MoexOjKYieiIg==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id kCZ3S-k1VRsB; Tue, 26 Nov 2019 02:49:09 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-70-14.ip.moscow.rt.ru
 [90.154.70.14])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id 561E4D4C93D06;
 Tue, 26 Nov 2019 02:49:09 +0300 (MSK)
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <5586929.0Fyjv50KOk@magrathea>
 <0a9d2586-38ab-7c6c-7bcc-8ffc94303495@rosalinux.ru>
 <1574444045.gU553saExv@magrathea>
Message-ID: <c767314c-4517-20f1-538f-7a34a35c1086@rosalinux.ru>
Date: Tue, 26 Nov 2019 02:49:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <1574444045.gU553saExv@magrathea>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

22.11.2019 17:33, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Friday, 22 November 2019 03:22:29 CET Mikhail Novosyolov via samba-
> technical wrote:
>> 14.11.2019 12:51, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On Sunday, 3 November 2019 01:03:43 CET Mikhail Novosyolov wrote:
>>>> 29.10.2019 10:29, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> On Monday, 28 October 2019 20:38:08 CET Mikhail Novosyolov wrote:
>>>>>> 28.10.2019 11:47, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>>> On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via
>>>>>>> samba-technical>
>>>>>>>
>>>>>>> wrote:
>>>>>>>> 28.10.2019 10:44, Mikhail Novosyolov =D0=BF=D0=B8=D1=88=D0=B5=D1=
=82:
>>>>>>>>> <...>
>>>>>>>>> There are 2 possible solutions:
>>>>>>>>>
>>>>>>>>> 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto
>>>>>>>>> smbspool;" if env does not contain "negotiate" instead of chekc=
ing
>>>>>>>>> to
>>>>>>>>> be either null or 0 - how correct will this be?
>>>>>>>> I mean this:
>>>>>>>>
>>>>>>>> diff --git a/source3/client/smbspool_krb5_wrapper.c
>>>>>>>> b/source3/client/smbspool_krb5_wrapper.c
>>>>>>>> index bff1df417e8..000a613291e 100644
>>>>>>>> --- a/source3/client/smbspool_krb5_wrapper.c
>>>>>>>> +++ b/source3/client/smbspool_krb5_wrapper.c
>>>>>>>> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
>>>>>>>>
>>>>>>>>              env =3D getenv("AUTH_INFO_REQUIRED");
>>>>>>>>             =20
>>>>>>>>               /* If not set, then just call smbspool. */
>>>>>>>>
>>>>>>>> -       if (env =3D=3D NULL || env[0] =3D=3D 0) {
>>>>>>>> +       if (env =3D=3D NULL || env =3D=3D "none" || env[0] =3D=3D=
 0) {
>>>>>>>>
>>>>>>>>                      CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not s=
et - "
>>>>>>>>                     =20
>>>>>>>>                                     "execute smbspool");
>>>>>>>>                     =20
>>>>>>>>                      goto smbspool;
>>>>>>> This is obviously wrong :-)
>>>>>>>
>>>>>>> Did you see the code below? The question is if we should map
>>>>>>>
>>>>>>> AUTH_INFO_REQUIRED=3Dnone
>>>>>>>
>>>>>>> to anonymous. I've created a patchset you can find here:
>>>>>>>
>>>>>>> https://git.samba.org/?p=3Dasn/samba.git;a=3Dshortlog;h=3Drefs/he=
ads/master-> >>>>> sm
>>>>>>> bs
>>>>>>> pool
>>>>>>>
>>>>>>>
>>>>>>> However you need to try all combinations, username/password, kerb=
eros
>>>>>>> and
>>>>>>> none for anonymous.
>>>>>> Thank you! I did not test these patches yet, first tried to unders=
tand
>>>>>> how it works.
>>>>>>
>>>>>> Could you please explain a bit how it works?
>>>>> That's a good question as documentation from CUPS side is missing. =
So we
>>>>> need to find out what CUPS does and then try to write tests for it =
if
>>>>> possible. This allows us to make sure we work correctly. The repo a=
bove
>>>>> shows you where the test is in the samba source code. I've tried to=
 add
>>>>> more tests in the past to avoid regressions and verify we work
>>>>> correctly.
>>>>> This needs to be extended as much as possible.
>>>>>
>>>>>
>>>>> The two patches were just a quick shot.
>>>> CUPS developer has clearified documentation:
>>>>     * https://github.com/apple/cups/issues/5674
>>>>     *
>>>>
>>>> https://github.com/apple/cups/commit/025b8ce8f637009f0df7a5bb5fa0a46=
0dbb3
>>>> 2b
>>>> 10
>>>>
>>>> "'negotiate': Kerberos is required - this keyword can only appear by
>>>> itself and causes cupsd to collect the UID of the printing user."
>>>>
>>>> I've switched smbspool_krb5_wrapper from failing if value of
>>>> AUTH_INFO_REQUIRED is something not known to just ignoring that and
>>>> passing the task to smbspool. smbspool will fail itself. Added a tes=
t
>>>> for that. Patches on top of asn/samba.git/master-smbspool are attach=
ed.
>>>>
>>>> I've not tested those changes yet, just checked buildability. Testin=
g
>>>> will require making a complex set up, I will try.
>>> They look fine, let me know if it works!
>>>
>>>
>>> Thanks.
>> How to make Samba AD domain controller make all local printers availab=
le
>> only to domain members? I've made a local PDF printer which writes to
>> PDF files in CUPS and want to use it for testing and be sure that
>> Kerberos authorization is used to access the printer.
>>
>> [printers]
>>       path =3D /var/spool/samba/
>>       printable =3D yes
>>       #guest ok=3Dyes
>>       security =3D domain
>>
>> Is it correct? I am not sure about "security =3D domain".
> 'secruity =3D domain' means it is a NT4-style member :-) That also wont=
 work on
> shares.
>
> If you don't specify anything, it requires authentication. You can use =
'valid
> users' to restrict the share to certain users or groups.

I have tested those 4 patches (2 yours, Andreas, and 2 mine that I sent=20
here previously). Behaviour of /usr/lib/cups/backend/smb symlinked to=20
patched smbspool_krb5_wrapper seems to be correct: it passes printing=20
tasks from printers without "AuthInfoRequired negotiate" directly to=20
smbspool and correctly finds /tmp/krb5cc_$UID for printers with=20
"AuthInfoRequired negotiate", where UID is a local ID of a domain user.=20
I clearly see this in /var/log/cups/error_log when it is "LogLevel=20
debug2" in /etc/cups/cupsd.conf.

So, these patches are ready to be merged, I think.
-------------------------------------------------------------------------=
--


However, smbspool returns 2 due one of these authentication errors=20
happening dut to problems in my configuration. I will investigate this=20
later, may be some will point to mistakes.

That's a problem on the samba domain controller, I don't know why it=20
rejects authentication. I see in cups/error_log:
"Try to connect using Kerberos..." (from smbspool.c)
"Kerberos auth with user@REALM <...> to access <IP_address_of_DC> not=20
possible" (from samba's source3/libsmb/cliconnect.c)

smb.conf on domain controller is:

[root@dc1 samba]# cat /etc/samba/smb.conf
# Global parameters
[global]
 =C2=A0=C2=A0=C2=A0 dns forwarder =3D 8.8.8.8
 =C2=A0=C2=A0=C2=A0 netbios name =3D DC1
 =C2=A0=C2=A0=C2=A0 realm =3D ROSA.LOC
 =C2=A0=C2=A0=C2=A0 server role =3D active directory domain controller
 =C2=A0=C2=A0=C2=A0 workgroup =3D ROSA
 =C2=A0=C2=A0=C2=A0 idmap_ldb:use rfc2307 =3D yes
 =C2=A0=C2=A0=C2=A0 printing =3D CUPS
 =C2=A0=C2=A0=C2=A0 log level =3D 9

[netlogon]
 =C2=A0=C2=A0=C2=A0 path =3D /var/lib/samba/sysvol/rosa.loc/scripts
 =C2=A0=C2=A0=C2=A0 read only =3D No

[sysvol]
 =C2=A0=C2=A0=C2=A0 path =3D /var/lib/samba/sysvol
 =C2=A0=C2=A0=C2=A0 read only =3D No

[printers]
 =C2=A0=C2=A0=C2=A0 path =3D /var/spool/samba/
 =C2=A0=C2=A0=C2=A0 printable =3D yes
 =C2=A0=C2=A0=C2=A0 #guest ok=3Dyes
 =C2=A0=C2=A0=C2=A0 #valid users =3D Administrator root @adm
 =C2=A0=C2=A0=C2=A0 #vfs objects =3D full_audit


