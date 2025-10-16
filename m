Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C78ABE3091
	for <lists+samba-technical@lfdr.de>; Thu, 16 Oct 2025 13:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2/5ypwE5D/kr+uNiBGAIBx9zSkU7A3n6pHyzbS5iVz8=; b=dBSefRlWv5H3vjAQu77+Fhmcoy
	zyhkWgEO3VGllOw785C6BAsM0RFdANSR3PeOn8E/JNxVJLeYQtvTzUPXj1gqL0BlKtaQ0DUcw7pXB
	gex2Lj8VjnNcs2Pl4ycw2D27uci11m6/Lfh2JFfF4K3Ih96iAn+kt1SVqXGkX3Y3RUEKmFBp8LmLR
	y+iaQ6T2kXw9UN1au2DnwMSraCZsE7fouxeYW+2cFpig9WdhjTyZ18ilG1tDKhKx6puPe7n9/H2ct
	L8MfXBfW0GAB6vQLVZ3W5a1yc5AeDHNd1EZx4iSpr2OKgB1h4v8aFPamU2HvmxrP4G+dQVLDSVuqs
	880ls+jw==;
Received: from ip6-localhost ([::1]:35270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v9M1W-007wIt-2T; Thu, 16 Oct 2025 11:19:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28462) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9M1Q-007wIm-3i
 for samba-technical@lists.samba.org; Thu, 16 Oct 2025 11:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=2/5ypwE5D/kr+uNiBGAIBx9zSkU7A3n6pHyzbS5iVz8=; b=jcH0ODQlNkzXIY+2HJONc8xYHK
 DAA8skG03SJWiIlbpApUXURfzt6AHRmwjIqXX19ugA5atN74Yel7pt8ofLKQiqW+xdacYy3ETry6E
 cx45ZyuAZpIWlfydsKHzbcARh6qqedI/hguBFSzeD0PoM40nACZL8Wfh4UH3ptoxD5eWlmAb0PkZX
 nStO0bDCKFLJNEudSa4G1dMlndv1IXGxXN769JiUnfZJ7SWrAXLG1O5w0jzcneBLqxD5uLSNWLXt0
 I7AZXBIHqlUDdMd4nn3ObTjk3H+VcoFuOrPWIqrCmTyjR+QT1+BO1cqXnfLwL9UnrxHYsmnLpXYRL
 mnSAhdYj20S1/pD0NEnIwKHwWLXv0fkG65vrj/b4KAOFMQ1lFa+Vk8QdrZM44lUhpZkMsls4NfiGh
 +h+/Brz7LPbxnqQ3iQQ0eshWSN8wH8FR5Wwusjb11wg74bygn46aAO3+va0ptx2whbtV+V9De7yi+
 XnK9zJFJALg/nnjFNvoIgmaz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v9M1P-009XX8-0y; Thu, 16 Oct 2025 11:19:51 +0000
Message-ID: <e57f82c2-92b1-494f-a9f8-737258c263ba@samba.org>
Date: Thu, 16 Oct 2025 13:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: server: allocate enough space for RW WRs and
 ib_drain_qp()
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
References: <20251016105500.1235026-1-metze@samba.org>
Content-Language: en-US
In-Reply-To: <20251016105500.1235026-1-metze@samba.org>
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

This needs a v2, see below...

Am 16.10.25 um 12:55 schrieb Stefan Metzmacher:
> Make use of rdma_rw_mr_factor() to calculate the number of rw
> credits and the number of pages per RDMA RW operation.
> 
> We get the same numbers for iWarp connections, tested
> with siw.ko and irdma.ko (in iWarp mode).
> 
> siw:
> 
> CIFS: max_qp_rd_atom=128, max_fast_reg_page_list_len = 256
> CIFS: max_sgl_rd=0, max_sge_rd=1
> CIFS: responder_resources=32 max_frmr_depth=256 mr_io.type=0
> CIFS: max_send_wr 384, device reporting max_cqe 3276800 max_qp_wr 32768
> ksmbd: max_fast_reg_page_list_len = 256, max_sgl_rd=0, max_sge_rd=1
> ksmbd: device reporting max_cqe 3276800 max_qp_wr 32768
> ksmbd: Old sc->rw_io.credits: max = 9, num_pages = 256
> ksmbd: New sc->rw_io.credits: max = 9, num_pages = 256, maxpages=2048
> ksmbd: Info: rdma_send_wr 27 + max_send_wr 256 = 283
> 
> irdma (in iWarp mode):
> 
> CIFS: max_qp_rd_atom=127, max_fast_reg_page_list_len = 262144
> CIFS: max_sgl_rd=0, max_sge_rd=13
> CIFS: responder_resources=32 max_frmr_depth=2048 mr_io.type=0
> CIFS: max_send_wr 384, device reporting max_cqe 1048574 max_qp_wr 4063
> ksmbd: max_fast_reg_page_list_len = 262144, max_sgl_rd=0, max_sge_rd=13
> ksmbd: device reporting max_cqe 1048574 max_qp_wr 4063
> ksmbd: Old sc->rw_io.credits: max = 9, num_pages = 256
> ksmbd: New sc->rw_io.credits: max = 9, num_pages = 256, maxpages=2048
> ksmbd: rdma_send_wr 27 + max_send_wr 256 = 283
> 
> This means that we get the different correct numbers for ROCE,
> tested with rdma_rxe.ko and irdma.ko (in RoCEv2 mode).
> 
> rxe:
> 
> CIFS: max_qp_rd_atom=128, max_fast_reg_page_list_len = 512
> CIFS: max_sgl_rd=0, max_sge_rd=32
> CIFS: responder_resources=32 max_frmr_depth=512 mr_io.type=0
> CIFS: max_send_wr 384, device reporting max_cqe 32767 max_qp_wr 1048576
> ksmbd: max_fast_reg_page_list_len = 512, max_sgl_rd=0, max_sge_rd=32
> ksmbd: device reporting max_cqe 32767 max_qp_wr 1048576
> ksmbd: Old sc->rw_io.credits: max = 9, num_pages = 256
> ksmbd: New sc->rw_io.credits: max = 65, num_pages = 32, maxpages=2048
> ksmbd: rdma_send_wr 65 + max_send_wr 256 = 321
> 
> irdma (in RoCEv2 mode):
> 
> CIFS: max_qp_rd_atom=127, max_fast_reg_page_list_len = 262144,
> CIFS: max_sgl_rd=0, max_sge_rd=13
> CIFS: responder_resources=32 max_frmr_depth=2048 mr_io.type=0
> CIFS: max_send_wr 384, device reporting max_cqe 1048574 max_qp_wr 4063
> ksmbd: max_fast_reg_page_list_len = 262144, max_sgl_rd=0, max_sge_rd=13
> ksmbd: device reporting max_cqe 1048574 max_qp_wr 4063
> ksmbd: Old sc->rw_io.credits: max = 9, num_pages = 256,
> ksmbd: New sc->rw_io.credits: max = 159, num_pages = 13, maxpages=2048
> ksmbd: rdma_send_wr 159 + max_send_wr 256 = 415
> 
> And rely on rdma_rw_init_qp() to setup ib_mr_pool_init() for
> RW MRs.
> 
> It seems the code was implemented before the rdma_rw_* layer
> was fully established in the kernel.
> 
> While there also add additional space for ib_drain_qp().
> 
> This should make sure ib_post_send() will never fail
> because the submission queue is full.
> 
> Fixes: ddbdc861e37c ("ksmbd: smbd: introduce read/write credits for RDMA read/write")
> Fixes: 4c564f03e23b ("smb: server: make use of common smbdirect_socket")
> Fixes: 177368b99243 ("smb: server: make use of common smbdirect_socket_parameters")
> Fixes: 95475d8886bd ("smb: server: make use smbdirect_socket.rw_io.credits")
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>   fs/smb/server/transport_rdma.c | 197 +++++++++++++++++++++------------
>   1 file changed, 126 insertions(+), 71 deletions(-)
> 
> diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
> index 94851ff25a02..43d812faab53 100644
> --- a/fs/smb/server/transport_rdma.c
> +++ b/fs/smb/server/transport_rdma.c
> @@ -1881,9 +1881,8 @@ static int smb_direct_init_params(struct smbdirect_socket *sc,
>   				  struct ib_qp_cap *cap)
>   {
>   	struct smbdirect_socket_parameters *sp = &sc->parameters;
> -	struct ib_device *device = sc->ib.dev;
> -	int max_send_sges, max_rw_wrs, max_send_wrs;
> -	unsigned int max_sge_per_wr, wrs_per_credit;
> +	int max_send_sges;
> +	unsigned int maxpages;
>   
>   	/* need 3 more sge. because a SMB_DIRECT header, SMB2 header,
>   	 * SMB2 response could be mapped.
> @@ -1894,63 +1893,29 @@ static int smb_direct_init_params(struct smbdirect_socket *sc,
>   		return -EINVAL;
>   	}
>   
> -	/* Calculate the number of work requests for RDMA R/W.
> -	 * The maximum number of pages which can be registered
> -	 * with one Memory region can be transferred with one
> -	 * R/W credit. And at least 4 work requests for each credit
> -	 * are needed for MR registration, RDMA R/W, local & remote
> -	 * MR invalidation.
> -	 */
> -	sc->rw_io.credits.num_pages = smb_direct_get_max_fr_pages(sc);

Sorry, I compiled it with a debug patch on top, which
means the smb_direct_get_max_fr_pages() was still used,
it's now unused.

I'll send a v2 shortly.


