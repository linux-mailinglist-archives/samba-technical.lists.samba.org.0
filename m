Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D04096929DB
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 23:09:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=abSFB59ri4FOl7mUi8eUgUBhSEYjEYSp3hrpjZkmJ0U=; b=BfLDxZiuAu62unOzWFmAULQR87
	QINBCRiUoIefr4G116CSP1MSZ/EhI1nD8sPQWrK2d9Xl5jQ8IQiNI6rq4MczJ8V84uBfhc2lJiu6v
	LrDmpRTgEdvHkpfChMM+4xsBy6byNHRBlNgAFgPhNC/PVBrq+xwJXNlnnsytbDmW/CJN5BWi0aaxl
	TQGNsFicVlHLXblHmHWmDBnTxY1/SN+PqCdOPiYvcOhVaLfoOXWahDcmEU59jCO/SBU2mEf/G4t4a
	GGKCskZ7n0BFzR+BWUtUwK+BlxxFjNpSOfQ75c31vz5TRDXNRh+pcX6Mm37ruX45/Ce59Rhwc/pIb
	9/l7r88g==;
Received: from ip6-localhost ([::1]:42570 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQbZl-00BMH8-0X; Fri, 10 Feb 2023 22:09:01 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:35356) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQbZf-00BMGy-85
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 22:08:57 +0000
Received: by mail-ed1-x535.google.com with SMTP id q19so6082987edd.2
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 14:08:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=abSFB59ri4FOl7mUi8eUgUBhSEYjEYSp3hrpjZkmJ0U=;
 b=NcU1uFZdoJAjGPI44x/T/oJNFFkClW4PcLYk/vV5Feaov42tAJqpKYVo9/YlqDXw24
 MP1ObyJcJdHSRWORQxht+uP0G/aT/dcYZ9VhAyTSNq5BQ9jK4YMDeinqtABv+BxW+AIh
 cxBZ6zXZfc4dJfwH59qtqzuo+YrVtdjQpLas8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=abSFB59ri4FOl7mUi8eUgUBhSEYjEYSp3hrpjZkmJ0U=;
 b=Y+IJkUUBNw5QYGu5lbE/aKcTC3mzeoAoqM+2s9D5MrszTWJQ6dqS/Vt9viYNmWMqOY
 UuGKQkNzDaMfzFI0rreJHdyxkjdk3R5qLZMGr/ndNeuQjbV+NRB0gLojwwnRw1AzgRTH
 hOJL9htum7mgA7D58qHtadwUVZuP0EBkXyR2mN+MI2f4Qxl6dep3ueXYKkQZK+Ot1xsJ
 y456BtG0O7b4Tse7tHlbufuRQB37adp5mNFzVfMNAjtnaSFGhz6SPS113NsyTNzQsiOf
 rKD/9cGMwSxO/se8Tt0r8BK7zGHAo4/S/h3U3PJ+IJfyzDrlZ2taU/VszehR+kYtz0qB
 j+Kw==
X-Gm-Message-State: AO0yUKVd2FNatdVWnUjzAF6uZOPI4sY8W/+HqwiOen/73PbVZ3WdSBXV
 lKneQakVFgKX7+1Cz68CSPGxURGTW5Gw77XU9eM=
X-Google-Smtp-Source: AK7set/AjpAwZh9Rp8NDNxZOgnFhVJugpasokcOKe/zCaeIeoRohvlejJF1ORnQsh6EAr7HgG5S2lg==
X-Received: by 2002:a50:c34d:0:b0:4ab:4a90:c087 with SMTP id
 q13-20020a50c34d000000b004ab4a90c087mr3253486edb.9.1676066933820; 
 Fri, 10 Feb 2023 14:08:53 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com.
 [209.85.208.48]) by smtp.gmail.com with ESMTPSA id
 c20-20020a50f614000000b004ac089bb600sm971112edn.0.2023.02.10.14.08.52
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 14:08:53 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id d40so4812717eda.8
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 14:08:52 -0800 (PST)
X-Received: by 2002:a50:c353:0:b0:4ac:b616:4ba9 with SMTP id
 q19-20020a50c353000000b004acb6164ba9mr189716edb.5.1676066932381; Fri, 10 Feb
 2023 14:08:52 -0800 (PST)
MIME-Version: 1.0
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
 <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
 <CAHk-=wjQZWMeQ9OgXDNepf+TLijqj0Lm0dXWwWzDcbz6o7yy_g@mail.gmail.com>
 <CALCETrWuRHWh5XFn8M8qx5z0FXAGHH=ysb+c6J+cqbYyTAHvhw@mail.gmail.com>
 <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
 <CALCETrUXYts5BRZKb25MVaWPk2mz34fKSqCR++SM382kSYLnJw@mail.gmail.com>
 <CAHk-=wgA=rB=7M_Fe3n9UkoW_7dqdUT2D=yb94=6GiGXEuAHDA@mail.gmail.com>
 <1dd85095-c18c-ed3e-38b7-02f4d13d9bd6@kernel.dk>
 <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
 <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
 <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
 <7a2e5b7f-c213-09ff-ef35-d6c2967b31a7@kernel.dk>
 <CALCETrVx4cj7KrhaevtFN19rf=A6kauFTr7UPzQVage0MsBLrg@mail.gmail.com>
 <b44783e6-3da2-85dd-a482-5d9aeb018e9c@kernel.dk>
 <2bb12591-9d24-6b26-178f-05e939bf3251@kernel.dk>
In-Reply-To: <2bb12591-9d24-6b26-178f-05e939bf3251@kernel.dk>
Date: Fri, 10 Feb 2023 14:08:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjzqrD5wrfeaU390bXEEBY2JF-oKmFN4fREzgyXsbQRTQ@mail.gmail.com>
Message-ID: <CAHk-=wjzqrD5wrfeaU390bXEEBY2JF-oKmFN4fREzgyXsbQRTQ@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>
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
Cc: Linux API Mailing List <linux-api@vger.kernel.org>,
 Dave Chinner <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Stefan Metzmacher <metze@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 1:51 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> Speaking of splice/io_uring, Ming posted this today:
>
> https://lore.kernel.org/io-uring/20230210153212.733006-1-ming.lei@redhat.com/

Ugh. Some of that is really ugly. Both 'ignore_sig' and
'ack_page_consuming' just look wrong. Pure random special cases.

And that 'ignore_sig' is particularly ugly, since the only thing that
sets it also sets SPLICE_F_NONBLOCK.

And the *only* thing that actually then checks that field is
'splice_from_pipe_next()', where there are exactly two
signal_pending() checks that it adds to, and

 (a) the first one is to protect from endless loops

 (b) the second one is irrelevant when  SPLICE_F_NONBLOCK is set

So honestly, just NAK on that series.

I think that instead of 'ignore_sig' (which shouldn't exist), that
first 'signal_pending()' check in splice_from_pipe_next() should just
be changed into a 'fatal_signal_pending()'.

But that 'ack_page_consuming' thing looks even more disgusting, and
since I'm not sure why it even exists, I don't know what it's doing
wrong.

Let's agree not to make splice() worse, while people are talking about
how bad it already is, ok?

                Linus

