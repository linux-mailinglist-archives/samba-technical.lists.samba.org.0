Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5498C692A8D
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 23:51:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fb0hD2Is8tutzPK+FUgjJONSqvcKdsnxAi3Fd+q9FbI=; b=K3nqCEvgtuPtUA/ZB6+z57yvRa
	dcQYRB4shWRZqhTjcLEn75txnBZNdRMrtVN3hE9a5S2iD3uUiaBnuzJH+Nr1S3ndSLOQKD/Gq33+W
	BjncFg6ylqB1YKIDxZUktMcy97Njcg5ZQ8jFwgwjPZKo2g8gkzKkQ6VsBM93SnGj/9IKTLcHTnTnF
	hPafWKj7WThs2lJj0XA2LIo3fPT0SSW8gqGtZyXmF0juJYmuAXXpEn2EDCGBqkzxihLZsBd/ydefK
	ndGixMmnaKvH14u/isNh8Hk0QDmUUyjRwWklOynRFKl/vZ/iAMRsA0y8DHts/0dTKbiPUuom32NLZ
	KEsFV/Mw==;
Received: from ip6-localhost ([::1]:18008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQcEg-00BNrI-PV; Fri, 10 Feb 2023 22:51:18 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:33386) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQcEa-00BNr9-Vs
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 22:51:15 +0000
Received: by mail-pf1-x430.google.com with SMTP id t17so4517777pfj.0
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 14:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1676069470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fb0hD2Is8tutzPK+FUgjJONSqvcKdsnxAi3Fd+q9FbI=;
 b=gkumRTQSpGTg1Kqk07BCblcvpz+kIS0Whxwm0RF9IhQRDH7wkfO3l8yye1TRollGbB
 Hq1V4lOJX3TAwP11uiv+z3P/yi3g5dTsVW/hLWuEw/+ow8uJ209kOmB3FV3oReUd9M8C
 cb3pDM3CZEEWZezA/Zvtw8/qQ1OOCKjhBrTsRnnymRki0layjIjTH0LDcoxCi4x/J3vN
 vMsCzYCCZ3t1/DMQtj0njviLxiZ2tU9+lUzwjgLwAhx1j1ocgIVJwU3pQF7s6er1krg6
 +O65C1zrlQZIReQoTSKNK8fqePu7aXE5Yu/08tbpiMAvWZoPIhRK78w5shdrpwba/pnF
 Er+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676069470;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fb0hD2Is8tutzPK+FUgjJONSqvcKdsnxAi3Fd+q9FbI=;
 b=w2C+HdV0ucmbwkZ+rmp5VdLZJgd9zOn2380Wmlf6Ji4Xp3ZPwM6f5EzKOSuz0ECNeP
 6ExVmvEAH4GMqw4ZwClcavU5ZPg1rGxSwq5r4AohVGwlzzc5ZSWwK2lewgu80EEK4l8o
 OXQ8zSZYIPuYz4hNbEbWN55KNuhQbkkYRl/P/FlyMYUG0Rbecs61Z4dEcLiiSgZMpTtY
 hakw4I9WGhBDrQ9ZxsCFULuxxwuJbntJKkDQWwmFHDZ0pvmzwo0WB06MAcB/r9m9hpd0
 JcivWDMuCNJFwMF2Pdw4uyxER1o6QXayPZsiVGX9YfglCww/26+o3Vdgbj6ceBoIsH/N
 WyKw==
X-Gm-Message-State: AO0yUKV1srjINh5h7zMBIUpb1D9JKpdt0fdZ+y0KhOsaeTQyy3H9kjEx
 WXbw99WYxPsKUL9orjru/gwt5A==
X-Google-Smtp-Source: AK7set9QlYq/MSDUz7QhtZ618g3YDbVybvJOz+1kV8etdZ6/r0TOGrNahZypoZavFHpy28vDf9oNWA==
X-Received: by 2002:a62:82c6:0:b0:5a8:4c4e:fc01 with SMTP id
 w189-20020a6282c6000000b005a84c4efc01mr8503622pfd.2.1676069470503; 
 Fri, 10 Feb 2023 14:51:10 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 e13-20020a62aa0d000000b00582388bd80csm3729845pff.83.2023.02.10.14.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 14:51:10 -0800 (PST)
Message-ID: <70a61a9a-f5a3-09d6-91b6-bf2355d3919c@kernel.dk>
Date: Fri, 10 Feb 2023 15:51:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
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
 <CAHk-=wg3gLL-f6XkQo4vw42Q+ySPrMdprNL1dxNrr3RGHzhnrw@mail.gmail.com>
In-Reply-To: <CAHk-=wg3gLL-f6XkQo4vw42Q+ySPrMdprNL1dxNrr3RGHzhnrw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
From: Jens Axboe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jens Axboe <axboe@kernel.dk>
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

On 2/10/23 3:35?PM, Linus Torvalds wrote:
> On Fri, Feb 10, 2023 at 2:26 PM Jens Axboe <axboe@kernel.dk> wrote:
>>>
>>> (I actually suspect that /dev/zero no longer works as a splice source,
>>> since we disabled the whole "fall back to regular IO" that Christoph
>>> did in 36e2c7421f02 "fs: don't allow splice read/write without
>>> explicit ops").
>>
>> Yet another one... Since it has a read_iter, should be fixable with just
>> adding the generic splice_read.
> 
> I actually very consciously did *not* want to add cases of
> generic_splice_read() "just because we can".
> 
> I've been on a "let's minimize the reach of splice" thing for a while.
> I really loved Christoph's patches, even if I may not have been hugely
> vocal about it. His getting rid of set/get_fs() got rid of a *lot* of
> splice pain.
> 
> And rather than try to make everything work with splice that used to
> work just because it fell back on read/write, I was waiting for actual
> regression reports.
> 
> Even when splice fails, a lot of user space then falls back on
> read/write, and unless there is some really fundamental reason not to,
> I think that's always the right thing to do.
> 
> So we do have a number of "add splice_write/splice_read" commits, but
> they are hopefully all the result of people actually noticing
> breakage.
> 
> You can do
> 
>      git log --grep=36e2c7421f02
> 
> to see at least some of them, and I really don't want to see them
> without a "Reported-by" and an actual issue.

Oh I already did that the last few times (and there's quite a bit). And
while I agree that getting rid of the ancient set/get_fs bits was great,
it is still annoying to knowingly have regressions. The problem with
this approach is that the time from when you start the "experiment" to
when the first report comes in, it'll take a while as most don't run
-git kernels at all. And the ones that do are generally just standard
distro setups on their workstation/laptop.

The time is my main concern, it takes many years before you're fully
covered. Maybe if that series had been pushed to stable as well we'd
have a better shot at weeding them out.

> Exactly because I'm not all that enamoured with splice any more.

I don't think anyone has been for years, I sure have not and haven't
worked on it in decades outside of exposing some for io_uring.The
latter was probably a mistake and we should've done something else, but
there is something to be said for the devil you know... Outside of that,
looks like the last real change was support for bigger pipes in 2010.
But:

1) Interesting bits do come up. Some of these, as this discussion has
   highlighted, are probably better served somewhere else, especially if
   they require changes/additions. Some may be valid and fine.

2) Knowingly breaking things isn't very nice, and if anyone else did
   that, they'd have you screaming at them.

So while I do kind of agree with you on some points, I don't think it
was done very well from that perspective. And when we spot things like
zero not working with splice, we should probably add the patch to make
it work rather than wait for someone to complain. I just recently had to
fixup random/urandom for that because of a report, and I'd like to think
I have better things to do than deal with known fallout.

-- 
Jens Axboe


