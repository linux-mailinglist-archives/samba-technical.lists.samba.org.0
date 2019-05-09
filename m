Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB60D18D25
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 17:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=F6Q/fnAeMeKQ/kTsgVaBOHzjAbukGxki9WPPwOdGTWc=; b=dC7WN8dCNvriKoMMpVV1qwhRsO
	XlcUsAWI9p5943afVplHPvaSHQVQZ2aZ4oqgs8x0D8WSb8yDR/F26qKoZS4ugMvFbI6fxaOAfvokd
	k09SkrhrV3/ZXcPws+mBavBnH5/xcTRFAVOxFoxuMF6Fu00mvLefFzoXwLdE5qjrkz4g4pWato0dm
	6wTHTX3LtXy4G0tzL2QjTQkyt6duJRd79mADF+YxJuNAV3bvq4F2o87BuQy39k4FWzcgS6ARKUtkl
	Zukh+7jIg/jCpvOCduLe4XqofajjycgIYUgEFbhgq8vOEKWgwgBNYGQbSBbPINTgp52bcHvVuqGoH
	ihbT+x8Q==;
Received: from localhost ([::1]:48354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOlAL-0035Os-Uf; Thu, 09 May 2019 15:41:01 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38623) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOlAG-0035Ok-D6
 for samba-technical@lists.samba.org; Thu, 09 May 2019 15:40:58 +0000
Received: by mail-pf1-x42a.google.com with SMTP id 10so1524597pfo.5
 for <samba-technical@lists.samba.org>; Thu, 09 May 2019 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=F6Q/fnAeMeKQ/kTsgVaBOHzjAbukGxki9WPPwOdGTWc=;
 b=dd2qZgAltIUcnvusQ75GR22yTuA0BLOfo6MNw1rHAPj92i1iEogULTrHL1FrIkG4we
 b+jfsDG/vqADQr6S67ko0BJ45AxvfNcf87x/j3Ti414SSK4fbuvsySuUQpMJrhxPHIq/
 dP32oS7953mD414ZnT6uqD/i+Ba4LrpZHY9d9K72ReY8RnickhRfHPLomNbB5zu18iG4
 hASA9izDFRGJhpG7FR7/dNu05J+Z0W/6QjU5jnVxZdTE9JM8+DHO08Yy/mLR2BbkSppq
 LHGVinm6rDWb78G9ctEdHVrsJ9cbo/OA7RgnUAfxBLRj7EPhIhD1KO5UywDEKn/4rdz7
 L49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=F6Q/fnAeMeKQ/kTsgVaBOHzjAbukGxki9WPPwOdGTWc=;
 b=qUaTIoPEj0lnHpp/K2i6fbgFTRxGjipkyxNeg591vGOUwQfJ9HJNNMUvFlAhZurWGX
 TUY5v1w1guLsO62u49UuKh43Lg6bHIzTUkIBQD30iK3GAgQuJWV9SXkEySoa+8e6OQIe
 SdtbPr7risRQZcaiBgsr/BRp0CZXJvvQwqF9lkXyfFwE5yUd//wB6QiV8M0T1O7wvY7n
 g50CW43nab8Xwa7uu95guRPP8NUaz25wqkSGpUtSpwIwLrAfb+82sdWZkHzGNJbBGmtA
 BBCNoXX+zltUOp8KnPvwj/TvwZG+bCNIFL+ZBfRGrBv7ohSqj98XF7eilfFBGwkWWbiI
 +bkw==
X-Gm-Message-State: APjAAAW1AICWS90vDUapxawHR6YFjgcZHBdU+k/uGBIrzeI/f25+nfsS
 +YsdOGkS9zd9Nd5hyo7p6t1Qi5NzfZAPNRP5Kfa/kg==
X-Google-Smtp-Source: APXvYqzAK4l3qC1QGxx9Z4Czy2fDHqBepIHkoo2zqaPIBsYJfatz5DZkgDwoguvvQvwVvnfLiVSBBO+X7J7i+3tJF+4=
X-Received: by 2002:a63:f806:: with SMTP id n6mr6482570pgh.242.1557416452877; 
 Thu, 09 May 2019 08:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190509131420.17d98c62@samba.org> <87a7fvbzwj.fsf@suse.com>
In-Reply-To: <87a7fvbzwj.fsf@suse.com>
Date: Thu, 9 May 2019 10:40:41 -0500
Message-ID: <CAH2r5mtknxvKiXmhJi5RcymzF14PPWLUGwCsYxfVeoTQAriFkg@mail.gmail.com>
Subject: Re: GSoC 2019: welcome Mairo Rufus
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
 Samba Technical <samba-technical@lists.samba.org>,
 P Mairo <akoudanilo@gmail.com>, David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yes - Welcome!

On Thu, May 9, 2019 at 7:02 AM Aur=C3=A9lien Aptel via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> David Disseldorp <ddiss@samba.org> writes:
> > I'm very pleased to introduce Mairo Rufus, who joins us as a 2019
> > Google Summer of Code student. Mairo is assigned the task of
> > improving the smbcmp network capture diff utility[1], and will be
> > mentored by Aur=C3=A9lien.
> > Please make him feel welcome.
>
> Welcome! :)
>
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Linux GmbH, Maxfeldstra=C3=9Fe 5, 90409 N=C3=BCrnberg, Germany
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 21284 (AG N=C3=
=BCrnberg)
>


--=20
Thanks,

Steve

