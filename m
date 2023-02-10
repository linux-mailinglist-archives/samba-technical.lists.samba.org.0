Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6DA69287C
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 21:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=hOgh7AvLAEWr6MHPlHv0hgSblyWQEvUMOhxbQH1+hyo=; b=hLmyPAaFYXOBFy6BsCwntaMgp1
	VkQ5HzDTc+3UIXuMFTO3s2PbFo3x5zfXMC4YvQW4Yawvlyclsyqv20oO9EnxE6bZsj5C+icTvnw7e
	jkLq78ID/IrAsh2JAvrqtBcljyhdjUe7KtRRSJjB3OPre4BG47l0GnWShEoNFPpewBwaaVN6dWfA9
	+G36s5MJNxQfEVgUTensFpiRz8H/cgVep/Jn235Hbgs30c4ZL2w48Si1NwaWz/9Xh2AVc3ZVSb46L
	aWwfqAMEVS66xuBvGY1a/OJp9mnKjYUtbPginfYZCzeqA8f3m54sNylH1Qtw/kVPcVWWoKcF5a5nv
	kexWjQFg==;
Received: from ip6-localhost ([::1]:45240 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQaBV-00BGU4-Ig; Fri, 10 Feb 2023 20:39:53 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45588) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQaBQ-00BGTu-9v
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 20:39:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id f6so7679717pln.12
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1676061585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hOgh7AvLAEWr6MHPlHv0hgSblyWQEvUMOhxbQH1+hyo=;
 b=Dck3zlko36k3FG/zHa0N2Pip1FHydLEFejtUZaBeIw8n+jmrEyzwml4MwbJ+D8TmAm
 8XI9nxP7g8PoD5jEq8eYcN/WZx0LehVZZprYLng+fA+93l++yqSXqqdDhV8ovrkRGKbk
 U2tGz0Dr5kv60R22uuB1h6FOyPOLNYdyDwL8EwTGCpXSSJmrui+vJp3UU1uindHwC2rF
 7INsym4zFgkfU3qyeMO3G8KTkKDDLyydxRWOFYFyC/mJFXPHvEdoEwlJ0GtNIfX6YFiW
 DmUr5QiFBwMDmXSrryim47j03VlUjLaUpb9pjF1qCqYefFRh6Ya4kQTEj1/fWgG9RkkR
 8l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676061585;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hOgh7AvLAEWr6MHPlHv0hgSblyWQEvUMOhxbQH1+hyo=;
 b=WmqssqtDqM3bR6rOlSCJzARFn4oz6FZXfy+Y1hqGol+GLaAWHczbuBVlMISMkas70g
 gCcBsbT9MotZOTATKY/wgVzLDNmGp4Y/Z3HwWN277RsFI9pEesEIcXHKfxIQNOp6dSom
 BjcZSTZqocR4haIEnSvCCzImA2uCAjIY41H6eIwQfpa8zGyFHvX10Eh5g8dDv5t9h+Or
 PMBQubetdGV1ks5+qQ8ZqgQl3ODMNrkP/42bMw6C6dIbjERnznfw6p4zXfveA2qHIUhS
 K92eoH+GjneD2ZOjWZRe/2W/L12Lp5V+hTIDiCuBDKu+RRCDFti2IJhKxSj8metfsUc/
 B6jw==
X-Gm-Message-State: AO0yUKWKAJkqzZ9TgOGLH4FQZpRR+2xXjwHjAN0PNpayTNvvtT8SoDKb
 wHLc0TLk9Ma49YnHx2Epd+9wVg==
X-Google-Smtp-Source: AK7set+Y8TkAMh6d9nz8+dUcs2UW1ALm0QmrsJs0TveWKd9aTsokQRTlusL/k4JePfB0Sa0dyZsGSg==
X-Received: by 2002:a17:902:f685:b0:199:190c:3c0c with SMTP id
 l5-20020a170902f68500b00199190c3c0cmr17850124plg.2.1676061585288; 
 Fri, 10 Feb 2023 12:39:45 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a170903120300b00196053474a8sm3774234plh.53.2023.02.10.12.39.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 12:39:44 -0800 (PST)
Message-ID: <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
Date: Fri, 10 Feb 2023 13:39:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
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
 <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
In-Reply-To: <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
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
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2/10/23 1:36 PM, Linus Torvalds wrote:
> On Fri, Feb 10, 2023 at 12:32 PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> No, we very much do have that for io_uring zerocopy sends, which was in
>> the bit below you snipped from the reply. It'll tell you when data has
>> been sent out, and when the data has been acked.
> 
> Hmm. splice() itself definitely doesn't have that data - there's no
> "io context" for it.
> 
> There is only the pipe buffers, and they are released when the data
> has been accepted - which is not the same as used (eg the networking
> layer just takes another ref to the page and says "I'm done").
> 
> Maybe adding some io context to the pipe buffer would be possible, but
> it's certainly not obvious how, without changing splice() semantics
> completely.

Right, I'm referencing doing zerocopy data sends with io_uring, using
IORING_OP_SEND_ZC. This isn't from a file, it's from a memory location,
but the important bit here is the split notifications and how you
could wire up a OP_SENDFILE similarly to what Andy described.

-- 
Jens Axboe



