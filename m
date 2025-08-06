Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3F5B1C502
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 13:40:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=YgL9UHXWpCfyNoJe7nDYl3W+0F276Rjidc8HzG8GZXk=; b=z4731k7MS7jCMI/F2UFVe2gpC/
	QvMhPuiCDKDkoACTxoLorKfndbSWbF87LVJZnvikDLO2ffv2vxzX3foRagbi2gyZNAMbVJRaINwDE
	oZVJOn9lYIcchfnVTL/DcekVozgD6GPvp4kp9KZ3XvOzaSJc8uQYEC7+k/zPV0KpsWUhd3PAGWYNn
	SrYDdJPqhZA7EDAzuKVztAwvNg3WJXq+eg4iypMAi6P2Q3EpT/CptlHfDS6Q/ZmeplkMTbfJksFQs
	974FbMu5LCC6+E3gO1gyJPIL0z4dWHL2GwG0JjaPK3jFQILDp0HF0zj0sGjsCAuDNYoKuQkC4ylg0
	UFU8qGLw==;
Received: from ip6-localhost ([::1]:51650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujcUV-00EQBl-An; Wed, 06 Aug 2025 11:39:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:45558) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujcUQ-00EQBe-Sr
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 11:39:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=YgL9UHXWpCfyNoJe7nDYl3W+0F276Rjidc8HzG8GZXk=; b=yGuso2rjeMTbM95fNOu9/5TiXE
 JtC5qZaZNbIFaQeGOVp0bBYkK7EaqoR/6U3u4DWvUP3nyauSeNxkjDanz/rExtd7KHH7hHprg5L18
 rE44+jG9YNx0Ia3tHmGSB5VATjSoTBR3JJlSS4okaECBDhIXS2MOxhR8wf7kfKqwZc3YHPZlnm5uQ
 6/MD808AeOEL6zgIulzIZ2RZW5G9RURYEt+cPQ7n3Fg7pfC0AlYskdULKFqFnUQGAxCJzDZNOzmnU
 MegokuUFyS/NuxBR7tXLIqrmuIRNGpKgXHRhmksjlJ+6W1Nu2LMqSKpk1JGxRaen14NXJeKzGXspf
 vxpU9n48H/9OLF6I13Rvh1PRQbQQ0hWMgSN4cHRqGXJRWJy8cG771w6ehKfE4yzEIcMECqNrFBIEA
 otB+UoM/7vUPdQEY9IqCobdhzbQbLt9CAQcnwn3wmq/5bYoKYkhUiCcchzxKy2T+FjHDDwV7mB0qK
 ywjIPLEOtr9tknfEFRF1YwUz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujcUP-001KeF-3B; Wed, 06 Aug 2025 11:39:26 +0000
Message-ID: <a9dc02a1-ab9c-4bc6-8a69-b0794bf258fd@samba.org>
Date: Wed, 6 Aug 2025 13:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] smb: client: let send_done() cleanup before calling
 smbd_disconnect_rdma_connection()
To: Steve French <stfrench@microsoft.com>
References: <cover.1754308712.git.metze@samba.org>
 <0b80cf1a140280ca75ac21d5577a141e433d35f7.1754308712.git.metze@samba.org>
Content-Language: en-US
In-Reply-To: <0b80cf1a140280ca75ac21d5577a141e433d35f7.1754308712.git.metze@samba.org>
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
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-cifs@vger.kernel.org" <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Steve,

can you please squash this into the commit? Otherwise it introduces
as new use-after-free problem with request->info.

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 7377216e033d..5d1fa83583f6 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -286,8 +286,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
  	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
  		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
  			wc->status, wc->opcode);
-		mempool_free(request, request->info->request_mempool);
-		smbd_disconnect_rdma_connection(request->info);
+		mempool_free(request, info->request_mempool);
+		smbd_disconnect_rdma_connection(info);
  		return;
  	}

Thanks!
metze

Am 04.08.25 um 14:10 schrieb Stefan Metzmacher:
> We should call ib_dma_unmap_single() and mempool_free() before calling
> smbd_disconnect_rdma_connection().
> 
> And smbd_disconnect_rdma_connection() needs to be the last function to
> call as all other state might already be gone after it returns.
> 
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: Long Li <longli@microsoft.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Fixes: f198186aa9bb ("CIFS: SMBD: Establish SMB Direct connection")
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>   fs/smb/client/smbdirect.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 754e94a0e07f..b6c369088479 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -281,18 +281,20 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
>   	log_rdma_send(INFO, "smbd_request 0x%p completed wc->status=%d\n",
>   		request, wc->status);
>   
> -	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
> -		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
> -			wc->status, wc->opcode);
> -		smbd_disconnect_rdma_connection(request->info);
> -	}
> -
>   	for (i = 0; i < request->num_sge; i++)
>   		ib_dma_unmap_single(sc->ib.dev,
>   			request->sge[i].addr,
>   			request->sge[i].length,
>   			DMA_TO_DEVICE);
>   
> +	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
> +		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
> +			wc->status, wc->opcode);
> +		mempool_free(request, request->info->request_mempool);
> +		smbd_disconnect_rdma_connection(request->info);
> +		return;
> +	}
> +
>   	if (atomic_dec_and_test(&request->info->send_pending))
>   		wake_up(&request->info->wait_send_pending);
>   


