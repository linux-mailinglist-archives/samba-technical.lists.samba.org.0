Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B717346F4E9
	for <lists+samba-technical@lfdr.de>; Thu,  9 Dec 2021 21:28:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=SSPeNIsoVT+nPmwKNl7EGY4r50cFEJSXi3nNxljIzW8=; b=Miw1ZTF6DOpTAn08xwxXREqy8G
	JwhNmfF3MG/ZUeugNrjcKnw5ZUcsJ0gcH6p4K0fG133c+lEAXGQVIMke9Rb7+aLHj+9hfDm4qbX9Z
	MZZln7hVT/fPORPBSOmvSMI+XrM4G72u7rqcO4vjHUwK64ELiC1ZWm7twa5pkObQ3O6w08nC4EMRQ
	1knaT/5fxO8+TdTMWj+WfULJSSq03Fe+8f7+LWK2VbnrbSE1382l0gHn5mIcM7qBYUFlHrUOJaCuU
	hwy/GC6YYi1eTppj61I7YIRuIpL8deZif1cXHyEE2oK5fM8pXFjAk4Of+e4ROZWmHB2lQwRob/KTh
	9k7FndtA==;
Received: from ip6-localhost ([::1]:42244 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvQ1D-004iNo-De; Thu, 09 Dec 2021 20:27:55 +0000
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
 ([173.201.193.232]:38488) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mvQ17-004iNd-EN
 for samba-technical@lists.samba.org; Thu, 09 Dec 2021 20:27:52 +0000
Received: from [192.168.0.100] ([98.118.115.249]) by :SMTPAUTH: with ESMTPSA
 id vPyqmQoqVH63LvPyrmCBjZ; Thu, 09 Dec 2021 13:25:29 -0700
X-CMAE-Analysis: v=2.4 cv=A9ypg4aG c=1 sm=1 tr=0 ts=61b26639
 a=T+zzzuy42cdAS+8Djmhmkg==:117 a=T+zzzuy42cdAS+8Djmhmkg==:17
 a=IkcTkHD0fZMA:10 a=DcKX1d7i4LGu50DVRdsA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: tom@talpey.com
Message-ID: <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
Date: Thu, 9 Dec 2021 15:25:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Ralph Boehme <slow@samba.org>,
 Steven Engelhardt <steven.engelhardt@relativity.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
In-Reply-To: <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfBdbXRQyq3zb3uBqsRvC4uN9+ylfasZZFkHEap72t/w70hl/owk4hbZ4HFkTi/U+JIE5oQj/R+jb4a6Lyd0pfA6wHQngg9LQxjluq218AU6SzTrlka8l
 BPxGjBXDlXfnCSDGEkNCbCiGOvWjFHKOVbscBdcxV8MIpOzsSpqHCu0zQcQu+J2G0kr4apDt3Z3NRw5Tfitpn+Re2rnYKKrkqD8iINljZgyskDTBTQFy4P1a
 YHD4tFvXVJjBN+k2KyB+COj8pRFhPCUH+Ks8MuO8SpM=
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 12/9/2021 1:58 PM, Ralph Boehme wrote:
> Hi Tom,
> 
> On 12/9/21 19:48, Tom Talpey wrote:
>> I really think you need a bulletproof mathematically correct
>> uniqueid generator here.
> 
> Patches welcome. :)))
> 
> I guess all we can get is an approximation.

But, the penalty for a collision is data corruption! It's unacceptable
to wing it.

Can't TDB help here? Stuff a number into the database and save it.
Increment it by one for each new fileid needed.

Carve out a hundred, or a thousand, so you don't have to do a
transaction every new handle. Increment that by the carveout for
the next call. 64 bits will last you forever, so you could even
use it across server restart.

Make it fancier, if monotonicity is too easily forged, or misused.

Tom.

