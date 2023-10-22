Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9726A7D25AA
	for <lists+samba-technical@lfdr.de>; Sun, 22 Oct 2023 21:42:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=ZAxrY+DvSeV1naph1YQXGdec4N9VEG4ODQW1BRo0mtE=; b=J/uZKlMCGkoTAPn+XY5bpoLxsI
	K1C8HOckvrKeX287G/kdsonaHlBQhBMIvglnezOihVsI/p2qMxgqjPC0E6nvYLLfGcGJv3HH6CIVa
	s4KhvmU6VOH+3qOehxFvVM3+7rjxOcxILBRhcfInwX97T79UbL1B9wIv11hJnGGsgtqY00PL8Tb8D
	/i6NCyWKHmjUxcSmkoqk9PcUwzPhduxscLYQNOIkCR+H3oynDlpzgmdiTrmfP+7GYEXEZArSH0xFD
	3AWFideMcPWUIbWnh/9LRV36KROZbgSkhajRsaudmx4UXAmC59rFEHnVNOYEaJhXRBxuZo3Y5q5kv
	ZFZqP60Q==;
Received: from ip6-localhost ([::1]:25848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1queLI-001m9k-JA; Sun, 22 Oct 2023 19:42:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:48326) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1queLB-001m9b-Uy
 for samba-technical@lists.samba.org; Sun, 22 Oct 2023 19:42:30 +0000
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1c9d407bb15so21752975ad.0
 for <samba-technical@lists.samba.org>; Sun, 22 Oct 2023 12:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698003743; x=1698608543; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZAxrY+DvSeV1naph1YQXGdec4N9VEG4ODQW1BRo0mtE=;
 b=a1sz17XKhkNLCk3O1KY1hb27mv04eXCVJWmQvBYY23CJrvDv4r4AbkcDZ2Sh9Fahft
 fZjRWpf8raMJAkJ8PDjHooVeYQ/Uk+zIKm31SYqjB5dS+H67XGsYFbgdHro3068G669h
 Oe2NHh43SYSI6MU12qiQlqVG5nThkab08gnry9TiYVomjWRVhgfo70imXCnrJH8dbF6Q
 lxPvmgkzClG7QLk4D+oZYR11wZ1A05um32ns2tVgVx2A1C8qOoMspvcd9qCA3zkeqGCg
 AqOIDPxtGwxoqMR66R5c6khPsgKu+/yXey7GqTLG0HsdzQJHvIGPAX3pDrpaTT66v3rM
 9WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698003743; x=1698608543;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZAxrY+DvSeV1naph1YQXGdec4N9VEG4ODQW1BRo0mtE=;
 b=aQNQdLuDJgujzQ8jY7vKrKi5yVFpDxC2oQi3gsK5ulgSsDIFYjl3HrelXGKpyKaV0L
 KJOlxRB9D8IQGOF55BFo1znXlq8nlhzjFl7K+MHs254EDiqJegsBw3WVVf5/ik1NQc/7
 bE0bl1Cf3l5gaQsKGAVevlKxyIcdGxqLFLkAymKc1iZa6MhwZCHDD42AmTqnozR3BP43
 9jiq3Ot9xMdNbUzpvV85FOTDhjAORRSD46Gw3D9KRlN9Ii2hJ5+Gqdy1kUPPHuZ7eheV
 0FgAoWFSjYUwNFi+SIUrg8izUFSHNzwEMoqnnIVh3GYJzeGcQ2LITJG9xm3gVeJFiuZW
 068A==
X-Gm-Message-State: AOJu0Yxcadu7T8laMIk/GnlzLmCLGM0/iyTxAOXuJm9o3LK5evpvh5Lg
 z5/BRl3CAsI/5WtKfO+nJn+TDFRyKyZyBo74H/0=
X-Google-Smtp-Source: AGHT+IF8XB/A8NP85Pe587yFKnS6LdoZGhge8fVO5EX6Ihc8E5PRzEzZo+aPhtlxatQN/tETpb/Nf5oxE9zgv2shppk=
X-Received: by 2002:a17:903:1246:b0:1ca:28f3:5690 with SMTP id
 u6-20020a170903124600b001ca28f35690mr9491555plh.46.1698003743433; Sun, 22 Oct
 2023 12:42:23 -0700 (PDT)
MIME-Version: 1.0
References: <20231022183917.1013135-1-sanpeqf@gmail.com>
 <CAH2r5mvAvXaXTWr8CWnVZcXa3tiU+ZfpBoo0tiY-RH194f2xow@mail.gmail.com>
 <CAH2r5mvAOYqjP7JvGxF5Jt58386Sjwke7516XUet-6L6XW3_NQ@mail.gmail.com>
In-Reply-To: <CAH2r5mvAOYqjP7JvGxF5Jt58386Sjwke7516XUet-6L6XW3_NQ@mail.gmail.com>
Date: Mon, 23 Oct 2023 05:42:11 +1000
Message-ID: <CAN05THRzP6uFyza90kBy5Ku8yGKMi2K5VYX1TJsjbvQrLfAEiw@mail.gmail.com>
Subject: Re: [PATCH] fs/smb: using crypto lib instead cifs_arc4
To: Steve French <smfrench@gmail.com>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org, sprasad@microsoft.com,
 John Sanpe <sanpeqf@gmail.com>, llvm@lists.linux.dev,
 samba-technical <samba-technical@lists.samba.org>,
 linux-kernel@vger.kernel.org, Jeremy Allison <jra@samba.org>,
 oe-kbuild-all@lists.linux.dev, linkinjeon@kernel.org, stfrench@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

You are right. The reason that arc4 and friend were moved into cifs
was because the crypto guys told us "we will delete these algorithms
from the crypto library"

On Mon, 23 Oct 2023 at 05:40, Steve French <smfrench@gmail.com> wrote:
>
> Adding Ronnie to cc: since he may have additional context why arc4 was
> moved out of crypto to cifs common code
>
> On Sun, Oct 22, 2023 at 2:38=E2=80=AFPM Steve French <smfrench@gmail.com>=
 wrote:
> >
> > I thought that the whole point of kernel crypto guys was the reverse -
> > ie arc4 must be moved to cifs.ko since cifs/smb3 mounts had the only
> > approved use case.  Ronnie may have additional context, but there was
> > a push to remove arc4 and md4 (see e.g. the emails threads about:
> > "crypto: remove MD4 generic shash").  I also want to be careful that
> > we don't accidentally disable smb3.1.1 mounts (which are highly
> > secure) because they have small dependencies on old algorithms (even
> > if that doesn't cause problems with typical reasonable length password
> > cases)
> >
> > commit 71c02863246167b3d1639b8278681ca8ebedcb4e
> > Author: Ronnie Sahlberg <lsahlber@redhat.com>
> > Date:   Thu Aug 19 20:34:59 2021 +1000
> >
> >     cifs: fork arc4 and create a separate module for it for cifs and ot=
her users
> >
> >     We can not drop ARC4 and basically destroy CIFS connectivity for
> >     almost all CIFS users so create a new forked ARC4 module that CIFS =
and other
> >     subsystems that have a hard dependency on ARC4 can use.
> >
> > On Sun, Oct 22, 2023 at 1:39=E2=80=AFPM John Sanpe <sanpeqf@gmail.com> =
wrote:
> > >
> > > Replace internal logic with an independent arc4 library.
> > >
> > > Signed-off-by: John Sanpe <sanpeqf@gmail.com>
> > > ---
> > >  fs/smb/Kconfig              |  1 +
> > >  fs/smb/client/cifsencrypt.c |  7 ++--
> > >  fs/smb/common/Makefile      |  1 -
> > >  fs/smb/common/arc4.h        | 23 ------------
> > >  fs/smb/common/cifs_arc4.c   | 74 -----------------------------------=
--
> > >  fs/smb/server/auth.c        |  6 +--
> > >  6 files changed, 7 insertions(+), 105 deletions(-)
> > >  delete mode 100644 fs/smb/common/arc4.h
> > >  delete mode 100644 fs/smb/common/cifs_arc4.c
> > >
> > > diff --git a/fs/smb/Kconfig b/fs/smb/Kconfig
> > > index ef425789fa6a..65e5a437898b 100644
> > > --- a/fs/smb/Kconfig
> > > +++ b/fs/smb/Kconfig
> > > @@ -7,5 +7,6 @@ source "fs/smb/server/Kconfig"
> > >
> > >  config SMBFS
> > >         tristate
> > > +       select CRYPTO_LIB_ARC4
> > >         default y if CIFS=3Dy || SMB_SERVER=3Dy
> > >         default m if CIFS=3Dm || SMB_SERVER=3Dm
> > > diff --git a/fs/smb/client/cifsencrypt.c b/fs/smb/client/cifsencrypt.=
c
> > > index ef4c2e3c9fa6..d8754c406b5f 100644
> > > --- a/fs/smb/client/cifsencrypt.c
> > > +++ b/fs/smb/client/cifsencrypt.c
> > > @@ -21,7 +21,7 @@
> > >  #include <linux/random.h>
> > >  #include <linux/highmem.h>
> > >  #include <linux/fips.h>
> > > -#include "../common/arc4.h"
> > > +#include <crypto/arc4.h>
> > >  #include <crypto/aead.h>
> > >
> > >  /*
> > > @@ -826,9 +826,8 @@ calc_seckey(struct cifs_ses *ses)
> > >                 return -ENOMEM;
> > >         }
> > >
> > > -       cifs_arc4_setkey(ctx_arc4, ses->auth_key.response, CIFS_SESS_=
KEY_SIZE);
> > > -       cifs_arc4_crypt(ctx_arc4, ses->ntlmssp->ciphertext, sec_key,
> > > -                       CIFS_CPHTXT_SIZE);
> > > +       arc4_setkey(ctx_arc4, ses->auth_key.response, CIFS_SESS_KEY_S=
IZE);
> > > +       arc4_crypt(ctx_arc4, ses->ntlmssp->ciphertext, sec_key, CIFS_=
CPHTXT_SIZE);
> > >
> > >         /* make secondary_key/nonce as session key */
> > >         memcpy(ses->auth_key.response, sec_key, CIFS_SESS_KEY_SIZE);
> > > diff --git a/fs/smb/common/Makefile b/fs/smb/common/Makefile
> > > index c66dbbc1469c..9e0730a385fb 100644
> > > --- a/fs/smb/common/Makefile
> > > +++ b/fs/smb/common/Makefile
> > > @@ -3,5 +3,4 @@
> > >  # Makefile for Linux filesystem routines that are shared by client a=
nd server.
> > >  #
> > >
> > > -obj-$(CONFIG_SMBFS) +=3D cifs_arc4.o
> > >  obj-$(CONFIG_SMBFS) +=3D cifs_md4.o
> > > diff --git a/fs/smb/common/arc4.h b/fs/smb/common/arc4.h
> > > deleted file mode 100644
> > > index 12e71ec033a1..000000000000
> > > --- a/fs/smb/common/arc4.h
> > > +++ /dev/null
> > > @@ -1,23 +0,0 @@
> > > -/* SPDX-License-Identifier: GPL-2.0+ */
> > > -/*
> > > - * Common values for ARC4 Cipher Algorithm
> > > - */
> > > -
> > > -#ifndef _CRYPTO_ARC4_H
> > > -#define _CRYPTO_ARC4_H
> > > -
> > > -#include <linux/types.h>
> > > -
> > > -#define ARC4_MIN_KEY_SIZE      1
> > > -#define ARC4_MAX_KEY_SIZE      256
> > > -#define ARC4_BLOCK_SIZE                1
> > > -
> > > -struct arc4_ctx {
> > > -       u32 S[256];
> > > -       u32 x, y;
> > > -};
> > > -
> > > -int cifs_arc4_setkey(struct arc4_ctx *ctx, const u8 *in_key, unsigne=
d int key_len);
> > > -void cifs_arc4_crypt(struct arc4_ctx *ctx, u8 *out, const u8 *in, un=
signed int len);
> > > -
> > > -#endif /* _CRYPTO_ARC4_H */
> > > diff --git a/fs/smb/common/cifs_arc4.c b/fs/smb/common/cifs_arc4.c
> > > deleted file mode 100644
> > > index 043e4cb839fa..000000000000
> > > --- a/fs/smb/common/cifs_arc4.c
> > > +++ /dev/null
> > > @@ -1,74 +0,0 @@
> > > -// SPDX-License-Identifier: GPL-2.0-or-later
> > > -/*
> > > - * Cryptographic API
> > > - *
> > > - * ARC4 Cipher Algorithm
> > > - *
> > > - * Jon Oberheide <jon@oberheide.org>
> > > - */
> > > -
> > > -#include <linux/module.h>
> > > -#include "arc4.h"
> > > -
> > > -MODULE_LICENSE("GPL");
> > > -
> > > -int cifs_arc4_setkey(struct arc4_ctx *ctx, const u8 *in_key, unsigne=
d int key_len)
> > > -{
> > > -       int i, j =3D 0, k =3D 0;
> > > -
> > > -       ctx->x =3D 1;
> > > -       ctx->y =3D 0;
> > > -
> > > -       for (i =3D 0; i < 256; i++)
> > > -               ctx->S[i] =3D i;
> > > -
> > > -       for (i =3D 0; i < 256; i++) {
> > > -               u32 a =3D ctx->S[i];
> > > -
> > > -               j =3D (j + in_key[k] + a) & 0xff;
> > > -               ctx->S[i] =3D ctx->S[j];
> > > -               ctx->S[j] =3D a;
> > > -               if (++k >=3D key_len)
> > > -                       k =3D 0;
> > > -       }
> > > -
> > > -       return 0;
> > > -}
> > > -EXPORT_SYMBOL_GPL(cifs_arc4_setkey);
> > > -
> > > -void cifs_arc4_crypt(struct arc4_ctx *ctx, u8 *out, const u8 *in, un=
signed int len)
> > > -{
> > > -       u32 *const S =3D ctx->S;
> > > -       u32 x, y, a, b;
> > > -       u32 ty, ta, tb;
> > > -
> > > -       if (len =3D=3D 0)
> > > -               return;
> > > -
> > > -       x =3D ctx->x;
> > > -       y =3D ctx->y;
> > > -
> > > -       a =3D S[x];
> > > -       y =3D (y + a) & 0xff;
> > > -       b =3D S[y];
> > > -
> > > -       do {
> > > -               S[y] =3D a;
> > > -               a =3D (a + b) & 0xff;
> > > -               S[x] =3D b;
> > > -               x =3D (x + 1) & 0xff;
> > > -               ta =3D S[x];
> > > -               ty =3D (y + ta) & 0xff;
> > > -               tb =3D S[ty];
> > > -               *out++ =3D *in++ ^ S[a];
> > > -               if (--len =3D=3D 0)
> > > -                       break;
> > > -               y =3D ty;
> > > -               a =3D ta;
> > > -               b =3D tb;
> > > -       } while (true);
> > > -
> > > -       ctx->x =3D x;
> > > -       ctx->y =3D y;
> > > -}
> > > -EXPORT_SYMBOL_GPL(cifs_arc4_crypt);
> > > diff --git a/fs/smb/server/auth.c b/fs/smb/server/auth.c
> > > index 229a6527870d..5640196b313f 100644
> > > --- a/fs/smb/server/auth.c
> > > +++ b/fs/smb/server/auth.c
> > > @@ -29,7 +29,7 @@
> > >  #include "mgmt/user_config.h"
> > >  #include "crypto_ctx.h"
> > >  #include "transport_ipc.h"
> > > -#include "../common/arc4.h"
> > > +#include <crypto/arc4.h>
> > >
> > >  /*
> > >   * Fixed format data defining GSS header and fixed string
> > > @@ -362,9 +362,9 @@ int ksmbd_decode_ntlmssp_auth_blob(struct authent=
icate_message *authblob,
> > >                 if (!ctx_arc4)
> > >                         return -ENOMEM;
> > >
> > > -               cifs_arc4_setkey(ctx_arc4, sess->sess_key,
> > > +               arc4_setkey(ctx_arc4, sess->sess_key,
> > >                                  SMB2_NTLMV2_SESSKEY_SIZE);
> > > -               cifs_arc4_crypt(ctx_arc4, sess->sess_key,
> > > +               arc4_crypt(ctx_arc4, sess->sess_key,
> > >                                 (char *)authblob + sess_key_off, sess=
_key_len);
> > >                 kfree_sensitive(ctx_arc4);
> > >         }
> > > --
> > > 2.41.0
> > >
> >
> >
> > --
> > Thanks,
> >
> > Steve
>
>
>
> --
> Thanks,
>
> Steve

