Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BE1470A43
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 20:22:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=z5qlv/pvuExA4QLxeLtkiJUaLJYtHp8I2YVNtHPtif0=; b=uxeFTi4uT6MdlMyZeMjEFjDzaz
	oH56328/YHwGko6/eZdIemuU5kANJLeERbVs/xAMXbQE5Hw8XMyc4DXWVFebKBwVaUWGksQz9Gg34
	/wdN5qpXBPIMKsY/5+guGMcfFiIGhZpgfNEaGIq63EyUofn4ZvupdkxHCU5ftOjkJ1+bL4TgEWRUx
	j0mjNEiFhQpsblHFifCIrW4VWmqKE+7lAqhvOYRzXhVSqQ2gQrlQDRAELXGUMPMAcgzoWCUpBbn7X
	yL4ohPCW1DIrsI2o1k4HfYY+vqkPd9vIDxOEw6oK96QRUEH1lhRNPysAhbllZ4MQ1OAXljAw6wrrU
	wrwzajJg==;
Received: from ip6-localhost ([::1]:48384 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvlSw-0055tu-Af; Fri, 10 Dec 2021 19:21:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:54446) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mvlSr-0055tl-Ah
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 19:21:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=z5qlv/pvuExA4QLxeLtkiJUaLJYtHp8I2YVNtHPtif0=; b=OXbrvhWmsM/cVtphSRseLSWctF
 0RODwRS3sp5yokjCdLGJIWBeLe+xMO1P94RqTl8y6jcxomzw1TBKr5mlV2wNzEY4Zos1JQiCN7I5S
 /brJtx2uaXuf1RqTgpQ6UxLj+3gkqwR+Qt9FxumEyY3TrdtRu8OGcXptNGVvnKaeUMfuCgUwNaQXW
 MzbXpbqqn+bLyIXcR6RxukcvUqw1DWTxqdtpKU0nImNVfydzGf/kAPBz4oNTBxy+57qNXDIptApKA
 OHv8u/bH2k+AifA9Qgzy0bh/txRz1zQGLIASRpxberVsd1QHFTR4GiftEqHZWVDU4cuXEQloTkJg4
 wcwwlKz+Hut6kA6Nm2NoGThSSDB/1AIBNI8BMRVjnmW1S+aHDvn+yQN27O975U5nmw9hL4KxtNXny
 US4GX1PZgwrWqx2BYLCRVW7KHjL5gmjFr4n7AL0cek08OM8/N2094mSMCpZDkuK8lXJZVTHNR7Wef
 NY2J5PdXSkmOh9bDsg/AIyz3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mvlSp-002DZ5-M2; Fri, 10 Dec 2021 19:21:52 +0000
Date: Fri, 10 Dec 2021 11:21:48 -0800
To: Tom Talpey <tom@talpey.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Message-ID: <YbOozPIABvj60/PD@jeremy-acer>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>,
 Steven Engelhardt <steven.engelhardt@relativity.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Dec 09, 2021 at 03:25:29PM -0500, Tom Talpey via samba-technical wrote:
>On 12/9/2021 1:58 PM, Ralph Boehme wrote:
>>Hi Tom,
>>
>>On 12/9/21 19:48, Tom Talpey wrote:
>>>I really think you need a bulletproof mathematically correct
>>>uniqueid generator here.
>>
>>Patches welcome. :)))
>>
>>I guess all we can get is an approximation.
>
>But, the penalty for a collision is data corruption! It's unacceptable
>to wing it.
>
>Can't TDB help here? Stuff a number into the database and save it.
>Increment it by one for each new fileid needed.

The fileid only has to be consistent across an active
connection I think. Once a connection has been dropped
I would expect MacOS would not expect a valid cache
entry. Using a tdb for this would be very expensive
across a cluster.

