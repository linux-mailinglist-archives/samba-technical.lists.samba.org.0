Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DE14F69223C
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 16:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Xe1cYcRxDPeomQCENqFNq0VpelLMT7gF9ElzvrGiLtE=; b=i9ot3nKBw3Hlw6SdYcLXPSXeIx
	un1Z5mDaQ+47ZM7Yp3QLEx4RusVRvlzkvaW7ERzw3rMicnMBph60CXIW85RSnkFMsOQ8hcvwEGr1P
	JP6FnGeJkWEmKimcT17qS1oxBUa6dSYRC5B/p/Pz8ceN+bqnBveescwU1t/7Lvc0MwSgOMGHrU6+1
	/WshHCZhBJxOFtlYyKqGbz5eKIgtN+a7d3WAA/mNjcMuY3bLkCqCNkhy/65PTFzVIZEUKwb9I+kJZ
	uZu3UO7k955vTDluAKlygsCh0+vMYfDlOghzpfVIApAGqKBQ0/sC4UEJhPZ76ev7ewMykM3aGFbzw
	3cqSG3/A==;
Received: from ip6-localhost ([::1]:49044 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQVNv-00B167-Vh; Fri, 10 Feb 2023 15:32:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217]:45066) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pQVNq-00B15y-DO
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 15:32:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9352961DFE
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 15:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03022C433A1
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 15:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676042109;
 bh=ASNHadyozyLIGhBVrhVI7EFdVirhfiV1fq9KsBAOwjw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=VklJnD6zWz6k/285Nxbc426a8iy7awLNZLUt+bx8D+9w6gNcPVLOiEhxm/uutYb6T
 YFn2xmFO+yjYuMk0nxEffW7Zk+b59KUWni6zGRjK9aB1l6a9Py1mSyUpb/neh5oPxN
 623Y959fjqcir7jqWT1aRloHl4mtlCiPQ/Yw2j8DR9WFu3jhtSxl+EJ4rmHLRwbOJe
 ivZRy64wvfG5MBAFyYN9Mi+u2tVlAkVONNKuGieU/lcoHdWKwr5U4PrrZcVRNTkHx3
 bETO+lCNqOSpMkYwsUbVSzP583C1XO7lOT0m6FD4TrzWTf9rEVzls/Sm2xBtOWYy1m
 clddAnHBbI8pQ==
Received: by mail-ej1-f46.google.com with SMTP id qw12so16757430ejc.2
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 07:15:08 -0800 (PST)
X-Gm-Message-State: AO0yUKVyhXRLvnT006DwGddvvI9BsKcmuOOMAC/fPBHGqIvEPR/URvoS
 lt3QoJjUtoBeXsfrLnFGP3yBtoo18twnT5yhX+tEeg==
X-Google-Smtp-Source: AK7set82uoXvXPMdWdCjmW9Ka6p9XO/hezpTDJigjecBYGrCBbgbcLwnXqm27c9nTy16gEHPF4kIoq/7kIfYYzOcQ9Y=
X-Received: by 2002:a17:907:1de6:b0:8ae:cb48:3c80 with SMTP id
 og38-20020a1709071de600b008aecb483c80mr1248578ejc.7.1676042107124; Fri, 10
 Feb 2023 07:15:07 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
 <20230210065747.GD2825702@dread.disaster.area>
In-Reply-To: <20230210065747.GD2825702@dread.disaster.area>
Date: Fri, 10 Feb 2023 07:14:55 -0800
X-Gmail-Original-Message-ID: <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
Message-ID: <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
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
From: Andy Lutomirski via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andy Lutomirski <luto@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Stefan Metzmacher <metze@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 9, 2023 at 10:58 PM Dave Chinner <david@fromorbit.com> wrote:
>
> On Fri, Feb 10, 2023 at 04:44:41AM +0000, Matthew Wilcox wrote:
> > On Fri, Feb 10, 2023 at 03:06:26PM +1100, Dave Chinner wrote:
> > > So while I was pondering the complexity of this and watching a great
> > > big shiny rocket create lots of heat, light and noise, it occurred
> >
> > That was kind of fun
>
> :)
>
> > > to me that we already have a mechanism for preventing page cache
> > > data from being changed while the folios are under IO:
> > > SB_I_STABLE_WRITES and folio_wait_stable().
> >
> > I thought about bringing that up, but it's not quite right.  That works
> > great for writeback, but it only works for writeback.  We'd need to track
> > another per-folio counter ... it'd be like the page pinning kerfuffle,
> > only worse.
>
> Hmmm - I didn't think of that. It needs the counter because the
> "stable request" is per folio reference state, not per folio state,
> right? And the single flag works for writeback because we can only
> have one writeback context in progress at a time?
>
> Yeah, not sure how to deal with that easily.
>
> > And for such a rare thing it seems like a poor use of 32
> > bits of per-page state.
>
> Maybe, but zero copy file data -> network send is a pretty common
> workload. Web servers, file servers, remote backup programs, etc.
> Having files being written whilst others are reading them is not as
> common, but that does happen in a wide variety of shared file server
> environments.
>
> Regardless, I just had a couple of ideas - it they don't work so be
> it.
>
> > Not to mention that you can effectively block
> > all writes to a file for an indefinite time by splicing pages to a pipe
> > that you then never read from.
>
> No, I wasn't suggesting that we make pages in transit stable - they
> only need to be stable while the network stack requires them to be
> stable....

This is exactly where the existing splice API is problematic.  You
can't splice from a file to a network socket right now.  First you
splice to a pipe, and now that pipe contains some magical stuff.  And
it stays there potentially forever.  Then you splice it again to a
socket.

Would this be better if user code could splice straight to a socket?
At least in principle, there could be a _limited_ amount of time
during which anything needs to wait, and it's fundamentally entirely
reasonable if a concurrent write to a file affects data being
zero-copied to a socket _during the time after the zero-copy send is
requested and before it reports completion_.

Frankly, I really don't like having non-immutable data in a pipe.  A
pipe is supposed to be a thing into which bytes are written and out
from which the *same* bytes emerge, at least to the extent that anyone
can observe it.  Do we really want:

$ some_program | tee file21 > file2

to potentially write different data to file1 and file2?

--Andy

