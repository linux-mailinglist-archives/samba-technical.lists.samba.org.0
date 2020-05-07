Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 292E11C96DE
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 18:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=WuW7YUkcsP0fBu4HDlMlcovY4Vx58GgUKGnH5pUiz+E=; b=ELU+aBJX0mLeCHEPkSGHC2TC9h
	tMEqLysf9pSSB5ZQ7R8gBfAoWH6SyAp24rrue5AYcdyE9amj9Nb1O2s0zNt6KARcauOkkSd7ELYvx
	qIP1aAA8oftddiYV/vs342e39PqkrW8jBtQQPXTuH7xhIgM3XtSVwk76tFtuHu8xY8LliYxqFFWxw
	wbcgvsMv7Ts+5g65fKdOHo+hb62GFr0YrsayvT+TbSysEpB/Az+KHI7eRVHVsBT8eD5M4PQrdRbS2
	/fy/8Qi+oVGS34ney78th5e1sFkQr+b7M0FRz7FDKgpweTQecfIkFFSuhzI/nue/Jc2UzvBQq4b3B
	TIAEJxrg==;
Received: from localhost ([::1]:36832 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWjjZ-0039ZN-G5; Thu, 07 May 2020 16:50:53 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:36592) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWjjR-0039ZG-AB
 for samba-technical@lists.samba.org; Thu, 07 May 2020 16:50:48 +0000
Received: by mail-pg1-x541.google.com with SMTP id d22so3068014pgk.3
 for <samba-technical@lists.samba.org>; Thu, 07 May 2020 09:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WuW7YUkcsP0fBu4HDlMlcovY4Vx58GgUKGnH5pUiz+E=;
 b=sZpH2prd14ryaPJC87NyJNiptmJXK4piFMlYYu6+n3YjseZuuJG5FOsz2Y00H1zPjD
 /Sj9nFavh8o78ccdmBig+xcIzKsmnkGaUEKzXfONZpfA7IAlb1tBsqbD5tm9Q3dbrF+0
 GIy0oOUj+6NQsu2wQw7oIFthhelTnwfzyHjjm0Pyy+dVMV5Ko867YzybG19FYO40zL8C
 HfGucRVWJrTKWH1eQvwwCAEsm3u6OsCGgmaR9tJH3idunwBPAw+3Vffv/bdBU9zXJt0X
 18jfsiekLCcYzEnRBc+ax7w9P40/n/oHDA5JOaFKn0UD6A+oGpG0ptiEdaA7gIraehVc
 YA2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WuW7YUkcsP0fBu4HDlMlcovY4Vx58GgUKGnH5pUiz+E=;
 b=Z0HZ4iHxslPz3vC6Kr8iHEP+gDUSnp6KGZ/TA7VXQAtBprDwxqqIJfPsppE3Zr4BTP
 FR0nQtp40S/tcDmZVsG4qYd1VXR3KRi4FGa4Xt3fOC5RSZl/9deOs2iMN4D/RjhDolf1
 l1GlyulGAojU7QNbnu+NroK67JemaZWO3xO4XeaKYB7Tzb+K9y7AI9dOL1Zt7nGWH9L0
 s9OrN2pqvvlrM5QoUkgiFTEH5pbMijM8I00rDJLs+xWbuK1CJxjz9z313mMPJcA7kaZq
 egQKrO88I0x4AffuU4K1Z8/6yie4GjzMSQlO91UUXezaRuA16xPnB5iqBXyZUMd2Gk82
 IU1A==
X-Gm-Message-State: AGi0PuaLrCsxQ2kglH2xCh+MwD5lRVZnS/DKl1FlQB15XYqkH0/nAmQK
 NtJr/nYDSr/opxBiT4XgEOCvzHp6ESM=
X-Google-Smtp-Source: APiQypIXUSWU9cTnD5wBGJ8LLqnbNy9k2d9/iCN/3Y/paSUrLAd7h47GdD/7qxc/TYOPAvVNXitZcw==
X-Received: by 2002:a62:7656:: with SMTP id r83mr14403232pfc.71.1588870242745; 
 Thu, 07 May 2020 09:50:42 -0700 (PDT)
Received: from ?IPv6:2620:10d:c085:21e8::1239? ([2620:10d:c090:400::5:ddfe])
 by smtp.gmail.com with ESMTPSA id t23sm286575pji.32.2020.05.07.09.50.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 09:50:42 -0700 (PDT)
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Jeremy Allison <jra@samba.org>
References: <0009f6b7-9139-35c7-c0b1-b29df2a67f70@samba.org>
 <102c824b-b2f5-bbb1-02da-d2a78c3ff460@kernel.dk>
 <7ed7267d-a0ae-72ac-2106-2476773f544f@kernel.dk>
 <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <a8152d38-8ad4-ee4c-0e69-400b503358f3@samba.org>
 <6fb9286a-db89-9d97-9ae3-d3cc08ef9039@gmail.com>
 <9c99b692-7812-96d7-5e88-67912cef6547@samba.org>
 <117f19ce-e2ef-9c99-93a4-31f9fff9e132@gmail.com>
 <97508d5f-77a0-e154-3da0-466aad2905e8@kernel.dk>
 <20200507164802.GB25085@jeremy-acer>
Message-ID: <01778c43-866f-6974-aa4a-7dc364301764@kernel.dk>
Date: Thu, 7 May 2020 10:50:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507164802.GB25085@jeremy-acer>
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
Cc: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Pavel Begunkov <asml.silence@gmail.com>, io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 5/7/20 10:48 AM, Jeremy Allison wrote:
> On Thu, May 07, 2020 at 10:43:17AM -0600, Jens Axboe wrote:
>>
>> Replying here, as I missed the storm yesterday... The reason why it's
>> different is that later kernels no longer attempt to prevent the short
>> reads. They happen when you get overlapping buffered IO. Then one sqe
>> will find that X of the Y range is already in cache, and return that.
>> We don't retry the latter blocking. We previously did, but there was
>> a few issues with it:
>>
>> - You're redoing the whole IO, which means more copying
>>
>> - It's not safe to retry, it'll depend on the file type. For socket,
>>   pipe, etc we obviously cannot. This is the real reason it got disabled,
>>   as it was broken there.
>>
>> Just like for regular system calls, applications must be able to deal
>> with short IO.
> 
> Thanks, that's a helpful definitive reply. Of course, the SMB3
> protocol is designed to deal with short IO replies as well, and
> the Samba and linux kernel clients are well-enough written that
> they do so. MacOS and Windows however..

I'm honestly surprised that such broken clients exists! Even being
a somewhat old timer cynic...

> Unfortunately they're the most popular clients on the planet,
> so we'll probably have to fix Samba to never return short IOs.

That does sound like the best way forward, short IOs is possible
with regular system calls as well, but will definitely be a lot
more frequent with io_uring depending on the access patterns,
page cache, number of threads, and so on.

-- 
Jens Axboe


