Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A637BCFE1
	for <lists+samba-technical@lfdr.de>; Sun,  8 Oct 2023 21:45:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=ZY28xW76w+MmbOHqCyWLA5s4vTobZDdhgx3f7317fU8=; b=36Frn4Hrb8zaM8+vpBcbF3DH1b
	rLY5ZTnv0vt1ib3a1K6eqzSvOWFrVdGKAILm9DHIkQLUVwwmfq/ptNFKIguF4FglUrWls6uc5v99z
	y1okgg98j60YhIpuTRkpbOC7Kf4r3qnj7sr45adqhOOmM6YO5DOSDJMCQgxo66AXy2gX60wFI0Zjy
	CPYVtFmAprItNQ9ynp4yZFPEK1mY5Io8tMS49ozgDSth2PDfDaRWTqEZVxq3c2mZXvMxvibXXboyn
	YdJbzIgsdC8iraxvV4RNCJf11y4HQtH9cGrdsbAARz6u7001Mhb0fAtQpo+UzqHLkZZggePc2w1RY
	oWLeRXPw==;
Received: from ip6-localhost ([::1]:34654 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qpZhd-000c0g-Pi; Sun, 08 Oct 2023 19:44:36 +0000
Received: from mx.inno.tech ([185.228.49.205]:54397) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_SECP256R1__RSA_SHA512__AES_256_GCM:256) (Exim)
 id 1qpZhZ-000c0Z-CU
 for samba-technical@lists.samba.org; Sun, 08 Oct 2023 19:44:34 +0000
Received: from ksmg1.inno.local (localhost [127.0.0.1])
 by mx.inno.tech (Postfix) with ESMTP id 405AE2000A
 for <samba-technical@lists.samba.org>; Sun,  8 Oct 2023 22:25:33 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.inno.tech 405AE2000A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inno.tech; s=s1;
 t=1696793133; bh=ZY28xW76w+MmbOHqCyWLA5s4vTobZDdhgx3f7317fU8=;
 h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type:From;
 b=uuiwYuhkbd0wpHTIKA4UnVnm3ufVi9zeI++otWe0zWDjvEqyZuyJGrygvN936MkwZ
 2VD7l+HONUwmfQg+3lleqVpOzCHR8Ht2Cso6JIkfAaNRHnaskWvMYWp0JXAk62DW3e
 zq3bPSFeD5Rp125f94/H/YIODamPagj7xJFqpmI30r24l9wSdsjkT11c/pB005Wr+q
 lXHKOw3UUqTEFNO4rHWr+j8OIiG9zIFJT5KGX09X+Sewc9iC8y+D7MpieKTAsGi0q+
 UZuffz3flZKIIIQDrOmLx+hWdrEhgvBfNmMf6K+dhKvMF+sS4wY1R5RmEJBwHvGGZK
 /bVfFUdEAvcGg==
Received: from SEC-DLP-QRNT (unknown [10.0.0.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx.inno.tech (Postfix) with ESMTPS
 for <samba-technical@lists.samba.org>; Sun,  8 Oct 2023 22:25:33 +0300 (MSK)
X-CHECKED: 1
X-CHECKED-RELAY-ID: 3c279d7389fa9528e53a55e18b8e1fb6328980c7
X-Cache: 20231008_222531778_00009907
X-MS-Exchange-Organization-AuthAs: Partner
Received: from [172.28.101.15] (172.28.101.15) by MAIL-DC1.inno.local
 (10.0.115.2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Sun, 8 Oct
 2023 22:25:31 +0300
Message-ID: <8d501af6-e10a-474e-80c9-ff9682a30013@inno.tech>
Date: Sun, 8 Oct 2023 22:25:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: <samba-technical@lists.samba.org>
Subject: Authentication Policies and Silos
Organization: Innotech
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.28.101.15]
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
From: Mikhail Kupchuk via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Kupchuk <mkupchuk@inno.tech>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello, Samba developers!

Our team and our client are intrested in implementation of Authentication Policies, Authentication Silos and the rest of "using claims for access control decisions".
In 4.19 release notes you wrote "we continue to develop these features" and I see more and more new commits related to this functionality. Therefore, I conclude that these features are in quite active ongoing development.

1) Do you have some time-plans for releasing them?
2) We have a development team and could take part in development of these features. Maybe we could sync and cooperate somehow in implementing to release it faster?

Best wishes,
Michael.

