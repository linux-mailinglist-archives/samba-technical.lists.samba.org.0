Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEF546DDFB
	for <lists+samba-technical@lfdr.de>; Wed,  8 Dec 2021 23:03:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=9bcucxe5NTFSp6ukAi0nP88vBhggBfeYwpWyFwBWVKE=; b=auP4d/3JfydXup/geEMwmUA3O8
	Ua8czRhakF2F8G9jBcGBytTBq3WhqBcwngJt8hdr7+IhSd99RVNrmiP5+JTLF5JNymvmrVyZwe5Aj
	JR4kAYA3Xvn4DJYslelFDcOSosYUu0mP3l/6LhTAPscHRTeWT7w1yCo/xYqUxRid6rt5bWByQaVLh
	ArP7zH5JPc4bdWJnhxPkc2ZNWg29D+GrCPW8x/Umd4dQ4064pQYf/cyqnrMnBl6Xb0vqKcX2CYpWP
	523gyF9SVFmZt1wk7nLevikOTMUB6IRk9vMuQHXcst1K5oxnVyErQZkt07jL+UtICu/wOJrW7guWz
	TPvBgvyA==;
Received: from ip6-localhost ([::1]:48756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mv51X-004PxL-DA; Wed, 08 Dec 2021 22:02:51 +0000
Received: from p3plsmtpa09-09.prod.phx3.secureserver.net
 ([173.201.193.238]:58946) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mv51Q-004PxC-2q
 for samba-technical@lists.samba.org; Wed, 08 Dec 2021 22:02:48 +0000
Received: from [192.168.0.100] ([98.118.115.249]) by :SMTPAUTH: with ESMTPSA
 id v4KRmoUsPjHgNv4KSmWppA; Wed, 08 Dec 2021 14:18:20 -0700
X-CMAE-Analysis: v=2.4 cv=LM2j/La9 c=1 sm=1 tr=0 ts=61b1211c
 a=T+zzzuy42cdAS+8Djmhmkg==:117 a=T+zzzuy42cdAS+8Djmhmkg==:17
 a=IkcTkHD0fZMA:10 a=JqEG_dyiAAAA:8 a=S7LNXbijaLDHmeZnjoMA:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: tom@talpey.com
Message-ID: <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
Date: Wed, 8 Dec 2021 16:18:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
Content-Language: en-US
To: Steven Engelhardt <steven.engelhardt@relativity.com>,
 Ralph Boehme <slow@samba.org>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
In-Reply-To: <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfC77L1sgYi5Xoc9If/NnSTRTzJl2JTnvpRNaipGhs8IDT39QSXx1g7RjQTgP1xXewExszne4NcoMyfONsVIMSCm5vFGjR8FbOOqTJmaubsdPB5rxe0h7
 HUKHqqVRP6QCmg+xcxfe3vuxmrbU8KmBSud2E4q4IeGo0mITwcwYtvZzLDtg3Z8cBPciErvhWz8Xd9r4aVhLMOqUbtX8WgrkfIq+I4wdKerQXUnHljF1T9m+
 P0pCxiCgSwz3mueDoRhEpIhxhuQ/t5grwskgOWEIZgw=
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

On 12/8/2021 3:08 PM, Steven Engelhardt via samba-technical wrote:
>>> We would appreciate any guidance on the correct long-term resolution
>>> of this issue.
>>
>> It will use the oldest one of atime, mtime or ctime. What is your servers's filesystem timestamp granularity?
>>
>> Can you share the result of running stat cli command on files that triggered the issue? Or just generally share info about your filesystem and its timestamp granularity?
> 
> Sure.  Using the statres tool (provided in a previous email):
> 
> Estimated stat.st_mtim (and friends) resolution:
> 
> Ubuntu 18.04 on an Azure Standard_D5_v2: 0.003999954s
> Ubuntu 18.04 on an Azure Standard_DS5_v2: 0.004000163s
> Ubuntu 18.04 on WSL2 (used for local development & testing): 0.010000000s
> 
>> I'm thinking that maybe we should just use the current time for the  itime as returned by clock_gettime_mono().
> 
> Sure, but a notable alternatives include pure-random or something like Twitter's Snowflake
> id generation algorithm as in https://blog.twitter.com/engineering/en_us/a/2010/announcing-snowflake.

I have to say that I'm siding with Steve on not using timestamps,
even with a monotonicity salt. They're terribly old-school and
for good reason. If you want reliable results when running on
everything from embedded ARM systems with FAT (2-second granularity)
on an MMC card, all the way up to servers with PMEM (<<1us access
time) and networks with 100+ Gbps pipes, timestamps will be
whack-a-mole for many years. MHO.

Tom.

