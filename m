Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E9B1FBF15
	for <lists+samba-technical@lfdr.de>; Tue, 16 Jun 2020 21:36:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Cwin4rM90xx7A90ILpx9q05b/HkXQADpjPRgjfWeDlU=; b=qDtrKylaKyBlZv3DGrYsdJI0xB
	VR6BespWQfn+2ZHtrMmLNzrzMvWd0ofQq8aLoIhSBDVhkWI1lz7RsOtWtfXRywZIYRXG0Bub17xMw
	ItB030NX9zul/WNoTcP8F9OCWRW16Ms+uFJaSbP0AYt1Sk+TA8ZIkJj+6YMpAih3oh03eBaUVf3Yp
	9b9G4C4F/K8rgZK+MCkT2cuXugqP5P16KqI9fM01Fs+l+9McA7lr/Lz+Nx6FdXwcNcrrwCT0ycnUY
	b3XhODPtee19bmcJGcnuN6oUmkZKpJD0evA/WLmj16zuLzwiwueyTL1VlIDTQz1mbydNG8fsejA0r
	qQ6Ere1w==;
Received: from localhost ([::1]:22084 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jlHNX-000l6y-Hh; Tue, 16 Jun 2020 19:36:15 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44]:33060) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jlHNQ-000l6r-8K
 for samba-technical@lists.samba.org; Tue, 16 Jun 2020 19:36:10 +0000
Received: by mail-yb1-xb44.google.com with SMTP id o4so39348ybp.0
 for <samba-technical@lists.samba.org>; Tue, 16 Jun 2020 12:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Cwin4rM90xx7A90ILpx9q05b/HkXQADpjPRgjfWeDlU=;
 b=XaZNJMpllLj9SgsmtZ+lqJUHo0KXy6kSs0NyKpsgQhW+hObxXQQUda1CGW+ukeBVGk
 pIaSQEz9nrZ9vqpJDHOEwB5alQ0foiAVpjoqjYt0eubQ7Kr2hH6HxHEpnlgr3o+lAFl3
 gQt0ZrAjAccGGrwhv51mg7bi2B8a8HdyqI8zl4V7FxNcZWy79rErOatULjQHFLChSbN7
 wJ7eFFY3DJPYE8knqr39kovYupgdSF5nBjWbM4AXC8LrH7pzhG3Lj5QXkfnYQ2dD2GQr
 Gp2MsNkNABLpCD3a6kCe+gO4TzoONLKukdJlCkWzsI+Mw0cih3CvpOyI3C2Ye04aTGef
 h4HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Cwin4rM90xx7A90ILpx9q05b/HkXQADpjPRgjfWeDlU=;
 b=B74hgQ4ihRQMPtZ7Kmph++g5ccI8TR64Wx3BW88zLqM1Fyf90cz0sta0pTH6dN8okV
 Oh7FcvLAH6TV2wHIi8kwisBYWD7DBnlnw/30EZ8JvtejY044BeAPp5Ex7ncMy7DRQKV4
 nZQJjyP4iUTjNs+GNilOheMT9yDoI00JepbwQJVGcXP/EbtVd+z2L4SQ9WnDlL1E0s/u
 y7QPDqZwZfbJbx1Z8q8eBtXVK6mCcx/ldv1MQYOGJ6qbUz9V5NVI35efXiMn7be3llkU
 fMg1SlXMqGyFII1BBbWY9t7M7WcDU3eAJwvfavNvUdsnikgkzZchaVVUWo927+KCbgPM
 M6mQ==
X-Gm-Message-State: AOAM531XibNsFL8vCx6asFfn9oAJbP2SVZQvSyj/VRqTFl7nHAGJ5cmL
 cyI0W3usJFKwswBrSG/9veNem+p/RhIs2UCNfi0=
X-Google-Smtp-Source: ABdhPJzy8V0OHeGIv8WGHsfj6rOnMpwaHYCmQPuFrMNmYNU7wJrsNguRNRgcXkXB0pGgipkGkrGWa/W/Ab0RhmC9Cb0=
X-Received: by 2002:a25:bc81:: with SMTP id e1mr6573459ybk.375.1592336165086; 
 Tue, 16 Jun 2020 12:36:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200615224112.GA12307@embeddedor> <875zbri7k8.fsf@suse.com>
In-Reply-To: <875zbri7k8.fsf@suse.com>
Date: Tue, 16 Jun 2020 14:35:54 -0500
Message-ID: <CAH2r5mt-SYkFcq=73ES8eNi0LYKNctPFPe28x0SmBdf3gEwt5A@mail.gmail.com>
Subject: Re: [PATCH] cifs: misc: Use array_size() in if-statement controlling
 expression
To: =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>
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
Cc: CIFS <linux-cifs@vger.kernel.org>, Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 samba-technical <samba-technical@lists.samba.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Added the two reviewed-bys and merged into cifs-2.6.git for-next

On Tue, Jun 16, 2020 at 6:17 AM Aur=C3=A9lien Aptel via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Reviewed-by: Aurelien Aptel <aaptel@suse.com>
>
> Cheers,
> --
> Aur=C3=A9lien Aptel / SUSE Labs Samba Team
> GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
> SUSE Software Solutions Germany GmbH, Maxfeldstr. 5, 90409 N=C3=BCrnberg,=
 DE
> GF: Felix Imend=C3=B6rffer, Mary Higgins, Sri Rasiah HRB 247165 (AG M=C3=
=BCnchen)
>


--=20
Thanks,

Steve

