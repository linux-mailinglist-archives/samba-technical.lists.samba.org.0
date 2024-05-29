Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FEDC8D2984
	for <lists+samba-technical@lfdr.de>; Wed, 29 May 2024 02:40:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=o9CwId0xnwx3hHWV1wZL+nCUMqk07WiWz1DrZM7MP38=; b=YaLGSwABheiv3erOVda8D9xRTX
	bIJcWCfEJQ+EdJvGtV6krRZOpvgZKOr4bGGPBJcJyteImpMPGXdvbAmX0Ifg5nBD0ErDOTDwHBhdV
	rJhnIG5ZMv/eH6+SMeuwGlLlAkIHzxfbpcwWdi9KOqVhGlr0mcLUHw/nZw6mAABh+utKdURxz8FnI
	xueVodX66Qj/ueH7Cw/dxBipBPSuDUL/yF9uXA6k3Dn0l2XML/qM1pykmBMTQSjt9JKTJ6r7+mv+v
	/XC84gE6iLTD552nVfA8OSSFxKG4Negunubqp3zlsbpCEqkVTnXlX0A5Q+JExX5w1ihLTeVIj4kH9
	E8CGomQg==;
Received: from ip6-localhost ([::1]:63020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sC7Mc-00ACAJ-E9; Wed, 29 May 2024 00:40:22 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:50316) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sC7MO-00ACAA-Ve
 for samba-technical@lists.samba.org; Wed, 29 May 2024 00:40:13 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 6AF6E3FBC6; 
 Wed, 29 May 2024 12:40:02 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1716943202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o9CwId0xnwx3hHWV1wZL+nCUMqk07WiWz1DrZM7MP38=;
 b=VWEjzH5R7z9bgAUT9WK2pA3KNPSqfnaQLu+U55GCXTnfkgpFXJC5ZVlPTBecmtlW6V8g/2
 zKUV0fXhsL38PLIWdNHLBXW6aj4OpQxAGJ+OXRax0EfrYbX68alTcvIf4b9gF9/HB9w0Ko
 osZ4Ee+JmFdQeG1MregH+fR+KnZZLUhPzbvE/kljWJKh9ddNPR3UwxLf3RLa3ygN8TVedA
 N1IH3knoKqoAfaJiRdROBaxAVpibMjN7cbyRppfecB9bOzWCC3Ig512UuWe/6IVBz2lf+6
 vUgGfF3AdF832GJrHo8wUXMdbO8iSYNm4R0GGmpWPPCG4nRKTMOAI/rSxrYiQA==
Message-ID: <db7e729b-ee1d-45a1-b93f-23e229c8db22@catalyst.net.nz>
Date: Wed, 29 May 2024 12:40:00 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Regression: ldb performance with indexes
To: Andreas Schneider <asn@samba.org>, abartlet@samba.org
References: <4856178.OV4Wx5bFTl@magrathea> <2262962.t9SDvczpPo@magrathea>
 <2090201.YKUYFuaPT4@magrathea> <5597028.rdbgypaU67@magrathea>
Content-Language: en-US
In-Reply-To: <5597028.rdbgypaU67@magrathea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-30.09 / 15.00];
 LOCAL_WHITELIST_IP(-30.00)[202.78.240.7];
 MIME_GOOD(-0.10)[text/plain]; XM_UA_NO_VERSION(0.01)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_TRACE(0.00)[0:+]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 28/05/24 23:56, Andreas Schneider via samba-technical wrote:
> On Tuesday, 14 May 2024 16:31:53 GMT+2 Andreas Schneider via samba-technical
> wrote:
>>> Using a red black tree doesn't solve the issue:
>>>
>>> $ bash repro_dev_ldb.sh 10000 indexes
>>> RED BLACK TREE
>>> RED BLACK TREE
>>> RED BLACK TREE
>>> Added 2 records successfully
>>> RED BLACK TREE
>>> Added 10000 records successfully
>>>
>>> real    0m9.299s
>>> user    0m9.212s
>>> sys     0m0.263s
>>>
>>> https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/asn-ldb
>>
>> The thing is that those subtrees have 4 entries, with 10000 entries we walk
>> 4x10000 so 40000.
>>
>> This needs to be optimized. As dbwrap_rbt is similar to tdb we share the
>> same problems. Those could be removed if a real rbtree is used.
>>
>> So someone with more ldb knowlege should look into this. I dunno if we
>> always need all those 4 entries and are then overwriting stuff or if we
>> always traverse those 4 entries but don't have too if we found the one we
>> need.
>>
>> With two rbtrees we could just push nodes from one tree to another. It is
>> just pointer that should be fast. Allocating memory and traversing is
>> probably what makes it so extremely slow.
> 
> Andrew,
> 
> any comments?

I might be able to look at it soon.

Douglas


