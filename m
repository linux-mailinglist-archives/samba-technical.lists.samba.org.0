Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3B9290900
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 17:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=y3zyQD1oZ6nZSGLlgSpYoYP+dUXkQUi0W/fAaordKOE=; b=OmY3/BuV/cxQWAq+MPq/JS64IR
	02l4YcQWNMqYSLTabJKxFtt+adjq04xxHEz3XSa5PKmsathIogNm5u1SeAfoW6DKGK3Q0gLv4y5pG
	ItW1iZPA4if/wMKFkM1NDK2LHZ4+RaDWYYpFVRlkS4IeOa06sNuBxNOMJZjeL773jaqPpmxhBUyeY
	Q+2G5zv2HHpfi9v3F515Ae2tPSo9PYpCkI0RaBqgFd8azwZGB7z06XvCPkzYWNKS5YjJfd7WHFFXE
	Bt5e6039sIMWVAfYTGNAthYIYPnVALcjCK0T4p3TeuY0E5lJ2b9QR9qmL/eC5APo5R2U1ifaVvvZc
	nIPLakOQ==;
Received: from ip6-localhost ([::1]:47264 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTS6r-00CPob-1f; Fri, 16 Oct 2020 15:57:37 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:37598) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTS6k-00CPoU-7k
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 15:57:33 +0000
Received: by mail-pl1-x643.google.com with SMTP id o8so1513880pll.4
 for <samba-technical@lists.samba.org>; Fri, 16 Oct 2020 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=y3zyQD1oZ6nZSGLlgSpYoYP+dUXkQUi0W/fAaordKOE=;
 b=xRSca9lpG2RA4/tzFbuZ4JNhHW6GpDoikHSIDlW6keDOYsevR63Psz4kylc4+clkpx
 2wYWrNexjhb5O6WdwevAcHKwgXxKaczMB0QOUjmghwqfZmnlXvsZ8cRGuwqAygOHPYjH
 O22XhT+bnsS5RAKA7VVejzzhNubsaFhcPvCYy/mBXPmbZjMoeGDIB+c/SwHStHjU/B9C
 oMrNe5A/hRSz5KtVOgypW4qKGTWgCVc/oBlXt8ldjwWHcpG0eUBui7otynojmYJCaceb
 zC4rXQlnUCZa9o6Uor2KTK8vMn+gWRVfxEa/SJkhxMhD8BrpmzDibKspFI1aHtPst2od
 kjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y3zyQD1oZ6nZSGLlgSpYoYP+dUXkQUi0W/fAaordKOE=;
 b=dar1ScxyTLKZt+jtIJR9pmxJ3sC0Y+GgbUUHM4gW2F0X34igq+L/zGULtXuUBpxYzc
 6lCzqVjd4YbRNDfhUyha/enVAOgRiVs84R16iyW9FjSZ3tB+0dMoVfHbP+XUkZ+qher/
 WL33vG2JidX8K1FGi7SRh2gxuO546QmhTaGSBPUDkEaPYsjxI6PHD8BFIETNPPa7Vsx5
 JkXINr1QQzgtkJ3tQ11bJN4F2co3u8sDyoDlKFKVbuXQI0lTwfIkYamB6EEroqNY7j9D
 b0fSUUbaRa1wssGHsXuRa4ju55QhLNL41PP8AbD06Am9aSAFbW16KhVuALsMXDAzPgu9
 Dn6g==
X-Gm-Message-State: AOAM533dIBeyJ9UO/6ErsN1a7mLZSV7reMvk8AZ67xG2mKpypX99RgC2
 3y1PpeWqw1XBQHOYNXUoEIqazg==
X-Google-Smtp-Source: ABdhPJzp4kwGjI5H+Q0hATkqinnIwe1oMvo4YSYNKkQDbmLAqCqSKmaE3fBeMLvQCGA2TxvnMtK4uQ==
X-Received: by 2002:a17:90a:c796:: with SMTP id
 gn22mr4838629pjb.224.1602863845915; 
 Fri, 16 Oct 2020 08:57:25 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id u14sm3412531pjf.53.2020.10.16.08.57.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 08:57:25 -0700 (PDT)
Subject: Re: Samba with multichannel and io_uring
To: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
 <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
Message-ID: <18e153db-5ee9-f286-58ae-30065feda737@kernel.dk>
Date: Fri, 16 Oct 2020 09:57:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 10/16/20 5:49 AM, Stefan Metzmacher wrote:
> Hi Jens,
> 
>> Thanks for sending this, very interesting! As per this email, I took a
>> look at the NUMA bindings. If you can, please try this one-liner below.
>> I'd be interested to know if that removes the fluctuations you're seeing
>> due to bad locality.
>>
>> Looks like kthread_create_on_node() doesn't actually do anything (at
>> least in terms of binding).
>>
>>
>> diff --git a/fs/io-wq.c b/fs/io-wq.c
>> index 74b84e8562fb..7bebb198b3df 100644
>> --- a/fs/io-wq.c
>> +++ b/fs/io-wq.c
>> @@ -676,6 +676,7 @@ static bool create_io_worker(struct io_wq *wq, struct io_wqe *wqe, int index)
>>  		kfree(worker);
>>  		return false;
>>  	}
>> +	kthread_bind_mask(worker->task, cpumask_of_node(wqe->node));
>>  
>>  	raw_spin_lock_irq(&wqe->lock);
>>  	hlist_nulls_add_head_rcu(&worker->nulls_node, &wqe->free_list);
>>
> 
> I no longer have access to that system, but I guess it will help, thanks!

I queued up it when I sent it out, and it'll go into stable as well.
I since verified on NUMA here that it does the right thing, and that
things weren't affinitized properly before. So pretty confident that it
will indeed solve this issue!

> With this:
> 
>         worker->task = kthread_create_on_node(io_wqe_worker, worker, wqe->node,
>                                 "io_wqe_worker-%d/%d", index, wqe->node);
> 
> I see only "io_wqe_worker-0" and "io_wqe_worker-1" in top, without '/0' or '/1' at the end,
> this is because set_task_comm() truncates to 15 characters.
> 
> As developer I think 'io_wqe' is really confusing, just from reading I thought it
> means "work queue entry", but it's a per numa node worker pool container...
> 'struct io_wq_node *wqn' would be easier to understand for me...
> 
> Would it make sense to give each io_wq a unique identifier and use names like this:
> (fdinfo of the io_uring fd could also include the io_wq id)
> 
>  "io_wq-%u-%u%c", wq->id, wqn->node, index == IO_WQ_ACCT_BOUND ? 'B' : 'U')
> 
>  io_wq-500-M
>  io_wq-500-0B
>  io_wq-500-0B
>  io_wq-500-1B
>  io_wq-500-0U
>  io_wq-200-M
>  io_wq-200-0B
>  io_wq-200-0B
>  io_wq-200-1B
>  io_wq-200-0U
> 
> I'm not sure how this interacts with workers moving between bound and unbound
> and maybe a worker id might also be useful (or we rely on their pid)

I don't think that's too important, as it's just a snapshot in time. So
it'll fluctuate based on the role of the worker.

> I just found that proc_task_name() handles PF_WQ_WORKER special
> and cat /proc/$pid/comm can expose something like:
>   kworker/u17:2-btrfs-worker-high

Yep, that's how they do fancier names. It's been on my agenda for a while
to do something about this, I'll try and cook something up for 5.11.

-- 
Jens Axboe


