Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 022B4C307F3
	for <lists+samba-technical@lfdr.de>; Tue, 04 Nov 2025 11:26:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=HfYLzPOwdbA2xKnV0XGs40OF5wx18aWE1+wY2l4z+uY=; b=dU6ktLoQmrDbY0f80FqM2waLAn
	m0d4jQ6YceMoGXSDU63tsLKzQ6hcVhf1C9LeN4xHal7tM6ZYOCR+vLTckUo898yq020kkyK7XQLWH
	7pdcLTKCS/+2kZtSGJtR2uwwqvn0sCfM2oCRefZQWqJsb81s0hSPquAXYUjokRoL/wIrYyr68BLmO
	KhAybEhspMxJ4762WRj5xAC0W6+oBnvtKkKX7Iz5DYsBjGbaD1Bxq9vX2a/Kp17sVIueWjCPIeva6
	CD2F82s04zk5Z4+xgefIK641RvX4Ms0tHhrX5b9T5HYZPR/fo0retY7XQ4GcUgakjopuPsAr3Myle
	qPQUafZg==;
Received: from ip6-localhost ([::1]:34148 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vGEEg-00BRpo-R1; Tue, 04 Nov 2025 10:25:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20204) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGEEc-00BRph-RF
 for samba-technical@lists.samba.org; Tue, 04 Nov 2025 10:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=HfYLzPOwdbA2xKnV0XGs40OF5wx18aWE1+wY2l4z+uY=; b=DIdpw22YsBxgvatzuXeuYzSldX
 Zay+kgNQUSCgP9Z/duh+GQYUQutyoHWrl7+JJOBMOiTEKC2BdmFZbCQNYVPrGdGDMHcHp2NQtItkP
 QNVH+LhgMHP+KZt8WdZSAkcrwhL/h8/ORh9yzyWLoaiRkF+l3mv8NOKZ90Sdx0ZKfKLe3WIrs6LmL
 DIYOWXI7Bu8dIPcqWgmFzTgiGadWOFxiVfS4Gp2yRUAPUDF63aVdcUmRxW84spamdiF3GmJCjAdtH
 bj9qVuqQ9GiwH5hma2D76vCRSC7POGTrQ5jjAUwgHCXAfaSNDp/mU0UUirPCQPMqIIQRbFg89F0Iw
 lHkaheDvBstdgw+Y59ta+s4q2JnL7fSgcIFcLoOLY1ZXXrIFHn72QHcR09gHf5GL32KyO12zZoCJt
 gzDe5fiz/VQvhaPh3JD41cL3FYNmEo4ElB1s49jGuzQzt1j+bMaeyMsNfo2ywtD/qUZGMRnIGlrqB
 9ytvEVpPCiZvHixul0aUIZMY;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vGEEb-00CVjQ-2s; Tue, 04 Nov 2025 10:25:54 +0000
Message-ID: <d2990f6b-3ef4-4753-9771-70a2921060fb@samba.org>
Date: Tue, 4 Nov 2025 11:25:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Top 20 developers with open Merge Requests
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <7684109.rdbgypaU67@magrathea>
 <657cef07-c75c-43cb-99d7-78e7ee9bf955@samba.org>
 <11918736.eNJFYEL58v@magrathea>
Content-Language: en-US
In-Reply-To: <11918736.eNJFYEL58v@magrathea>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 04.11.25 um 10:59 schrieb Andreas Schneider:
> On Tuesday, 4 November 2025 10:52:16 Central European Standard Time Stefan
> Metzmacher wrote:
>> Hi Andreas,
>>
>>> together with Claude I wrote a little python script:
>>>
>>> python3 /home/asn/junk/gitlab_mr_counter.py --top 20
>>> Fetching merge requests from samba-team/samba...
>>>
>>>     Fetched page 1 (100 MRs)...
>>>     Fetched page 2 (100 MRs)...
>>>     Fetched page 3 (21 MRs)...
>>>
>>> Total open merge requests fetched: 221
>>
>> Is there a --no-draft or --only-draft option?
> 
> Let me chat with Claude if that's feasible ... ;-)
> 

--only-older-than= and --only-newer-than=

Would likely also be useful :-)

Thanks!
metze

