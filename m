Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB0B692706
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 20:42:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=9CpPKhHlK6PYZiwLCiEmRPX8TBc/0iQPNE26DOAPaH4=; b=So5temCofjNngsvnslj5JHKz6I
	zjRx1LXAhNa05QfWSkI/HVR9LcaD6987wLIIE2Q5FfVbtkv7j8JKNMUQVeuN5LM6e7mn48swocHz6
	cKc10ks9XMuvwUEbO3PuMxPqpl5uiVfn2fLNWNiI229fwCh1J0pk0uhZzKLqdaZbs7hzaDsQ+XaeH
	N4HtpnfgyPjiuvIp5f6Yg/KG582U5F3O7BY9uTQTrc0qS/mYrwN8JA5oAr8IRD+lpFtVq2CU/eZGs
	7/mmmpH0HyUn56j6oMduEFiphPlWZQKm4/5LF4X+YCivE9KuFzzk/ZUoXUl9g7YTx/MtNbbUewg/s
	2ZnNXBHw==;
Received: from ip6-localhost ([::1]:29512 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQZIC-00BBD0-Ro; Fri, 10 Feb 2023 19:42:44 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:37440) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQZI7-00BBBj-7X
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 19:42:41 +0000
Received: by mail-ej1-x62d.google.com with SMTP id ud5so18627853ejc.4
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 11:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9CpPKhHlK6PYZiwLCiEmRPX8TBc/0iQPNE26DOAPaH4=;
 b=aw1tmSCpW4mrJ0HszXDtD2cnLdLxJ09VvDp1V4n4rwC3p58zOAeSYvxH2jj3QSpNy8
 2a4GdLLV2E8+oEAhmJxMznwsQHOJctaP53SlKnfXJWHizcsvh8Au5uZTbPBm5C9TOFPn
 jenxevnrE4SLkXby1HJd4Nz5Y5U7YZhrBi6dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9CpPKhHlK6PYZiwLCiEmRPX8TBc/0iQPNE26DOAPaH4=;
 b=U8xswPDgGWao2pHstmiFh5/APIMeeedtIcYJuYwrOnW3zQ0pjQ5zAC4EfXlJ+IcShq
 Oig5f81s5fx1gRmo70oWQG/9SuDi6+iiYeR1vYSNzLXKcS1T3m45pXo6MpwPycKNBt2s
 LrUWZjwSK6Mf5pO7oZPdcDORTWojMC2gAJwvfBOZLdl8qPR0RwzUlKiwxVId5pvqdQNL
 Xi9YR4vttH6KvEOk3ZcTYKigqy3F8NGnlScI8oV63HuZaUFEoPxe0wru/+fDUWPsxXuV
 OEIDgENNizCOza9uUhs4F2ORgCSKP8Gj0L754h194u9KVRqTaXZukynhqS5HrbqCxg99
 H8yg==
X-Gm-Message-State: AO0yUKVEbWPDOEhAKPUxIcFIDPAJOF1G9hi//dDzdwUCFGI07Zcupssb
 SSYCvlqhhOwgnOJMxDkoGDT+8rSSIaIu6VumWmY=
X-Google-Smtp-Source: AK7set+gbq+3meH+UNxFYHsdAN+0yxfdqS4gTA3StjQPnhZlN3HyG4Z1XcrU5NlGkSvpUS92UWG/cA==
X-Received: by 2002:a17:907:7d93:b0:8af:33d2:787c with SMTP id
 oz19-20020a1709077d9300b008af33d2787cmr8150430ejc.13.1676058155157; 
 Fri, 10 Feb 2023 11:42:35 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 q17-20020a170906361100b00869f2ca6a87sm2778511ejb.135.2023.02.10.11.42.34
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 11:42:34 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id r3so5592183edq.13
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 11:42:34 -0800 (PST)
X-Received: by 2002:a50:f603:0:b0:49d:ec5e:1e98 with SMTP id
 c3-20020a50f603000000b0049dec5e1e98mr3218470edn.5.1676058153910; Fri, 10 Feb
 2023 11:42:33 -0800 (PST)
MIME-Version: 1.0
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
 <Y+aat8sggTtgff+A@jeremy-acer>
In-Reply-To: <Y+aat8sggTtgff+A@jeremy-acer>
Date: Fri, 10 Feb 2023 11:42:17 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgztjawo+nPjnJJdOe8rHcTYznD6u34TBzdstuTjpotbg@mail.gmail.com>
Message-ID: <CAHk-=wgztjawo+nPjnJJdOe8rHcTYznD6u34TBzdstuTjpotbg@mail.gmail.com>
Subject: Re: copy on write for splice() from file to pipe?
To: Jeremy Allison <jra@samba.org>
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
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 11:27 AM Jeremy Allison <jra@samba.org> wrote:
>
> 1). Client opens file with a lease. Hurrah, we think we can use splice() !
> 2). Client writes into file.
> 3). Client calls SMB_FLUSH to ensure data is on disk.
> 4). Client reads the data just wrtten to ensure it's good.
> 5). Client overwrites the previously written data.
>
> Now when client issues (4), the read request, if we
> zero-copy using splice() - I don't think theres a way
> we get notified when the data has finally left the
> system and the mapped splice memory in the buffer cache
> is safe to overwrite by the write (5).

Well, but we know that either:

 (a) the client has already gotten the read reply, and does the write
afterwards. So (4) has already not just left the network stack, but
actually made it all the way to the client.

OR

 (b) (4) and (5) clearly aren't ordered on the client side (ie your
"client" is not one single thread, and did an independent read and
overlapping write), and the client can't rely on one happening before
the other _anyway_.

So if it's (b), then you might as well do the write first, because
there's simply no ordering between the two.  If you have a concurrent
read and a concurrent write to the same file, the read result is going
to be random anyway.

(And yes, you can find POSIX language specifies that writes are atomic
"all or nothing" operations, but Linux has actually never done that,
and it's literally a nonsensical requirement and not actually true in
any system: try doing a single gigabyte "write()" system call, and at
a minimum you'll see the file size grow when doing "stat()" calls in
another window. So it's purely "POSIX says that, but it bears no
relationship to the truth")

Or am I missing something?

            Linus

