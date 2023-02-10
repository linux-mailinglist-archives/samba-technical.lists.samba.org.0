Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCB8692462
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 18:24:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=jK4GcD8hacKVWz6zl8bBrz233whrxcoTUY/2ygZZfmc=; b=YoY8BKd6/ACRy2wO+rmaCiCLZh
	xDdGyIPIjJEFhi8Xi59xyhsSveCtB+RvCO1p8zAjwEcEnpG6roQifc+XEarMeHehO80Y7S/mQX44O
	OmIdMTa1aPHRM/djG1Fk+OMU24hFNTyWPZudIeihpp3vrgJMEE+MHzHln+0pvZTNa3MY2E9tB0fAg
	5e+NKC0nnXOJpt5G09NJpV+GlusqMNhEzYxmV6q/kgR8dPCKbZAlhIuk2nfxH4et6sU14XwTL0coo
	IFTUCFVeKcI7ftch6i/xc9RDJLSxW2EdkooAyQ4ko8JybYVQqBaJRBvX+Rzqj5qVvanRwRhE96z50
	OTx60Eyg==;
Received: from ip6-localhost ([::1]:48190 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQX8E-00B27U-SJ; Fri, 10 Feb 2023 17:24:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36363) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQX8A-00B27L-Kw
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 17:24:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so6791881wma.1
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 09:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jK4GcD8hacKVWz6zl8bBrz233whrxcoTUY/2ygZZfmc=;
 b=M2jDhbmblGLdfowPWsAysOenXMHJGfjKF4XBxa3qOAJbzKq8BVW5Bi70WAjt5O9fGN
 qp+ANsnVyXQKsU16qsl+FTAEnXVOzh8BC6x36hX/4beu9BTYwt7CqPuJFw/mHj4k+UR8
 H8YDYi8jHuZgdrghm16rzRYLYR86rDIbo1cgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jK4GcD8hacKVWz6zl8bBrz233whrxcoTUY/2ygZZfmc=;
 b=Cl8IpPFvdS0st9P/pU3flq3R8UQxE5NcimW+1lbnGl/zEqPeYYNN4osNweOA8BDhaj
 sKreFdnxTJYpedlm1Kab+UJPN6B2xPGjFRMixap7b8Dn9OGjhtf9K23m0ePZZNpK/RHe
 qxN/0BW0bEAxQwxYSqxmVwNRu0R4tckP2lhSx7xM4sKdjVE4l+SkKazNXOElOTYgycry
 BCKoDv1Zd5oKzK2gVz8cOAOW7klhKf6JW+AGsfTDSAA4TFYWAFIYTGljzHHUu5lvsKby
 OjN+7EwzQupyUFrsORhARxiyp4spV1GGUtsgng2Bh16R9Xkjo+U+I95DOAQ/VtN+I6qf
 BuiQ==
X-Gm-Message-State: AO0yUKUVbN/yyN9F5TiXtCwHYUF9Y9oKVb5Y9iUQUXcpGiRz19YuL0l6
 cwfnErmXD7PuQ2EOVvbby59J63IOOovC3iauOWw=
X-Google-Smtp-Source: AK7set9cQjML/4lJrU2dKbxZM1NUiglD3WCebTFCmpjc2dEqGJBB5tn8Nh3+iJRDa95JL5vwT6j4kA==
X-Received: by 2002:a05:600c:4b07:b0:3dc:3b29:7a4 with SMTP id
 i7-20020a05600c4b0700b003dc3b2907a4mr2705097wmp.0.1676049853201; 
 Fri, 10 Feb 2023 09:24:13 -0800 (PST)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com.
 [209.85.218.50]) by smtp.gmail.com with ESMTPSA id
 p1-20020a1c7401000000b003cfa622a18asm9093397wmc.3.2023.02.10.09.24.12
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 09:24:12 -0800 (PST)
Received: by mail-ej1-f50.google.com with SMTP id p26so17682214ejx.13
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 09:24:12 -0800 (PST)
X-Received: by 2002:a17:906:4e46:b0:87a:7098:ca09 with SMTP id
 g6-20020a1709064e4600b0087a7098ca09mr3050972ejw.78.1676049852037; Fri, 10 Feb
 2023 09:24:12 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <CAHk-=wip9xx367bfCV8xaF9Oaw4DZ6edF9Ojv10XoxJ-iUBwhA@mail.gmail.com>
 <20230210061953.GC2825702@dread.disaster.area>
In-Reply-To: <20230210061953.GC2825702@dread.disaster.area>
Date: Fri, 10 Feb 2023 09:23:55 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj6jd0JWtxO0JvjYUgKfnGEj4BzPVOfY+4_=-0iiGh0tw@mail.gmail.com>
Message-ID: <CAHk-=wj6jd0JWtxO0JvjYUgKfnGEj4BzPVOfY+4_=-0iiGh0tw@mail.gmail.com>
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
From: Linus Torvalds via samba-technical <samba-technical@lists.samba.org>
Reply-To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Feb 9, 2023 at 10:19 PM Dave Chinner <david@fromorbit.com> wrote:
>
> Splice has two sides - a source where we splice to the transport
> pipe, then a destination where we splice pages from the transport
> pipe. For better or worse, time in the transport pipe is unbounded,
> but that does not mean the srouce or destination have unbound
> processing times.

Well, they are possibly fairly unbounded too - think things like
network packet re-send timeouts etc.

So the data lifetime - even just on just one side - can _easily_ be
"multiple seconds" even when things are normal, and if you have actual
network connectivity issues we are easily talking minutes.

So I don't think a scheme based on locking works even for just the
"one side" operations - at least in the general case.

That said, I wasn't really serious about my "retry" model either.
Maybe it could be made to work, but it sounds messy.

And when it comes to networking, in general things like TCP checksums
etc should be ok even with data that isn't stable.  When doing things
by hand, networking should always use the "copy-and-checksum"
functions that do the checksum while copying (so even if the source
data changes, the checksum is going to be the checksum for the data
that was copied).

And in many (most?) smarter network cards, the card itself does the
checksum, again on the data as it is transferred from memory.

So it's not like "networking needs a stable source" is some really
_fundamental_ requirement for things like that to work.

But it may well be that we have situations where some network driver
does the checksumming separately from then copying the data.

               Linus

