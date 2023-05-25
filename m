Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6D9710A51
	for <lists+samba-technical@lfdr.de>; Thu, 25 May 2023 12:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=rN6ZW64ptAPiChsD8/Re4zwk3t8TAiT9Ua8kP37+Lkg=; b=SW57hcA+KaSKwcsuyPAvKqKMkp
	w5VoRSTDEs5KskgAwQqSTzMOuF64vXst8Kyt/rKgvPHKfR5DEiyeOCVXL/K48z98mYvjfoQR6EU4J
	k78hssbdVFnjJiT0/8ZP4oOr/4joO3L71+FReuhYV1Vco14QSMNpDxC6hH79l9DA2hB0XC+TAL/GI
	tZMc7Qb2A9EJ7kd3EXIcxbUFPlB40SEQBn9mQaq3vkqrHKluu1lId1wYBIEZNHkJKsZzgrorzvPoQ
	lLOznAJ4SDELo2QhqzdVIwohY/dpGAIelf7VJ0UVe81oSZQ9wDcCK2VgeWh0rGGOcoU4iHEnOqpQo
	1bnSjxHg==;
Received: from ip6-localhost ([::1]:58720 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q28Xn-00C8oG-IQ; Thu, 25 May 2023 10:50:07 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:45376) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q28Xh-00C8o7-U7
 for samba-technical@lists.samba.org; Thu, 25 May 2023 10:50:04 +0000
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-513fd8cc029so4098266a12.3
 for <samba-technical@lists.samba.org>; Thu, 25 May 2023 03:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685011801; x=1687603801;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rN6ZW64ptAPiChsD8/Re4zwk3t8TAiT9Ua8kP37+Lkg=;
 b=lYIL3BIu+RDUZJTXSVC658u0V2Ce7+nzeTiewzSXohOPKGZFXPLYacrpYxCEgyNICh
 cXELFY1buBVTOcOxFTzMsIrxzUHOOyK4SzEESOVpfY4npWAgu6VaNhVGcvUbfIlhC/bv
 dChXosk2ecGLJZaRJaKn+MCpzi/n6fh2uP4SAdp3N+PTDEtZXS8bVMUnoVz8rReJtxhn
 hMQ4m8gRovt3M6LwBp2zTSFCP9Uur5dQqvXYV/WVT0Lv9eWdPmWs2xPn4w6JjLaPWd2X
 fvbQmkGp0osZoU4naJPlYBFrBmfT+R8pfRahdUZWLUv1rXTukY1ZpdElu8LQi1W+kugF
 +UCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685011801; x=1687603801;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rN6ZW64ptAPiChsD8/Re4zwk3t8TAiT9Ua8kP37+Lkg=;
 b=iNe6VAtD9XuPuhsMG2lQlx4W0IjmQjXXamowY5M3x/s7qYkpRgBRvLs+JF+g2CUAdz
 QYVyVBIt3aVyzlaZ9xHv7CFU9vShlDSfJl7hIeiEfRaTWMQxp26BGtpx/1mvL1ucGjuI
 YgN4+pCwnSkKcdFBMTTIcCzyn4jcUQdqSEVInm76pv5YUun4Ml+YYzRlXZxXs1zdp9F+
 VgREGL90Ag4KIXHdx7pUsjm8MT01RPW6MFaEq9t2vg+HPkg63Kt129UaZlfJAO09wJ/Y
 7nUm2Ro9slOG/rI0CsEXsX8Q34v+wb85GepuzPpyp5tRoDBNtfNtLORz0zDCH8AiaqRs
 mD6w==
X-Gm-Message-State: AC+VfDzzHUGvZUxVC6SE/E8JqycGoC9L4NMi5VUI9nA6Q54s5kpGm0i1
 Yv1y+Hmq1Ym3N8AlUPvsD0ssQ1uhBcWBc3dg/1c=
X-Google-Smtp-Source: ACHHUZ7/YbD1ePdaBGN21fVv2YdIqa3m3paKObfHLUcLwEzf70Hqg0dT2HXP30JPFZuIzhReriX4cscUAbJjFNLkpHM=
X-Received: by 2002:a17:907:3689:b0:973:797b:50de with SMTP id
 bi9-20020a170907368900b00973797b50demr828239ejc.60.1685011800726; Thu, 25 May
 2023 03:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop> <20230525093900.GA261009@sernet.de>
In-Reply-To: <20230525093900.GA261009@sernet.de>
Date: Thu, 25 May 2023 20:49:47 +1000
Message-ID: <CAN05THTi0BC_iwjXMiWn61fg3hRemi5Momwp3O0WGygyWLGomQ@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: =?UTF-8?B?QmrDtnJuIEpBQ0tF?= <bj@sernet.de>, 
 Jeremy Allison <jra@samba.org>, Steve French <smfrench@gmail.com>,
 CIFS <linux-cifs@vger.kernel.org>, 
 samba-technical <samba-technical@lists.samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 25 May 2023 at 19:40, Bj=C3=B6rn JACKE via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> On 2023-05-22 at 09:21 -0700 Jeremy Allison via samba-technical sent off:
> > On Mon, May 22, 2023 at 01:39:50AM -0500, Steve French wrote:
> > > On Sun, May 21, 2023 at 11:33=E2=80=AFPM ronnie sahlberg
> > > <ronniesahlberg@gmail.com> wrote:
> > > >
> > > > A problem  we have with xattrs today is that we use EAs and these a=
re
> > > > case insensitive.
> > > > Even worse I think windows may also convert the names to uppercase =
:-(
> > > > And there is no way to change it in the registry :-(
> > >
> > > But for alternate data streams if we allowed them to be retrieved via=
 xattrs,
> > > would case sensitivity matter?  Alternate data streams IIRC are alrea=
dy
> > > case preserving.   Presumably the more common case is for a Linux use=
r
> > > to read (or backup) an existing alternate data stream (which are usua=
lly
> > > created by Windows so case sensitivity would not be relevant).
> >
> > Warning Will Robinson ! Mixing ADS and xattrs on the client side is a r=
eceipe for
> > confusion and disaster IMHO.
> >
> > They really are different things. No good will come of trying to mix
> > the two into one client namespace.
> >
>
> just took a look at how the ntfs-3g module is handling this. It was an op=
tion
> streams_interface=3Dvalue, which allows "windows", which means that the
> alternative data streams are accessable as-is like in Windows, with ":" b=
eing
> the separator. This might be a nice option for cifsfs also. That option w=
ould
> just be usable if no posix extensions are enabled of course.

We could. But that is a windowism where ':' is a reserved character
but which is not a reserved character in unixens.
For example:
You have the file "foo" with stream "bar" and you have another normal
file "foo:bar"
Which one does open("foo:bar") give you?

The openat/... semantics that solaris uses provides an elegant and
unambiguous semantics for it.
You want to open stream bar on file foo?
1, fh =3D open("foo")
2, sh =3D openatf(h, "bar")

There are at least two non-windows related filesystems that support
something similar to ADS,
solaris filesystem and apples filesystem(s) so it would be nice to
have a neutral API where an application can use the same
code to access streams be they cifs/ntfs/solarisfs/applefs/...other...

Steve, I think this would be a good discussion topic for vfs meetings.
Is it desirable to bless an api in the vfs to do alternate data
streams?
There are at least 4 filesystems that provide this feature, 3 of which
are still very popular and common today.

One approach would be to mimic the interface that solaris provides
with openatfile-fd, "stream-name")
But that would not just be a filesystem change but also a VFS change
since it would suddenly accept passing a file-fd as argument
as a valid option (for those filesystems that have signalled
alternative stream support?)
while the vfs currently only allows openat() on a directory-fd.

ADS as a concept is really powerful and could be enormously useful as
way to attach metadata to a file object in a standardized way.
There are very many use-cases where having a file that embedded both
the executable as well as various other types of data but still be
able to treat it as a single self-contained file from an end-user
perspective.

This should be discussed and we should probe the vfs folks about what
they think about it.

regards
ronnie s

>
> Bj=C3=B6rn
>

