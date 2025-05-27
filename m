Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B719AC5B20
	for <lists+samba-technical@lfdr.de>; Tue, 27 May 2025 22:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=nGfY8tZRHN8kmr7rkbb4nmZDOtvAvf9s+b7sb4fOiuo=; b=W0nF/FwUjYJmyCL0iP68JLArbX
	rG+NnXHREaoIpumPIvyHpg0dbAkNNrhZa2ZWOzIaYhvWDzdYkjBT27pL5LdMsBXVp+DSrw18LN/ch
	b6dPE/ywE6EUcke4oMq5rwyfuaAwv26RQ/SA6v/Kpy8uiGUUcFB4ct/XrXZJwaToOkZH5q15MQEVK
	3FLvfcN2TDm5RFGzUo/0pFbZ923FdZq+HcbCe638TNm84HUpFlvIyTDfyC/t9NQsuR17UNOr51R61
	LjksdrHc/yuiqsNA4XMYgZjN+qDdJNErCl7qwYEiTY6fsTjTXGe2TTPY0Xvzsdwcw8jcNVvPUIgL8
	eH4r7SFw==;
Received: from ip6-localhost ([::1]:47430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uK0SR-004Ihf-4v; Tue, 27 May 2025 19:59:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11022) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uK0SM-004IhX-U6
 for samba-technical@lists.samba.org; Tue, 27 May 2025 19:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=nGfY8tZRHN8kmr7rkbb4nmZDOtvAvf9s+b7sb4fOiuo=; b=TS2LKZrhpc7NHSz+/bqc+Ush4T
 /cxoc2CMWJAbIExvEoJTfI284Hnqxb/63qb7loBB4chC8SO72R2cZgocFOaoENYnPx1XxdQcaJHIi
 ishRtMemVkOhkCC3BxXj5id9FQc8082ud22EeAFoGXVVU1wxbmjKrE9tP9MwF6Chv5DtARY18WWnV
 UAX+6C3bSrAV4N5fiZVr0xdgJOP/4sBQOGzx6aSdtZOEs7zrdOp6Qq4UoljhoDMwTfy+BLzifcE43
 ywr+Ry6hpRZrnezOR1QMeEIAoDh16ACQ7KWfWd0dHFbFCST2226uC0fcTjfqb8+o4DpRjQ4PeOQbS
 OATijEKuAnJxDZLBtQZqx61SQtXskYwBzNlFQ6sJ4GA1SJdov/5xxFNo0Z65vzPVIKGuhOx7Mm8EC
 1UYVMSrbGHZQCvml39kY6lEYgx1J3LQ9C+50l7WSqgrXp61CH9Hjfm7SsQwaLZ1EYfc6KvO/IISDI
 wmgrTh2NbBZtatsum52vAOi/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uK0SL-007XSv-1U; Tue, 27 May 2025 19:59:25 +0000
Message-ID: <8afdbc0b-30f9-4e17-bd34-bc807ce3883f@samba.org>
Date: Tue, 27 May 2025 21:59:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] smb: common: split out smb_direct related header files
To: Tom Talpey <tom@talpey.com>
References: <cover.1748362221.git.metze@samba.org>
 <31f6e853d60ec99136f3855acb3447d36fa0fc82.1748362221.git.metze@samba.org>
 <ace9b692-3a0d-4a47-b74b-c350a72efdf1@talpey.com>
Content-Language: en-US
In-Reply-To: <ace9b692-3a0d-4a47-b74b-c350a72efdf1@talpey.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 Hyunchul Lee <hyc.lee@gmail.com>, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 27.05.25 um 20:50 schrieb Tom Talpey:
> I love the idea. Couple of questions on the pathnames...
> 
> On 5/27/2025 12:12 PM, Stefan Metzmacher wrote:
>> This is just a start moving into a common smb_direct layer.
>>
>> Cc: Steve French <smfrench@gmail.com>
>> Cc: Tom Talpey <tom@talpey.com>
>> Cc: Long Li <longli@microsoft.com>
>> Cc: Namjae Jeon <linkinjeon@kernel.org>
>> Cc: Hyunchul Lee <hyc.lee@gmail.com>
>> Cc: linux-cifs@vger.kernel.org
>> Cc: samba-technical@lists.samba.org
>> Signed-off-by: Stefan Metzmacher <metze@samba.org>
>> ---
>>   fs/smb/common/smb_direct/smb_direct.h     | 11 +++++
>>   fs/smb/common/smb_direct/smb_direct_pdu.h | 51 +++++++++++++++++++++++
> 
> Why the underscore in "smb_direct", in both components? The protocol
> doesn't use this, and it seems awkward and search-unfriendly.

Yes, I'd also prefer smbdirect and I just used it because I had
my existing wip driver under that name, but that should not matter.

The other reason was that the existing structures used smb_direct_
as prefix, but I'll also change that.

>>   fs/smb/server/transport_rdma.h            | 43 +------------------
>>   3 files changed, 64 insertions(+), 41 deletions(-)
>>   create mode 100644 fs/smb/common/smb_direct/smb_direct.h
>>   create mode 100644 fs/smb/common/smb_direct/smb_direct_pdu.h
>>
>> diff --git a/fs/smb/common/smb_direct/smb_direct.h b/fs/smb/common/smb_direct/smb_direct.h
>> new file mode 100644
>> index 000000000000..c745c37a3fea
>> --- /dev/null
>> +++ b/fs/smb/common/smb_direct/smb_direct.h
>> @@ -0,0 +1,11 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + *   Copyright (C) 2025, Stefan Metzmacher <metze@samba.org>
>> + */
>> +
>> +#ifndef __FS_SMB_COMMON_SMB_DIRECT_SMB_DIRECT_H__
>> +#define __FS_SMB_COMMON_SMB_DIRECT_SMB_DIRECT_H__
>> +
>> +#include "smb_direct_pdu.h"
> 
> And, why the empty redirection? It seems unnecessary, do I assume it
> will later contain API signatures for the planned common layer? Perhaps
> it should say this, to avoid confusion while that work is being done.

I'll think about it maybe I'll remove the redirection.

In the end the pdu definitions belong only in a single common .c files,
but it will take a lot of steps to get there.

I'll post a v2 tomorrow or next week.

Thanks!
metze


