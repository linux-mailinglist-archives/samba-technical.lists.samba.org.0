Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2FE692365
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 17:34:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=fhLS95sVAPuPLSt4s3QNipINWEX9MBrZr6+OBYHbgx0=; b=Wd4/mgznMQxsKTgfmOtvxSWmP6
	qTeBC3jJQCcELeK523zmcRkHoNbfiXH5cSX3woFN25YrrfqEumXyYKgMbbOAnH49WYZ5KfJ5dN0Oa
	vmcDA4sNvk8wS4i1zPHDciBWA5wGCLF4KNvd4dNmdHL51ylkswtlERil4971Atr5bbMCsgTmyxvDZ
	s4ddo2FJC6NlIufiL+MBvjCe5CQvmMtakU5Gd1w5xXjtPZxzwPyN/Eq+N+5gVPqQl7fmdgrDwolwY
	6RAamrQI+3Czt0aCUTtLz+mVkZ1Wa3I7kNfpTYnnJ89Y8aG5bFSm0rdb2XFXA6ITO6ZcsaJ68Y31c
	S1gRFMAQ==;
Received: from ip6-localhost ([::1]:55710 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQWLs-00B1Uk-1Q; Fri, 10 Feb 2023 16:34:20 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:44900) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQWLn-00B1Ub-To
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 16:34:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id bk16so5594490wrb.11
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 08:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fhLS95sVAPuPLSt4s3QNipINWEX9MBrZr6+OBYHbgx0=;
 b=cL0mkbQIbHTogr8+gARmzk7nOJyD+7SQmmdWptCXTxvc58+uY1vnr+O3VA6IXM3pTE
 xBSu3S98ypYKJ1ws4c6sOhAicybJKFwvsEqJZZr3hDlVubO2y7LscipiJbUntT3Fcny5
 cCGhMNw2tXB30dK1JJMm5hbi0YDzOdQMqBrds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fhLS95sVAPuPLSt4s3QNipINWEX9MBrZr6+OBYHbgx0=;
 b=jHvX1gTEwxJSYz/TRoIuA9l6Z0m1P0q8K7dIIouC7Z6XrLWVkBL55pYPOB4tpsJ88g
 9Ks8/R2p0H/+uGHSl3jMRwH+2ITF4FCnjci93F8D/IJQFsVyITi5tXhng7YgNMYbEdEb
 XGufHSpNXxuHVdB9nqIYlnRJ/qyt8Id8FMvBQCqq/uP0b8SvhBRK/l+QkVmYLLHX5xmT
 J9QF9fixH9jNarXIedEgaIXYgXaj9Es7hYD5rUI8/XR591VT6glOwP0NZzDcRTr3Se/C
 PsDW4+1XBsRhd2nYBhtYe2mbU9JCFuRYTtFaEvtoj/y173KmfQIW3f5FIGRhvN2cFKYj
 eGoQ==
X-Gm-Message-State: AO0yUKWzhk4hHVcJRjdkewRSQ0qbe6QQIOTJwNoWl+Y35c+Vcn/JTrwi
 QgdPgElgmY/kcunzGo6U58lRzvKVKDz1lbi/+OU=
X-Google-Smtp-Source: AK7set+3tDofBsocnubILF2R8ORksUcaW0H3sqYwRTAVHplhEcWOI0xwJU5N+EQx3gltj4PCEMFReQ==
X-Received: by 2002:a5d:4fc5:0:b0:2c3:e297:8e4d with SMTP id
 h5-20020a5d4fc5000000b002c3e2978e4dmr4884303wrw.6.1676046854587; 
 Fri, 10 Feb 2023 08:34:14 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 q14-20020adfcd8e000000b002c3e65c9533sm4010614wrj.67.2023.02.10.08.34.13
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 08:34:14 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id ml19so17504760ejb.0
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 08:34:13 -0800 (PST)
X-Received: by 2002:a17:906:4e46:b0:87a:7098:ca09 with SMTP id
 g6-20020a1709064e4600b0087a7098ca09mr3021239ejw.78.1676046853351; Fri, 10 Feb
 2023 08:34:13 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
 <20230210065747.GD2825702@dread.disaster.area>
 <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
In-Reply-To: <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
Date: Fri, 10 Feb 2023 08:33:56 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
Message-ID: <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
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

On Fri, Feb 10, 2023 at 7:15 AM Andy Lutomirski <luto@kernel.org> wrote:
>
> Frankly, I really don't like having non-immutable data in a pipe.

That statement is completely nonsensical.

A pipe is a kernel buffer. If you want the buffer to be immutable, you
do "read()" and "write()" on it. End of story.

In contrast, "splice()" is literally the "map" operation. It's
"mmap()", without the "m", because it turns out that memory mapping
has a few problems:

 (a) mmap fundamentally only works on a page granularity

 (b) mmap has huge setup and teardown costs with page tables and TLB's

and so splice() is just basically "strange mmap with that kernel
buffer that is pipe"

Really. That is what spice *is*. There's absolutely no question about it.

It has some advantages over mmap, in that because it's a software
mapping, we can "map" partial pages, which means that you can also map
data that might not be in full pages (it might be an incoming network
buffer, for example).

It has a lot of disadvantages over mmap too, of course. Not using
hardware means that it doesn't really show up as a linear mapping, and
you don't get the nice hardware lookup accelerations - but it also
means that you don't have the downsides (ie TLB costs etc).

So I'm not saying that it is the same thing as "mmap", but I very much
_am_ saying that there's a very real and direct similarity. There are
three fundamental IO models in Unix: read, write, and mmap. And mmap()
is very much a "you get a direct window into something that can change
under you".  And splice() is exactly that same thing.

It was literally designed to be "look, we want zero-copy networking,
and we could do 'sendfile()' by mmap'ing the file, but mmap - and
particularly munmap - is too expensive, so we map things into kernel
buffers instead".

So saying "I really don't like having non-immutable data in a pipe" is
complete nonsense. It's syntactically correct English, but it makes no
conceptual sense.

You can say "I don't like 'splice()'". That's fine. I used to think
splice was a really cool concept, but I kind of hate it these days.
Not liking splice() makes a ton of sense.

But given splice, saying "I don't like non-immutable data" really is
complete nonsense.

If you want a stable buffer, use read() and write(). It's that simple.
If you want to send data from a file to the network, and want a stable
buffer in between the two, then "read()" and "write()" is *exactly*
what you should do.

With read and write, there's no mmap()/munmap() overhead of the file,
and you already have the buffer (iwe call it "user address space").
The only downside is the extra copy.

So if  you want to send stable, unchanging file contents to the
network, there is absolutely *no* reason to ever involve a pipe at
all, and you should entirely ignore splice().

The *only* reason to ever use splice() is because you don't want to
copy data, and just want a reference to it, and want to keep it all in
kernel space, because the kernel<->user boundary ends up either
requiring copies, or that page alignment, and is generally fairly
expensive.

But once you decide to go that way, you need to understand that you
don't have "immutable data". You asked for a reference, you got a
reference, and it *will* change.

That's not something specific to "splice()". It's fundamental to the
whole *concept* of zero-copy. If you don't want copies, and the source
file changes, then you see those changes.

So saying "I really don't like having non-immutable data in a pipe"
really is nonsense. Don't use splice. Or do, and realize that it's a
*mapping*.

Because that is literally the whole - and ONLY - reason for splice in
the first place.

              Linus

