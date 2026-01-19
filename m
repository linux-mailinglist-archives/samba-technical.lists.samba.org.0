Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 856DFD3B4A5
	for <lists+samba-technical@lfdr.de>; Mon, 19 Jan 2026 18:41:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ikmWwKT3tpdgBnH0Hb4PzSvHtuJOgJWXWF+JurZVkEA=; b=kDUqxwrXoBU+J/BDNW+4z12hkc
	p6yX4nP7IM4QnO3CVXtUWunPi0uF9mUlc1PSyRk0pWMoA8r+p4msFmAGR7V20wOcbRHCApuJsVpSf
	1AHM34/zfJANwofa5lIuiID6qtUHXlDMNjPcTGhfckVd/ItFYBbkb9CCte3vDI17BD9OYMHKqTtvP
	lWpAlw+9RqqRTfGewgYT79oXqPTmPc0GT1u7EdZSm8XOwZ6EczfkCKASfKXL84ywU/7WaB0vaP2Bv
	SzZhRIUGquyaEhDu+AvW+c3isEPdoszkvbKA2rv6MAQmGLCWElayjEXHpOYGQwEuKJPWn2Nbjx1KH
	5ewoBAjw==;
Received: from ip6-localhost ([::1]:21862 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vhtEt-000eio-L9; Mon, 19 Jan 2026 17:40:31 +0000
Received: from hr2.samba.org ([144.76.82.148]:60622) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vhtEn-000eig-Hn
 for samba-technical@lists.samba.org; Mon, 19 Jan 2026 17:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ikmWwKT3tpdgBnH0Hb4PzSvHtuJOgJWXWF+JurZVkEA=; b=jk+nGN/3AjOMkZGVG95dZF6l6p
 8C2mU0sw3WxXVrNsQ+ENtvS31z1HCDMfsU9J4M1JLSxC+BSDlguLSgClVegOsGTTxxPuDPlt0wM52
 S5PhKWLnjT7oZ2QA54zX/zuPc6zGjSOFAmQj4M5JI9Jhg8p2oNbJ31NsmgQ5cMoraFLMdeedM+idD
 vIIfs/MNiIfOPMVCbhvdKzIJ2fr3Q2D9YOsZKQFj2VwTxQuP9sBKTZI3BvfDSr/t5stKUeYv5+mNN
 vdVGnqX6xp5IbCSW8phJuU/W8mXb4NHj+bRUQVh8DLvowb1cF6USuTUZmdezZtT1HK4TeFfjn3/ev
 1pvKRwgLQ2rJ/l93KqPTrD0zdv9yrDPN4HwRrBCk5HET90ZwmW85lE70eLU40lpYDzTO6mlX1pVs1
 ERhSjsddB9NYhThmQeMnOv3M4TNVhqS54elGqpSMbO1CPNCnFKiaAeAlwUvaQexD6uirBfkqDid4v
 6Mg5bga9vUvhUslG3dbz5dFW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vhtEd-00000001BD7-2Inb; Mon, 19 Jan 2026 17:40:15 +0000
Message-ID: <b5b92cae-d92a-426e-b6ad-fcaa9691b980@samba.org>
Date: Mon, 19 Jan 2026 18:40:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: server: reset smb_direct_port =
 SMB_DIRECT_PORT_INFINIBAND on init
To: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org
References: <20251208154919.934760-1-metze@samba.org>
Content-Language: en-US
In-Reply-To: <20251208154919.934760-1-metze@samba.org>
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

Hi Namjae,

can this be merged? It makes testing between roce and iwarp
much easier.

I have infrastructure to listen on both iwarp and roce
at the same time, but I haven't written the patches for
ksmbd.ko to use it. I'll hopefully find the time
in the next days.

Thanks!
metze


Am 08.12.25 um 16:49 schrieb Stefan Metzmacher:
> This allows testing with different devices (iwrap vs. non-iwarp) without
> 'rmmod ksmbd && modprobe ksmbd', but instead
> 'ksmbd.control -s && ksmbd.mountd' is enough.
> 
> In the long run we want to listen on iwarp and non-iwarp at the same time,
> but requires more changes, most likely also in the rdma layer.
> 
> Cc: Namjae Jeon <linkinjeon@kernel.org>
> Cc: Steve French <smfrench@gmail.com>
> Cc: Tom Talpey <tom@talpey.com>
> Cc: linux-cifs@vger.kernel.org
> Cc: samba-technical@lists.samba.org
> Signed-off-by: Stefan Metzmacher <metze@samba.org>
> ---
>   fs/smb/server/transport_rdma.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/fs/smb/server/transport_rdma.c b/fs/smb/server/transport_rdma.c
> index f585359684d4..05f008ea51cd 100644
> --- a/fs/smb/server/transport_rdma.c
> +++ b/fs/smb/server/transport_rdma.c
> @@ -2708,6 +2708,7 @@ int ksmbd_rdma_init(void)
>   {
>   	int ret;
>   
> +	smb_direct_port = SMB_DIRECT_PORT_INFINIBAND;
>   	smb_direct_listener.cm_id = NULL;
>   
>   	ret = ib_register_client(&smb_direct_ib_client);


