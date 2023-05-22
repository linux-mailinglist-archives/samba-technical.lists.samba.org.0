Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BC8C70B534
	for <lists+samba-technical@lfdr.de>; Mon, 22 May 2023 08:41:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=VV/ehKbV1iIQDJGQSm6zCQ7DyGUIKWnG+QaHD5Qb+gk=; b=a4a45oelo+kft8LtTIr0TcArcp
	Kr4p4caRH138d9n0pO0nz3/o8Jgu1HXt8zJbA6d68ypTDd7x1y+RlfaMPnTnoHG7EonXX9ZkS1j+C
	lfEMtdOZlgQuWwmbcEW4VyxKtx+l9qXBZfpl0ClL+mCKjIDabUmxC2mnZoR7jBzbKlj0ZNeeNXJK+
	XeCVMny8nLJcMoeuKFBuriXZd+/QWNJZ6XUqxccQDk8DpP9XRykbp1nos1joIqVLHZP94H+YAlKUF
	kismq7ox5gEqGLB6Vq9ueKWyx12hclm4bZ2OaTNVq48bv51UbkrTa37GwtNvzVMOm2+XJYkG996z2
	qPSkptHQ==;
Received: from ip6-localhost ([::1]:39282 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q0zDo-00B8Ji-2j; Mon, 22 May 2023 06:40:44 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231]:46543) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q0zDD-00B8JZ-2k
 for samba-technical@lists.samba.org; Mon, 22 May 2023 06:40:14 +0000
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2af1a7d2f6aso48639261fa.1
 for <samba-technical@lists.samba.org>; Sun, 21 May 2023 23:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684737602; x=1687329602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VV/ehKbV1iIQDJGQSm6zCQ7DyGUIKWnG+QaHD5Qb+gk=;
 b=oaweLlErQs9IW1mUjYS2GcJVJmCcCBcub8429joPEegTmdZA4Dh28nuGlfO9dhRDyo
 Vf1YKBAl9ADNhafTQo/UkbC3AM0XqynPbRtVyaYL9CdIj0W4XnmHHKTlbIHc/p4j/yX/
 HbS5lmYelAau/+qrlvHh634vl+/1aVh0Nk49GB2+XJvfy01ELs5PhEfTVpPoX+VxCla7
 V1jhRo1hYfa1CNqwgxSvOR5Xmio8485zE+wveWK9WYGgDAmQfXaTyC7I8pyYDBJjvC+m
 EB1K2dFHQwePB89P5I/yx2AIf1rTwi6lJxsB9rFLDV4r9BgXOaOi7Q7Oc9ADqWK7hK4G
 u74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684737602; x=1687329602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VV/ehKbV1iIQDJGQSm6zCQ7DyGUIKWnG+QaHD5Qb+gk=;
 b=aMplQhqgvANYutwBaOi4mpvv//HDO0Rf1B7D9KPTBdZQz65zOsZ5PrYie8eIIpYTHL
 3/ecs0aisnkjEIF8J6K4OuhRlA5c0Hnq592OXVWFuw6NnK4xzfRgST9d7mGtP31dP7L+
 AzleZhvOcFKmHGwEbUNy2KfRLB2O7z934d22y/U+Oi8bwJW+vvx2N2xsGTVok6jdFT5g
 5MV+ruzkFFM/iv7xkKTtUtD7gYIYLAICEVF9MUkAFthLVPrOSI7YIlt74DpjbJ/d8U7v
 3OKEe8p7kQ8g+1mCtlf4Kg/uwxEHTCTnMI2dsJCobgqrMdGDmmPsCfF/cEcaaEZvsJxD
 sIvg==
X-Gm-Message-State: AC+VfDy+TA/VA9+Xmkw4e2UvhgoMPIP6YJyDC2FVp3YEkg7q3HS/5446
 TzCqVmi0xuKSuUjxJkaiz93hu81ULLMFt5lmF32/HHXh9yw=
X-Google-Smtp-Source: ACHHUZ74gSfXpfdK7tBjZe+RbkZ3a44uSJ/MFtndDmkpCxkDwETOvz+Tpw8keNpSbj/qNKmEFgqiqJsApRYmKVOvHgc=
X-Received: by 2002:ac2:4907:0:b0:4f4:af57:19af with SMTP id
 n7-20020ac24907000000b004f4af5719afmr640473lfi.2.1684737602225; Sun, 21 May
 2023 23:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
In-Reply-To: <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
Date: Mon, 22 May 2023 01:39:50 -0500
Message-ID: <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, May 21, 2023 at 11:33=E2=80=AFPM ronnie sahlberg
<ronniesahlberg@gmail.com> wrote:
>
> A problem  we have with xattrs today is that we use EAs and these are
> case insensitive.
> Even worse I think windows may also convert the names to uppercase :-(
> And there is no way to change it in the registry :-(

But for alternate data streams if we allowed them to be retrieved via xattr=
s,
would case sensitivity matter?  Alternate data streams IIRC are already
case preserving.   Presumably the more common case is for a Linux user
to read (or backup) an existing alternate data stream (which are usually
created by Windows so case sensitivity would not be relevant).

> On Mon, 22 May 2023 at 12:09, Steve French via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Looking through code today (in fs/cifs/xattr.c) I noticed an old
> > reference to returning alternate data streams as pseudo-xattrs.
> > Although it is possible to list streams via "smbinfo filestreaminfo"
> > presumably it is not common (opening streams on remote files from
> > Linux is probably not done as commonly as it should be as well).
> >
> > Any thoughts about returning alternate data streams via pseudo-xattrs?
> > Macs apparently allow this (see e.g.
> > https://www.jankyrobotsecurity.com/2018/07/24/accessing-alternate-data-=
streams-from-a-mac/)
> >
> >
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve
> >



--=20
Thanks,

Steve

