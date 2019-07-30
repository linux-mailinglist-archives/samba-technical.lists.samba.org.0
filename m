Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 474777B640
	for <lists+samba-technical@lfdr.de>; Wed, 31 Jul 2019 01:31:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Date:Subject;
	bh=KgnrZ1KPiRgVMrHMmzin5o2z0Q++iiY6uE9n3icFsIo=; b=afLxwRWSoOq0LK+G7lI8Rs6MMJ
	gHAAou6zJQ5fW6PYlfxr3a7tZngkCYtlwcwLVhaxmz0iapejjDrqvWHA7Z7cajqwSinBtD5AZVYSL
	G/39ghyna8iFFKxWgNdQa6fHdWF8X+5df+kxAAgoIYLRHLJqQGHLBCIlFwd/OYUnhpua2d3OLK4OE
	ft2Y/jRkQSFC0153GUBuA62b8A4x+M5mvQ4rh5HDqQNxEGAgAY9KTvspcivKDWQNDESBR+wvPHBIy
	TytSkGSfDB+FzsqNAC29Y7Kkq96Yq9Xr62s2EL20HMcYE/T5NKrCw+w7t7qci1tyu9js3RydlzqH5
	O9AF3rtw==;
Received: from localhost ([::1]:59738 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hsbZr-0016jI-T4; Tue, 30 Jul 2019 23:30:43 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:35393) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hsbZn-0016jB-I3
 for samba-technical@lists.samba.org; Tue, 30 Jul 2019 23:30:41 +0000
Received: by mail-pl1-x632.google.com with SMTP id w24so29495701plp.2
 for <samba-technical@lists.samba.org>; Tue, 30 Jul 2019 16:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KgnrZ1KPiRgVMrHMmzin5o2z0Q++iiY6uE9n3icFsIo=;
 b=gXaZdKnpQf/GobvF/4GHDz+Ka7mo8+5Qfh/w1oApVdPK9AuamI7JaznJcZZmNcUGfA
 w98JTZGSf5X/NJeuemRrYvpN9ac+69YHzWS1eAXZjxCQrY12CDt0NYEQhIVkuLNxEZ5q
 lO1vM9RkpgZe9FbTQVSlGeFOXrxRCi49b5Nf51MnP8RJVbN5UkDDjwtuKsIUIC5NNYN0
 5DID8qkZkOzVZ9wWLeeDnnHv/K381NGsxSIoTCXSIRbnWDixJVmWNGQv9bVB+6/vnNRc
 PSt6ieHr3qmATOjNFYpotV8SCpVLV52pVhpuLdK7Tm12A0kKNTV2N/+LON4iAgffDZxp
 gGGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=KgnrZ1KPiRgVMrHMmzin5o2z0Q++iiY6uE9n3icFsIo=;
 b=eahb+MRuRwV6Rty78E+fHMLjBzt7/VqYZ5BLOv8ChZJT1wihn5Tv+aYaruc467oIGm
 vG6jIKCe8DqapTFBxBYWMy2YHRTPHTGJRP7Hkqj3irogBt3m3SrzsBWOMZ1gF+wiCoAM
 vaxk9gw4/QE3wz0W3i0up18VRKIe45bBYcZ5W9Gaals/TqLKYLzFC8aQEyk5C+t3KLvB
 zrTWG9IiC5gvSY6pb8kreygAlHMSzW/WlJwv6g/AienI/s0bOXMYiTB0p87koIgnhcf0
 tXkWemEVRosnNVmvYhc6ZvPyLm8CvUh1bx98M52pN5882NzaL2T06GJBQ9e75iK+DjKp
 tEow==
X-Gm-Message-State: APjAAAWK8o2oBm1FKFSCSr/1gFwJpOlZJdHZsJO5pSpist07YupoDwRh
 dpudHiyq4xw3JaHX3EOGaldVig==
X-Google-Smtp-Source: APXvYqy2kO59y8zRUtivVR6LU31+ZMX8jKunJBqa+PvNjfEs+bz7nCrzKW+uRQOxdstcIluDAiyUFQ==
X-Received: by 2002:a17:902:b608:: with SMTP id
 b8mr119236302pls.303.1564529437282; 
 Tue, 30 Jul 2019 16:30:37 -0700 (PDT)
Received: from ?IPv6:2600:6c5d:5900:1e6:f41a:6f03:c0c:f828?
 (2600-6c5d-5900-01e6-f41a-6f03-0c0c-f828.dhcp6.chtrptr.net.
 [2600:6c5d:5900:1e6:f41a:6f03:c0c:f828])
 by smtp.gmail.com with ESMTPSA id o129sm40350303pfg.1.2019.07.30.16.30.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 30 Jul 2019 16:30:36 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: Interesting issue with Macs accessing SMB shares ...
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <CACyXjPy2hrx-K4G+uT2dMcooYzSdw=fTB44wRLuuxfEtrQcoKA@mail.gmail.com>
Date: Tue, 30 Jul 2019 19:30:35 -0400
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA2358EB-C9CA-41AE-83B3-D188103A1E24@ixsystems.com>
References: <CACyXjPxikKqDFpTF=z7u-xVwxpXSLEoo1wssnYRccYuUt3brfg@mail.gmail.com>
 <4f1ad8d7-3df3-c5d1-5b5f-f299b2235ed2@samba.org>
 <CACyXjPy2hrx-K4G+uT2dMcooYzSdw=fTB44wRLuuxfEtrQcoKA@mail.gmail.com>
To: Richard Sharpe <realrichardsharpe@gmail.com>
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


> The server is in a domain. The Mac has not joined any domain and I was
> unaware you could join a Mac to an AD Domain.
>=20
> --=20
> Regards,
> Richard Sharpe
> (=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=E5=
=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=B7=E6=
=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

My experience is that it works reasonably well. If you have Unix extensions i=
n the AD domain, then you can choose to use those for IDs otherwise MacOS wi=
ll generate them for you (can=E2=80=99t remember the exact mechanism). A for=
mer colleague wrote an idmap backend to generate them the way MacOS does but=
 I haven=E2=80=99t had the time to look over it in depth. Hopefully I=E2=80=99=
ll be able to soon since I imagine it will be useful for M&E environments wi=
th AD and macs.=

