Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A84DB947A1
	for <lists+samba-technical@lfdr.de>; Tue, 23 Sep 2025 07:51:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6Rclo64BIQ60aWNHFZJxWB0Ardorfdp+QiYuOEftSfU=; b=OQb0OxsAeq6IUM/pxNvCV2kZTV
	UwkStCWhTthsrlguNcLzphbkQoZvaduZGD8LzMwYIq9lbQTF+0yO20OQ2bACYvqfSJYleICzqVSBH
	t8xrz84MdDaUR4syXblNbuKtXyxJLuX8E9+3/bSZzNxtFuoki4ywteIou/7Uelw6/gnzYQHfFv8oL
	ShpvVE0qQhploQ4iDcxuycu60NvNX9LogQQwBW8Jia+Gv3YnJuhrUHex77dVKWHwFSdXCoFjc8g5B
	QZ8VuUDhk/k0nHXvpx0ICqmLNO6QasI+P2MPIIR2EXRVsitlboFtmMcxiwwgMjCcXKzwaBbkN09MA
	tYQBN7Pg==;
Received: from ip6-localhost ([::1]:32628 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1v0vvn-004aaS-8g; Tue, 23 Sep 2025 05:51:15 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:48154) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1v0vvj-004aaL-6v
 for samba-technical@lists.samba.org; Tue, 23 Sep 2025 05:51:13 +0000
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-afcb7322da8so941154266b.0
 for <samba-technical@lists.samba.org>; Mon, 22 Sep 2025 22:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758606670; x=1759211470; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Rclo64BIQ60aWNHFZJxWB0Ardorfdp+QiYuOEftSfU=;
 b=TSBop4fju59PYzONWWgKQhdk2nBaj6tE26Znk34bIi3rlhXGWOWmHfOYFK0J1MDmE1
 5JdkoljuY0FRdV64IBD+ABjCvNoJp3jCYET3Hkw5CaAbr2b+zatywwoY+hLMeAehVb6g
 45eJujxpYDfbyaX4m9cf10bjGQtQMZ+p88Xo1ylf+5GKBTlfDBQdgG9DIbhu4ncIOnTg
 4Q32S29Yhn0qEMPMurcNBj7pIzc87KVy7kXFCKcI44OK9ALnPpBbwrFJtnVbqGVkrqX0
 LzsJddiGL5+CpgkhNqskvFVLvsKpSZVWZg4TOxUYD6ZkhziScbNiASMyk355Mun+WGK0
 IyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758606670; x=1759211470;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6Rclo64BIQ60aWNHFZJxWB0Ardorfdp+QiYuOEftSfU=;
 b=POoHnj8puu/hQJx383gRN7RjOI3uX0IMhuDEl+RULQKF3K5EpY39DC60Z9mQUvWw3u
 MXnJ+HWQowSbkoJLoyhPEXRoFDztkxjfRSlW+CWGP32ECaGAucgtVHHCJf+oBGJ9PJS/
 zTEDVBEeLYBMbQaYHLUk4kS1R5TFZECJEaJUI+8GYqAyMM439qfpWpR3f745FXBwZZTM
 QWGQNjh18jUklKEDqAQYALt3Dx1otUhLQ9Q3Kkts+JQS2zmZHaSFhSU/1e607OOng4VN
 16kxdMP5jaMY8VHGaYWdKZZPG2lVq41jH+OIGbPMJZyTXE50cpWxCCfA6+N4YqEydzHj
 Lxpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2+KV22zEw7q1KoPltrToknPntoxvMWCY3aqV003HsG4s7+/qZRXyEaq5QEtcO9TS+Q0s5u8efdaT5TgwpsXw=@lists.samba.org
X-Gm-Message-State: AOJu0YynygOo448oXUW2Rc17iayvF4aN3n7MFAsJCPaGDLBWKTeS0i2W
 EQzOGXs6Yw4Vjh3wfUSrhGGkCXvwrJP1AWRDhf6tP1GM9tJ8cl77nJ4rgGPW+XrQ0hWwKah66Mx
 yCMddtn8n3Ukg7dAdeH/7Layca6X1t30=
X-Gm-Gg: ASbGncttORFdZiADi2bhXrqZMrYSbe7iwaow0ZHcS6jx+jqobuY40vdWcGgn0o++Lep
 SlrJaJASQCGStbfXuUfd49pdHD78OCOOb/ZpmZ3a7Qpa/yRZ8AuOC2TC+zlyA9vnLIJ3dKTyd7M
 VjQ98gjbE44nyjzhqMGKlzQLwJFsZNG/pOc4d3aF8Dl79W/+kDnrVuIrP2Vl6VG8KmEwdaA9Nud
 cafMw==
X-Google-Smtp-Source: AGHT+IH7TdssnS5qMaLU0popPFCw6NnbrKbkqeHN9FUSAFsycRrelKRVehoar4TXFvkLVFGqYheq/LvCXZYe8biHGWk=
X-Received: by 2002:a17:907:9287:b0:b07:c815:70a9 with SMTP id
 a640c23a62f3a-b3028427f9fmr111647866b.26.1758606670182; Mon, 22 Sep 2025
 22:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250922082417.816331-1-rajasimandalos@gmail.com>
 <CAH2r5mtpEc7ePZ58_qdE+9GRPVO3PPYuN44uHuskoQpnssbkdA@mail.gmail.com>
In-Reply-To: <CAH2r5mtpEc7ePZ58_qdE+9GRPVO3PPYuN44uHuskoQpnssbkdA@mail.gmail.com>
Date: Tue, 23 Sep 2025 11:20:58 +0530
X-Gm-Features: AS18NWCtF7MOgYcDiyoQBMAI1ZcnuNUHSecZ96WtJR-i9O-dzS01hRDZseli6rA
Message-ID: <CANT5p=oG_btGS7xKXoRS8Z46JqBQ2E8pud9XRDWrJe1AhGaZYQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] cifs: client: force multichannel=off when
 max_channels=1
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
From: Shyam Prasad N via samba-technical <samba-technical@lists.samba.org>
Reply-To: Shyam Prasad N <nspmangalore@gmail.com>
Cc: Rajasi Mandal <rajasimandal@microsoft.com>, linux-cifs@vger.kernel.org,
 sprasad@microsoft.com, pc@manguebit.org, rajasimandalos@gmail.com,
 samba-technical <samba-technical@lists.samba.org>,
 linux-kernel@vger.kernel.org, tom@talpey.com, bharathsm@microsoft.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 22, 2025 at 9:36=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> i just noticed a more serious problem with multichannel/max_channels
>
> When we mount with multichannel (at least to Samba e.g.) with
> multichannel disabled on the server it confusingly returns "resource
> not available" we should at least log to dmesg something more
> meaningful than what we do today:
>
> [ 1195.349188] CIFS: VFS: failed to open extra channel on
> iface:10.45.126.66 rc=3D-11
> [ 1195.454361] CIFS: successfully opened new channel on
> iface:2607:fb90:f2b6:0732:7504:183c:991e:6e53
> [ 1195.454599] CIFS: VFS: reconnect tcon failed rc =3D -11
> [ 1195.457025] CIFS: VFS: reconnect tcon failed rc =3D -11
> [ 1195.457040] CIFS: VFS: cifs_read_super: get root inode failed
>
>
> Samba behavior is also strange - it advertises multichannel support in
> negprot response but doesn't advertise it in session setup flags.

If the user mounts with multichannel enabled, then it is expected that
the client will try to setup more channels.
If the server cannot support it, these logs are expected.

Btw.. It looks like the client was able to setup one additional
channel above. But reconnect tcon failed. I wonder why that happened?

>
> On Mon, Sep 22, 2025 at 3:25=E2=80=AFAM <rajasimandalos@gmail.com> wrote:
> >
> > From: Rajasi Mandal <rajasimandal@microsoft.com>
> >
> > Previously, specifying both multichannel and max_channels=3D1 as mount
> > options would leave multichannel enabled, even though it is not
> > meaningful when only one channel is allowed. This led to confusion and
> > inconsistent behavior, as the client would advertise multichannel
> > capability but never establish secondary channels.
> >
> > Fix this by forcing multichannel to false whenever max_channels=3D1,
> > ensuring the mount configuration is consistent and matches user intent.
> > This prevents the client from advertising or attempting multichannel
> > support when it is not possible.
> >
> > Signed-off-by: Rajasi Mandal <rajasimandal@microsoft.com>
> > ---
> >  fs/smb/client/fs_context.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
> > index 072383899e81..43552b44f613 100644
> > --- a/fs/smb/client/fs_context.c
> > +++ b/fs/smb/client/fs_context.c
> > @@ -1820,6 +1820,13 @@ static int smb3_fs_context_parse_param(struct fs=
_context *fc,
> >                 goto cifs_parse_mount_err;
> >         }
> >
> > +       /*
> > +        * Multichannel is not meaningful if max_channels is 1.
> > +        * Force multichannel to false to ensure consistent configurati=
on.
> > +        */
> > +       if (ctx->multichannel && ctx->max_channels =3D=3D 1)
> > +               ctx->multichannel =3D false;
> > +
> >         return 0;
> >
> >   cifs_parse_mount_err:
> > --
> > 2.43.0
> >
> >
>
>
> --
> Thanks,
>
> Steve
>


--=20
Regards,
Shyam

