Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1BD359774
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 10:15:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=WRfNMLNEvccPie5PyodxOngPPWGDfmNNTNi/qRPf65s=; b=dLplkVcFJjkF9z8zm6BMZ25ntO
	npNE7KMAKlHsNg4FbwQrbpFyinWB7bLoeUjE9G0wGwPL8GDoSk/tPogFiOv8Ea18sFwfKsnEWhdZS
	YwALD4SIvjoxXIp/Bwy55vHZALdgcLpNY57tOxRw5Y4eoBQcTdDZNnuT7UUffQP76kKv4P3fDMfdD
	aaB7pCPEui9WmG5fcshlwP0P1pais0b/FV2WQR5yxwfvaEn7Ikn8SLNRT0nvSR+68QHKVzAGut0Xu
	Yuk9GlIjE0LMgbYZBLB3LoA1eFjQgRcdG9qhC4FxZUHNeNIWR9vsnoB3C3ktz/t3qnju3mFn1Lcb3
	EY6TNJDQ==;
Received: from ip6-localhost ([::1]:56020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUmIB-00Ad0G-Td; Fri, 09 Apr 2021 08:15:04 +0000
Received: from air.basealt.ru ([194.107.17.39]:47340) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lUmI6-00Ad06-IR
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 08:15:00 +0000
Received: by air.basealt.ru (Postfix, from userid 490)
 id 1ABBD589436; Fri,  9 Apr 2021 07:57:56 +0000 (UTC)
Received: from [10.64.129.4] (unknown [193.43.9.4])
 by air.basealt.ru (Postfix) with ESMTPSA id 58CB1589431
 for <samba-technical@lists.samba.org>; Fri,  9 Apr 2021 07:57:54 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Setting up QtCreator for Samba development
Organization: BaseALT
Message-ID: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
Date: Fri, 9 Apr 2021 11:57:53 +0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
From: Igor Chudov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hello colleagues!

I've used Vim+grep for quite some time but Samba codebase is large and 
I'm trying to find a way to increase my productivity. Could anyone 
possibly share project file for QtCreator for Samba?

-- 
With best regards, Igor Chudov
Lead engineer
BaseALT, Saratov engineering department, UTC+4
tel. +7 495 1234-7-99 ext. 549
mobile +7 937 266-51-34

