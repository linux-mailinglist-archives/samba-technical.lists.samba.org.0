Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF19B00732
	for <lists+samba-technical@lfdr.de>; Thu, 10 Jul 2025 17:40:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=xwmmSe+SXPkck3O+yxl/c8nb2tEFTB72YBzZoRYHhOM=; b=KTbv1S9CP2xbY/927cOgwI+KR7
	K1vF7pNqm8NwGl20L9+GcpGHvBGTDLc64cGGCk7dvuxW6E9Ii2Hb5BE3tgWhPO/caCxLJJ/41TMxP
	OJzIEq5+8pkEJCwpq/fSgPZTba2k1EmmDZzZitmSxps58FtH5j/N0GzHiydCsuoTxh6+w32HRCRIn
	hUmgEn/jloJ0qfxHIHuNBLHsrNMmS3Zn79psVgP7MQ61ZDvdYH9n5ZNIZhJuNgRk7RVEFxQ/1+SH2
	18KIS1ZWGJvKwpgOEz4N0ngg6IvoxR4LmELwIjD+SnVICOPbO6ulFd/zOluB61HhGNR+wTqqcdNCZ
	thhK/Shw==;
Received: from ip6-localhost ([::1]:18686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uZtNX-00Awa2-05; Thu, 10 Jul 2025 15:40:07 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:56730) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uZtNS-00AwZu-Rg
 for samba-technical@lists.samba.org; Thu, 10 Jul 2025 15:40:05 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id
 6a1803df08f44-6facf4d8e9eso10167696d6.1
 for <samba-technical@lists.samba.org>; Thu, 10 Jul 2025 08:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752162001; x=1752766801; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xwmmSe+SXPkck3O+yxl/c8nb2tEFTB72YBzZoRYHhOM=;
 b=LWXP82IB+kajLJIMYo870D70CJVsWNuuMtNUy1ytyD21GySHXkun08++K/0N49O0FH
 1QfxgXgzAw3I1TmdWnW3nXSgHcn6vWJgxUGE26DPtmiyzzF7Z0Al48uVGieT/cE+qHun
 32nPtRE+4sFXCzZhgCuU70O8ta/5ndi/zE4bAyRCyhSLzi3FgBhzELdaY5vzuwc+jmzD
 Y02qmFjrsg+aUdYE43ZI3SKiUNEB1e+afdEs3FwjyAVcSSXNrZor/adI2Ls38I3voHvy
 Q0PElcP5HwTlZNyDhZt4KX+rR0kAnhzs93BXRTV8eO2nh4ce4hpfpzXfIOPSOmTG5iTB
 Dk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752162001; x=1752766801;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xwmmSe+SXPkck3O+yxl/c8nb2tEFTB72YBzZoRYHhOM=;
 b=w2KmBVQQl3oNJ5WvLauMzoikzzB0f/aQQqYqdZ9s6uB0mHpqnzfyBepF0nZQOZ0lSf
 pG/PGUOwz3Zen0+hLfru05ns8Y8g9Z0thPxe9N+BR7oJtcY+b2R2ARmTQob4Dgn+hRk4
 3emXIdlkLTZ8Arm/3cgloujVpvw67IiZC6MkWu+g5eRq7V/CGLJCKWTEDsMFukVHvPhA
 7nZdjlbaDCMwVWksjPBEy+IiSfDw4lih6mRlVmKqoqbJkD38WiWd6tPgdcwN8Qf6Zxsz
 mHq1zaIW+4P/fWIkGuJceitmVfr7POpA5INGGI6nqTYepEcz74P0JnEa/dCKstAfKb5p
 sUtQ==
X-Gm-Message-State: AOJu0Yw/ZsVISUgdZl0lWkYDjQ7emtA9e6LmccDmmj6byumj9FKgJLgc
 tjn2/oro5QgiKvHcJj+UqWFiZkRTkIw7IUEjqM2JCp8KMNja5ja7WdjN1VB1alxA0XBQ5FAXzcF
 IlEjeX+MsMTFlrc7XqvNuP24EdiFqwE+QSAJeaq0=
X-Gm-Gg: ASbGncs3C9YejloD4H/2PMKVy90UioeQJghY2UMd0JjZWCV2E2jnYjcW/vZ5yDnHnqN
 q7en+52zDmU1YmZftdfUgCHVBlhH1GmGBOySkH90tOtFWYVCuVJgWk037rJPFxzD194JguX+HiP
 lETTUEHu9bOpFDXDtxQmtYJo+8L85dbTt/Jj+q23TnVHZGBRQTaiZel8qn46PDHF14/phRNbOEK
 S/3p734DyrBDg==
X-Google-Smtp-Source: AGHT+IF8ACpfrEVvITBeXNg4R2eHfLleAcTpBx6xR0liwaCuJEWC0DhpS0iPDTt1fB5sdqwj4m6mulwdANHKZw4Y+P0=
X-Received: by 2002:a0c:f092:0:10b0:704:9bc2:be36 with SMTP id
 6a1803df08f44-7049bc2be9fmr25796316d6.7.1752162000654; Thu, 10 Jul 2025
 08:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms7pSZaPEwTYUh17+be5xCrLfSuP1WNaADaxnfCBC8yTw@mail.gmail.com>
 <aG/VXM1ajVk5dLRN@toolbx>
In-Reply-To: <aG/VXM1ajVk5dLRN@toolbx>
Date: Thu, 10 Jul 2025 10:39:49 -0500
X-Gm-Features: Ac12FXyCz8S7GfZfWfya2t7RJPd3j0c_93urkq8ZHVpso9CmXUQwAw8_ooGsJ2s
Message-ID: <CAH2r5msxeSLdwgX4ba-b4y7AvMrw-UHwEcv+Wh2kY_EvqE+m3A@mail.gmail.com>
Subject: Re: out of date man pages
To: Alexander Bokovoy <ab@samba.org>
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
Cc: Jelmer Vernooij <jelmer@samba.org>,
 samba-technical <samba-technical@lists.samba.org>,
 Bharath SM <bharathsm.hsk@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Since cifs-utils is hosted on samba.org, probably should figure out a
way to post man pages somewhere for them on samba.org

cifscreds.rst   cifs.upcall.rst  idmapwb.rst     pam_cifscreds.rst
smb2-quota.rst
cifs.idmap.rst  getcifsacl.rst   mount.cifs.rst  setcifsacl.rst     smbinfo=
.rst

On Thu, Jul 10, 2025 at 9:59=E2=80=AFAM Alexander Bokovoy <ab@samba.org> wr=
ote:
>
> On =D0=A7=D1=86=D0=B2, 10 =D0=BB=D1=96=D0=BF 2025, Steve French via samba=
-technical wrote:
> > How do we update the VERY out of date man page on samba.org
> > (https://www.samba.org/~ab/output/htmldocs/manpages-3/mount.cifs.8.html=
)
> > which looks like it is many years out of date?
>
> This is not even a page you should be looking into. :)
>
> https://www.samba.org/samba/docs/man/ is the link. It contains current
> pages rendered from git master and each release.
>
> We do not have mount.cifs(8) as a part of Samba man pages anymore, for
> very long time. It is part of cifs-utils and cifs-utils is not published
> on samba.org.
>
>
> --
> / Alexander Bokovoy



--=20
Thanks,

Steve

