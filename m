Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C32C692899
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 21:45:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3ouszKA6QqICt+YxGce9SY3oz4SsHUe9oFN+JOLlH88=; b=YaKsZLNZP7tcaZpEqiQMjJ+Q4r
	KHbRrq2ytxrLkHz2FzQt+xqgUH7t9cbvU6LgRKdc8EXWRvCvdiAuUFJMwM+s3urB/33DGVNO5+N6T
	pei4Mbet0QZ/4cVdJiuOfijcOEgzARR9pRwsrSnR2VRyfEOYq6LjgMReJZCIrm9pJQpq1ZZ6kM48m
	QWoYKnIg8jhio2y57PzDHSrVBGYATTVfGUfA5l7UM8y1DrGJZdvmZq50C5lPni9KiJftqFligdnqb
	icpZy04yzbn6eP/QKwezb5C8qzJVOwA1uCj8iOHjI2zzXNbwm+2kZxRCKiwZmntR+5umqP6Artxh8
	53Y/tZ4g==;
Received: from ip6-localhost ([::1]:34056 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQaGx-00BHb9-9e; Fri, 10 Feb 2023 20:45:31 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:44610) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQaGi-00BHb0-Aj
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 20:45:19 +0000
Received: by mail-ej1-x632.google.com with SMTP id hx15so18864334ejc.11
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3ouszKA6QqICt+YxGce9SY3oz4SsHUe9oFN+JOLlH88=;
 b=BtUoz55elLFqQDfXVT2fRepfHO1VRasY7bNzTcVJa3+3O5Djx3ghbK7G70ibZuu5vN
 3dc49Cy8mFHNkJ1Vv/oF3CA3dF13tG/Y81zRPTekzdHD6j5UHk4GfmpJ70LOUcP2NqZ2
 LylcoEZit07hjr9sxmipoBqLVL7wknoCGK6LE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3ouszKA6QqICt+YxGce9SY3oz4SsHUe9oFN+JOLlH88=;
 b=2dt0NhBLfaip3j0tS5h+yDDxy/97rPnwlaboRaeSA8kPqbueJ0fzjVYWHmMkzS0JBQ
 prHSFh2AqLv4FvV5a1o3vUAxlG5gNYHBc8VZ5tMBFkQ6621v1bX2mYkxsFw+zyPeP/M7
 tbDLuXfm+qpF+gjWoGSVW/4BepTFV/4Xs0sKrZrfUGzIvzOwlp0SGgavYPYbz4AXr1hI
 TsPdNqPLKhBEa7GUmvemeBVL7AhUX7eG5hwZ7N6mazCyOB1DQyeJIrbuHsXKxcrsdkVH
 A/7tqTAjntWdL+xz9fTco5eiQyOOF40ssJjYOtUOFTfHgaXBtjKXN+f5Uj2hpoIW3dlL
 FR8g==
X-Gm-Message-State: AO0yUKWjiuuZgdgyliNjUjcg0qcvjCOtHlGqDN6cVdrxXeOeIOeDsR+0
 5BOgLgogG0v+1fsYfHzEmFaJbzaPyxyT3DF5/X0=
X-Google-Smtp-Source: AK7set/KfnJ78yklshe/uI0JZ3M81nk2Ie6yz/THQSUv5yMh1+JuUp0bmENmG1h4lpfiiyyLNUGnTQ==
X-Received: by 2002:a17:906:b2cc:b0:878:5917:601 with SMTP id
 cf12-20020a170906b2cc00b0087859170601mr18015944ejb.58.1676061915103; 
 Fri, 10 Feb 2023 12:45:15 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 b11-20020a170906490b00b0084d4b8f5889sm2841651ejq.102.2023.02.10.12.45.14
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 12:45:14 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id r3so5778315edq.13
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:45:14 -0800 (PST)
X-Received: by 2002:a50:f603:0:b0:49d:ec5e:1e98 with SMTP id
 c3-20020a50f603000000b0049dec5e1e98mr3298664edn.5.1676061913926; Fri, 10 Feb
 2023 12:45:13 -0800 (PST)
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
 <CALCETrUXYts5BRZKb25MVaWPk2mz34fKSqCR++SM382kSYLnJw@mail.gmail.com>
 <CAHk-=wgA=rB=7M_Fe3n9UkoW_7dqdUT2D=yb94=6GiGXEuAHDA@mail.gmail.com>
 <1dd85095-c18c-ed3e-38b7-02f4d13d9bd6@kernel.dk>
 <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
 <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
In-Reply-To: <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
Date: Fri, 10 Feb 2023 12:44:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
Message-ID: <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Jens Axboe <axboe@kernel.dk>
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
 Dave Chinner <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Stefan Metzmacher <metze@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 12:39 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> Right, I'm referencing doing zerocopy data sends with io_uring, using
> IORING_OP_SEND_ZC. This isn't from a file, it's from a memory location,
> but the important bit here is the split notifications and how you
> could wire up a OP_SENDFILE similarly to what Andy described.

Sure, I think it's much more reasonable with io_uring than with splice itself.

So I was mainly just reacting to the "strict-splice" thing where Andy
was talking about tracking the page refcounts. I don't think anything
like that can be done at a splice() level, but higher levels that
actually know about the whole IO might be able to do something like
that.

Maybe we're just talking past each other.

             Linus

