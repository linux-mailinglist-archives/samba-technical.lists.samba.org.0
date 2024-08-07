Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F283C94B24A
	for <lists+samba-technical@lfdr.de>; Wed,  7 Aug 2024 23:44:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jll19MbGKA1ExOhPJwMcVT0BjOA2+xszLa20Qb3/6ts=; b=WxusrhTakYjEYXSXac8P8oHd2Y
	mqyA1w0Q+MUFd5DU5yu596Ouq4+vSPMYYFTXLUSoxXF46jz/mCOKRr/Pn35A4XukDL30M8vBJRMpu
	G5KxVU/9692yPPCdko4pHCREj0+RGFyx+dRqSl4GusUhHEiHQvWg0qSCFR4iW70fLHZC/cb9rKJyl
	s4wSmVlftW4MQYiDyzuIVDTMNO7OFBQp9IoUh8M0LFWhQgWp5wpv+9h1hqWofHubFu4eSgsY6gN97
	EdXUYS/NYtiUTdSnbSGkA0jv7FdVjYvcECvYGEaPluS15uR7jyBcOb+U+mt0CClEmGn+IKLi/e+VK
	bZrFzoUA==;
Received: from ip6-localhost ([::1]:56982 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sboRq-0049iJ-3B; Wed, 07 Aug 2024 21:43:58 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:60427) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sboRk-0049iC-NH
 for samba-technical@lists.samba.org; Wed, 07 Aug 2024 21:43:54 +0000
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2f15e48f35bso3006271fa.0
 for <samba-technical@lists.samba.org>; Wed, 07 Aug 2024 14:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723067031; x=1723671831; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jll19MbGKA1ExOhPJwMcVT0BjOA2+xszLa20Qb3/6ts=;
 b=kKFA3U1RgMpRFb1Re8LurO3tVS16FIu77jIdnhlzfFE2JTaGxoYpWzFmDDTqkSR28J
 cOeoysd6tUt0KV/cjUmi+INGIvAh1M3HesY74069BdmMZ+ad3R2kCsLwcNRWBi/Br++N
 X1mytcA+Z2PkkvJ08XEi42OIIqtUOq5EXwxw1vBERn4WLp0RLK/sKAl1GYvuJ7PmtDjw
 4RAKY1cNLQgSXLZSuoypRGVri7pNo3KD/vXVQBC7ynVMDFk6ag2QdaA2PVcvNcbgR/tZ
 BE60/CrrTSncoscPS9eZMa9xP3Ae6931oYiPZh4jDwiBYfGqPQzCm2rPR103gN20WMdT
 v98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723067031; x=1723671831;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jll19MbGKA1ExOhPJwMcVT0BjOA2+xszLa20Qb3/6ts=;
 b=jRaIjnu1DUuoewOYb2YJl4D9YZn1QtgPT4aKr7WeAzGRldc375DkTmRYk+yB5UK2RK
 mDTq0HyhqEsfo+zIZT4xEcQ7p2Fha4x72WpZIamadHuZHzRaJc0JkSUHTlUaCrY0cP78
 RIte1Hd1OS/8tr1KlBMCS0VFKr+zeL4ZCX/DineX5NZ6NprkYNZUOTf5LLlHRQmgWPF8
 sSSGwTbEPLso8lqybdH+yC1XArLE1uaVFy5+bPSRDc0W5PUrzUHTOLk/3w7PK0/anFZo
 d81LlhWJ4BXLXuIOA8GfUAUr+VS41hxbzS2G+i/gQvyjRKe+Z+Jl5ZDglaucb6J+CZ6y
 Do7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQK651YBtmf/aunVt0FGSv01iS3jvlgH3GnbLqA6r7BkDQPyhr6P5MLqlSCeOxWImmSO185d0z7t9oOyd9LRGpRW0X0WtE6VHaLroXBlpJ
X-Gm-Message-State: AOJu0Yye8nrzh+2nDUHZWdHkeN5jpt3DSBA9eGYhL2Or7tM0JSAdI0WV
 Xm5d4QC+ybi1mHKvMl1Jiu70dyCpGNHzi8k3mtsiWf7y/VEwNz29gZHoF2bkS0NrQ1l6NEz4HCv
 R8YpsGQh7hlmVFIlyRf3TgzS8n0c=
X-Google-Smtp-Source: AGHT+IFVIyLTqdb8azfpb133JgIONeq3ywsb/Aea06oSsz8r2rgOsh6GqvlrMVg47Bz/l18QM1G0RB+ZwFoW1rvyyzI=
X-Received: by 2002:a2e:9110:0:b0:2ef:2c20:e061 with SMTP id
 38308e7fff4ca-2f15aab0a5emr132863931fa.22.1723067030885; Wed, 07 Aug 2024
 14:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240807165320.56450-1-shenxiaxi26@gmail.com>
In-Reply-To: <20240807165320.56450-1-shenxiaxi26@gmail.com>
Date: Wed, 7 Aug 2024 16:43:39 -0500
Message-ID: <CAH2r5mu_hvBnbzbRnpzjAULubsTf5o4TsD3Piqjwn6HsF7BC8A@mail.gmail.com>
Subject: Re: [PATCH] Fix spelling errors in Server Message Block
To: Xiaxi Shen <shenxiaxi26@gmail.com>
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
Cc: pc@manguebit.com, tom@talpey.com, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, javier.carrasco.cruz@gmail.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 sfrench@samba.org, bharathsm@microsoft.com, skhan@linuxfoundation.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next


On Wed, Aug 7, 2024 at 11:53=E2=80=AFAM Xiaxi Shen <shenxiaxi26@gmail.com> =
wrote:
>
> Fixed typos in various files under fs/smb/client/
>
> Signed-off-by: Xiaxi Shen <shenxiaxi26@gmail.com>
> ---
>  fs/smb/client/cifsglob.h  | 4 ++--
>  fs/smb/client/misc.c      | 2 +-
>  fs/smb/client/smbdirect.c | 8 ++++----
>  fs/smb/client/transport.c | 2 +-
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
> index f6d1f075987f..66677b8fc9be 100644
> --- a/fs/smb/client/cifsglob.h
> +++ b/fs/smb/client/cifsglob.h
> @@ -345,7 +345,7 @@ struct smb_version_operations {
>         /* connect to a server share */
>         int (*tree_connect)(const unsigned int, struct cifs_ses *, const =
char *,
>                             struct cifs_tcon *, const struct nls_table *)=
;
> -       /* close tree connecion */
> +       /* close tree connection */
>         int (*tree_disconnect)(const unsigned int, struct cifs_tcon *);
>         /* get DFS referrals */
>         int (*get_dfs_refer)(const unsigned int, struct cifs_ses *,
> @@ -816,7 +816,7 @@ struct TCP_Server_Info {
>          * Protected by @refpath_lock and @srv_lock.  The @refpath_lock i=
s
>          * mostly used for not requiring a copy of @leaf_fullpath when ge=
tting
>          * cached or new DFS referrals (which might also sleep during I/O=
).
> -        * While @srv_lock is held for making string and NULL comparions =
against
> +        * While @srv_lock is held for making string and NULL comparisons=
 against
>          * both fields as in mount(2) and cache refresh.
>          *
>          * format: \\HOST\SHARE[\OPTIONAL PATH]
> diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> index b28ff62f1f15..3fe5bfc389d0 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -352,7 +352,7 @@ checkSMB(char *buf, unsigned int total_read, struct T=
CP_Server_Info *server)
>                                  * on simple responses (wct, bcc both zer=
o)
>                                  * in particular have seen this on
>                                  * ulogoffX and FindClose. This leaves
> -                                * one byte of bcc potentially unitialize=
d
> +                                * one byte of bcc potentially uninitiali=
zed
>                                  */
>                                 /* zero rest of bcc */
>                                 tmp[sizeof(struct smb_hdr)+1] =3D 0;
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index d74e829de51c..7bcc379014ca 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -406,7 +406,7 @@ static void smbd_post_send_credits(struct work_struct=
 *work)
>                         else
>                                 response =3D get_empty_queue_buffer(info)=
;
>                         if (!response) {
> -                               /* now switch to emtpy packet queue */
> +                               /* now switch to empty packet queue */
>                                 if (use_receive_queue) {
>                                         use_receive_queue =3D 0;
>                                         continue;
> @@ -618,7 +618,7 @@ static struct rdma_cm_id *smbd_create_id(
>
>  /*
>   * Test if FRWR (Fast Registration Work Requests) is supported on the de=
vice
> - * This implementation requries FRWR on RDMA read/write
> + * This implementation requires FRWR on RDMA read/write
>   * return value: true if it is supported
>   */
>  static bool frwr_is_supported(struct ib_device_attr *attrs)
> @@ -2177,7 +2177,7 @@ static int allocate_mr_list(struct smbd_connection =
*info)
>   * MR available in the list. It may access the list while the
>   * smbd_mr_recovery_work is recovering the MR list. This doesn't need a =
lock
>   * as they never modify the same places. However, there may be several C=
PUs
> - * issueing I/O trying to get MR at the same time, mr_list_lock is used =
to
> + * issuing I/O trying to get MR at the same time, mr_list_lock is used t=
o
>   * protect this situation.
>   */
>  static struct smbd_mr *get_mr(struct smbd_connection *info)
> @@ -2311,7 +2311,7 @@ struct smbd_mr *smbd_register_mr(struct smbd_connec=
tion *info,
>         /*
>          * There is no need for waiting for complemtion on ib_post_send
>          * on IB_WR_REG_MR. Hardware enforces a barrier and order of exec=
ution
> -        * on the next ib_post_send when we actaully send I/O to remote p=
eer
> +        * on the next ib_post_send when we actually send I/O to remote p=
eer
>          */
>         rc =3D ib_post_send(info->id->qp, &reg_wr->wr, NULL);
>         if (!rc)
> diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
> index adfe0d058701..6e68aaf5bd20 100644
> --- a/fs/smb/client/transport.c
> +++ b/fs/smb/client/transport.c
> @@ -1289,7 +1289,7 @@ compound_send_recv(const unsigned int xid, struct c=
ifs_ses *ses,
>  out:
>         /*
>          * This will dequeue all mids. After this it is important that th=
e
> -        * demultiplex_thread will not process any of these mids any futh=
er.
> +        * demultiplex_thread will not process any of these mids any furt=
her.
>          * This is prevented above by using a noop callback that will not
>          * wake this thread except for the very last PDU.
>          */
> --
> 2.34.1
>
>


--=20
Thanks,

Steve

