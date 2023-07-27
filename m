Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A0765536
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jul 2023 15:36:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=m9ROVEc4Du1d/QWda4UaavFz4mQiGRozrh3jvp1DJzo=; b=ydw2GgwCRpfrUTuCknk7w4KYwK
	fn/gmOJDOS6ULo/hIInlFhyx78fWSyb3EjT9fXqKNAYZxsA9wHf6/bWZPHxFHE9Ir2WzutgErTnln
	Qi0WNMSyeFj0lSmnbqJ++eXJjVsKYo3AwUeWYqpf7oA0kFH2RUcWSMIRj76wN7GcO7ADojEi+mN3h
	GDZZWPFGXt2DA3fsE/08KRwpYK5TrXiMpMXT9BQUe2yJpNGKdjueokA+Of7DmiRfPfoL5y94kdQQB
	+ji0nKkqBE7Aw3nN8n4Bk4ynPSWfKwHlIg5NC1WWWd1e3jVaLb3t4Z8Vxpn5Zh3bTrl/xkFiuA3+A
	vnmhBwsw==;
Received: from ip6-localhost ([::1]:25540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qP1A4-005fcY-Su; Thu, 27 Jul 2023 13:36:12 +0000
Received: from mx.inno.tech ([185.228.49.205]:61664) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qP19x-005fcN-OT
 for samba-technical@lists.samba.org; Thu, 27 Jul 2023 13:36:10 +0000
Received: from ksmg2.inno.local (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id 8E8FC4000B
 for <samba-technical@lists.samba.org>; Thu, 27 Jul 2023 16:16:31 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech 8E8FC4000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1690463791; bh=m9ROVEc4Du1d/QWda4UaavFz4mQiGRozrh3jvp1DJzo=;
 h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type:From;
 b=sbQfa6IeXR8GAtOWsAukA2uGuhnAu0HmsKZWjGqEn1By824xnPQhNSVXxVNfZH6RX
 MAgdDWEfaKYLGXABQQ5Ey9Vgjr/Md1iOv3mV4W+ef43Uy7cBfG6SUDm9nqZMITm2A/
 ZvkB79AyPpqvfUQ7XTo1XLxdKcU8XQgjukOLabQkTXLwoirYaPpxInP1904MfEHok/
 Sg62BnuWsQ7Bxlhp8fDNZYD3f9xn5c85DWesBGAuCFHtZy1pzDN9hMmiMpNRXW5LUu
 jIHvau+9l6VWAZXsR6yYX4d3iA1jsF5tiMNJFCUsUqA4Zt8+Bfe8QeYKJ6Y/uxySGs
 yipCfeLA3CyMw==
Received: from SEC-DLP-QRNT.inno.local (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Thu, 27 Jul 2023 16:16:31 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20230727_161626811_00017658
X-MS-Exchange-Organization-AuthAs: Partner
Received: from [172.28.103.166] (172.28.103.166) by MAIL-DC2.inno.local
 (10.12.115.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 27 Jul
 2023 16:16:25 +0300
Message-ID: <9a11b657-c387-ebe1-389a-3d91c677e8aa@inno.tech>
Date: Thu, 27 Jul 2023 16:16:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: <samba-technical@lists.samba.org>
Subject: What is the status of KDC resource group compression support in Samba?
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.28.103.166]
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

Hello all.

Recently, some support for KDC resource group compression was added to 
Samba by commit e3fdb2d 
(https://gitlab.com/samba-team/samba/-/commit/e3fdb2d00152d86558a2ba29b92fd36440055461). 
The commit message explicitly mentioned "domain-local groups" only, 
while the Microsoft description of the feature 
(https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/hh831747(v=ws.11)#kdc-resource-group-compression) 
also mentions "universal groups, and groups associated with security 
identifier history".
Also, there were some relevant commits which enable a bunch of 
previously disabled group tests, but several tests are still disabled 
for Heimdal, and even more for MIT Kerberos.

Q1: What is the status of KDC resource group compression in Samba? Are 
there any plans to include it in any upcoming release?

Q2: Does anyone works on SID history groups compression in the meantime? 
If not, then I'm willing to implement it, but I'm new to the Samba 
codebase, and so need some pointers as to what parts of the system may 
be affected and, ideally, some high-level description of the feature in 
the Samba context.

Thanks

-- 
Pavel Kalugin
inno.tech

