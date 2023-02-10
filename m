Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6983069264F
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 20:28:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=mJvEE36AdMeH3sIvvfWubmnVmU4slCx5aMtae9s80iE=; b=vefVRoPUBoGP69CRNxx7N7+VsV
	lxzq2JoJKjs+TxkwDdcr5LINQIYPn+vVyki0qIGIVJk6kgun6zqQH/B2Dhv68kZmyxbJNpd6QRHFP
	09A/rcTXsiiAZQFAlswdH3+Xsk17ubPHX205pM9R8w17xgQFSGkO8sa2jseDxzgw6lh+YQycHvUoZ
	8O4XOrChqOw+Z2gdQQbPHP9nSjw/VnFE9An8CGjmCejhdMk1rtdqBLQa9lyqPGpqIEOCFHPHiqhiM
	AYRFmvzP4IaazcmNV3X2muLz3jT5XSUmW+OBhAF7F+FYQUbN0uXmvtTJ0jyTW2/K6H+7z640uYWt2
	qXgyfLWg==;
Received: from ip6-localhost ([::1]:45802 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQZ3z-00B8W9-2W; Fri, 10 Feb 2023 19:28:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32822) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQZ3t-00B8W0-Uk
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 19:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=mJvEE36AdMeH3sIvvfWubmnVmU4slCx5aMtae9s80iE=; b=LJ8QZ6feDCvHew+AkUbWfDtlfl
 8RJc5UUKLvvifcHrKLNJbFZat0vqwYMk0bCk7Nwo6Cy43H+crmjQEw8Ape5Jq8863KK8RgysL4ESx
 muytWsRWCZj8CxUOlJTe/7xgt606cvWzuwZdDleIwAdgyflErcUJbYwIxjNNkQbRjbV+6H+6ehU+q
 LJh1BSLmMphQ90H9RTgiS3GDcdFqGoWczJKRTnQl0iQ5r2KJ+dLoD+d5e7QiTpQxG5K64GMzc9jn7
 tbIdHKP7WDLKnArjHAUdbmX4nDUasTDhtDI4GjwwQwP8CePGbLMoNIAQ2se2Dfqj24squHpcIUj9G
 IXkLS4Cd3oufwE3FRrpTSczWBdq4DfD8rj0rUU5lVqXMV/d/BdlKO4jV8qtnglT9K4opAKFtxQsdu
 kRr9aNZ2QgQMRCydDY2SO5AiWCB5suKDBd2kNlHbb0H8FSG4jecDa2mS1OHFRggws53Hro/BdBCdn
 aMjb7mbgBYd6ypqeubyWIgkz;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pQZ3r-00D3HT-6F; Fri, 10 Feb 2023 19:27:55 +0000
Date: Fri, 10 Feb 2023 11:27:51 -0800
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+aat8sggTtgff+A@jeremy-acer>
References: <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
 <20230210065747.GD2825702@dread.disaster.area>
 <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
 <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
 <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
 <CAHk-=wjQZWMeQ9OgXDNepf+TLijqj0Lm0dXWwWzDcbz6o7yy_g@mail.gmail.com>
 <CALCETrWuRHWh5XFn8M8qx5z0FXAGHH=ysb+c6J+cqbYyTAHvhw@mail.gmail.com>
 <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
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

On Fri, Feb 10, 2023 at 11:18:05AM -0800, Linus Torvalds via samba-technical wrote:
>
>We should point the fingers at either the _user_ of splice - as Jeremy
>Allison has done a couple of times - or we should point it at the sink
>that cannot deal with unstable sources.
> ....
> - it sounds like the particular user in question (samba) already very
>much has a reasonable model for "I have exclusive access to this" that
>just wasn't used

Having said that, I just had a phone discussion with Ralph Boehme
on the Samba Team, who has been following along with this in
read-only mode, and he did point out one case I had missed.

1). Client opens file with a lease. Hurrah, we think we can use splice() !
2). Client writes into file.
3). Client calls SMB_FLUSH to ensure data is on disk.
4). Client reads the data just wrtten to ensure it's good.
5). Client overwrites the previously written data.

Now when client issues (4), the read request, if we
zero-copy using splice() - I don't think theres a way
we get notified when the data has finally left the
system and the mapped splice memory in the buffer cache
is safe to overwrite by the write (5).

So the read in (4) could potentially return the data
written in (5), if the buffer cache mapped memory has
not yet been sent out over the network.

That is certainly unexpected behavior for the client,
even if the client leased the file.

If that's the case, then splice() is unusable for
Samba even in the leased file case.

>   Maybe this thread raised some awareness of it for some people, but
>more realistically - maybe we can really document this whole issue
>somewhere much more clearly

Complete comprehensive documentation on this would
be extremely helpful (to say the least :-).

