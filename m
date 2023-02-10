Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2F669262C
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 20:18:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rqdkVXcgxfdy1Dm/8iJj45I844hMpjNCthfme++2m+A=; b=IOhVIFWKXgIgU3Xo5ZLkXpQCnk
	mniSyHAFf6bsVNu9dy3coC/ZIUloSTZU0HpZLDetxdkez7PbOEeYu51IF2XMdxcsWD1hteIVteI04
	LDTECY44FJGdSj/sbvJZSHUxEWfK98wIsKUaEPNr+awbteaCLR34Y/ZdwrjDh9AEt69iG2rvFkxKP
	DyPZ82sgnQuGwL5u7+OdbbbrR8TM7lTnU544ix73QAIiL0SK+ssdEMoK21sYxQ6ZGOZP4WTj6RfPV
	AYZ1LmhXqRiJjKzeODW/NLKCNHhvDdlhiMPzoSikufpOzw5Moc+Xt0d7HOgIhxjbfEbMiaQvE5H+r
	oLGUbI3g==;
Received: from ip6-localhost ([::1]:60598 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQYul-00B8BE-7D; Fri, 10 Feb 2023 19:18:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:44601) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQYuf-00B8B5-RC
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 19:18:27 +0000
Received: by mail-wr1-x429.google.com with SMTP id bk16so6010122wrb.11
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 11:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rqdkVXcgxfdy1Dm/8iJj45I844hMpjNCthfme++2m+A=;
 b=HXeP/zJ0VPZo44pu1T+InLR2v6BSFVt8KQxTIxDwhqwt5QJO3Gq4TOrcF1bpZ27GKI
 Elg9+Al61hYH5yP/e3IOrLmM53/MBZegt7gZ4ga+ZMwPbD78nkcecLkPqgjH4g8cjArx
 Fz2U4FUs2ho/9WBlfzAxyolkW7zXzrMdaNn+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rqdkVXcgxfdy1Dm/8iJj45I844hMpjNCthfme++2m+A=;
 b=OH7R8rjeMFvA86xbpsGLfvW4PRrXNpXfzgqG0hnTJWy032WSquSkg9NwGFrKhmfEuq
 r3GaTSozdb+31sudAjMxP7vNcSXFtdePGzI6wXGskE1Mf1dlM/fw6l7VVOrXpWGcr4ap
 4QlT1YF+4vKWdYC2w73KTDaJhabPaI5DQdM45MvHVb6GYhpxciiWYsPz6XcGICnjpnLY
 9rbUdube5yyfzhXp3d5VHdvXWR1Q9Wu7sKXhacZ1Xe7U0jq8hMoERsTJC8LidUDsU0od
 heaju0aCYrLANB0ECZ4Z0bqNVeM3dLB6jUQJjQxnpk7o2bXNvZtM7y1zTmEI8bWvPHom
 oM8w==
X-Gm-Message-State: AO0yUKXhmkranv4xmlBS8rwMZs7QDrUYGFOUa9ktPkek8g7uJ1pWuoUk
 G5i155fYKA1PEruJRh+T2DSbU/mGSY3/F5V1mX4=
X-Google-Smtp-Source: AK7set8NemyEgWr4ZEds4errJ4xTND6YCeyUEv7Nfa6nT503tK30qfjzlR/G5jKwn4BpxNypDwcxgQ==
X-Received: by 2002:adf:db45:0:b0:2c5:4ce5:5897 with SMTP id
 f5-20020adfdb45000000b002c54ce55897mr914144wrj.32.1676056704385; 
 Fri, 10 Feb 2023 11:18:24 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 s21-20020a1cf215000000b003e001119927sm8687424wmc.24.2023.02.10.11.18.23
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 11:18:23 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id cq19so2853770edb.5
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 11:18:23 -0800 (PST)
X-Received: by 2002:a50:f603:0:b0:49d:ec5e:1e98 with SMTP id
 c3-20020a50f603000000b0049dec5e1e98mr3187606edn.5.1676056702919; Fri, 10 Feb
 2023 11:18:22 -0800 (PST)
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
In-Reply-To: <CALCETrWuRHWh5XFn8M8qx5z0FXAGHH=ysb+c6J+cqbYyTAHvhw@mail.gmail.com>
Date: Fri, 10 Feb 2023 11:18:05 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
Message-ID: <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
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

On Fri, Feb 10, 2023 at 11:02 AM Andy Lutomirski <luto@kernel.org> wrote:
>
> Second, either make splice more strict or add a new "strict splice"
> variant.  Strict splice only completes when it can promise that writes
> to the source that start after strict splice's completion won't change
> what gets written to the destination.

The thing ius, I think your "strict splice" is pointless and wrong.

It's pointless, because it simply means that it won't perform well.

And since the whole point of splice was performance, it's wrong.

I really think the whole "source needs to be stable" is barking up the
wrong tree.

You are pointing fingers at splice().

And I think that's wrong.

We should point the fingers at either the _user_ of splice - as Jeremy
Allison has done a couple of times - or we should point it at the sink
that cannot deal with unstable sources.

Because that whole "source is unstable" is what allows for that higher
performance. The moment you start requiring stability, you _will_ lose
it. You will have to lock the page, you'll have to umap it from any
shared mappings, etc etc.  And even if there are no writers, or no
current mappers, all that effort to make sure that is the case is
actually fairly expensive.

So I would instead suggest a different approach entirely, with several
different steps:

 - make sure people are *aware* of this all.

   Maybe this thread raised some awareness of it for some people, but
more realistically - maybe we can really document this whole issue
somewhere much more clearly

 - it sounds like the particular user in question (samba) already very
much has a reasonable model for "I have exclusive access to this" that
just wasn't used

 - and finally, I do think it might make sense for the networking
people to look at how the networking side works with 'sendpage()'.

Because I really think that your "strict splice" model would just mean
that now the kernel would have to add not just a memcpy, but also a
new allocation for that new stable buffer for the memcpy, and that
would all just be very very pointless.

Alternatively, it would require some kind of nasty hard locking
together with other limitations on what can be done by non-splice
users.

                Linus

