Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 410616917AC
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 05:47:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Cvwfcddns9wEYGMGsoiElla/fMiugMdLW+ZU2vKhB7Q=; b=282Y18WSierK3DcWQfKszuIVpU
	4vbtAdByIkz8lkLf/AxbLujD9O/umc6yuC0C3tisWY8FSCYxOBQ5dGHED7woxUkpUvzp+vHtrmIpz
	xOQ8RbS2OgXFOwgp4ZOIRJExjU0f1iCF2Vwy60twbxwTDFMVy9/d21TcYZsS7zOKrsida/pCbZYLI
	99KKXG0cEbyb9/xpfhDsUffBc7HWE/wZvkbqY4gB36y0efKXFWIWAokN4uSPmkYDFmhHoIsKt/VRw
	BQCUbSrpRIqRZJuYsDybsvoWOsClxOubodK/xs8pchPweIUaDI5jVK4ZEwWisn3qVgqMKVNlmda8z
	yGDy3OhQ==;
Received: from ip6-localhost ([::1]:25666 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQLJr-00Adjc-6b; Fri, 10 Feb 2023 04:47:31 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:39873) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQLJm-00AdjT-KO
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 04:47:28 +0000
Received: by mail-ed1-x52b.google.com with SMTP id eq11so3822442edb.6
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 20:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cvwfcddns9wEYGMGsoiElla/fMiugMdLW+ZU2vKhB7Q=;
 b=M9jqvy9vqZ7GIvN6X0r0tJPRyNR5XsTBKWs09APkXPouATgMG65O1fuTD3jATxsfcO
 Gysz8LgLqGc+GXmEgZ5girBmCfhrAfMolnWCqDSAvI42pkfVsZE28km43Yn3Tgr1ltQY
 uAos7n6XK3oEQ5ve/fwxQ53u1Uz9Wz2cNjh+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cvwfcddns9wEYGMGsoiElla/fMiugMdLW+ZU2vKhB7Q=;
 b=oBZJXJWkJplvnCW0oAajZBd+S+DJjgsJ0qAWtvV45pqxqcwcScxPj0KtyPsgIjENKT
 pNWwGXGin4Sd1gqQan3Gh5bSx7o62NDmnUEdYX7adEw5It8O87p4v4pNK6M9GKQ+OxXr
 3MGs/b0e0bm9gCIMJgbHoICcATuvtst28yc6hlFFAh6STDnZ1FbV2mUfR9/KtMcNL9tJ
 S/NBkonQZ3Z+eeWscN0JMsRURh+7UKZN6CnIZHp7vUYDYa2rQM+/eatVfaQIQ6F7R/p+
 EoNTs2k1Zr7eXeQwnqRSswK0Hjuv8gNVyF7huksYUAgYVZ5B3H/9v57JSapsvaowoFtZ
 wxng==
X-Gm-Message-State: AO0yUKX0XYjUscQoVcskSFePbzH97GcauLmpxF6+eGKhGx2SVdF8Ex5D
 U983FRhkucBVbnA5FRze3lkFzNguPxVj3lgp7PI=
X-Google-Smtp-Source: AK7set+RlNC1XB3szZwKBBE1Fsw3Qp9sMkSSgtlXTi5naCaPA+J3jG6pSiraQ1YiSMk7pwcnLwBMxQ==
X-Received: by 2002:a50:d4c6:0:b0:4aa:a571:bf38 with SMTP id
 e6-20020a50d4c6000000b004aaa571bf38mr14520127edj.24.1676004445347; 
 Thu, 09 Feb 2023 20:47:25 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 s6-20020a50d486000000b004aab36ad060sm1642180edi.92.2023.02.09.20.47.24
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 20:47:24 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id d40so2574222eda.8
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 20:47:24 -0800 (PST)
X-Received: by 2002:a50:cc99:0:b0:4ab:66f:6de0 with SMTP id
 q25-20020a50cc99000000b004ab066f6de0mr2073831edi.5.1676004444332; Thu, 09 Feb
 2023 20:47:24 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
In-Reply-To: <20230210040626.GB2825702@dread.disaster.area>
Date: Thu, 9 Feb 2023 20:47:07 -0800
X-Gmail-Original-Message-ID: <CAHk-=wip9xx367bfCV8xaF9Oaw4DZ6edF9Ojv10XoxJ-iUBwhA@mail.gmail.com>
Message-ID: <CAHk-=wip9xx367bfCV8xaF9Oaw4DZ6edF9Ojv10XoxJ-iUBwhA@mail.gmail.com>
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

On Thu, Feb 9, 2023 at 8:06 PM Dave Chinner <david@fromorbit.com> wrote:
>>
> So while I was pondering the complexity of this and watching a great
> big shiny rocket create lots of heat, light and noise, it occurred
> to me that we already have a mechanism for preventing page cache
> data from being changed while the folios are under IO:
> SB_I_STABLE_WRITES and folio_wait_stable().

No, Dave. Not at all.

Stop and think.

splice() is not some "while under IO" thing. It's *UNBOUNDED*.

Let me just give an example: random user A does

   fd = open("/dev/passwd", O_RDONLY);
   splice(fd, NULL, pipefd, NULL, ..);
   sleep(10000);

and you now want to block all writes to the page in that file as long
as it's being held on to, do you?

So no.

The above is also why something like IOMAP_F_SHARED is not relevant.
The whole point of splice is to act as a way to communicate pages
between *DIFFERENT* subsystems. The only thing they have in common is
the buffer (typically a page reference, but it can be other things)
that is getting transferred.

A spliced page - by definition - is not in some controlled state where
one filesystem (or one subsystem like networking) owns it, because the
whole and only point of splice is to act as that "take data from one
random source and feed it in to another random destination", and avoid
the N*M complexity matrix of N sources and M destinations.

So no. We cannot block writes, because there is no bounded time for
them. And no, we cannot use some kind of "mark this IO as shared",
because there is no "this IO".

It is also worth noting that the shared behavior (ie "splice acts as a
temporary shared buffer") might even be something that people actually
expect and depend on for semantics. I hope not, but it's not entirely
impossible that people change the source (could be file data for the
above "splice from file" case, but could be your own virtual memory
image for "vmsplice()") _after_ splicing the source, and before
splicing it to the destination.

(It sounds very unlikely that people would do that for file contents,
but vmsplice() might intentionally use buffers that may be "live").

Now, to be honest, I hope nobody plays games like that. In fact, I'm a
bit sorry that I was pushing splice() in the first place. Playing
games with zero-copy tends to cause problems, and we've had some nasty
security issues in this area too.

Now, splice() is a *lot* cleaner conceptually than "sendfile()" ever
was, exactly because it allows that whole "many different sources,
many different destinations" model. But this is also very much an
example of how "generic" may be something that is revered in computer
science, but is often a *horrible* thing in reality.

Because if this was just "sendfile()", and would be one operation that
moves file contents from the page cache to the network buffers, then
your idea of "prevent data from being changed while in transit" would
actually be valid.

Special cases are often much simpler and easier, and sometimes the
special cases are all you actually want.

Splice() is not a special case. It's sadly a very interesting and very
generic model for sharing buffers, and that does cause very real
problems.

            Linus

