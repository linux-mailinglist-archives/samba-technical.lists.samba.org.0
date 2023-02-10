Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 95085692855
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 21:32:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=TNGC2gVkur39N/z2BGm7FqvHrhN7MB6Kvr8/zKYBd54=; b=2he2KUqkxl7ZRXQIsB+R75npUc
	3a55tg9r+eZuPCrVuS4DLDGEy1jkrTi5Fs8RQtx2bdY5xgo1+76Jj3stDHuPfPp6ZgBdXRqaL1JeG
	PZFpDl/k3+o3/GAtrt9Gb9kiYGEf45P1uXAyLJVfKxx7VkfSaD6AcKogrXpi2sR9raCCUsQ+gq7tL
	96r+ASsYhk0i3EX7/NHHNLYI6B/k1tfAzPJsX4ljKSMYzqdIMr2V4CrdCEkPiqp5mYoo6Qb2cxOhZ
	eiA/wMFqzz6TJ9FLStNELqklwcDQw84cpMPLYHccw1heRJn15qaSNIA1+9+GRKon4yyldEGt/N/ac
	T4F4+xfw==;
Received: from ip6-localhost ([::1]:53340 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQa45-00BF5S-BC; Fri, 10 Feb 2023 20:32:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:45587) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQa3z-00BF3N-Ax
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 20:32:10 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 z14-20020a17090abd8e00b00233bb9d6bdcso1472887pjr.4
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:32:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TNGC2gVkur39N/z2BGm7FqvHrhN7MB6Kvr8/zKYBd54=;
 b=ggqXtIq5KlvW4+bzHNM7jlAyPY0z+p8Jo7a8W5Rwk3QnaHJBZJYKrMboQklL4ZGFrv
 doeD+gsAKuhGs6CO8+lmAhnM5DM5DY8zlKWhmcpxPJ18NtE30dQFnad21m2dFAXsZCAc
 IWwmpfvczOUhuSrW5mcQ/18/WZ9Ewfltyt6cA8gE2QkAtzx5AfbrCOqS0Urw0unKmbqf
 z2UYJcIBpB1tl7pg9rgtQlmG09i0W8p/w0a+VlN2yHKqCtKNN4uKxuDsYhjky/Drgn64
 wdXVTkTZdehl/wP+SsMIOApp8GzW7OugxlIx+sFuTAFkMOuvey8XbdArw4uvJHVbYz/i
 Lcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TNGC2gVkur39N/z2BGm7FqvHrhN7MB6Kvr8/zKYBd54=;
 b=R8j9Zoc6gc509YFu9MMoAMG+OyugGrEc04jG6fUGclS7HTE09pPqB497NObT/aMUJ3
 PuItoRd0ZZ01rPAmo47yprWEpBSCv9z98CT4EorFIV6s1ZqH1s++d8DrvLRrU6VH8cUX
 dkEafzawZZF33CXgxl2YdtuTjGGE5SoZMex6YGftIt09JeVybfj3X++5VkKRv9aNIqZJ
 4+OXphoN1Yd7gCsDJzfZnz3Deb4oZZuSg80OV5K8u3SSd2z4xGEJJpFwLJWrBPpAgw3h
 n3KlwxwsBvxKc72+H91lEaAKy9zo70TOYe+p9G9xYCMsnff8m+8rNKhotDLCBNcSbAni
 XsAw==
X-Gm-Message-State: AO0yUKVvkm7QcZa+4QAQzBXao7b1cD3YmIpLf/NCZpYbNv3c7LcIfna3
 Ce/q5uVYslhwUq8ShnkVrx+s1g==
X-Google-Smtp-Source: AK7set/R7DRDye2KopX4VXsYABJedGTdp+oIlslYijdw2jgktzMAsQBFaHyYZ8x0PhoUd6tBAQ0VEQ==
X-Received: by 2002:a17:902:d2c3:b0:19a:7217:32af with SMTP id
 n3-20020a170902d2c300b0019a721732afmr3770005plc.5.1676061124414; 
 Fri, 10 Feb 2023 12:32:04 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a170902b71700b001933b4b1a49sm2701300pls.183.2023.02.10.12.32.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 12:32:03 -0800 (PST)
Message-ID: <1dd85095-c18c-ed3e-38b7-02f4d13d9bd6@kernel.dk>
Date: Fri, 10 Feb 2023 13:32:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>
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
In-Reply-To: <CAHk-=wgA=rB=7M_Fe3n9UkoW_7dqdUT2D=yb94=6GiGXEuAHDA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
From: Jens Axboe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jens Axboe <axboe@kernel.dk>
Cc: Linux API Mailing List <linux-api@vger.kernel.org>,
 Dave Chinner <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Stefan Metzmacher <metze@samba.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2/10/23 1:27 PM, Linus Torvalds wrote:
> On Fri, Feb 10, 2023 at 11:56 AM Andy Lutomirski <luto@kernel.org> wrote:
>>
>> i think this is almost exactly what Jeremy and Stefan are asking for
>> re: notification when the system is done with a zero-copy send:
> 
> Yeah, right now it's all just "incremented page counts", I think.
> 
> Even the pipe code itself doesn't know about writes that have already
> been done, but that are pending elsewhere.
> 
> You'd have to ask the target file descriptor itself about "how much do
> you have pending" or something.

No, we very much do have that for io_uring zerocopy sends, which was in
the bit below you snipped from the reply. It'll tell you when data has
been sent out, and when the data has been acked. Or what am I missing
here? Late to this thread, and there's a ton of stuff go to through.

-- 
Jens Axboe



