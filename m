Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AE2692994
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 22:52:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=Vom/MqYv+jQNYXBbUypmLqj6kXYFZ9S9wYtG411mBvo=; b=efbk1UTtlYNkU9GSkAXQy8VCRe
	d3xAokstiHeJtYH0l+HfNTBBI4KTo1xhinOX2Je/HFpi5R+dpblLOGRZeJw6PZxAj7EHcbF6W9/px
	7TJR4CRzQ8gCbtdufYNgGbJFFrxWntKVXUjMCuS450ujJiGnxAc6ICVA6vHUJmk6F2uSy5PPEK4u2
	B1hiR7YiBMx2gbPDUUFhj9+X68+TFtHNVD9N5rCRSx8HwR0CguA1oLmqphZxp39/z62KuDAtkWOvV
	mKOX4oktzgvtUD47hRV+lVEYxhM921vPqCwSps29j/AnOsrK5y6rqs+PFKVxl9Q/ZpAv3WnM0FIVN
	gavHuj7Q==;
Received: from ip6-localhost ([::1]:65168 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQbJK-00BLvF-I9; Fri, 10 Feb 2023 21:52:02 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:35794) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQbJF-00BLv4-Cr
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 21:52:00 +0000
Received: by mail-pl1-x62d.google.com with SMTP id r8so7948422pls.2
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 13:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vom/MqYv+jQNYXBbUypmLqj6kXYFZ9S9wYtG411mBvo=;
 b=t29WaowfXh9Y44It/7F23R9kLz9RmlgBuYd2/e6ooa9tSzzOrKHxJt6Z8BV5JoUkIS
 rpCxMjo4XJUJsNpLHlB9UDpwMAqoiOroPHjOP64Z1vme4doejUmiaJwW0AwRBT+P6laD
 IoTZCRBT4hNk1t/llsTlPqm7VA1H5oaPuIlIKxeA1Nw95VAUAo4zX6MuysQPmIyG4F+u
 i3UqaVItYXiSntkFwx8DcbYUsyfs+kwYB77M5m5cDEwgbAI9OH69GYJjMkSxNEb7jWpp
 J5rx1UVxOzi4sqZ6SxZDzkz7zz9aB2vk3fMlODIfCKVaNy7+6jrOZp7lwlCYWz/NUgYB
 hoEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vom/MqYv+jQNYXBbUypmLqj6kXYFZ9S9wYtG411mBvo=;
 b=2KbwIZilLhSRhkR2HFr3/5xbzcvkBpq4dutzT6PDsYoE472EeDfE9r5wPKS8LROcLu
 4dA99hxsJcM6IuJsMszzPWXElYQBrvPX3nmM3+R2X4LrONLqL8+7VKXUjFBZ0TVV5oR2
 iGgROAQ9cQe6QzHnYYSvVpOI3qZqn0HHMHQtofuWC+FjIdWif9RwCKP/IQRnw7zRKb+a
 xMXXxu5zBSLt0QQM2Zu46FNHDz0IMkjh1bmEfV7xFjGl+GXH8YSpY0MPJ1Z5Ja0HG14l
 n5DpolslZlhhi7mNrUnZLbFRsV+llIw9kVj4BhMzmCw70rRYTzRI1Pi2183xZtdntihE
 N09w==
X-Gm-Message-State: AO0yUKVpQoJc4cvZI6EXn8MUHD+ZBhFw8RtS0sqVqkFScqtw5vPG2KkE
 se434rEtDrhLs5LEKOfNWbOKUQ==
X-Google-Smtp-Source: AK7set9CoQAddeOh/s/FtjKzsrAlmbHEawv42o2oTdGE0NMoidcgIIuh/SVHi4+L81GmQ7GFfTwnWg==
X-Received: by 2002:a17:903:182:b0:199:e1f:3f59 with SMTP id
 z2-20020a170903018200b001990e1f3f59mr16545721plg.4.1676065914763; 
 Fri, 10 Feb 2023 13:51:54 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 g22-20020a1709029f9600b0019a7f493151sm290720plq.212.2023.02.10.13.51.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 13:51:54 -0800 (PST)
Message-ID: <2bb12591-9d24-6b26-178f-05e939bf3251@kernel.dk>
Date: Fri, 10 Feb 2023 14:51:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Andy Lutomirski <luto@kernel.org>
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
In-Reply-To: <b44783e6-3da2-85dd-a482-5d9aeb018e9c@kernel.dk>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2/10/23 2:27 PM, Jens Axboe wrote:
> On 2/10/23 2:14?PM, Andy Lutomirski wrote:
>> On Fri, Feb 10, 2023 at 12:50 PM Jens Axboe <axboe@kernel.dk> wrote:
>>>
>>> On 2/10/23 1:44?PM, Linus Torvalds wrote:
>>>> On Fri, Feb 10, 2023 at 12:39 PM Jens Axboe <axboe@kernel.dk> wrote:
>>>>>
>>>>> Right, I'm referencing doing zerocopy data sends with io_uring, using
>>>>> IORING_OP_SEND_ZC. This isn't from a file, it's from a memory location,
>>>>> but the important bit here is the split notifications and how you
>>>>> could wire up a OP_SENDFILE similarly to what Andy described.
>>>>
>>>> Sure, I think it's much more reasonable with io_uring than with splice itself.
>>>>
>>>> So I was mainly just reacting to the "strict-splice" thing where Andy
>>>> was talking about tracking the page refcounts. I don't think anything
>>>> like that can be done at a splice() level, but higher levels that
>>>> actually know about the whole IO might be able to do something like
>>>> that.
>>>>
>>>> Maybe we're just talking past each other.
>>>
>>> Maybe slightly, as I was not really intending to comment on the strict
>>> splice thing. But yeah I agree on splice, it would not be trivial to do
>>> there. At least with io_uring we have the communication channel we need.
>>> And tracking page refcounts seems iffy and fraught with potential
>>> issues.
>>>
>>
>> Hmm.
>>
>> Are there any real-world use cases for zero-copy splice() that
>> actually depend on splicing from a file to a pipe and then later from
>> the pipe to a socket (or file or whatever)?  Or would everything
>> important be covered by a potential new io_uring operation that copies
>> from one fd directly to another fd?
> 
> I think it makes sense. As Linus has referenced, the sex appeal of
> splice is the fact that it is dealing with pipes, and you can access
> these internal buffers through other means. But that is probably largely
> just something that is sexy design wise, nothing that _really_ matters
> in practice. And the pipes do get in the way, for example I had to add
> pipe resizing fcntl helpers to bump the size. If you're doing a plain
> sendfile, the pipes just kind of get in the way too imho.
> 
> Another upside (from the io_uring) perspective is that splice isn't very
> efficient through io_uring, as it requires offload to io-wq. This could
> obviously be solved by some refactoring in terms of non-blocking, but it
> hasn't really been that relevant (and nobody has complained about it). A
> new sendfile op would nicely get around that too as it could be designed
> with async in nature, rather than the classic sync syscall model that
> splice follows.

Speaking of splice/io_uring, Ming posted this today:

https://lore.kernel.org/io-uring/20230210153212.733006-1-ming.lei@redhat.com/

-- 
Jens Axboe



