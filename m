Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0443F2695
	for <lists+samba-technical@lfdr.de>; Fri, 20 Aug 2021 08:00:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=48Hb/Qgy2m5wWev5VsfncYKR1cJzadSWEDW/hiW1JKE=; b=jfCrrowYXnuaM8d4scUyhGrSXM
	NQoYoXWGoe/dmBq+Ob5utV7ce2X3Ee2qkeF1sAVW3ezIVn+mBUU7gO1RLLNMshVriS6ZbBh8oCbdo
	DxvsJHn/enYMVEKHK324jn0c2J2a9S/6xZQXRPkHVOfjxc2i7Jx+3++Zg1y+whWWvHGKq+zRGsD+I
	HdXRuwX3y5Ol9lvxfxnDEuZIr2nEE0CTf/GmaZsNNaVRLDemx7L83XwrpZqLKddjin554XUJw1V9H
	9I8qK6We9zNpJWh6ozL4MwVY83tbA23T69hHByzCEeLs7jcjdO1bWR7pvzMgwx4ZUWwJ1XAmP1bgV
	ghw9990w==;
Received: from ip6-localhost ([::1]:61018 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mGxYc-0086mM-4V; Fri, 20 Aug 2021 05:59:10 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230]:34569) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mGxYV-0086mD-9h
 for samba-technical@lists.samba.org; Fri, 20 Aug 2021 05:59:05 +0000
Received: by mail-lj1-x230.google.com with SMTP id f2so15485557ljn.1
 for <samba-technical@lists.samba.org>; Thu, 19 Aug 2021 22:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=48Hb/Qgy2m5wWev5VsfncYKR1cJzadSWEDW/hiW1JKE=;
 b=uU6/WcBRyLDu0UTuJ8Px/JqtCnevMORcSNmDk1Xqt0LVStFW3tSw6p+WwlTt7j48Wk
 hlJ6rviDndHRe9M8CyNHjlCDqvPtc3wsKEaDKi4lcmDG02yRpq6QgDrVo41ApjAYeNuw
 CV5jcXpcEBBy9Zf7ilQd7SqCEHtOjD82AkPGc9fN8EdAnhf3z8rmoxfwo+h6Sf+r26kU
 DUaCMI7TACT7qoWCB3+6xDBE/p3ty5dIkel8Vm+WWENUNrzFlxRGgILdfMx69jYjn3I7
 FvcOmHHMFA6+uHEopjdtF86P0Um69G3GtgJCW9ZTRFwzFEr4Ga0UgwaUZy4TK4GdDi2+
 PtTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=48Hb/Qgy2m5wWev5VsfncYKR1cJzadSWEDW/hiW1JKE=;
 b=uVOC4LwD4/LUDZa+cF9wkjtzujB45jXCADfAzyAyntdym9OotK9L4EjIE8swQrtKn0
 Uksetrrajz3p6/P3C1Hcl+ThxCaGn7gdDjeF7s4BCjwrGWl/mAMqqsThGbYDgq6P/bYU
 n/axsaTrf0Qkeoj0vzN251y3tQamhIEDbUQsvXDhhhgM2bJbTSvmFyXteK5xfT+J465r
 I42LK+1ArWL3kc3i+9PSmUtdH2jlaYKSEkLm3B5mMQkfhATrC96S1RozOcPkgOgMddeL
 p0Y9GSlaVV7pMUjxY3+n6skOLDvBoieB4zY4dDgbLhg3df+rYpAojs6/f1LuLYw8ogjc
 MNng==
X-Gm-Message-State: AOAM532SD1JV5zHevIlCV+pFr3vzWdGGLfDQJXDFqdKldsQTEIRj23hr
 phMDSnkXus0ijbpi2Sco6AVf3RLFOt87mA7o5OE=
X-Google-Smtp-Source: ABdhPJxJFkEicXBCXcmKO2Qb4x3gTqTvh9KLsu8FLi/awHbRkJtOze0bMErSZYFBjVjGftgdeiVuv7cPIHgvjUQMktI=
X-Received: by 2002:a2e:2417:: with SMTP id k23mr14866266ljk.256.1629439141581; 
 Thu, 19 Aug 2021 22:59:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210817102709.15046-1-len.baker@gmx.com>
 <2f3a644e279a8a0933343339fa0add8e76276bf8.camel@kernel.org>
In-Reply-To: <2f3a644e279a8a0933343339fa0add8e76276bf8.camel@kernel.org>
Date: Fri, 20 Aug 2021 00:58:50 -0500
Message-ID: <CAH2r5msKF-YZsmWEwqZZEn2ibooEOtFm7khvSnhD9uOidNycew@mail.gmail.com>
Subject: Re: [PATCH] CIFS: Fix a potencially linear read overflow
To: Jeff Layton <jlayton@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
 Suresh Jayaraman <sjayaraman@suse.de>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Len Baker <len.baker@gmx.com>, linux-hardening@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Added RB and repushed to cifs-2.6.git for-next

On Wed, Aug 18, 2021 at 8:22 AM Jeff Layton <jlayton@kernel.org> wrote:
>
> On Tue, 2021-08-17 at 12:27 +0200, Len Baker wrote:
> > strlcpy() reads the entire source buffer first. This read may exceed the
> > destination size limit. This is both inefficient and can lead to linear
> > read overflows if a source string is not NUL-terminated.
> >
> > Also, the strnlen() call does not avoid the read overflow in the strlcpy
> > function when a not NUL-terminated string is passed.
> >
> > So, replace this block by a call to kstrndup() that avoids this type of
> > overflow and does the same.
> >
> > Fixes: 066ce6899484d ("cifs: rename cifs_strlcpy_to_host and make it use new functions")
> > Signed-off-by: Len Baker <len.baker@gmx.com>
> > ---
> >  fs/cifs/cifs_unicode.c | 9 ++-------
> >  1 file changed, 2 insertions(+), 7 deletions(-)
> >
> > diff --git a/fs/cifs/cifs_unicode.c b/fs/cifs/cifs_unicode.c
> > index 9bd03a231032..171ad8b42107 100644
> > --- a/fs/cifs/cifs_unicode.c
> > +++ b/fs/cifs/cifs_unicode.c
> > @@ -358,14 +358,9 @@ cifs_strndup_from_utf16(const char *src, const int maxlen,
> >               if (!dst)
> >                       return NULL;
> >               cifs_from_utf16(dst, (__le16 *) src, len, maxlen, codepage,
> > -                            NO_MAP_UNI_RSVD);
> > +                             NO_MAP_UNI_RSVD);
> >       } else {
> > -             len = strnlen(src, maxlen);
> > -             len++;
> > -             dst = kmalloc(len, GFP_KERNEL);
> > -             if (!dst)
> > -                     return NULL;
> > -             strlcpy(dst, src, len);
> > +             dst = kstrndup(src, maxlen, GFP_KERNEL);
> >       }
> >
> >       return dst;
> > --
> > 2.25.1
> >
>
> Reviewed-by: Jeff Layton <jlayton@kernel.org>
>


-- 
Thanks,

Steve

