Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id AC40D693175
	for <lists+samba-technical@lfdr.de>; Sat, 11 Feb 2023 15:14:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=oqGRKzSo6E4/f+woXcOCjpwjArDsyHYfDxL4HTg7iio=; b=nNS9LpWHLSRBg3Xak0nTwwlQ3J
	KnKCNEP6uU03LxQoE9R6+cpjSsALpCz9R0jbxGo6ZHz9VCD9RXUMJemVs2hQWCc+QC0Kcdh+kEloV
	kBntdj3VloasNUhGyNHFNaBY9M0wSkbiHRVL/xJFV+6nZZN74QHqMRi0d4GL5o0s0VVbM82dBvtTe
	dU88hTMmNE7UctIqEIeWeKMD/Amoimokj3xb+JDH630uiOSDhHsJk0Q/+kam6V/71CZkzspePJANU
	RkvoCL6TkIfrGtBge+tLJJmRJyVdJ4f57kQV3Z3ZOARZimecKpVv1ovNwbGjfnoGeAyT3ZZnJtHP8
	Ppf3vJoA==;
Received: from ip6-localhost ([::1]:48824 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQqdX-00BUuG-OR; Sat, 11 Feb 2023 14:13:55 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40596) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQqdQ-00BUu6-QO
 for samba-technical@lists.samba.org; Sat, 11 Feb 2023 14:13:51 +0000
Received: by mail-pl1-x62f.google.com with SMTP id be8so9419325plb.7
 for <samba-technical@lists.samba.org>; Sat, 11 Feb 2023 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oqGRKzSo6E4/f+woXcOCjpwjArDsyHYfDxL4HTg7iio=;
 b=wCNiYJcLkvEUpEZHzCL9RSSTZah20e3Vx5u3HSFTxE8bpS6ViAr7yu2nh6p7lms2yc
 yOAKa9NxNMFxnywW9IFuGVT0q1LbIqUR9FQgUsxxKG31pWabOZ5AxPL4nn2Eak6eBUFy
 z9kShKrMpIJtUnj5hM/0l2fqIh8uVfF/GjluWOL0mUT0gf0a49ylXOVttlcfR+bB7PC3
 GyAHRdXjdOPP7uzT3iNyZ4YznGS5MkfCepIrwxKiMOQ+SktVrYhDDeKcrgl50xxID1bi
 32NrSPKIGD0eBfPDf3QV9+Hss3B8PpPqCifUU0VKfGtwDAHQrDhNqYh5ouBiCy0xt09G
 ynvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oqGRKzSo6E4/f+woXcOCjpwjArDsyHYfDxL4HTg7iio=;
 b=J190OqJs+bD1qC/TFqrbmZb0MOkFRzLRf6UDjTHOfQ2zA8xH5sMrZL/Qmb2dXflg8Z
 lD7A42Q4kUMHSYwaHq3xX6HuhzEhCdsbhL7ZFoEekAYtjGikkG1uGikx+mzRuBHZFrTl
 fBYkipkrKnkr1AT0LwERc/YgfrU4X6jhfXaKknbXbEjguf1pMdcYKpdDSLoGGZmeCCBo
 OG8eAB41FTfL38/qA/YDQ/1ue7gCSr/UUduC90vrAYLym5cuy4VaMBi9jcPCnkjBkHB6
 7YYdL9tNw3LvqujaiPBqeiEK475xJRJyqtEi6x7wW0WMiuLo7U2435za+dIsRpqIVKa9
 AYLg==
X-Gm-Message-State: AO0yUKWJAK1Wnk86i0RTjsMztv0xK6BfXm58uBWMTioUWIzz0xxUHBYw
 hu/X6MBNV1S45IMFwb3LphyZOA==
X-Google-Smtp-Source: AK7set/LnVAtiy5TUkkuzhteoCRyrs4pqpY8XSDBYd/FSNwWtCjGA99X1ZzvEOtfDL0WSzAPF6ud0g==
X-Received: by 2002:a17:902:680b:b0:199:3f82:ef62 with SMTP id
 h11-20020a170902680b00b001993f82ef62mr15067071plk.5.1676124826228; 
 Sat, 11 Feb 2023 06:13:46 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 q10-20020a170902b10a00b00174f61a7d09sm5015531plr.247.2023.02.11.06.13.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 11 Feb 2023 06:13:45 -0800 (PST)
Message-ID: <55eaac9e-0d77-1fa2-df27-4d64e123177e@kernel.dk>
Date: Sat, 11 Feb 2023 07:13:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Ming Lei <ming.lei@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <CAHk-=wgA=rB=7M_Fe3n9UkoW_7dqdUT2D=yb94=6GiGXEuAHDA@mail.gmail.com>
 <1dd85095-c18c-ed3e-38b7-02f4d13d9bd6@kernel.dk>
 <CAHk-=wiszt6btMPeT5UFcS=0=EVr=0injTR75KsvN8WetwQwkA@mail.gmail.com>
 <fe8252bd-17bd-850d-dcd0-d799443681e9@kernel.dk>
 <CAHk-=wiJ0QKKiORkVr8n345sPp=aHbrLTLu6CQ-S0XqWJ-kJ1A@mail.gmail.com>
 <7a2e5b7f-c213-09ff-ef35-d6c2967b31a7@kernel.dk>
 <CALCETrVx4cj7KrhaevtFN19rf=A6kauFTr7UPzQVage0MsBLrg@mail.gmail.com>
 <b44783e6-3da2-85dd-a482-5d9aeb018e9c@kernel.dk>
 <2bb12591-9d24-6b26-178f-05e939bf3251@kernel.dk>
 <CAHk-=wjzqrD5wrfeaU390bXEEBY2JF-oKmFN4fREzgyXsbQRTQ@mail.gmail.com>
 <Y+cJDnnMuirSjO3E@T590>
In-Reply-To: <Y+cJDnnMuirSjO3E@T590>
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

On 2/10/23 8:18?PM, Ming Lei wrote:
> On Fri, Feb 10, 2023 at 02:08:35PM -0800, Linus Torvalds wrote:
>> On Fri, Feb 10, 2023 at 1:51 PM Jens Axboe <axboe@kernel.dk> wrote:
>>>
>>> Speaking of splice/io_uring, Ming posted this today:
>>>
>>> https://lore.kernel.org/io-uring/20230210153212.733006-1-ming.lei@redhat.com/
>>
>> Ugh. Some of that is really ugly. Both 'ignore_sig' and
>> 'ack_page_consuming' just look wrong. Pure random special cases.
>>
>> And that 'ignore_sig' is particularly ugly, since the only thing that
>> sets it also sets SPLICE_F_NONBLOCK.
>>
>> And the *only* thing that actually then checks that field is
>> 'splice_from_pipe_next()', where there are exactly two
>> signal_pending() checks that it adds to, and
>>
>>  (a) the first one is to protect from endless loops
>>
>>  (b) the second one is irrelevant when  SPLICE_F_NONBLOCK is set
>>
>> So honestly, just NAK on that series.
>>
>> I think that instead of 'ignore_sig' (which shouldn't exist), that
>> first 'signal_pending()' check in splice_from_pipe_next() should just
>> be changed into a 'fatal_signal_pending()'.
> 
> Good point, here the signal is often from task_work_add() called by
> io_uring.

Usually you'd use task_sigpending() to distinguis the two, but
fatal_signal_pending() as Linus suggests would also work. The only
concern here is that since you'll be potentially blocking on waiting for
the pipe to be readable - if task does indeed have task_work pending and
that very task_work is the one that will ensure that the pipe is now
readable, then you're waiting condition will never be satisfied.

-- 
Jens Axboe


