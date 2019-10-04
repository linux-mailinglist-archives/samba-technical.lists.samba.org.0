Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 33111CB2B8
	for <lists+samba-technical@lfdr.de>; Fri,  4 Oct 2019 02:22:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VpPaB31YKwLTVOdlGQZYQGQcqgsQZ/YDZDxerxCqdVA=; b=CdjZhdAQ3+Bb1yYApUHkZD2xGE
	cw/oiITutwpkgFZwuoKiFe1Z/KCpfng3bCqsP726NU5LW8BsEbPSjoO7gAIaZ0uJp2FtHu6imRqgs
	LXdIyQNBe4lu2dNq9ILYldt2fEZhuUj3hczpse6EfD1UVyCjuxiYi2N1YAeVUwLw+qMU+A8kHlT+d
	UZymENk6RkRg/yLEwPNIWCVcWVGLO1yytpltSbN0u/IPRo4fXTEoBJbUyt1hEHGz7ab23NxKcS8VH
	1qRiCcRQP3QRsqDIhA8f+3X4FWM1ETcG1ti8muTMMWCf+6VAmPP3Wt6hYtyt02g6KvdfkdYs0W7WQ
	UxclyurQ==;
Received: from localhost ([::1]:32222 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iGBMq-000xK2-C2; Fri, 04 Oct 2019 00:22:44 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:33066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iGBMl-000xIS-AW
 for samba-technical@lists.samba.org; Fri, 04 Oct 2019 00:22:41 +0000
Received: by mail-lj1-x242.google.com with SMTP id a22so4696042ljd.0
 for <samba-technical@lists.samba.org>; Thu, 03 Oct 2019 17:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=VpPaB31YKwLTVOdlGQZYQGQcqgsQZ/YDZDxerxCqdVA=;
 b=aGpfCVRczGcytuV+hPB1KOD41nAkza4w8EYZuaN6bhEJZr5z7ERMokKxZR6UT6fdPq
 X3Aty9VKweZZUGZZwE+Y2R8yfOPWyDMVvUFFHBVgG1cKwTY5OVe34EJqEsS7HMnF0dDc
 Uf8a+KFyMa+UshtpGIkfX0A3tgRUvmF7c7UPRFuu56xEJhTBYewA0EsyZImO2pfT+W8s
 w1101gz0iBGlbeUoI+57q8xRdzeAwcb80mPS3ILQwKOcYmTSBzE/bOc/SfATjEH44Vzf
 kSNMlJP+W4ZZaF+Ru0Wk+9Mpt13eAK30WQNUG35OpeTxgrkiIEY4O6uiBR5xv36CtEY+
 OY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VpPaB31YKwLTVOdlGQZYQGQcqgsQZ/YDZDxerxCqdVA=;
 b=i3pTWkKFcDCxLwLOi+A6kfG1DbUc1vUGMaxm+uiPulJHs/YSQv7//5BjLAben+m7V8
 AF8whmIMM3XFsfbmwfa2Yk7PCV8itQ+YZpXF5hwauNIbV8mQ1Hix/daPvgSq7C0nq7ZM
 aaCTNhICYkUSuAMTRS0vq9Z0QkrlGOa2NIW/FvdIPF2GyZeGyQ/l6ZhBxyinnsUM9oPc
 cpT782L/KCxbl00yv6vUgEt+G42/83Ps5tFwIQM97r9rwpJn1AzxtFiSmY9Dml+H4Ecg
 1BMOdBNFTO2oi7vcgmOpG7gnN8ROzEla6Z3CuK6o40JwfDP9yiDGKIomPniOEjcsGoKW
 9C6g==
X-Gm-Message-State: APjAAAUz1yBi7/YJaS0we3ZwijFgvjk8eK6uDIXZ54bbIRkHsQZ/HV+G
 EADhnJnMiGk8oMmf33qpFGU89X4O0g6dB5VYCg==
X-Google-Smtp-Source: APXvYqwXpkAxgkYWyx0YKKn7INxIt/vdRxkuTxxyM6XSkMS2kH4K8tmSF3B5u4LE8jUkivseGWcDoi4PchwOj7CVDAA=
X-Received: by 2002:a2e:7d19:: with SMTP id y25mr7562122ljc.177.1570148558386; 
 Thu, 03 Oct 2019 17:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190905184935.30694-1-paulo@paulo.ac> <87k1ahiqmd.fsf@suse.com>
In-Reply-To: <87k1ahiqmd.fsf@suse.com>
Date: Thu, 3 Oct 2019 17:22:27 -0700
Message-ID: <CAKywueQZSHj6autWPkyjhnfpEttFbr=81Y6a7_tWSQVnr-PmJw@mail.gmail.com>
Subject: Re: [PATCH] mount.cifs: Fix double-free issue when mounting with
 setuid root
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
Cc: "Paulo Alcantara \(SUSE\)" <paulo@paulo.ac>,
 linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D0=BF=D0=BD, 9 =D1=81=D0=B5=D0=BD=D1=82. 2019 =D0=B3. =D0=B2 05:46, Aur=C3=
=A9lien Aptel <aaptel@suse.com>:
>
> " Paulo Alcantara (SUSE) " <paulo@paulo.ac> writes:
> > It can be easily reproduced with the following:
> >
> >   # chmod +s `which mount.cifs`
> >   # echo "//localhost/share /mnt cifs \
> >     users,username=3Dfoo,password=3DXXXX" >> /etc/fstab
> >   # su - foo
> >   $ mount /mnt
> >   free(): double free detected in tcache 2
> >   Child process terminated abnormally.
> >
> > The problem was that check_fstab() already freed orgoptions pointer
> > and then we freed it again in main() function.
> >
> > Fixes: bf7f48f4c7dc ("mount.cifs.c: fix memory leaks in main func")
> > Signed-off-by: Paulo Alcantara (SUSE) <paulo@paulo.ac>
>
> Reviewed-by: Aurelien Aptel <aaptel@suse.com>
>
> I've compiled next branch with ASAN and can confirm the double-free and
> the fix works
>
> Compiling with ASAN
> -------------------
>
> $ CFLAGS=3D-fsanitize=3Daddress \
>   LDFLAGS=3D-fsanitize=3Daddress \
>   ac_cv_func_malloc_0_nonnull=3Dyes \
>   ./configure
> $ make clean && make -j4
>
> Next branch
> -----------
>
> $ mount /mnt; echo $?
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> =3D=3D29883=3D=3DERROR: AddressSanitizer: attempting double-free on 0x607=
000000020 in thread T0:
>     #0 0x7f69d480a1b8 in __interceptor_free (/usr/lib64/libasan.so.4+0xdc=
1b8)
>     #1 0x559381795f33 in main (/sbin/mount.cifs+0xef33)
>     #2 0x7f69d4394f89 in __libc_start_main (/lib64/libc.so.6+0x20f89)
>     #3 0x55938178e079 in _start (/sbin/mount.cifs+0x7079)
>
> 0x607000000020 is located 0 bytes inside of 68-byte region [0x60700000002=
0,0x607000000064)
> freed by thread T0 here:
>     #0 0x7f69d480a1b8 in __interceptor_free (/usr/lib64/libasan.so.4+0xdc=
1b8)
>     #1 0x55938178e372 in check_fstab (/sbin/mount.cifs+0x7372)
>     #2 0x559381794661 in assemble_mountinfo (/sbin/mount.cifs+0xd661)
>     #3 0x559381795eef in main (/sbin/mount.cifs+0xeeef)
>     #4 0x7f69d4394f89 in __libc_start_main (/lib64/libc.so.6+0x20f89)
>
> previously allocated by thread T0 here:
>     #0 0x7f69d480a510 in malloc (/usr/lib64/libasan.so.4+0xdc510)
>     #1 0x7f69d43fc2a9 in __GI___strndup (/lib64/libc.so.6+0x882a9)
>
> SUMMARY: AddressSanitizer: double-free (/usr/lib64/libasan.so.4+0xdc1b8) =
in __interceptor_free
> =3D=3D29883=3D=3DABORTING
> 1
>
> With fix
> --------
>
> $ mount /mnt; echo $?
> 0
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)

Merged, thanks.
--
Best regards,
Pavel Shilovsky

