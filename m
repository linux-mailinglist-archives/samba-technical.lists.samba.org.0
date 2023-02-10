Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F61692658
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 20:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=r61/0h5NTTq+Qoz9OXQLKuxfQJmXqVpaixbdP55tAzc=; b=WmauaQXHE1SgVOkUGMFVr1am7S
	2wkL/zw9ANlbTYm7RH4seQN8arhx69w5HOcTTGYWnp66QWi0XdiIw1OcJgZsgz9zzMNuWyIiXVzYq
	so34jIwcb9IdU0KKy2xuTIhhk32I1UpC9/w74yc+zpWGQbDM/Z0U/lqFEGyk/iAJ8ErDn2ktOP+fA
	aegtrHBsGgwxC5XQKqH9D/LqJGLQt3FguG2pXcaBpOfH2pSXCdhTBl/xoPV8eG90JRHASpErfCgOt
	1qNC7lJfCKMR3upoJaUeLqekll63CjRICzCCCiuJagaM4yuQ3pglZBWJQjplFLpFms/MmEvvMAZnR
	Oge/oYmA==;
Received: from ip6-localhost ([::1]:28686 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQZ5o-00B9Sp-Te; Fri, 10 Feb 2023 19:29:56 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:33551) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQZ5j-00B9OH-1O
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 19:29:53 +0000
Received: by mail-ed1-x533.google.com with SMTP id l12so5686864edb.0
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 11:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=r61/0h5NTTq+Qoz9OXQLKuxfQJmXqVpaixbdP55tAzc=;
 b=IAdLRQRIm/NXW+WeR+UYR2ZTsvGw0tN2PBRMeoFQUWHyntbQJr49WmKYDyvef9iYCp
 lUUb1ydt4R7bdgKIQp1NsqwNFy5yaD5bZK5PWeSLfJdZfj2Cqzk/kag9hbbtNtbhJf4N
 zm6LxZ2ObZ/VLq+NbgF57dtNvJBp8k5O0X+1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r61/0h5NTTq+Qoz9OXQLKuxfQJmXqVpaixbdP55tAzc=;
 b=S1ameZh9r9g/AogcYNBt/grSak5WRdKRgN8RfCEq0kMW9WSSjvASAgr/rRO/0VeUSt
 uKOH2JdDq0vzk36zaLZNQyBUNx15iwGUT4J3dj45bifwgmBl3rCHSJlpbgwfh1a6WaDk
 elbZNc8uu8dFvFsfDI+rEeL+xE+knEtyKASZHHeaawT2OjVAjWpMnd50voUOmwUpRYpw
 kn0pH1bKiRIJAsZKZq7B07020FaSbkejdKEM6MXUzHek5BBIGFq1uWkuwzsxxVJFQ+Uy
 tLgiHPjLli/enuskBp0C0RqPgPXaITo+zbhRh+CoPO98VK/p5m9yvaFelKzxZDVtNXcD
 fCJA==
X-Gm-Message-State: AO0yUKUUNcMppu+398iHTIzDHrelASDkjiR5D3356z/mHcgzkPEIlQJ9
 kN2c6CBlU0gZ+rdFBrTFOmn1civUfHmWH3DmklQ=
X-Google-Smtp-Source: AK7set94Ju3xUpZSIJOAZLxqmmrDup6W0quEJn9ulV10lrQF/tS/5Z84cDfevtXhn02QWRFBNVIBkg==
X-Received: by 2002:a50:9feb:0:b0:4ac:b3af:1e1 with SMTP id
 c98-20020a509feb000000b004acb3af01e1mr1297952edf.13.1676057389886; 
 Fri, 10 Feb 2023 11:29:49 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 t5-20020a508d45000000b004aaa8e65d0esm2686468edt.84.2023.02.10.11.29.49
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 11:29:49 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id l12so5686773edb.0
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 11:29:49 -0800 (PST)
X-Received: by 2002:a50:aad4:0:b0:4ab:4d34:9762 with SMTP id
 r20-20020a50aad4000000b004ab4d349762mr582230edc.5.1676057388706; Fri, 10 Feb
 2023 11:29:48 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
 <20230210065747.GD2825702@dread.disaster.area>
 <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
 <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
 <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
 <CAHk-=wjQZWMeQ9OgXDNepf+TLijqj0Lm0dXWwWzDcbz6o7yy_g@mail.gmail.com>
 <CALCETrWuRHWh5XFn8M8qx5z0FXAGHH=ysb+c6J+cqbYyTAHvhw@mail.gmail.com>
 <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
Date: Fri, 10 Feb 2023 11:29:31 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg2Mb4ZgRuBthw6O0KLhZNksGBQNs73386Gdg4gHny=XA@mail.gmail.com>
Message-ID: <CAHk-=wg2Mb4ZgRuBthw6O0KLhZNksGBQNs73386Gdg4gHny=XA@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Andy Lutomirski <luto@kernel.org>
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Dave Chinner <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Stefan Metzmacher <metze@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 11:18 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>  - and finally, I do think it might make sense for the networking
> people to look at how the networking side works with 'sendpage()'.

Put another way: I do not believe that it is at all fundamental that
you can't send data from an changing source over the network. That's
likely _particularly_ true of the people who care the most, and who
already have network cards that do a lot of the heavy lifting for you.

So why spend a lot of effort to stabilize the data, if it's not
needed, when the primary users of it would likely not want that
performance hit and extra work in the first place?

Then making that "strict mode" be the only mode going forward and just
disallowing people from doing the simple thing sounds particularly
wrong.

For example, it may *literally* be that the IPV4 TCP case could be
fixed with something trivial like this

  --- a/net/ipv4/tcp.c
  +++ b/net/ipv4/tcp.c
  @@ -1134,7 +1134,8 @@ EXPORT_SYMBOL_GPL(do_tcp_sendpages);
   int tcp_sendpage_locked(struct sock *sk, struct page *page, int offset,
                        size_t size, int flags)
   {
  -     if (!(sk->sk_route_caps & NETIF_F_SG))
  +     if (!(sk->sk_route_caps & NETIF_F_SG) ||
  +         !(sk->sk_route_caps & (NETIF_F_HW_CSUM | NETIF_F_IP_CSUM)))
                return sock_no_sendpage_locked(sk, page, offset, size, flags);

        tcp_rate_check_app_limited(sk);  /* is sending application-limited? */

which would basically make hardware that can't deal with the data
changing under it just fall back to the "safe and slow" model on its
own.

But then hardware that doesn't care would "just work".

See what I'm saying? The above patch may be garbage because I don't
understand the network driver rules fully, so don't take the above as
some kind of "last word" on this AT ALL. But I'm just saying that
requiring stable sources doesn't necessarily make any sense at all.

              Linus

