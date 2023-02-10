Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B88066924CE
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 18:48:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=qgcGO8+97UxFzUa9otLoe9WhcHYqh4IFJols7jxOVL4=; b=G3L/UV/IQv3jnQZ8QzW6xbj/Ue
	pavE/ADHUQ4GifCfyeJyqnvVoxEf3DBhtH5YzJXws41HzXtGEHqgc4FSWmcxU9si9BLlI2w+m248y
	YsY7hOutwhq2nLf8VB3r0duUhXp9wx9CKo6+bvcBJfgH5FE8ZtRNilCiUT/xbxJkYjLFSAzcil1QN
	AgdsAx/pOonFbJQGYwTZF0VtP7aKICRaHhyaCiQ9/769qz4nmjEIUe2a5yiGgMzpTHDw+rOfV9P2p
	D+PCcnku4WuPNtu8TBM2Fvy2X3Pan9w/NyzVbIkrI35ZbI8mMTBgwsTkOJ1m2jMaLugh4lvYO4hyL
	5csTYkVg==;
Received: from ip6-localhost ([::1]:38512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQXV3-00B3HE-Or; Fri, 10 Feb 2023 17:47:53 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40907) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQXUz-00B3H4-L6
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 17:47:51 +0000
Received: by mail-ed1-x534.google.com with SMTP id fi26so5322476edb.7
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 09:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qgcGO8+97UxFzUa9otLoe9WhcHYqh4IFJols7jxOVL4=;
 b=LPrqOkJVT4UEg85v/nAzVlpJ472gmcKMbYYeMraUOPgiYjqle9VbUDBs8e3Zm1gWBH
 WQRxTLfEGgHGfiMMIfID24IotHRUddIaw08CZd8coY3Et2DEy+b/r/ymu4POvA/PHwNn
 rJAnwEUqrti8kF2sB3Coh+mEuGxmaaVK+5Ue4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qgcGO8+97UxFzUa9otLoe9WhcHYqh4IFJols7jxOVL4=;
 b=E1ARargIxECyDZqajke4WuekICornjExl078hAO56UtHyfsZ/GuBmAdfrcGXVxNo6R
 ZTZjYxJq5r0RXB64Yo6SsLvr8YVn6vryWuQBKkXN2mwqBoxPJwqeGiEO/c3wWZi0mLuT
 aXQUx7gfh8UsIxtuMGAbNpTxrvuyYnyFNdU+V39/mjsSqWmRcCI/LigzsWSW2D/d3V+S
 hqeKUCbhiIgZR/hj9r5XpUiokUjpdnvWyqfrSX5oZyAvnJ5I4RqbEDYk5T67IF6sHwZg
 v8JpISq+k3/B2YICTcy1M/t994zYOoGraQ+wGMiHzARsrf4FYJaF5apoAmcdqy4wKbOA
 kuzg==
X-Gm-Message-State: AO0yUKU7v8jCgfTo8eGzuytwuBLqeRWAkC45fRpto8yTM6jet2oZHV14
 Rq4kcvNy6YglS6QY56NHTXwX2pDdLyirlSlEWag=
X-Google-Smtp-Source: AK7set95A0V/caBcmssBZpkiMmRDWX8EGJNo6rH0bIaEqbB0txxhVVXrNWgXDSUNuSUVw1mqLXVmmg==
X-Received: by 2002:a50:d4c6:0:b0:4aa:a571:bf38 with SMTP id
 e6-20020a50d4c6000000b004aaa571bf38mr16638811edj.24.1676051266794; 
 Fri, 10 Feb 2023 09:47:46 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com.
 [209.85.218.48]) by smtp.gmail.com with ESMTPSA id
 c25-20020a17090603d900b0087bd50f6986sm2689041eja.42.2023.02.10.09.47.45
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 09:47:45 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id gr7so17916731ejb.5
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 09:47:45 -0800 (PST)
X-Received: by 2002:a17:906:651:b0:88a:b6ca:7d3a with SMTP id
 t17-20020a170906065100b0088ab6ca7d3amr3101829ejb.1.1676051265120; Fri, 10 Feb
 2023 09:47:45 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <CAHk-=wip9xx367bfCV8xaF9Oaw4DZ6edF9Ojv10XoxJ-iUBwhA@mail.gmail.com>
 <20230210061953.GC2825702@dread.disaster.area>
 <CAHk-=wj6jd0JWtxO0JvjYUgKfnGEj4BzPVOfY+4_=-0iiGh0tw@mail.gmail.com>
In-Reply-To: <CAHk-=wj6jd0JWtxO0JvjYUgKfnGEj4BzPVOfY+4_=-0iiGh0tw@mail.gmail.com>
Date: Fri, 10 Feb 2023 09:47:28 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgXvRKwsHUjA9T9Tw6n5x1pCO6B+4kk0GAx+oQ5qhUyRw@mail.gmail.com>
Message-ID: <CAHk-=wgXvRKwsHUjA9T9Tw6n5x1pCO6B+4kk0GAx+oQ5qhUyRw@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Dave Chinner <david@fromorbit.com>
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
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 9:23 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> And when it comes to networking, in general things like TCP checksums
> etc should be ok even with data that isn't stable.  When doing things
> by hand, networking should always use the "copy-and-checksum"
> functions that do the checksum while copying (so even if the source
> data changes, the checksum is going to be the checksum for the data
> that was copied).
>
> And in many (most?) smarter network cards, the card itself does the
> checksum, again on the data as it is transferred from memory.
>
> So it's not like "networking needs a stable source" is some really
> _fundamental_ requirement for things like that to work.
>
> But it may well be that we have situations where some network driver
> does the checksumming separately from then copying the data.

Ok, so I decided to try to take a look.

Somebody who actually does networking (and drivers in particular)
should probably check this, but it *looks* like the IPv4 TCP case
(just to pick the ony I looked at) gores through
tcp_sendpage_locked(), which does

        if (!(sk->sk_route_caps & NETIF_F_SG))
                return sock_no_sendpage_locked(sk, page, offset, size, flags);

which basically says "if you can't handle fragmented socket buffers,
do that 'no_sendpage' case".

So that will basically end up just falling back to a kernel
'sendmsg()', which does a copy and then it's stable.

But for the networks that *can* handle fragmented socket buffers, it
then calls do_tcp_sendpages() instead, which just creates a skb
fragment of the page (with tcp_build_frag()).

I wonder if that case should just require NETIF_F_HW_CSUM?

              Linus

