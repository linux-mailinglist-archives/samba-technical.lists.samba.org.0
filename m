Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D47DAE5F
	for <lists+samba-technical@lfdr.de>; Sun, 29 Oct 2023 22:07:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hLOoptMH4lGq4kc4qhjKuPfnBFyacrSgPnd9+ruLLa8=; b=Mj/aYmN3SZNEBoSJ0m37lxX7XG
	iHqsUmr5qJaXSVHZ+p6LXjQ0Bdiq9e20ElD/Wx56N0CBhiaqjryH1Q170IpajvSvX3csQdUxFIwI4
	rf/sdqEvZIlh8S3a5H30FweaYjGDV1jL65XjYFgKDBSzXQQr+5mbhKnuV/2jqoKYedgT8aMRXCfT9
	XZUZ4CRnqfa2yRpzzSzcDImESQa+XHeHau/s0etqLRt7Z1JurXfRZbeO0gM08JC/e/AtMwypni7Oo
	wgn5ezW0H40TwwdC+IPhcnGwZ0XN0MSOcuY0IBEc849Ueo5uqWVfOHAoHkPyKqrUSvymEyVnhOyMG
	taJARd2w==;
Received: from ip6-localhost ([::1]:36848 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qxCzj-003QQ4-IK; Sun, 29 Oct 2023 21:06:51 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:44301) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qxCze-003QPv-Np
 for samba-technical@lists.samba.org; Sun, 29 Oct 2023 21:06:49 +0000
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-507f1c29f25so5265539e87.1
 for <samba-technical@lists.samba.org>; Sun, 29 Oct 2023 14:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698613605; x=1699218405; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hLOoptMH4lGq4kc4qhjKuPfnBFyacrSgPnd9+ruLLa8=;
 b=GIQ15lryP9Gf129XghVyux6EkiNjFa5S7ly2kXODkFtjpFihZYZI4SGb9ndQCsd1Uo
 dDDQNPT18iB9SfDZbbOE4XUCWn0rPuB4+nmO8CEwLyXQgdG5YiMPkquxQAWarPUbsEHi
 1+GT8+/rkYP+y5boWQwJ735j0BxvnEMOjRUbTRm4j5x0PVnbcBO+pQ5Lmyx6ec26/nD0
 DUu4SSrQpJ2HRLFieCJ9Lri9bR6pjNhPRou2cj+w44N660bm4kcTzndoCrmcnYClm69/
 ZLLK9xWhpUkx53MbKYOWe4wk5P5gwx7aXwIWH6Abzgx2DtsHvbeKW+3cXy6/ypYUVqN2
 nTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698613605; x=1699218405;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hLOoptMH4lGq4kc4qhjKuPfnBFyacrSgPnd9+ruLLa8=;
 b=vd0tf+QynT2hLgC1/rCbq+rTyysyVTwh19SlAoL3y9Ygihw77VWJILaty47ub7trEf
 AJyyEyTJLeVypyQAuiekiTtj5JPvC2A6kJKymYtseLtOM45H2h9shBKOKL4XVDv9oxhq
 ldiwTD2637VffdABxcnaKr4MZmiMm66arRsqDYbhmP7YI2twVFeD7+t0ykhzPcZ/Dtzj
 SX36McDXUtPADmH1fDbTjtSPhchXbHz1R7yHLhCEr9PhUylqgVlfGeo87K+LbmYAuI1z
 PGna5BvVC1AWQOTsyU05avufv1NGoUEl9sXUd4MGFojcpQhlq6RZmV9nVzIajHPS1L/3
 mtyA==
X-Gm-Message-State: AOJu0Ywm2ZjXuaxspxMObrFv85QH+FpfSIctr3uwSoZnqYnEF69Eq+Zw
 rCyhTAPAHg3Zk4L0TYGYPeA2o3OCIV4MvrIAdrldGHwpGZ0=
X-Google-Smtp-Source: AGHT+IEeNGSRnapd4aau9iR9xtr2fk1z7r3uG/qooUYbysju2je7yNF5iM1HCO1es+phgjFjsS6TWpQRHtmn3lBqz3s=
X-Received: by 2002:a05:6512:962:b0:503:38fe:4598 with SMTP id
 v2-20020a056512096200b0050338fe4598mr5084401lft.64.1698613604858; Sun, 29 Oct
 2023 14:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvve4euMUqsBBqRr2VWgz7ukEZ15vZRVDO=zbzY=XhF1Q@mail.gmail.com>
 <29169963-d1c6-4972-8e68-1f24d8d2e5b9@miami.edu>
In-Reply-To: <29169963-d1c6-4972-8e68-1f24d8d2e5b9@miami.edu>
Date: Sun, 29 Oct 2023 16:06:33 -0500
Message-ID: <CAH2r5mv1phW57TErdO1jWQaUyZqiLmOEGdLDbF8RDfPwJvkPSA@mail.gmail.com>
Subject: Re: [PATCH][CIFS] allow creating FIFOs when "sfu" mount option
 specified
To: "Brown, James William" <jim.brown@miami.edu>
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good catch - yes that was a typo - will fix.

On Fri, Oct 20, 2023 at 10:07=E2=80=AFAM Brown, James William via
samba-technical <samba-technical@lists.samba.org> wrote:
>
> On 10/20/2023 12:32 AM, Steve French via samba-technical wrote:
> > CAUTION: This email originated from outside the organization. DO NOT CL=
ICK ON LINKS or OPEN ATTACHMENTS unless you know and trust the sender.
> >
> > mb3: fix creating FIFOs when mounting with "sfu" mount
> >   option
> >
> > Fixes some xfstests including generic/564 and generic/157
> >
> > The "sfu" mount option can be useful for creating special files (charac=
ter
> > and block devices in particular) but could not create FIFOs. It did
> > recognize existing empty files with the "system" attribute flag as FIFO=
s
> > but this is too general, so to support creating FIFOs more safely use a=
 new
> > tag (but the same length as those for char and block devices ie "IntxLN=
K"
> > and "IntxBLK") "LnxFIFO" to indicate that the file should be treated as=
 a
> > FIFO (when mounted with the "sfu").   For some additional context note =
that
> > "sfu" followed the way that "Services for Unix" on Windows handled thes=
e
> > special files (at least for character and block devices and symlinks),
> > which is different than newer Windows which can handle special files
> > as reparse points (which isn't an option to many servers).
> >
> > @@ -5135,6 +5135,12 @@ smb2_make_node(unsigned int xid, struct inode *i=
node,
> >               pdev->minor =3D cpu_to_le64(MINOR(dev));
> >               rc =3D tcon->ses->server->ops->sync_write(xid, &fid, &io_=
parms,
> >                                                       &bytes_written, i=
ov, 1);
> > +     } else if (S_ISBLK(mode)) {
> > +             memcpy(pdev->type, "LnxFIFO", 8);
> > +             pdev->major =3D 0;
> > +             pdev->minor =3D 0;
> > +             rc =3D tcon->ses->server->ops->sync_write(xid, &fid, &io_=
parms,
> > +                                                     &bytes_written, i=
ov, 1);
> >       }
> >       tcon->ses->server->ops->close(xid, tcon, &fid);
> >       d_drop(dentry);
> > --
> Shouldn't "else if (S_ISBLK(mode))" be "S_ISFIFO"?
>
> else if (S_ISBLK(mode))
>
> else if (S_ISBLK(mode))
>


--=20
Thanks,

Steve

