Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0AA9C1DE4
	for <lists+samba-technical@lfdr.de>; Fri,  8 Nov 2024 14:26:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=SKANQO/cR7G5TkeUCl2Xbeh7lhpcW2B54x1QdIzty7s=; b=Sigt45AJE0Xd1yUNfUXPvGNPnq
	DLrJn2y2tN9quR75pJdDV4cWTx7qAR43x3aDnreCqpklMD/EHkxlaPWk1etKxeyiP71LomtZlLJKl
	iXr11uISO+qzHqCgA+EwKLiWeu5g5Yqu9Yb2qBQWSJuLjUv4zmBOQI3UYP4H6TP4zyfZzb6v9c2r2
	Xve5/ZZsy8XBmetXzyEJuUFmweyiKo3ItBY9P825c3VG02BMBMx1v7Zd0JXPAJu7QRN3p9lY7a9UN
	vbmi4efPIzD9TVO+UGbn9lham4NZVcAeY/aC/e7rjbxC55vBMoSs0AYwnMFX0/sd46kl0igNfbrfm
	0qYhqx9w==;
Received: from ip6-localhost ([::1]:24960 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1t9P0b-0087tU-Hk; Fri, 08 Nov 2024 13:26:41 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:56778) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1t9P0X-0087tN-7l
 for samba-technical@lists.samba.org; Fri, 08 Nov 2024 13:26:39 +0000
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a9a0ec0a94fso335659466b.1
 for <samba-technical@lists.samba.org>; Fri, 08 Nov 2024 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731072395; x=1731677195; darn=lists.samba.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vRiGO06R/xy69WgIYYmFdvafNKH1wnc42Tyi+/ZjFMs=;
 b=NkhqpGpjo9x2iyoWzGfqq+80eoufhKo+sEl4kSti0L8ZnHc199sN5W1Gx5D5rO2NEo
 /3ZWESTXc/Fxox/Z88NY24osMZfZJEp6GpQ5wb2wKic7pCWkaTnt3Pb9GsI+P5BByME6
 /DPGAT00zG3qExSo4Jcgu03LKL02fmCWtzblvBHBxyGcRDQkAF8T4c9w/UZg3ee1ZJ1k
 VVh4BaO8FJnQeumZBfvIzZIKzBWp8TmwfRDK4W6rtoigiKJjxy+qUqnfGG0x8gP93QyR
 06ADGA3N6M5TGTRDMvQ7jjKK9fY3n1odwBVQ7K6FHHTUCS46EyCIB7yK9/sFIUZAhBUe
 6/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731072395; x=1731677195;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vRiGO06R/xy69WgIYYmFdvafNKH1wnc42Tyi+/ZjFMs=;
 b=YTqAnvU/GeKB3cuczjZ5USRZb5D2cchiRykebfreQfRp770uOkNWbGbUIno8TOh37g
 RaJmPz+z5xMkE7zPc8PWwiY+dQZ1OWp11ZLiFZtQULfnY1NLmD2ZgXFxQgTyV+Hqxu1G
 m8+EPmtBXi+k/Dfttg9cXChBG5u0DAMPF5uDxNmcQ7cM7CsPwJviqHfKZ/XlH7uqIUag
 U2b09p/4tTrHDlCWW8M3YWp7QqsqXxiaNGCel++GqHH/WjxHAr+ahzk2XMH0kOqmndCI
 T1oZnBKKquSnylAfcpSiNzpdA7BDfl9AICrLnjcuIuFCmyCuCysq5qW9q8+YWTlAyMTF
 mnLw==
X-Gm-Message-State: AOJu0YzhGv1V6fvkbxp96y5uVXhUE25INz+Sj1OjLWLAiHH8tMVuIMnt
 sD/x4cC0Z+ulUnq+ZzG0twHFJ7MyHBwl/QHKF+ZmvjKfc3zEp8et6MMtRu9Zjst+ka8dBODfWk1
 9oB8So5NAeP+SzPLgcSvdxLY1LWrsmw==
X-Google-Smtp-Source: AGHT+IFtM1FxfFR+P+oKkPTXOGLj2fCozSHEplEXkCDvYEsyS7dwGsThgoXHQX5Tn7fpObKz2Milpb/sWBaQOfIkCDs=
X-Received: by 2002:a17:907:844:b0:a9e:c267:2040 with SMTP id
 a640c23a62f3a-a9ef0007298mr250277266b.51.1731072393505; Fri, 08 Nov 2024
 05:26:33 -0800 (PST)
MIME-Version: 1.0
References: <CAP4uAdpmq+vUOGJfJEMWh2dpQUYqOrQj14f_qvMehoUCebT7sA@mail.gmail.com>
In-Reply-To: <CAP4uAdpmq+vUOGJfJEMWh2dpQUYqOrQj14f_qvMehoUCebT7sA@mail.gmail.com>
Date: Fri, 8 Nov 2024 18:56:22 +0530
Message-ID: <CAP4uAdr-QPDNKCfm1hxBtOciuosdVCV-GL4WZpPvd4UjCguo6A@mail.gmail.com>
Subject: Re: Latest samba4.21 configure cannot find ldap.h, lber.h files and
 libraries on freebsd
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: sandeep nag via samba-technical <samba-technical@lists.samba.org>
Reply-To: sandeep nag <sandeepnagamalli@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Though I installed the openldap server and client and see that  ldap.h,
lber.h are present  in /usr/local/includes on my machine.

On Fri, Nov 8, 2024 at 6:53=E2=80=AFPM sandeep nag <sandeepnagamalli@gmail.=
com>
wrote:

> Hi All,
>
> Seeing following error on freebsd with samba 4.21  ./configure
>
> > [1/1] Compiling
> ^[[32mbin/.conf_check_cb0399a8760ccc5bafb05dce08fe487f/test.c^[[0m
>
> ['/usr/bin/clang', '-D_SAMBA_BUILD_=3D4', '-DHAVE_CONFIG_H=3D1', '-MMD',
> '-D_GNU_SOURCE=3D1', '-D_XOPEN_SOURCE_EXTENDED=3D1', '../../test.c', '-c'=
,
> '-o/root/src/samba
>
> /bin/.conf_check_cb0399a8760ccc5bafb05dce08fe487f/testbuild/default/test.=
c.1.o']
> err: ../../test.c:455:10: fatal error: 'ldap.h' file not found
>   455 | #include <ldap.h>
>       |          ^~~~~~~~
> 1 error generated.
>
> I see the 3 patches mentioned here, are already in the code.
> https://bugzilla.samba.org/show_bug.cgi?id=3D15623
>
>
> Thanks,
> Sandeep
>
>
