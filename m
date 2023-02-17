Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3870F69B654
	for <lists+samba-technical@lfdr.de>; Sat, 18 Feb 2023 00:14:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=tDkW7rjBzM40kDWNlaZlCegdM5LR+LY+lS+/AL9wT4M=; b=GRhoedWlXb28KP8TJeD15ONjFI
	VElEsoNvG8wn6dxbcbfhNzrdAur+bxtvtwiFn7ygshhf0WV7PLeIuXKVz7TuV4wm2YlMO3cL40491
	2r6OrK5xBFSFFRLCcawVOkOH8BSn1L41xL31fRy92oZnqzRJcm7YixgJiIZKwuX8Q/hMOhaFOYfdg
	bARj45jLz/GO3sJS4sZHFdYsmGUazY6PK4PW/ZT6GZe13cfrwDAbwWc1wlEHM1O4RCp6JMtlaEWhP
	oo0XLz/a0w5ETcELFBpcfw7dY2vtgoTPjr44mtVC989a8MnGZl0kWWJGUvCzycHr1K9K0kfx+gy0z
	9MtPRC9w==;
Received: from ip6-localhost ([::1]:61650 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pT9v9-00D6vM-K7; Fri, 17 Feb 2023 23:13:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217]:48616) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pT9v4-00D6vC-Qi
 for samba-technical@lists.samba.org; Fri, 17 Feb 2023 23:13:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 364C862093
 for <samba-technical@lists.samba.org>; Fri, 17 Feb 2023 23:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95156C433EF
 for <samba-technical@lists.samba.org>; Fri, 17 Feb 2023 23:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676675608;
 bh=007Ju5hmo469I+GLbhKmQyFOblRRKqP7+IKJhGVg3Bc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FVQuLHu9su+8MtuqreGX0M6eUP2draqAXJj4M0+8pCp7wP3cq/lR7ACHIf24dTWkq
 b+prnybkvEZUYcirmWUlld+/8oqr6Nlbu01GGr+WwVByKApBo1afHnsziIFQI2erWf
 EGwGBTF+S6LSfMq241TKKmHuZRPX6qF35zA6vNp9ovpCBLGLSuQb95HK4Pn/rKOk+N
 Q29erYenPL3+a3yt35AFu9AbVpoMWykSXPezSdlvTG0r5dcYRXTe3mPJC9QqOkNZ6+
 ArzBr6bVo48aEYAhQoN4OGqbh5dK+dGwwlaEtAELclY4hqR6CWmZhFUEuGC2Xr7W+S
 OAFm4QbGrDmsw==
Received: by mail-ed1-f53.google.com with SMTP id h14so10230467edz.10
 for <samba-technical@lists.samba.org>; Fri, 17 Feb 2023 15:13:28 -0800 (PST)
X-Gm-Message-State: AO0yUKXQSkS9Ok/n/QWiY5p54lDYyjNPrAWTDPHwsfiI/hOxNDXIhJus
 f57NAzzUDxP/LbYxkKRyWEcs5QUPBguN/N/Ti53d5Q==
X-Google-Smtp-Source: AK7set8/bNsrYafbYm0zAE3nFVOlai7VLZ8imlSdGrFod1cdz9z2k4ibd74H3rjwb0A7aOD2eNsBGzV5MLYpkJRFYLE=
X-Received: by 2002:a17:907:6c14:b0:8ae:cb48:3c80 with SMTP id
 rl20-20020a1709076c1400b008aecb483c80mr5175474ejc.7.1676675606807; Fri, 17
 Feb 2023 15:13:26 -0800 (PST)
MIME-Version: 1.0
References: <20230210061953.GC2825702@dread.disaster.area>
 <Y+oCBnz2nLtXrz7O@gondor.apana.org.au>
 <CALCETrXKkZw3ojpmTftur1_-dEi6BOo9Q0cems_jgabntNFYig@mail.gmail.com>
 <Y+riPviz0em9L9BQ@gondor.apana.org.au>
In-Reply-To: <Y+riPviz0em9L9BQ@gondor.apana.org.au>
Date: Fri, 17 Feb 2023 15:13:14 -0800
X-Gmail-Original-Message-ID: <CALCETrXr8vRPqEjhSg7=adQcM7OfWs_+fn2xP5OQeLXAaLzHHQ@mail.gmail.com>
Message-ID: <CALCETrXr8vRPqEjhSg7=adQcM7OfWs_+fn2xP5OQeLXAaLzHHQ@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Herbert Xu <herbert@gondor.apana.org.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: axboe@kernel.dk, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 metze@samba.org, viro@zeniv.linux.org.uk, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel@vger.kernel.org, samba-technical@lists.samba.org,
 torvalds@linux-foundation.org, io-uring@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

> On Feb 13, 2023, at 5:22 PM, Herbert Xu <herbert@gondor.apana.org.au> wro=
te:
>
> =EF=BB=BFOn Mon, Feb 13, 2023 at 10:01:27AM -0800, Andy Lutomirski wrote:
>>
>> There's a difference between "kernel speaks TCP (or whatever)
>> correctly" and "kernel does what the application needs it to do".
>
> Sure I get where you are coming from.  It's just that the other
> participants in the discussion were thinking of stability for the
> sake of TCP (or TLS or some other protocol the kernel implements)
> and that simply is a non-issue.

I can certainly imagine TLS or similar protocols breaking if data
changes if the implementation is too clever and retransmission
happens.  Suppose 2000 bytes are sent via splice using in-kernel TLS,
and it goes out on the wire as two TCP segments.  The first segment is
dropped but the second is received.  The kernel resends the first
segment using different data.  This really ought to cause an integrity
check at the far end to fail.

I don't know if any existing kTLS is clever enough to regenerate
outgoing data when it needs to retransmit a segment, but it would be
an interesting optimization for serving static content over TLS.



>
> Having a better way to communicate completion to the user would be
> nice.  The only way to do it right now seems to be polling with
> SIOCOUTQ.
>
>

