Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70888B1C782
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 16:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=CvozvUvb2mLHLQoVpvw783zCOBflJqrngDv1NwUXoAs=; b=K+2Yf/AN92MsiaR1evM2l2LgOf
	clDYUTWq3tjjzGin/O0cVZo+rxqF7iv2RPZ7Q2xLfnhmG6zJDcPPyKM4Q2BrhjmqJ8VOTJRNBejXm
	03M50ITQdBwxqApQbKVyHJ8vWr6QHK70u8HfG+eOaeeiSPTIHZYVy6c77OJJZh6hzpBha7cZEQGKY
	OfU6xYtu5vHl3F3kubDCFjfNxoegiwZPvvJH8TavPyzoLzXNyWA7lE+zuPStwyJrnMRpI7UeVyNux
	3U7qIAJmJXSfUaha4KZvP7Afup3VrVLcBuFCGFNz4g8gq07Ljabof43TO816F22PNyYbPhJgEXndH
	fwW/z/dg==;
Received: from ip6-localhost ([::1]:54996 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujexg-00EQnL-08; Wed, 06 Aug 2025 14:17:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58694) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujexb-00EQnE-4s
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 14:17:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=CvozvUvb2mLHLQoVpvw783zCOBflJqrngDv1NwUXoAs=; b=t+TFmpEop/qSe2NZe4S50iZ+W+
 nWgMdh/C173rax/xvJ/aC+EePCbkgwPdr8XMtckQU4WzRNCO4qFRdn3Y6mBys6Z9mQOHMmLWHPhT+
 rJ+MuOYvShJXJfncSop2CcdUbNhufbMHEPWJnb0ShZ4Rkc3FtV591zUVXHFnb74m70oppGaMpybnp
 7+0Z5zsmJi9E8OA1rGliL3hFpAsNK7R54KQ/5MlC+rgpPEza/WTZ1arc3EgODoisDaKNVDO3/2Jkf
 81oi3xat+alh1fRcxDNvddwTAHeh54BrUBOAYAFMh+IwRw4t7NTbHYgpGcu+huGtaxOYhaC5IJYTR
 kVREPtWDDfKdaAaXXwPpYBKTv7tvZvxjXVW84tICvqcJFgRViDwcP345x1vQU59f+Yyal9aVf/uwW
 yBweZI0LFjtBuh0IzFz3+9Oibht4ZM3b3ZyrxoGDNvp3xDPfyjmhJfXa+1JVobXcIZQCt4s2lzBAI
 FPI0lzWkJadreHtKz5Cu4JNb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujexa-001MkB-06; Wed, 06 Aug 2025 14:17:42 +0000
Message-ID: <e291d925-bfd9-4202-b5d4-de5bf30ab870@samba.org>
Date: Wed, 6 Aug 2025 16:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] smb: client: Fix use after free in send_done()
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <aJNASZzOWtg8aljM@stanley.mountain>
 <ad2e9d94-2d95-4351-b800-627f20672209@samba.org>
 <87646c67-78b8-41c5-9b72-361cb3b733d1@suswa.mountain>
Content-Language: en-US
In-Reply-To: <87646c67-78b8-41c5-9b72-361cb3b733d1@suswa.mountain>
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
 Bharath SM <bharathsm@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 06.08.25 um 14:48 schrieb Dan Carpenter:
> On Wed, Aug 06, 2025 at 02:20:56PM +0200, Stefan Metzmacher wrote:
>> Hi Dan,
>>
>>> The mempool_free() function frees "request".  Don't free the request
>>> until after smbd_disconnect_rdma_connection() to avoid a use after free
>>> bug.
>>>
>>> Fixes: 5e65668c75c0 ("smb: client: let send_done() cleanup before calling smbd_disconnect_rdma_connection()")
>>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>>> ---
>>>    fs/smb/client/smbdirect.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
>>> index 58321e483a1a..162f8d1c548a 100644
>>> --- a/fs/smb/client/smbdirect.c
>>> +++ b/fs/smb/client/smbdirect.c
>>> @@ -286,8 +286,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
>>>    	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
>>>    		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
>>>    			wc->status, wc->opcode);
>>> -		mempool_free(request, request->info->request_mempool);
>>>    		smbd_disconnect_rdma_connection(request->info);
>>> +		mempool_free(request, request->info->request_mempool);
>>
>> The correct fix is to use 'info' instead of 'request->info'
>> other than that the order needs to stay that way.
>>
>> I already asked Steve to squash such a change into the
>> original commit (which is not yet upstream).
>>
>> See:
>> https://lore.kernel.org/linux-cifs/cover.1754308712.git.metze@samba.org/T/#m98a8607d7b83a11fd78547306836a872a2a27192
>>
>> What was the test that triggered the problem?
>> Or did you only noticed it by looking at the code?
> 
> This was a Smatch static checker warning.  You need to have the cross
> function DB to detect it.

Ok, I'll try to integrate it into my build flow...

Does it replace sparse or does it run in addition?
If it replaces sparse I guess a small script would
run them both?

$ cat mychecker.sh:
#!/bin/bash
set -e
sparse $@
smatch $@

And maybe all others from
https://gautammenghani.com/linux,/c/2022/05/19/static-analysis-tools-linux-kernel.html

How often do I need to run smatch_scripts/build_kernel_data.sh on the whole kernel?

Thanks!
metze

