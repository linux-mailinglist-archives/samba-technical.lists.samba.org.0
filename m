Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 470BE692A3B
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 23:35:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sgPQEqmErKQB0wG6VWCF+VmnzkMKfRqkz/sIKfZqL68=; b=oN35dOyvsLzO12ayW7jKL+/byT
	LR89RUkWYKuMOErKgwcNQb/2UFTNc8bbM3JmL/11dSpqLjEc3ACkZQ0APXBACWGCkbe3olSqirDMX
	Wifa/9CUsHHyHEUHkyYQt0KR/zuygO36xIcm0w1T8iUDdAMxE/rvQM1FdGIVRU9bTXPgDjxUboBpk
	EX7Jzuk+HoFMsVnv6sZo5uxQOwOutrfFnF2x4SYFPfSfHDGYW1QJXEzhZ40jiKFVkbuxAuILR13Sn
	Uhp1mJchXm4Vwr4yg/7olBFN43nObgxl8TxifjhjM8SsEipxKrclWWtEVOUP3iSO+qOhF7uUq5HT2
	wMZeJRWw==;
Received: from ip6-localhost ([::1]:21756 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQbzU-00BNTt-R1; Fri, 10 Feb 2023 22:35:36 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:46796) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQbzQ-00BNTk-86
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 22:35:34 +0000
Received: by mail-ej1-x62e.google.com with SMTP id p26so19389935ejx.13
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 14:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sgPQEqmErKQB0wG6VWCF+VmnzkMKfRqkz/sIKfZqL68=;
 b=gQz1/9xmHREGXPA2JXH0RsK7JsUhn7vHa15D/69fCSK/vZzwlw4bq85T8mRYkpJplP
 EegJvrfeGBLxDkz18RvpvK6JB/6GDTuCoFw9pDlWGUVTnbp7FP4QCEiSxJ0txMWl8p8y
 bbKRpYKHkKD8w9mPOUGxJllCwuJhuHiNZ3ZP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgPQEqmErKQB0wG6VWCF+VmnzkMKfRqkz/sIKfZqL68=;
 b=yZvTsCnGgnm98/dXZFW3St6EKteUNK0T8pOK180Vk0Yj7+JnrnN61vaOWRXUdgkEkK
 An2YKa4VZPB+ZSmb4djZOxsWE4pbrmCIYLU41OMkUS4+Npu/7R6rOJMAuPEYOX0Ny9Cj
 ZL98hOhSX7eJ+xfjrFqlqatMQo1oMGP7rEwjxZeeYts3grCJHd5o0qEqerg/enEaUpM8
 4ERVKRoXOpv2HWwKrxSG6ZcJTTekfCPawg/LcaQbKwsi9yegcnfSc4DcfJmdsw7NMGfh
 Yf9z8bx+jNExa5SUnk411qeWwC9hUiV7e5NUvI45w9rLInzbGKmJCumljuzRFBo3fDD1
 yq0A==
X-Gm-Message-State: AO0yUKWeaGHaRO/IC0Dhym4BWrKJ4RXQEIpKNBV3vNHpAQqDSMRD00sj
 HQ86hOJUkXtTEXlJnSOvtzyL/eaO7xnq7tZt/bc=
X-Google-Smtp-Source: AK7set/8P1uhcAC0rTZdSACXHEorLu3ioQaSrtWgjYIp0GyeppoT2Ee0Z3iA4X+B6NnwROjsFgVkng==
X-Received: by 2002:a17:906:a204:b0:88e:e6ee:feab with SMTP id
 r4-20020a170906a20400b0088ee6eefeabmr17928027ejy.62.1676068530242; 
 Fri, 10 Feb 2023 14:35:30 -0800 (PST)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com.
 [209.85.218.52]) by smtp.gmail.com with ESMTPSA id
 kt13-20020a170906aacd00b0087943d525e1sm2947810ejb.215.2023.02.10.14.35.29
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 14:35:29 -0800 (PST)
Received: by mail-ej1-f52.google.com with SMTP id qb15so17384755ejc.1
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 14:35:29 -0800 (PST)
X-Received: by 2002:a17:906:fad2:b0:88d:d304:3424 with SMTP id
 lu18-20020a170906fad200b0088dd3043424mr1693934ejb.0.1676068528950; Fri, 10
 Feb 2023 14:35:28 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wjQZWMeQ9OgXDNepf+TLijqj0Lm0dXWwWzDcbz6o7yy_g@mail.gmail.com>
 <CALCETrWuRHWh5XFn8M8qx5z0FXAGHH=ysb+c6J+cqbYyTAHvhw@mail.gmail.com>
 <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
 <CALCETrUXYts5BRZKb25MVaWPk2mz34fKSqCR++SM382kSYLnJw@mail.gmail.com>
 <CAHk-=wgA=rB=7M_Fe3n9UkoW_7dqdUT2D=yb94=6GiGXEuAHDA@mail.gmail.com>
 <1dd85095-c18c-ed3e-38b7-02f4d13d9bd6@kernel.dk>
 <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
 <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
 <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
 <7a2e5b7f-c213-09ff-ef35-d6c2967b31a7@kernel.dk>
 <CALCETrVx4cj7KrhaevtFN19rf=A6kauFTr7UPzQVage0MsBLrg@mail.gmail.com>
 <b44783e6-3da2-85dd-a482-5d9aeb018e9c@kernel.dk>
 <2bb12591-9d24-6b26-178f-05e939bf3251@kernel.dk>
 <CAHk-=wjzqrD5wrfeaU390bXEEBY2JF-oKmFN4fREzgyXsbQRTQ@mail.gmail.com>
 <CAHk-=wjUjtLjLbdTz=AzvGekyU1xiSL-wAAb7_j_XoT9t4o1vQ@mail.gmail.com>
 <824fa356-7d6e-6733-8848-ab84d850c27a@kernel.dk>
In-Reply-To: <824fa356-7d6e-6733-8848-ab84d850c27a@kernel.dk>
Date: Fri, 10 Feb 2023 14:35:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg3gLL-f6XkQo4vw42Q+ySPrMdprNL1dxNrr3RGHzhnrw@mail.gmail.com>
Message-ID: <CAHk-=wg3gLL-f6XkQo4vw42Q+ySPrMdprNL1dxNrr3RGHzhnrw@mail.gmail.com>
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
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 2:26 PM Jens Axboe <axboe@kernel.dk> wrote:
> >
> > (I actually suspect that /dev/zero no longer works as a splice source,
> > since we disabled the whole "fall back to regular IO" that Christoph
> > did in 36e2c7421f02 "fs: don't allow splice read/write without
> > explicit ops").
>
> Yet another one... Since it has a read_iter, should be fixable with just
> adding the generic splice_read.

I actually very consciously did *not* want to add cases of
generic_splice_read() "just because we can".

I've been on a "let's minimize the reach of splice" thing for a while.
I really loved Christoph's patches, even if I may not have been hugely
vocal about it. His getting rid of set/get_fs() got rid of a *lot* of
splice pain.

And rather than try to make everything work with splice that used to
work just because it fell back on read/write, I was waiting for actual
regression reports.

Even when splice fails, a lot of user space then falls back on
read/write, and unless there is some really fundamental reason not to,
I think that's always the right thing to do.

So we do have a number of "add splice_write/splice_read" commits, but
they are hopefully all the result of people actually noticing
breakage.

You can do

     git log --grep=36e2c7421f02

to see at least some of them, and I really don't want to see them
without a "Reported-by" and an actual issue.

Exactly because I'm not all that enamoured with splice any more.

                 Linus

