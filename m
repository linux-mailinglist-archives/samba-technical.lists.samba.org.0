Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EFF8BA27F
	for <lists+samba-technical@lfdr.de>; Thu,  2 May 2024 23:42:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Sv/J3oVK6rviVuRypWT2z/JS6PYIE6qxwuWUPQq2h8M=; b=Cy4wi7WOUZnvXUWvlxVTuNGfBO
	UVk66cd/iwrdOvJPHNqVkrVNFqMQPDugSDtSHXo+WMI2LY04Uy0ObBwqgxoUno8xdg/B5VpyZSU1Q
	iHpEevGwwyggGYutMnfropJjlthR5gX89Nt+4oxMnasZ6StmhCeOBrznL0/9zl+TpXxasjNGpnFU4
	bHrJUm+jU38G5SMkiSPJCgiFo1F29JwTl29ZVrxij9Ens4dutvi6X2/FJuXklRSwl6j+mBFhq17T3
	CAPgjcHam1AkEnwCzzI/Jr7tgvLkDrsW9FzqQ3aNYi7c45gzb3t3qVuB1jeH72a1kPcEQy9eXpM12
	SSx5RuxQ==;
Received: from ip6-localhost ([::1]:51014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1s2eBb-0087VR-6b; Thu, 02 May 2024 21:41:51 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:39174) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1s2eBW-0087VK-1s
 for samba-technical@lists.samba.org; Thu, 02 May 2024 21:41:48 +0000
Received: from [192.168.1.4] (unknown [114.23.145.136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id D7E1A3FDF5
 for <samba-technical@lists.samba.org>; Fri,  3 May 2024 09:25:22 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1714685122;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Sv/J3oVK6rviVuRypWT2z/JS6PYIE6qxwuWUPQq2h8M=;
 b=gTV57Mr2Wou1tSPGpH/7PO0JQkwqDPteknkuBT+YTUPQj2HHODt/34TDNbLEn1taRMmnOB
 tTRJ021GlnrMHYN5iHQkWnI98ANpkhhzsq+R0qS09hWtrQrBb17FBT171Y/TcTvCOq32e1
 xQOcPWeXEC/Vm7XDCJO/uBGR6b85NvF0pTTCzfhMffzKsRs6JvAMUV7eeusv4S8L16hFH7
 76CLXOo+wgoFqEl7az3VLRNrKezxmVrORswN95/myD8jwgUFe68GSKkYU+yq1Dv3NH7pg6
 ZNGCs7ycKIefRzv38opjGtzSNFVF99Xicj1i/X0a8i9UK3h/vIdohjQnz8BdQQ==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=gary@catalyst.net.nz smtp.mailfrom=gary@catalyst.net.nz
Message-ID: <86952a23-1d9c-4d3a-a9aa-3a0f19c32c71@catalyst.net.nz>
Date: Fri, 3 May 2024 09:25:21 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Regression: ldb performance with indexes
To: samba-technical@lists.samba.org
References: <4856178.OV4Wx5bFTl@magrathea>
 <44c7b6c9-519a-4b01-ae62-2d03b033c3d4@tranquil.it>
 <b7669c93-fb36-4949-bea0-c295836ebd27@tranquil.it>
 <2688204.lGaqSPkdTl@magrathea>
 <52bc03e9ab383fff654a28a0f309ac02e3bb5b9e.camel@samba.org>
Content-Language: en-NZ, mi-NZ
In-Reply-To: <52bc03e9ab383fff654a28a0f309ac02e3bb5b9e.camel@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.09 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 XM_UA_NO_VERSION(0.01)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default]; ARC_NA(0.00)[];
 MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Gary Lockyer via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gary Lockyer <gary@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

You can set the cache size by passing an option to ldb from python

see python/samba/join.py join_provision_own_domain


so maybe that could be done in schema upgrade as a temporary measure 
until a better data structure can be implemented.

Gary

On 3/05/24 08:51, Andrew Bartlett via samba-technical wrote:
> On Thu, 2024-05-02 at 14:49 +0200, Andreas Schneider via samba-
> technical wrote:
>> On Friday, 22 March 2024 17:55:23 GMT+2 Andréas LEROUX via samba-
>> technical wrote:
>>> Hi Andreas and Andrew,
>>>   >>>> > Hi,my colleagues discovered a performance issue in libldb:
>>>>>>>> https://bugzilla.samba.org/show_bug.cgi?id=15590
>>>   >>>> >  >>>> > > > > As soon as you use indexes, ldbadd will be
>>> magnitudes >>  >> slower than >>  >>>> > itwas before.Could some
>>> ldb expert please look into it? >>>> >  >>>> > > Your subject says
>>> a regression. What version is this a >>>>  >>>> regressionagainst?
>>>>>>> Isn't that obvious from the bug report? >>>  >>> Here is the
>>> short summary: >>> $ bash repro.sh 20000 indexesAdded 2 records
>>> successfullyAdded >>  >> 20000 >>  >>> records successfully >>> On
>>> Samba 4.10: 0m01.231sOn Samba 4.19: 1m30.924s (that's 90 times >>>
>>> slower) >>>  >>>> > The very nature of a DB index is that it will
>>> take time to >>>>  >>>> create,possibly a lot of time, but should
>>> make reads faster. >>>> Either the DB index doesn't work at all in
>>> Samba 4.10 or there >>  >> is a >>  >>> huge performance problem in
>>> Samba 4.19. What is it? >>  >> Thanks, that wasn't written as
>>> obviously on the bug, thanks for the >> clarification. >  > I used
>>> our CentOS 8 Stream CI image for bisecting. You can't bisect >
>>> easily on a modern Linux Distribution, as the included waf would
>>> not > have support for newer Python versions like 3.12.
>>>   > In case you want to reproduce it, here is my run:I'm Andréas
>>> from Tranquil IT dev team. Denis and Yohannès asked me thisweek to
>>> take a look at the performance issues on large domains,
>>> whichinclude this issue in the current thread along the mdb large
>>> transactionissues.
>>> The attached patchset goes through all the tdb and ldb make test.
>>> * LMDB : increase MDB_IDL_LOGN from 16 to 18 to accomodate large
>>> nestedtransactions* tdb : fail-fast when record hash doesn't match
>>> expected hash to avoidto read/copy the entire record* ldb :
>>> increase DEFAULT_INDEX_CACHE_SIZE from 491 to 8089 to increasethe
>>> number of bucket to have smaller bucket to have faster iteration
>>> ineach buckets in tdb_find
>>> With this patchset we can upgrade large domains (>200k objects)
>>> toFL2k16 level in approximatly 1 hour instead of 3 days :-)
>>> [root@srvads1-bl1cw ~]# bash repro.sh 20000 indexes Added 2
>>> recordssuccessfully Added 20000 records successfully real 0m0.536s
>>> user0m0.798s sys 0m0.105s
>> I'm sorry but I'm not able to reproduce this:
>>
>> tis-tdbfind.patch:
>> bash repro_dev_ldb.sh 10000 indexesAdded 2 records successfullyAdded
>> 10000 records successfully
>> real    0m9.035suser    0m9.021ssys     0m0.283s
>>
>> tis-ldbfind.patch:
>> bash repro_dev_ldb.sh 10000 indexesAdded 2 records successfullyAdded
>> 10000 records successfully
>> real    0m8.929suser    0m8.980ssys     0m0.219s
>>
>>
>> I have a patch in the area to get rid of some malloc calls, but the
>> only give a really small improvement.
>>
>> I don't know what workflow your patches exactly improve but it would
>> be nice to have a reproducer :-)
> Just a quick note to connect some threads.  We have three discussions
> on this same issue, we should probably centralise here as this is where
> things started, but just so folks can follow, see:
> https://bugzilla.samba.org/show_bug.cgi?id=15590https://gitlab.com/samba-team/samba/-/merge_requests/3616
> In short, the emerging consensus is that we really need is a better
> data structure than an in-memory TDB for the in-memory cache needed to
> keep the indexes lined up with the database in this case.
> Andrew Bartlett--
> Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
> Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
> company
> Samba Development and Support: https://catalyst.net.nz/services/samba
> Catalyst IT - Expert Open Source Solutions

-- 
Gary Lockyer
Catalyst.Net Limited - Expert Open Source Solutions

Catalyst.Net Ltd - a Catalyst IT group company
DDI: +64 4 123 4567 | Mob: +64 21 123 4567 | Tel: +64 4 123 4567 | www.catalyst.net.nz

CONFIDENTIALITY NOTICE: This email is intended for the named recipients only. It may contain privileged, confidential or copyright information. If you are not the named recipient, any use, reliance upon, disclosure or copying of this email or its attachments is unauthorised. If you have received this email in error, please reply via email or call +64 4 499 2267.


