Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 426FE693327
	for <lists+samba-technical@lfdr.de>; Sat, 11 Feb 2023 19:58:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=v6OIGzvOpvoDs5k8U8ZXPR9Oe0WDhcfEQMGkRVj61LY=; b=ZpzOZ5kvj4j5gc37SJA0Jp9jd0
	pb5R7zhUwUqxsXN+lFmIJpwJRau79XQGXGsx2N8VRpNPymtlkQcrx8cyp1qb+y/rzBc6VyYfXk8r6
	ioS22P1KOk/LVTojf2h8Hx4sva73IBUd7XFPDe3rP+IXVC1FeO5xUOGIvKwwJnsIOmLVergtFHNBi
	nwvMiEzJ38PjdZhHCy+V8VuBaMPKnu3b86gyEe6nAFDFSCfAh5KxBgjHY96l71k/6cOrVmrlQliGQ
	fUONinmzZwLCmN9gB6zQRgrK7tmN3C17puoBWQbU2eDliGKbvGEoyLTJlHTU4IYMbMah6hZEHA3eJ
	TIyVkKsA==;
Received: from ip6-localhost ([::1]:64260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQv4k-00BXik-Nr; Sat, 11 Feb 2023 18:58:18 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:35555) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQv4g-00BXib-3R
 for samba-technical@lists.samba.org; Sat, 11 Feb 2023 18:58:16 +0000
Received: by mail-ej1-x630.google.com with SMTP id qw12so23181767ejc.2
 for <samba-technical@lists.samba.org>; Sat, 11 Feb 2023 10:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=v6OIGzvOpvoDs5k8U8ZXPR9Oe0WDhcfEQMGkRVj61LY=;
 b=EIXdLD2NKM3TRG47LtztKC0uokjWh9qOIVDhwX03oat6LH91fz1Bsf/lPs2NP2CG8X
 +DswqOlfYlGGKQggnB9PN5h6tY4I4kXpr4aX5smQFgvIZzwCwCuHFcRbAT4uyAPo4Q6z
 xKh6bsoMHKAriwGucZR6A+JhEX/u34NaffC2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v6OIGzvOpvoDs5k8U8ZXPR9Oe0WDhcfEQMGkRVj61LY=;
 b=qe5ABLCoDNYEsUJgVLdrGs9vSXV4298FWOIp7qhNbVOIPUHeCGPB8wC85aYXhkUAa+
 o5NXXWHPPP1SIMe01PGNmIBG5gA+gVHWqdJxKfFXVRYdWYHJG1bsAYrY62kSR5eKRvWR
 X3OtPfp5AN54Q4PaKW9s4JI9dxfCV9m/B+bX+B/Z3xDgmn7ZWGoH/JIejBIAOPmLxVp7
 YaNjD2Ei3bkckR2qnYyQoQZPGTzG61VcJTs9NFBtGnTsuWdCISkgvxv/4c05vHJwmS2B
 MDq9Zuwf2Bb9RfeQsBfX2obNIn2/B7HFyxFAXTes4Bpmnvyol51+6B4SoX5PeKe0+vIA
 ruIQ==
X-Gm-Message-State: AO0yUKXQNz+AlMCDA/oDrmnyCx3/G5BVebYx4mRigfbHXOOzKrCq/7CA
 5qE25dJuHs6OTFsJLnChAg2VNJbvWvmTtYHobCM=
X-Google-Smtp-Source: AK7set9VIjL4l+ajShXniTacWIlDro9Nq1SoBe9/xTZlXqYMjUnqAi/rPIETD7jncPxs1sKVn5yJ3g==
X-Received: by 2002:a17:906:fe49:b0:8aa:c0d6:2dc6 with SMTP id
 wz9-20020a170906fe4900b008aac0d62dc6mr20751106ejb.29.1676141892993; 
 Sat, 11 Feb 2023 10:58:12 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com.
 [209.85.218.44]) by smtp.gmail.com with ESMTPSA id
 20-20020a170906025400b008841aa86484sm4191871ejl.211.2023.02.11.10.58.12
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 10:58:12 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id c26so18352546ejz.10
 for <samba-technical@lists.samba.org>; Sat, 11 Feb 2023 10:58:12 -0800 (PST)
X-Received: by 2002:a17:906:658:b0:88f:a9ec:dfd7 with SMTP id
 t24-20020a170906065800b0088fa9ecdfd7mr2491955ejb.0.1676141891911; Sat, 11 Feb
 2023 10:58:11 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
 <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
 <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
 <7a2e5b7f-c213-09ff-ef35-d6c2967b31a7@kernel.dk>
 <CALCETrVx4cj7KrhaevtFN19rf=A6kauFTr7UPzQVage0MsBLrg@mail.gmail.com>
 <b44783e6-3da2-85dd-a482-5d9aeb018e9c@kernel.dk>
 <2bb12591-9d24-6b26-178f-05e939bf3251@kernel.dk>
 <CAHk-=wjzqrD5wrfeaU390bXEEBY2JF-oKmFN4fREzgyXsbQRTQ@mail.gmail.com>
 <Y+cJDnnMuirSjO3E@T590> <55eaac9e-0d77-1fa2-df27-4d64e123177e@kernel.dk>
 <Y+euv+zR5ltTELqk@T590> <787c3b62-f5d8-694d-cd2f-24b40848e39f@kernel.dk>
In-Reply-To: <787c3b62-f5d8-694d-cd2f-24b40848e39f@kernel.dk>
Date: Sat, 11 Feb 2023 10:57:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=whQ_V1ZE6jhQKHDk1MKvEkjpF2Pj-OcRQRXBTMsNpA1YA@mail.gmail.com>
Message-ID: <CAHk-=whQ_V1ZE6jhQKHDk1MKvEkjpF2Pj-OcRQRXBTMsNpA1YA@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Jens Axboe <axboe@kernel.dk>
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
 Matthew Wilcox <willy@infradead.org>, Ming Lei <ming.lei@redhat.com>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Feb 11, 2023 at 7:33 AM Jens Axboe <axboe@kernel.dk> wrote:
>
> OK, but then the ignore_sig change should not be needed at all, just
> changing that first bit to fatal_signal_pending() would do the trick?

Right. That was my point. The 'ignore_sig' flag just doesn't make
sense. It was a hack for a case that shouldn't exist.

              Linus

