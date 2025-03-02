Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A95AA4B581
	for <lists+samba-technical@lfdr.de>; Mon,  3 Mar 2025 00:36:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=JKWzAPGdSXhV4Gu1MBho+zFn5xI5F/+k2Lv44sab8lM=; b=EPsynCaHuKLU5u8QH2XaS5FI28
	pdSMF/X0p3bnuG4tMaBVu2TkyTI+o5+Ov7sR+rAqdTYuRq942PRvCH5V/SXw0fbRW1b7+clGBbey0
	EMZQEftCdsSnmYuY3BWRuB5HsvQfnZqA8MQBYCcsT6TfpZSNQG1stfDr8q1wr4KeIDUSkmVnFbuAq
	gMgBANm7rYHwr//LPy6tD2MObrKnOPZIsHgXrjxMEGSG2OjL2HQ4fgbeWyJkydcB2G2o2XTCqNbzq
	oeIcWxoBUppDqfzh5FyqjhIiK+FUGLuv6CWJJL91vO9DJzxUhq75kc0s5PwEDzoJlnKsELnEb7pnq
	DyQWygUg==;
Received: from ip6-localhost ([::1]:24834 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tosqI-00FS4T-MN; Sun, 02 Mar 2025 23:35:30 +0000
Received: from cat-porwal-prod-mail11.catalyst.net.nz ([202.49.243.52]:55096) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tosq9-00FS4L-34
 for samba-technical@lists.samba.org; Sun, 02 Mar 2025 23:35:26 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail11.catalyst.net.nz (Postfix) with ESMTPSA id 0EACC2F0
 for <samba-technical@lists.samba.org>; Mon,  3 Mar 2025 12:35:11 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1740958511;
 bh=JKWzAPGdSXhV4Gu1MBho+zFn5xI5F/+k2Lv44sab8lM=;
 h=Date:From:Subject:To:From;
 b=uB5BavJASER7n3hD8bVHRS8iHpM/skIp+gq2Pv0lrKvemIl/9YpRfmQ7dVp/9ey3E
 AXRpuPxpT9MrxGendtx9xQVTtW8BwLJyZtO1JZq2ZGD6KQ6knLm2yct2NNFwXkk3Yf
 lPKs5Eladk88EdZyfjauYPj1GuikJIt8cE3YUWy2yr64vYpToidIjv/VeA8b+hEms6
 SZngDFEvm+4cCacHEF662FHrtQwg9cxiCI/U6VsN5VYWJMtxXO7AmmPP8SNKn+gwnC
 V+jfFA+kAHT91ZHuyWLKulNVj3VANq28m+/YqJZpNKvxLvFUXcqpWXHRQbggmM+dDW
 sELNodOEIKt9w==
Message-ID: <e21773e7-9e6f-4b1c-af21-73e52566de91@catalyst.net.nz>
Date: Mon, 3 Mar 2025 12:35:09 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: ldb sqlite backend
To: samba-technical <samba-technical@lists.samba.org>
Content-Language: en-NZ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I quite like the idea of the ldb sqlite backend, even though I don't
exactly know what the idea is.

But it is very dormant. The ldbedit man page says we can use

 ldbedit -H sqlite://filename

but as far as I can tell this has never actually been true.

We have been dutifully maintaining it, but it seems to be over
15 years since we made any effort to actually improve it.

Should we perhaps just delete it?

Maybe this is a dangerous road to start on.

cheers,
Douglas

