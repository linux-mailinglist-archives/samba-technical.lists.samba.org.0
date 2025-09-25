Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 504A3B9D513
	for <lists+samba-technical@lfdr.de>; Thu, 25 Sep 2025 05:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bIK7aUYfmSEbOwNlXiG3VqvRSfHmRXXXHr1UU8T6Rgk=; b=rALy1V6MNsjfucQ2R+Yj8F3s0/
	bBP8973/yqA3SZq0+VzIRvxg0Miun/3bXQjP7dSWruJ9/8XEUyIswVvwCeVhlFcCI7mhpCfyqpf+T
	iWtSQywKP6Qagl/wE2oJR5w1yju2BK5bUxElLU1aIZ/DUbJk6GvKH9/KbMCQaYvuO4UbC+dg7Y0s8
	Ys3SnT1OailaTqjFtpQcDOSBWtMkRt7uWDvXWoOo/AglwFJksjQR1R2zf8iokryZP1Nbs0eAFgaHI
	ggVTPHq67J3lkIVGrg8zY02XQjZFzozrQ6637d//Nd6AxqgHRVRXOAfYIVe7CIWg0if8a0ZH4z5Tt
	oI3EkFcw==;
Received: from ip6-localhost ([::1]:39282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v1clk-004hkE-7p; Thu, 25 Sep 2025 03:35:44 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:57850) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v1cle-004hk7-0E
 for samba-technical@lists.samba.org; Thu, 25 Sep 2025 03:35:41 +0000
Received: by mail-qv1-xf30.google.com with SMTP id
 6a1803df08f44-78eba712e89so3531176d6.3
 for <samba-technical@lists.samba.org>; Wed, 24 Sep 2025 20:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758771335; x=1759376135; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bIK7aUYfmSEbOwNlXiG3VqvRSfHmRXXXHr1UU8T6Rgk=;
 b=M8fkPMLt7HIVytlGIudfZB0xcTCPqG04K9p4IYsVWQzTqEQUJyptQs5A79ss2gneRK
 yZzGGnXGMZYO5A4nxO9QGY/HX9uGczH8oA/fSJO/JWh5ZBCITlaNySIjziq1BghtuWaB
 ITUQwufRi7yBTX+2plKMtAsSGhg9allxHnYJoZD0TmmcHdY9GV0yin/uZssyv8gpyjfZ
 lH9hoIAO8QWoyiX5oNWKN7Cl1wAvX20ZwVZS6RwyqPQPsLCVWGoUxFoFVK11FU8O6+hh
 F/c5uXYtmGCMXSlU89pPKcxY4D5qzNpLyqDu5NcCtf1WfudNTQAWK9LtSV9uWRRnfLkN
 y0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758771335; x=1759376135;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bIK7aUYfmSEbOwNlXiG3VqvRSfHmRXXXHr1UU8T6Rgk=;
 b=DiKsmg8mzZrPyNpU+ZVdtd8oue6QN7qKYVJTqKOu7CzU1uuIUkGziR9q65JFX5YE6U
 v8pE0mGweqbE4UQQPdChQfDTUyr7zSab/bpiaPIZP96YFzYE7GuiXAN/ydW1JmbthMRJ
 tosH5nyadr+uV2Fo3yNEmmznHfpgzqKHYBPPXlqQ19cWuUJVgDsCMR1qflS6FJotnvGe
 Yf8Pvy2XQoo2WS/DMavOYU0ZlGnhbGqimuDXz1Kade8guKnTrB7gUhtdHis4hEsnYA1P
 5K1ZgDvDyZHFzRYNHt/mVxdqa+ccNR9fYGVuJNyURKroX2g1vqpC1vjZFjCYcIPhDkh8
 g4Zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8+WBak9QuvaX9PxOmLhqx9O9jPc+kYiSic5k7hi/Wf9YMvmQV7BoxUEEtjIEj7cXu4ixvhqgM+OcHn8F+v6w=@lists.samba.org
X-Gm-Message-State: AOJu0YyvYq0v433cTJrzp2BTAYSWO6ZGYPi8x1pGsftNrbCkML+MKbNO
 mSC2rAYdyZCGR54z5WF9vBhdE/JhYixOJzPdpastsQqL8a5Hard1RuHspLfpprLtwcKQ0jIVQyr
 4t24MKoTqHqlzLDv+HRBd55vg4+47qJ0=
X-Gm-Gg: ASbGnct64StiZlOGmPGxsvXo3ke68/F1VERsv1GPglZwAfnObbu0dNoHilBx00HkE2o
 bhn8X6otTujQEXklObYJ2tDjbr/wxI5UsTSYDonSDTYf41HANqKwXqb6fkBtUd274mar4QpREyz
 5jwAOuaUr0Pp7IUJ6AGQtascJArWgLMqKfGYn3BXHqMCGk2fMSJYPZGvfybUyea81U/N0nmIvEu
 Ko8ZP3WgwO4pcuRhZzkuQG+kBtPJcZs2Od/8ju2j0X8Fa3a5pxKV2F53iBKXCxy7qPZA1aAIZxJ
 ZnFn2cZJzcYsj/X7ttc4wT3IvfhSiDERuFQxaPZnt0oPuvVxWY0b2+cZWABiREPhRT/BkH2Isuw
 DhsRXwQdA3qN7ILZpfPBx
X-Google-Smtp-Source: AGHT+IEZH9SVd9zNx7E67aDdhvo1VrGsYKoyoHRwQsrcWXJN0UfaGH315HI8D1XGrV+kBCTwmo3R27/OfYmsZ1b5NzY=
X-Received: by 2002:a05:6214:2685:b0:787:907:d26a with SMTP id
 6a1803df08f44-7fc33707691mr30923466d6.29.1758771335479; Wed, 24 Sep 2025
 20:35:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250923191417.237112-1-henrique.carvalho@suse.com>
In-Reply-To: <20250923191417.237112-1-henrique.carvalho@suse.com>
Date: Wed, 24 Sep 2025 22:35:23 -0500
X-Gm-Features: AS18NWDsftARsDtzivWKVHqtDfJ3cUMPj0Ue2G85HsbH0amnZXjeIfCBcw4PztQ
Message-ID: <CAH2r5mv5LjdD4OkC4SGkywTA4bMu0X7eQJqu4UhJVNNrzL+O4A@mail.gmail.com>
Subject: Re: [PATCH] smb: client: add tcon information to smb2_reconnect()
 debug messages
To: Henrique Carvalho <henrique.carvalho@suse.com>
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
Cc: tom@talpey.com, sprasad@microsoft.com, pc@manguebit.org,
 linux-cifs@vger.kernel.org, ematsumiya@suse.de,
 samba-technical@lists.samba.org, sfrench@samba.org, bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged (the revised patch sent later by Hernrique) to cifs-2.6.git for-next

Good catch - looks useful for debugging in future

On Tue, Sep 23, 2025 at 2:17=E2=80=AFPM Henrique Carvalho
<henrique.carvalho@suse.com> wrote:
>
> smb2_reconnect() debug messages lack tcon context, making it hard to
> identify which tcon is reconnecting in multi-share environments.
>
> Change cifs_dbg() to cifs_tcon_dbg() to include tcon information.
>
> Closes: https://bugzilla.suse.com/show_bug.cgi?id=3D1234066
> Signed-off-by: Henrique Carvalho <henrique.carvalho@suse.com>
> ---
>  fs/smb/client/smb2pdu.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/fs/smb/client/smb2pdu.c b/fs/smb/client/smb2pdu.c
> index c3b9d3f6210f..9e3b2cb7b5cd 100644
> --- a/fs/smb/client/smb2pdu.c
> +++ b/fs/smb/client/smb2pdu.c
> @@ -240,8 +240,8 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tcon =
*tcon,
>                  */
>                 if (smb2_command !=3D SMB2_TREE_DISCONNECT) {
>                         spin_unlock(&tcon->tc_lock);
> -                       cifs_dbg(FYI, "can not send cmd %d while umountin=
g\n",
> -                                smb2_command);
> +                       cifs_tcon_dbg(FYI, "can not send cmd %d while umo=
unting\n",
> +                                     smb2_command);
>                         return -ENODEV;
>                 }
>         }
> @@ -296,9 +296,9 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tcon =
*tcon,
>                 return 0;
>         }
>         spin_unlock(&ses->chan_lock);
> -       cifs_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %d",
> -                tcon->ses->chans_need_reconnect,
> -                tcon->need_reconnect);
> +       cifs_tcon_dbg(FYI, "sess reconnect mask: 0x%lx, tcon reconnect: %=
d\n",
> +                     tcon->ses->chans_need_reconnect,
> +                     tcon->need_reconnect);
>
>         mutex_lock(&ses->session_mutex);
>         /*
> @@ -392,11 +392,11 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tco=
n *tcon,
>
>         rc =3D cifs_tree_connect(0, tcon);
>
> -       cifs_dbg(FYI, "reconnect tcon rc =3D %d\n", rc);
> +       cifs_tcon_dbg(FYI, "reconnect tcon rc =3D %d\n", rc);
>         if (rc) {
>                 /* If sess reconnected but tcon didn't, something strange=
 ... */
>                 mutex_unlock(&ses->session_mutex);
> -               cifs_dbg(VFS, "reconnect tcon failed rc =3D %d\n", rc);
> +               cifs_tcon_dbg(VFS, "reconnect tcon failed rc =3D %d\n", r=
c);
>                 goto out;
>         }
>
> @@ -442,8 +442,8 @@ smb2_reconnect(__le16 smb2_command, struct cifs_tcon =
*tcon,
>                                                        from_reconnect);
>                         goto skip_add_channels;
>                 } else if (rc)
> -                       cifs_dbg(FYI, "%s: failed to query server interfa=
ces: %d\n",
> -                                __func__, rc);
> +                       cifs_tcon_dbg(FYI, "%s: failed to query server in=
terfaces: %d\n",
> +                                     __func__, rc);
>
>                 if (ses->chan_max > ses->chan_count &&
>                     ses->iface_count &&
> --
> 2.50.1
>
>


--=20
Thanks,

Steve

