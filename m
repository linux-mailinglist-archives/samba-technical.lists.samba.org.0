Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8569F69169C
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 03:17:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bmdsJe5VjS6cGWRPCrFBEnJ1Stz+m8nOHf+xEJbc8Ro=; b=z0IkC9Xi5E/iHaf8H/+9FQ1jH+
	57OZ5kvYDhnaFthYfYDXFpjGFOrDjr+SimW2FXP4FHHTrqoWL3aH2hQ3F05PgF3O20acK+LDqxgUP
	XZ1PSighLKg/qzuo6mKxNIV12Z3sI4RfnR7zxBm5OzNV2wgjpShWNjon8tRh3goFxGwu7+FkH3uZA
	Sf9gC8FBhSSBpVG9rI1IlZ6oWhyp/hlRWSipscpXDd1h6hZLhI98mXqC3lKWG0mRVvix6rWYci7r/
	TDdowJpQId9akuTa/MKbTpncrVi6H7HsrYIMQwXSBnrSzxrkA15iDgfjiTUJ6K6tK0AIJNDyQQ64m
	H/0oOGPQ==;
Received: from ip6-localhost ([::1]:38194 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQIxT-00Abal-Mt; Fri, 10 Feb 2023 02:16:15 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:41534) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQIxO-00Abac-IS
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 02:16:13 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 f16-20020a17090a9b1000b0023058bbd7b2so4213368pjp.0
 for <samba-technical@lists.samba.org>; Thu, 09 Feb 2023 18:16:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fromorbit-com.20210112.gappssmtp.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bmdsJe5VjS6cGWRPCrFBEnJ1Stz+m8nOHf+xEJbc8Ro=;
 b=J8IifK/DvnXJNvhWBvQbcKdHIoBmbbPZ9GmygmQqrNwBSb1pD/HNZOZeiWQSwCoPci
 NP3OTrWJb/g+vFhmEllum5yKYw4HmSuTpSf7i55JPj2Otjj8Ztgyi8fAQxheouAVG5gr
 feUmWCgQKTCr0LdxXWejJcCO5GBTd8ROY77qtZY0Fa02CnRZBNcoPEAQeGO7e2TtM9Yj
 8HlgeD73o8w0RL3OTbBGYNgFkV2ABhQP1834I5JNDAQmI5VJyB6at/AfhIBmtmrZ5zt7
 LFe2GAliMmn6fR9D5GkGQJU5ayikMCd3K9h34G22YIj2ial/gBGc15dVfeAuO9Woi5dM
 NBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bmdsJe5VjS6cGWRPCrFBEnJ1Stz+m8nOHf+xEJbc8Ro=;
 b=ePbuEIWRgHMOZT6G2u+sc3TjGiSbaqLPgz56+nVhmDBqzQUnd31j6E55H58oO33OZg
 gMBbekBRMLb3WB9wD1kxyM1AJOat/1GHBbnaA5edwMX4xdMrxLkkSvF1REbXITC7jaVV
 KlRhJft5LHpKC2c7gJWXUEP+MoAdTzlkucBTIglAbVqL3gJUuDAozHfuD8JaJIrrkDgE
 TgXkIjoq3L5Er3HQ74jT88y6jnEk4rJtvxykX9XyWt15yTWElptVx+96DtLlsLKkU/o3
 KJRk9OyYXUOsZ/UYrFDuEcbMeojVa11PvoIbAIzEIWoPMFsWJqEDuHfVDGoT3q4INKuI
 JgQQ==
X-Gm-Message-State: AO0yUKWlNIbzuAyn9JqhNdg25mPXIGeB4MP/Kzpty8wxmMi1nYHZjGNv
 900FbYSwWo8JQ73g+c3MPQqVlw==
X-Google-Smtp-Source: AK7set/5M4194uBmFaxqcnUSG3dAq8TXSG1+LxNlv7e9evS+gIEFmcux2K3a5fEecC8rDIi5Jlct7Q==
X-Received: by 2002:a17:902:6b81:b0:199:bcb:3dae with SMTP id
 p1-20020a1709026b8100b001990bcb3daemr10334823plk.56.1675995366933; 
 Thu, 09 Feb 2023 18:16:06 -0800 (PST)
Received: from dread.disaster.area (pa49-181-4-128.pa.nsw.optusnet.com.au.
 [49.181.4.128]) by smtp.gmail.com with ESMTPSA id
 i5-20020a170902eb4500b00199080af237sm2197368pli.115.2023.02.09.18.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 18:16:06 -0800 (PST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1pQIxH-00DSdE-UH; Fri, 10 Feb 2023 13:16:03 +1100
Date: Fri, 10 Feb 2023 13:16:03 +1100
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <20230210021603.GA2825702@dread.disaster.area>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
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
From: Dave Chinner via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 09, 2023 at 08:41:02AM -0800, Linus Torvalds wrote:
> Adding Jens, because he's one of the main splice people. You do seem
> to be stepping on his work ;)
> 
> Jens, see
> 
>   https://lore.kernel.org/lkml/0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org
> 
> On Thu, Feb 9, 2023 at 5:56 AM Stefan Metzmacher <metze@samba.org> wrote:
> >
> > So we have two cases:
> >
> > 1. network -> socket -> splice -> pipe -> splice -> file -> storage
> >
> > 2. storage -> file -> splice -> pipe -> splice -> socket -> network
> >
> > With 1. I guess everything can work reliable [..]
> >
> > But with 2. there's a problem, as the pages from the file,
> > which are spliced into the pipe are still shared without
> > copy on write with the file(system).
> 
> Well, honestly, that's really the whole point of splice. It was
> designed to be a way to share the storage data without having to go
> through a copy.
> 
> > I'm wondering if there's a possible way out of this, maybe triggered by a new
> > flag passed to splice.
> 
> Not really.
> 
> So basically, you cannot do "copy on write" on a page cache page,
> because that breaks sharing.
> 
> You *want* the sharing to break, but that's because you're violating
> what splice() was for, but think about all the cases where somebody is
> just using mmap() and expects to see the file changes.
> 
> You also aren't thinking of the case where the page is already mapped
> writably, and user processes may be changing the data at any time.
> 
> > I looked through the code and noticed the existence of IOMAP_F_SHARED.
> 
> Yeah, no. That's a hacky filesystem thing. It's not even a flag in
> anything core like 'struct page', it's just entirely internal to the
> filesystem itself.

It's the mechanism that the filesystem uses to tell the generic
write IO path that the filesystem needs to allocate a new COW extent
in the backing store because it can't write to the original extent.
i.e. it's not allowed to overwrite in place.

It's no different to the VM_SHARED flag in the vma so the generic
page fault path knows if it has to allocate a new COW page to take
place on a write fault because it can't write to the original page.
i.e. it's not allowed to overwrite in place.

So by the same measure, VM_SHARED is a "hacky mm thing". It's not
even a flag in anything core like 'struct page', it's just entirely
internal to the mm subsystem itself.

COW is COW is COW no matter which layer implements. :/

> > Is there any other way we could archive something like this?
> 
> I suspect you simply want to copy it at splice time, rather than push
> the page itself into the pipe as we do in copy_page_to_iter_pipe().
> 
> Because the whole point of zero-copy really is that zero copy. And the
> whole point of splice() was to *not* complicate the rest of the system
> over-much, while allowing special cases.
> 
> Linux is not the heap of bad ideas that is Hurd that does various
> versioning etc, and that made copy-on-write a first-class citizen
> because it uses the concept of "immutable mapped data" for reads and
> writes.
> 
> Now, I do see a couple of possible alternatives to "just create a stable copy".
> 
> For example, we very much have the notion of "confirm buffer data
> before copying". It's used for things like "I started the IO on the
> page, but the IO failed with an error, so even though I gave you a
> splice buffer, it turns out you can't use it".
> 
> And I do wonder if we could introduce a notion of "optimistic splice",
> where the splice works exactly the way it does now (you get a page
> reference), but the "confirm" phase could check whether something has
> changed in that mapping (using the file versioning or whatever - I'm
> hand-waving) and simply fail the confirm.
> 
> That would mean that the "splice to socket" part would fail in your
> chain, and you'd have to re-try it. But then the onus would be on
> *you* as a splicer, not on the rest of the system to fix up your
> special case.
> 
> That idea sounds fairly far out there, and complicated and maybe not
> usable. So I'm just throwing it out as a "let's try to think of
> alternative solutions".

Oh, that's sounds like an exact analogy to the new IOMAP_F_STALE
flag and the validity cookie we have in the iomap write path code.
The iomap contains cached, unserialised information, and the
filesystem side mapping it is derived from can change asynchronously
(e.g. by IO completion doing unwritten extent conversion). Hence the
cached iomap can become stale, and that's a data corruption vector.

The validity cookie is created when the iomap is built, and it is
passed to a filesystem callback when a folio is locked for copy-in.
This allows the IO path to detect that the filesystem side extent
map has changed during the write() operations before we modify the
contents of the folio. It is done under the locked folio so that the
validation is atomic w.r.t. the modification to the folio contents
we are about to perform.

On detection of a cookie mismatch, the write operation then sets the
IOMAP_F_STALE flag, backs out of the write to that page and ends the
write to the iomap. The iomap infrastructure then remaps the file
range from the offset of the folio at which the iomap change was
detected.  The write the proceeds with the new, up to date iomap....

We have had a similar "is the cached iomap still valid?" mechanism
on the writeback side of the page cache for years. The details are
slightly different, though I plan to move that code to use the same
IOMAP_F_STALE infrastructure in the near future because it
simplifies the writeback context wrapper shenanigans an awful lot.
And it helps make it explicit that iomaps are cached/shadowed
state, not the canonical source of reality.

Applying the same principle it to multiply referenced cached page
contents will be more complex. I suspect we might be able to
leverage inode->i_version or ctime as the "data changed" cookie as
they are both supposed to change on every explicit user data
modification made to an inode. However, I think most of the
complexity would be in requiring spliced pages to travel in some
kind of container that holds the necessary verification
information....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

