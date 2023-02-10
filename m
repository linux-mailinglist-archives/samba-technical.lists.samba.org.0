Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B3B6924EE
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 18:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=GtB24A6+psoSJKawzD9+PHbPrXIr/DMx6iWFKB4xd0U=; b=cRAjweWrAJlagawTXKx5qZBut4
	bFqg3dalD+OOtYWM7EHAJ5spjC7Tr6Y4gej8ySLdvn6Z1mUfjTCKLlUk01TWB48wZS3Q/uKCbNPGk
	iF13tRIG6vbVraxDvA3b8bEvs0DUtlfzm2tTg1hxA7ahmcAfA3283G2Tjee0SvY3BRJmE2PpNKGlC
	lc2NbkOBeVZo9ek4xBhFPmLcpcreN9186t2uLJvKgmT1uA2PgeYwNQq42CCvAUWG9BwXV3l6/KVfu
	tNgoDAAjQhu9CY8DR4qQV4nb/eDhxszrpv/uw6o9VKAMk52eaANpYPvBE9yZ4Zhx1+FV/guj9BNdG
	BU+7Dw6w==;
Received: from ip6-localhost ([::1]:31746 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQXeZ-00B3bG-Ur; Fri, 10 Feb 2023 17:57:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1]:37488) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pQXeU-00B3b7-Dl
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 17:57:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A07461E62
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 17:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D397C433A0
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 17:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676051853;
 bh=EdNikj6ihbS6tmVVKV/Gr8GqPj/IVFRIStn6g5XxS3c=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eWC0iXIEBdh8IiJfgucjHSAi41/t4CCSJLtM3N8OQXIMgm0D6a7uAgr+OPd20MJTH
 +E7yRfL1HwGlMizxeYI4yHxetBPf/kQSz+/Dht1eVjH4fbeQ9OuvDOJVbhnFRXgEYy
 QYy1bJy66R7Dn19bRYEhj96Et2i0xDrwZnPfW989bicZxpafG4B64re/6c1z5HRw+0
 70yszsAyseKyHu7CdGfNjtminIlzy0mXqk4meyRPMynQFnVbAtCg804AUAQXGFr3zn
 HQ87TQEqtdO1f2dnSw1rQuKiJaGx9TRK9Smv2mmAwq3jk7R4AnEpk01loDdz/tyjCV
 lfUCZYnwZuoMg==
Received: by mail-ej1-f51.google.com with SMTP id jg8so17988789ejc.6
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 09:57:33 -0800 (PST)
X-Gm-Message-State: AO0yUKWG3mPEt6RlVOYyQFAZRicxFiQsVwiQ0bkrf4/bQyQ0WIZaBWRt
 lyEbKR4m1YL4oPb0clU1mXX0WOWonznkeHwdVPRFOQ==
X-Google-Smtp-Source: AK7set9/ve8g5TsJRz3g6ZGdh+faiyXAgVkwQTS2SJlcgdVc+0p1pG34Vabiezx0GXNWG1AspwltN09G6XpRWPRXdvg=
X-Received: by 2002:a17:906:ca04:b0:7c0:f45e:22ff with SMTP id
 jt4-20020a170906ca0400b007c0f45e22ffmr3820111ejb.104.1676051851830; Fri, 10
 Feb 2023 09:57:31 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
 <20230210065747.GD2825702@dread.disaster.area>
 <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
 <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
In-Reply-To: <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
Date: Fri, 10 Feb 2023 09:57:20 -0800
X-Gmail-Original-Message-ID: <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
Message-ID: <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Linus Torvalds <torvalds@linux-foundation.org>
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
From: Andy Lutomirski via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andy Lutomirski <luto@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Dave Chinner <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Stefan Metzmacher <metze@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 8:34 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Feb 10, 2023 at 7:15 AM Andy Lutomirski <luto@kernel.org> wrote:
> >
> > Frankly, I really don't like having non-immutable data in a pipe.
>
> That statement is completely nonsensical.

I know what splice() is.  I'm trying to make the point that it may not
be the right API for most (all?) of its use cases, that we can maybe
do better, and that we should maybe even consider deprecating (and
simplifying and the cost of performance) splice in the moderately near
future.  And I think I agree with you on most of what you're saying.

> It was literally designed to be "look, we want zero-copy networking,
> and we could do 'sendfile()' by mmap'ing the file, but mmap - and
> particularly munmap - is too expensive, so we map things into kernel
> buffers instead".

Indeed.  mmap() + sendfile() + munmap() is extraordinarily expensive
and is not the right solution to zero-copy  networking.

>
> So saying "I really don't like having non-immutable data in a pipe" is
> complete nonsense. It's syntactically correct English, but it makes no
> conceptual sense.
>
> You can say "I don't like 'splice()'". That's fine. I used to think
> splice was a really cool concept, but I kind of hate it these days.
> Not liking splice() makes a ton of sense.
>
> But given splice, saying "I don't like non-immutable data" really is
> complete nonsense.

I am saying exactly what I meant.  Obviously mutable data exists.  I'm
saying that *putting it in a pipe* *while it's still mutable* is not
good.  Which implies that I don't think splice() is good.  No offense.

I am *not* saying that the mere existence of mutable data is a problem.

> That's not something specific to "splice()". It's fundamental to the
> whole *concept* of zero-copy. If you don't want copies, and the source
> file changes, then you see those changes.

Of course!  A user program copying data from a file to a network
fundamentally does this:

Step 1: start the process.
Step 2: data goes out to the actual wire or a buffer on the NIC or is
otherwise in a place other than page cache, and the kernel reports
completion.

There are many ways to make this happen.  Step 1 could be starting
read() and step 2 could be send() returning.  Step 1 could be be
sticking something in an io_uring queue and step 2 could be reporting
completion.  Step 1 could be splice()ing to a pipe and step 2 could be
a splice from the pipe to a socket completing (and maybe even later
when the data actually goes out).

*Obviously* any change to the file between steps 1 and 2 may change
the data that goes out the wire.

> So the data lifetime - even just on just one side - can _easily_ be
> "multiple seconds" even when things are normal, and if you have actual
> network connectivity issues we are easily talking minutes.

True.

But splice is extra nasty: step 1 happens potentially arbitrarily long
before step 2, and the kernel doesn't even know which socket the data
is destined for in step 1.  So step 1 can't usefully return
-EWOULDBLOCK, for example.  And it's awkward for the kernel to report
errors, because steps 1 and 2 are so disconnected.  And I'm not
convinced there's any corresponding benefit.


In any case, maybe io_uring gives an opportunity to do much better.
io_uring makes it *efficient* for largish numbers of long-running
operations to all be pending at once.  Would an API like this work
better (very handwavy -- I make absolutely no promises that this is
compatible with existing users -- new opcodes might be needed):

Submit IORING_OP_SPLICE from a *file* to a socket: this tells the
kernel to kindly send data from the file in question to the network.
Writes to the file before submission will be reflected in the data
sent.  Writes after submission may or may not be reflected.  (This is
step 1 above.)

The operation completes (and is reported in the CQ) only after the
kernel knows that the data has been snapshotted (step 2 above).  So
completion can be reported when the data is DMAed out or when it's
checksummed-and-copied or if the kernel decides to copy it for any
other reason *and* the kernel knows that it won't need to read the
data again for possible retransmission.  As you said, this could
easily take minutes, but that seems maybe okay to me.

(And if Samba needs to make sure that future writes don't change the
outgoing data even two seconds later when the data has been sent but
not acked, then maybe a fancy API could be added to help, or maybe
Samba shouldn't be using zero copy IO in the first place!)

If the file is truncated or some other problem happens, the operation can fail.


I don't know how easy or hard this is to implement, but it seems like
it would be quite pleasant to *use* from user code, it ought to be
even faster than splice-to-pipe-then-splice-to-socket (simply because
there is less bookkeeping), and it doesn't seem like any file change
tracking would be needed in the kernel.


If this works and becomes popular enough, splice-from-file-to-pipe
could *maybe* be replaced in the kernel with a plain copy.

--Andy

