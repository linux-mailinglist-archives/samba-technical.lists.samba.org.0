Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E3B694E9D
	for <lists+samba-technical@lfdr.de>; Mon, 13 Feb 2023 19:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=rbJS8MwfUWdku7i6fPSGRxqZvVHoajyKbJvcc81ySQY=; b=G8tZQBWLnl4+etrtX4swchG/ex
	k0QqBBFFSIOKIuJISB+jpGxQkb7nvV4Sx4M5i5nnuXfF32O/hZ4JvwenuNcu2O1Lw3VWITg+ndh2l
	luo4egsN5hOTQVN7So2XXUBhuyV2KuvOzT6+L4YrLWEPe1P3EuHPGKU2f5LJMtcKK6tmVsfGV5YTF
	NJSmkYfUYYqHKHeVz4aR/5LvfnUnvbpDM5PoNsO3gAP+M7od56egqp9LPOkRPZ/honR6tOYf7REx0
	D2wisc85MtxURvaZoA15EKWRWP50ACHBSvoWkF3z1EwC8B1nZmkso2nHfEmXaLfxsEZmKTJfW1uWJ
	g6pFruzw==;
Received: from ip6-localhost ([::1]:61080 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pRd9M-00BrF7-2T; Mon, 13 Feb 2023 18:02:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75]:54320) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1pRd9F-00BrD7-HK
 for samba-technical@lists.samba.org; Mon, 13 Feb 2023 18:01:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 14703B8165F
 for <samba-technical@lists.samba.org>; Mon, 13 Feb 2023 18:01:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30BFC4339C
 for <samba-technical@lists.samba.org>; Mon, 13 Feb 2023 18:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676311301;
 bh=hUhMtFd+L7kU2UfBGgkzPSaKO2S0M+fHeGGsoULquzs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mJhto6ulcvsXEIAxzLZBgi5DE3HQnOQsI6Gk46sWL0sVxD7q5fL0cJnuqYKwEOSwH
 QM7RwPx/lHR3+uyZ1gUqbKoMlYlXH4Q8JGioqsLnmew3IrN5fyl8Gquc8B9gwz+y0X
 sAQ2pQWGRj8Ir0w66U53uiit6AirOHpcMDPAxpBsp+cpWDUEmcmWjWo9j42RmX7L+U
 dq1XejB2AnDNpbQFriMv9O0m/hhta5a5/LG0l+CIw/O6jIVwa+0qCiSAKlrcv6LfA3
 k83v2zHTBSZO//0FhTyuF7H8NpwnOMTUrCA5KTVzGQZw21Me8uigMyWLNbBGJpQErq
 dhowz+ufACTIA==
Received: by mail-ed1-f48.google.com with SMTP id c1so10298618edt.4
 for <samba-technical@lists.samba.org>; Mon, 13 Feb 2023 10:01:41 -0800 (PST)
X-Gm-Message-State: AO0yUKXbBDesu2lIthIBUcTE549BUT/JaAxf0Q4oizrOcVeSCF9VcPrE
 j+nMBGrCMyRDlRH98vGfuiuZlVb31QuB+MvFnOGrpw==
X-Google-Smtp-Source: AK7set9UjffZ8cIv9LXOfN7BXhlzgG3TlnmR1bNpfFvkCexf/s6su8bQqb/Qcrsj/09g6AsCSSy+hLqepFw/ZDipxP4=
X-Received: by 2002:a50:ba8d:0:b0:4ab:1c64:a9ed with SMTP id
 x13-20020a50ba8d000000b004ab1c64a9edmr5213538ede.2.1676311300124; Mon, 13 Feb
 2023 10:01:40 -0800 (PST)
MIME-Version: 1.0
References: <20230210061953.GC2825702@dread.disaster.area>
 <Y+oCBnz2nLtXrz7O@gondor.apana.org.au>
In-Reply-To: <Y+oCBnz2nLtXrz7O@gondor.apana.org.au>
Date: Mon, 13 Feb 2023 10:01:27 -0800
X-Gmail-Original-Message-ID: <CALCETrXKkZw3ojpmTftur1_-dEi6BOo9Q0cems_jgabntNFYig@mail.gmail.com>
Message-ID: <CALCETrXKkZw3ojpmTftur1_-dEi6BOo9Q0cems_jgabntNFYig@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Herbert Xu <herbert@gondor.apana.org.au>
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
Cc: axboe@kernel.dk, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-kernel@vger.kernel.org,
 metze@samba.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org,
 samba-technical@lists.samba.org, torvalds@linux-foundation.org,
 io-uring@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Feb 13, 2023 at 1:45 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> Dave Chinner <david@fromorbit.com> wrote:
> >
> > IOWs, the application does not care if the data changes whilst they
> > are in transport attached to the pipe - it only cares that the
> > contents are stable once they have been delivered and are now wholly
> > owned by the network stack IO path so that the OTW encodings
> > (checksum, encryption, whatever) done within the network IO path
> > don't get compromised.
>
> Is this even a real problem? The network stack doesn't care at
> all if you modify the pages while it's being processed.  All the
> things you've mentioned (checksum, encryption, etc.) will be
> self-consistent on the wire.
>
> Even when actual hardware offload is involved it's hard to see how
> things could possibly go wrong unless the hardware was going out of
> its way to do the wrong thing by fetching from memory twice.
>

There's a difference between "kernel speaks TCP (or whatever)
correctly" and "kernel does what the application needs it to do".
When I write programs that send data on the network, I want the kernel
to send the data that I asked it to send.  As a silly but obvious
example, suppose I have two threads, and all I/O is blocking
(O_NONBLOCK is not set, etc):

char buffer[1024] = "A";

Thread A:
send(fd, buffer, 1, 0);

Thread B:
mb();
buffer[0] = 'B';
mb();


Obviously, there are three possible valid outcomes: Thread A can go
first (send returns before B changes the buffer), and 'A' gets sent.
Thread B can go first (the buffer is changed before send() starts),
and 'B' gets sent.  Or both can run concurrently, in which case the
data sent is indeterminate.

But it is not valid for send() to return, then the buffer to change,
and 'B' to get sent, just like:

char foo[] = "A";
send(fd, foo, 1, 0);
foo[0] = 'B';

must send 'A', not 'B'.

The trouble with splice() is that there is no clear point at which the
splice is complete and the data being sent is committed.  I don't
think user applications need the data committed particularly quickly,
but I do think it needs to be committed "eventually* and there needs
to be a point at which the application knows it's been committed.
Right now, if a user program does:

Write 'A' to a file
splice that file to a pipe
splice that pipe to a socket
... wait until when? ...
Write 'B' to a file

There is nothing the user program can wait for to make sure that 'A'
gets sent, but saying that the kernel speaks TCP correctly without
solving this problem doesn't actually solve the problem.

