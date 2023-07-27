Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC72765EEB
	for <lists+samba-technical@lfdr.de>; Fri, 28 Jul 2023 00:07:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=18L3GWhO5fB7zsw8LDIn6hkp+QC62bs9BzQSjYI6P50=; b=hm/czH7DUGYdz4If0ltLDdqFrq
	JEItOKlGtuIk6EbKBzEGgr4DeGrJXkqiUjILcB9Tq8HcivaMVel6begLEznUU352h82gJuidN1I25
	Uk1AFgzLJAftD/jlvtIMcBm0oHUXmOr7DTNfTLucuEbFY79zg/y6RKTgEPftuhyB2Otwz1effqY9H
	fAZrP+XlccEWHtTktCFbsosLt+ibrwOnNXAMGhKmFEJ5R8YAU4TIMS06e86jYOI5PZ9F5IF5w9Xhe
	XBjwqsILXonU+KFdDTPRm7lwgZDvxX8ckHOE6YXAXPP/llHLoj178jnRbmNAQO6nNgG3u4FBDz5+O
	HjqSCSNA==;
Received: from ip6-localhost ([::1]:50696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qP98f-005hi8-0V; Thu, 27 Jul 2023 22:07:17 +0000
Received: from mx.inno.tech ([185.228.49.205]:31782) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qP98Z-005hha-Un
 for samba-technical@lists.samba.org; Thu, 27 Jul 2023 22:07:15 +0000
Received: from ksmg3 (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id 7C98B80002;
 Fri, 28 Jul 2023 01:07:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech 7C98B80002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1690495628; bh=18L3GWhO5fB7zsw8LDIn6hkp+QC62bs9BzQSjYI6P50=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=kB6Y2whQ4aRY3L0iHn5AY8TDBUfKUxqXhZ2oULGHvHQrJoC0dzpHQPHrxo/ArOHeN
 /szmkBG9Tf3jmYGq+IJkvGIvqIMYTVxPfzbz91hd7njie/n8+DHwgkdEarieryoSUE
 WqZL1uDg92ztIkJuw5UND6srkCD2bRD3RxRiI1onUs3WYnFbIuUdp3sf1Q6g6QagDO
 BCDuz9yGK8pWwNk1qmKazcFcrf5Eg28qR4pQILZi35NjCIm/yUHLVdAVBFbO5cMfvp
 ogrVvB5Br5ol6hwzwwhIMN34gRYaoB/k29kdKAFHLXehqPt6VYbXX/jOKUU0QTJx0D
 ku2ihnOZC4oPw==
Received: from SEC-DLP-QRNT.inno.local (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS;
 Fri, 28 Jul 2023 01:07:08 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20230728_010705240_00025091
X-MS-Exchange-Organization-AuthAs: Partner
Received: from [172.28.102.32] (172.28.102.32) by MAIL-DC2.inno.local
 (10.12.115.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 28 Jul
 2023 01:07:03 +0300
Message-ID: <d6fa0a4a-ea12-059a-416a-a254e245b277@inno.tech>
Date: Fri, 28 Jul 2023 01:07:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: What is the status of KDC resource group compression support in
 Samba?
To: Andrew Bartlett <abartlet@samba.org>, <samba-technical@lists.samba.org>
References: <9a11b657-c387-ebe1-389a-3d91c677e8aa@inno.tech>
 <cdd2a4e8f840624395cce796312eeae4500ba4a5.camel@samba.org>
Content-Language: en-US
In-Reply-To: <cdd2a4e8f840624395cce796312eeae4500ba4a5.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.28.102.32]
X-KSMG-Rule-ID: 5
X-KSMG-Message-Action: skipped
X-KSMG-AntiSpam-Status: not scanned, allowlist
X-KSMG-AntiPhishing: not scanned, allowlist
X-KSMG-LinksScanning: not scanned, allowlist
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 not scanned, allowlist
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
From: Pavel Kalugin via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Kalugin <PKalugin@inno.tech>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 7/27/23 22:28, Andrew Bartlett wrote:
> On Thu, 2023-07-27 at 16:16 +0300, Pavel Kalugin via samba-technical
> wrote:
>> Q1: What is the status of KDC resource group compression in Samba? Are
>> there any plans to include it in any upcoming release?
> 
> This will ship in Samba 4.19, of which RC1 is due today.

Great!

> It is always awesome to see new folks interested in Samba development.
> 
> I would warn that, particularly at the quality standard Samba has come
> to expect, that new features and the associated battery of tests are
> harder to develop than you might have assumed.

I see. To be honest, I'm a bit overwhelmed with the complexity of Samba 
but, the more interesting it will be to understand all of this.

> Realising that your time will be driven by what you or your customers
> need, I would still encourage your first efforts to be on a less-core
> feature if possible, so you can get comfortable with the process.
> 
> Anyway, welcome to Samba development.  If you can it would be good to
> understand your goals further, given that thankfully this particular
> task is already complete, to see if we can find a good 'first
> submission' task for you to start on.

In general, there is much of an interest around me to move away from 
Windows to Linux-only environment, keeping all the AD-based 
infrastructure in the "just working" state. This is perfectly doable 
with Samba, except that support for 2012R2 level is required by the 
customer. One of the features missed was "KDC resource groups 
compression". Now, version 4.19 will hopefully fix it, but the status of 
SID history compression is still unclear to me, so let me ask again: 
will this feature (SID history compression) be supported?

Regarding 'first submission' task: I'm all for it! Actually, I've been 
studying Samba for some time now, mainly by reading the wiki, Windows 
protocols docs, looking at the code and the tests and trying hard to 
build some kind of the 'lab domain'. I would say that the entry 
threshold is high enough, so such an initial task from Samba masters 
would be very useful.

Thank you very much!

-- 
Pavel Kalugin
inno.tech

