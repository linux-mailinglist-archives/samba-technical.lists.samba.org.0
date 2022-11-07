Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7C661F006
	for <lists+samba-technical@lfdr.de>; Mon,  7 Nov 2022 11:12:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=k8x9SQoZ69TGpyOsHd4wp9dWIU3va/fVMjRn0dd8r7E=; b=UhZNFlXi5n15quPVaPpquXEMG+
	mgfyJyFclGsFbU2frc0XAq9O8U6tiU9ygDsm9VtM+vkU2vc9Z2NEdt0Mbon8hbEwlCDShqNTPhi7l
	GlgN9Xo5W//612o/hxIkVUXWGw0SCTDRvMCQaJ50OtGekpwViTmz2mmH2HPf2CPkZ0DVqicKS/bT7
	uQc7ippUiPSFoHh6w7I4ivCPHoGOWl7TGjjhCE80yyNfXHZen3bVbkeuuJe8u8dqxS3jclZKs9TTF
	pv3tqs0Ru6M7GJNa+7CMuDvCLf7Q0idttCT8zdHKtLpAyE99RI70xvUyecxpbPiifzrMcavwJGZ2I
	ytR5SF0w==;
Received: from ip6-localhost ([::1]:37778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1orz79-00BGWD-7Y; Mon, 07 Nov 2022 10:12:23 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:35509) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1orz74-00BGW3-HS
 for samba-technical@lists.samba.org; Mon, 07 Nov 2022 10:12:20 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 962AD40010;
 Mon,  7 Nov 2022 13:12:15 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 8EBA43D3;
 Mon,  7 Nov 2022 13:12:20 +0300 (MSK)
Message-ID: <bdc745cc-4e05-29d5-45c8-5b9a96baa7a6@msgid.tls.msk.ru>
Date: Mon, 7 Nov 2022 13:12:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: samba-tool gpo listall failing - what's going on please
Content-Language: en-US
To: Matt Grant <matt@mattgrant.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <CAHA-KoNnFFXfyB=vR-2F6oooTnGcPVHafQOVKQDpQjaDJa-0-g@mail.gmail.com>
 <CAHA-KoPuf=VhT4N_km-G8cnEzYDOVv42C7Yi8BOTw+heRHLJRg@mail.gmail.com>
 <CAHA-KoPL7+N=BZz6a+6ZU_QPqjrDi9BO9dfeStNJD79DVW0dkw@mail.gmail.com>
In-Reply-To: <CAHA-KoPL7+N=BZz6a+6ZU_QPqjrDi9BO9dfeStNJD79DVW0dkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

07.11.2022 08:01, Matt Grant via samba-technical wrote:
..
> - uint32_t a_num, total;
> + uint32_t addr_num, total;

There's no need to rename this really. "a_num" just as well can stand for
"number of addresses" like for "number of A records". This way the patch
will be just a one-liner.

[Caveat: I'm not a samba developer, but I'd do it that way myself]

FWIW, I'd still avoid ipv6-only network, at least internally.

Thanks,

/mjt

