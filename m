Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B0F31BD7A
	for <lists+samba-technical@lfdr.de>; Mon, 15 Feb 2021 16:50:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=1G3VBTJxaIkp3XrzjttO0G1i1BWVo92Dr7YCe6mmYRs=; b=g8HvSXaOtRLV2fs2a3OPtiP0Qt
	M1INu00mOlpdolUxkjRGiBiRMCTeg7slIsrS3O3xAJKdxXgyqbCYeaaGerMWY84GzFIohUye2TZtk
	lHZNGSYaXUIQ9s1C89DuQPExEym3QCHGJtinXdQ4QlFT+AfP+67n1UPsElLlIwSOOlQqxI4BhFcpM
	bBOf9GMyFCMwa7rxgLGxBxT2FsEiaYofP1aPYrpobW2IcgZZHNgN3dNi9ORr5FMq7fNEeVhXeHj3a
	a4uHxJyvPYecJs/BWIkxFFLqTfLSUKtx0FjpKknabzvDshAbKfYDJJT65/Tln2uvyXTb2yr9nD4IB
	udTXLfBA==;
Received: from ip6-localhost ([::1]:24718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lBg8D-00Ci6I-8l; Mon, 15 Feb 2021 15:49:49 +0000
Received: from mail.tranquil.it ([195.154.18.20]:33780) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lBg87-00Ci69-AA
 for samba-technical@lists.samba.org; Mon, 15 Feb 2021 15:49:46 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.tranquil.it (Postfix) with ESMTP id EEBE787E88;
 Mon, 15 Feb 2021 16:49:38 +0100 (CET)
Received: from mail.tranquil.it ([127.0.0.1])
 by localhost (mail.tranquil.it [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATx96uUcbAnc; Mon, 15 Feb 2021 16:49:33 +0100 (CET)
X-Client-Addr: 193.252.46.185
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tranquil.it; s=mail;
 t=1613404173; bh=XX2brox4RuidFvrZ+hcPu0BSKnxCfEG+P9eKSSA/MwQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=oiniy2SS3bgXgfYRvjzX+TiZwi/TtHhwd9E5CXyfO433cMZdAoLtZtjMoz/12wTBq
 /C5YMtY00Ruto6NJ/HgLoL0SRlI9Bkvhsab8iGX0mibRIcZxJLb5sQBV9d8hAApcjo
 7yTZ56z7RfmGC0Jer4jlwG5kOTGSftwzT/zpYaKE=
X-Client-Addr: 193.252.46.185
X-Client-Addr: 193.252.46.185
X-Client-Addr: 193.252.46.185
Received: from [172.16.144.45]
 (lstlambert-657-1-15-185.w193-252.abo.wanadoo.fr [193.252.46.185])
 by mail.tranquil.it (Postfix) with ESMTPSA id 8A5EF80F47;
 Mon, 15 Feb 2021 16:49:32 +0100 (CET)
Subject: Re: Certificate services
To: Thomas Epperson <thomas.epperson@gmail.com>
References: <CAKHbFk1n9tsr9hwBqLtXQid=zm6BOYbeeNhdcRMdK6pFQFNg-A@mail.gmail.com>
 <ad0f018d814db7f60a4fc3c42431c9cde96c9bd4.camel@samba.org>
 <35d275a0-4df3-8c4f-0a74-2fc6a5c7cdc8@tranquil.it>
 <CAKHbFk1hRXvFcLCe6rXbWaL9sVpd_D6xgJ5KRnZfVKFBVYGqBg@mail.gmail.com>
Message-ID: <dc230e4a-293b-beee-470d-0169504186a0@tranquil.it>
Date: Mon, 15 Feb 2021 16:49:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAKHbFk1hRXvFcLCe6rXbWaL9sVpd_D6xgJ5KRnZfVKFBVYGqBg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Denis CARDON via samba-technical <samba-technical@lists.samba.org>
Reply-To: Denis CARDON <dcardon@tranquil.it>
Cc: samba-technical@lists.samba.org, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Thomas,

ADCS is a separate product from ADDC. As stated in my previous mail you 
can install ADCS on a member server which is joined to an existing 
Samba-DC.

If you want to re-implement a certificate service similar to ADCS on 
Linux you'll have to code. There are alternative CA that you can run on 
Linux, and ADCS is mostly useful if you need auto-enrollment.

Cheers,

Denis

Le 15/02/2021 à 16:01, Thomas Epperson via samba-technical a écrit :
> Is this something I need to implement with code changes to samba or can I
> implement this using an existing configuration (and another process to
> implement the certificate services)? (Perhaps server services in smb.conf?)
> 
> Thomas
> 
> On Tue, Feb 9, 2021 at 3:46 AM Denis CARDON <dcardon@tranquil.it> wrote:
> 
>> Hi Andrew and Thomas,
>>
>> Le 09/02/2021 à 09:26, Andrew Bartlett via samba-technical a écrit :
>>> On Fri, 2021-02-05 at 23:03 -0500, Thomas Epperson via samba-technical
>>> wrote:
>>>> Hello,
>>>>
>>>> Have there been any efforts or are there any technical boundaries to
>>>> implementing the certificate services in samba (as would be used with
>>>> active directory) ? I am looking to implement it and thought adding
>>>> it to
>>>> samba would make sense.
>>>
>>> I've not looked into it but are you thinking in terms of what would
>>> allow a member server to self-issue a certificate in its own name etc?
>>
>> I have a client who had to setup an ADCS (AD Certificate Service) for
>> VMWare Horizon. It has been set up on a member server joined to a
>> Samba-AD domain and it does work properly (at least for that use case)
>> for auto enrollment.
>>
>> They have a separate CA for the other stuff (user certificates, https
>> server certificates, etc.), so I cannot say for every use cases.
>>
>> Cheers,
>>
>> Denis
>>
>>> A CA manager is a complex beast (once CRLs or OCSP etc start happening)
>>> so I wonder if we should bridge any interfaces we need to supply to an
>>> existing project.
>>>
>>> But beyond that have a go I suppose!  I've not heard of any other
>>> efforts that are Samba-integrated.
>>>
>>> Andrew,
>>>
>>
> 
> 

