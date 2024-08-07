Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA1394B248
	for <lists+samba-technical@lfdr.de>; Wed,  7 Aug 2024 23:43:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tBgQUuu5/Rne0mQxx+vGZQCfTQ3OX8Cwkp/40ZeO2PA=; b=P+MAfkpwAvEFoRebF2PM6z/Toc
	N4I9GXTv/XpMKHn7eWLz4xhrb8vt2ngGqWdCe4Bs2f+tRMbfsQEHXH0RzLwiMK4w9V7xv3AOz7IpP
	4n6RNrWuRFk21/oGXUSOnVZTI0lOpHfNHNlKSk2bXitvCwl+qUMALOjEb2zw5cHlMi0+bnXJCywQ0
	V7dfsfrf00CNGWPFh7QgTLTWd+CEDdPQaiZO6XFVHqwIQjMo23SGo0/x+pmtLt9+8tCeMFYSj86Tx
	naRUuO3QLxpS3W/SlNMpOt1f5HftuqG+2WZwUNDV+KfSGv59UynJLawZr5CcerOfcCMHEwxiA1pVa
	77dQO5rQ==;
Received: from ip6-localhost ([::1]:45002 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sboQE-0049cl-Fm; Wed, 07 Aug 2024 21:42:18 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:59480) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sboQA-0049ce-SA
 for samba-technical@lists.samba.org; Wed, 07 Aug 2024 21:42:17 +0000
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ef2c56d9dcso2796471fa.2
 for <samba-technical@lists.samba.org>; Wed, 07 Aug 2024 14:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723066933; x=1723671733; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LGJ0ROfaIpqIIJbR3Vm8tXMZOdWT7TylJhZFkCOH4RU=;
 b=e0CgxOTwGqaT3s2jkhM41pqeQRFBnkuYeiRssla9LINukUF1FjXJbLWg6EO//0E0c6
 ldajlcbrq3K9Tm+dFiO0bzr5zU2Mf93GeGmlN9Fs2cR/ifCJacMPAHg5WTOyWJuLdgXY
 bW6YiWOGUqDfx1Ngaq0Scag2O8GsvaRT3J0CAQul0iwzqBwZyJSAfDIXNLE55AHkda+J
 A44mCoBMLQ8ISVA5YtzlYZMPK2hZXRok/HeMkfxRCokTDRhKKDaJCPL2Pl2K+Mwnj7Lr
 khrms+Er5wAwDefuCZDVq58syvLIxZJ+C+szNEUQF++QbtY2InARV8qRjVTtuE0Rj1WR
 foQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723066933; x=1723671733;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LGJ0ROfaIpqIIJbR3Vm8tXMZOdWT7TylJhZFkCOH4RU=;
 b=LLpw16eXAw25NmX6HAK1cy/owIpgdiZX11/N4Guww619l0G30qrq6qMn5+oBFxd/Rm
 Sr2joP9rspEHVC/nys5GNo3e5XDlYOiM21C1EegIeL/Nj1MQ13RvW3FpfD/GgwDo4eSj
 YRlnoX3W8cEZonlPe6USwKcG6FFhJiPa0fAMrMTIbDdeqIb6y8JcqC+nTzLvnsyEdvIi
 u/kE6tOvwQGi/ZFPsYHTHk0XUwpblxWPUz7Xfa992PiRUux2kojYow2oaLaY4PXU4jon
 FgwiimoO6evneruUVqQPchE2rc9nSM4ZyGxBb79PN9qr6anfMiGHmgWZeW2jotV69ful
 Vr+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEMnNBJF4h1X/oSqDGSAa9Rtq6l0ldX0prk0pELJk98iBV2OT9WCCrrfJ1aS4Wi/MtlVWW09vdk/Cw7Qqt1/Q7OrcMWGcALdKpgF2af+Ry
X-Gm-Message-State: AOJu0Yyy/O9N9MGIDvXj+hCrKVwUkoToayEyhe12Mi6+8X4MsPSHA08A
 FR0w/DNZv8X3e/+BIbuT+7s0vu35A7aJNvlZVDuKYKzlaNGi/PoTzmhPUmQ+MJfZoepBZcBm83+
 mMzqqgleLO/v0WaO1QQJ81HBR6rA=
X-Google-Smtp-Source: AGHT+IF4J8tuXbFzvFb++flRFxJewVOGL8pSPFraXr7o89OlTQXyuSFiqs7cyeEbq0OLd1EHowm8jHihRz6MudhTEV0=
X-Received: by 2002:a2e:9f06:0:b0:2f0:1a36:1d79 with SMTP id
 38308e7fff4ca-2f15ab24cfamr142831471fa.45.1723066932820; Wed, 07 Aug 2024
 14:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240807165320.56450-1-shenxiaxi26@gmail.com>
In-Reply-To: <20240807165320.56450-1-shenxiaxi26@gmail.com>
Date: Wed, 7 Aug 2024 16:42:01 -0500
Message-ID: <CAH2r5mv6TT-6zdXOHsWF0dU2p-r852X65cgLf+3SzD379SffMQ@mail.gmail.com>
Subject: Re: [PATCH] Fix spelling errors in Server Message Block
To: Xiaxi Shen <shenxiaxi26@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 javier.carrasco.cruz@gmail.com, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, tom@talpey.com, bharathsm@microsoft.com,
 skhan@linuxfoundation.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Wed, Aug 7, 2024 at 11:53=E2=80=AFAM Xiaxi Shen <shenxiaxi26@gmail.com> =
wrote:

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
>         int (*tree_connect)(const unsigned int, struct cifs_ses *, const
> char *,
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
>          * mostly used for not requiring a copy of @leaf_fullpath when
> getting
>          * cached or new DFS referrals (which might also sleep during I/O=
).
> -        * While @srv_lock is held for making string and NULL comparions
> against
> +        * While @srv_lock is held for making string and NULL comparisons
> against
>          * both fields as in mount(2) and cache refresh.
>          *
>          * format: \\HOST\SHARE[\OPTIONAL PATH]
> diff --git a/fs/smb/client/misc.c b/fs/smb/client/misc.c
> index b28ff62f1f15..3fe5bfc389d0 100644
> --- a/fs/smb/client/misc.c
> +++ b/fs/smb/client/misc.c
> @@ -352,7 +352,7 @@ checkSMB(char *buf, unsigned int total_read, struct
> TCP_Server_Info *server)
>                                  * on simple responses (wct, bcc both zer=
o)
>                                  * in particular have seen this on
>                                  * ulogoffX and FindClose. This leaves
> -                                * one byte of bcc potentially unitialize=
d
> +                                * one byte of bcc potentially
> uninitialized
>                                  */
>                                 /* zero rest of bcc */
>                                 tmp[sizeof(struct smb_hdr)+1] =3D 0;
> diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
> index d74e829de51c..7bcc379014ca 100644
> --- a/fs/smb/client/smbdirect.c
> +++ b/fs/smb/client/smbdirect.c
> @@ -406,7 +406,7 @@ static void smbd_post_send_credits(struct work_struct
> *work)
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
>   * Test if FRWR (Fast Registration Work Requests) is supported on the
> device
> - * This implementation requries FRWR on RDMA read/write
> + * This implementation requires FRWR on RDMA read/write
>   * return value: true if it is supported
>   */
>  static bool frwr_is_supported(struct ib_device_attr *attrs)
> @@ -2177,7 +2177,7 @@ static int allocate_mr_list(struct smbd_connection
> *info)
>   * MR available in the list. It may access the list while the
>   * smbd_mr_recovery_work is recovering the MR list. This doesn't need a
> lock
>   * as they never modify the same places. However, there may be several
> CPUs
> - * issueing I/O trying to get MR at the same time, mr_list_lock is used =
to
> + * issuing I/O trying to get MR at the same time, mr_list_lock is used t=
o
>   * protect this situation.
>   */
>  static struct smbd_mr *get_mr(struct smbd_connection *info)
> @@ -2311,7 +2311,7 @@ struct smbd_mr *smbd_register_mr(struct
> smbd_connection *info,
>         /*
>          * There is no need for waiting for complemtion on ib_post_send
>          * on IB_WR_REG_MR. Hardware enforces a barrier and order of
> execution
> -        * on the next ib_post_send when we actaully send I/O to remote
> peer
> +        * on the next ib_post_send when we actually send I/O to remote
> peer
>          */
>         rc =3D ib_post_send(info->id->qp, &reg_wr->wr, NULL);
>         if (!rc)
> diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
> index adfe0d058701..6e68aaf5bd20 100644
> --- a/fs/smb/client/transport.c
> +++ b/fs/smb/client/transport.c
> @@ -1289,7 +1289,7 @@ compound_send_recv(const unsigned int xid, struct
> cifs_ses *ses,
>  out:
>         /*
>          * This will dequeue all mids. After this it is important that th=
e
> -        * demultiplex_thread will not process any of these mids any
> futher.
> +        * demultiplex_thread will not process any of these mids any
> further.
>          * This is prevented above by using a noop callback that will not
>          * wake this thread except for the very last PDU.
>          */
> --
> 2.34.1
>
>
>

--=20
Thanks,

Steve
