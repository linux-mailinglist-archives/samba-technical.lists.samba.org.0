Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B330B39CDDA
	for <lists+samba-technical@lfdr.de>; Sun,  6 Jun 2021 09:13:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=OYUBaFTtK+hSWoXiQvsgH4XcUXMu7PaFHiMery0yLvQ=; b=nFqM9CFSDV6cft5cuiwdIxUB9p
	eR7BeFigSsRyhtc5DDa6+d92Dt4ROYNx3knCuJBc/ll0uQBzPalH95KtmrBjsNTNgQRdNKGzaH1G+
	YCfT0bo1kOFfxIxWUXyBDWSPcN5a3Izpz3S3kGJIJOLuPB+hR8Dfji6gh2oJ7JLvAcztXj4DRDxzn
	Y0MkyOxJx2BrkEk04bj8cG+ZET3QLmMn23VaIQG5xlAZAT3l/jtc+2kIyWQPiiYtVIdo+LPKAMAR7
	YepYO1XSs+HcgnD/StPQFyk/AWbidYgTLDm1zpgGNlSk3li9sDM4E+/HF7z4TAtTVhdntTNUFn84R
	Los5wSUg==;
Received: from ip6-localhost ([::1]:34492 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lpmxM-003s13-Bh; Sun, 06 Jun 2021 07:12:25 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:35620) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lpmwn-003s0u-0n
 for samba-technical@lists.samba.org; Sun, 06 Jun 2021 07:11:54 +0000
Received: by mail-lf1-x134.google.com with SMTP id i10so20815796lfj.2
 for <samba-technical@lists.samba.org>; Sun, 06 Jun 2021 00:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OYUBaFTtK+hSWoXiQvsgH4XcUXMu7PaFHiMery0yLvQ=;
 b=G0ckF4oyFz614Zv/Dvkwkgj+p2QhnN3eTmyGFIRWfUjl+GJZiMd305edbeGhL9ZqgN
 2DZAch6QSJxWxpaaH7+X2qeI/U7aFsOeXoCtdMAHC76uvOsebNZfMvxYy4FztU/+kXyr
 vG4O/dxrbntpJaZIBntx+hMlhA/NDmRDKrocXoH4w7kV+RdwisrAlL79acL7T6BXhuyI
 cyxQfRDAw8PpybveOqSYEgm7TTD6P9gVgmwvt/l0J5ENdEBo/trdoR6sRG4pBQ97KsRp
 tja2Z0ysbwVCtDkybuML5qK9St3yV84k0ll+6/Rg6u909N7bfW2oavfnST/mjA+Owa/D
 l4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OYUBaFTtK+hSWoXiQvsgH4XcUXMu7PaFHiMery0yLvQ=;
 b=TC6Pk/5HruQ7VCp1O+ckMkSPO7fHZ8CI30YEALsXq9UFoo/qBRHy4Lmu1JbdNclmB0
 UkTHcaTMnWSsOzCBQPUYPduI/juWrptMLQtiKjuXpuzW01yjazzFeKWcDkdnPFvQQFVx
 bTtwBRLknHsUF0GJ3Jm7qAG4OT/StYXhmAQzhNdQ50mP82MC6jqvTqJjyyOIFLk+6uzN
 /Dejt5cGnAKCI4AEsqtETJepp32Ph6lwKW6hJk3jw3O17Cy84DPfcVV50qoWc0wh9TMp
 Uwly+ldd3VN9WaeumgmTPL7fxkyLCy0/+rlKGLcv+ElJYDYVft3I73/1zLGHxtzEXt5R
 7/uQ==
X-Gm-Message-State: AOAM533EUV602UHVF9ghJnvgOryz8teFXXxszXKtx44yIo0WOP3zspjx
 utWiY8jQjK+TN6SvXpqv+1YmBuyrrQ37AV3hxa0=
X-Google-Smtp-Source: ABdhPJwKFm7SxWBvxRiwzPrgChhDA3I2AWuhkNLwn+iuboXSnKDMkNeZmcV39uJ59pQpOSymz99eAPw8bVi617m4lwk=
X-Received: by 2002:a05:6512:39cb:: with SMTP id
 k11mr8212093lfu.313.1622963507102; 
 Sun, 06 Jun 2021 00:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210606010608.105516-1-hyc.lee@gmail.com>
In-Reply-To: <20210606010608.105516-1-hyc.lee@gmail.com>
Date: Sun, 6 Jun 2021 02:11:36 -0500
Message-ID: <CAH2r5msL2QGZbU6scDVPyWTD+iXBbZ9h2Py4Nk_9EjgPXHx=kg@mail.gmail.com>
Subject: Re: [PATCH v4] cifs: decoding negTokenInit with generic ASN1 decoder
To: Hyunchul Lee <hyc.lee@gmail.com>
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
Cc: David Howells <dhowells@redhat.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 kernel-team@lge.com, Namjae Jeon <linkinjeon@kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

"make M=3Dfs/cifs"  from the top of the kernel tree worked, but my usual
script failed

"cd fs/cifs"
then
"make C=3D1 -C /usr/src/linux-headers-`uname -r` M=3D`pwd` modules
CF=3D-D__CHECK_ENDIAN__"

failed with (even after generating the files with the "make M=3Dfs/cifs" ea=
rlier):

ASN.1   /home/smfrench/cifs-2.6/fs/cifs/spnego_negtokeninit.asn1.[ch]
  CC [M]  /home/smfrench/cifs-2.6/fs/cifs/asn1.o
/home/smfrench/cifs-2.6/fs/cifs/asn1.c: In function =E2=80=98gssapi_this_me=
ch=E2=80=99:
/home/smfrench/cifs-2.6/fs/cifs/asn1.c:28:13: error: =E2=80=98OID_spnego=E2=
=80=99
undeclared (first use in this function)
   28 |  if (oid !=3D OID_spnego) {
      |             ^~~~~~~~~~
/home/smfrench/cifs-2.6/fs/cifs/asn1.c:28:13: note: each undeclared
identifier is reported only once for each function it appears in
/home/smfrench/cifs-2.6/fs/cifs/asn1.c: In function =E2=80=98neg_token_init=
_mech_type=E2=80=99:
/home/smfrench/cifs-2.6/fs/cifs/asn1.c:47:13: error: =E2=80=98OID_mskrb5=E2=
=80=99
undeclared (first use in this function); did you mean =E2=80=98OID_md5=E2=
=80=99?
   47 |  if (oid =3D=3D OID_mskrb5)
      |             ^~~~~~~~~~
      |             OID_md5
/home/smfrench/cifs-2.6/fs/cifs/asn1.c:49:18: error: =E2=80=98OID_krb5u2u=
=E2=80=99
undeclared (first use in this function)
   49 |  else if (oid =3D=3D OID_krb5u2u)
      |                  ^~~~~~~~~~~
/home/smfrench/cifs-2.6/fs/cifs/asn1.c:51:18: error: =E2=80=98OID_krb5=E2=
=80=99
undeclared (first use in this function)
   51 |  else if (oid =3D=3D OID_krb5)
      |                  ^~~~~~~~
/home/smfrench/cifs-2.6/fs/cifs/asn1.c:53:18: error: =E2=80=98OID_ntlmssp=
=E2=80=99
undeclared (first use in this function)
   53 |  else if (oid =3D=3D OID_ntlmssp)
      |                  ^~~~~~~~~~~
make[1]: *** [scripts/Makefile.build:272:
/home/smfrench/cifs-2.6/fs/cifs/asn1.o] Error 1
make: *** [Makefile:1845: /home/smfrench/cifs-2.6/fs/cifs] Error 2
make: Leaving directory
'/usr/src/linux-headers-5.13.0-051300rc3daily20210526-generic

On Sat, Jun 5, 2021 at 8:07 PM Hyunchul Lee <hyc.lee@gmail.com> wrote:
>
> Decode negTokenInit with lib/asn1_decoder. For that,
> add OIDs in linux/oid_registry.h and a negTokenInit
> ASN1 file, "spnego_negtokeninit.asn1".
> And define decoder's callback functions, which
> are the gssapi_this_mech for checking SPENGO oid and
> the neg_token_init_mech_type for getting authentication
> mechanisms supported by a server.
>
> Signed-off-by: Hyunchul Lee <hyc.lee@gmail.com>
> ---
> changes from v3:
>  - Change Makefile to fix a compile error, "spnego_negtokeninit.asn1.h: N=
o such file or directory".
> changes from v2:
>  - Change Makefile to fix a compile error(kernel test bot).
>  - Add cifsproto.h into asn1.c to fix a compile warning(kernel test bot).
> chnages from v1:
>  - Select CONFIG_OID_REGISTRY
>
>  fs/cifs/Kconfig                  |   2 +
>  fs/cifs/Makefile                 |   8 +-
>  fs/cifs/asn1.c                   | 623 ++-----------------------------
>  fs/cifs/spnego_negtokeninit.asn1 |  40 ++
>  include/linux/oid_registry.h     |   8 +
>  5 files changed, 93 insertions(+), 588 deletions(-)
>  create mode 100644 fs/cifs/spnego_negtokeninit.asn1
>
> diff --git a/fs/cifs/Kconfig b/fs/cifs/Kconfig
> index bf52e9326ebe..7de5c893c181 100644
> --- a/fs/cifs/Kconfig
> +++ b/fs/cifs/Kconfig
> @@ -19,6 +19,8 @@ config CIFS
>         select CRYPTO_LIB_DES
>         select KEYS
>         select DNS_RESOLVER
> +       select ASN1
> +       select OID_REGISTRY
>         help
>           This is the client VFS module for the SMB3 family of NAS protoc=
ols,
>           (including support for the most recent, most secure dialect SMB=
3.1.1)
> diff --git a/fs/cifs/Makefile b/fs/cifs/Makefile
> index 3ee3b7de4ded..9d877eafd350 100644
> --- a/fs/cifs/Makefile
> +++ b/fs/cifs/Makefile
> @@ -6,12 +6,16 @@ ccflags-y +=3D -I$(src)         # needed for trace even=
ts
>  obj-$(CONFIG_CIFS) +=3D cifs.o
>
>  cifs-y :=3D trace.o cifsfs.o cifssmb.o cifs_debug.o connect.o dir.o file=
.o \
> -         inode.o link.o misc.o netmisc.o smbencrypt.o transport.o asn1.o=
 \
> +         inode.o link.o misc.o netmisc.o smbencrypt.o transport.o \
>           cifs_unicode.o nterr.o cifsencrypt.o \
>           readdir.o ioctl.o sess.o export.o smb1ops.o unc.o winucase.o \
>           smb2ops.o smb2maperror.o smb2transport.o \
>           smb2misc.o smb2pdu.o smb2inode.o smb2file.o cifsacl.o fs_contex=
t.o \
> -         dns_resolve.o
> +         dns_resolve.o spnego_negtokeninit.asn1.o asn1.o
> +
> +$(obj)/asn1.o: $(obj)/spnego_negtokeninit.asn1.h
> +
> +$(obj)/spnego_negtokeninit.asn1.o: $(obj)/spnego_negtokeninit.asn1.c $(o=
bj)/spnego_negtokeninit.asn1.h
>
>  cifs-$(CONFIG_CIFS_XATTR) +=3D xattr.o
>
> diff --git a/fs/cifs/asn1.c b/fs/cifs/asn1.c
> index 3150c19cdc2f..2db95fe3abfb 100644
> --- a/fs/cifs/asn1.c
> +++ b/fs/cifs/asn1.c
> @@ -1,612 +1,63 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * The ASB.1/BER parsing code is derived from ip_nat_snmp_basic.c which =
was in
> - * turn derived from the gxsnmp package by Gregory McLean & Jochen Fried=
rich
> - *
> - * Copyright (c) 2000 RP Internet (www.rpi.net.au).
> - */
>
>  #include <linux/module.h>
> -#include <linux/types.h>
>  #include <linux/kernel.h>
> -#include <linux/mm.h>
> -#include <linux/slab.h>
> -#include "cifspdu.h"
> +#include <linux/oid_registry.h>
>  #include "cifsglob.h"
>  #include "cifs_debug.h"
>  #include "cifsproto.h"
> +#include "spnego_negtokeninit.asn1.h"
>
> -/***********************************************************************=
******
> - *
> - * Basic ASN.1 decoding routines (gxsnmp author Dirk Wisse)
> - *
> - ***********************************************************************=
******/
> -
> -/* Class */
> -#define ASN1_UNI       0       /* Universal */
> -#define ASN1_APL       1       /* Application */
> -#define ASN1_CTX       2       /* Context */
> -#define ASN1_PRV       3       /* Private */
> -
> -/* Tag */
> -#define ASN1_EOC       0       /* End Of Contents or N/A */
> -#define ASN1_BOL       1       /* Boolean */
> -#define ASN1_INT       2       /* Integer */
> -#define ASN1_BTS       3       /* Bit String */
> -#define ASN1_OTS       4       /* Octet String */
> -#define ASN1_NUL       5       /* Null */
> -#define ASN1_OJI       6       /* Object Identifier  */
> -#define ASN1_OJD       7       /* Object Description */
> -#define ASN1_EXT       8       /* External */
> -#define ASN1_ENUM      10      /* Enumerated */
> -#define ASN1_SEQ       16      /* Sequence */
> -#define ASN1_SET       17      /* Set */
> -#define ASN1_NUMSTR    18      /* Numerical String */
> -#define ASN1_PRNSTR    19      /* Printable String */
> -#define ASN1_TEXSTR    20      /* Teletext String */
> -#define ASN1_VIDSTR    21      /* Video String */
> -#define ASN1_IA5STR    22      /* IA5 String */
> -#define ASN1_UNITIM    23      /* Universal Time */
> -#define ASN1_GENTIM    24      /* General Time */
> -#define ASN1_GRASTR    25      /* Graphical String */
> -#define ASN1_VISSTR    26      /* Visible String */
> -#define ASN1_GENSTR    27      /* General String */
> -
> -/* Primitive / Constructed methods*/
> -#define ASN1_PRI       0       /* Primitive */
> -#define ASN1_CON       1       /* Constructed */
> -
> -/*
> - * Error codes.
> - */
> -#define ASN1_ERR_NOERROR               0
> -#define ASN1_ERR_DEC_EMPTY             2
> -#define ASN1_ERR_DEC_EOC_MISMATCH      3
> -#define ASN1_ERR_DEC_LENGTH_MISMATCH   4
> -#define ASN1_ERR_DEC_BADVALUE          5
> -
> -#define SPNEGO_OID_LEN 7
> -#define NTLMSSP_OID_LEN  10
> -#define KRB5_OID_LEN  7
> -#define KRB5U2U_OID_LEN  8
> -#define MSKRB5_OID_LEN  7
> -static unsigned long SPNEGO_OID[7] =3D { 1, 3, 6, 1, 5, 5, 2 };
> -static unsigned long NTLMSSP_OID[10] =3D { 1, 3, 6, 1, 4, 1, 311, 2, 2, =
10 };
> -static unsigned long KRB5_OID[7] =3D { 1, 2, 840, 113554, 1, 2, 2 };
> -static unsigned long KRB5U2U_OID[8] =3D { 1, 2, 840, 113554, 1, 2, 2, 3 =
};
> -static unsigned long MSKRB5_OID[7] =3D { 1, 2, 840, 48018, 1, 2, 2 };
> -
> -/*
> - * ASN.1 context.
> - */
> -struct asn1_ctx {
> -       int error;              /* Error condition */
> -       unsigned char *pointer; /* Octet just to be decoded */
> -       unsigned char *begin;   /* First octet */
> -       unsigned char *end;     /* Octet after last octet */
> -};
> -
> -/*
> - * Octet string (not null terminated)
> - */
> -struct asn1_octstr {
> -       unsigned char *data;
> -       unsigned int len;
> -};
> -
> -static void
> -asn1_open(struct asn1_ctx *ctx, unsigned char *buf, unsigned int len)
> -{
> -       ctx->begin =3D buf;
> -       ctx->end =3D buf + len;
> -       ctx->pointer =3D buf;
> -       ctx->error =3D ASN1_ERR_NOERROR;
> -}
> -
> -static unsigned char
> -asn1_octet_decode(struct asn1_ctx *ctx, unsigned char *ch)
> -{
> -       if (ctx->pointer >=3D ctx->end) {
> -               ctx->error =3D ASN1_ERR_DEC_EMPTY;
> -               return 0;
> -       }
> -       *ch =3D *(ctx->pointer)++;
> -       return 1;
> -}
> -
> -#if 0 /* will be needed later by spnego decoding/encoding of ntlmssp */
> -static unsigned char
> -asn1_enum_decode(struct asn1_ctx *ctx, __le32 *val)
> -{
> -       unsigned char ch;
> -
> -       if (ctx->pointer >=3D ctx->end) {
> -               ctx->error =3D ASN1_ERR_DEC_EMPTY;
> -               return 0;
> -       }
> -
> -       ch =3D *(ctx->pointer)++; /* ch has 0xa, ptr points to length oct=
et */
> -       if ((ch) =3D=3D ASN1_ENUM)  /* if ch value is ENUM, 0xa */
> -               *val =3D *(++(ctx->pointer)); /* value has enum value */
> -       else
> -               return 0;
> -
> -       ctx->pointer++;
> -       return 1;
> -}
> -#endif
> -
> -static unsigned char
> -asn1_tag_decode(struct asn1_ctx *ctx, unsigned int *tag)
> -{
> -       unsigned char ch;
> -
> -       *tag =3D 0;
> -
> -       do {
> -               if (!asn1_octet_decode(ctx, &ch))
> -                       return 0;
> -               *tag <<=3D 7;
> -               *tag |=3D ch & 0x7F;
> -       } while ((ch & 0x80) =3D=3D 0x80);
> -       return 1;
> -}
> -
> -static unsigned char
> -asn1_id_decode(struct asn1_ctx *ctx,
> -              unsigned int *cls, unsigned int *con, unsigned int *tag)
> -{
> -       unsigned char ch;
> -
> -       if (!asn1_octet_decode(ctx, &ch))
> -               return 0;
> -
> -       *cls =3D (ch & 0xC0) >> 6;
> -       *con =3D (ch & 0x20) >> 5;
> -       *tag =3D (ch & 0x1F);
> -
> -       if (*tag =3D=3D 0x1F) {
> -               if (!asn1_tag_decode(ctx, tag))
> -                       return 0;
> -       }
> -       return 1;
> -}
> -
> -static unsigned char
> -asn1_length_decode(struct asn1_ctx *ctx, unsigned int *def, unsigned int=
 *len)
> -{
> -       unsigned char ch, cnt;
> -
> -       if (!asn1_octet_decode(ctx, &ch))
> -               return 0;
> -
> -       if (ch =3D=3D 0x80)
> -               *def =3D 0;
> -       else {
> -               *def =3D 1;
> -
> -               if (ch < 0x80)
> -                       *len =3D ch;
> -               else {
> -                       cnt =3D (unsigned char) (ch & 0x7F);
> -                       *len =3D 0;
> -
> -                       while (cnt > 0) {
> -                               if (!asn1_octet_decode(ctx, &ch))
> -                                       return 0;
> -                               *len <<=3D 8;
> -                               *len |=3D ch;
> -                               cnt--;
> -                       }
> -               }
> -       }
> -
> -       /* don't trust len bigger than ctx buffer */
> -       if (*len > ctx->end - ctx->pointer)
> -               return 0;
> -
> -       return 1;
> -}
> -
> -static unsigned char
> -asn1_header_decode(struct asn1_ctx *ctx,
> -                  unsigned char **eoc,
> -                  unsigned int *cls, unsigned int *con, unsigned int *ta=
g)
> -{
> -       unsigned int def =3D 0;
> -       unsigned int len =3D 0;
> -
> -       if (!asn1_id_decode(ctx, cls, con, tag))
> -               return 0;
> -
> -       if (!asn1_length_decode(ctx, &def, &len))
> -               return 0;
> -
> -       /* primitive shall be definite, indefinite shall be constructed *=
/
> -       if (*con =3D=3D ASN1_PRI && !def)
> -               return 0;
> -
> -       if (def)
> -               *eoc =3D ctx->pointer + len;
> -       else
> -               *eoc =3D NULL;
> -       return 1;
> -}
> -
> -static unsigned char
> -asn1_eoc_decode(struct asn1_ctx *ctx, unsigned char *eoc)
> +int
> +decode_negTokenInit(unsigned char *security_blob, int length,
> +                   struct TCP_Server_Info *server)
>  {
> -       unsigned char ch;
> -
> -       if (eoc =3D=3D NULL) {
> -               if (!asn1_octet_decode(ctx, &ch))
> -                       return 0;
> -
> -               if (ch !=3D 0x00) {
> -                       ctx->error =3D ASN1_ERR_DEC_EOC_MISMATCH;
> -                       return 0;
> -               }
> -
> -               if (!asn1_octet_decode(ctx, &ch))
> -                       return 0;
> -
> -               if (ch !=3D 0x00) {
> -                       ctx->error =3D ASN1_ERR_DEC_EOC_MISMATCH;
> -                       return 0;
> -               }
> -               return 1;
> -       } else {
> -               if (ctx->pointer !=3D eoc) {
> -                       ctx->error =3D ASN1_ERR_DEC_LENGTH_MISMATCH;
> -                       return 0;
> -               }
> +       if (asn1_ber_decoder(&spnego_negtokeninit_decoder, server,
> +                            security_blob, length) =3D=3D 0)
>                 return 1;
> -       }
> -}
> -
> -/* static unsigned char asn1_null_decode(struct asn1_ctx *ctx,
> -                                     unsigned char *eoc)
> -{
> -       ctx->pointer =3D eoc;
> -       return 1;
> -}
> -
> -static unsigned char asn1_long_decode(struct asn1_ctx *ctx,
> -                                     unsigned char *eoc, long *integer)
> -{
> -       unsigned char ch;
> -       unsigned int len;
> -
> -       if (!asn1_octet_decode(ctx, &ch))
> -               return 0;
> -
> -       *integer =3D (signed char) ch;
> -       len =3D 1;
> -
> -       while (ctx->pointer < eoc) {
> -               if (++len > sizeof(long)) {
> -                       ctx->error =3D ASN1_ERR_DEC_BADVALUE;
> -                       return 0;
> -               }
> -
> -               if (!asn1_octet_decode(ctx, &ch))
> -                       return 0;
> -
> -               *integer <<=3D 8;
> -               *integer |=3D ch;
> -       }
> -       return 1;
> -}
> -
> -static unsigned char asn1_uint_decode(struct asn1_ctx *ctx,
> -                                     unsigned char *eoc,
> -                                     unsigned int *integer)
> -{
> -       unsigned char ch;
> -       unsigned int len;
> -
> -       if (!asn1_octet_decode(ctx, &ch))
> -               return 0;
> -
> -       *integer =3D ch;
> -       if (ch =3D=3D 0)
> -               len =3D 0;
>         else
> -               len =3D 1;
> -
> -       while (ctx->pointer < eoc) {
> -               if (++len > sizeof(unsigned int)) {
> -                       ctx->error =3D ASN1_ERR_DEC_BADVALUE;
> -                       return 0;
> -               }
> -
> -               if (!asn1_octet_decode(ctx, &ch))
> -                       return 0;
> -
> -               *integer <<=3D 8;
> -               *integer |=3D ch;
> -       }
> -       return 1;
> -}
> -
> -static unsigned char asn1_ulong_decode(struct asn1_ctx *ctx,
> -                                      unsigned char *eoc,
> -                                      unsigned long *integer)
> -{
> -       unsigned char ch;
> -       unsigned int len;
> -
> -       if (!asn1_octet_decode(ctx, &ch))
>                 return 0;
> -
> -       *integer =3D ch;
> -       if (ch =3D=3D 0)
> -               len =3D 0;
> -       else
> -               len =3D 1;
> -
> -       while (ctx->pointer < eoc) {
> -               if (++len > sizeof(unsigned long)) {
> -                       ctx->error =3D ASN1_ERR_DEC_BADVALUE;
> -                       return 0;
> -               }
> -
> -               if (!asn1_octet_decode(ctx, &ch))
> -                       return 0;
> -
> -               *integer <<=3D 8;
> -               *integer |=3D ch;
> -       }
> -       return 1;
>  }
>
> -static unsigned char
> -asn1_octets_decode(struct asn1_ctx *ctx,
> -                  unsigned char *eoc,
> -                  unsigned char **octets, unsigned int *len)
> +int gssapi_this_mech(void *context, size_t hdrlen,
> +                    unsigned char tag, const void *value, size_t vlen)
>  {
> -       unsigned char *ptr;
> -
> -       *len =3D 0;
> -
> -       *octets =3D kmalloc(eoc - ctx->pointer, GFP_ATOMIC);
> -       if (*octets =3D=3D NULL) {
> -               return 0;
> -       }
> -
> -       ptr =3D *octets;
> -       while (ctx->pointer < eoc) {
> -               if (!asn1_octet_decode(ctx, (unsigned char *) ptr++)) {
> -                       kfree(*octets);
> -                       *octets =3D NULL;
> -                       return 0;
> -               }
> -               (*len)++;
> -       }
> -       return 1;
> -} */
> -
> -static unsigned char
> -asn1_subid_decode(struct asn1_ctx *ctx, unsigned long *subid)
> -{
> -       unsigned char ch;
> -
> -       *subid =3D 0;
> -
> -       do {
> -               if (!asn1_octet_decode(ctx, &ch))
> -                       return 0;
> -
> -               *subid <<=3D 7;
> -               *subid |=3D ch & 0x7F;
> -       } while ((ch & 0x80) =3D=3D 0x80);
> -       return 1;
> -}
> -
> -static int
> -asn1_oid_decode(struct asn1_ctx *ctx,
> -               unsigned char *eoc, unsigned long **oid, unsigned int *le=
n)
> -{
> -       unsigned long subid;
> -       unsigned int size;
> -       unsigned long *optr;
> -
> -       size =3D eoc - ctx->pointer + 1;
> -
> -       /* first subid actually encodes first two subids */
> -       if (size < 2 || size > UINT_MAX/sizeof(unsigned long))
> -               return 0;
> -
> -       *oid =3D kmalloc_array(size, sizeof(unsigned long), GFP_ATOMIC);
> -       if (*oid =3D=3D NULL)
> -               return 0;
> -
> -       optr =3D *oid;
> -
> -       if (!asn1_subid_decode(ctx, &subid)) {
> -               kfree(*oid);
> -               *oid =3D NULL;
> -               return 0;
> -       }
> -
> -       if (subid < 40) {
> -               optr[0] =3D 0;
> -               optr[1] =3D subid;
> -       } else if (subid < 80) {
> -               optr[0] =3D 1;
> -               optr[1] =3D subid - 40;
> -       } else {
> -               optr[0] =3D 2;
> -               optr[1] =3D subid - 80;
> -       }
> -
> -       *len =3D 2;
> -       optr +=3D 2;
> +       enum OID oid;
>
> -       while (ctx->pointer < eoc) {
> -               if (++(*len) > size) {
> -                       ctx->error =3D ASN1_ERR_DEC_BADVALUE;
> -                       kfree(*oid);
> -                       *oid =3D NULL;
> -                       return 0;
> -               }
> +       oid =3D look_up_OID(value, vlen);
> +       if (oid !=3D OID_spnego) {
> +               char buf[50];
>
> -               if (!asn1_subid_decode(ctx, optr++)) {
> -                       kfree(*oid);
> -                       *oid =3D NULL;
> -                       return 0;
> -               }
> +               sprint_oid(value, vlen, buf, sizeof(buf));
> +               cifs_dbg(FYI, "Error decoding negTokenInit header: unexpe=
cted OID %s\n",
> +                        buf);
> +               return -EBADMSG;
>         }
> -       return 1;
> +       return 0;
>  }
>
> -static int
> -compare_oid(unsigned long *oid1, unsigned int oid1len,
> -           unsigned long *oid2, unsigned int oid2len)
> +int neg_token_init_mech_type(void *context, size_t hdrlen,
> +                            unsigned char tag,
> +                            const void *value, size_t vlen)
>  {
> -       unsigned int i;
> +       struct TCP_Server_Info *server =3D context;
> +       enum OID oid;
>
> -       if (oid1len !=3D oid2len)
> -               return 0;
> +       oid =3D look_up_OID(value, vlen);
> +       if (oid =3D=3D OID_mskrb5)
> +               server->sec_mskerberos =3D true;
> +       else if (oid =3D=3D OID_krb5u2u)
> +               server->sec_kerberosu2u =3D true;
> +       else if (oid =3D=3D OID_krb5)
> +               server->sec_kerberos =3D true;
> +       else if (oid =3D=3D OID_ntlmssp)
> +               server->sec_ntlmssp =3D true;
>         else {
> -               for (i =3D 0; i < oid1len; i++) {
> -                       if (oid1[i] !=3D oid2[i])
> -                               return 0;
> -               }
> -               return 1;
> -       }
> -}
> -
> -       /* BB check for endian conversion issues here */
> -
> -int
> -decode_negTokenInit(unsigned char *security_blob, int length,
> -                   struct TCP_Server_Info *server)
> -{
> -       struct asn1_ctx ctx;
> -       unsigned char *end;
> -       unsigned char *sequence_end;
> -       unsigned long *oid =3D NULL;
> -       unsigned int cls, con, tag, oidlen, rc;
> -
> -       /* cifs_dump_mem(" Received SecBlob ", security_blob, length); */
> -
> -       asn1_open(&ctx, security_blob, length);
> +               char buf[50];
>
> -       /* GSSAPI header */
> -       if (asn1_header_decode(&ctx, &end, &cls, &con, &tag) =3D=3D 0) {
> -               cifs_dbg(FYI, "Error decoding negTokenInit header\n");
> -               return 0;
> -       } else if ((cls !=3D ASN1_APL) || (con !=3D ASN1_CON)
> -                  || (tag !=3D ASN1_EOC)) {
> -               cifs_dbg(FYI, "cls =3D %d con =3D %d tag =3D %d\n", cls, =
con, tag);
> -               return 0;
> +               sprint_oid(value, vlen, buf, sizeof(buf));
> +               cifs_dbg(FYI, "Decoding negTokenInit: unsupported OID %s\=
n",
> +                        buf);
>         }
> -
> -       /* Check for SPNEGO OID -- remember to free obj->oid */
> -       rc =3D asn1_header_decode(&ctx, &end, &cls, &con, &tag);
> -       if (rc) {
> -               if ((tag =3D=3D ASN1_OJI) && (con =3D=3D ASN1_PRI) &&
> -                   (cls =3D=3D ASN1_UNI)) {
> -                       rc =3D asn1_oid_decode(&ctx, end, &oid, &oidlen);
> -                       if (rc) {
> -                               rc =3D compare_oid(oid, oidlen, SPNEGO_OI=
D,
> -                                                SPNEGO_OID_LEN);
> -                               kfree(oid);
> -                       }
> -               } else
> -                       rc =3D 0;
> -       }
> -
> -       /* SPNEGO OID not present or garbled -- bail out */
> -       if (!rc) {
> -               cifs_dbg(FYI, "Error decoding negTokenInit header\n");
> -               return 0;
> -       }
> -
> -       /* SPNEGO */
> -       if (asn1_header_decode(&ctx, &end, &cls, &con, &tag) =3D=3D 0) {
> -               cifs_dbg(FYI, "Error decoding negTokenInit\n");
> -               return 0;
> -       } else if ((cls !=3D ASN1_CTX) || (con !=3D ASN1_CON)
> -                  || (tag !=3D ASN1_EOC)) {
> -               cifs_dbg(FYI, "cls =3D %d con =3D %d tag =3D %d end =3D %=
p exit 0\n",
> -                        cls, con, tag, end);
> -               return 0;
> -       }
> -
> -       /* negTokenInit */
> -       if (asn1_header_decode(&ctx, &end, &cls, &con, &tag) =3D=3D 0) {
> -               cifs_dbg(FYI, "Error decoding negTokenInit\n");
> -               return 0;
> -       } else if ((cls !=3D ASN1_UNI) || (con !=3D ASN1_CON)
> -                  || (tag !=3D ASN1_SEQ)) {
> -               cifs_dbg(FYI, "cls =3D %d con =3D %d tag =3D %d end =3D %=
p exit 1\n",
> -                        cls, con, tag, end);
> -               return 0;
> -       }
> -
> -       /* sequence */
> -       if (asn1_header_decode(&ctx, &end, &cls, &con, &tag) =3D=3D 0) {
> -               cifs_dbg(FYI, "Error decoding 2nd part of negTokenInit\n"=
);
> -               return 0;
> -       } else if ((cls !=3D ASN1_CTX) || (con !=3D ASN1_CON)
> -                  || (tag !=3D ASN1_EOC)) {
> -               cifs_dbg(FYI, "cls =3D %d con =3D %d tag =3D %d end =3D %=
p exit 0\n",
> -                        cls, con, tag, end);
> -               return 0;
> -       }
> -
> -       /* sequence of */
> -       if (asn1_header_decode
> -           (&ctx, &sequence_end, &cls, &con, &tag) =3D=3D 0) {
> -               cifs_dbg(FYI, "Error decoding 2nd part of negTokenInit\n"=
);
> -               return 0;
> -       } else if ((cls !=3D ASN1_UNI) || (con !=3D ASN1_CON)
> -                  || (tag !=3D ASN1_SEQ)) {
> -               cifs_dbg(FYI, "cls =3D %d con =3D %d tag =3D %d sequence_=
end =3D %p exit 1\n",
> -                        cls, con, tag, sequence_end);
> -               return 0;
> -       }
> -
> -       /* list of security mechanisms */
> -       while (!asn1_eoc_decode(&ctx, sequence_end)) {
> -               rc =3D asn1_header_decode(&ctx, &end, &cls, &con, &tag);
> -               if (!rc) {
> -                       cifs_dbg(FYI, "Error decoding negTokenInit hdr ex=
it2\n");
> -                       return 0;
> -               }
> -               if ((tag =3D=3D ASN1_OJI) && (con =3D=3D ASN1_PRI)) {
> -                       if (asn1_oid_decode(&ctx, end, &oid, &oidlen)) {
> -
> -                               cifs_dbg(FYI, "OID len =3D %d oid =3D 0x%=
lx 0x%lx 0x%lx 0x%lx\n",
> -                                        oidlen, *oid, *(oid + 1), *(oid =
+ 2),
> -                                        *(oid + 3));
> -
> -                               if (compare_oid(oid, oidlen, MSKRB5_OID,
> -                                               MSKRB5_OID_LEN))
> -                                       server->sec_mskerberos =3D true;
> -                               else if (compare_oid(oid, oidlen, KRB5U2U=
_OID,
> -                                                    KRB5U2U_OID_LEN))
> -                                       server->sec_kerberosu2u =3D true;
> -                               else if (compare_oid(oid, oidlen, KRB5_OI=
D,
> -                                                    KRB5_OID_LEN))
> -                                       server->sec_kerberos =3D true;
> -                               else if (compare_oid(oid, oidlen, NTLMSSP=
_OID,
> -                                                    NTLMSSP_OID_LEN))
> -                                       server->sec_ntlmssp =3D true;
> -
> -                               kfree(oid);
> -                       }
> -               } else {
> -                       cifs_dbg(FYI, "Should be an oid what is going on?=
\n");
> -               }
> -       }
> -
> -       /*
> -        * We currently ignore anything at the end of the SPNEGO blob aft=
er
> -        * the mechTypes have been parsed, since none of that info is
> -        * used at the moment.
> -        */
> -       return 1;
> +       return 0;
>  }
> diff --git a/fs/cifs/spnego_negtokeninit.asn1 b/fs/cifs/spnego_negtokenin=
it.asn1
> new file mode 100644
> index 000000000000..aa5b4a61b3f5
> --- /dev/null
> +++ b/fs/cifs/spnego_negtokeninit.asn1
> @@ -0,0 +1,40 @@
> +GSSAPI ::=3D
> +       [APPLICATION 0] IMPLICIT SEQUENCE {
> +               thisMech
> +                       OBJECT IDENTIFIER ({gssapi_this_mech}),
> +               negotiationToken
> +                       NegotiationToken
> +       }
> +
> +MechType ::=3D OBJECT IDENTIFIER ({neg_token_init_mech_type})
> +
> +MechTypeList ::=3D SEQUENCE OF MechType
> +
> +NegHints ::=3D SEQUENCE {
> +       hintName
> +               [0] GeneralString OPTIONAL,
> +       hintAddress
> +               [1] OCTET STRING OPTIONAL
> +       }
> +
> +NegTokenInit2 ::=3D
> +       SEQUENCE {
> +               mechTypes
> +                       [0] MechTypeList OPTIONAL,
> +               reqFlags
> +                       [1] BIT STRING OPTIONAL,
> +               mechToken
> +                       [2] OCTET STRING OPTIONAL,
> +               negHints
> +                       [3] NegHints OPTIONAL,
> +               mechListMIC
> +                       [3] OCTET STRING OPTIONAL
> +       }
> +
> +NegotiationToken ::=3D
> +       CHOICE {
> +               negTokenInit
> +                       [0] NegTokenInit2,
> +               negTokenTarg
> +                       [1] ANY
> +       }
> diff --git a/include/linux/oid_registry.h b/include/linux/oid_registry.h
> index 461b7aa587ba..3d8db1f6a5db 100644
> --- a/include/linux/oid_registry.h
> +++ b/include/linux/oid_registry.h
> @@ -54,6 +54,10 @@ enum OID {
>         OID_md4,                        /* 1.2.840.113549.2.4 */
>         OID_md5,                        /* 1.2.840.113549.2.5 */
>
> +       OID_mskrb5,                     /* 1.2.840.48018.1.2.2 */
> +       OID_krb5,                       /* 1.2.840.113554.1.2.2 */
> +       OID_krb5u2u,                    /* 1.2.840.113554.1.2.2.3 */
> +
>         /* Microsoft Authenticode & Software Publishing */
>         OID_msIndirectData,             /* 1.3.6.1.4.1.311.2.1.4 */
>         OID_msStatementType,            /* 1.3.6.1.4.1.311.2.1.11 */
> @@ -62,6 +66,10 @@ enum OID {
>         OID_msIndividualSPKeyPurpose,   /* 1.3.6.1.4.1.311.2.1.21 */
>         OID_msOutlookExpress,           /* 1.3.6.1.4.1.311.16.4 */
>
> +       OID_ntlmssp,                    /* 1.3.6.1.4.1.311.2.2.10 */
> +
> +       OID_spnego,                     /* 1.3.6.1.5.5.2 */
> +
>         OID_certAuthInfoAccess,         /* 1.3.6.1.5.5.7.1.1 */
>         OID_sha1,                       /* 1.3.14.3.2.26 */
>         OID_id_ansip384r1,              /* 1.3.132.0.34 */
> --
> 2.25.1
>


--=20
Thanks,

Steve

