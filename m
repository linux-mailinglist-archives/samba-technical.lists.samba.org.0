Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B45F79C1
	for <lists+samba-technical@lfdr.de>; Fri,  7 Oct 2022 16:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ERlS4xwJIwv7U9q8bJw06XWWCMTuFas9r0CuZvIQISs=; b=TpCr7Fr61eqg2Gj/p124TxVPqM
	4vVD20O54WYjb9SDy/jG4otFMYd8r+qmKMslvLnxVzzA+WqPVQGwOTgRZ8AqarZ0zrmoDA0aXJ0GC
	JHPPqovpGi0rPGmMzjMBdq25KQAtTc9QU5AA/sSbq3FRKH4IW0vAB9GfTjZMFaTVV8JF7AcA+m9NR
	xvHWm4z54HsIpdCF6BYw36NWLPoUAE8HXkHDa/1i+nkX9+WzNGObEYwXntJmyDz3Dbx0KoRdgOCDz
	GAN/PB2QrZ02xwmXufTzjQJe1tr6FGuSbtum4NzMNB6PqI/HPrdF40MT82NymXLRptxN2JhX1T3jP
	K5G+OavA==;
Received: from ip6-localhost ([::1]:53010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ogoSE-000aWq-NH; Fri, 07 Oct 2022 14:35:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49550) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ogoSA-000aWh-45
 for samba-technical@lists.samba.org; Fri, 07 Oct 2022 14:35:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ERlS4xwJIwv7U9q8bJw06XWWCMTuFas9r0CuZvIQISs=; b=wAUPdGV4nN9Nc/9fkoXuGy5LMR
 SgWzxAm1pJZeZRf+YL2Z7ak5PNxN+8Ae0WM2Dcr4Tx8hKC39Ph5K3a6p15PyI255opkfUw8Acij0O
 eEvpKunstOwQyQSXmeIzukq3fLuPFvPDyk7vD0mXgejwS2r0WvnDnA7tJ5ToM4AZVasP1ncn8dFZH
 twv/SicMof0L/15sLLjaKt86snjMGwYxfxN/sbx5zE+AvvYctzSd5YILiSAHoWq0Yj+hHkUWNvDBV
 ryDLEngddH07o7m963HaL1ko8NOqgTpgRrojKenZDAKpCjflnUnSjtYbN4ehceyCJv0LM5d8lLG/j
 v/c1Nv9sap6pfSW7KJXl6efJtoFEE5/2Qx3sLyzuwrbpxHV0QGGUV4USSxlZXN2uBOh4A2ToZ39ch
 v50aMqhTUrlYpyAu7v/6idjBEi53Yk9xQZhDD1rwuM0ptx64lhePTsy+rgajiqsiUv0ZDZxU19HUM
 a8wDgYd3k9ssBYIdPfawQM3E;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ogoS9-003Oeu-9T; Fri, 07 Oct 2022 14:35:53 +0000
Message-ID: <1d78d396-bf36-0777-b12c-aa99a411c0d7@samba.org>
Date: Fri, 7 Oct 2022 16:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: vfs_crossrename not working in samba-4.15.*
Content-Language: en-US
To: Ralph Boehme <slow@samba.org>, Stefan Metzmacher <metze@samba.org>
References: <8fbdc4c2-09db-3032-38c4-1608aae5e7f9@samba.org>
 <CAB5c7xrru41LZs76Qy9wdT6gXbWkWsEi9oyzKMY_Ux_eqw+LgQ@mail.gmail.com>
 <Yz8WfqhSldLLC7RX@jeremy-acer>
 <a27d14e4-ba5d-901a-60b9-2e2b7c7350ca@samba.org>
 <5f314f80-e29a-323b-b349-ed806d5f3bb7@samba.org>
 <533a1bb4-706e-6839-cf14-5db3a183aca8@samba.org>
 <e6c04961-5a5a-7ce3-8473-4159acee25e9@samba.org>
In-Reply-To: <e6c04961-5a5a-7ce3-8473-4159acee25e9@samba.org>
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
From: =?utf-8?q?Pavel_Filipensk=C3=BD_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Pavel_Filipensk=c3=bd?= <pfilipensky@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


On 10/7/22 16:33, Ralph Boehme wrote:
> On 10/7/22 16:25, Pavel Filipenský wrote:
>> I believe that the bug was introduced in
>>
>> 5c18f07 2021-06-16 21:01 -0700 Jeremy Allison     o s3: VFS: 
>> crossrename. Use real dirfsp for SMB_VFS_RENAMEAT()
>>
>>
>> which removes
>>
>> -       if (unlink (dest) && errno != ENOENT) {
>>
>> and adss
>>
>>
>> +       ret = SMB_VFS_NEXT_UNLINKAT(handle,..
>> +       if (ret == -1) {
>>
>> =====
>>
>> I am trying to fix it in master via reintroducing 'errno != ENOENT' 
>> but the fix panics in _share_mode_entry_prepare_lock()
>>
>> ...
>
> I guess this is complicated in master due a possible 
> problem/interaction with metze's new locking code that was merged a 
> few days ago.

exactly. So I guess I should start fixing 4.15, and keep master for metze


>
> -slow
>

