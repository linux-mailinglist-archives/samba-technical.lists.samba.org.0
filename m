Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFCC31A104
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 16:00:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=htU0zjpCEzn/Uq10KLpo487cmC1bvAxeSS2Wqr5wFJ8=; b=yvtRI10HtZ/RpbWaNZQOXB1O4V
	OgGtd6D0YF/FPI3Cdtw5+uBYjPJLv8mqaSz5CrtmA0GCoAavvbMqt+xEQ/V0hhOP4AT2F3E7LCCbw
	Ya34uZ6d0VqECpSZo6EshJuvVbFRJQQ1fqaQF9qeZepKRJ+/OJQYmV35JcAs2WIbvfek9ZONnOJY4
	JnCsFNhkIDVQH5bvnaphf+7zju0B8lb1p45HdXqYChT7GwG5WLSNDHh0cMO/HbkmF3S+/6Dhbd8vF
	zfp1Dzvwla/EccazQGnS1FxJVxtwXMCUN5HN3pC6WfK7MgeyuPkAT+5kag8NjIVIl9dZv1678JwOP
	20pFrIPA==;
Received: from ip6-localhost ([::1]:35132 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAZvK-00CPfZ-EJ; Fri, 12 Feb 2021 14:59:58 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:42048) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAZvE-00CPfS-D4
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 14:59:54 +0000
Received: by mail-ej1-x630.google.com with SMTP id z19so2895575eju.9
 for <samba-technical@lists.samba.org>; Fri, 12 Feb 2021 06:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=htU0zjpCEzn/Uq10KLpo487cmC1bvAxeSS2Wqr5wFJ8=;
 b=FpA2CiMSu5BbIujvy7SCEKr/sk0Qt0U14VD9KPYT+QArRYzYNRSXqQsmOHe3OfXuS4
 hlegiCXnfn8bg0XA0wKs3r8fP3hWFU9Iwh3VdUPGgQJqSCgZ9tq/tz7IyhRu/Ec1pvWJ
 zgIjIsxouUWBGrjnYtJK6VFW1GawEFMxrQMjrSlQ08Ie8BX2DJzC1KXvsoHbw+tS2hC7
 OanLneXAkBkLst/SWuMCDEzkGGM/9QrHT/ZfmJB3Q8rMKjyajiJB6cvFRl1Jxk/DLvve
 2MuRs1zKS8T6/iRbxiAegl6DMp68L4LexMdeMPAG/UZsKinrPzDt9Rj7xjiCu/TKKg8p
 MlaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=htU0zjpCEzn/Uq10KLpo487cmC1bvAxeSS2Wqr5wFJ8=;
 b=ExKAoGHKXtc5OY0kZ/N+JreTf7mw/WauubYp9/gk9iRUfm9veDGRalNjy2vqN15rmf
 JawmdIv/m3TmefTRWadbOfMgU3EEU+WKhYTr+6k0V/7Lc58+3jYrNxaQxwnQQ9gsLhrU
 ssodOYUaOXcSbESNJdo37000RoP0QQ0uyxwGtc3aZxDXlazUOQSJV4lujTxBV9oT+uOI
 CXCJaK0KGC4tfUgF5Rtk8SeSDNm/xVa7Pzvg+IaoAHG+ozAz23afkiFgUG7c9krYTPWw
 0jmMmGsrEtZUB572qDRmyjSCoQtPsuY8rbi9Wzc6mJWS3iS0EUKQXWhivcwJpHhPXsVu
 pQLQ==
X-Gm-Message-State: AOAM530rkjrc00u2wvtM/5wClsfQ+J/kMbpa6dEjJWDt1Ol8SnWlESEw
 IP2gc3//O6KKgxhFE7zqR4tNdRbPuOO/VSfmk/Y=
X-Google-Smtp-Source: ABdhPJwmEE/6Yq4hhgXRnAO9lTntwol3vd8vKBspU1QqdLZI43tKzm/Fbvch1jVZOJQ9wUKxxVo8wc9uGsAfqGBx0JA=
X-Received: by 2002:a17:907:28c9:: with SMTP id
 en9mr3427782ejc.314.1613141991047; 
 Fri, 12 Feb 2021 06:59:51 -0800 (PST)
MIME-Version: 1.0
References: <CACyXjPzHUBDqMsnGgdenSQJ4xd5c41gzq2+7vv9qkXRe_HZsaw@mail.gmail.com>
 <20210212074405.GV5029@pinega.vda.li>
In-Reply-To: <20210212074405.GV5029@pinega.vda.li>
Date: Fri, 12 Feb 2021 06:56:44 -0800
Message-ID: <CACyXjPynprRQMhfFSAOcn96Xmzn=_LwTA7-Y==OR9aKAHYKB=Q@mail.gmail.com>
Subject: Re: Building Samba 4.14 on CentOS 8.0 and gnutls
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 11, 2021 at 11:44 PM Alexander Bokovoy <ab@samba.org> wrote:
>
> On to, 11 helmi 2021, Richard Sharpe via samba-technical wrote:
> > Hi folks,
> >
> > I am slowly getting Samba to build.
> >
> > The latest problem I hit is this:
> >
> > -------------------
> > Checking compiler accepts ['-Wno-error=3Dunused-result']
> >                          : yes
> > Using in-tree heimdal kerberos defines
> > Checking for GnuTLS >=3D 3.4.7
> >                          : not found
> > ---------------------
> >
> > However, what was required was not gnutls (which was already
> > installed) but gnutls-devel.
> >
> > How can this be fixed?
>
> By installing corresponding development packages. Almost all checks in
> that configure check do check for a presence of development parts of the
> packages, not just binary libraries. Please follow instructions as
> provided in the other response.

Sure. I eventually got it to build, but my complaint is that the error
message was misleading ...

> Perhaps an easier way would be to install 'yum-utils' if they are
> missing and do
>
> # yum-builddep samba

Hmmm, learn something new everyday.

> That implies you have source repositories available (they'll be
> automatically enabled for this specific operation) and it would pull
> a list of packages required by the source package.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

