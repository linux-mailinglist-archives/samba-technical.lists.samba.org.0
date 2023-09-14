Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC0F79F98E
	for <lists+samba-technical@lfdr.de>; Thu, 14 Sep 2023 06:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=pjTSqbLlw0DxkGTtP+pAEjD0UvjEREvVPuj0OCOxZSA=; b=lQRyD3qMBW73Jauqpg0+cj1v+r
	P93D3t70mqVrf7ickvhJPH4u2vAcOzepCfisAeo0CKVfy+lhcSQ1RRL4ZiCpAQTbVSHpEjwInkcS+
	6qlvbdIi8HqZt9ulI9X+URlphkkaQi5vrzCktaRLjsrTVeUYvH8oZvxUfMrWi426a+MuQrjTuT1Vn
	OZwoCyH4ImKfy7AjZpjglNU5UESHv3hIz5jJ5SDDx01N0/SRiwU179vmXanj7UganM3kxbxw8mUhm
	ANvDWOvrX5xiGWiD5MovJPnVLRhmfvYVqTD9UR6GvGSqMdOCdXspkQrLa5GQudz6p1MrDoQWVWUgO
	s2Od/OSw==;
Received: from ip6-localhost ([::1]:45860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qgdtx-004DL9-1E; Thu, 14 Sep 2023 04:24:25 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f]:54577) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qgdtn-004DKd-Oc; Thu, 14 Sep 2023 04:24:19 +0000
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-502e7d66c1eso387724e87.1; 
 Wed, 13 Sep 2023 21:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694665451; x=1695270251; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pjTSqbLlw0DxkGTtP+pAEjD0UvjEREvVPuj0OCOxZSA=;
 b=sUIzt+cX2URaxqnZsoeYygjJyl0tUGf3t3g1oBdZ83ifcC/69a771iUYooOFCRXA0i
 O1XgbnGgP3ozADmzWe44cNmVdHa7vhBSepX9xQJVGFxH/DAPf3/DIM4GXHACIsoPNAsq
 exs4LjPKNinfYSra3FdjLHocrIUFLH204yWH+leem0trIHsdJOFy4YGfln/CojumrE7f
 DZWLyggiq8nIeOdCurn+EYV9Yv/97JcETg79AyDcgzE272TlsYzLWZBNIJWomahgPXYf
 ybpOZJk0lVtRXPaLhgzBrR3mv4eRoRzwdxOF+/di9SdLOiTMqswT5xMTBeDeK4aJYnrB
 iPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694665451; x=1695270251;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pjTSqbLlw0DxkGTtP+pAEjD0UvjEREvVPuj0OCOxZSA=;
 b=wBMxIAQ5VxO6nuVweWsj3GIKK14u3rEZY1o09wjdqpzi1xPirDeQsTJxDvWCvw63nJ
 DoY2gG/wMBIGlsNGa4gHSOA2jdlCOe00e44U9mUj3ljcAtGptlHKXB/XhPovAl2Vw0uf
 J/YjlajXRrBdTTX66gPI4/lR24ieYcq8/cPGl3zSn0JjkuFeqqkJa60isXhpdV85wqEO
 tEawGSXO08FeCyhmrpJ/o1kpJy5dLgw0ZYnLO8GbD00wcMp47f9VeC/3D1OBYTK4R5tM
 fh3omGImoS+pPtgkdosNx1LUVwzxuH6YOAx3v1WTHsxi8gmxmsxLu9FkGH0QMioZLsJV
 /oGg==
X-Gm-Message-State: AOJu0Yyr5j5oUKuSYV7ID7gHw8C7CV3IrHGLEc+b1D9XYfZrK4urrCH+
 wEB0UK5LaN5qQvjcRCX5o136BpZyP8tE7M5FzcUaaSSV/Zk=
X-Google-Smtp-Source: AGHT+IHu+VySCm4peF2cj9ob5IrC0iPnrxlEaz0rY5xRcwf+/2kiywy/F2dvQ/ps8LsaI7UwifjzFO6UiKGfgPFfxWY=
X-Received: by 2002:ac2:4c54:0:b0:500:7e70:ddf5 with SMTP id
 o20-20020ac24c54000000b005007e70ddf5mr4341699lfk.43.1694665450391; Wed, 13
 Sep 2023 21:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <ZQIxblLD35+k57+C@jeremy-HP-Z840-Workstation>
In-Reply-To: <ZQIxblLD35+k57+C@jeremy-HP-Z840-Workstation>
Date: Wed, 13 Sep 2023 23:23:59 -0500
Message-ID: <CAH2r5muvtBj-eKpL8bBVReLBjR3ZSHjzDgs8dUzLVGJGRika_w@mail.gmail.com>
Subject: Re: Samba Team member talks at SNIA SDC in Freemont, California, USA
 next week.
To: Jeremy Allison <jra@samba.org>
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Also am looking forward to this.   There will also be some talks (and
hopefully lots of productive testing) at the co-located SMB3.1.1 test
event

On Wed, Sep 13, 2023 at 5:03=E2=80=AFPM Jeremy Allison via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> There's a strong Samba Team presence at this year's Storage Network Indus=
try
> Association - Storage Developers Conference (SNIA-SDC) this year in
> Freemont, CA. Sept. 18th - 21st.
>
> Looking forward to seeing everyone there !
>
> https://storagedeveloper.org/
>
> Wed 20th we have:
>
> Reparse Points Current Status
> Volker Lendecke Developer SerNet GmbH
>
> Samba io_uring Status Update
> Stefan Metzmacher Developer SerNet/Samba-Team
>
> net use //samba/cloud: Scaling Samba
> Ralph B=C3=B6hme Samba Team Lead Samba Team / SerNet
>
> Advancing Access to Remote Files: Exploring Recent Enhancements to the Li=
nux SMB3.1.1 Client
> Steven French Principal Software Engineer - Azure Storage Microsoft
>
> Build FIPS into Your Storage Products
> Jeremy Allison Engineer - CIQ / Samba Team.
>


--=20
Thanks,

Steve

