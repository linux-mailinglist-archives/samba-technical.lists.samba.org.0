Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 250E4B48821
	for <lists+samba-technical@lfdr.de>; Mon,  8 Sep 2025 11:19:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=K2P+4RW/NoGTiBE3/+HNNEvKYfYK8WVFWoWCp/BWX1E=; b=EE3QX2r3JqtOR6pxNAUOne4tnL
	HoYVqbzzow8q3gre6P6lMaFQoxubAcBmLghmdSfNqF/eJvXqYOHf4rMS9ZqoeUQo0loLfjFBU9PTB
	UlFErsRINCT/DlEys4twZ44Trbj+F3P7EeC31NXMpnqDZpBG0ZPaYfVafMTxhmwm12XgJi7Awd5OS
	LQKgBohF4s2cjKhk/vElVlKqAdseuEwAwSMVKGg79qW9sP+2j7wKdlcDN7gH2kYVAhjHJHCSffzHJ
	TBp9ASotZHOIQc0Okt4D8tMx3nBdxscWBzeiTYR7sLzisSAaRigQjXs52sRgM1UhAyr9t0HNjynRF
	HHZH2sog==;
Received: from ip6-localhost ([::1]:53020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uvY1Q-003InP-Ay; Mon, 08 Sep 2025 09:18:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10848) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvY1M-003InH-0B
 for samba-technical@lists.samba.org; Mon, 08 Sep 2025 09:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=K2P+4RW/NoGTiBE3/+HNNEvKYfYK8WVFWoWCp/BWX1E=; b=HbYCt3EPUDznij8FRanVfoSPlE
 kRbiRqptX9a3AV5c8j//DkNodW7QSOlQe/jkgDFTM47dK3deByP1VBvweJmgJLc6CM2A9wZPmsUUt
 gkpwwr2czRHTVQLBnoDBaEFX/smLHNjYRK50AQz7aqE85yYjPl30yYNr91Xmr5Rr8GaEqE9nOvDty
 V1gCybFGXlsVfjOWDQ1TtfUqd3jQOdGhh3w4Qhv1yRraEQmgGC5jaazFDyB4VvecMkDML9tur5o0r
 AnTPAu3bdoqDY9Qozw0qCHIPTTkW8vA53EqroUBfIRCymVAEp5oNF4pQQ2qt2ydcCBPBjOAlmiKYU
 qVERlLYMt0LMJEKPLHhE58kTU+qY4OMBFWmnX2BavHiyKsU88iw7VxejRFFNNVXmt9WTONvOJtG8z
 CVdSF8tuKdWZA5Pjl5CJ9bKtXHsRlE3EFM6nwWVEmrSIwpoXDJQzHNlAG+82S3TSkGY5kwaglseqA
 VvGsxEKtQT4VJAr7ERiLQXhU;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uvY1K-0030aN-0K; Mon, 08 Sep 2025 09:18:42 +0000
Message-ID: <6e143477-2240-4034-a5ff-02d7c412382a@samba.org>
Date: Mon, 8 Sep 2025 11:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 098/142] smb: server: make use of
 smbdirect_socket.send_io.pending.{count,wait_queue}
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
References: <cover.1756139607.git.metze@samba.org>
 <15e99e9490c6562e81d0f525526a91ee05f822a1.1756139607.git.metze@samba.org>
Content-Language: en-US
In-Reply-To: <15e99e9490c6562e81d0f525526a91ee05f822a1.1756139607.git.metze@samba.org>
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
Cc: Tom Talpey <tom@talpey.com>, Steve French <smfrench@gmail.com>,
 Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 25.08.25 um 22:40 schrieb Stefan Metzmacher:
> This will is used by the client already and will allow to create
> common helper functions.
> 
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>   fs/smb/server/transport_rdma.c | 26 ++++++++++----------------
>   1 file changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
> index 62e13112a2b6..fd8d3fbdfa6c 100644
> --- a/fs/smb/server/transport_rdma.c
> +++ b/fs/smb/server/transport_rdma.c
> @@ -106,9 +106,6 @@ struct smb_direct_transport {
>   	wait_queue_head_t	wait_send_credits;
>   	wait_queue_head_t	wait_rw_credits;
>   
> -	wait_queue_head_t	wait_send_pending;
> -	atomic_t		send_pending;
> -
>   	struct work_struct	post_recv_credits_work;
>   	struct work_struct	send_immediate_work;
>   
> @@ -341,9 +338,6 @@ static struct smb_direct_transport *alloc_transport(struct rdma_cm_id *cm_id)
>   
>   	spin_lock_init(&t->receive_credit_lock);
>   
> -	init_waitqueue_head(&t->wait_send_pending);
> -	atomic_set(&t->send_pending, 0);
> -
>   	spin_lock_init(&t->lock_new_recv_credits);
>   
>   	INIT_WORK(&t->post_recv_credits_work,
> @@ -380,7 +374,7 @@ static void free_transport(struct smb_direct_transport *t)
>   	}
>   
>   	wake_up_all(&t->wait_send_credits);
> -	wake_up_all(&t->wait_send_pending);
> +	wake_up_all(&sc->send_io.pending.wait_queue);
>   
>   	disable_work_sync(&t->post_recv_credits_work);
>   	disable_work_sync(&t->send_immediate_work);
> @@ -834,8 +828,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
>   		smb_direct_disconnect_rdma_connection(t);
>   	}
>   
> -	if (atomic_dec_and_test(&t->send_pending))
> -		wake_up(&t->wait_send_pending);
> +	if (atomic_dec_and_test(&sc->send_io.pending.count))
> +		wake_up(&sc->send_io.pending.wait_queue);

In the rebase on top of "smb: server: let smb_direct_writev() respect SMB_DIRECT_MAX_SEND_SGES"
sc->send_io.pending.wait_queue will become sc->send_io.pending.zero_wait_queue in
order to make it clear it's woken when count reaches 0.

metze

