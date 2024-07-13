Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2399303CD
	for <lists+samba-technical@lfdr.de>; Sat, 13 Jul 2024 07:49:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VAFb9ygn4t+yhC5XAo+LnDHiYZOFZtBcIf6QNmQl3X8=; b=3H5aZubRRiF68pXVVGJJ+aKQor
	uNBUk9k+O4gzjxJXB482wp6w8464tB6M9jRrcgLDqljf4UThMJE0Xr8QBafI8/yjgCr5tCP/ihMaA
	Xz7eVM1jd6mJ2pSSmijVfZrsAxEp8hQID7rf9HiR+pqKoFuL33wdowb6kYMBgHXYRDJqGJM0V/OQc
	MzZ+W1A6+5EZa4mSsZsloRC+btsPduq/9WK0QDiOHmSAFVyV7NDG8c4MWmYT73dKt1sojij77vlJw
	yiAMQ+AB0OgRNh4XzTETPeUnR2YF+Kl+GAM5AADrAYLhTUZGIlGzR8OhOgpxmy4jJrHvjOIsZqNR/
	hDpLl+Jw==;
Received: from ip6-localhost ([::1]:63520 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sSVd2-000Zyd-6j; Sat, 13 Jul 2024 05:49:04 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:51221) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sSVcx-000ZyW-V3
 for samba-technical@lists.samba.org; Sat, 13 Jul 2024 05:49:02 +0000
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52e9c55febcso3509634e87.2
 for <samba-technical@lists.samba.org>; Fri, 12 Jul 2024 22:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720849738; x=1721454538; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VAFb9ygn4t+yhC5XAo+LnDHiYZOFZtBcIf6QNmQl3X8=;
 b=frowS0xBemFqtQXjnukVcALuw5heLv5gNvKWS3IxufZCe1fbCImnP+CLgMfxk6BpYu
 J9aLnDn7a1cgBOacNUIIWzpm6Cul2NfPo7TwGDfLNFYj+Tt1YN+IrneKadPwK7DoF5eM
 XVQVCBdgVyFxaQ8+WKWar71aAE/q0y0ZvTTv4jO/s4DV+oQCc9jSdU1hYOoam+fjsMqW
 ch69W1A/vQ3YE2Xp3ouTWSQku3IlsGl3XOAOiZtKLGsC6EZgK8i8IJrlBuKPKUm/magL
 RizRf9c3OjBVMp6g9A4DK2BpwmcG3YMqqNn5ZwVT74mEpm50cH3Bh9HgE7TkCcEH/KIA
 pVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720849738; x=1721454538;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VAFb9ygn4t+yhC5XAo+LnDHiYZOFZtBcIf6QNmQl3X8=;
 b=rrfOLek47CQOrCAfA4Ii+YscLGqSCOIxvlglB0AJ5XxkzzwaJG49nNBCULTM0bDrZR
 7MP0r5U+b77HdtfBO/27n2AkkgEufocGTqbnIlJn64VvWwNFdT6iN5SBXhM+lPcb6bTk
 qT2ivqMRvZlb2lzvyIYfkpO2rUEKlxh49uAlbYc0qzPAMfS/Qt0iLB+CgJ1105x96viY
 CZvwP3TZmr48LpKF58Lfg05MgjB9HnPxOLUvpmMMxuWNFObYRwZLIdFKWxD9nKmqu/ho
 xiHkdDDY4xOtt/czFjdJit42szQsKEOF1JXe/Y333NoMhSVEKaN39BndEi9jFkbjWNRd
 yhvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZe/7tbwrkFVTTsSgSx5aLROomj/XsWVr9BJRZW1i7Kw+Llvg1wgmqVHyEOpZTTa/iKJUypA0RNE8lj5U/1CsSJYrIFqGgf/uTIJa58Jcx
X-Gm-Message-State: AOJu0YxsFkJu5Sg8Zvi0gpztlWE898up9r+tH8u1ozxwp2LvMOHkiEDr
 g01txaBcyJTbyphbFtkVSQ1jbMy4ISOWsLBvtUMsaTLg8B8HWZvB6g0KW48BEZwJGK3OPHTCqaO
 XuKdwoIjVAxVuKV6E+IvBcuBX58Q=
X-Google-Smtp-Source: AGHT+IGBPFr/6JyyTqHENo/wKQE8Wd2NIWuGjAtCa1AB6CUK42Kq+bHuYgl61IcxzABXofjzfSPIcas3Ohmsn2MD/z0=
X-Received: by 2002:a05:6512:3088:b0:52e:987f:cfc6 with SMTP id
 2adb3069b0e04-52eb99d33f6mr9567162e87.51.1720849738012; Fri, 12 Jul 2024
 22:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv2V3vdupgmR75WsNGrfdbaPo0Mw+6x82KK9vgUYu5AkQ@mail.gmail.com>
 <CAH2r5msriif9aOTVa57n2PnEjUHYgpimuz7vTG8deS=KOZt3hw@mail.gmail.com>
In-Reply-To: <CAH2r5msriif9aOTVa57n2PnEjUHYgpimuz7vTG8deS=KOZt3hw@mail.gmail.com>
Date: Sat, 13 Jul 2024 11:18:47 +0530
Message-ID: <CANT5p=orFiPMujTrXE2_8kvxgV9fYU+QkXOSzg4eynDJY_Kr6g@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix setting SecurityFlags to true
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Jul 11, 2024 at 9:12=E2=80=AFPM Steve French <smfrench@gmail.com> w=
rote:
>
> V2 of patch
>
>     If you try to set /proc/fs/cifs/SecurityFlags to 1 it
>     will set them to CIFSSEC_MUST_NTLMV2 which no longer is
>     relevant (the less secure ones like lanman have been removed
>     from cifs.ko) and is also missing some flags (like for
>     signing and encryption) and can even cause mount to fail,
>     so change this to set it to Kerberos in this case.
>
>     Also change the description of the SecurityFlags to remove mention
>     of flags which are no longer supported.
>
> On Tue, Jul 9, 2024 at 6:45=E2=80=AFPM Steve French <smfrench@gmail.com> =
wrote:
> >
> > If you try to set /proc/fs/cifs/SecurityFlags to 1 it
> > will set them to CIFSSEC_MUST_NTLMV2 which is obsolete and no
> > longer checked, and will cause mount to fail, so change this
> > to set it to a more understandable default (ie include Kerberos
> > as well).
> >
> > Also change the description of the SecurityFlags to remove mention
> > of various flags which are no longer supported (due to removal
> > of weak security such as lanman and ntlmv1).
> >
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

Looks good to me.

--=20
Regards,
Shyam

