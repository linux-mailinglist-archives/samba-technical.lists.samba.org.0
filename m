Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C48B2706B
	for <lists+samba-technical@lfdr.de>; Thu, 14 Aug 2025 22:53:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=9N3vPpzzEdkPkMCvxw7gNPdJNuVyc0YYWFri13f9VbU=; b=L5neU4uvTYxw5cIfv3zIKheTfo
	zCy1oPOKfEMmjUUmo7rJ3bSD1p1q1wLHe5OYtCEKPWwhd4mX3kZXI15uYwhoTEJl7M5ZQK2kNXHQq
	DdXOUs2ug48SZSbWs/U4YLIX2M5/JzMdzS1qHv0j2QBUD2+5VmI0c/BNUuOjSzXsX1K9Z7AB1DRYc
	FYANtr4We3yBqmYxl+nWNv46+tcatK2WTqBnXa8i93ZHRfJRVeY7tuNMQNXSihcBTgtxqqQysNy/A
	3URb3h8SXA70vX1HuDeXiXjHK2nnHWoRcv+4fACu/YwyAkyzfH3x7btJcj1ffxW5EnQ5hBajLMv/d
	TZ1H7XoA==;
Received: from ip6-localhost ([::1]:55858 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umewo-00F245-WC; Thu, 14 Aug 2025 20:53:19 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:36862) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umewj-00F23y-Rr
 for samba-technical@lists.samba.org; Thu, 14 Aug 2025 20:53:17 +0000
Received: from [192.168.68.51] (unknown [114.23.145.136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: gary@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 384243FCE8; 
 Fri, 15 Aug 2025 08:53:06 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1755204786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=9N3vPpzzEdkPkMCvxw7gNPdJNuVyc0YYWFri13f9VbU=;
 b=f9F2BPVsDv4gud33HG26NB85Vh4X1P/ZVMu8qc5RPMKZjBbPqEFAMH5t16YB6G1ywL+2+A
 LAls4Pqduq/WvikKjL6gvTtoSfI2G7hoBS4cHnOyU6AGIgZ43kVl292CXz1UjwA/GSQnEV
 TV4P//PRsdf7wovj6SnIfjHNFT//jh5KT+CajLOQ5DnZgjCopUuf7vom5X4AWWaLtu9Zom
 kytY/Ky7jx0pmoBEF1I+qamFPGjNfO/2o0Qmgg5sLJgsMdl+BhObMx5SpAMTW256r1NVwa
 TPg1g3rYfjuR6E7It7Ym8hxVRA+xDqWaK2lEaA5FCppN5iia04lgmtIg8YrBpQ==
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=gary@catalyst.net.nz smtp.mailfrom=gary@catalyst.net.nz
Message-ID: <7c750f6e-1dac-4022-b818-2e19eb53e14c@catalyst.net.nz>
Date: Fri, 15 Aug 2025 08:53:04 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: third_party/quic_ko_wrapper/quic_ko_wrapper.c uses vla in struct
To: Stefan Metzmacher <metze@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <c8670964-a318-429e-a73d-da6cf132f32f@catalyst.net.nz>
 <9d5d9f41-019e-4339-81c9-62211feeb1f2@samba.org>
Content-Language: en-NZ, mi-NZ
In-Reply-To: <9d5d9f41-019e-4339-81c9-62211feeb1f2@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.10 / 15.00]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 ASN(0.00)[asn:56030, ipnet:114.23.0.0/16, country:NZ];
 MIME_TRACE(0.00)[0:+]
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


On 14/08/25 6:05 pm, Stefan Metzmacher wrote:
> Hi Gary,
>
>> When I try and build current master with clang-20 I get the following 
>> error.
>>
>> ../../third_party/quic_ko_wrapper/quic_ko_wrapper.c:3523:11: error: 
>> fields must have a constant size: 'variable length
>> array in structure' extension will never be supported
>>   3523 |                 uint8_t cmbuf[cmspace];
>>        |                         ^
>> 1 error generated.
>>
>> I believe this is a non-standard extension that GCC supports, is this 
>> something we should try to get fixed upstream?
>
> Maybe we can just remove the union and alignment thing and match what 
> we have in
> swrap_msghdr_add_cmsghdr().
>
> metze

Assuming we don't need the 64 bit alignment, that makes sense. I'll give 
it a try today.

Gary

-- 
Gary Lockyer
Catalyst.Net Limited - Expert Open Source Solutions

Catalyst.Net Ltd - a Catalyst IT group company
DDI: +64 4 123 4567 | Mob: +64 21 123 4567 | Tel: +64 4 123 4567 | www.catalyst.net.nz

CONFIDENTIALITY NOTICE: This email is intended for the named recipients only. It may contain privileged, confidential or copyright information. If you are not the named recipient, any use, reliance upon, disclosure or copying of this email or its attachments is unauthorised. If you have received this email in error, please reply via email or call +64 4 499 2267.


