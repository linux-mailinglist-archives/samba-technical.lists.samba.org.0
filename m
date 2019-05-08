Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD9717FFB
	for <lists+samba-technical@lfdr.de>; Wed,  8 May 2019 20:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=801loZJ0jfUDsDQIz80w/KLYHC3XFpoSrb8jnyCcUpc=; b=fIjIVhpu8hlMrKHOlNeq1fcEq/
	2kUXx9COYCtRU/BUKrK/Zxs+f9UHWSdJmKBeaSVcaAaiTeQrwnt5Kij+PNJh7KOCCbp/M6auHV+yL
	LivSax8UkhDPUSmnUD+3g7Pmvr52SOWGcu3WjkiDhTiR7pOV5WyvzL4Pc3taIQc9ZmL5+UXQVojWn
	SIohEFm1SLOca+sI3di4srur4Z6FhJs+db2wQvvs477BYmulYXV3GC4h5o2PpuaJXEYMo2Bw/mW2m
	vuOq0BbzEhwSQUtFfyORReh8++UgE45GWpsXzsMAn+UeCNeoP8RdfKKHjQ1voKCsqHs+ND8NacRAc
	SE7ElIpA==;
Received: from localhost ([::1]:34208 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hORWo-0032MB-6G; Wed, 08 May 2019 18:42:54 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:37609) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hORWi-0032M4-Vv
 for samba-technical@lists.samba.org; Wed, 08 May 2019 18:42:51 +0000
Received: by mail-lj1-x243.google.com with SMTP id n4so2470995ljg.4
 for <samba-technical@lists.samba.org>; Wed, 08 May 2019 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=801loZJ0jfUDsDQIz80w/KLYHC3XFpoSrb8jnyCcUpc=;
 b=HdsCy/25ugkm/lUT33Cdp9SCDR3PPtsEtERMBKrAgGnBfuTk0Pa3B9kp7wYnbdpSEl
 3oxqJ7ZalwWfJAJbpZnPpwkEox+Y9xfSwtoWoZeh7PY1myCTwf3rvUwq96Tu03WRKs9P
 ga/WZ1DmAueyA9p1SZea8o7w42563adY6WO7l1sevWTxTcVpex/lUjYDHrDCpzFw/ocV
 0/bOz+fphaAt9R2q9ks+/OvuECHfpYD1VXRk26eatens7j8xotJ3gtRv1VXRqpVwGEpI
 vgtG7pA2UyWDniJKik+WKfw/tBtuCxO0qzSBJg6xe26kATnkDKi9v+5dVcs8Ya66bYDf
 XYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=801loZJ0jfUDsDQIz80w/KLYHC3XFpoSrb8jnyCcUpc=;
 b=Yuhs5SUEOp0e/FU5QxlKIxiox2GxviDRi8uJitF8RMzWwB48WEiYW3HJvWewt6wnNe
 QdQY/vi1uxVwqD3CKlrXMI5BRvH5xZU6z4vC7PCRiXFkH60HSL+m3EfIfxwyrb9r6cF9
 NKZxUvBIvrr8mMkVK7R0pOwFAL9rL9uFcoNyqcjec/GxSOcM5/RvGPNE00e67Jf3WsCi
 DWkq26fkNOI5Pb4glFikndXfVxwmV9atMqbQDh7OXyThclDtArvFCrCaaGYYWNQ6WdCV
 m1TTM1BvBNFCEUjYT6E2dVP5N2WPEVbMUAlvrAd917Qcz1LNR+Zzi8RW+dbUGmkbUSRi
 CMvg==
X-Gm-Message-State: APjAAAXToRhkv40JXmr/D6KutFwVUfE2YH7xKQaQA6azPuLqdhGQuNir
 T8n9ZVOEwyz9tbgfUnaG0psqOJpxEod6sBLQzA==
X-Google-Smtp-Source: APXvYqz4jT10Lf9x8VL/d7AxpIrEhLvPV774EkUC2LKN+8PSTXgttTrEIaOI9Fu2NEJf+WeV8s27ZgooAaxF56cZ6Ag=
X-Received: by 2002:a2e:7e0a:: with SMTP id z10mr7081279ljc.9.1557340966088;
 Wed, 08 May 2019 11:42:46 -0700 (PDT)
MIME-Version: 1.0
References: <1557242200-26194-1-git-send-email-kernel@probst.it>
 <CAH2r5mtqkHYbHJkf_LbAjhujnNRQP6Zmkmqhj1dUHomwsc3e=w@mail.gmail.com>
 <CAKywueSJCs2B2cGmZvGNfxDU7KNvkBOsuyuaOSV=3GWG80f+kw@mail.gmail.com>
 <A4165E00-AA20-4550-96FE-651271B7091B@canonical.com>
In-Reply-To: <A4165E00-AA20-4550-96FE-651271B7091B@canonical.com>
Date: Wed, 8 May 2019 11:42:35 -0700
Message-ID: <CAKywueQmjm3vhGZkLdB6J2rpjmKA6m0=N4A6bnsq3MW4acYHLQ@mail.gmail.com>
Subject: Re: [PATCH v2] cifs: fix strcat buffer overflow and reduce raciness
 in smb21_set_oplock_level()
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Steve French <smfrench@gmail.com>, Christoph Probst <kernel@probst.it>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D1=81=D1=80, 8 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 01:23, Kai-Heng Feng=
 <kai.heng.feng@canonical.com>:
>
> at 02:28, Pavel Shilovsky <piastryyy@gmail.com> wrote:
>
> > =D0=B2=D1=82, 7 =D0=BC=D0=B0=D1=8F 2019 =D0=B3. =D0=B2 09:13, Steve Fre=
nch via samba-technical
> > <samba-technical@lists.samba.org>:
> >> merged into cifs-2.6.git for-next
> >>
> >> On Tue, May 7, 2019 at 10:17 AM Christoph Probst via samba-technical
> >> <samba-technical@lists.samba.org> wrote:
> >>> Change strcat to strncpy in the "None" case to fix a buffer overflow
> >>> when cinode->oplock is reset to 0 by another thread accessing the sam=
e
> >>> cinode. It is never valid to append "None" to any other message.
> >>>
> >>> Consolidate multiple writes to cinode->oplock to reduce raciness.
> >>>
> >>> Signed-off-by: Christoph Probst <kernel@probst.it>
> >>> ---
> >>>  fs/cifs/smb2ops.c | 14 ++++++++------
> >>>  1 file changed, 8 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> >>> index c36ff0d..aa61dcf 100644
> >>> --- a/fs/cifs/smb2ops.c
> >>> +++ b/fs/cifs/smb2ops.c
> >>> @@ -2917,26 +2917,28 @@ smb21_set_oplock_level(struct cifsInodeInfo
> >>> *cinode, __u32 oplock,
> >>>                        unsigned int epoch, bool *purge_cache)
> >>>  {
> >>>         char message[5] =3D {0};
> >>> +       unsigned int new_oplock =3D 0;
> >>>
> >>>         oplock &=3D 0xFF;
> >>>         if (oplock =3D=3D SMB2_OPLOCK_LEVEL_NOCHANGE)
> >>>                 return;
> >>>
> >>> -       cinode->oplock =3D 0;
> >>>         if (oplock & SMB2_LEASE_READ_CACHING_HE) {
> >>> -               cinode->oplock |=3D CIFS_CACHE_READ_FLG;
> >>> +               new_oplock |=3D CIFS_CACHE_READ_FLG;
> >>>                 strcat(message, "R");
> >>>         }
> >>>         if (oplock & SMB2_LEASE_HANDLE_CACHING_HE) {
> >>> -               cinode->oplock |=3D CIFS_CACHE_HANDLE_FLG;
> >>> +               new_oplock |=3D CIFS_CACHE_HANDLE_FLG;
> >>>                 strcat(message, "H");
> >>>         }
> >>>         if (oplock & SMB2_LEASE_WRITE_CACHING_HE) {
> >>> -               cinode->oplock |=3D CIFS_CACHE_WRITE_FLG;
> >>> +               new_oplock |=3D CIFS_CACHE_WRITE_FLG;
> >>>                 strcat(message, "W");
> >>>         }
> >>> -       if (!cinode->oplock)
> >>> -               strcat(message, "None");
> >>> +       if (!new_oplock)
> >>> +               strncpy(message, "None", sizeof(message));
> >>> +
> >>> +       cinode->oplock =3D new_oplock;
> >>>         cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
> >>>                  &cinode->vfs_inode);
> >>>  }
> >>> --
> >>> 2.1.4
> >
>
> Doesn=E2=80=99t the race still happen, but implicitly here?
> cinode->oplock =3D new_oplock;
>
> Is it possible to just introduce a lock to force its proper ordering?
> e.g.
>
> diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> index bf5b8264e119..a3c3c6156d17 100644
> --- a/fs/cifs/cifsfs.c
> +++ b/fs/cifs/cifsfs.c
> @@ -267,6 +267,7 @@ cifs_alloc_inode(struct super_block *sb)
>           * server, can not assume caching of file data or metadata.
>           */
>          cifs_set_oplock_level(cifs_inode, 0);
> +       mutex_init(&cifs_inode->oplock_mutex);
>          cifs_inode->flags =3D 0;
>          spin_lock_init(&cifs_inode->writers_lock);
>          cifs_inode->writers =3D 0;
> diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
> index 37b5ddf27ff1..6dfd4ab16c4f 100644
> --- a/fs/cifs/cifsglob.h
> +++ b/fs/cifs/cifsglob.h
> @@ -1214,6 +1214,7 @@ struct cifsInodeInfo {
>          struct list_head openFileList;
>          __u32 cifsAttrs; /* e.g. DOS archive bit, sparse, compressed, sy=
stem */
>          unsigned int oplock;            /* oplock/lease level we have */
> +       struct mutex oplock_mutex;
>          unsigned int epoch;             /* used to track lease state cha=
nges */
>   #define CIFS_INODE_PENDING_OPLOCK_BREAK   (0) /* oplock break in progre=
ss */
>   #define CIFS_INODE_PENDING_WRITERS       (1) /* Writes in progress */
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index b20063cf774f..796b23712e71 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -1901,6 +1901,7 @@ smb21_set_oplock_level(struct cifsInodeInfo *cinode=
,
> __u32 oplock,
>          if (oplock =3D=3D SMB2_OPLOCK_LEVEL_NOCHANGE)
>                  return;
>
> +       mutex_lock(&cinode->oplock_mutex);
>          cinode->oplock =3D 0;
>          if (oplock & SMB2_LEASE_READ_CACHING_HE) {
>                  cinode->oplock |=3D CIFS_CACHE_READ_FLG;
> @@ -1916,6 +1917,8 @@ smb21_set_oplock_level(struct cifsInodeInfo *cinode=
,
> __u32 oplock,
>          }
>          if (!cinode->oplock)
>                  strcat(message, "None");
> +       mutex_unlock(&cinode->oplock_mutex);
> +
>          cifs_dbg(FYI, "%s Lease granted on inode %p\n", message,
>                   &cinode->vfs_inode);
>   }
>
> Kai-Heng

Unless you calculations on the oplock value or accessing it multiple
times with some logic involved I don't think locking will help much.
If two threads are assigning the same variable, you can end up with
two possible outcomes regardless of whether locking is used or not.

Locking will be needed once we start to make proper decisions based on
previous and new values of the oplock to purge a page cache or flush
buffered data. This still needs to be done and is out of the scope of
this patch which aims to fix the buffer overflow error.

--
Best regards,
Pavel Shilovsky

