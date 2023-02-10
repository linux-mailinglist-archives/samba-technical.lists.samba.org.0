Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9056925FB
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 20:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=6RHw9rkmwlod8gRPY6S3ICr33ENpr4HuArkf2tXrtn4=; b=gyQqJ1RVzFzwbqmbsNPVR4v8JY
	/dzZIa8VPhsOR12cONIPADeQFl8hdhcJOU24z1cozKlp+U5vBFScdW2FA+5tDgIMct3iLKS1He15i
	50ScSYh7mt8w2pEh7xRIQq7jIckHWxTxccWo/j2NG/8Ewr6a9M8hRMhjN/2F00uhBdH4GYq6hbgPl
	j8MS+KZeCYUcDhSAfdOv8BT7I4csf8lEnp+T7pRhNmKBpXyBSNqP5rFroNuK8jWq0/Z9VTg/P/8lo
	Gk3vVgOu3PslFNHv9b0J0w3izcu3S8QxqGL52K1M/s+rbAuauL+utN1TJ1UFTuQNfkwS+RjDvP33z
	HHq7HsJw==;
Received: from ip6-localhost ([::1]:35334 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQYew-00B73a-4w; Fri, 10 Feb 2023 19:02:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217]:45830) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pQYeq-00B73Q-PW
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 19:02:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7853961E00
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 19:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3850C4339C
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 19:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676055719;
 bh=E/qchUqCgMrqhO01lpil+Mub62mxWI4tbL+Ig99y+6M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=p6xPn91DE7NoATNOduE0KuiOuTEkgFsg5VacKvIvDRfe/vfYfV/1bwKENb3WkvOzs
 +hVNhsLWq3rKZQqyo5lTqFDP3tejYN/LK+Cw6PGfrfE0rhAA5Z+Z80RES1MxWMnXNq
 hYc+9+G8xrFqY3VuFfmgl8gxGhl3D+AlBzK4MbpxudT2s3gLNossYZTRU/1d72oBTL
 LjGpMmhmDivwCMtdnZzMGnmAnNnu/52i2zpLLV+CvV7PGPtXaBG9Y9IA3TeFJuZS58
 zAa5qOkDoj6TIWVIIr+/37nlRlALzbaqmETaJCyf3scObdsnCBla18gVWbfHCHGzvb
 98z1awxhl8Vag==
Received: by mail-ed1-f45.google.com with SMTP id u21so5551921edv.3
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 11:01:59 -0800 (PST)
X-Gm-Message-State: AO0yUKXFPPfNQSYJ51wGOqcidZ2YIIr+HpNNFmzwQY5inVEswD3f7SoJ
 YGbsOg9RABRSVjLKcWxp0xz4jAwht1qYrNqiCaOKFw==
X-Google-Smtp-Source: AK7set9x9pw6hgD2dW1+GN20k1m5aEU1KvaMWkyLee7gBmQ0A5OhpixKJfIx8bgUWu+TViK+cwHUCyEdTDQ4IxJllj8=
X-Received: by 2002:a50:d595:0:b0:4ac:b481:2b7c with SMTP id
 v21-20020a50d595000000b004acb4812b7cmr201420edi.2.1676055718121; Fri, 10 Feb
 2023 11:01:58 -0800 (PST)
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
In-Reply-To: <CAHk-=wjQZWMeQ9OgXDNepf+TLijqj0Lm0dXWwWzDcbz6o7yy_g@mail.gmail.com>
Date: Fri, 10 Feb 2023 11:01:46 -0800
X-Gmail-Original-Message-ID: <CALCETrWuRHWh5XFn8M8qx5z0FXAGHH=ysb+c6J+cqbYyTAHvhw@mail.gmail.com>
Message-ID: <CALCETrWuRHWh5XFn8M8qx5z0FXAGHH=ysb+c6J+cqbYyTAHvhw@mail.gmail.com>
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

On Fri, Feb 10, 2023 at 10:37 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Feb 10, 2023 at 9:57 AM Andy Lutomirski <luto@kernel.org> wrote:
>
> I'm not convinced your suggestion of extending io_uring with new
> primitives is any better in practice, though.


I don't know if I'm really suggesting new primitives.  I think I'm
making two change suggestions that go together.

First, let splice() and IORING_OP_SPLICE copy (or zero-copy) data from
a file to a socket.

Second, either make splice more strict or add a new "strict splice"
variant.  Strict splice only completes when it can promise that writes
to the source that start after strict splice's completion won't change
what gets written to the destination.


I think that strict splice fixes Stefan's use case.  It's also easier
to reason about than regular splice.


The major caveat here is that zero-copy strict splice is fundamentally
a potentially long-running operation in a way that zero-copy splice()
isn't right now.  So the combination of O_NONBLOCK and strict splice()
(the syscall, not necessarily the io_uring operation) to something
like a TCP socket requires complicated locking or change tracking to
make sense.  This means that a splice() syscall providing strict
semantics to a TCP socket may just need to do a copy, at least in many
cases.  But maybe that's fine -- very-high-performance networking is
moving pretty aggressively to io_uring anyway.


And my possibly-quite-out-there claim is that, if Linux implements
strict splice, maybe non-strict splice could get replaced in a user
ABI-compatible manner with a much simpler non-zero-copy
implementation.  And strict splice from a file to a pipe could be
implemented as a copy -- high performance users can, if needed, start
strict-splicing from a file directly to a socket.

