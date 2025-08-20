Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 38873B2E298
	for <lists+samba-technical@lfdr.de>; Wed, 20 Aug 2025 18:44:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=pPK6zSskxes3FxPAgpbh0MIj+d5VpC9fOwpfauPtseQ=; b=BF/6Pqbu13mQSdX3rVxNQJTfKA
	qjkL01oWUyn3MzZsiUhwhEsvmqG3N8xqUdlDnKwD9jURYXuElxqhsKyMVx47GBZto43es4eJvvYoN
	DK4HLKQrfQWSAsEEFi9g5AbigsuTAgx7giPwj2d46eJ9SR6o3RmAlcqpVeitym0K6Qxt+yg85lkQK
	iasM7SYG2sVh+WyJihxxYZJXibmrJZTBm3VVfTuqDLUQQxrz0xhPLnzP4FC+JHka+IJWX0ai6eyav
	m8Wgx7FaAQiSJ7yij81f0+MpLR9pbSlyUDj24dKsORqnwvjR0//rNmibfyf3b58SpkfeDdChh31lj
	Lni+M5RQ==;
Received: from ip6-localhost ([::1]:26794 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uoluJ-00FNK3-9g; Wed, 20 Aug 2025 16:43:27 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:54379) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uoluD-00FNJw-7y
 for samba-technical@lists.samba.org; Wed, 20 Aug 2025 16:43:25 +0000
Received: by mail-qv1-xf35.google.com with SMTP id
 6a1803df08f44-70bb007a821so1941056d6.0
 for <samba-technical@lists.samba.org>; Wed, 20 Aug 2025 09:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755708199; x=1756312999; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pPK6zSskxes3FxPAgpbh0MIj+d5VpC9fOwpfauPtseQ=;
 b=mmcN0+GVcnh4ZevNJkDZ6fAjXkLfuOt3pqgX2S9ZEtVXnRlye5MDuIaprqcsHy/qG+
 3nLc/xWO3QSt/TqlnwA5Id6hHF2q53heYDjKxMTKq2jswjoiheBDGzKOJ6L75aikdPS4
 uCiFBkR0fFlwpSBHa7p7gLB0qjmqCVPHvliuXcZCbnkqXvx9oG187W79yq1HWgZsStrA
 ovAG7YvWlzATtdC6hVnp5bttIpG1yKQS3aYNFPFsy3ZtSf3wlh3V+uOfGJqtT4W06aru
 kH9OhXOa9FeUVNhpxvxmIFebLB9HanNt38uujn93s2tgzZeUrATz7jZ9pbcv05MO6FFS
 rdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755708199; x=1756312999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pPK6zSskxes3FxPAgpbh0MIj+d5VpC9fOwpfauPtseQ=;
 b=sU2YGeilxExgizI0cAwgjmAgdP1erS/ww6e9cz0vH0tBVXdYyZsesCKbFwPGqd8lLZ
 2tLpMXG62MloojY1cB+LzRMwryWma4G3jXxNbtkMXEog85tXAaqIvvC6Gypp7NrQgsCu
 dp+BiBphwGqvYnJt4HOoC2si5OXKjeOgX8p8zkuiRESHxbhZzk6Ev+iKOEve3Hmdqjic
 Z5vzh5LluQ1YIIZW8sPfxDO+hg/mZSalaKT41tziaDOVnYN9HG62gDQgCE/5PVGreJEq
 DBloYbA8qlzvtSyXLDIafuQQ1sBR1QsgymDkBqPJrCU5Qhrr4QTXvK+/QH8T6o1pe9hp
 aw5A==
X-Gm-Message-State: AOJu0YzmrZa9LtgQum/T4D57m+An123mAa00KlUlNcBe2G7Yals20E4i
 WPPdl5OxKyGIsWvXJcS9MGChG8TXE6kxHyj12w8OAwy16dIVQXqC3xDrkEGYuqMJ0hJjB3xRUAW
 7xrTuxbXkD/bvpeVqmdZkOXc614R7PqJHdQ==
X-Gm-Gg: ASbGncvgMWYBv4cUu92zMMHTvQJOALv3WZh0Q5YHQGlOkIYjwIkptXWWq5VVcLCR4qZ
 odQzs1EFpSVxuUYp2mwx3vDylf2AITc0rweSKx/czN4MnnG+9u9RwLGANsszVQpVD57TRhcSbZ+
 ptO8QAM9WFPCO+21qVT3MvqKzzqlH0oIPrNzUoJ+aKH3LogPlnExrattRNyIxyNNJ6yo9Pe25Px
 Zby8xEUbZXIbH3NxvjV9P9mQtCutUMvOcJ2Kl/K
X-Google-Smtp-Source: AGHT+IFAGYD1EMfWdeNERHgjXBsRM8ZEbFzQOZubl3kKxEizGfRf2Mv9Pl/qpQv4Vyi2Jyd7KjlCrFDO1ski84yyus4=
X-Received: by 2002:a05:6214:27ef:b0:70d:6df4:1b07 with SMTP id
 6a1803df08f44-70d77147467mr30397476d6.53.1755708198607; Wed, 20 Aug 2025
 09:43:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250820142413.920482-1-pkerling@rx2.rx-server.de>
 <CAH2r5mupCJs6K3Y9N=oUp6oEAMV2S5=_d0nxirk74ZQ24gH7Eg@mail.gmail.com>
 <CAH2r5muNhfk-CHLYLcKMU+yXGqfiQtrZZ5ogf0PJcTsGTiBAJQ@mail.gmail.com>
In-Reply-To: <CAH2r5muNhfk-CHLYLcKMU+yXGqfiQtrZZ5ogf0PJcTsGTiBAJQ@mail.gmail.com>
Date: Wed, 20 Aug 2025 11:43:05 -0500
X-Gm-Features: Ac12FXyP-E8gBZ_xQsoQTg9OM7VmiftZ6JQMbRblwnWXkaPs2LY8yL35fJ6wp84
Message-ID: <CAH2r5mtB0aNQMYzUhgu0_xRzkWL1xYoRa6b5a5CiKUhV+WU_QQ@mail.gmail.com>
Subject: Fwd: [PATCH] ksmbd: allow a filename to contain colons on SMB3.1.1
 posix extensions
To: samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Adding samba-technical in case opinions on this

---------- Forwarded message ---------
From: Steve French <smfrench@gmail.com>
Date: Wed, Aug 20, 2025 at 11:42=E2=80=AFAM
Subject: Re: [PATCH] ksmbd: allow a filename to contain colons on
SMB3.1.1 posix extensions
To: Philipp Kerling <pkerling@casix.org>
Cc: <linux-cifs@vger.kernel.org>, <linkinjeon@kernel.org>, Philipp
Kerling <pkerling@casix.org>


This remapping of colon (and other reserved characters) is done by
default when not mounting with SMB3.1.1 Linux/POSIX extensions, but
presumably would only be needed for colon with the SMB3.1.1
Linux/POSIX extensions (since colon is the only one that is 'required'
by the protocol to mean something different)

On Wed, Aug 20, 2025 at 11:37=E2=80=AFAM Steve French <smfrench@gmail.com> =
wrote:
>
> Samba allows this with POSIX extensions negotiated (creating file with
> : in the name) but I am wondering if a better way to solve this (to
> avoid any confusion with alternate data streams) is to change the
> client to use SFM_COLON (ie the remap in Unicode where colon is
> remapped to 0xF022 instead of 0x003A)
>
> On Wed, Aug 20, 2025 at 9:35=E2=80=AFAM Philipp Kerling <pkerling@casix.o=
rg> wrote:
> >
> > If the client sends SMB2_CREATE_POSIX_CONTEXT to ksmbd, allow the filen=
ame to contain
> > a colon (':'). This requires disabling the support for Alternate Data S=
treams (ADS),
> > which are denoted by a colon-separated suffix to the filename on Window=
s. This should
> > not be an issue, since this concept is not known to POSIX anyway and th=
e client has
> > to explicitly request a POSIX context to get this behavior.
> >
> > Link: https://lore.kernel.org/all/f9401718e2be2ab22058b45a6817db912784e=
f61.camel@rx2.rx-server.de/
> > Signed-off-by: Philipp Kerling <pkerling@casix.org>
> > ---
> >  fs/smb/server/smb2pdu.c   | 25 ++++++++++++++-----------
> >  fs/smb/server/vfs_cache.h |  2 ++
> >  2 files changed, 16 insertions(+), 11 deletions(-)
> >
> > diff --git a/fs/smb/server/smb2pdu.c b/fs/smb/server/smb2pdu.c
> > index 0d92ce49aed7..a565fc36cee6 100644
> > --- a/fs/smb/server/smb2pdu.c
> > +++ b/fs/smb/server/smb2pdu.c
> > @@ -2951,18 +2951,19 @@ int smb2_open(struct ksmbd_work *work)
> >                 }
> >
> >                 ksmbd_debug(SMB, "converted name =3D %s\n", name);
> > -               if (strchr(name, ':')) {
> > -                       if (!test_share_config_flag(work->tcon->share_c=
onf,
> > -                                                   KSMBD_SHARE_FLAG_ST=
REAMS)) {
> > -                               rc =3D -EBADF;
> > -                               goto err_out2;
> > -                       }
> > -                       rc =3D parse_stream_name(name, &stream_name, &s=
_type);
> > -                       if (rc < 0)
> > -                               goto err_out2;
> > -               }
> >
> >                 if (posix_ctxt =3D=3D false) {
> > +                       if (strchr(name, ':')) {
> > +                               if (!test_share_config_flag(work->tcon-=
>share_conf,
> > +                                                       KSMBD_SHARE_FLA=
G_STREAMS)) {
> > +                                       rc =3D -EBADF;
> > +                                       goto err_out2;
> > +                               }
> > +                               rc =3D parse_stream_name(name, &stream_=
name, &s_type);
> > +                               if (rc < 0)
> > +                                       goto err_out2;
> > +                       }
> > +
> >                         rc =3D ksmbd_validate_filename(name);
> >                         if (rc < 0)
> >                                 goto err_out2;
> > @@ -3443,6 +3444,8 @@ int smb2_open(struct ksmbd_work *work)
> >         fp->attrib_only =3D !(req->DesiredAccess & ~(FILE_READ_ATTRIBUT=
ES_LE |
> >                         FILE_WRITE_ATTRIBUTES_LE | FILE_SYNCHRONIZE_LE)=
);
> >
> > +       fp->is_posix_ctxt =3D posix_ctxt;
> > +
> >         /* fp should be searchable through ksmbd_inode.m_fp_list
> >          * after daccess, saccess, attrib_only, and stream are
> >          * initialized.
> > @@ -5988,7 +5991,7 @@ static int smb2_rename(struct ksmbd_work *work,
> >         if (IS_ERR(new_name))
> >                 return PTR_ERR(new_name);
> >
> > -       if (strchr(new_name, ':')) {
> > +       if (fp->is_posix_ctxt =3D=3D false && strchr(new_name, ':')) {
> >                 int s_type;
> >                 char *xattr_stream_name, *stream_name =3D NULL;
> >                 size_t xattr_stream_size;
> > diff --git a/fs/smb/server/vfs_cache.h b/fs/smb/server/vfs_cache.h
> > index 0708155b5caf..78b506c5ef03 100644
> > --- a/fs/smb/server/vfs_cache.h
> > +++ b/fs/smb/server/vfs_cache.h
> > @@ -112,6 +112,8 @@ struct ksmbd_file {
> >         bool                            is_durable;
> >         bool                            is_persistent;
> >         bool                            is_resilient;
> > +
> > +       bool                            is_posix_ctxt;
> >  };
> >
> >  static inline void set_ctx_actor(struct dir_context *ctx,
> > --
> > 2.50.1
> >
> >
>
>
> --
> Thanks,
>
> Steve



--
Thanks,

Steve


--=20
Thanks,

Steve

