Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F13EAB9E1A
	for <lists+samba-technical@lfdr.de>; Fri, 16 May 2025 16:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=mmzWBrBQb2s1Dtr15zDCHkAoFy2O5uJ5sgPONiWBjy8=; b=LQ4glQvn6YPYMSi0v9/GzP7shv
	T9wqeD7N14lm7RUs4bv3M9y5r6lhniHZyVTDPH/cySat7zHmq41/v3qmhEHur0eFIdgyH6TAvwiT5
	BRcz+JzFH1Kf5l1niZySan+mAVLlpNPbkum8zD8uys6lm+e7K67zt3ZRRBf3Qa9Wzc3f5/2nleBHB
	+T8LbNw5GxM35znm9pSw8PAgk34jhYncqXgaBQZ5OzRTwzo9IGq9qhDujAzZrayUHgxqngM8ioYW+
	BgYVmq+uSh1scMkkS67GcZVZia5cQfyItfryasNYh8zQ8rnGBQ9y9/O1Ohj2N2rL+KvkBVPkMuzTc
	wIeZbssw==;
Received: from ip6-localhost ([::1]:65156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uFvdQ-003gN3-Mc; Fri, 16 May 2025 14:02:00 +0000
Received: from mx.manguebit.com ([167.235.159.17]:56432) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uFvdM-003gMw-FK
 for samba-technical@lists.samba.org; Fri, 16 May 2025 14:01:58 +0000
Message-ID: <860a4f7600814b17e48dbabe1ae19f68@manguebit.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manguebit.com;
 s=dkim; t=1747403405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mmzWBrBQb2s1Dtr15zDCHkAoFy2O5uJ5sgPONiWBjy8=;
 b=j41yxktdbr+Dm7gUXSMeKrfnhWxRgh/SeO1Y/ee64tjOHEYFeZNONI1qllTLKU7j88OV52
 TT2XZ3jem65KVGA9dZXCU6yxl6SZf8AdyKoedDIEZSWTwmtnxwMBx/zxMrifb9hwKti6e7
 /S18liezDjx/MXxaAzvP5bpDqiqDmtcv+2rUdKJqohWzQ4i4fAo71f5kRE2fw3W5ezt5w4
 ZglMenOH+DMzm388dIwvseQH45mtuGWmtBt+LLcCoqJULCeAvlYVbPnBBtVuf216Mrxrz7
 2RlxeH2vjXFCWL6Czr8/jnT8m0T10UkXShHN9bfnsGOHU6BFNh1q5mgi9o3Rnw==
To: Wang Zhaolong <wangzhaolong1@huawei.com>, sfrench@samba.org,
 sfrench@us.ibm.com
Subject: Re: [PATCH V2 0/2] smb: client: Fix use-after-free in readdir
In-Reply-To: <20250516091256.2756826-1-wangzhaolong1@huawei.com>
References: <20250516091256.2756826-1-wangzhaolong1@huawei.com>
Date: Fri, 16 May 2025 10:49:59 -0300
MIME-Version: 1.0
Content-Type: text/plain
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
From: Paulo Alcantara via samba-technical <samba-technical@lists.samba.org>
Reply-To: Paulo Alcantara <pc@manguebit.com>
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 wangzhaolong1@huawei.com, chengzhihao1@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Wang Zhaolong <wangzhaolong1@huawei.com> writes:

> V2:
>   - Correct spelling mistakes in the commit message, such as 'lopp' -> 'loop'.
>   - The titles of patches follow the same style.
>
> This patch series addresses a use-after-free vulnerability in the SMB/CIFS
> client readdir implementation that can be triggered during concurrent
> directory reads when a signal interrupts directory enumeration.
>
> The root cause is in the operation sequence in find_cifs_entry():
> 1. When query_dir_next() fails due to signal interruption (ERESTARTSYS)
> 2. The code continues to access last_entry pointer before checking the return code
> 3. This can access freed memory since the buffer may have been released
>
> The race condition can be triggered by processes accessing the same directory
> with concurrent readdir operations, especially when signals are involved.
>
> The fix is straightforward:
> 1. First patch ensures we check the return code before using any pointers
> 2. Second patch improves defensiveness by resetting all related buffer pointers
>    when freeing the network buffer
>
> Wang Zhaolong (2):
>   smb: client: Fix use-after-free in cifs_fill_dirent
>   smb: client: Reset all search buffer pointers when releasing buffer
>
>  fs/smb/client/readdir.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Paulo Alcantara (Red Hat) <pc@manguebit.com>

