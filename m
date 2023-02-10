Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 686376929E9
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 23:17:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3nq+R/MHvba6mSMNHwpnAJjpxGAz3OEgA07xNnbPejQ=; b=C0VFKBuMemdKbgERgGptNslHK4
	KQfVE1E+VmXOv9sIRuTHQpSG14VU13XE7Nioptz4Ag2naZRGprf97g82CIdFMZFKl5qOnLapkg3PL
	ROeDcggF9tvRkp2WKBKR8j6fekggxcCFI3Y7cVlpS1NY2V47uc6qvhr+LoaO1I2ywO9UOjNbeAXZm
	euGq6YD6KNsmzXfmY4hmZ+3Fhs20Yd5uamSK+eG6Ez42EPm29CJN7t0iBSZxCjq0xEi6R18/rfBKM
	Eb1b9x2TCEB6NH6ZKEDkWGEMTrQQgDsBZqX8UxG3Q9NS6HMyJtPEfQTaM3BGrCrQ8sSSKszfJj4uM
	df3t4XSQ==;
Received: from ip6-localhost ([::1]:53850 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQbhN-00BMZH-M5; Fri, 10 Feb 2023 22:16:53 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:54992) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQbhH-00BMZ8-Qh
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 22:16:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id mi9so6693829pjb.4
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 14:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1676067405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3nq+R/MHvba6mSMNHwpnAJjpxGAz3OEgA07xNnbPejQ=;
 b=JsbSGRKKBf19CrAGTba3I8q+qoR4pRR/u15vwJb8uG9D+tlXhQskUeQChl+B0CE6/G
 d7DaFVmiOiHkRi/W9CFcG1/YBnGO6ZybityrFmb6yy+Pr+H1dmmTJaFobJbok5rmzqnw
 JMJa4yZJHmIP/hJRWaqlKMWjQKVWMlkrkHEf6G55qFnGVsQr8eE4DAVj3rzNQSwkMDow
 ygFjgS0RB5wg/DLOnrnZoXsF9rld6K/hiMVoXmQsuR+W1HorjBhYBb3VPydkcdGCf589
 +SnuVLumT+mkjXzOtA+xz7oJEt6CEYP68BxSNi+gmR3aeagBFcND2ykRP/qUq4RFhdLZ
 a9hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676067405;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3nq+R/MHvba6mSMNHwpnAJjpxGAz3OEgA07xNnbPejQ=;
 b=5gTVYog7xUTsESCynC1puhP6eCvaq+oGQkrdUB5YwrDOCqwPl2YrFke0UjNkw2RJYi
 hOpcc64iZegFz3GOr1Xhws/8yv1GVd/iU2/fbBszn/335L7Wxaa31w/hLJNECagZ/lft
 ovmeKqm0RlxiNdk4on50X+aOgiy1Kwvh0nQyrPMRqhlH/zFD50uszg3aLaF3ONitwKYV
 meLTo5fxq0Gp4vzOkYS1gtucCykujYguDyLKgl58jMp5fsVn11mLYgGaTkWxdtaDNKdd
 WXQJqr8yL4g0WKSy6QSiQHDPk1owqhCxnLMQlokYlO7+d8w5mR9n4vaztnucXzm+QlQo
 +IVw==
X-Gm-Message-State: AO0yUKVloJAip3YgiYuz7G/Hh3hlKVB3hawpdFaenyEQujzcRuUY326B
 FlD+D33Xrj/aHtohxl5bieUSEA==
X-Google-Smtp-Source: AK7set9xih2xsUwTzpXo/PHtOMC524gx4b1nt/NUfdLXSb41BaVsRdjRCGLw+94gRBxpEnPu1MVuFQ==
X-Received: by 2002:a17:902:e748:b0:19a:723a:81b2 with SMTP id
 p8-20020a170902e74800b0019a723a81b2mr3760922plf.5.1676067405376; 
 Fri, 10 Feb 2023 14:16:45 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a170902aa9500b0019a71017ab2sm1897737plr.91.2023.02.10.14.16.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 14:16:44 -0800 (PST)
Message-ID: <d89a7d6d-a40e-504d-8a6d-4d1f2c62cb41@kernel.dk>
Date: Fri, 10 Feb 2023 15:16:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Ming Lei <ming.lei@redhat.com>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 2/10/23 3:08?PM, Linus Torvalds wrote:
> On Fri, Feb 10, 2023 at 1:51 PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> Speaking of splice/io_uring, Ming posted this today:
>>
>> https://lore.kernel.org/io-uring/20230210153212.733006-1-ming.lei@redhat.com/
> 
> Ugh. Some of that is really ugly. Both 'ignore_sig' and
> 'ack_page_consuming' just look wrong. Pure random special cases.
> 
> And that 'ignore_sig' is particularly ugly, since the only thing that
> sets it also sets SPLICE_F_NONBLOCK.
> 
> And the *only* thing that actually then checks that field is
> 'splice_from_pipe_next()', where there are exactly two
> signal_pending() checks that it adds to, and
> 
>  (a) the first one is to protect from endless loops
> 
>  (b) the second one is irrelevant when  SPLICE_F_NONBLOCK is set
> 
> So honestly, just NAK on that series.
> 
> I think that instead of 'ignore_sig' (which shouldn't exist), that
> first 'signal_pending()' check in splice_from_pipe_next() should just
> be changed into a 'fatal_signal_pending()'.
> 
> But that 'ack_page_consuming' thing looks even more disgusting, and
> since I'm not sure why it even exists, I don't know what it's doing
> wrong.
> 
> Let's agree not to make splice() worse, while people are talking about
> how bad it already is, ok?

I was in no way advocating for this series, but it seems relevant as we
are discussing splice :-). I have pointed Ming at this discussion too.

-- 
Jens Axboe


