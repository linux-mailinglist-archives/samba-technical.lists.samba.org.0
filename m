Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 09753793FC6
	for <lists+samba-technical@lfdr.de>; Wed,  6 Sep 2023 16:57:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=Ca6cjnN1g2sS7i5yincX4nK7rj/aIkiF487Nw4V7oZ0=; b=2Ej6MRsR6US5Q4J3a4fAmRX8Pu
	QqOQoHw8ijVHrGG7SsKuMavU9Vh4gkC3DetfhLdC90y0xjsYYMUb04/qK+rtbzMn+ipyVnZjO3pRn
	b4+oTludjjREqYRfXXKTQfngNAS+0Jzt3ntfnyw1MQfxq9yQkhZorZxq3BUCbsgcXGRKjAsOcdiqi
	gmRWg8v3mGEVvffQk6iGlKdeDT4RSwQbDqqrs8xe7qIqSdAb6WvylIUe0INWTGFSTVq3R3bUKQEQN
	R+xfRrzDPZJ37wOBon4hKvMJ3EmWiBwH4h9z+3tdgJeYs9ZVGtzCwNV0hRLLhXIiIHDfH8iUDNAsM
	+sSFL6Gg==;
Received: from ip6-localhost ([::1]:39946 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qdtxz-001HVU-Lo; Wed, 06 Sep 2023 14:57:15 +0000
Received: from mx.inno.tech ([185.228.49.205]:25437) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1qdtxt-001HVH-5G
 for samba-technical@lists.samba.org; Wed, 06 Sep 2023 14:57:13 +0000
Received: from ksmg2.inno.local (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id 14F5A40003
 for <samba-technical@lists.samba.org>; Wed,  6 Sep 2023 17:57:06 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech 14F5A40003
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1694012226; bh=Ca6cjnN1g2sS7i5yincX4nK7rj/aIkiF487Nw4V7oZ0=;
 h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type:From;
 b=U0uQlNJ/CEPJSJ1NtBu183ANpHhK9gPkHVDlTNuUMaz1o1Hy1GNNvqWTwrvGSTsFu
 zNuCDAJIE61nT9NK2E7k2fq4pWZrnd/JSfIHrIksJud+XADFAOs7hcoLPCAY6gtBik
 C//+uvCSDPBddNhMAeUdNYU6oJH1eDAQJAzKpTrSd/e3Ppfc1kFP9+iXTs9RMlQvVX
 JH8BFkBS+3AwIfjgE4MjDk1LTesz2OPoYD3a1XvKO2wB9cq4H5FGvGOWZMk2PGsWMm
 zkyaCFrzqEqoNnUCo/eAZOZIDKqeUyTJboVnI7MykkvJfb4A063YwQNZjyoMhYleIj
 rANavV2xJ57oQ==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Wed,  6 Sep 2023 17:57:06 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20230906_175704761_00021706
X-MS-Exchange-Organization-AuthAs: Partner
Received: from [172.28.100.114] (172.28.100.114) by MAIL-DC2.inno.local
 (10.12.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 6 Sep
 2023 17:57:04 +0300
Message-ID: <73469bea-a59d-42fa-b74a-75058a4aa947@inno.tech>
Date: Wed, 6 Sep 2023 17:57:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: <samba-technical@lists.samba.org>
Content-Language: en-US
Subject: IRPC not invoked in prefork master
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.28.100.114]
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

Hi. I added IRPC function to the ldap server and noticed it gets never 
called. Digging it I found what I believe is a bug in the messaging 
code: when prefork master receives imessaging datagram targeted to the 
child messaging context it dispatches it to the child tevent, but there 
is no event loop running on that. The result is that IRPC is not called 
and both the dgram and `tevent_immediate` are leaked (i.e. they sit in 
the queues forever).

The fix that is working for me is here: 
https://gitlab.com/samba-team/samba/-/merge_requests/3257

I would appreciate it if someone would take a look at this. My 
understanding of the subject is limited and probably there may exists a 
more correct solution, or, rather, I'm doing something wrong with IRPC.


-- 
Pavel Kalugin
inno.tech

