Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5646929F2
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 23:18:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=N+TOeH19iOq0vdQyV1Prof3NpM6QGVmHTyGEbxYTvX8=; b=kv7CdrcpiZ6j+56lXSBp/MNSda
	Mk4JL61sDDYBoSC5W0Zn///NHT+0TMDo2+U7vUqePZb/9x7g7cQxHS5Vg+fX6pkT9mTGIi2BCYjKu
	ZiQj8Fv3CtRVQwrpXpslN4vVbW+Zja9c3KKGa9zue0ULCIq4C1V9NCG4hEtINxIzayf+k5mJ32Xbb
	FCGi4pEJSDgfi9tJ6p/k+q6SrESnfGTk9Ync9n4s0N461tpenZ1p7SoyMj5h62jqi4xCB3n3UqRyy
	l7fU203Yb9GHyb5V4qL++vv2z9n2b2pxInohdJ9LyPp4jLkjqs1zJ36OoNqlcTEQDc7Dn3v0/iFFE
	BG2bYRtA==;
Received: from ip6-localhost ([::1]:61274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQbil-00BMr0-Tl; Fri, 10 Feb 2023 22:18:19 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:39612) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQbih-00BMqr-0T
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 22:18:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id eq11so6082365edb.6
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 14:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=N+TOeH19iOq0vdQyV1Prof3NpM6QGVmHTyGEbxYTvX8=;
 b=TFoinpe3pITLVHtLti947pihmGAzoNViv44DXoHnGTTszOCmnwyESdP0lt/lbOrP7t
 8YDtBz+IGoaYOl0Ob5HxjVWGYnebyxpw932EfN70qrgWIPO+7+T6hBCeJjUjrPieoXRM
 laPRsn73b5fpWuslCZ6zcJBfNorWMVHntxmcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N+TOeH19iOq0vdQyV1Prof3NpM6QGVmHTyGEbxYTvX8=;
 b=EezJbiQ4ziNPIl+VOJexo8ouIZVlea8EOImYgrKg4KzSheQSCiFpss2g6BnoGcxOuU
 ax933EQwGqWQKg1pwdzI0dSKEqeZVBDHBkqNFAt+WkVH4s+iGLxPv6p4EqoK4brYa/iH
 83NLKRTsDa9iCcNhTvGkv2WSo1FXR1nMQ4uVliTX2sC3WlcJ5u1cvvKL4uDcvp54d97l
 S/nyaX3Kd7+XW1FuUQJ83AliGACFj54mQIv88vqRXmPR9+XYgxZFlIi2YgiUriF6Cx38
 ZA1CijXAcKaPIfCS/Dk8u2aKS9ZzFjVM2Hn/B9uZPpHouoqdXpMbQLxYj/F3K2ULR5vl
 gI6g==
X-Gm-Message-State: AO0yUKULy4z00QjGsR4hfEEUfYTOzakx83YIY1SVzUhZHLsTSLD1IQeD
 y/cklywR6BrQWNqq8mKlcmT1zEJOIg6SoGTGuM0=
X-Google-Smtp-Source: AK7set8ei6qjV7tSVkFJcs+bCbueQFLtx62tzTOOU7NknWL3DGlaQoqLhzbG8anO3m2kR9ttzObVSQ==
X-Received: by 2002:a05:6402:40c6:b0:4a3:43c1:8441 with SMTP id
 z6-20020a05640240c600b004a343c18441mr16057277edb.21.1676067494025; 
 Fri, 10 Feb 2023 14:18:14 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 f20-20020a50a6d4000000b004a245350e0fsm2880672edc.36.2023.02.10.14.18.12
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 14:18:12 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id c1so2290902edt.4
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 14:18:12 -0800 (PST)
X-Received: by 2002:a50:f603:0:b0:49d:ec5e:1e98 with SMTP id
 c3-20020a50f603000000b0049dec5e1e98mr3399923edn.5.1676067492117; Fri, 10 Feb
 2023 14:18:12 -0800 (PST)
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
 <CAHk-=wjzqrD5wrfeaU390bXEEBY2JF-oKmFN4fREzgyXsbQRTQ@mail.gmail.com>
In-Reply-To: <CAHk-=wjzqrD5wrfeaU390bXEEBY2JF-oKmFN4fREzgyXsbQRTQ@mail.gmail.com>
Date: Fri, 10 Feb 2023 14:17:55 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjUjtLjLbdTz=AzvGekyU1xiSL-wAAb7_j_XoT9t4o1vQ@mail.gmail.com>
Message-ID: <CAHk-=wjUjtLjLbdTz=AzvGekyU1xiSL-wAAb7_j_XoT9t4o1vQ@mail.gmail.com>
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

On Fri, Feb 10, 2023 at 2:08 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>  (a) the first one is to protect from endless loops

Just to clarify: they're not "endless loops" per se, but we have
splice sources and destinations that always succeed, like /dev/zero
and /dev/null.

So things like "sendfile()" that are happy to just repeat until done
do need to have some kind of signal handling even for the case when
we're not actually waiting for data. That's what that whole

        /*
         * Check for signal early to make process killable when there are
         * always buffers available
         */

this is all about. See commit c725bfce7968 ("vfs: Make sendfile(2)
killable even better") for a less obvious example than that
"zero->null" kind of thing.

(I actually suspect that /dev/zero no longer works as a splice source,
since we disabled the whole "fall back to regular IO" that Christoph
did in 36e2c7421f02 "fs: don't allow splice read/write without
explicit ops").

            Linus

