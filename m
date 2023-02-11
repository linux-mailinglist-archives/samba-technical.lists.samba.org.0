Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E2BAF693203
	for <lists+samba-technical@lfdr.de>; Sat, 11 Feb 2023 16:34:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3C/YASUIoy+dQcEYZ+F2OwnfV9uUu+22o30wDUIMzBE=; b=gchfkLfahqF5TzMb08jTo9Mcwo
	sUbp3NNeiW1VHTOaDEe9hkfzXtrtR6fiLDNNl8FK79gcKTK5/A+naANYtRBxFGFCsEP2KYass0UfH
	rD37eVzPpD0MuM8PZa4/qi5wVxPY6cgaq5w8hY+zxSDLUuxkpYaS6I8VnxzjAnKCXJZXtn+bL6rMH
	Mgx0Gu4OU6dtLmpC9aUBjy+TG4bduLIQ6nmTnCWPlRc0KWM1KjGr/rOf56BUUrsb6g+1Lqadkxg2I
	gQv1UZnYy8Aez7yxxXGbczv6dO69OP0NVSF25hATKYYpqtcULkshQYthsgNLW5BcablhspZRnUh+U
	mhbrnmmg==;
Received: from ip6-localhost ([::1]:25838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQrsL-00BVbS-GF; Sat, 11 Feb 2023 15:33:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:42516) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQrsD-00BVbJ-DS
 for samba-technical@lists.samba.org; Sat, 11 Feb 2023 15:33:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id h4so1706089pll.9
 for <samba-technical@lists.samba.org>; Sat, 11 Feb 2023 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112; t=1676129586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3C/YASUIoy+dQcEYZ+F2OwnfV9uUu+22o30wDUIMzBE=;
 b=sbVTZ6emU72abJ/43S9dRNx91cA3NySmKA+Mc39t143FMQvGNsFplK+3YIgAKHCnaO
 4qXaLeE/xNBoI3uIwiSDhFKJkQXYTZFzaENlUPdMc3aV6I+8ZVFouQH4mHwPiQruonYw
 tWb4Q7KwVk1FAImU1/dwnKXcTlRWyzAXk7eIOJRCP+MAo6ivePzNK0yBjdmFWlbPTlw8
 trRQR6EbK1LlwLzCNfMtuRtX+QqmUm8Juw/PWZxxc++sIPYwOlxDM8WDxL4+3Su1gYHF
 uoD76qwrhx95BUZyN/Isod0iE6gRTMIF4kEjzD7OS2CR3r8QHrWLYeLKk9yC8x1WPx1G
 Dvhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1676129586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3C/YASUIoy+dQcEYZ+F2OwnfV9uUu+22o30wDUIMzBE=;
 b=iX2zKhAF+muVUUW/1/T5bsDF+4Sn62+0uawW7MjxNw4AVCMb/Dg4FI1idR7t0bw/j1
 IHZJBKIu2C4cHcnbBcI4AUhRWZpSTeBG8kv4HUUYnO9Rv4WJXqbHUN2PZ/AJKFuTw8Ph
 5GBmOe1mzuCViTyqd2Kt7h1aV+Ixev8kKmij1EioGbXSovtI1IAFvOS0ScuKQGGtngPb
 bpKBWLo5I1OCjx/zXnrWT5DWh3nHeKhpHHvRzJTeNU4RN6imGE0EYprfBqnQGGih5kxa
 PpR0etp5ZbgaI1DpiXfdCxINITezDPb/H7gSqeAmAuhIojk8gq/9EP860Fuy+Ftf1KWV
 Y62g==
X-Gm-Message-State: AO0yUKUtg9cEYszWVC6++HB8+E+3iy4z3oHj1NLfKbUFsri6E0M5JrM1
 kJMc9YjTsxo59c4pHxCtxap8AQ==
X-Google-Smtp-Source: AK7set8Qp1ZJeY9F/hMzd03j0PcrfY61A4xgg3Ab4f7G8S8p7WiH3f0uEwnVqAVhQtBxa7kXTpS9CA==
X-Received: by 2002:a17:90a:5ae2:b0:230:b356:a35b with SMTP id
 n89-20020a17090a5ae200b00230b356a35bmr15997262pji.4.1676129586562; 
 Sat, 11 Feb 2023 07:33:06 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a17090a15d700b0022bf0b0e1b7sm2962226pjd.10.2023.02.11.07.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 07:33:06 -0800 (PST)
Message-ID: <787c3b62-f5d8-694d-cd2f-24b40848e39f@kernel.dk>
Date: Sat, 11 Feb 2023 08:33:04 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Ming Lei <ming.lei@redhat.com>
References: <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
 <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
 <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
 <7a2e5b7f-c213-09ff-ef35-d6c2967b31a7@kernel.dk>
 <CALCETrVx4cj7KrhaevtFN19rf=A6kauFTr7UPzQVage0MsBLrg@mail.gmail.com>
 <b44783e6-3da2-85dd-a482-5d9aeb018e9c@kernel.dk>
 <2bb12591-9d24-6b26-178f-05e939bf3251@kernel.dk>
 <CAHk-=wjzqrD5wrfeaU390bXEEBY2JF-oKmFN4fREzgyXsbQRTQ@mail.gmail.com>
 <Y+cJDnnMuirSjO3E@T590> <55eaac9e-0d77-1fa2-df27-4d64e123177e@kernel.dk>
 <Y+euv+zR5ltTELqk@T590>
In-Reply-To: <Y+euv+zR5ltTELqk@T590>
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
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2/11/23 8:05 AM, Ming Lei wrote:
> On Sat, Feb 11, 2023 at 07:13:44AM -0700, Jens Axboe wrote:
>> On 2/10/23 8:18?PM, Ming Lei wrote:
>>> On Fri, Feb 10, 2023 at 02:08:35PM -0800, Linus Torvalds wrote:
>>>> On Fri, Feb 10, 2023 at 1:51 PM Jens Axboe <axboe@kernel.dk> wrote:
>>>>>
>>>>> Speaking of splice/io_uring, Ming posted this today:
>>>>>
>>>>> https://lore.kernel.org/io-uring/20230210153212.733006-1-ming.lei@redhat.com/
>>>>
>>>> Ugh. Some of that is really ugly. Both 'ignore_sig' and
>>>> 'ack_page_consuming' just look wrong. Pure random special cases.
>>>>
>>>> And that 'ignore_sig' is particularly ugly, since the only thing that
>>>> sets it also sets SPLICE_F_NONBLOCK.
>>>>
>>>> And the *only* thing that actually then checks that field is
>>>> 'splice_from_pipe_next()', where there are exactly two
>>>> signal_pending() checks that it adds to, and
>>>>
>>>>  (a) the first one is to protect from endless loops
>>>>
>>>>  (b) the second one is irrelevant when  SPLICE_F_NONBLOCK is set
>>>>
>>>> So honestly, just NAK on that series.
>>>>
>>>> I think that instead of 'ignore_sig' (which shouldn't exist), that
>>>> first 'signal_pending()' check in splice_from_pipe_next() should just
>>>> be changed into a 'fatal_signal_pending()'.
>>>
>>> Good point, here the signal is often from task_work_add() called by
>>> io_uring.
>>
>> Usually you'd use task_sigpending() to distinguis the two, but
>> fatal_signal_pending() as Linus suggests would also work. The only
>> concern here is that since you'll be potentially blocking on waiting for
>> the pipe to be readable - if task does indeed have task_work pending and
>> that very task_work is the one that will ensure that the pipe is now
>> readable, then you're waiting condition will never be satisfied.
> 
> The 2nd signal_pending() will break the loop to get task_work handled,
> so it is safe to only change the 1st one to fatal_signal_pending().

OK, but then the ignore_sig change should not be needed at all, just
changing that first bit to fatal_signal_pending() would do the trick?

-- 
Jens Axboe



