Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F10159A0B
	for <lists+samba-technical@lfdr.de>; Tue, 11 Feb 2020 20:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=lqW0WftxpvZ81xAAdoeFzPiKyEtIEOstnPHO2hWGQn8=; b=ez2dBmZSGzk5QkmesmOS3x0D99
	xxWZGsEnklFgOHGHn30VacM3GexIkj6PDsdKbPl4P6srijdJgEIMxJobP+GOxfzHmHx0e3oaBek5h
	vXu56NI86DoSOyKNinuWYsHYwy/dXifVmpwMM8WGoYyypttCRqSc8N3ltMrlX7ucVKgUJTg51VQLU
	jMWRCaUOG+54EiMHCKFy5A604IGfT+C9NjaTaKLazEa9PFXEt444Bq8VoR9Mtzdt72BIsAH1zMH6I
	9MjQDcJANXyzn19OGyv23NudncsTsnjYIBBtN8Be/shZ/VE59lwOsDzNWUbu5YnL03AI1ue4iYUzM
	Pow3A+NA==;
Received: from localhost ([::1]:45134 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j1bYT-009Rft-KF; Tue, 11 Feb 2020 19:50:45 +0000
Received: from mail.rosalinux.ru ([195.19.76.54]:48564) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1j1bYO-009Rfm-N1
 for samba-technical@lists.samba.org; Tue, 11 Feb 2020 19:50:43 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id 57FA1D6E07A1D;
 Tue, 11 Feb 2020 22:50:37 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id rEi9mABsXBTw; Tue, 11 Feb 2020 22:50:37 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
 by mail.rosalinux.ru (Postfix) with ESMTP id EF0F5D6E07A1E;
 Tue, 11 Feb 2020 22:50:36 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru EF0F5D6E07A1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
 s=A1AAD92A-9767-11E6-A27F-AC75C9F78EF4; t=1581450637;
 bh=lqW0WftxpvZ81xAAdoeFzPiKyEtIEOstnPHO2hWGQn8=;
 h=To:From:Message-ID:Date:MIME-Version;
 b=E6Ydp8Mb5bjgN7bNx25BhfANZl1+t7dIo3kDESHLkHYZjDj0oEdJL8z0Iqdu9ARIs
 rEYi0tIisxSX4XK91oOD3+eUs+65RH+YFB4/w7lVhaiYQmgqXFCA5/tSFOkT0jsc6I
 YdIxt0EKLxFua4Sp8+Onbjrpg0CCgi4y4mtY3t5afq2pero+fsLgelpUWLrL//HOrI
 B9Css54DY2BmsGsjB7s+/OXPR9Pl1w+KNGFOCSQ6w3HEUTjUr14q7z7ARmB5NG2OjV
 Y3DuA56N41ILVMdDWCTQP+c+gX0I5OvaCruZph9H8y3V3yOb/c6TC/cRpyayKt73n1
 yy5jr+MNguXNg==
Received: from mail.rosalinux.ru ([127.0.0.1])
 by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id HoqQ4fTYk5Ka; Tue, 11 Feb 2020 22:50:36 +0300 (MSK)
Received: from [192.168.1.173] (broadband-90-154-71-23.ip.moscow.rt.ru
 [90.154.71.23])
 by mail.rosalinux.ru (Postfix) with ESMTPSA id C6490D6E07A1D;
 Tue, 11 Feb 2020 22:50:36 +0300 (MSK)
Subject: Re: XDG Desktop files with smb:// URI
To: samba-technical@lists.samba.org, nir@basealt.ru
References: <2c90c6d6-5c5e-76d4-8f02-0c307531ad4f@basealt.ru>
Message-ID: <019e7bcd-73be-5ab6-044a-1fc7975ada86@rosalinux.ru>
Date: Tue, 11 Feb 2020 22:50:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <2c90c6d6-5c5e-76d4-8f02-0c307531ad4f@basealt.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: ru-RU
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
From: Mikhail Novosyolov via samba-technical <samba-technical@lists.samba.org>
Reply-To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

11.02.2020 19:25, Igor Chudov via samba-technical =D0=BF=D0=B8=D1=88=D0=B5=
=D1=82:
> Hello, colleagues!
>
> Does anyone know how to create .desktop file with smb:// URI so it will=
 be possible to open Samba share via file manager like Thunar or Nautilus=
?
>
> I've created .desktop file like:
>
> [Desktop Entry]
> Type=3DLink
> Version=3D1.0
> Name=3DDocs
> GenericName=3DLink to CIFS disk
> Comment=3DLink to Samba share
> URL=3Dsmb://10.x.x.x/doc/
>
> And file managers saying "Incorrect .desktop file smb://..." despite th=
e fact that copypasting link "smb://10.x.x.x/" into address field allows =
me to query the resource.
>
> ---
> With best regards, Igor Chudov.
>
I solved it like this for sftp://, the same will work for smb://:

Exec=3D"xdg-open sftp://10.x.x.x/doc"

Or try to add: "MimeType=3Dx-scheme-handler/smb;" - to the desktop file o=
f the FM.

Note that xdg-open will ignore KDE mimetypes associations which do not fo=
llow Freedesktop standards.

But I have just tried the following desktop file:

> [Desktop Entry]
> Version=3D1.0
> Type=3DLink
> Name=3D=D0=A0=D0=B0=D1=81=D0=BF=D0=B8=D1=81=D0=B0=D0=BD=D0=B8=D0=B5
> Comment=3D
> Icon=3Dgnome-fs-bookmark
> URL=3Dsmb://test/
It worked as expected in XFCE with KDE Dolphin as the default file manage=
r.


