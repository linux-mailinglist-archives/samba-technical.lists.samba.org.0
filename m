Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE361C9A2A
	for <lists+samba-technical@lfdr.de>; Thu,  7 May 2020 20:58:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=DQ2fRmSsYR8QxZExpNvs+J6T/j4NBo+77TrT19T8b1o=; b=mAs+RJpfLto06IBZ+l4La0ZeLT
	ivcLpT+nUn0rQcV9PS3OpYQAE1DOV1I+hBk+KL2Z4p1eLgoVEQWL4Mo/XMFOzsEKsaIu5FsIDVNmT
	+ueKl/X1coXFdSMD4EOPk0mkbiWjfYOk8ilh3h1Mmdo12gIGAs5X/OmgSHHJdfKPWJgdA6PGVjzE0
	4LSoUQ1DBRgjUOafwV8Quavdu68nJ1D412pPUAJR7x1cgOQdNoAG6xJogdPczl2+9d20CS11vtkSc
	ndNXcHkxIw7eBGBMtVZWnw9Gg2NXxRPM3JK2VuDkK8J5rvPnDKC4m/6bdB0L/MiTqAIlYHgJBu6fD
	jz21KbDQ==;
Received: from localhost ([::1]:43140 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWlj1-003AYp-Nn; Thu, 07 May 2020 18:58:27 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143]:40318) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWlip-003AXk-07
 for samba-technical@lists.samba.org; Thu, 07 May 2020 18:58:17 +0000
Received: by mail-il1-x143.google.com with SMTP id e8so3098394ilm.7
 for <samba-technical@lists.samba.org>; Thu, 07 May 2020 11:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DQ2fRmSsYR8QxZExpNvs+J6T/j4NBo+77TrT19T8b1o=;
 b=criEGrIxTbs3pcTAzl1VVJFPPTMm+hj/dlBpfzOWpe/SJnFzFlDOX+TBsWRZS7H9Zf
 Joaei8Sad7raGclrkzfIaqbiay6zOJHf8A4jdBOGqOw77nB1+902iQqShxvIG6VURvcX
 lDnyTqJd0zDmgPpgMZspNs2KrYlzJAQHlvnRkTwUKsLRHeX3a601N7wyWpS0JwChRgFq
 IvIRNfOkrbPD/YSFEag9evFFVPxBjy1SJTb1tJXAGxpxkusuKmwjuEWjkNB1POs9y2OR
 1au4TktrfK7XuKjzkIfwTCPgY/uz2RRXvNnvXsQp6gc9DzFOd0FcAfx5uZJgrq68XRPj
 YOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DQ2fRmSsYR8QxZExpNvs+J6T/j4NBo+77TrT19T8b1o=;
 b=JivpiLSj5EzsTXy86QLvEFAmt5mAUL9RazEA6wp/78+YOTYAkaxgij6PYnY1vNAXd2
 4chyoJ/UqRlmKMH3HmqB+TYyMZgtM0m6D+ltMHD76lHOvQlYtybC0qqb9E2++xqpBQQV
 UBvq95mwA0qtheTV7v7bv+rxjM683RXGJCA54x7KUdAROlgIRzyae1lQs4ZWyQv0ZoM2
 hoWBrvPH80Lz9cYgGd1yCwX/tNHuLiPJTuHjCpRX0ly4Dgm5Ch39cprRdPAdQy4hDmzA
 WcqLn6+RsCTyaBVRBxIVBwO7B7h8O/x9KZUOq+PN75auM0FUl5Tddvbw58DKGwfmYmAr
 wq8g==
X-Gm-Message-State: AGi0Pub/G8JLzMS7h/BKw4qcdXg36TjtMRJKPz9aPZiVcE1/SvfI/Lkk
 1m7z0cOA2OxWKE1jfP0qOPKsrL7U5gI=
X-Google-Smtp-Source: APiQypL7bdm+URYteCaMctnOtFVvumzG/T2YOByZiG3jCI5ZxJiZh3/a1qLq8GT+fL8/sfZrQwJ+rQ==
X-Received: by 2002:a92:c845:: with SMTP id b5mr15089082ilq.63.1588877888990; 
 Thu, 07 May 2020 11:58:08 -0700 (PDT)
Received: from [192.168.1.159] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id q29sm3110861ill.65.2020.05.07.11.58.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 May 2020 11:58:08 -0700 (PDT)
Subject: Re: Data Corruption bug with Samba's vfs_iouring and Linux
 5.6.7/5.7rc3
To: Jeremy Allison <jra@samba.org>
References: <cd53de09-5f4c-f2f0-41ef-9e0bfca9a37d@kernel.dk>
 <a8152d38-8ad4-ee4c-0e69-400b503358f3@samba.org>
 <6fb9286a-db89-9d97-9ae3-d3cc08ef9039@gmail.com>
 <9c99b692-7812-96d7-5e88-67912cef6547@samba.org>
 <117f19ce-e2ef-9c99-93a4-31f9fff9e132@gmail.com>
 <97508d5f-77a0-e154-3da0-466aad2905e8@kernel.dk>
 <20200507164802.GB25085@jeremy-acer>
 <01778c43-866f-6974-aa4a-7dc364301764@kernel.dk>
 <20200507183140.GD25085@jeremy-acer>
 <3130bca5-a2fb-a703-4387-65348fe1bdc8@kernel.dk>
 <20200507185507.GF25085@jeremy-acer>
Message-ID: <c28c40aa-9241-8cdc-92d4-027ab91702de@kernel.dk>
Date: Thu, 7 May 2020 12:58:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200507185507.GF25085@jeremy-acer>
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

On 5/7/20 12:55 PM, Jeremy Allison wrote:
> On Thu, May 07, 2020 at 12:35:42PM -0600, Jens Axboe wrote:
>> On 5/7/20 12:31 PM, Jeremy Allison wrote:
>>>
>>> Look at how quickly someone spotted disk corruption
>>> because of the change in userspace-visible behavior
>>> of the io_uring interface. We only shipped that code
>>> 03 March 2020 and someone *already* found it.
>>
>> I _think_ that will only happen on regular files if you use RWF_NOWAIT
>> or similar, for regular blocking it should not happen. So I don't think
>> you're at risk there, though I do think that anyone should write
>> applications with short IOs in mind or they will run into surprises down
>> the line. Should have been more clear!
> 
> Well we definitely considered short IOs writing the
> server code, but as the protocol allows that to be
> visible to the clients (in fact it has explicit
> fields meant to deal with it) it wasn't considered
> vital to hide them from clients.

Yes, and in case my reply wasn't totally clear, it was more of a general
observation, not directed at Samba specifically!

> We'll certainly fix up short reads for the iouring
> module, but it's less clear we should mess with
> our existing blocking threaded pread/pwrite code
> to deal with them. Possibly goes into the bucket
> of "belt and braces, couldn't possibly hurt" :-).

Agree, belts and suspenders for the regular pread/pwrite, that's a fair
position.

> Thanks for the clarification !

Thanks for getting this fleshed out! Impressed with the speed at which
we got to the bottom of this.

-- 
Jens Axboe


