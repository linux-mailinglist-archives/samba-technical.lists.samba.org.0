Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0922D20BC
	for <lists+samba-technical@lfdr.de>; Tue,  8 Dec 2020 03:23:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=2YwB1usI6nezktHL/H+QQyeXolejpFh6ZiafTl/sugA=; b=4XipyPcxJ49r3kq2zAtPKHznpl
	wgBM0/HdXKz31b60RjUKCM/F1BeK6abZO0HKS4OiRFiVKXLI0iAniFJkdqvuvCCmSljYQ1m9x9MUk
	BYVinImbXl5mwSwzLjXwxtnFoC/nhSvbx7CkHylitZI2sihXSSljSXd/jgVDE2LCCCxYJ9IznRUxb
	s2H951g/MpdAvA2nI6JXZ8OGVSSRmK27wp9K9a9U5X2YvXL5BHGetNXVI8R5BsoyPA6u608gJiGDl
	YciDRRhEq0Rj3aBrYnItg3C9h29YnzCxJLsiJHvrYKSRdCDxzyX9dlbTx8J1H3XDQkOrFqjZ/fNnL
	n6uHD9Qg==;
Received: from ip6-localhost ([::1]:18174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kmSeq-0009KV-H9; Tue, 08 Dec 2020 02:23:16 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:33284) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kmSef-0009KN-1H
 for samba-technical@lists.samba.org; Tue, 08 Dec 2020 02:23:12 +0000
Received: by mail-ej1-x62a.google.com with SMTP id b9so12111169ejy.0
 for <samba-technical@lists.samba.org>; Mon, 07 Dec 2020 18:23:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2YwB1usI6nezktHL/H+QQyeXolejpFh6ZiafTl/sugA=;
 b=giVG9qPgwJEFKZLkJVHOiKGYKdzCuWWHhPWRv+UlrpdITwc23to8h2nhSmEjj3ZMvz
 KSH4jPSMyTn2I3qz12yPFaU1eo731QucaYXLoR/9ANkjJ0W14qDjIRaCOxsuGmg9AlVy
 9QL4Jh5R0hAaYurr1p4t4X/BXxL2JLDIH4h4t8Rmuia0tAbMLqwwGhJOnRgPVi2WBi/s
 iXEqiZpWgDi3ih7sob1YvU7pVdWVtpIi1TREhl0I4dzWCmYUAPSfz/yHKdfurcfdzazW
 unTBLyA5AIFE+uBTJYFteq3/YfIfdLAwjLP0weLptNqZwibM5DayOQUBYFoptI4hCODG
 d4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2YwB1usI6nezktHL/H+QQyeXolejpFh6ZiafTl/sugA=;
 b=iseNsZjRN9ccJFJUt5qUmC3BE3uqMuIXLI4gbm+Kh03mlg31+Wryd7nzEkRuYMjAVO
 j3YbnhbESKFCAUhKsfE3dW2bpv8QR8zM72m7HDmyy4RibeuWOyvuIAUlLU34qZwcZeDG
 VnxreAbOz9kAbHoE/c1UGav7oRPh/5exJgSUfpyW0Wzfxkpjq9U90iesv9ALMu0dsJTv
 AWygwTrw7dD+xtemxrnCKxZHhgimwQUygOjE/fg/P/ofuw3RU5l9mlGObC3+Krw1cJAy
 SDVoGYSB13xdKLTy2TLu11Fy2wDd3QtbTKF0iXaPTTFd6vNDwsE8OQ6BRwefHOlrDESU
 bdog==
X-Gm-Message-State: AOAM530QHY/t3L0yo6My5NodYUQeetX7Hc9Xx9jp6D9LWHy3+0Dzcfba
 i7UvBfyweF5XuHIdKLeLs0UWPf3afyKg/yElHEc=
X-Google-Smtp-Source: ABdhPJzcSlst1tcDvggWILVe3XIypT59n5WUiqIFn6nKFvWPV6TcXhY+V1ZoqTvCRgD4m0OEuMxmGpF3Wh1jigClk54=
X-Received: by 2002:a17:906:5841:: with SMTP id
 h1mr21049201ejs.77.1607394182774; 
 Mon, 07 Dec 2020 18:23:02 -0800 (PST)
MIME-Version: 1.0
References: <CGME20201208011550epcas1p26cebc8a4d2812fca862990739a059d43@epcas1p2.samsung.com>
 <007f01d6ccff$aad6f7f0$0084e7d0$@samsung.com>
 <008101d6cd05$0faa5500$2efeff00$@samsung.com>
In-Reply-To: <008101d6cd05$0faa5500$2efeff00$@samsung.com>
Date: Mon, 7 Dec 2020 18:21:06 -0800
Message-ID: <CACyXjPwvNSfw9PLtUBxQQF4ysedpOE_TriTuX-JajRmFAHhQMQ@mail.gmail.com>
Subject: Re: Samba + exFAT : how to avoid pre-allocating when copying big
 files?
To: Namjae Jeon <namjae.jeon@samsung.com>
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Cc: Joseph <j@gget.it>, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Dec 7, 2020 at 6:12 PM Namjae Jeon via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> > Hello,
> > When sending a big file (for example 2 GB) from a Windows computer to a=
 Linux computer (with Samba
> > server), then:
> > * if the destination FS is ext4, NTFS, no problem
> > * if the destination FS is exfat, then there is a strange delay (~30
> > seconds) during which the Windows Explorer waits, before actually copyi=
ng the file It seems that the
> > Samba server first "preallocates" the 2GB, before accepting to start th=
e copy from Samba client.
> > Thus, 2GB (of probably null bytes?) are first written, and then, the ac=
tual file is written.
> > How to avoid this effect that doubles the number of gigabytes written a=
nd doubles the transfer time?
> >
> > I have already tried:
> >
> >     strict allocate =3D no
> >
> > without any success in the exfat case.
> >
> > Any idea?
> Windows seems to send SMB_FILE_END_OF_FILE_INFORMATION smb2 setinfo reque=
st to pre-allocate space
> as much as the file size before writing the file.

I believe that Windows does this because applications are actually
writing into the Windows equivalent of the page cache.

To avoid problems where the server runs out of space when the cache
flushes, they send a request to extend the file to the new EOF when a
write to a larger offset occurs. That way, the ENOSPC error can be
returned on the WRITE rather than on the CLOSE because no one checks
the error return from a close and anyway, how can you tell which write
failed when you get an error on close?

> samba fallback to call ftruncate if fallocate is not support in local fil=
esystem.
> I personally think that it is possible to improve the problem if exFAT su=
pport
> keep size flags of fallocate(). It doesn't support yet in linux kernel ex=
FAT,
> but I have a plan. exFAT can store the number of allocated cluster size a=
nd the current file
> size in metadata of file.
> Unlike FAT. so it seems that the fallocate can be implemented properly in=
 exFAT.
> >
> > PS:
> > * I've already tried exfat-fuse, but also exfat-nofuse, and also exfat =
(non
> > fuse) included in Kernel 5.7, and it's the same.
> > * There are many forums posts with the same problem, e.g.
> > https://www.raspberrypi.org/forums/viewtopic.php?t=3D206866

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

