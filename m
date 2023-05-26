Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5ECD711E14
	for <lists+samba-technical@lfdr.de>; Fri, 26 May 2023 04:40:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jtyJ2YgemJB5j2IZr3EjuKVZh/s6jcvGUdflnfZ+1f8=; b=j+wPkH7PqLsg5md7k0QPr15E5Y
	gM8FPmeX+j5O5S8vYIUP8CafH37wBJSPxalx8zO0vznhqpTdM0cJk67drvtTh1dxf9Y1Iw0qTDVg4
	juwdWVvj+rQSZNLPEfsMtJdLbgICOxHKM78tBXtue7AiaYXKKfxuLaGrzYcZLVaydAUwbqnbQ9fkA
	qHFHI+9rMMrG4HMKMy0zjk1DX8I7CFkbWdShn9cPdRQPQcgJhjiJdLgXa7FyWAQQ5ZnB5XeDabVQU
	ctEQeI+ScQKHA3GAvDCy2zptjd0R2Ipk7hLHL5IfXFu/HEmaDWz2d/diJFyKdq2QQu0zkqMXJXypc
	3a5gcMcQ==;
Received: from ip6-localhost ([::1]:48822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1q2NMw-00CNdK-Cx; Fri, 26 May 2023 02:39:54 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:54676) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1q2NMr-00CNdA-El
 for samba-technical@lists.samba.org; Fri, 26 May 2023 02:39:51 +0000
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-970028cfb6cso38444866b.1
 for <samba-technical@lists.samba.org>; Thu, 25 May 2023 19:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685068788; x=1687660788;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jtyJ2YgemJB5j2IZr3EjuKVZh/s6jcvGUdflnfZ+1f8=;
 b=mbcAlGGi9k7xhOYbr+BXSFhuBD+0IsKpy/Bg5mE1NgD9HIRnXG1oHf/T+R9t3iXDpc
 zUiRURDM1xdKzqYkFK+ageoEHs/QwLIRtbbY8gS5YE+JQ0HV174Lw5i01kU2JqZWZY3s
 vEVdjyAn1Kx1QhLqAnqpOHB/WJLOGOhpaPXW/86OJryVpUXn+5hvURdBQDY6cb6gwO4g
 EIjkAR/yh6dSf+bwQqhDBoUgYSo5UStV92Id/ykQ3O2p/vlBGblgLpCkiftHsXH5ZFhK
 F1YEvkaTB6/HeiZdDeqqW9IOUOEKl/DJctQ+YxDr1pwMHyukNV7OlK6R6mBU5iZMwgGy
 fpGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685068788; x=1687660788;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jtyJ2YgemJB5j2IZr3EjuKVZh/s6jcvGUdflnfZ+1f8=;
 b=beG45zVxrDfZF3Dg1xn/hosy/rdjoNbLCFG1w9xWkuJb2DMh3pkho689SnsvmDFLCw
 l8qnF/xlAfcYPD2KYS2R/uAsgqEPbS4BMVm+ys+G11Qxk9PVizvSmHZaEGYzYr7HgQEv
 s5aJHvaJ7v1K+IvyUgsQtNLa1ZeTFVtojQl527Tx4GZEhKTLX2igXM4mei8ftg53b7Gk
 2rJmQwA/24QDx/iOiwplh+x2+EZt+SInUyD9rBgNDMD1IL99EhmAl1QRIK3/xWImV0DT
 gn90mHe5GbdxIZF0oEtd7r0vCDoQ11EVjECnu6ZYlbmDFkcspEfLLwZ8CNgce+Mwslpj
 45Yg==
X-Gm-Message-State: AC+VfDwPxwKfS4GFEPjBiUEp+n2/ZShAZZNfZUZIW6IXSWF7LHBlozFo
 Fdrexfz/koMQaRUgCTnzNf1Luj8OgVEiXkDyHsbaQL+b
X-Google-Smtp-Source: ACHHUZ4+iTpbTcNqomzeawaHoHLFhSykLas5JERcQKALdEQU1sHEdLuFvasBJFoOeUus1KQzDVS6HPZkUTYn4lbJNWs=
X-Received: by 2002:a17:907:26c3:b0:961:be96:b0e0 with SMTP id
 bp3-20020a17090726c300b00961be96b0e0mr597700ejc.73.1685068787993; Thu, 25 May
 2023 19:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mv8nAncg-f=Z5u8LkH4o7kfJLJdtoksYQgiguF7efKZkQ@mail.gmail.com>
 <CAN05THRKq9XPD11rBWXyTL_OGSh4pP6mQyufeW+xc+J3wvkMmw@mail.gmail.com>
 <CAH2r5mtJfSiQXBRUwv6zcR5rhG2Q-pCvjH+n+_SZmVQo1pMeVg@mail.gmail.com>
 <ZGuWhzP98U9Niog+@jeremy-rocky-laptop>
 <CAN05THRnHcZtTMLxUSCYQXULVHiOXVYDU9TRy9K+_wBQQ1CFAw@mail.gmail.com>
 <ZGzo+KVlSTNk/B0r@jeremy-rocky-laptop>
 <CAN05THQyraiyQ9tV=iAbDiirWzPxqPq9rY4WsrnqavguJCEjgg@mail.gmail.com>
 <ZG0/YyAqqf0NqUuO@jeremy-rocky-laptop>
 <CAN05THSWHq-3bJ5+tzZ==j9uGFGfbALw0FoLVa9UyucaZ92bGQ@mail.gmail.com>
 <ZG+JqEwIdPHmHhVa@jeremy-rocky-laptop>
In-Reply-To: <ZG+JqEwIdPHmHhVa@jeremy-rocky-laptop>
Date: Fri, 26 May 2023 12:39:34 +1000
Message-ID: <CAN05THQVK7O75NY8mts7J=n7V4PErWCNWkM8NfCNJTH7p=W2_w@mail.gmail.com>
Subject: Re: Displaying streams as xattrs
To: Jeremy Allison <jra@samba.org>
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 26 May 2023 at 02:15, Jeremy Allison <jra@samba.org> wrote:
>
> On Thu, May 25, 2023 at 08:57:18PM +1000, ronnie sahlberg via samba-technical wrote:
> >On Wed, 24 May 2023 at 08:34, Jeremy Allison <jra@samba.org> wrote:
> >>
> >> ADS - "Just Say No !"
> >
> >I think that is a flawed argument.
> >It only really means that the virus scanners are broken. So we tell
> >the virus scanner folks to fix their software.
> >Viruses hide inside all sort of files and metadata.
> >There are viruses that hide inside JPEG files too and some of them
> >even gain privilege escalations through carefully corrupted JPEG
> >files.
> >We fix the bugs in the parser, we don't "drop support for JPEG files".
>
> What is the use-case for ADS on Linux ? And don't say "Windows
> compatibility" - stories about your mother's advice about
> jumping off a cliff have meaning here :-).
>
> Give me an actual *need* for ADS on Linux that can't
> be satified any other way before you start plumbing
> this horror into the internal VFS code.

I think it is too late to stop alternate data streams from entering
the kernel. They, or their equivalents, are already part of the
kernel.
This discussion is more about how to unify these things and provide an
abstracted api that is common across all filesystems than each
filesystem having a unique way to access them.
Filesystems that have protocol support for this is NTFS (ADS), CIFS
(ADS), NFS4 (named attributes) and HFS (forks). there could be more, I
have not checked.
These four are probably the four most common filesystems in use today
(ignoring FAT) across all platforms so support for this type of
feature is pretty much uniquous.

I think what we want to do is to have a discussion across maintainers
of all these filesystems and see if there is desire to work out a
common API and featureset and how that API would look.
How that API would work and what it would look like is a question
worthy to discuss.
Solaris surfaced this feature via openat() but that is just one of
many possible implementations. A separate userspace library that
provides universal access to these streams using something else would
work just as well. The discussion should be on how probe interest and
work together to create a unified abstraction common across all
filesystems. Then later work on what exactly the kernel API to access
this would look like.

For use cases? Something as trivial as storing an icon for use by
graphical file managers would be a huge quality of life improvement.
Even better if it would be compatible with how windows explorer stores
those same icons.

