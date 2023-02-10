Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4EF692576
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 19:37:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=45HS3XcRsfRS5VbZ2TiXDHQBLKSDRISNQErTXQPnH+g=; b=BAeZTBgzA43XCWvlFuqWHVYiOB
	6Aj5w/hn9wM67L91Zw/IwyF4TclgvJxM5tlBLG+ziyUjRLifbEVdIxqnAs/yW0pfLiNV0fV6dzdWB
	YclkXEb00zoO1naidsGdkbdX19GGXmphLHAPs9GaKk1kTWDHVn+uWj7N7pFICR2onE19E0ccV/9d6
	U12TN64AQBKeV/YlZtP+xeIaV+t/iNlfzHnazJAW/RV96nX/KSfElmv4TrnIT+K1BSbgMPhYPe+Bj
	rP+98SFxuuCK3oBrXmWR4/z4dqddpZnQFjs9O82Wps9pnMlAv1I0++oKh/oOQkwzkZyNodCeJWnqe
	9YXveZ+A==;
Received: from ip6-localhost ([::1]:53248 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQYH0-00B5t2-2L; Fri, 10 Feb 2023 18:37:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:46634) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQYGv-00B5st-SO
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 18:37:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so4699040wmb.5
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 10:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=45HS3XcRsfRS5VbZ2TiXDHQBLKSDRISNQErTXQPnH+g=;
 b=fA28mHicQVXU0rc9eizNL3RpJL4UanQ9gfQOBZ57SNqi5RpYK6zoS094B9dEWMLQUJ
 VDR5+QKCsCoY483JdS84PYO+YawCsU7ivhQXQygIuTrEgqYgXEUqNL9o00YmCoBr4cj0
 8loINQ8lMH5qSDzADuKONPbLiCHUOVpr3CWx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=45HS3XcRsfRS5VbZ2TiXDHQBLKSDRISNQErTXQPnH+g=;
 b=VJdFOaDItbeW16F2WyJYWSW6FUXI1EFU8Do9FbbNnVyWdAY2dB49dzy0oYTc73n5qW
 2KYc+aaBxNApgzPHUp0UOJTYb5KwFtGEWr9yC93e2+Yf3AoiDHWniXtOdyC1dEnAwYgM
 U89f3xPeqCvQXW351ZiqSs5JhUJPC97lWJpkDTxbrCMZHsh2AslxWPlse8Zg7VI45ku9
 K8FVUw7OrQm1Sx+3FHvn+lykTBGu3UL2iejQ6ynl1sjUuDwUIyJEVG1sKXiWslsXUVm7
 aWFDb8y4EZFaRz5+DdJCYGc5vzxaCWinA9xyShG2B71dLScwDX1f9y6sT8gFVJl1USix
 C1hw==
X-Gm-Message-State: AO0yUKVRq/6MvC2+LHi7QWUdacYr5801iG1q+hcB7ZHGqDb0GSpfpnm1
 mq2VOMvq3OfPjVPeHlemULEf8XUHjehzZ+agPrs=
X-Google-Smtp-Source: AK7set//1Cfo6pQqecIsd70RSq3XmV+buudz2wQh0trHDw1Z54/aQNMv9SynIXJ7vZISIYffAVEjcw==
X-Received: by 2002:a05:600c:2e94:b0:3df:e46f:c226 with SMTP id
 p20-20020a05600c2e9400b003dfe46fc226mr13279404wmn.16.1676054240747; 
 Fri, 10 Feb 2023 10:37:20 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 q9-20020adff789000000b002c3f022945fsm4250800wrp.77.2023.02.10.10.37.19
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 10:37:19 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id fj20so5486519edb.1
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 10:37:19 -0800 (PST)
X-Received: by 2002:a50:f61e:0:b0:4ab:168c:dbd7 with SMTP id
 c30-20020a50f61e000000b004ab168cdbd7mr1816109edn.5.1676054239147; Fri, 10 Feb
 2023 10:37:19 -0800 (PST)
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
In-Reply-To: <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
Date: Fri, 10 Feb 2023 10:37:01 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjQZWMeQ9OgXDNepf+TLijqj0Lm0dXWwWzDcbz6o7yy_g@mail.gmail.com>
Message-ID: <CAHk-=wjQZWMeQ9OgXDNepf+TLijqj0Lm0dXWwWzDcbz6o7yy_g@mail.gmail.com>
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

On Fri, Feb 10, 2023 at 9:57 AM Andy Lutomirski <luto@kernel.org> wrote:
>
> I am saying exactly what I meant.  Obviously mutable data exists.  I'm
> saying that *putting it in a pipe* *while it's still mutable* is not
> good.  Which implies that I don't think splice() is good.  No offense.

No offense at all. As mentioned, I have grown to detest splice over the years.

That said, in defense of splice(), it really does solve a lot of
conceptual problems.

And I still think that conceptually it's absolutely lovely in *theory*.

And part of it is very much the fact that pipes are useful and have
the infrastructure for other things. So you can mix regular read/write
calls with splice, and it actually makes sense. One of the design
goals was for things like static http, where you don't really send out
just file contents, there's a whole header to it as well.

So it's not just a specialized "send file contents to network", it's a
"you can do a write() call to start filling the pipe buffer with the
http header, then a splice() to start filling the file data".

And it was also designed to allow other sources, notably things like
video capture cards etc. And very much multiple destinations (again,
media accelerators).

So it all "makes sense" conceptually as a generic pipe (sic) between
different sources and sinks. And again, using a pipe as the mechanism
then also makes perfect sense in a historical Unix context of
"everything is a pipe".

But.

The above just tries to make sense of the design, and excuses for it.
I want to re-iterate that I think it's all lovely and coherent
conceptually. But in practice, it's just a huge pain.

The same way "everything is a pipeline of processes" is very much
historical Unix and very useful for shell scripting, but isn't
actually then normally very useful for larger problems, splice()
really never lived up to that conceptual issue, and it's just really
really nasty in practice.

But we're stuck with it.

I'm not convinced your suggestion of extending io_uring with new
primitives is any better in practice, though.

          Linus

