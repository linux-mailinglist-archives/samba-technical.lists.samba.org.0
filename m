Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA3B487B6
	for <lists+samba-technical@lfdr.de>; Mon,  8 Sep 2025 11:03:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=/BAWmz2J4iABur/eFvgSCenb5vjuXTUx5jrQy03ODzo=; b=tHFFFYtAFyUlYBC/halKmzvt2r
	ZG9bPO4TPMM37qwfjG7qDEVVWAJ+qauDT1rsSodzcekoUoA6aBLR9I9YFeCB4vl4F0vUyIRLVKP+6
	nWqHXYI+VtzqHeMWYPok+IKYEGMDZRFh5iY4xFTKCcNuqi45KkkfS4A1GWxNNzdTjVIJH6u3yJerL
	NSliGH4f1zZDmm4++Ct2rpr7Yh/tivS/OhDN+F5G3lqJB1Es/nh+E3ZQKP3ghOWp8ncQMCDtRIHI5
	G2MdhW6OiGWMFvFbssuF9Snq+xEKpQALz7JDHcb6TNolqAlXKxlmXZmgz+UO7CEQdtDHaGFf5LnLs
	XAO89pbw==;
Received: from ip6-localhost ([::1]:42626 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uvXmU-003Ih3-2z; Mon, 08 Sep 2025 09:03:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40504) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvXmP-003Igw-JH
 for samba-technical@lists.samba.org; Mon, 08 Sep 2025 09:03:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=/BAWmz2J4iABur/eFvgSCenb5vjuXTUx5jrQy03ODzo=; b=nXuj6sTFUpUPvj90AoztOmxwEq
 6BCMOVMp7t9LGQG+YXS5u5QYLN9EPLfNkJaz+W8V3V0HbC9dnbRTghgqXBHMjB4rbrrQmlCnaAgkg
 n42ZVgHycBr/tT+ntP4Fg/BBnHYkqU+STwNzI5nA3KIZU2Hcqhwd1JSs3wy4y5ZISNA+P5Cgmyv7G
 Fwqc7Hn2630Ui8fCAGj1Op9GVKsv2VaIKXMbagUdAACdB8jW2e3rOW0KNOYvxj7dQ2xLVmZRa6pLB
 +GvufIp+4n0SFWK2Vg+9/6hZuwOjpUOKKA/tU6y3GVfvgLjQkOzeciMKC1F9Nd/JPqidYr+b6mUij
 g7JB8xwIOPE+jZZ2Rolrzq2lV5dDX0fIt4+9VW7NEQLtPWV6ws+BPrtBvF/31MUJ7HyRFI+G+jnbd
 SSUwKxYUV8Yj7OCXkvgFEupMfyEDNUg7EgClZj5kFgjZot1QiM2r+bSmR3qMlr3C64+xWzcPglZUU
 w8DzLbzGIWWccEfYI5XymBrw;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvXmO-0030PT-29; Mon, 08 Sep 2025 09:03:16 +0000
Message-ID: <fcd54ce4-a9f1-45ac-bc18-e0bb6eacba89@samba.org>
Date: Mon, 8 Sep 2025 11:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 048/142] smb: client: don't check
 sc->send_io.pending.count is below sp->send_credit_target
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
References: <cover.1756139607.git.metze@samba.org>
 <02ad437bfe57819274af80b0cd3cd4dff96fbbba.1756139607.git.metze@samba.org>
Content-Language: en-US
In-Reply-To: <02ad437bfe57819274af80b0cd3cd4dff96fbbba.1756139607.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 25.08.25 um 22:40 schrieb Stefan Metzmacher:
> If we were able to get a credit we don't need to prove and wait
> that sc->send_io.pending.count is below sp->send_credit_target.
> 
> This just adds useless complixity. The same code on the server
> also doesn't do this, so we should remove it from the client.
> 
> This will make it easier to momve to common code later.
> 
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Long Li <longli@microsoft.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>   fs/smb/client/smbdirect.c | 28 ++++------------------------
>   fs/smb/client/smbdirect.h |  3 ---
>   2 files changed, 4 insertions(+), 27 deletions(-)
> 
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 2eaddf190354..220ebd00a9d7 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -414,8 +414,6 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
>   	if (atomic_dec_and_test(&sc->send_io.pending.count))
>   		wake_up(&sc->send_io.pending.wait_queue);
>   
> -	wake_up(&info->wait_post_send);
> -
>   	mempool_free(request, sc->send_io.mem.pool);
>   }
>   
> @@ -1035,23 +1033,6 @@ static int smbd_post_send_iter(struct smbd_connection *info,
>   		goto wait_credit;
>   	}
>   
> -wait_send_queue:
> -	wait_event(info->wait_post_send,
> -		atomic_read(&sc->send_io.pending.count) < sp->send_credit_target ||
> -		sc->status != SMBDIRECT_SOCKET_CONNECTED);
> -
> -	if (sc->status != SMBDIRECT_SOCKET_CONNECTED) {
> -		log_outgoing(ERR, "disconnected not sending on wait_send_queue\n");
> -		rc = -EAGAIN;
> -		goto err_wait_send_queue;
> -	}
> -
> -	if (unlikely(atomic_inc_return(&sc->send_io.pending.count) >
> -				sp->send_credit_target)) {
> -		atomic_dec(&sc->send_io.pending.count);
> -		goto wait_send_queue;
> -	}
> -

I'll drop this change for now, as I found commit 3ffbe78aff93
("cifs: smbd: Check send queue size before posting a send")

Instead I'll change info->wait_post_send into sc->pending.dec_wait_queue.

I'll look at it again when moving to common functions, but for now
I better try to avoid changing the logic here and we may need to
add something like this to the server too.

While debugging the problem that lead to these fixes:
smb: server: let smb_direct_writev() respect SMB_DIRECT_MAX_SEND_SGES
https://lore.kernel.org/linux-cifs/20250904181059.1594876-1-metze@samba.org/
and RDMA/siw: avoid hiding errors in siw_post_send()
https://lore.kernel.org/linux-rdma/20250904173608.1590444-1-metze@samba.org/
I first thought that exactly the above logic was missing in the server...

metze


