Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A998A3AFFA
	for <lists+samba-technical@lfdr.de>; Wed, 19 Feb 2025 04:18:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jc4SK/ypNCa99TVOhf7iBOOIGMc5Da5lSQe8phr48Xs=; b=AoGXchJ70raoUx0xXuAQiJpfau
	goJ6up6ULZ0IaDtCkhVchj8x1U4Wv0fml2bVzrzk3NmKrysMs9ovvCY4XM/DBfIN5M6h++ZLKP25Q
	RUDkjWfLRyThV1Hi7AdETr0hKpIkCEu0pvCAMC3QVhV3Gxx41CPCpCQzpAFXZWR7Jf7U+7R2xutA+
	Zgqku0EWN4J7Qk459EhXtMN4WiTOGCuY14MEoKVe6CW/ClSP9UfvIkPv6WxNO6my6iqPzOP3TSlB6
	6NXTuKGP94hRjwNa7BCQIGv64I9GF7F3dvvjyMY749eJyulMB9l0XBwTD0ff9tmbBTItmoe/0SZOy
	uQyo9lIw==;
Received: from ip6-localhost ([::1]:25014 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1tkaan-00Cmpo-UA; Wed, 19 Feb 2025 03:17:46 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:50538) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1tkaaj-00Cmph-CS
 for samba-technical@lists.samba.org; Wed, 19 Feb 2025 03:17:44 +0000
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso6494421e87.1
 for <samba-technical@lists.samba.org>; Tue, 18 Feb 2025 19:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739935047; x=1740539847; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jc4SK/ypNCa99TVOhf7iBOOIGMc5Da5lSQe8phr48Xs=;
 b=XiE5GJ6UKLoHErzP7tpt2tQPsGa6VhMLwY1CArj1q0D+zwkToY9cnMyBE9kF0SEvYc
 hR9TxMkEgwzTuoANH35DKkJYyJpDzdPGeSD3y8KSWu1sRB2/Pt8P4ee+R50NXr+FV7qh
 E83TX4QBGgI7H6IAhJUn6zAVrUgDZYdso0Ll4aMSCAM9fHxtIgXDuQ5Z/XJMkKdEETyb
 dbiK4xCgToTsLZH9iMiiqFUiaLjKqobi+r+KEMgticPmbnaoC/j+YwcSwMtaSvhpN53v
 ztXtGwzw5M5dSiHaEmHQyOJvCBy4zTrsN/mI/jKlHQYPbP52ndfvLzz2WRdC9+hvZVPQ
 gWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739935047; x=1740539847;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jc4SK/ypNCa99TVOhf7iBOOIGMc5Da5lSQe8phr48Xs=;
 b=K+f4uFlgbxkyegF7NynzA6/QlCtX1WF1hFgTh05H5Vl7ZGcN0T5Ih37U4Q+7b5wYmV
 lW/DfeF0Jptog+nDIRV4HHmMR/XDEVCvvmol6Rv6wjVVnReW8rq7Rc8PjBrQYJaZwznj
 MZ7L4pCfRAnv2sUfw7s+BC3W7SD1fCDCHwa9mxe74oRKDdWr0/cO7lLb9PAtCB6p7F+Y
 GGV0XA7kUg/siOczHE99wSZHvuRNuixzIkREfZKRExyrlfqSRMaQYoOdoguVG7ha9qmP
 i9hyyI2AHfB7aaQoOIFDVIRHflG3FcOblKyeX6VPL7wh3Pwo7TcyHeCZ25NBryxtr0Qk
 Kopg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEmJpsrtk3IUjixfGHmYLfZ1rwj5NvfRon46fI0VYiLCBV4lEmNE7Cg1PKXYpx5xIlVSZZX5pbEYyFookFQqQ=@lists.samba.org
X-Gm-Message-State: AOJu0Yxic9Y+6BjbihsjEldwKW0sGRh+qiKxgWqqIjOxA8gNTzZzszcw
 ipnS8CFfgqwQx7CxIGtns9aOEw1/aKtfOBuny2LVBM6y03bCKuRJALw+dVLLL9Uu9sK8QUjqEU0
 rP34m8XVrwplsdWz8inddhmYSq8s=
X-Gm-Gg: ASbGncuBOUZYuALvJe60ovnImTeboJFUZAhiB0fZJegVlf9mu6mqKHkwk0EEKKvX6KU
 vfVJwKHGem60ODZpC4RLxo5hhSqSB4AzkyKowp6fc+gnm9TcrYwKV+DdPPm8ENf98XTBMeIP4
X-Google-Smtp-Source: AGHT+IFxJKGoclyOJjJQxX5v3qAXVEZ4JcKs4mqMuZtRGmhXeYroTfnfqhFdOjjnfblR/oqQiOeSRw5To3nWTm10HdU=
X-Received: by 2002:a05:6512:3990:b0:545:1d04:5dfc with SMTP id
 2adb3069b0e04-5452fe90435mr4628863e87.38.1739935047105; Tue, 18 Feb 2025
 19:17:27 -0800 (PST)
MIME-Version: 1.0
References: <20250218143005.1318886-1-wangzhaolong1@huawei.com>
In-Reply-To: <20250218143005.1318886-1-wangzhaolong1@huawei.com>
Date: Tue, 18 Feb 2025 21:17:15 -0600
X-Gm-Features: AWEUYZmHf1Ug11Hrb9rbPCwDczurfuOKWwK8qHukZXVFHorFtEfwStWz1SD7sbE
Message-ID: <CAH2r5muqxgPy=n4Aks_k-2goEZmmD10Dx3u3jgOk-LZ=-CHU9Q@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Fix netns refcount imbalance causing leaks
 and use-after-free
To: Wang Zhaolong <wangzhaolong1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: tom@talpey.com, linux-cifs@vger.kernel.org, ematsumiya@suse.de,
 yi.zhang@huawei.com, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, sfrench@samba.org, kuniyu@amazon.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

tentatively merged into cifs-2.6.git for-next pending more review and testi=
ng

On Tue, Feb 18, 2025 at 8:34=E2=80=AFAM Wang Zhaolong <wangzhaolong1@huawei=
.com> wrote:
>
> Commit ef7134c7fc48 ("smb: client: Fix use-after-free of network
> namespace.") attempted to fix a netns use-after-free issue by manually
> adjusting reference counts via sk->sk_net_refcnt and sock_inuse_add().
>
> However, a later commit e9f2517a3e18 ("smb: client: fix TCP timers deadlo=
ck
> after rmmod") pointed out that the approach of manually setting
> sk->sk_net_refcnt in the first commit was technically incorrect, as
> sk->sk_net_refcnt should only be set for user sockets. It led to issues
> like TCP timers not being cleared properly on close. The second commit
> moved to a model of just holding an extra netns reference for
> server->ssocket using get_net(), and dropping it when the server is torn
> down.
>
> But there remain some gaps in the get_net()/put_net() balancing added by
> these commits. The incomplete reference handling in these fixes results
> in two issues:
>
> 1. Netns refcount leaks[1]
>
> The problem process is as follows:
>
> ```
> mount.cifs                        cifsd
>
> cifs_do_mount
>   cifs_mount
>     cifs_mount_get_session
>       cifs_get_tcp_session
>         get_net()  /* First get net. */
>         ip_connect
>           generic_ip_connect /* Try port 445 */
>             get_net()
>             ->connect() /* Failed */
>             put_net()
>           generic_ip_connect /* Try port 139 */
>             get_net() /* Missing matching put_net() for this get_net().*/
>       cifs_get_smb_ses
>         cifs_negotiate_protocol
>           smb2_negotiate
>             SMB2_negotiate
>               cifs_send_recv
>                 wait_for_response
>                                  cifs_demultiplex_thread
>                                    cifs_read_from_socket
>                                      cifs_readv_from_socket
>                                        cifs_reconnect
>                                          cifs_abort_connection
>                                            sock_release();
>                                            server->ssocket =3D NULL;
>                                            /* Missing put_net() here. */
>                                            generic_ip_connect
>                                              get_net()
>                                              ->connect() /* Failed */
>                                              put_net()
>                                              sock_release();
>                                              server->ssocket =3D NULL;
>           free_rsp_buf
>     ...
>                                    clean_demultiplex_info
>                                      /* It's only called once here. */
>                                      put_net()
> ```
>
> When cifs_reconnect() is triggered, the server->ssocket is released
> without a corresponding put_net() for the reference acquired in
> generic_ip_connect() before. it ends up calling generic_ip_connect()
> again to retry get_net(). After that, server->ssocket is set to NULL
> in the error path of generic_ip_connect(), and the net count cannot be
> released in the final clean_demultiplex_info() function.
>
> 2. Potential use-after-free
>
> The current refcounting scheme can lead to a potential use-after-free iss=
ue
> in the following scenario:
>
> ```
>  cifs_do_mount
>    cifs_mount
>      cifs_mount_get_session
>        cifs_get_tcp_session
>          get_net()  /* First get net */
>            ip_connect
>              generic_ip_connect
>                get_net()
>                bind_socket
>                  kernel_bind /* failed */
>                put_net()
>          /* after out_err_crypto_release label */
>          put_net()
>          /* after out_err label */
>          put_net()
> ```
>
> In the exception handling process where binding the socket fails, the
> get_net() and put_net() calls are unbalanced, which may cause the
> server->net reference count to drop to zero and be prematurely released.
>
> To address both issues, this patch ties the netns reference counting to
> the server->ssocket and server lifecycles. The extra reference is now
> acquired when the server or socket is created, and released when the
> socket is destroyed or the server is torn down.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D219792
>
> Fixes: ef7134c7fc48 ("smb: client: Fix use-after-free of network namespac=
e.")
> Fixes: e9f2517a3e18 ("smb: client: fix TCP timers deadlock after rmmod")
> Signed-off-by: Wang Zhaolong <wangzhaolong1@huawei.com>
> ---
>  fs/smb/client/connect.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/fs/smb/client/connect.c b/fs/smb/client/connect.c
> index f917de020dd5..0d454149f3b4 100644
> --- a/fs/smb/client/connect.c
> +++ b/fs/smb/client/connect.c
> @@ -300,6 +300,7 @@ cifs_abort_connection(struct TCP_Server_Info *server)
>                          server->ssocket->flags);
>                 sock_release(server->ssocket);
>                 server->ssocket =3D NULL;
> +               put_net(cifs_net_ns(server));
>         }
>         server->sequence_number =3D 0;
>         server->session_estab =3D false;
> @@ -3115,8 +3116,12 @@ generic_ip_connect(struct TCP_Server_Info *server)
>                 /*
>                  * Grab netns reference for the socket.
>                  *
> -                * It'll be released here, on error, or in clean_demultip=
lex_info() upon server
> -                * teardown.
> +                * This reference will be released in several situations:
> +                * - In the failure path before the cifsd thread is start=
ed.
> +                * - In the all place where server->socket is released, i=
t is
> +                *   also set to NULL.
> +                * - Ultimately in clean_demultiplex_info(), during the f=
inal
> +                *   teardown.
>                  */
>                 get_net(net);
>
> @@ -3132,10 +3137,8 @@ generic_ip_connect(struct TCP_Server_Info *server)
>         }
>
>         rc =3D bind_socket(server);
> -       if (rc < 0) {
> -               put_net(cifs_net_ns(server));
> +       if (rc < 0)
>                 return rc;
> -       }
>
>         /*
>          * Eventually check for other socket options to change from
> @@ -3181,9 +3184,6 @@ generic_ip_connect(struct TCP_Server_Info *server)
>         if (sport =3D=3D htons(RFC1001_PORT))
>                 rc =3D ip_rfc1001_connect(server);
>
> -       if (rc < 0)
> -               put_net(cifs_net_ns(server));
> -
>         return rc;
>  }
>
> --
> 2.34.3
>
>


--=20
Thanks,

Steve

