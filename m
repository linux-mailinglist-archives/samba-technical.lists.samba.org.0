Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DED846F35E
	for <lists+samba-technical@lfdr.de>; Thu,  9 Dec 2021 19:51:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=iEBnwksg52CfoHzOD7RrzG8BWkUHKMi0BqnYxIyu+js=; b=vD9jvo8scemNxfuGVJZh0bXiZZ
	MhJvXNxF0S1iryTqAmUmxCxWt8Sbn8YsPMKra9k903bxUDLcYPxGcle3UAEWLT4QtbFntFi/VuLCO
	bRxm4MjLolRuFiAX8yPQKu8gmyQSWmcuL7oQ4Cod11Jr/x1bQoGbg4cmNVoB4nLRFd0XkyvlryVHQ
	azqcDnbpUN/yNzk4/+nn+pD4W28BmZqFtmLXdWc2cSbIAZ1KA2TV2ct0AeNSjwWzBEVJhfnj78SQW
	kVAQCijpYnCXEzT/EJ8sef7Yq8g73x9y7pnQx9TAopWTNNm99bbqEce7YOuSgaXdBKpqM4er5eIz5
	2znriCAQ==;
Received: from ip6-localhost ([::1]:32932 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mvOV5-004eSD-Ug; Thu, 09 Dec 2021 18:50:39 +0000
Received: from p3plsmtpa09-03.prod.phx3.secureserver.net
 ([173.201.193.232]:42983) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1mvOUy-004eS4-Fy
 for samba-technical@lists.samba.org; Thu, 09 Dec 2021 18:50:35 +0000
Received: from [192.168.0.100] ([98.118.115.249]) by :SMTPAUTH: with ESMTPSA
 id vOSimQ1WDH63LvOSimByQf; Thu, 09 Dec 2021 11:48:13 -0700
X-CMAE-Analysis: v=2.4 cv=A9ypg4aG c=1 sm=1 tr=0 ts=61b24f6d
 a=T+zzzuy42cdAS+8Djmhmkg==:117 a=T+zzzuy42cdAS+8Djmhmkg==:17
 a=IkcTkHD0fZMA:10 a=6xzFW5Iq4Z6wIZpSK88A:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: tom@talpey.com
Message-ID: <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
Date: Thu, 9 Dec 2021 13:48:13 -0500
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
In-Reply-To: <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfED0kcVRvirDY6ym3luS0vlhqXA3jIJc4hojOrBtn8k0ic1gDNdqigECQamLs2CITtiLJuyLVmPyiTFpQW3i3dvPDJIwNUZXDXFVouPMBTfn8nZeK4uD
 Mflm1epjhElOezAyGMsYDtbXL9ZXwcPq+aHJFw4EuDtjqy2t1IDjyqcnpQ1o1V3u7avjkggbfP2N4/mWSmil+R+uF2J8dGgKm+JNqtw+dgZFxpmcJ7gs53tP
 JymDtkpEosqobTN40nVzd0IvpCW1LyTMXM4utO1tFOk=
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

Yes I was referring to filesystem timestamps because you had
mentioned mtime ctime and atime. But I have a similar concern
with hrtimers, because they are so hardware dependent. Older
hardware may not have one at all, and even if present they
uniqueness is only assured in specific narrow contexts. For
example, they are per-socket so high-scale architectures can
introduce anomalies if the thread is migrated. They're especially
unreliable in virtualized environments. And the timespec struct
exposes them with nanosecond granularity, which is pretty wide IMO.

The clock_gettime manpage has more than a few caveats:

> NOTE for SMP systems
> 
> The CLOCK_PROCESS_CPUTIME_ID and CLOCK_THREAD_CPUTIME_ID clocks are realized on many platforms using timers from the CPUs (TSC on i386, AR.ITC on Itanium). These registers may differ between CPUs and as a consequence these clocks may return bogus results if a process is migrated to another CPU.
> 
> If the CPUs in an SMP system have different clock sources then there is no way to maintain a correlation between the timer registers since each CPU will run at a slightly different frequency. If that is the case then clock_getcpuclockid(0) will return ENOENT to signify this condition. The two clocks will then only be useful if it can be ensured that a process stays on a certain CPU.
> 
> The processors in an SMP system do not start all at exactly the same time and therefore the timer registers are typically running at an offset. Some architectures include code that attempts to limit these offsets on bootup. However, the code cannot guarantee to accurately tune the offsets. Glibc contains no provisions to deal with these offsets (unlike the Linux Kernel). Typically these offsets are small and therefore the effects may be negligible in most cases. 

I really think you need a bulletproof mathematically correct
uniqueid generator here.

Tom.


On 12/8/2021 10:36 PM, Ralph Boehme wrote:
> Hi Tom!
> 
> On 12/8/21 22:18, Tom Talpey wrote:
>> I have to say that I'm siding with Steve on not using timestamps,
>> even with a monotonicity salt. They're terribly old-school and
>> for good reason. If you want reliable results when running on
>> everything from embedded ARM systems with FAT (2-second granularity)
>> on an MMC card, all the way up to servers with PMEM (<<1us access
>> time) and networks with 100+ Gbps pipes, timestamps will be
>> whack-a-mole for many years. MHO.
> 
> I guess you are referring to filesystem timestamps? I was suggesting 
> moving away from that and using system high resolution timer, not 
> filesystem timestamp. That's what we're currently using which seems to 
> break on certain filesystem with too low resolution. We've been using 
> the inode number before which has its own problems due to inode number 
> reusage.
> 
> -slow
> 

