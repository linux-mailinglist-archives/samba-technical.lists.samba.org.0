Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6604378234F
	for <lists+samba-technical@lfdr.de>; Mon, 21 Aug 2023 07:48:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=GirqtqJibvF2EeyAKA9kys3RH6cBsYmMdFkck5DztCg=; b=FvJ0tLftLds43/DgFfuzXaq/J6
	tWVTqdqXjTZEyUkLQS+Yt4BATG6jAXEpWpLBFdVfopdefdlrltcAipj9YcspUqvB/Czw5N1Caacxo
	Jj9FCVxeCCE6Eh4ngUuDLaS2KcoGE9q/liiVHhqpYf7EOrzwDTMWWzq8Dfrp22qrt975k7RbF2/xA
	X9t4oQpGVhF/8aRC52qSpo2LqlNxUVavXgHev0ul0Kaz7kke0ybGHi3+S7BysG5i6gdGxDkBATgCu
	2qBGp73a2F3fSwTLYRP9nQB39fKuZmeZAuOvvFKW704O47KSkqP7o4vriIdZq4z9XpDstNam/G1+F
	uZ7IKf6A==;
Received: from ip6-localhost ([::1]:56462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qXxlt-00DYsS-0L; Mon, 21 Aug 2023 05:48:13 +0000
Received: from mx.inno.tech ([185.228.49.205]:32270) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qXxlm-00DYsJ-7P
 for samba-technical@lists.samba.org; Mon, 21 Aug 2023 05:48:10 +0000
Received: from ksmg3 (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id B93FE8000B
 for <samba-technical@lists.samba.org>; Mon, 21 Aug 2023 08:48:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech B93FE8000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1692596882; bh=GirqtqJibvF2EeyAKA9kys3RH6cBsYmMdFkck5DztCg=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=nFxLDSqbX1Sc/Zb4445qJUeYutapVhe/mT1pSf8NApxYP96wPHa3+LYt9X8RPemyu
 /YCPRAeuGfegEo6i87PjzSXVOB2l+1sE6EQMTOi4s294Wq/QnjqOo6FpwQHwNVzmHW
 gaj/Nzp0mDIutovINIJcF0DP8bK+0ybQZwlFCSFeV+uNFs7Cc0w6z1pLDidsY2mVCL
 3Eqba2fmRty4dIMdzYSO5lOf37IXGCojZnA26vQLpbOmmRGOf8AE2zxhKej4Yns93c
 rXyGIPcgp3yeCHFsSsitecsfLVo262QNwUQuyW3Ttf8j18G+mtccErdq2hPg2dLXJd
 YVpN4EexHh+ow==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Mon, 21 Aug 2023 08:48:02 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20230821_084758837_00003395
X-MS-Exchange-Organization-AuthAs: Partner
Received: from [172.28.103.174] (172.28.103.174) by MAIL-DC2.inno.local
 (10.12.115.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Mon, 21 Aug
 2023 08:48:00 +0300
Message-ID: <62eadda8-c6d3-4086-8f64-c37a33824fa0@inno.tech>
Date: Mon, 21 Aug 2023 08:48:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
To: <samba-technical@lists.samba.org>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
 <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
 <14854277.O9o76ZdvQC@krikkit>
Content-Language: en-US
In-Reply-To: <14854277.O9o76ZdvQC@krikkit>
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



On 8/19/23 21:06, Andreas Schneider via samba-technical wrote:
> On Friday, 18 August 2023 02:08:00 CEST Andrew Bartlett via samba-technical
> wrote:
>> I would note that times when we didn't line up the CI version and
>> Python 'supported' version, it kept breaking.
>> I note that RHEL7 ends 'maintenance' in June 2024, just after the 4.20
>> release March 2024
>> https://www.redhat.com/en/blog/end-maintenance-red-hat-enterprise-linux-7-al
>> most-here Those dates I think give good cause to drop CentOS 7, but other
>> views still welcome.
> 
> I'm fine with dropping Python 3.6 support for Samba 4.20.

How will this affect OpenSUSE Leap users, where official python3 is 
still python3.6?

-- 
Pavel Kalugin
inno.tech

