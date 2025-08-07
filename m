Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E301B1DAAE
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 17:17:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=B5pYJYXbZ/f8P5SI1zJTYLoYcfVzbt8xnzdoq+MkKLM=; b=o6adsVT3QVT+YUS/ji3SH4RhxF
	dYdBm8Z5Tqg2TI9ioTUGV4th5gHWBVI+uV8UN+ImnIhwiFKOAL8E9NacBJbcMYAuF6jA4kr+Atms/
	rqlsKziHXE+8A0PfbBNrbb1E22Szz+aLcps1ULxuRXikRXbrcLQvrO3RcrawPxe/xCN9dLU1EdVFN
	UVrpvv9Yp6SI5OmFxbgLXoa0FfpzwmLUD0n53ibEOH1NhMzb4JOMl0wPWIGd3xuHVRYSwR2QPY/p2
	pc6CqGKtYVRE4onCmpXh48nOxv2wbubquQZHxNPURFyecQkDJKKHFYca1iWASE3/hKMRvOPq+9X5G
	r3Oxg/Rw==;
Received: from ip6-localhost ([::1]:24064 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk2Mg-00EXQC-UP; Thu, 07 Aug 2025 15:17:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43964) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk2Mc-00EXQ5-Tx
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 15:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=B5pYJYXbZ/f8P5SI1zJTYLoYcfVzbt8xnzdoq+MkKLM=; b=ObfV2YaiIA2zwrCoBnl7cq3Q1H
 xQTLMGcrCwgGqq6iic5RUuIdAcqv99iHfOeRUZpYe2jv6J5ve6I+wm6434J0Vv8VoBiQa7zIosX+W
 vCKeHCuEavqv2nHN4pKRK25hL66beItY+3hDQoJrb+GhyNMa+uTYAAby2NpmpUFfi5Zt8IMaFP9pr
 i82R4kTOJcEAeAd4qobxIwsLvjXo/gP+kE2nOF+4ZsIvpGPXlTNz6+ueYk6ccLwLVHwKrurHk4IAe
 Y/4JDdMFyackF2VGSgI3GlrlrXfHmtuoddlq7uLU/5QVgE4B13ktctdAJHO/oP+EH+ja5n3a7HW+q
 jh8vkJTeQRxfS2hmANST86aLqsBAjX2FmK2MUBCxHgCvWeGbFP2lyhdpwRP8qfEGKD8LTmJkhMT3v
 kG1F0uGm6jUMI2YyAlgWxgoRvYVTTNPHgi5NTjKxgZnBu0vNTQ8fgIKy3kYaqnLt1nvpTzjgTeFo+
 1ZkpJhLXZAONYhn4Hg/UUqK9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk2Mc-001bnC-0S; Thu, 07 Aug 2025 15:17:06 +0000
Message-ID: <e685f670-d994-48c2-8913-57358f0f9ad7@samba.org>
Date: Thu, 7 Aug 2025 17:17:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Using smatch and sparse together (Re: [PATCH next] smb: client:
 Fix use after free in send_done())
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <aJNASZzOWtg8aljM@stanley.mountain>
 <ad2e9d94-2d95-4351-b800-627f20672209@samba.org>
 <87646c67-78b8-41c5-9b72-361cb3b733d1@suswa.mountain>
 <e291d925-bfd9-4202-b5d4-de5bf30ab870@samba.org>
 <a1a0046c-f47f-4e8a-ae3c-85db58a6cb2f@suswa.mountain>
 <df4905fb-933e-4055-8363-d6427515773b@samba.org>
 <d3b63d25-1b03-4c7c-85cc-efd9d74c3a8a@suswa.mountain>
 <aa65df64-68f1-47bb-ab69-9817387f3ab8@samba.org>
 <ffc54288-5986-4505-b77f-bd800cc45527@suswa.mountain>
Content-Language: en-US
In-Reply-To: <ffc54288-5986-4505-b77f-bd800cc45527@suswa.mountain>
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
Cc: Tom Talpey <tom@talpey.com>, Shyam Prasad N <sprasad@microsoft.com>,
 Paulo Alcantara <pc@manguebit.org>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>,
 Bharath SM <bharathsm@microsoft.com>, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 07.08.25 um 17:06 schrieb Dan Carpenter:
> On Thu, Aug 07, 2025 at 04:27:41PM +0200, Stefan Metzmacher wrote:
>>> The DB is too big and too dependent on your .config but I should
>>> share the smatch_data/ more regularly.  I started to push that into
>>> a separate git repo but I didn't finish that work.  I should do
>>> that.
>>
>> Ok, what's the gain of updating it?
>> Does it help when doing fixes on old kernels?
> 
> If you run smatch_scripts/build_kernel_data.sh then it runs
> smatch_scripts/gen_* which generates a bunch of the files in
> smatch_data/.  Which in theory should enable more warnings for new
> code.
> 
> I've been moving away from generating files and more towards
> putting everything in the DB.  I just took a look at the files now
> to respond to your email and what I saw wasn't good...  I need to
> look at this some more.
> 
> I don't know how often the zero day bot rebuilds the smatch_data.
> I bet they never do and so I think it doesn't really matter.
> 
>>
>> I'm typically doing a full kernel build a week after each rc.
>> My idea was to rebuild the whole db after doing that.
> 
> Yeah.  That's a good strategy.  The data from the existing DB feeds
> into the new one when you rebuild the DB so don't delete the old
> DB at the start or anything.

I mean I'm typically do a git clean -xdf . in order
to wipe everything in order to do a clean:
make -j33 bindeb-pkg

So it would build a new DB, as I'm working based on
the new kernel I guess that's all I need or
are there other reasons to update the existing DB?

Thanks!
metze

