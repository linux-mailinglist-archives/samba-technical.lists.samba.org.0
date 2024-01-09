Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A04A6827DEC
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jan 2024 05:42:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=I63vcM6VvyO1LXNd6PYP30FAKknBe/hWRBhtNWHXuu0=; b=y896bgp7ONUym0MtO78fDR96Th
	Fg7UxSWBJ8b9F/8WeD3OqZfyO12lGTafSeEAd+snwR4bwajCsA+MgNX28hgZ7ejQ4HlfPePyXrZzC
	yFWxOcj/1hVtErzjDpw8Mq8ZpdU4QhrMohUsieTyVo3eVBxfGICa5DEzCb3XO4tNXQuYdF8MxKbRK
	7r//Y+EGCufeqqEQ2WhG7ue36LnVPJ9dHXmXWDwxZGShTKLNKLZvs6Wyd3cyWw7gd8A1Q/lcAgC+D
	wamQkzqkEEZu212/r4oHvnaz+mIWPaUN+gI69sRii0hKhwV/eq/WMmDGd4tcwbonudWAeN6YEEjgm
	5B/d/Ceg==;
Received: from ip6-localhost ([::1]:22918 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rN3wf-002qnG-74; Tue, 09 Jan 2024 04:42:33 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c]:44345) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rN3wV-002qmU-2E
 for samba-technical@lists.samba.org; Tue, 09 Jan 2024 04:42:27 +0000
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2ccae380df2so26830261fa.1
 for <samba-technical@lists.samba.org>; Mon, 08 Jan 2024 20:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704775342; x=1705380142; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I63vcM6VvyO1LXNd6PYP30FAKknBe/hWRBhtNWHXuu0=;
 b=eWwOlZd3B0AH2P6ZIbK7tmeZPEzDsMh3CvetKZu3CRljCyle1MdiJSs8UTCSaXf1Id
 rIsbtBNVFol8Epjs+8wJPzjDZoCRWZuIWkqOOtIHar1Mn9gHW1D3m23cfVdza61kcshm
 LM4FAZACioNmWfVf3Z7dfEY5cDHn0HhJWYIZbW7bT6JeGcgJ/1+jefNWI6dai40N1m0k
 p7J2vAUN6wWZ6/p+ZaoGmoMzMwjVOo/eQ7HRs5cZJiJt7yEnY8V9z25XHYAX213RQijp
 XnwiZbYylZYD7f/yjtlJ2McYh7E/x3xsUad9o0Qoi7weU6y+Vx1E97wZclbKj/pGX2ij
 TwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704775342; x=1705380142;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I63vcM6VvyO1LXNd6PYP30FAKknBe/hWRBhtNWHXuu0=;
 b=kiB1LDdKBiwLJVASvnoZ0Tdmkm++CesMxeUsUMQka8t0mn2WWTHASntaD9XPTkFBlm
 5vwclhu4mP3H/X2TmEkbuRz/Mu0Qp9Q2ujs+ePTHrZprCjT8fbTaR5kSfFtdPBCG2S0v
 SY++zgPmawtoYcdRBLI+Mi2++02Dh/eywVv7CzGBOvG+ArTW0JLYKzCx+w9tLpxVnyP+
 MkZD/7C/q07ivM6WN2dRvgYlYimu4tivDorg1F3RUVPPUkfpCF9ZhkbY1OKi7pr5nKI7
 0DgrL75HqGPs0i0HJu6W+KKYHiwUS854dzlW9B2b1btH5X8joLREtGlQ4ljQbyW1uGP2
 PkLw==
X-Gm-Message-State: AOJu0Yx/EfFiCgiZWgW4juEoo9UqUW2w6DhIgx2W/xLUvM3GTIn3BVCw
 gtgFQ6oSq3kJ9dt9laxL0ht1d3lBuzs4GKJg/7Q=
X-Google-Smtp-Source: AGHT+IGlWO/crxssD7G8T7bGrJFxwh18/msP4T2w5C6mhigQ2+NmzCIZ8acYfvh7C5f8yyUTK3LWCZPhg4kznLXHX8w=
X-Received: by 2002:a2e:b88c:0:b0:2cd:494b:b4b4 with SMTP id
 r12-20020a2eb88c000000b002cd494bb4b4mr1626422ljp.16.1704775341837; Mon, 08
 Jan 2024 20:42:21 -0800 (PST)
MIME-Version: 1.0
References: <b628a706-d356-4629-a433-59dfda24bb94@moroto.mountain>
 <eac139a7-76d4-4067-8c25-15e30692aaf9@moroto.mountain>
In-Reply-To: <eac139a7-76d4-4067-8c25-15e30692aaf9@moroto.mountain>
Date: Mon, 8 Jan 2024 22:42:10 -0600
Message-ID: <CAH2r5mt5FhiU15UL62JfferJG_AfF4iw6nd96PnEusWPF40AEQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] cifs: make cifs_chan_update_iface() a void function
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: Paulo Alcantara <pc@manguebit.com>, Tom Talpey <tom@talpey.com>,
 Shyam Prasad N <sprasad@microsoft.com>, linux-cifs@vger.kernel.org,
 kernel-janitors@vger.kernel.org, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Jan 8, 2024 at 3:08=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> The return values for cifs_chan_update_iface() didn't match what the
> documentation said and nothing was checking them anyway.  Just make it
> a void function.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/smb/client/cifsproto.h |  2 +-
>  fs/smb/client/sess.c      | 17 +++++++----------
>  2 files changed, 8 insertions(+), 11 deletions(-)
>
> diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
> index afbab86331a1..a841bf4967fa 100644
> --- a/fs/smb/client/cifsproto.h
> +++ b/fs/smb/client/cifsproto.h
> @@ -656,7 +656,7 @@ cifs_chan_is_iface_active(struct cifs_ses *ses,
>                           struct TCP_Server_Info *server);
>  void
>  cifs_disable_secondary_channels(struct cifs_ses *ses);
> -int
> +void
>  cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *ser=
ver);
>  int
>  SMB3_request_interfaces(const unsigned int xid, struct cifs_tcon *tcon, =
bool in_mount);
> diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
> index 775c6a4a2f4b..f7b216dd06b2 100644
> --- a/fs/smb/client/sess.c
> +++ b/fs/smb/client/sess.c
> @@ -356,10 +356,9 @@ cifs_disable_secondary_channels(struct cifs_ses *ses=
)
>
>  /*
>   * update the iface for the channel if necessary.
> - * will return 0 when iface is updated, 1 if removed, 2 otherwise
>   * Must be called with chan_lock held.
>   */
> -int
> +void
>  cifs_chan_update_iface(struct cifs_ses *ses, struct TCP_Server_Info *ser=
ver)
>  {
>         unsigned int chan_index;
> @@ -368,20 +367,19 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct=
 TCP_Server_Info *server)
>         struct cifs_server_iface *old_iface =3D NULL;
>         struct cifs_server_iface *last_iface =3D NULL;
>         struct sockaddr_storage ss;
> -       int rc =3D 0;
>
>         spin_lock(&ses->chan_lock);
>         chan_index =3D cifs_ses_get_chan_index(ses, server);
>         if (chan_index =3D=3D CIFS_INVAL_CHAN_INDEX) {
>                 spin_unlock(&ses->chan_lock);
> -               return 0;
> +               return;
>         }
>
>         if (ses->chans[chan_index].iface) {
>                 old_iface =3D ses->chans[chan_index].iface;
>                 if (old_iface->is_active) {
>                         spin_unlock(&ses->chan_lock);
> -                       return 1;
> +                       return;
>                 }
>         }
>         spin_unlock(&ses->chan_lock);
> @@ -394,7 +392,7 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct T=
CP_Server_Info *server)
>         if (!ses->iface_count) {
>                 spin_unlock(&ses->iface_lock);
>                 cifs_dbg(VFS, "server %s does not advertise interfaces\n"=
, ses->server->hostname);
> -               return 0;
> +               return;
>         }
>
>         last_iface =3D list_last_entry(&ses->iface_list, struct cifs_serv=
er_iface,
> @@ -434,7 +432,6 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct T=
CP_Server_Info *server)
>         }
>
>         if (list_entry_is_head(iface, &ses->iface_list, iface_head)) {
> -               rc =3D 1;
>                 iface =3D NULL;
>                 cifs_dbg(FYI, "unable to find a suitable iface\n");
>         }
> @@ -449,7 +446,7 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct T=
CP_Server_Info *server)
>                 }
>
>                 spin_unlock(&ses->iface_lock);
> -               return 0;
> +               return;
>         }
>
>         /* now drop the ref to the current iface */
> @@ -478,13 +475,13 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct=
 TCP_Server_Info *server)
>         chan_index =3D cifs_ses_get_chan_index(ses, server);
>         if (chan_index =3D=3D CIFS_INVAL_CHAN_INDEX) {
>                 spin_unlock(&ses->chan_lock);
> -               return 0;
> +               return;
>         }
>
>         ses->chans[chan_index].iface =3D iface;
>         spin_unlock(&ses->chan_lock);
>
> -       return rc;
> +       return;
>  }
>
>  /*
> --
> 2.42.0
>
>


--=20
Thanks,

Steve

