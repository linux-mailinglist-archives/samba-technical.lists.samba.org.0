Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D47B1C5C5
	for <lists+samba-technical@lfdr.de>; Wed,  6 Aug 2025 14:21:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ap/g2AjFZIDWCZF6J1P5m3S2uCAGI9se2g24LPdaTTs=; b=JSPnpvQuF8Cg5U59MpBNNz3aUt
	YhCZr39HzSSzCHETvK65fMiefku7rZyqM7nVEZWvDxYM0W9hwEL1au19tm2+7zsE/cdTvwMUtLgLA
	/EcwbiXipfViUiBv5FCbdHVALavwq060u+7h8o604g5p3aH4MXThMZgIihHq32nbN9cq6Ei7edM/n
	UMH3BCv2fRx1vNlqb9Bciv6VDjR+Spipht8p6vRkk8zumUXQVSi/P7hDu+jZPzeF2GIoYql77qyRI
	gwYNRyRYuztpIU9rTU+Ur+IzWFhA6vury2487sj07PIJvdrHMOXOJUN26RsXU7azidkzMtRB+stjm
	gKAbOMmg==;
Received: from ip6-localhost ([::1]:22178 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ujd8f-00EQKR-R3; Wed, 06 Aug 2025 12:21:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23460) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujd8b-00EQKJ-Jb
 for samba-technical@lists.samba.org; Wed, 06 Aug 2025 12:21:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ap/g2AjFZIDWCZF6J1P5m3S2uCAGI9se2g24LPdaTTs=; b=XGw9shobOLw7XZEJpyWiEkswb1
 N6IW0N57tvudzaavd5CeBPrbysKohptUUms1DAO+8zMiH50qU/hIek3+uBzNI0p+5hsj2AK8w/a31
 c+Y8V28Xm8wDlrKIXq54VCKPK1fkC7Lx61mqJsgoU/NX2UNRXOjrYCrDEs/VIww1YCPz73ozhuLCE
 d3qDgAZCZS9QT6Yu5A6OOeO2dPLedU6amK8+Yu1kmkXj1bF/3Taq1uQ9Y5JyxxIAHSfW67AwJCKhm
 w971sHmAw9ulSwhmVJoggozX62lJkZwkP3uuThzWrkizqP/B+KRUmnjM49f4WRys3B8+Y0qtn6ONs
 BkRLID3TyW3WPiVpFUUn4bYtIDV9hRPydDVHD46SzshDk2BYcTXgACJTiXM6BcC2oT6MKwX5mDVer
 +swBtram1mjkhnIzpimxc8E3PDuxxmPMJEHo5b0Z7DUvhi9zinaihWiDahbHF5cGbr8UwZjj60DVL
 3Mf+m5zD0Ie8uMXyVh77RcdN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ujd8a-001LCN-1Z; Wed, 06 Aug 2025 12:20:56 +0000
Message-ID: <ad2e9d94-2d95-4351-b800-627f20672209@samba.org>
Date: Wed, 6 Aug 2025 14:20:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] smb: client: Fix use after free in send_done()
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <aJNASZzOWtg8aljM@stanley.mountain>
Content-Language: en-US
In-Reply-To: <aJNASZzOWtg8aljM@stanley.mountain>
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

Hi Dan,

> The mempool_free() function frees "request".  Don't free the request
> until after smbd_disconnect_rdma_connection() to avoid a use after free
> bug.
> 
> Fixes: 5e65668c75c0 ("smb: client: let send_done() cleanup before calling smbd_disconnect_rdma_connection()")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   fs/smb/client/smbdirect.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index 58321e483a1a..162f8d1c548a 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -286,8 +286,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
>   	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
>   		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
>   			wc->status, wc->opcode);
> -		mempool_free(request, request->info->request_mempool);
>   		smbd_disconnect_rdma_connection(request->info);
> +		mempool_free(request, request->info->request_mempool);

The correct fix is to use 'info' instead of 'request->info'
other than that the order needs to stay that way.

I already asked Steve to squash such a change into the
original commit (which is not yet upstream).

See:
https://lore.kernel.org/linux-cifs/cover.1754308712.git.metze@samba.org/T/#m98a8607d7b83a11fd78547306836a872a2a27192

What was the test that triggered the problem?
Or did you only noticed it by looking at the code?

Thanks!
metze

