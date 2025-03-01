Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1035BA4AE7A
	for <lists+samba-technical@lfdr.de>; Sun,  2 Mar 2025 00:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MEt2k7989x5yE6ObIXJKt9GP7mYl/bSZRL2jBwszNcI=; b=GIiYiUiVU5Qgml4lwrjq4S63H1
	Br6RqUsFQ+YdkN2/MAfSX0fWQ/YpVaECs9MQQ4LT5YYTukP1X0v1kjQPH6z/5UnWVp7NOQOLWZ/iy
	dqU7/IK2khphYEy9yoj9EBLJIU9nxRe58+AbxibhCLhDu28aKE1VFBqFljPyUlupZafZwiLO7Lqnf
	kTBpHQ3v+2/wBm5O/dBeMtHxOXncLIFpZzJneyo3HsmjmO+yoz1S8BIYIbiQ3JYvqm0uJUHJ9J/AX
	JOOGtsuT+hyuKvTcBNAzuIkw/PDoxCfF03HxwydaPo27LetfI2aAlGhHCfTSRTath06O20f5pfYvQ
	1jntNSWQ==;
Received: from ip6-localhost ([::1]:55224 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1toWXe-00FOqm-UP; Sat, 01 Mar 2025 23:46:47 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:55518) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1toWXZ-00FOqf-Qx
 for samba-technical@lists.samba.org; Sat, 01 Mar 2025 23:46:44 +0000
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-30b936ffc51so16603791fa.2
 for <samba-technical@lists.samba.org>; Sat, 01 Mar 2025 15:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740872800; x=1741477600; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MEt2k7989x5yE6ObIXJKt9GP7mYl/bSZRL2jBwszNcI=;
 b=S0pH7G2Ko9XeS5iZc1vajhG2PwEeS6otUuB/4DlX2gKD3CTL2u4GF9wRZTUaLDHB17
 HGiiGv5z1NIguk1JDjO3uUPs7ewDOqtxAPmdZSIuVCFZpZ8KJ8P+p6NAcyPE+KVtFbHk
 a04AiBxww+splxl+kPPZyyf26q58TtUNa2fx9Whb/wmgwwvPSGWcMSMtj/a4CeOpHA/v
 z9uiw+55IZ7i8gN3eM0wd91OhBDy+BGif37aJy6A9Tq2bhwiOrzGFwUfUS17zlztjz9X
 uP0/cgBfHdsmqukmFWXIlYMhuPIbgoB1h6o3NJl5s+a90/cqEO6DCfjVjkOyx4BN9Z0j
 D7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740872800; x=1741477600;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MEt2k7989x5yE6ObIXJKt9GP7mYl/bSZRL2jBwszNcI=;
 b=dvOSL/epuICyl5k4ufvaHFE22er3Lhc2rARUN4GOFIt0fuGOiVarvX5p10MI5PWSbn
 ciCyMAjLYpwPaLdVbiVGa5u4Cgk99SM3G5LrS11mrLj50NN8hhmYFcuW2cRzXGoTgiwF
 YgxYC5vpm6wDUf+JXQ2IdS3N28CUw7peV73frL6bqzPJtM3Ra64YvuWUmpKHKtYtBbmR
 WpSluNIeyuiisW6gQup68MP701Sxo/U+kd5ObUNEM3Hq9di5FaihRaRr8X1OLDEI6t9A
 /2AmS0P3sLbNtjdUpeqt7SbitCkWM5ZaMQ/LYhfF2X+0n4I2NdiNRUxi6Hw/5KXOMLzG
 hxnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWx/alCfPlqb6wXqubRD33+Um1IZIe3nMUT5JqmCwJ1fBsNv+LJ72eQJnsvupjFYxWtMWNrcwlxChEByK67eqo=@lists.samba.org
X-Gm-Message-State: AOJu0YyNr6+yrXYK+PLxCQJdKZiUwr2KpcicIYkrzBXvEJrey6EhjUuZ
 oz/FubjXe1uqMLk5EytLHxhMOjGEZK8gALGQ4H56s/WvdqEs2zpGhzADmgwsJU5vGFt6rHwt0aG
 5MPqWzlhdetgt1MFXx2Lb/+bDvb8=
X-Gm-Gg: ASbGnctNdUXo1d37U2nwFRBvkT87MMscdfbPYUv5i6vrLO+r1IZKt1H1E2OCIo9NGeO
 WBBnREbQTDi0w7ZdzYfZiqcWoF8NLug7dX/+6cSdISqRQcqi03VCozSja+beoYXyceA0xrD4ARU
 XAqmFWLoltyybwrROjvUkmhI/E+c7gnZ2qRQlzoX4moF7LEEYxBcIl7ZKv+dZA
X-Google-Smtp-Source: AGHT+IH6zu7Liq6af25Lvda/e90+Z+oabnotgxoE4Iy77QomhdmjoGpy4haMQrKCrdKzihm2Rn2Ftpv8gaB8oIu5WK0=
X-Received: by 2002:a05:6512:3b0c:b0:549:39ca:13fc with SMTP id
 2adb3069b0e04-5494c39011amr3475943e87.49.1740872799297; Sat, 01 Mar 2025
 15:46:39 -0800 (PST)
MIME-Version: 1.0
References: <20250218143005.1318886-1-wangzhaolong1@huawei.com>
In-Reply-To: <20250218143005.1318886-1-wangzhaolong1@huawei.com>
Date: Sat, 1 Mar 2025 17:46:27 -0600
X-Gm-Features: AQ5f1Jo-TcMpCDd1mt5gInAtB8m-Aq_V5ESxjl_nKowzPsnPgKcByHT332S7fgM
Message-ID: <CAH2r5mstBkj5-aHcXLpb8YzrDHS+nWhW+i_Kf8eJK15sFmJx8A@mail.gmail.com>
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
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, ematsumiya@suse.de,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, tom@talpey.com,
 kuniyu@amazon.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I was looking at this patch in more detail, and it does look important
but I wanted to clarify a few things.  In your detailed description
you mention that the retry on port 139 is missing a call put_net(0

>         ip_connect
>           generic_ip_connect /* Try port 445 */
>             get_net()
>             ->connect() /* Failed */
>             put_net()
>           generic_ip_connect /* Try port 139 */
>             get_net() /* Missing matching put_net() for this get_net().*/

but I found this confusing because generic_ip_connect() doesn't seem
to treat the port 445 vs. port 139 differently (there are only two
places the function does put_net() and the latter on line 3421 looks
like the only one that matters for your example).  Here is the snippet
from generic_ip_connect().  Could you explain why the retry on port
139 example is different here?

        rc =3D kernel_connect(socket, saddr, slen,
                            server->noblockcnt ? O_NONBLOCK : 0);
        /*
         * When mounting SMB root file systems, we do not want to block in
         * connect. Otherwise bail out and then let cifs_reconnect() perfor=
m
         * reconnect failover - if possible.
         */
        if (server->noblockcnt && rc =3D=3D -EINPROGRESS)
                rc =3D 0;
        if (rc < 0) {
                cifs_dbg(FYI, "Error %d connecting to server\n", rc);
                trace_smb3_connect_err(server->hostname,
server->conn_id, &server->dstaddr, rc);
                put_net(cifs_net_ns(server));
                sock_release(socket);
                server->ssocket =3D NULL;
                return rc;
        }




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

