Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D025EA18E76
	for <lists+samba-technical@lfdr.de>; Wed, 22 Jan 2025 10:34:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=5QIsBAwP8k3rVSff01/p1/7nWWbCnzWPU+0ZOSqzIlU=; b=zRkYy9+CrGihNl81LgF7uX9Qfq
	E2Gd7QKPaEAEVgLEtRTLHWSuadzSaff3joND326JKPZE9tf4nLb5jn0E4WftsEq4LdkURu0Ao3j8G
	WWKg0kTjUn4XssdKkjfB2W/gymOuk0iLs5xVJsjNACNe4revAOZPzsk8D6i87Osz4PB8hkE6MZc2g
	6nie0A6I8kRIL/WO933KFVDLk5uCaInvtzDChpnjdaUzRXOKXQeL2eZ8wNCr3dXkopVDKS9oM+UlP
	ZSyyuC5dYRma2IDG/Gx5PfVb0qehNEgKgBij46TG+LShgCJXoM3ug9GJgb24T0gICvr2fhPZT4bzJ
	hTMaS9lg==;
Received: from ip6-localhost ([::1]:34296 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1taX7o-00955M-Gw; Wed, 22 Jan 2025 09:34:16 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:43142) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1taX7k-00955E-9Y
 for samba-technical@lists.samba.org; Wed, 22 Jan 2025 09:34:14 +0000
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa679ad4265so146797466b.0
 for <samba-technical@lists.samba.org>; Wed, 22 Jan 2025 01:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737538451; x=1738143251; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5QIsBAwP8k3rVSff01/p1/7nWWbCnzWPU+0ZOSqzIlU=;
 b=jiFjkYxK7oVT2gdnKJqudva1dVI6FHyikW1uEvOgHUUQ0EAn7Iztu19bxPZ68V9dd7
 7Y/R2VHsrQ2oHpa1jBBJWTH0HzPwBkkdPbjnRlbkZpG77+GA9+oxdGmf+brDYxWrH7JK
 FMi8mquoGuI1+EUVEfBwvJJVEUJ9poO/q9OyBKQfM8Q/J3iF+5siXzrKVQ2jw9Y0XM2m
 l3YQ5rEU4ZlXFRFgr7ZM2FUxRBk5ZjaekBflwyutSFWnQ3ZUzRcapRGRWIqNKsI08utp
 vOFzDE6n3ci6K4kYWcgSdXxSEQclCWsbxFgsDHgOMRGMbsGBkE+HX6fkEIVntw4EXAlh
 bDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737538451; x=1738143251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5QIsBAwP8k3rVSff01/p1/7nWWbCnzWPU+0ZOSqzIlU=;
 b=wKXYsw6LjbmuMSF5NOvhKMwls7e8Q2jFCg7Kyywk1ycAfdIsGSUp5Tzir7RxOH2RRZ
 ZLHPrwa8+ywwwwhXl+XJ6RTnR64AuPHm7ru5NzbhsfxRRZOqS1gFpoK20ZZQEuGqi24d
 16KbOn6q/iunNG2iVoyZIbN1UHkN1eKYiWhRGp6m+wKR8kq73ZBgLAQGlApLJqmzhhRP
 /h6Onqj4tdT7sZ1i/ROb97CONO21aiC7lvA48WaMaG4VXhoo8d0VgWjeFAKDO+qYaXhl
 T0+r0gVAxUIxrnVdZ2TuWwssoBWzCaILzD+wNZOJhRG+lC7M3ey6W/3eYY70GMbmVBTR
 mV5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgPwhsbJA6HORsnaxqb7s5j+FLGbNVS6rEQK68vYAG9qaALLDM9f0vdVhhllkpmb7zixxwAwLKsFoFKNLOCgg=@lists.samba.org
X-Gm-Message-State: AOJu0YyBjtzdE0di5HOvqsFAK9Z86bTS3DiGZgS/wGx8/t8NEVyQ8np3
 40sDsuyRuXQ1ybZjYp5Y0LQ3h4BQwLjGGcnUmawjCfOqrZJh6UKE5c4sxdmT+jIF0QexNVem9Td
 6ItUDufSRNxlih/ncjzxD78qENOI=
X-Gm-Gg: ASbGnctM4Uqc4/XYXa5a94gxGtY1GaQeuKWVCSp7YO3DUTlsnuMPRGlIakvZEE3Zogb
 jbrXTPUtLEfpng0lPnOCKt26POtpM1DGq0AmJQsdBI0X7LKf42T+p
X-Google-Smtp-Source: AGHT+IE1BW3bXlBCaaFaJcoTYFvp1+Y8ocVvyW8JelStjrfP0+Sb6k6lXe6D7tokuyixq2EfztLBysLLyXXpcFmwBps=
X-Received: by 2002:a17:907:3685:b0:ab2:c0b0:3109 with SMTP id
 a640c23a62f3a-ab36e4069c4mr2112523466b.21.1737538450730; Wed, 22 Jan 2025
 01:34:10 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5mscBfMimoxO8yYQAB1SEdDhdjpwQxkw-45+tWL5tcsqZQ@mail.gmail.com>
In-Reply-To: <CAH2r5mscBfMimoxO8yYQAB1SEdDhdjpwQxkw-45+tWL5tcsqZQ@mail.gmail.com>
Date: Wed, 22 Jan 2025 15:03:59 +0530
X-Gm-Features: AbW1kvY50JvfEFOgxg_KSTL-3Rx_39NSpzkFWzbN0k4Gyld1jC604MSPXsjb6xA
Message-ID: <CANT5p=qqP2MpoG0mUmjaXaFdU81NwFaJGsD00vEjUiPdsLcrYw@mail.gmail.com>
Subject: Re: [PATCH][cifs-utils] avoid using mktemp when updating mtab
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
 samba-technical <samba-technical@lists.samba.org>,
 Carlos Maiolino <cmaiolino@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Jan 21, 2025 at 6:19=E2=80=AFAM Steve French <smfrench@gmail.com> w=
rote:
>
> Attached patch to  Fix build warning: cifs-utils/mount.cifs.c:1726:
>     warning: the use of `mktemp' is dangerous, better use `mkstemp' or `m=
kdtemp'
>
> Use of mktemp() has been deprecated (e.g. due to security issues with
> symlink races), and instead mkstemp is often recommended.  Change
> the use of mktemp to mkstemp in del_mtab in cifs-utils
>
> Fixes: f46dd7661cfb ("mount.cifs: Properly update mtab during remount")
>
> Opinions? Better way to address it?
>
> --
> Thanks,
>
> Steve

Seems like a reasonable change. RB

--=20
Regards,
Shyam

