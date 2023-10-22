Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A257D25A7
	for <lists+samba-technical@lfdr.de>; Sun, 22 Oct 2023 21:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=EpqiASa001szTj/JwrLYMRxR+p26o2RQ+JlUvx49bnw=; b=OJj2Pz99BTj5UVja/7rKHMqiQj
	/8ilvdwXUZEjsxnBi9qtbwb9dxse6JEOjRCsS7wNV9rjpTBB7uonyC2mgOaWpsIMH+OskmxVp7Ydr
	ZdvoUPwMNoqz05Mi49iqPG5RrVZHSxhgrH7jQnM7GlFO5VtTa4StIBdIlSuKJ44QjxJCN3BTHDX3u
	DjbqZIuwfNQbvWGKKblRsrHu9AN08fhSAr1+/XtZcLKOQRcooIBY8C24ipZzANrsyOnfjJhijurvn
	4q426sp/RJ0MsBWYVvUPIXPeqnS2j3WkJyEvb9pwP6z8Ko4RW2+G/3KdXLB4YMq3sI/48WSBGuqIL
	LYrTAp9g==;
Received: from ip6-localhost ([::1]:46588 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1queJh-001lsJ-Gq; Sun, 22 Oct 2023 19:40:53 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:52226) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1queJa-001lsA-63
 for samba-technical@lists.samba.org; Sun, 22 Oct 2023 19:40:50 +0000
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5079fa1bbf8so3732378e87.0
 for <samba-technical@lists.samba.org>; Sun, 22 Oct 2023 12:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698003644; x=1698608444; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EpqiASa001szTj/JwrLYMRxR+p26o2RQ+JlUvx49bnw=;
 b=dsbbuKgEkpFkgihuZ5CeUxaydgjIi5nxpXpMk+9uJ+1aDG4aX73AruLPb/WTQbhE0o
 kRhFfR1oVRtGz9DFuDDf5WvvVMh0vQWnrKObcDDwOQc/O9zo7bpmCrV3yEHNtyaYiPGt
 V3nwIftlbg8Uyw04QGRstSC1jHXish5m/G81pJXq8HtRAvLmCOrAKu21+bpQu6LR5Adk
 p3IywM7sDeSFMK8isHBXuAHxtNZvbOxxpZH/2pCJ03ZfzRAiw2uWZDsC8G7Ze4ieDFRz
 keEcw4Mf5FY60fcU0erCGf8q2sGUmYNQSwjUQNgkzjelQzIf3GCsolt8pMMzxJB+rLgh
 Yh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698003644; x=1698608444;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EpqiASa001szTj/JwrLYMRxR+p26o2RQ+JlUvx49bnw=;
 b=Ugj2NMgxskV7Ah3rLkXfBKcSEjSFf7ZvvZ5MHhYqVxTEHL0CIEceNk+e5EP/dXsWL2
 15sKIxhHlFN2Tbzk1W83bsH69cFZ+TVQtKnq6iBLBSc+5iMRJ+p7bC2t5EypGc8zIuCJ
 9wneHIV7uzH1Ra8a8CzbeJhAPXAZZv8YxY7bO19HB+lZYtET1C1d4g7Ia32ZNPMXdbhs
 gLn6JZDwnfL55jD8Qa82hmYvRm0HZ2EE4AmxryIGpwcDUM/f6sIwv2pj24hpOOG092Mx
 E3R69vsyPXaDX8MuzrFUBmHsZo0ZB8yptJgM1By65vYYyFUcyTNolx1Iu3M31CQHjMsc
 /c3w==
X-Gm-Message-State: AOJu0Yw2A+h0zzApXSZjY/XtXNmJXlI8Dm8+02kHCTm/70cwZ+LtYQSB
 dka9JhNUHgA8TglmTqKCDxbVnvEN5o4eSaX+3jk=
X-Google-Smtp-Source: AGHT+IF8kyHYxAr+1R3dpe7aiUHOojOl18PBnf2Wrh7GpC/YyZESF3usVUW4V0af+/F/4fHov+7t0syiI9+JecKnjeg=
X-Received: by 2002:a19:711c:0:b0:500:aa41:9d67 with SMTP id
 m28-20020a19711c000000b00500aa419d67mr4413055lfc.8.1698003643016; Sun, 22 Oct
 2023 12:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20231022183917.1013135-1-sanpeqf@gmail.com>
 <CAH2r5mvAvXaXTWr8CWnVZcXa3tiU+ZfpBoo0tiY-RH194f2xow@mail.gmail.com>
In-Reply-To: <CAH2r5mvAvXaXTWr8CWnVZcXa3tiU+ZfpBoo0tiY-RH194f2xow@mail.gmail.com>
Date: Sun, 22 Oct 2023 14:40:31 -0500
Message-ID: <CAH2r5mvAOYqjP7JvGxF5Jt58386Sjwke7516XUet-6L6XW3_NQ@mail.gmail.com>
Subject: Re: [PATCH] fs/smb: using crypto lib instead cifs_arc4
To: John Sanpe <sanpeqf@gmail.com>, ronnie sahlberg <ronniesahlberg@gmail.com>
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
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 llvm@lists.linux.dev, samba-technical <samba-technical@lists.samba.org>,
 linux-kernel@vger.kernel.org, Jeremy Allison <jra@samba.org>,
 oe-kbuild-all@lists.linux.dev, linkinjeon@kernel.org, stfrench@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Adding Ronnie to cc: since he may have additional context why arc4 was
moved out of crypto to cifs common code

On Sun, Oct 22, 2023 at 2:38=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> I thought that the whole point of kernel crypto guys was the reverse -
> ie arc4 must be moved to cifs.ko since cifs/smb3 mounts had the only
> approved use case.  Ronnie may have additional context, but there was
> a push to remove arc4 and md4 (see e.g. the emails threads about:
> "crypto: remove MD4 generic shash").  I also want to be careful that
> we don't accidentally disable smb3.1.1 mounts (which are highly
> secure) because they have small dependencies on old algorithms (even
> if that doesn't cause problems with typical reasonable length password
> cases)
>
> commit 71c02863246167b3d1639b8278681ca8ebedcb4e
> Author: Ronnie Sahlberg <lsahlber@redhat.com>
> Date:   Thu Aug 19 20:34:59 2021 +1000
>
>     cifs: fork arc4 and create a separate module for it for cifs and othe=
r users
>
>     We can not drop ARC4 and basically destroy CIFS connectivity for
>     almost all CIFS users so create a new forked ARC4 module that CIFS an=
d other
>     subsystems that have a hard dependency on ARC4 can use.
>
> On Sun, Oct 22, 2023 at 1:39=E2=80=AFPM John Sanpe <sanpeqf@gmail.com> wr=
ote:
> >
> > Replace internal logic with an independent arc4 library.
> >
> > Signed-off-by: John Sanpe <sanpeqf@gmail.com>
> > ---
> >  fs/smb/Kconfig              |  1 +
> >  fs/smb/client/cifsencrypt.c |  7 ++--
> >  fs/smb/common/Makefile      |  1 -
> >  fs/smb/common/arc4.h        | 23 ------------
> >  fs/smb/common/cifs_arc4.c   | 74 -------------------------------------
> >  fs/smb/server/auth.c        |  6 +--
> >  6 files changed, 7 insertions(+), 105 deletions(-)
> >  delete mode 100644 fs/smb/common/arc4.h
> >  delete mode 100644 fs/smb/common/cifs_arc4.c
> >
> > diff --git a/fs/smb/Kconfig b/fs/smb/Kconfig
> > index ef425789fa6a..65e5a437898b 100644
> > --- a/fs/smb/Kconfig
> > +++ b/fs/smb/Kconfig
> > @@ -7,5 +7,6 @@ source "fs/smb/server/Kconfig"
> >
> >  config SMBFS
> >         tristate
> > +       select CRYPTO_LIB_ARC4
> >         default y if CIFS=3Dy || SMB_SERVER=3Dy
> >         default m if CIFS=3Dm || SMB_SERVER=3Dm
> > diff --git a/fs/smb/client/cifsencrypt.c b/fs/smb/client/cifsencrypt.c
> > index ef4c2e3c9fa6..d8754c406b5f 100644
> > --- a/fs/smb/client/cifsencrypt.c
> > +++ b/fs/smb/client/cifsencrypt.c
> > @@ -21,7 +21,7 @@
> >  #include <linux/random.h>
> >  #include <linux/highmem.h>
> >  #include <linux/fips.h>
> > -#include "../common/arc4.h"
> > +#include <crypto/arc4.h>
> >  #include <crypto/aead.h>
> >
> >  /*
> > @@ -826,9 +826,8 @@ calc_seckey(struct cifs_ses *ses)
> >                 return -ENOMEM;
> >         }
> >
> > -       cifs_arc4_setkey(ctx_arc4, ses->auth_key.response, CIFS_SESS_KE=
Y_SIZE);
> > -       cifs_arc4_crypt(ctx_arc4, ses->ntlmssp->ciphertext, sec_key,
> > -                       CIFS_CPHTXT_SIZE);
> > +       arc4_setkey(ctx_arc4, ses->auth_key.response, CIFS_SESS_KEY_SIZ=
E);
> > +       arc4_crypt(ctx_arc4, ses->ntlmssp->ciphertext, sec_key, CIFS_CP=
HTXT_SIZE);
> >
> >         /* make secondary_key/nonce as session key */
> >         memcpy(ses->auth_key.response, sec_key, CIFS_SESS_KEY_SIZE);
> > diff --git a/fs/smb/common/Makefile b/fs/smb/common/Makefile
> > index c66dbbc1469c..9e0730a385fb 100644
> > --- a/fs/smb/common/Makefile
> > +++ b/fs/smb/common/Makefile
> > @@ -3,5 +3,4 @@
> >  # Makefile for Linux filesystem routines that are shared by client and=
 server.
> >  #
> >
> > -obj-$(CONFIG_SMBFS) +=3D cifs_arc4.o
> >  obj-$(CONFIG_SMBFS) +=3D cifs_md4.o
> > diff --git a/fs/smb/common/arc4.h b/fs/smb/common/arc4.h
> > deleted file mode 100644
> > index 12e71ec033a1..000000000000
> > --- a/fs/smb/common/arc4.h
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0+ */
> > -/*
> > - * Common values for ARC4 Cipher Algorithm
> > - */
> > -
> > -#ifndef _CRYPTO_ARC4_H
> > -#define _CRYPTO_ARC4_H
> > -
> > -#include <linux/types.h>
> > -
> > -#define ARC4_MIN_KEY_SIZE      1
> > -#define ARC4_MAX_KEY_SIZE      256
> > -#define ARC4_BLOCK_SIZE                1
> > -
> > -struct arc4_ctx {
> > -       u32 S[256];
> > -       u32 x, y;
> > -};
> > -
> > -int cifs_arc4_setkey(struct arc4_ctx *ctx, const u8 *in_key, unsigned =
int key_len);
> > -void cifs_arc4_crypt(struct arc4_ctx *ctx, u8 *out, const u8 *in, unsi=
gned int len);
> > -
> > -#endif /* _CRYPTO_ARC4_H */
> > diff --git a/fs/smb/common/cifs_arc4.c b/fs/smb/common/cifs_arc4.c
> > deleted file mode 100644
> > index 043e4cb839fa..000000000000
> > --- a/fs/smb/common/cifs_arc4.c
> > +++ /dev/null
> > @@ -1,74 +0,0 @@
> > -// SPDX-License-Identifier: GPL-2.0-or-later
> > -/*
> > - * Cryptographic API
> > - *
> > - * ARC4 Cipher Algorithm
> > - *
> > - * Jon Oberheide <jon@oberheide.org>
> > - */
> > -
> > -#include <linux/module.h>
> > -#include "arc4.h"
> > -
> > -MODULE_LICENSE("GPL");
> > -
> > -int cifs_arc4_setkey(struct arc4_ctx *ctx, const u8 *in_key, unsigned =
int key_len)
> > -{
> > -       int i, j =3D 0, k =3D 0;
> > -
> > -       ctx->x =3D 1;
> > -       ctx->y =3D 0;
> > -
> > -       for (i =3D 0; i < 256; i++)
> > -               ctx->S[i] =3D i;
> > -
> > -       for (i =3D 0; i < 256; i++) {
> > -               u32 a =3D ctx->S[i];
> > -
> > -               j =3D (j + in_key[k] + a) & 0xff;
> > -               ctx->S[i] =3D ctx->S[j];
> > -               ctx->S[j] =3D a;
> > -               if (++k >=3D key_len)
> > -                       k =3D 0;
> > -       }
> > -
> > -       return 0;
> > -}
> > -EXPORT_SYMBOL_GPL(cifs_arc4_setkey);
> > -
> > -void cifs_arc4_crypt(struct arc4_ctx *ctx, u8 *out, const u8 *in, unsi=
gned int len)
> > -{
> > -       u32 *const S =3D ctx->S;
> > -       u32 x, y, a, b;
> > -       u32 ty, ta, tb;
> > -
> > -       if (len =3D=3D 0)
> > -               return;
> > -
> > -       x =3D ctx->x;
> > -       y =3D ctx->y;
> > -
> > -       a =3D S[x];
> > -       y =3D (y + a) & 0xff;
> > -       b =3D S[y];
> > -
> > -       do {
> > -               S[y] =3D a;
> > -               a =3D (a + b) & 0xff;
> > -               S[x] =3D b;
> > -               x =3D (x + 1) & 0xff;
> > -               ta =3D S[x];
> > -               ty =3D (y + ta) & 0xff;
> > -               tb =3D S[ty];
> > -               *out++ =3D *in++ ^ S[a];
> > -               if (--len =3D=3D 0)
> > -                       break;
> > -               y =3D ty;
> > -               a =3D ta;
> > -               b =3D tb;
> > -       } while (true);
> > -
> > -       ctx->x =3D x;
> > -       ctx->y =3D y;
> > -}
> > -EXPORT_SYMBOL_GPL(cifs_arc4_crypt);
> > diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
> > index 229a6527870d..5640196b313f 100644
> > --- a/fs/smb/server/auth.c
> > +++ b/fs/smb/server/auth.c
> > @@ -29,7 +29,7 @@
> >  #include "mgmt/user_config.h"
> >  #include "crypto_ctx.h"
> >  #include "transport_ipc.h"
> > -#include "../common/arc4.h"
> > +#include <crypto/arc4.h>
> >
> >  /*
> >   * Fixed format data defining GSS header and fixed string
> > @@ -362,9 +362,9 @@ int ksmbd_decode_ntlmssp_auth_blob(struct authentic=
ate_message *authblob,
> >                 if (!ctx_arc4)
> >                         return -ENOMEM;
> >
> > -               cifs_arc4_setkey(ctx_arc4, sess->sess_key,
> > +               arc4_setkey(ctx_arc4, sess->sess_key,
> >                                  SMB2_NTLMV2_SESSKEY_SIZE);
> > -               cifs_arc4_crypt(ctx_arc4, sess->sess_key,
> > +               arc4_crypt(ctx_arc4, sess->sess_key,
> >                                 (char *)authblob + sess_key_off, sess_k=
ey_len);
> >                 kfree_sensitive(ctx_arc4);
> >         }
> > --
> > 2.41.0
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

