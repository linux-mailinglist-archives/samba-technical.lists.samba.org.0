Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CBD692870
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 21:37:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=V5hbvtyrVhBU5KLvd4luM4pmIGBHWSgPPjkAzLVdXdc=; b=uW4o0PsHsr1XvfQRt8NMSX0Sk0
	ABdYRDS8YH8x9wnVShe5cRIQZMY2AyYCxey4Bd9U97OxSJxeEBUhK6sEt+gvYkQ2DvTC8u8FB/Ve8
	OC7fhGIW78Ksq10KenDip4nRpYHrl6BHN5cKnkY/TEO9LPMYU/OhtWfTt2EFBtH9C1XPZv4Zvpdng
	XyqVq/JfaAU1OKJWEjm2pw81YtfSHFT3YfdQ3jznEiRQqFrenneIfSjA+kcW1u3uwCRqDmKuJmeNq
	eT9Yeya0GCj3KOb+fHMRzV7ikvG2q1tBVOax6GgKeiYM24r6t89M9E+CtBMA4FV5zdPdrPMfsskP+
	dFHybfWQ==;
Received: from ip6-localhost ([::1]:42004 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQa94-00BG0K-4O; Fri, 10 Feb 2023 20:37:22 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:41895) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQa8z-00BFvu-W0
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 20:37:20 +0000
Received: by mail-ed1-x52e.google.com with SMTP id d40so4574585eda.8
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=V5hbvtyrVhBU5KLvd4luM4pmIGBHWSgPPjkAzLVdXdc=;
 b=XJVb1xKfBvelCl8Xuh4Bkq319Cx2dxwUHidMnSfKqGDU/b9SmTwk9u5Vp4ORhPDBNt
 uLp+1raScNofpejxVBGtMzdmvBtnEGPM6qvYjZcLw/dIFGbo6cMI3yaedOJppVXrhg5I
 8ihrf6+ZhqT/79pvdvMQsBrrZs8E6lxb26z2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V5hbvtyrVhBU5KLvd4luM4pmIGBHWSgPPjkAzLVdXdc=;
 b=ha4HVgjNvMVcLTQ3oXPO0vV0K8Hkoc8YjPZSqiQ1+MxJCy4Q2LOA77WaHbiDYyhQMv
 JfWc7dEwRuJHJ4/V3OKjZGcRP2bAnElJQ06uTgfQIb2aolmXuHdtasXaZLbuaMGOh0Qr
 N+ViRrEnHNOxKkAMSS741rAqV2rJ97T52aaMkHiyXZutBvdVL5Q4Z5DvdQgqJRrmf2gT
 SlYRRdm2Yi9Q/zQv/uQ1Tmwzp7PdvyRfIbM5hNgEmFbuYVMA3PQq0/IJvdtaYIIddJtk
 SvzPHegCEasquS8WIlQMR9yrRcH/9LBnKONNGf0/JUDT1XnPAayE844BqQ0jDTFtjD6K
 yAZw==
X-Gm-Message-State: AO0yUKWSu+0nE38QsOWUsplu98J8TfiX3AX8ZeWpA7sq/gfvuxZFawMA
 UlZCgUk8JNceY+HP3/Axk3TVl+Us7VTqb5XK0E4=
X-Google-Smtp-Source: AK7set8Taup+6wSPnWcQ7Pm4EhOmd/3KY4wuqGBfFwhopJbcnRfXwTFHWyQY0H4ZbNcSQwZMgGMkJA==
X-Received: by 2002:a50:9512:0:b0:4ab:1711:3625 with SMTP id
 u18-20020a509512000000b004ab17113625mr10075512eda.13.1676061436874; 
 Fri, 10 Feb 2023 12:37:16 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com.
 [209.85.218.54]) by smtp.gmail.com with ESMTPSA id
 m2-20020a509302000000b004aad8d2158dsm2721559eda.66.2023.02.10.12.37.16
 for <samba-technical@lists.samba.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 12:37:16 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id sa10so18832730ejc.9
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:37:16 -0800 (PST)
X-Received: by 2002:a17:906:f749:b0:8af:2ad9:9a1d with SMTP id
 jp9-20020a170906f74900b008af2ad99a1dmr1552969ejb.0.1676061435878; Fri, 10 Feb
 2023 12:37:15 -0800 (PST)
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
 <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
 <CALCETrUXYts5BRZKb25MVaWPk2mz34fKSqCR++SM382kSYLnJw@mail.gmail.com>
 <CAHk-=wgA=rB=7M_Fe3n9UkoW_7dqdUT2D=yb94=6GiGXEuAHDA@mail.gmail.com>
 <1dd85095-c18c-ed3e-38b7-02f4d13d9bd6@kernel.dk>
In-Reply-To: <1dd85095-c18c-ed3e-38b7-02f4d13d9bd6@kernel.dk>
Date: Fri, 10 Feb 2023 12:36:58 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
Message-ID: <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
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
 Matthew Wilcox <willy@infradead.org>, Stefan Metzmacher <metze@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 10, 2023 at 12:32 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> No, we very much do have that for io_uring zerocopy sends, which was in
> the bit below you snipped from the reply. It'll tell you when data has
> been sent out, and when the data has been acked.

Hmm. splice() itself definitely doesn't have that data - there's no
"io context" for it.

There is only the pipe buffers, and they are released when the data
has been accepted - which is not the same as used (eg the networking
layer just takes another ref to the page and says "I'm done").

Maybe adding some io context to the pipe buffer would be possible, but
it's certainly not obvious how, without changing splice() semantics
completely.

             Linus

