Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B4E2563AB
	for <lists+samba-technical@lfdr.de>; Sat, 29 Aug 2020 02:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=v2zqC52gYZtaBaekf8K794HhGCBBQirocd8Rm1D/A5w=; b=K4Ig5ZsnntnNnQJOwsw6TvZucn
	4YpOT9K6+5t4AD7WFFaXBvRfAQRwBpLZthSDDJlA8PpHTMEr/RCHMsOonthPzteyjsSdxR12YfQ/V
	RlMUZDRi+aarrkWl79UmdcePmzSmioGmyK6l3CyIYc+a5epMVneQQFuL/eqeOCCoRuiTnB8m4N7s5
	Vssb3YMFBFj5+0oAXkIxw/CsNYAVHzjUYMMjN0xeitk9jOxlkf17AVVx+b8gKkoGRPQhYHkuNe47v
	Tc5zYrkz+fx4Qdgfe285LKh7AhAVcLfV+p/1rMBvTbMr89BCGDiB15naLAkGZUzH6S7QbukZDT1zQ
	OFZAqc8g==;
Received: from localhost ([::1]:22914 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kBodJ-001AvM-JF; Sat, 29 Aug 2020 00:22:13 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:39542) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kBodD-001AvF-P4
 for samba-technical@lists.samba.org; Sat, 29 Aug 2020 00:22:10 +0000
Received: by mail-ej1-x644.google.com with SMTP id s19so1336776eju.6
 for <samba-technical@lists.samba.org>; Fri, 28 Aug 2020 17:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v2zqC52gYZtaBaekf8K794HhGCBBQirocd8Rm1D/A5w=;
 b=ss9AohfhOQUOIREMHWZZGPhshi/0ds7apATrJ7/F2/sMEngv8BTnV+gTJ0Us2L9bgD
 7GgyW6p2iNy2Gup8wCCpr/OGMlbXnTcRq7//8Gi5mUXOmyry7azNHxbEGMnt6LbENtoc
 Guhy29GF8KPYQdOxCOQdoo/loQxVK5NWa2xZY5ZlF4Ia0J6EVc3wY9VCTxNCbR1r3Tey
 JD+KqCIIpc6zMhPE6kup07TEg6WFi+a437a18bHphW5+8X4aeMR05cU18PaezNcT3NBq
 Kgm946f69v0t9h2kJ+YfIYvIIxvJ3dwDBHkyy9W/0dAz15WPi5t4Nqi71USkBrmGpmvR
 NoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v2zqC52gYZtaBaekf8K794HhGCBBQirocd8Rm1D/A5w=;
 b=mezn0Nu4vymml11uYNN+60hqwdZNXUpAJtJWJAn7zfeyZsT2/sqwWDDFrzeeDjTwL9
 x6eUOYe/+LBrWndhAkLg1va9KFxBy0pGLmI4XURBPqgqTthxkC37HhR0m1RX2SMPRyQh
 BRVUEVTJBSuj0iWxjUVP6vaxls4b8VQ0XptUtXcdMlYyGnbCNUsIm+o3Jp/GVLDdxJPY
 kTUkj4vBtQjB1RaoJwS9suVhs3yX0oJEMYIPADgEtnKURv481jx6cD2FGMQES7+aOxTz
 v83twOy+yqvdUInCFmknvQqsftcPshyUSSV4Wajdsttu4wgvxC2zpfuCS4oOpJMkHJTD
 V/nw==
X-Gm-Message-State: AOAM53270vcOoII7F91dWFqoB53JJAbjPnSICirgtmluxGWru3M1V9Ww
 pW52fhOiw2QrthqkBK+RrADr6KurMnMxKCUYLQ==
X-Google-Smtp-Source: ABdhPJwb4LqiBLaGbG4UUsgVIhMGivDFfQJIUBNHRZJM69w/7ViB3QA2wEZZBV9e+AtCupt/852mrOTOgISy2hvbD/o=
X-Received: by 2002:a17:906:a0c5:: with SMTP id
 bh5mr1287608ejb.120.1598660526274; 
 Fri, 28 Aug 2020 17:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <92faad42-2c69-a906-8da9-14a9f6404b83@rosalinux.ru>
In-Reply-To: <92faad42-2c69-a906-8da9-14a9f6404b83@rosalinux.ru>
Date: Fri, 28 Aug 2020 17:21:55 -0700
Message-ID: <CAKywueRAMHXVWW231RrqcwYOBqBHeT1r2PnYr3ra7g2znk5s5A@mail.gmail.com>
Subject: Re: [PATH 1/2] cifs-utils: Respect DESTDIR when installing smb3 stuff
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>,
 Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Mikhail,

Thanks for the patch. Merged into next.

--
Best regards,
Pavel Shilovsky

=D0=BF=D1=82, 24 =D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 14:12, Mikhail Nov=
osyolov via samba-technical
<samba-technical@lists.samba.org>:
>
> When make install is run during package building, DESTDIR parameter is pa=
ssed, e.g.:
> $ rpm --eval %makeinstall_std
> make DESTDIR=3D/root/rpmbuild/BUILDROOT/%{name}-%{version}-%{release}-ros=
a2016.1.x86_64-buildroot install
>
> Without DESTDIR build scripts tried to create symlinks outside of the bui=
ld root:
> make[3]: Entering directory '/tmp/abf/rpmbuild/BUILD/cifs-utils-6.10'
> (cd /sbin && ln -sf mount.cifs mount.smb3)
> ln: failed to create symbolic link 'mount.smb3': Permission denied
>
> The same fix was introduced in Arch Linux package when updating from 6.9 =
to 6.10:
> https://git.archlinux.org/svntogit/packages.git/commit/trunk/PKGBUILD?h=
=3Dpackages/cifs-utils&id=3Dc75b246a762ea9b90db404dfebc6d35d5b16972f
> ---
>  Makefile.am | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile.am b/Makefile.am
> index fe9cd34..09ef293 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -119,11 +119,11 @@ endif
>  SUBDIRS =3D contrib
>
>  install-exec-hook:
> -    (cd $(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
> +    (cd $(DESTDIR)$(ROOTSBINDIR) && ln -sf mount.cifs mount.smb3)
>
>  install-data-hook:
> -    (cd $(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
> +    (cd $(DESTDIR)$(man8dir) && ln -sf mount.cifs.8 mount.smb3.8)
>
>  uninstall-hook:
> -    (cd $(ROOTSBINDIR) && rm -f $(ROOTSBINDIR)/mount.smb3)
> -    (cd $(man8dir) && rm -f $(man8dir)/mount.smb3.8)
> +    (cd $(DESTDIR)$(ROOTSBINDIR) && rm -f $(ROOTSBINDIR)/mount.smb3)
> +    (cd $(DESTDIR)$(man8dir) && rm -f $(DESTDIR)$(man8dir)/mount.smb3.8)
>
>

