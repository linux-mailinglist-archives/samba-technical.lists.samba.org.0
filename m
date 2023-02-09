Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C9690E8A
	for <lists+samba-technical@lfdr.de>; Thu,  9 Feb 2023 17:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Fy6WnIEU71GZIY+z6R8euSa0ykjzlE8UhDlJ4MZussw=; b=m6Hr/Le60GA0jNO1fqWPK+OLJQ
	yccuTnn43fCJCPD2Mdf6M1BgRnJjGsrQodnlEDsPuIJ9Nq1v/x3iGw0XJsBIUeIfdkhGU3t+PEY/0
	8JvW7FLDfvDqro4+nEab+ldReMRnCjdYB2G3YUh5TYuva3W/enlocQZZSavmZ6YmHlx3JfySYItvf
	eo+xAY2082fTCkhfcza+iabi5+TvYh6luq9zWBWyMBl1MDQ3zbH/R3UZd6ABfmOMpN+7QKVtSO+K9
	E+Bo+HITbRWcLFKSys38rqvfS/4vfKWFtnYmoMz5OzBhFLZHeTjgoZb1NhcqKDmQa2uUCxL7Bck5V
	942jIoew==;
Received: from ip6-localhost ([::1]:44860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQ9zD-00AQkO-Dp; Thu, 09 Feb 2023 16:41:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:44837) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQ9z8-00AQkF-Lw
 for samba-technical@lists.samba.org; Thu, 09 Feb 2023 16:41:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id bk16so2359420wrb.11
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 08:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Fy6WnIEU71GZIY+z6R8euSa0ykjzlE8UhDlJ4MZussw=;
 b=BE70cdxkY3AgPoEHUcFgMZpAC9ic7dlcWAKhGi3scRl1Pn7eiBcymtvC9zINwVF5N5
 itL5ACiOnUl+CIZkJGJ3QdHdvojuUGU7zpNOTC1z9XWJfGk2fkuZ0eCKWQsNGKhKiawJ
 x/XSTLzMhoiVWMdPVv3WV8MzmMnSahA8b0lYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fy6WnIEU71GZIY+z6R8euSa0ykjzlE8UhDlJ4MZussw=;
 b=DcyScjJM3BjFD9m8N71OT39V7SW3EG8WohnmRwGxTb+Ix0Z7fYGoJXOSObuirVj3ql
 D9fXH0fd9DmqGQKchgJaYAAsV/w+W2YaDUbW/ynymx4ZGnSlhcp06u1gEfXKhFH8lCt8
 M3P7fhirtOsal1gvqmgngSOr1lbkbvmpDQ8Cxnw3bSDLM/XLVbv2PXRXHVg8K2x3Try5
 cLQ62AWMGt9gAaa0+mfb1/ZcJUVmUJRdlnH69ZHfNm1v1sE1GOP+i9pvX1nlz6RUwZlM
 3MoZj/OT8HGIBpMIAj4+QM1sw+IUl0xexOXMzXV5IaVhidhOSr23ZIeW0fYtWhLFcrqL
 y8vw==
X-Gm-Message-State: AO0yUKWXIJBO0Wn1CMKqCY2ekbjNUj9l78tDa9XYJ+9CLJ8XwQRcFFMC
 6hy1cyT9Oziw1NeTfwcY9T9Jkq5gpnYfq+VOpy8=
X-Google-Smtp-Source: AK7set/8VPoevIBh8FwDQfXm5VMSveolBnX7sTIxq64s8Uys4pm0RyzgLV3sdooC89rU9h3x7OgJvw==
X-Received: by 2002:a05:6000:14e:b0:2c4:80a:e847 with SMTP id
 r14-20020a056000014e00b002c4080ae847mr3668585wrx.24.1675960880927; 
 Thu, 09 Feb 2023 08:41:20 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com.
 [209.85.218.43]) by smtp.gmail.com with ESMTPSA id
 n1-20020a5d4001000000b002bcaa47bf78sm1642415wrp.26.2023.02.09.08.41.20
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 08:41:20 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id sa10so8094007ejc.9
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 08:41:20 -0800 (PST)
X-Received: by 2002:a17:906:4e46:b0:87a:7098:ca09 with SMTP id
 g6-20020a1709064e4600b0087a7098ca09mr2346945ejw.78.1675960879649; Thu, 09 Feb
 2023 08:41:19 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
In-Reply-To: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
Date: Thu, 9 Feb 2023 08:41:02 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
Message-ID: <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Stefan Metzmacher <metze@samba.org>, Jens Axboe <axboe@kernel.dk>
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
Cc: Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Adding Jens, because he's one of the main splice people. You do seem
to be stepping on his work ;)

Jens, see

  https://lore.kernel.org/lkml/0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org

On Thu, Feb 9, 2023 at 5:56 AM Stefan Metzmacher <metze@samba.org> wrote:
>
> So we have two cases:
>
> 1. network -> socket -> splice -> pipe -> splice -> file -> storage
>
> 2. storage -> file -> splice -> pipe -> splice -> socket -> network
>
> With 1. I guess everything can work reliable [..]
>
> But with 2. there's a problem, as the pages from the file,
> which are spliced into the pipe are still shared without
> copy on write with the file(system).

Well, honestly, that's really the whole point of splice. It was
designed to be a way to share the storage data without having to go
through a copy.

> I'm wondering if there's a possible way out of this, maybe triggered by a new
> flag passed to splice.

Not really.

So basically, you cannot do "copy on write" on a page cache page,
because that breaks sharing.

You *want* the sharing to break, but that's because you're violating
what splice() was for, but think about all the cases where somebody is
just using mmap() and expects to see the file changes.

You also aren't thinking of the case where the page is already mapped
writably, and user processes may be changing the data at any time.

> I looked through the code and noticed the existence of IOMAP_F_SHARED.

Yeah, no. That's a hacky filesystem thing. It's not even a flag in
anything core like 'struct page', it's just entirely internal to the
filesystem itself.

> Is there any other way we could archive something like this?

I suspect you simply want to copy it at splice time, rather than push
the page itself into the pipe as we do in copy_page_to_iter_pipe().

Because the whole point of zero-copy really is that zero copy. And the
whole point of splice() was to *not* complicate the rest of the system
over-much, while allowing special cases.

Linux is not the heap of bad ideas that is Hurd that does various
versioning etc, and that made copy-on-write a first-class citizen
because it uses the concept of "immutable mapped data" for reads and
writes.

Now, I do see a couple of possible alternatives to "just create a stable copy".

For example, we very much have the notion of "confirm buffer data
before copying". It's used for things like "I started the IO on the
page, but the IO failed with an error, so even though I gave you a
splice buffer, it turns out you can't use it".

And I do wonder if we could introduce a notion of "optimistic splice",
where the splice works exactly the way it does now (you get a page
reference), but the "confirm" phase could check whether something has
changed in that mapping (using the file versioning or whatever - I'm
hand-waving) and simply fail the confirm.

That would mean that the "splice to socket" part would fail in your
chain, and you'd have to re-try it. But then the onus would be on
*you* as a splicer, not on the rest of the system to fix up your
special case.

That idea sounds fairly far out there, and complicated and maybe not
usable. So I'm just throwing it out as a "let's try to think of
alternative solutions".

Anybody?

               Linus

