Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1762A400E7E
	for <lists+samba-technical@lfdr.de>; Sun,  5 Sep 2021 09:06:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=0VTx1iIPPvLxZOboVcl0ffS+MYGRW0mhJFRer4K1Dyw=; b=E6EV91lkudkgYXPjvduNA74WkJ
	YShtlWEc1zNINg/wokU9N7ScGbPK/yx5nhOXGmgP2AqiIDk3x8cZ2nZMLonzCZRGDs47GmFjFLRm8
	2Pl7KoWp9TnKpVtLNlrKgdbVPAYI072pIE2R6pv7qG2jM4dyqihNfBT6gkz+N+HP545CTpBtTzg3M
	V2wKMHsmIi6+RZcpxay5EUQnIg/cXh3ddgvg64yoDfQh8yVc3L2UgjvN+viRrYVbEpbaVn1OWBlk1
	C+eH0KcwOUz0kLrgs9FP715ojfVDngy0KkFzkDV21We0PPSao+ZytnPYDvSw4JpU4HOev3Q1F0Wp8
	H2Sw5nSQ==;
Received: from ip6-localhost ([::1]:27020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mMmEb-00DOHa-1W; Sun, 05 Sep 2021 07:06:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62112) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mMmEU-00DOHR-FK
 for samba-technical@lists.samba.org; Sun, 05 Sep 2021 07:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=0VTx1iIPPvLxZOboVcl0ffS+MYGRW0mhJFRer4K1Dyw=; b=ehoP5JsywK+fLvv9gR00GTv4Hw
 NX8wFcYpzv8J1pez0ZtHB9blasdH6PS0HW2bfZaZv0j8TEesdlSJRcYYWv/cLtMzVTXbr8MIjLd4y
 BqjFCD5sv51a5x63fBN8A+EUBQet3XL+0gPGXlmUunqpTV/tPYW8PBjy7aYNS9It1mB80KeirnjLd
 yqjrkSiqFLVJ9tOkNEbUvlqVfzLHRI3aJwYKIptAvEtF0ibca0f7m9F76s/IzNdxo2c5ThzAs+7ar
 Fnre5vpSpmXo32/VSaVFItwLRxt7ZuFoZ3OB7MaDzvXOVQhhZoMthDLYJUTO3mgyT60rnnflq5o5G
 xUcyiwRhp+jcY7k8SoXw3H9MTx3S3OIWXA19ltNuxBGVKxLOLVlC4cGlGZ1gzddwqDmQMYFhZq10j
 9NF7incIjwS38/PMTMggkQE+5Ab+J8DxEQoUIrv3NXUybl83M6nrUKN6SHPFErd61msY1Kw2Urdbe
 B90/JT02dqN2nuaH3aksHrmM;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mMmET-004ivL-4e; Sun, 05 Sep 2021 07:06:25 +0000
Subject: Re: OSS-fuzz needs some love
To: Andrew Bartlett <abartlet@samba.org>,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
References: <599cb100381a83de23ae9db47e3fa55eb87a7f13.camel@samba.org>
 <b4086e94339753e8ee26d4443f4924b7889ee9dc.camel@samba.org>
 <2fc73976-5505-cbb9-7341-10c323b7a095@samba.org>
 <f2b1e57143e2fdfc2865de71412399d7c156333a.camel@samba.org>
 <b316c4a8-23e0-b35d-033a-5176a271ba4b@samba.org>
 <96071d4c-2d37-7f33-0700-897d46b79423@samba.org>
Message-ID: <704feea0-2c42-4ef7-ff68-5a083fe2cd35@samba.org>
Date: Sun, 5 Sep 2021 10:06:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <96071d4c-2d37-7f33-0700-897d46b79423@samba.org>
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/5/21 9:59 AM, Uri Simchoni via samba-technical wrote:
> On 9/4/21 1:30 PM, Uri Simchoni via samba-technical wrote:
> <snip>
>>
>> python infra/helper.py build_image samba
>> python infra/helper.py build_fuzzers --sanitizer address --engine 
>> libfuzzer --architecture x86_64
>> python infra/helper.py check_build --sanitizer address --engine 
>> libfuzzer --architecture x86_64
>>
> 
> That should be:
> 
> python infra/helper.py build_fuzzers --sanitizer address --engine 
> libfuzzer --architecture x86_64 samba
> 
> python infra/helper.py check_build --sanitizer address --engine 
> libfuzzer --architecture x86_64
> 

Drat! damn copy+paste...

python infra/helper.py build_fuzzers --sanitizer address --engine 
libfuzzer --architecture x86_64 samba

python infra/helper.py check_build --sanitizer address --engine 
libfuzzer --architecture x86_64 samba


