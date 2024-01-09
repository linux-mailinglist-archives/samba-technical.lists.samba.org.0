Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8613D827C4C
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jan 2024 01:53:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Ns81+2qq5q/MiVZ1HyELxVhRwQ1AGVaFpIYsF5PcvU8=; b=ORmD9ETnc6mr7sBMrNuQiFplPt
	eA9WKpm+eJK8/1NMYS1Pb09y6CgDPHpbdwUXOmCcmIlQl40+Is8fKYIqlBr2w+ySBX/WzaDe4vvRI
	neDzdkmkxVkMuGCXS0fgc01Ss3iuM6p/S7HUz/BgKk53yE/IVGEf6SZ97yyFZlwUqVXpGC3zwubsZ
	kYUw9NpJMz/5WJbYNeg8votoExP8qxMjhTw0+2fKZfhdUYXoV2V7x5cNcjk/l+bT4jwqPKkGwBpDK
	G58hgYk1hj7tUX8hNgswZoDgbRT+1tVwhe1r5jgS5O/EFMCVXntpCHVB1rCY1YuWTxDm4UrV7yVgH
	pE+lDR/g==;
Received: from ip6-localhost ([::1]:48478 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rN0MZ-002psc-V2; Tue, 09 Jan 2024 00:53:04 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:51702) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rN0MV-002psV-HQ
 for samba-technical@lists.samba.org; Tue, 09 Jan 2024 00:53:02 +0000
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cd5b467209so14531621fa.3
 for <samba-technical@lists.samba.org>; Mon, 08 Jan 2024 16:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704761577; x=1705366377; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ns81+2qq5q/MiVZ1HyELxVhRwQ1AGVaFpIYsF5PcvU8=;
 b=DyBmITHBYSj672pRaSsENH0raYCMwKO8xRfUqSiFWmKs9jWmSDTpbkU9sfyYgsZeGd
 MWU+Kl8Tp4bUystIiwXfGzr+t3n4EByT2j0FmDzKRV8qp4x/evlIgdXBXUM3gHTGRQU7
 6m+LrAqLsHYkeCGCsCL8ddJeCq3iZuyo6JqnWay5+OLiLH7sHO38to805WKHTtrua3ew
 RF2GgTY0zJetad4lxsoaxzXlN304HgbpNOg6i05CMARPzGNbj6zAqJHTom/Jtfbj1Wu5
 vyg2n5fnSKMH3ugAyo+BaqGItGVGpUpLrgRYVXsPJElLd66Lf+hRfpr53KFU52aMJ00P
 RRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704761577; x=1705366377;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ns81+2qq5q/MiVZ1HyELxVhRwQ1AGVaFpIYsF5PcvU8=;
 b=Vkvw3DYvck6vakJarRo5Ex/PUan+lQw1qK0NIhAk2Ka8IqKkG8T+vWca08zR+VzOHR
 d3J1tjdW1YrJZUmwSYVbTFhG18QAffd7uQ4CS8q7BGzuQpOlcauNyvhFsBeKRFfuSXoy
 bhWk5EQTaxWAL1JiGFphGlAYPWxvGy/yEXHQb1XARpoWYUI9AK9EoBC56MOfs+ZyC9Jd
 6YUan6EdOQBFXnjewkTnm4MamPgl8KcwBBr3mGFUGd3YE0vcmGyZblAs+t9vwXDwubu8
 jt0hw6XafuqK7gNEVzwjfXUXpQIvXSg4p3zOsX5byoZIDCJB6Lm+q+1jQkv3uIqORnD/
 nwKA==
X-Gm-Message-State: AOJu0YytwGCLtkN65X/gyD5AKpV1OCek+yG9toE3/97v6FwfTD8oDI7n
 dHvFt7tIPn/yyoM3/ZkO6U9t8996gA3jMS/C/Oo=
X-Google-Smtp-Source: AGHT+IEtfoapUrGx78KL3vW2i+Kbuu0w2ubd3F3CIu851yVKH9mVpx5OwEw+LbZthofdaxFixGqWX97MB7kU4P4OWz0=
X-Received: by 2002:a2e:b8c7:0:b0:2cd:662a:ecdb with SMTP id
 s7-20020a2eb8c7000000b002cd662aecdbmr65203ljp.62.1704761576999; Mon, 08 Jan
 2024 16:52:56 -0800 (PST)
MIME-Version: 1.0
References: <b628a706-d356-4629-a433-59dfda24bb94@moroto.mountain>
In-Reply-To: <b628a706-d356-4629-a433-59dfda24bb94@moroto.mountain>
Date: Mon, 8 Jan 2024 18:52:45 -0600
Message-ID: <CAH2r5mtoiRwB_yK-0VH6pirWCYMBgFNOY7Mt+RzYmFPmzh4epw@mail.gmail.com>
Subject: Re: [PATCH 1/3] cifs: delete unnecessary NULL checks in
 cifs_chan_update_iface()
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
Cc: Paulo Alcantara <pc@manguebit.com>, linux-cifs@vger.kernel.org,
 Shyam Prasad N <sprasad@microsoft.com>, kernel-janitors@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 Ronnie Sahlberg <lsahlber@redhat.com>, Tom Talpey <tom@talpey.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next, still reviewing the other two

On Mon, Jan 8, 2024 at 3:08=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> We return early if "iface" is NULL so there is no need to check here.
> Delete those checks.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  fs/smb/client/sess.c | 26 +++++++++++---------------
>  1 file changed, 11 insertions(+), 15 deletions(-)
>
> diff --git a/fs/smb/client/sess.c b/fs/smb/client/sess.c
> index a16e175731eb..775c6a4a2f4b 100644
> --- a/fs/smb/client/sess.c
> +++ b/fs/smb/client/sess.c
> @@ -467,27 +467,23 @@ cifs_chan_update_iface(struct cifs_ses *ses, struct=
 TCP_Server_Info *server)
>                 kref_put(&old_iface->refcount, release_iface);
>         } else if (!chan_index) {
>                 /* special case: update interface for primary channel */
> -               if (iface) {
> -                       cifs_dbg(FYI, "referencing primary channel iface:=
 %pIS\n",
> -                                &iface->sockaddr);
> -                       iface->num_channels++;
> -                       iface->weight_fulfilled++;
> -               }
> +               cifs_dbg(FYI, "referencing primary channel iface: %pIS\n"=
,
> +                        &iface->sockaddr);
> +               iface->num_channels++;
> +               iface->weight_fulfilled++;
>         }
>         spin_unlock(&ses->iface_lock);
>
> -       if (iface) {
> -               spin_lock(&ses->chan_lock);
> -               chan_index =3D cifs_ses_get_chan_index(ses, server);
> -               if (chan_index =3D=3D CIFS_INVAL_CHAN_INDEX) {
> -                       spin_unlock(&ses->chan_lock);
> -                       return 0;
> -               }
> -
> -               ses->chans[chan_index].iface =3D iface;
> +       spin_lock(&ses->chan_lock);
> +       chan_index =3D cifs_ses_get_chan_index(ses, server);
> +       if (chan_index =3D=3D CIFS_INVAL_CHAN_INDEX) {
>                 spin_unlock(&ses->chan_lock);
> +               return 0;
>         }
>
> +       ses->chans[chan_index].iface =3D iface;
> +       spin_unlock(&ses->chan_lock);
> +
>         return rc;
>  }
>
> --
> 2.42.0
>
>


--=20
Thanks,

Steve

