Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 024731068BA
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 10:18:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=IRqfxIXlcmPW53wLvLcnUrN4ywPDpGuEHMvMcbBccFY=; b=WAfoMuBxEOGP+95r2ppJe5pCAs
	pskgf6oydjVzgJf/gRVlsxoO5U/NR4bSmGV7q8eSDl0V4E/cq5OYZz+dmRrGRlmy7PTMsNhVX95DX
	uYfePEgH2gHBKsVVoGA4VSFXPBplihaETpSR3s3BBaXtlVXLmE6Rufw1Tx0b8bvvTkJtNfDKRIsxa
	OarFQUWAmdxjkufoFtrhEUEYuzgAUqI87ijxizA09PcWWLL2r2m29I0OiEIqE3KorO3i/ovLRuVrZ
	SJJUx3ckrzZLyJUPboM+GYWNvAb6ZijjjOIRnEI4nZmHZJxIoAf/LzMOcBSORxSxALvQhZ7qyw7OW
	SptD/FYQ==;
Received: from localhost ([::1]:49424 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iY55O-0020h1-1n; Fri, 22 Nov 2019 09:18:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45168) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY55J-0020gu-KQ
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 09:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=IRqfxIXlcmPW53wLvLcnUrN4ywPDpGuEHMvMcbBccFY=; b=h8DD5Yh4gHiyN4fz3buRLItGs7
 rv4pvXRIEsCNs04YdV6F7VResVbja1QtTA5UDLnrgA7Es7g1tvklGwwTM02ljWxKGLuW/2JD8WFRN
 xpDSBI3djJLk37w4fby9X/MQ1rXQk7VHLN5q4TRnjkE6e7ps6Lx3LoQZbljH7mDCIisBJMfElplUB
 k6mLys1y8pbJy10OU7VTTrv5vdhi26JnISN/2T/w2aTabRtmHdHrGMl6M2+cEIMcp0oentctDP3sC
 vO3Z8I0zGv5xNU+6bF9jslMLq3PT20XPs1rQ9FZFBnNujxas7J9jDdBcXRIdRxAFKqKKGE8jknhGi
 xbTcjPvbqWZwduByCvdqyEjbjB4wDGCW1j4HQciWn/9aCSd/KKX20ysVCAjoqqwNsRkSci1i5UzRF
 FLNi0WzWXIaHNo36AmzYwjNWa7oHCK5Ngcfzf0z5+EkXIJm9pZv09eItKw8hNosfAQNzblrp4t0AK
 4riuxXbIaXfGBAUeENcyqkYB;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iY55J-0002a2-6R
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 09:18:37 +0000
Subject: Re: Automating usage of smbspool_krb5_wrapper
To: samba-technical@lists.samba.org
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <18291618.dcJLbluVCs@magrathea>
 <7e571555-5d87-a566-dbf1-4a1c33c67ea8@rosalinux.ru>
 <5586929.0Fyjv50KOk@magrathea>
 <0a9d2586-38ab-7c6c-7bcc-8ffc94303495@rosalinux.ru>
Message-ID: <c5ef0b5b-a1d2-e3f0-2941-13512029caf3@samba.org>
Date: Fri, 22 Nov 2019 09:18:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <0a9d2586-38ab-7c6c-7bcc-8ffc94303495@rosalinux.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 22/11/2019 02:22, Mikhail Novosyolov via samba-technical wrote:
> 14.11.2019 12:51, Andreas Schneider пишет:
>> On Sunday, 3 November 2019 01:03:43 CET Mikhail Novosyolov wrote:
>>> 29.10.2019 10:29, Andreas Schneider пишет:
>>>> On Monday, 28 October 2019 20:38:08 CET Mikhail Novosyolov wrote:
>>>>> 28.10.2019 11:47, Andreas Schneider пишет:
>>>>>> On Monday, 28 October 2019 08:58:26 CET Mikhail Novosyolov via
>>>>>> samba-technical>
>>>>>>
>>>>>> wrote:
>>>>>>> 28.10.2019 10:44, Mikhail Novosyolov пишет:
>>>>>>>> <...>
>>>>>>>> There are 2 possible solutions:
>>>>>>>>
>>>>>>>> 1) either patch source3/client/smbspool_krb5_wrapper.c to "goto
>>>>>>>> smbspool;" if env does not contain "negotiate" instead of 
>>>>>>>> chekcing to
>>>>>>>> be either null or 0 - how correct will this be?
>>>>>>> I mean this:
>>>>>>>
>>>>>>> diff --git a/source3/client/smbspool_krb5_wrapper.c
>>>>>>> b/source3/client/smbspool_krb5_wrapper.c
>>>>>>> index bff1df417e8..000a613291e 100644
>>>>>>> --- a/source3/client/smbspool_krb5_wrapper.c
>>>>>>> +++ b/source3/client/smbspool_krb5_wrapper.c
>>>>>>> @@ -149,7 +149,7 @@ int main(int argc, char *argv[])
>>>>>>>
>>>>>>>             env = getenv("AUTH_INFO_REQUIRED");
>>>>>>>                          /* If not set, then just call smbspool. */
>>>>>>>
>>>>>>> -       if (env == NULL || env[0] == 0) {
>>>>>>> +       if (env == NULL || env == "none" || env[0] == 0) {
>>>>>>>
>>>>>>>                     CUPS_SMB_DEBUG("AUTH_INFO_REQUIRED is not 
>>>>>>> set - "
>>>>>>> "execute smbspool");
>>>>>>>                                         goto smbspool;
>>>>>> This is obviously wrong :-)
>>>>>>
>>>>>> Did you see the code below? The question is if we should map
>>>>>>
>>>>>> AUTH_INFO_REQUIRED=none
>>>>>>
>>>>>> to anonymous. I've created a patchset you can find here:
>>>>>>
>>>>>> https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/master-sm 
>>>>>>
>>>>>> bs
>>>>>> pool
>>>>>>
>>>>>>
>>>>>> However you need to try all combinations, username/password, 
>>>>>> kerberos
>>>>>> and
>>>>>> none for anonymous.
>>>>> Thank you! I did not test these patches yet, first tried to 
>>>>> understand
>>>>> how it works.
>>>>>
>>>>> Could you please explain a bit how it works?
>>>> That's a good question as documentation from CUPS side is missing. 
>>>> So we
>>>> need to find out what CUPS does and then try to write tests for it if
>>>> possible. This allows us to make sure we work correctly. The repo 
>>>> above
>>>> shows you where the test is in the samba source code. I've tried to 
>>>> add
>>>> more tests in the past to avoid regressions and verify we work 
>>>> correctly.
>>>> This needs to be extended as much as possible.
>>>>
>>>>
>>>> The two patches were just a quick shot.
>>> CUPS developer has clearified documentation:
>>>
>>>    * https://github.com/apple/cups/issues/5674
>>>    *
>>> https://github.com/apple/cups/commit/025b8ce8f637009f0df7a5bb5fa0a460dbb32b 
>>>
>>> 10
>>>
>>> "'negotiate': Kerberos is required - this keyword can only appear by
>>> itself and causes cupsd to collect the UID of the printing user."
>>>
>>> I've switched smbspool_krb5_wrapper from failing if value of
>>> AUTH_INFO_REQUIRED is something not known to just ignoring that and
>>> passing the task to smbspool. smbspool will fail itself. Added a test
>>> for that. Patches on top of asn/samba.git/master-smbspool are attached.
>>>
>>> I've not tested those changes yet, just checked buildability. Testing
>>> will require making a complex set up, I will try.
>>
>> They look fine, let me know if it works!
>>
>>
>> Thanks.
>
> How to make Samba AD domain controller make all local printers 
> available only to domain members? I've made a local PDF printer which 
> writes to PDF files in CUPS and want to use it for testing and be sure 
> that Kerberos authorization is used to access the printer.
>
> [printers]
>     path = /var/spool/samba/
>     printable = yes
>     #guest ok=yes
>     security = domain
>
> Is it correct? I am not sure about "security = domain".
>
>
Sorry, but it isn't,  the 'security' parameter is only valid in [global] 
and if you read 'man smb.conf' it tells you this:

PARAMETERS

Parameters define the specific attributes of sections.

Some parameters are specific to the [global] section (e.g., security).

Not being a printing expert, ( Louis will know this ) but is it possible 
to deny access by Windows ACLs ?

Rowland



