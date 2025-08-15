Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD5B28613
	for <lists+samba-technical@lfdr.de>; Fri, 15 Aug 2025 20:54:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZKtXS1xlHywgeG63+c8TImHR9FlMaC+j8CtJTcFDpxI=; b=VJF3+8Ivf+PKlYlXOv4P6yAlzJ
	01QPL309JflpedDRDCfHlm9RhonOQBdMHgBRfILW4R3gaGQ5DLaG3K2akloYIVPy+FqYru/kJWRoS
	r2oiLL6auM2Pn64Y04fYPH8pBoeplD/cJHL8S5wf4lzTjFGBw7AY1NX91dhhZSpX9kf0C3B3+gRs5
	Mun0lEHhqddrVY6WUzEFc2yX1NZTOVGvMCA2vLM4DewIGDFxlkDCO23h6B6iZOSaGcOBaa+ov9s9q
	7RxDItVE+pVLwem0yysQFhhjpvZZcEzT2lKA8eoceE2a6ZeuLuk8c+mNcQ1tOuMxztqa6qv/zf1ao
	aMIIvGyw==;
Received: from ip6-localhost ([::1]:65308 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1umzZO-00F61O-Ej; Fri, 15 Aug 2025 18:54:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56386) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umzZK-00F61H-N7
 for samba-technical@lists.samba.org; Fri, 15 Aug 2025 18:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=ZKtXS1xlHywgeG63+c8TImHR9FlMaC+j8CtJTcFDpxI=; b=xoAo8F57Ox+n/P6I3rv4HLJEIO
 6auMFdeSiu8DI0pUXTWhEju07m0Ua8jXVdJzo0j4Xxzf8JBKgqQNGZ0pCEyU14Kv+ToQ0pezelsRb
 cUGP3K0xLCUM0C2/VuQoRYAaBbxiyWkbSUoKrBA1jF3/B0zeo/+P17NqjeVlMcZa7mLe5hPfLPMzQ
 fypEzv/gFyPjpRjV+HN7DVOcTvN4hEZICL+LiSIYLfvcKRFhbhyHxlB+Apz6IWRopQWOK6dgSk0y3
 cxcYFevvPfIFUzss4M99qWyNE4GQ7prGTjfnhxU3CjE/ExaAnexDazcVlC2D6nE+PaFz11GLZ8Bqw
 x/e5qCx+WAnANz+q5S10R2knYQZeE0nk+JLaNZ/pAgjZshIWmXrPqEfzGr8AoAiJ9gnGxXrVS+Mmd
 a3mHj0syHbHsXrhD4CAV+dpd/4HlVb096/ZitP3/Ztd8WKdehp3Dv2YC8yVtUxO/+8r8MDNxl8LBj
 Ft4FrkQOvjpIqT8y4MHik8lN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1umzZK-0032nB-0I; Fri, 15 Aug 2025 18:54:26 +0000
Message-ID: <5c1a0969-1757-46c2-ba88-a5db75f76d78@samba.org>
Date: Fri, 15 Aug 2025 20:54:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] smb: server: split ksmbd_rdma_stop_listening() out of
 ksmbd_rdma_destroy()
To: Steve French <smfrench@gmail.com>
References: <20250812164546.29238-1-metze@samba.org>
 <cwxjlestdk3u5u6cqrr7cpblkfrwwx3obibhuk2wnu4ttneofm@y3fg6wpvooev>
 <706b8f8e-57f2-4d34-a6f8-c672c921e4f2@samba.org>
 <CAH2r5mvtxMnwdgz15RrSZj_Kut9WVLGK+WRGUGQD1Rs_MJEWbA@mail.gmail.com>
 <0bcae9fe-1dff-4530-875b-fe917af5b649@samba.org>
 <CAH2r5mtas+irtVpkkCYRLyXpPknXqbAiN9gdupo-5z=YbFepTQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAH2r5mtas+irtVpkkCYRLyXpPknXqbAiN9gdupo-5z=YbFepTQ@mail.gmail.com>
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
Cc: Tom Talpey <tom@talpey.com>, Pedro Falcato <pfalcato@suse.de>,
 samba-technical@lists.samba.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 15.08.25 um 20:52 schrieb Steve French:
>> Maybe also remove the 'return;' from the inline ksmbd_rdma_destroy function?
> 
> Done (updated cifs-2.6.git for-next with attached)
> 
> It does look a little strange that a trailing ';' is only after the
> ksmbd_rdma_stop_listening() line - is that intentional
> 
> diff --git a/fs/smb/server/transport_rdma.h b/fs/smb/server/transport_rdma.h
> index 77aee4e5c9dc..ce3c88a45875 100644
> --- a/fs/smb/server/transport_rdma.h
> +++ b/fs/smb/server/transport_rdma.h
> @@ -54,13 +54,15 @@ struct smb_direct_data_transfer {
> 
>   #ifdef CONFIG_SMB_SERVER_SMBDIRECT
>   int ksmbd_rdma_init(void);
> +void ksmbd_rdma_stop_listening(void);
>   void ksmbd_rdma_destroy(void);
>   bool ksmbd_rdma_capable_netdev(struct net_device *netdev);
>   void init_smbd_max_io_size(unsigned int sz);
>   unsigned int get_smbd_max_read_write_size(void);
>   #else
>   static inline int ksmbd_rdma_init(void) { return 0; }
> -static inline int ksmbd_rdma_destroy(void) { return 0; }
> +static inline void ksmbd_rdma_stop_listening(void) { };
> +static inline void ksmbd_rdma_destroy(void) { }

No it needs to be just { } in both cases.

Thanks!
metze



