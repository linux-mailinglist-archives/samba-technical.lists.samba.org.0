Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 253CE782405
	for <lists+samba-technical@lfdr.de>; Mon, 21 Aug 2023 08:51:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Sb1z3SRFREqitmtGrSbvSDrzfHAqdr6e22ufQj8xBVc=; b=dzUaVPnpZ6z/jpq768ZdnQXCXD
	p2tx6G6I6r9cZgPrbUY7efuD79BUSv+h+xSiVAQM00tLzrc4Y0qA6NEdiznGSfOWcYAm9faM6FqI5
	HfeVLUJfF8tr9pbcGSc1UFdEwjqJAHNTih5sM4p0w6GZhTS+dkcnTcj+ffwcAuX0S2+Ze2c16yLjN
	n2gKUN4yj4Jst7qx7cY17fQ42znDkgH/7uSxzXVeLZU0753mAq18HE7iu13zbsANOkPszJX4vKoMx
	9ACldHQkZ/stb0A+jVpgjYdgVbmNHpaqEgzuU6EyLr55XH4o9QC6SYMUIg2m1BHDehKZaBrE/qlAv
	jzwafOew==;
Received: from ip6-localhost ([::1]:47238 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXykt-00DZws-Lh; Mon, 21 Aug 2023 06:51:15 +0000
Received: from mx.inno.tech ([185.228.49.205]:6385) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qXykj-00DZwh-HO
 for samba-technical@lists.samba.org; Mon, 21 Aug 2023 06:51:09 +0000
Received: from ksmg3 (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id E059A8000F;
 Mon, 21 Aug 2023 09:51:01 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech E059A8000F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1692600661; bh=Sb1z3SRFREqitmtGrSbvSDrzfHAqdr6e22ufQj8xBVc=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=YaJC4l0Y93aQoL7mFwvoG5dzuvHnyVluDCTosdy7i0Q0CqJJKxv9a3prW4Ue3+z2v
 Q/cMDNzQPj3/K8SnRIGWmGhzgDe8bwh5Y9DYK/kjkhDsyhNKarNxP+1B7LNwQHlDYJ
 Kh2P4CSGNH+5jK3E4I34AZ9O7p6AqGqEhbTu9dNGj4zZiZvUyJECa39Vo3NDwa4qDT
 uKVXOMpb/O5tjjeTOIP18BMPgmacH4S15oFn9893TF14Vgb05Aawjk18DMpGaiJRJm
 8L3xcyeNd82oU6KJ3qNPg4RXUj1I1FOySigomRwxX9w/0nYk2L599d9B214UEuv9LM
 ne1bnTTfe+JEg==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS;
 Mon, 21 Aug 2023 09:51:01 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20230821_095058070_00005642
X-MS-Exchange-Organization-AuthAs: Partner
Received: from [172.28.103.174] (172.28.103.174) by MAIL-DC2.inno.local
 (10.12.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 21 Aug
 2023 09:51:00 +0300
Message-ID: <b68aa160-97b8-4bdc-a487-e3b1561c5a1d@inno.tech>
Date: Mon, 21 Aug 2023 09:50:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
To: Michael Tokarev <mjt@tls.msk.ru>, <samba-technical@lists.samba.org>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
 <14854277.O9o76ZdvQC@krikkit>
 <62eadda8-c6d3-4086-8f64-c37a33824fa0@inno.tech>
 <15345bf3-9d57-af3b-1926-8fc2fd2cd130@tls.msk.ru>
Content-Language: en-US
In-Reply-To: <15345bf3-9d57-af3b-1926-8fc2fd2cd130@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.28.103.174]
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


On 8/21/23 09:04, Michael Tokarev wrote:
> 21.08.2023 08:48, Pavel Kalugin via samba-technical wrote:
> ..
>>> I'm fine with dropping Python 3.6 support for Samba 4.20.
>>
>> How will this affect OpenSUSE Leap users, where official python3 is 
>> still python3.6?
> 
> Does Leap have recent enough gnutls?

gnutls is of version 3.7.3 in Leap 15.5.

-- 
Pavel Kalugin
inno.tech

