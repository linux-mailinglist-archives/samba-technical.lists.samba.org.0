Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CDB1D114
	for <lists+samba-technical@lfdr.de>; Tue, 14 May 2019 23:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5HK6LtklZKGH421gmcApL4yH8ev/jh7IW3djR5lopgw=; b=MDIpVKqlAJY5RSikqiZ3LN38v8
	B4cmhlh32OqitcK7qxV3oAa48Y7d/F6B/zpvIntalIpoT772bZu5h2z3BFaX6yF3ALDs4ajCzuToi
	cUfjwc+nStiYpwXb/re6jXORKBVMivRt94g7wWgf4YrRtE4JzA5Ax2TlvZjh8F3Q8gN1RwkGZ1MsD
	vb/mb/18b8UcLMegI+9ilg3aMGUCt9CPmywwIyRSoid7HvdnvT6A9ZzUdGmwMyQhWvpynkneLdY09
	5702yKCoZbQWrJgErz9Hbg4L9gnksdQVkTDJZpkRbfRjlsbFlV03sPvPi0+/5hqTPA5AiDlmvrk+i
	rTsnQjlg==;
Received: from localhost ([::1]:56986 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hQeib-003fDV-89; Tue, 14 May 2019 21:12:13 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:40906) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hQeiW-003fDO-Lx
 for samba-technical@lists.samba.org; Tue, 14 May 2019 21:12:10 +0000
Received: by mail-lj1-x241.google.com with SMTP id d15so544731ljc.7
 for <samba-technical@lists.samba.org>; Tue, 14 May 2019 14:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5HK6LtklZKGH421gmcApL4yH8ev/jh7IW3djR5lopgw=;
 b=dKwbqJc6C6lhuaCVZTUW26OKn8zL9FapIRRRZ98ruAxPUzpFY65+LkXuSqYRAO/rMR
 wofjKbtpNBpZipTh5qnJ/eH+pZ47J+IyZF4t1oyjXEY95Jm6o1ldXtWmWM0c8wSvHi0E
 6b0O3DeL5GSFYUUSfs8Kb1142It4qw8DwUNvGhfouTYHQOfdBdVUbNV8e41+lV6yeSLn
 OQSSpRAQC8T1wh1LTw7puOP2vpAcIGu0B5KBMn6omhgAK/DnaXQcKgRYOewMvSZZRGsh
 p+CJj+UAshO4080ixCjUq9PkhcSi8xeUDT5IWyHASMRwyHx6ZXajyZeSqdtcqzc+iAUd
 gwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5HK6LtklZKGH421gmcApL4yH8ev/jh7IW3djR5lopgw=;
 b=XpafRra4KgpP6Gexb3UU87aPKAWPlY/f8XkOo9wOWGf8s/X07V8exIaPQKB6SO4jKI
 zs2nM4RYhE5BfvwhnEdptHPIZxcKllkQxV9XDhQkWGVGry7aI0vrEE81suo7/amqkzCQ
 me5X2Cjk1J9OfG/a/TGzzSoDK0CSc15N1PpygRlCDS9/jxeRzLndxOIpDx1V50Q2ml0D
 vNCBHBJ8k25ttwDaPDazm5cIhsR2LJJSgO4Aj3albuMT0AzvPuTIMS4fzQWEL+OmMaMH
 VjeLfpx6i1YZ4UZ48MiQsqIT1mr9uIxZENw/0x4E6DyFnWbSC6XUGyacN5z97yM85LRZ
 1Fmg==
X-Gm-Message-State: APjAAAVWvykTbCL+Er5i/WeY3/kciDx4vlpokANGdZ1/S5Ab6THvmQFM
 GjAYA0WPqe8AIwC07qJy+gfNiz13fON0tywNUA==
X-Google-Smtp-Source: APXvYqxkuip2D74Iaik0DhKwZgR5cPse/BklawSVOzA4jrvdNT6zJd147/ff+853912d6dH99v3+R082z4X0xe6qF1Y=
X-Received: by 2002:a2e:96da:: with SMTP id d26mr8743538ljj.9.1557868327733;
 Tue, 14 May 2019 14:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <1557806489-11272-1-git-send-email-longli@linuxonhyperv.com>
In-Reply-To: <1557806489-11272-1-git-send-email-longli@linuxonhyperv.com>
Date: Tue, 14 May 2019 14:11:56 -0700
Message-ID: <CAKywueTP17C6khnDauXYOfs9CG35bvZq8pQeKzrMJvSBE=sPfg@mail.gmail.com>
Subject: Re: [PATCH 1/2] cifs:smbd When reconnecting to server, call
 smbd_destroy() after all MIDs have been called
To: Long Li <longli@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D0=BD, 13 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 21:02, <longli@linu=
xonhyperv.com>:
>
> From: Long Li <longli@microsoft.com>
>
> commit 214bab448476 ("cifs: Call MID callback before destroying transport=
")
> assumes that the MID callback should not take srv_mutex, this may not alw=
ays
> be true. SMB Direct requires the MID callback completed before calling
> transport so all pending memory registration can be freed. So restore the
> orignal calling sequence so TCP transport will use the same code, but mov=
ing
> smbd_destroy() after all MID has been called.
>
> fixes: 214bab448476 ("cifs: Call MID callback before destroying transport=
")
> Signed-off-by: Long Li <longli@microsoft.com>
> ---
>  fs/cifs/connect.c | 37 ++++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 084756cfdaee..0b3ac8b76d18 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -528,6 +528,21 @@ cifs_reconnect(struct TCP_Server_Info *server)
>         /* do not want to be sending data on a socket we are freeing */
>         cifs_dbg(FYI, "%s: tearing down socket\n", __func__);
>         mutex_lock(&server->srv_mutex);
> +       if (server->ssocket) {
> +               cifs_dbg(FYI, "State: 0x%x Flags: 0x%lx\n",
> +                        server->ssocket->state, server->ssocket->flags);
> +               kernel_sock_shutdown(server->ssocket, SHUT_WR);
> +               cifs_dbg(FYI, "Post shutdown state: 0x%x Flags: 0x%lx\n",
> +                        server->ssocket->state, server->ssocket->flags);
> +               sock_release(server->ssocket);
> +               server->ssocket =3D NULL;
> +       }
> +       server->sequence_number =3D 0;
> +       server->session_estab =3D false;
> +       kfree(server->session_key.response);
> +       server->session_key.response =3D NULL;
> +       server->session_key.len =3D 0;
> +       server->lstrp =3D jiffies;
>
>         /* mark submitted MIDs for retry and issue callback */
>         INIT_LIST_HEAD(&retry_list);
> @@ -540,6 +555,7 @@ cifs_reconnect(struct TCP_Server_Info *server)
>                 list_move(&mid_entry->qhead, &retry_list);
>         }
>         spin_unlock(&GlobalMid_Lock);
> +       mutex_unlock(&server->srv_mutex);
>
>         cifs_dbg(FYI, "%s: issuing mid callbacks\n", __func__);
>         list_for_each_safe(tmp, tmp2, &retry_list) {
> @@ -548,24 +564,11 @@ cifs_reconnect(struct TCP_Server_Info *server)
>                 mid_entry->callback(mid_entry);
>         }
>
> -       if (server->ssocket) {
> -               cifs_dbg(FYI, "State: 0x%x Flags: 0x%lx\n",
> -                        server->ssocket->state, server->ssocket->flags);
> -               kernel_sock_shutdown(server->ssocket, SHUT_WR);
> -               cifs_dbg(FYI, "Post shutdown state: 0x%x Flags: 0x%lx\n",
> -                        server->ssocket->state, server->ssocket->flags);
> -               sock_release(server->ssocket);
> -               server->ssocket =3D NULL;
> -       } else if (cifs_rdma_enabled(server))
> +       if (cifs_rdma_enabled(server)) {
> +               mutex_lock(&server->srv_mutex);
>                 smbd_destroy(server);
> -       server->sequence_number =3D 0;
> -       server->session_estab =3D false;
> -       kfree(server->session_key.response);
> -       server->session_key.response =3D NULL;
> -       server->session_key.len =3D 0;
> -       server->lstrp =3D jiffies;
> -
> -       mutex_unlock(&server->srv_mutex);
> +               mutex_unlock(&server->srv_mutex);
> +       }
>
>         do {
>                 try_to_freeze();
> --
> 2.17.1
>

Thanks for quickly fixing it!

Reviewed-by: Pavel Shilovsky <pshilov@microsoft.com>

--
Best regards,
Pavel Shilovsky

