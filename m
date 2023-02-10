Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 055366928AF
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 21:50:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=BOLdMOZh6oSFDZ674/JlPJ6s1A5z56hiarzibKSdCd0=; b=W0A1dHyQiNsLLiPABWvK9b/XwS
	3jF0dlzJeLZOaB5XRHYiMbWyGTm6OzHvK6bElaZoZo+Ote4087SuTUvh0ASdjbXYhcnMSsnCrHRuh
	sYsShRM1gv+kQnNRHHyLG+dhq9pZUkKntCtsPeLG+h+xtPohiXFRINCVa4NncmLmDJn6I6/Edvf5V
	mOvvJhAuAsQ6GlkBWzODEJV78BK3Dap39we8gVxbWOqCCptg/UcXtIr9RBCkD+9e7Er678ExxnaK7
	rN3+GKmj9qpe/XqmMcAmkm7M0HtwG4JbKlA0/erKyuAQZT4aLtJCzQuSCRxiBXJiuickllTbHYaxp
	ZEs3fIcQ==;
Received: from ip6-localhost ([::1]:38304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQaLg-00BIA5-65; Fri, 10 Feb 2023 20:50:24 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:54133) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQaLa-00BI9w-9W
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 20:50:20 +0000
Received: by mail-pj1-x102b.google.com with SMTP id bx22so6479288pjb.3
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 12:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BOLdMOZh6oSFDZ674/JlPJ6s1A5z56hiarzibKSdCd0=;
 b=YUVcAGplnJzJGvRds7SmhH8wPnKRaEgeepF9s1F5wmgGv7LVxnxYoAPDdp5UvJT/2R
 Ld7uRFZBmvEJ+9tgHJoi15WuSw5vTiOgMPrCyrevfNTtTbRSMllCR3LRro4pPdhNDvzo
 lGu1lCnRTf8zsHJCgY8g/sAtVMQtKfN7v5mY69TFnrKV96vucUCqYhbdvWFWm5RQRxIW
 4mga/BN+7oJdbhPCHqkQI9UW7MQQr89iOk5/r/HYDx+NPGScr25yckQ+jyjBtEpnaXtd
 LbR7LjjBLKS/03heKb2TcL/2y35OvRTaKChR7BbwUCadlxhP5bRAmjFgNNsXPd8R+yqY
 l5AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BOLdMOZh6oSFDZ674/JlPJ6s1A5z56hiarzibKSdCd0=;
 b=F1A9EMCbY8+4T3QA7KsFc907V7UIq5jjrLSIYVkx54amC+yNlxb8M0Ih7ZqXY0UIng
 jwHN5JLgAdDe1xNUNmfKx6Eh4CwL5bETtadoylJtNk9kDxClTlPMLquAuu8GMxjMOxzo
 b/z791ZKzpNDuC/ty4nDnK5+bxWOUKI/VaPr3G1tQ4iVZf3+5b9Tp000KdIvmNEYUPWC
 mCus4QINUd0aiwofJ5daDo1o0K9BOFzus1YZgHmtbeHrqCak+7C2UVKPtX9tZ/LHzgtj
 +PjygPLC6gRSA2qO406E1dewbLbHow/VyeXBD+zzm9IBEiKe1x7hy5j1yZCZWHa6taPf
 E/gw==
X-Gm-Message-State: AO0yUKX9jMshUv6k7+OYnzYcMYb4iAgETN7xkxOgi/dM2tZwSw1yyUva
 dQsmOeBm4KErRkPKwXK05eFXDw==
X-Google-Smtp-Source: AK7set8i8tlrLyo/k3MJtpUjV25aKJQ2J/6HUx+X4GcdRwQFAttGDyYke7MGUbA6TE6IEUa2RpggtA==
X-Received: by 2002:a17:90a:dd45:b0:230:ca3d:3db with SMTP id
 u5-20020a17090add4500b00230ca3d03dbmr13943705pjv.4.1676062215811; 
 Fri, 10 Feb 2023 12:50:15 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 u1-20020a17090a4bc100b002311dbb2bc5sm2586754pjl.45.2023.02.10.12.50.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 12:50:15 -0800 (PST)
Message-ID: <7a2e5b7f-c213-09ff-ef35-d6c2967b31a7@kernel.dk>
Date: Fri, 10 Feb 2023 13:50:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
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
 <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
 <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
In-Reply-To: <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
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

On 2/10/23 1:44 PM, Linus Torvalds wrote:
> On Fri, Feb 10, 2023 at 12:39 PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> Right, I'm referencing doing zerocopy data sends with io_uring, using
>> IORING_OP_SEND_ZC. This isn't from a file, it's from a memory location,
>> but the important bit here is the split notifications and how you
>> could wire up a OP_SENDFILE similarly to what Andy described.
> 
> Sure, I think it's much more reasonable with io_uring than with splice itself.
> 
> So I was mainly just reacting to the "strict-splice" thing where Andy
> was talking about tracking the page refcounts. I don't think anything
> like that can be done at a splice() level, but higher levels that
> actually know about the whole IO might be able to do something like
> that.
> 
> Maybe we're just talking past each other.

Maybe slightly, as I was not really intending to comment on the strict
splice thing. But yeah I agree on splice, it would not be trivial to do
there. At least with io_uring we have the communication channel we need.
And tracking page refcounts seems iffy and fraught with potential
issues.

-- 
Jens Axboe



