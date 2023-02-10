Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4D769293A
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 22:27:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=PBW6+3BQ/f+nsUlDuKE5AQQGY+PWXH1rqAOD3RD4RFA=; b=GclXcYxayKmtdl1PatPrTPQt6w
	E5BN/yQSzbhyyxmUaOh4VfyAILiK6EApblMMibpKAJiwUdVxAdj6D9qi3Zh44AHEk8YxZ7tsxAReh
	CZ2Pv0IfQmBhZTmbYtF5GMmXTAcLDAKNp1XvbSZeFUml8wyXBVWw0kot3zN5kSzvAp16F0/+lG1Dl
	7Xgh/qNYf11koit8cPVc9UfEHjZLb43lMQx4WZ6bMsPOxrMNvm/lPsmT7lA4SdkBSYisT1vAXMmX9
	NbRUVtuD1hcopCdqk2cz1UXKZn26Oz26E0M48f9xbkSJgvWqtjdbrGTr9mLWTsfMYloLaqsKnO9VE
	n/nOK5Gw==;
Received: from ip6-localhost ([::1]:48354 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQavX-00BLIU-3y; Fri, 10 Feb 2023 21:27:27 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:33665) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQavS-00BLIL-7O
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 21:27:24 +0000
Received: by mail-pg1-x52b.google.com with SMTP id z6so645593pgk.0
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 13:27:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1676064439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PBW6+3BQ/f+nsUlDuKE5AQQGY+PWXH1rqAOD3RD4RFA=;
 b=3uaHXo5NzcgY2T+otxjjzT/mkXLlAOa4UrJUiRk0n1vLxkhgLBmJjukZlLeGzikY3B
 +JgZbQ0b9wB7pduqP79RlWxzDxJlWO59v2YEFH+HtITYfsX9WGvibc82odOBB1ZLsBNr
 XEYaPuSIrlDzpHRugEyOVq5ZCVluBGDL0n1foSDfhe8qQbEsAdsbVqAEnwsiZFCfppZF
 d50XBtR9+bxATrCoQIPB6AdCPpro2dsW/CO654ROQEwgyHSQdJWupGEzGUXRxtx84/He
 CNHW6MVw45VBOHCHkkMy7ebAKVWvqn8lEP4VciPLxFwPO7kYwX7s/I2POui8tmdVcO4Z
 jYzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676064439;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PBW6+3BQ/f+nsUlDuKE5AQQGY+PWXH1rqAOD3RD4RFA=;
 b=ubz/eM7BcLL7GgV7jTr/0DK+U4g/w2iRl15i0wAczIbQMlY6GWZBfGavSCjScM7+tM
 daFv02BxpoMV4jBbV9cINDwBkqta+qEMtVP2E9/2VDX2n9/L1H4een34V8b9TCRL5d0f
 4J0s/hTPAEvwGoEcLVOH+6+i2tdc1yhNB0vyu5SS0Ir2qWPDZwHPy8xmHzudSbCMtL90
 I6EKppCcsZX596gI9Km4pVcts8rzhtTz3L8Av+GxanVQ2BojMp5VDgQupGZFzzdKOLBO
 s0ofqp8YZzkjZGjJ5ijxP53kNestQ24qdKsWu0Yq75ycdR3HepJeke5WLQpMLOSq3k4I
 CA0w==
X-Gm-Message-State: AO0yUKXj6FfLsr0BmIGARZpsszl5FRN3j7L1PGv6nT8LKokonmp0Ur/O
 kAnJj6/c25V/SnNJVO8HGpKhjw==
X-Google-Smtp-Source: AK7set8aoN4uPH6MOx7f9uzB1J+9B/VBYAh0QEuemPjOOa9BeH6t4xfLZiv6Ez5P3yzaBXos7hfusQ==
X-Received: by 2002:a62:d410:0:b0:58d:995c:9c25 with SMTP id
 a16-20020a62d410000000b0058d995c9c25mr14965774pfh.3.1676064438943; 
 Fri, 10 Feb 2023 13:27:18 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 y8-20020a62b508000000b00592de256f2csm3783435pfe.145.2023.02.10.13.27.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 13:27:18 -0800 (PST)
Message-ID: <b44783e6-3da2-85dd-a482-5d9aeb018e9c@kernel.dk>
Date: Fri, 10 Feb 2023 14:27:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Andy Lutomirski <luto@kernel.org>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
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
 <7a2e5b7f-c213-09ff-ef35-d6c2967b31a7@kernel.dk>
 <CALCETrVx4cj7KrhaevtFN19rf=A6kauFTr7UPzQVage0MsBLrg@mail.gmail.com>
In-Reply-To: <CALCETrVx4cj7KrhaevtFN19rf=A6kauFTr7UPzQVage0MsBLrg@mail.gmail.com>
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
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2/10/23 2:14?PM, Andy Lutomirski wrote:
> On Fri, Feb 10, 2023 at 12:50 PM Jens Axboe <axboe@kernel.dk> wrote:
>>
>> On 2/10/23 1:44?PM, Linus Torvalds wrote:
>>> On Fri, Feb 10, 2023 at 12:39 PM Jens Axboe <axboe@kernel.dk> wrote:
>>>>
>>>> Right, I'm referencing doing zerocopy data sends with io_uring, using
>>>> IORING_OP_SEND_ZC. This isn't from a file, it's from a memory location,
>>>> but the important bit here is the split notifications and how you
>>>> could wire up a OP_SENDFILE similarly to what Andy described.
>>>
>>> Sure, I think it's much more reasonable with io_uring than with splice itself.
>>>
>>> So I was mainly just reacting to the "strict-splice" thing where Andy
>>> was talking about tracking the page refcounts. I don't think anything
>>> like that can be done at a splice() level, but higher levels that
>>> actually know about the whole IO might be able to do something like
>>> that.
>>>
>>> Maybe we're just talking past each other.
>>
>> Maybe slightly, as I was not really intending to comment on the strict
>> splice thing. But yeah I agree on splice, it would not be trivial to do
>> there. At least with io_uring we have the communication channel we need.
>> And tracking page refcounts seems iffy and fraught with potential
>> issues.
>>
> 
> Hmm.
> 
> Are there any real-world use cases for zero-copy splice() that
> actually depend on splicing from a file to a pipe and then later from
> the pipe to a socket (or file or whatever)?  Or would everything
> important be covered by a potential new io_uring operation that copies
> from one fd directly to another fd?

I think it makes sense. As Linus has referenced, the sex appeal of
splice is the fact that it is dealing with pipes, and you can access
these internal buffers through other means. But that is probably largely
just something that is sexy design wise, nothing that _really_ matters
in practice. And the pipes do get in the way, for example I had to add
pipe resizing fcntl helpers to bump the size. If you're doing a plain
sendfile, the pipes just kind of get in the way too imho.

Another upside (from the io_uring) perspective is that splice isn't very
efficient through io_uring, as it requires offload to io-wq. This could
obviously be solved by some refactoring in terms of non-blocking, but it
hasn't really been that relevant (and nobody has complained about it). A
new sendfile op would nicely get around that too as it could be designed
with async in nature, rather than the classic sync syscall model that
splice follows.

-- 
Jens Axboe


