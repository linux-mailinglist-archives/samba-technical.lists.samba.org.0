Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A68B18FCF
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 20:01:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=8IBAb1U4AHGolLyRh4wnILWJ7YPjMF8I4QRhEu/lDNQ=; b=MGd6kl4f3MD3XLdeTOAKt4bJmu
	DkzwzqqVy1/Nf7+85teEk8VlB9M4ELZLyzSLT3/hxosLg7Gb5lgX7DLbC1ORMAeiXiiluwufNg18t
	/DAxi56a2hLUIetu9Lgtf2/UhXIZ+pt9sQAgEX45ZAoQMbMWxLa2HdHI4cVUNOQr7NtOKWKxQWFpA
	7EE7u77CZihI9X/WCA+1NysZqI3L0+7g91pVpgAIVp/L2xdHWsUk3BEhVqmqOWMT/fZ311ErXUR05
	xv62bwDXU0KZNxPOZzgFgzVRVIMrLAjOJ+GDCVsBIespM8nGtbU580niqIGaCsGTLurqUXho0Aj+Y
	Sg8Bq0qA==;
Received: from localhost ([::1]:50124 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOnLe-0035is-1a; Thu, 09 May 2019 18:00:50 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:39381) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOnLZ-0035il-UB
 for samba-technical@lists.samba.org; Thu, 09 May 2019 18:00:48 +0000
Received: by mail-lf1-x142.google.com with SMTP id f1so2208521lfl.6
 for <samba-technical@lists.samba.org>; Thu, 09 May 2019 11:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8IBAb1U4AHGolLyRh4wnILWJ7YPjMF8I4QRhEu/lDNQ=;
 b=oZz3d9Y8lqRxl8XUFIBauj79NFGzhaIgVCsRnDu+nHqOgGtg/KfXxBmtyEa4iYIAtR
 3ODP2NMrBGgfZUJbb3He9Ow/q7sqqEwi2lXjijncwPpBDRMY1qvFJdwVEcJ1AkgQ+QbZ
 gOPJhJwu+BPpBnbR0OosoLxmUAZOL+XHUDJwPOpIhXwKC6/AOp8VtkhtzADVEQTc7p7Q
 aaCwVlKMM+RMkmMm05UC8VXUEHPoPZXzWexnQS+99CT3OepvNZFWeLmptO/2H0sc+EOE
 zLuheTVRB9E3d138PWMdUm7+LgWv3gLjaIWP7Y6tHlG0zxcF4FQ2oV2q0P+iya7Nf8ax
 F/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8IBAb1U4AHGolLyRh4wnILWJ7YPjMF8I4QRhEu/lDNQ=;
 b=CVG4WJGOBwa4JLupZAhN4gNzbZZos3v3+LOLa28ImcfHmOgMWKO2SlgSOYFqfjR09/
 UwyzXVzAg2RqPZQfml6FO7AQl3DxGiIsxH5AZFnrk3piI4toVWbNfoA9mqurXj94wREo
 hdfvlJfBuTRZJoP9HIyN1mae1styhYzrhWNPMZ8MGmbxhHjuOYaxsCls9SQPYc0KJ/yO
 20E6dUKhxEtSJy5VKWjaFBKucpuxjgCK+4ZgnXwerqUWqGf1J/Uv4uKd1gH8R0lXILGC
 IYY9GZ07v4Cc3JwMikR5CVu/v98ci1sdEnM+qICk6WgMjhVMPVmm2QhxPgB+ZiSoLTMg
 EUUw==
X-Gm-Message-State: APjAAAV69Syf216CUTW9ZU/Yr6jlqQcZzVoPfb4Lt+Kasldnhc4VvqVg
 Ma5j+3yc+XjZSVEx279EErHZ+yGuxt/wVVGWfg==
X-Google-Smtp-Source: APXvYqxKDfL6B/hHddJAL2/0n2LWN+cD1YcUAbcuH9yCTFjqDi1jJQvIGvWp1Qc5qQHXGFmXLqei6h3DJQBXw/uWScU=
X-Received: by 2002:a19:fc04:: with SMTP id a4mr3210598lfi.39.1557424842743;
 Thu, 09 May 2019 11:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190405213635.24383-1-longli@linuxonhyperv.com>
 <20190405213635.24383-5-longli@linuxonhyperv.com>
In-Reply-To: <20190405213635.24383-5-longli@linuxonhyperv.com>
Date: Thu, 9 May 2019 11:00:31 -0700
Message-ID: <CAKywueTBsHuBOchj7ysL8S+pU=nL6dfF65YT9YZrVk74HUoRVQ@mail.gmail.com>
Subject: Re: [Patch (resend) 5/5] cifs: Call MID callback before destroying
 transport
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

=D0=BF=D1=82, 5 =D0=B0=D0=BF=D1=80. 2019 =D0=B3. =D0=B2 14:39, Long Li <lon=
gli@linuxonhyperv.com>:
>
> From: Long Li <longli@microsoft.com>
>
> When transport is being destroyed, it's possible that some processes may
> hold memory registrations that need to be deregistred.
>
> Call them first so nobody is using transport resources, and it can be
> destroyed.
>
> Signed-off-by: Long Li <longli@microsoft.com>
> ---
>  fs/cifs/connect.c | 36 +++++++++++++++++++-----------------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 33e4d98..084756cf 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -528,22 +528,6 @@ cifs_reconnect(struct TCP_Server_Info *server)
>         /* do not want to be sending data on a socket we are freeing */
>         cifs_dbg(FYI, "%s: tearing down socket\n", __func__);
>         mutex_lock(&server->srv_mutex);
> -       if (server->ssocket) {
> -               cifs_dbg(FYI, "State: 0x%x Flags: 0x%lx\n",
> -                        server->ssocket->state, server->ssocket->flags);
> -               kernel_sock_shutdown(server->ssocket, SHUT_WR);
> -               cifs_dbg(FYI, "Post shutdown state: 0x%x Flags: 0x%lx\n",
> -                        server->ssocket->state, server->ssocket->flags);
> -               sock_release(server->ssocket);
> -               server->ssocket =3D NULL;
> -       } else if (cifs_rdma_enabled(server))
> -               smbd_destroy(server);
> -       server->sequence_number =3D 0;
> -       server->session_estab =3D false;
> -       kfree(server->session_key.response);
> -       server->session_key.response =3D NULL;
> -       server->session_key.len =3D 0;
> -       server->lstrp =3D jiffies;
>
>         /* mark submitted MIDs for retry and issue callback */
>         INIT_LIST_HEAD(&retry_list);
> @@ -556,7 +540,6 @@ cifs_reconnect(struct TCP_Server_Info *server)
>                 list_move(&mid_entry->qhead, &retry_list);
>         }
>         spin_unlock(&GlobalMid_Lock);
> -       mutex_unlock(&server->srv_mutex);
>
>         cifs_dbg(FYI, "%s: issuing mid callbacks\n", __func__);
>         list_for_each_safe(tmp, tmp2, &retry_list) {
> @@ -565,6 +548,25 @@ cifs_reconnect(struct TCP_Server_Info *server)
>                 mid_entry->callback(mid_entry);
>         }

The original call was issuing callbacks without holding srv_mutex -
callbacks may take this mutex for its internal needs. With the
proposed patch the code will deadlock.

Also the idea of destroying the socket first is to allow possible
retries (from callbacks) to return a proper error instead of trying to
send anything through the reconnecting socket.

>
> +       if (server->ssocket) {
> +               cifs_dbg(FYI, "State: 0x%x Flags: 0x%lx\n",
> +                        server->ssocket->state, server->ssocket->flags);
> +               kernel_sock_shutdown(server->ssocket, SHUT_WR);
> +               cifs_dbg(FYI, "Post shutdown state: 0x%x Flags: 0x%lx\n",
> +                        server->ssocket->state, server->ssocket->flags);
> +               sock_release(server->ssocket);
> +               server->ssocket =3D NULL;
> +       } else if (cifs_rdma_enabled(server))
> +               smbd_destroy(server);

If we need to call smbd_destroy() *after* callbacks, let's just move
it alone without the rest of the code.


> +       server->sequence_number =3D 0;
> +       server->session_estab =3D false;
> +       kfree(server->session_key.response);
> +       server->session_key.response =3D NULL;
> +       server->session_key.len =3D 0;
> +       server->lstrp =3D jiffies;
> +
> +       mutex_unlock(&server->srv_mutex);
> +
>         do {
>                 try_to_freeze();
>
> --
> 2.7.4
>


--
Best regards,
Pavel Shilovsky

