Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D057692A92
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 23:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=R4N26B9VGGTnqC3xqOaxRLSDi0f2Dt0eKjIQvb/X62o=; b=aGgxzn+obU1lLcGcZLGgEt7XIg
	sANHb+ZJr7+Gk60ZJ/359he0gMhppbJDZr9Df9OAjQCmPCIJutgj7DOnPb6H7XzgKnd9Y05SXNtI8
	wgKDtx0Rc8DYi9M1o+mq4r7YFHoYls0uBcOz9n/iOO707XNl17jcOyzHbxLTSPJZjWBEJ/Jitkh/x
	33hQqLWbDsqv5Dv7ilB/AbEJR9NAkOFONrRt7KE1ZlQJFbcCGhQw2DS/b7/MYSl+BChvh6ibeLTmd
	LFFJXLiJ/Pi32BVEdzU7Z9P2l27/RWcraMLBfeELBMCloHcDHkkIZsmgvXvFy/zmjzvxSoTSjFSr2
	XZfV7h6Q==;
Received: from ip6-localhost ([::1]:28558 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQcFL-00BO3Y-IR; Fri, 10 Feb 2023 22:51:59 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:35738) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQcFF-00BO3M-Fs
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 22:51:56 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so11662439pjq.0
 for <samba-technical@lists.samba.org>; Fri, 10 Feb 2023 14:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R4N26B9VGGTnqC3xqOaxRLSDi0f2Dt0eKjIQvb/X62o=;
 b=u5HRO63gAcA4nfusNIOQSq65f86ZTJ3MqNvxRzAX5W+R22e0AtrfGMumqSuVrq1lF9
 NsFXM7VxYdTkvyXmirDO3xIUpW+ewcW65e2UkdwGOQJ9YYAwpFCJYyHSbkZWApVHEZGE
 trnv6AWqvv6dHFaEgCi4hVQIt+kM56QLFx8gqLW0NWJFYOuOwB8G583A//zD1Sai/c7C
 Yv8iBj0gA1lfIgrL3ID5Im4XMbfR6eu3isQI3hqYm8g51dYY/9UgnTVjXvGyKAjaFsRq
 qoIJ6191tOa8qIoM1uzUoaYGc2WROgSeZ+8ShxrfdZMyZQIyFSeReusVE5uiSq1tUukg
 zUbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=R4N26B9VGGTnqC3xqOaxRLSDi0f2Dt0eKjIQvb/X62o=;
 b=mmQppHU2zGTX73LHQMEue5fa9n1jRg0Su8IvlIyH15AePhjj9wPGhXhuNOgjTQqtkk
 W064DCeCu6b9NDgOjnpoRAboV8/IdZXEZYqMboT7jeh7Fp3PF8T2Hf8WT6IcV3Kjm+rS
 7cAW99wU1Pt9lJTdPjQE1t0xf5H+94zaUFdzUTwKlLP57y/CgmeG/OG1GAcmSBDwOtZ/
 F7RmuzP6C7RDvwVbGjb1Zt6uNDRbRQ/ODKd/NU+vuWSjLqR1DSa8VCVD63PdLwpE5uA0
 I/q6pxUk06UO260h34bn7PptdebINh0fVCilf1ocf6ddk2x44sj0yQa1NLUCrOur3+2N
 v2sA==
X-Gm-Message-State: AO0yUKWA9ppWx6Z2/2tmEtvOHT5x9xezZSGA/0iaTJ488TnyCHIuSfUW
 JpBnzhmkfp7DKrQXqrRUeo/A6Q==
X-Google-Smtp-Source: AK7set/0HEQG/FQ9H218VpRyJjXTjhHzpcw6zsWsYqjqsJHruBzZv/lO8Nfnn1XVxrZ0jfTCujLcLQ==
X-Received: by 2002:a05:6a20:7f8e:b0:be:cd93:66cd with SMTP id
 d14-20020a056a207f8e00b000becd9366cdmr18769759pzj.2.1676069510837; 
 Fri, 10 Feb 2023 14:51:50 -0800 (PST)
Received: from [192.168.1.136] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 z29-20020a63b91d000000b0047899d0d62csm3439655pge.52.2023.02.10.14.51.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Feb 2023 14:51:50 -0800 (PST)
Message-ID: <c395bf68-108e-1674-1a1c-4cb26178d87c@kernel.dk>
Date: Fri, 10 Feb 2023 15:51:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 'Linus Torvalds' <torvalds@linux-foundation.org>,
 Dave Chinner <david@fromorbit.com>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <CAHk-=wip9xx367bfCV8xaF9Oaw4DZ6edF9Ojv10XoxJ-iUBwhA@mail.gmail.com>
 <20230210061953.GC2825702@dread.disaster.area>
 <CAHk-=wj6jd0JWtxO0JvjYUgKfnGEj4BzPVOfY+4_=-0iiGh0tw@mail.gmail.com>
 <304d5286b6364da48a2bb1125155b7e5@AcuMS.aculab.com>
In-Reply-To: <304d5286b6364da48a2bb1125155b7e5@AcuMS.aculab.com>
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
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stefan Metzmacher <metze@samba.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 2/10/23 3:41?PM, David Laight wrote:
> From: Linus Torvalds
>> Sent: 10 February 2023 17:24
> ...
>> And when it comes to networking, in general things like TCP checksums
>> etc should be ok even with data that isn't stable.  When doing things
>> by hand, networking should always use the "copy-and-checksum"
>> functions that do the checksum while copying (so even if the source
>> data changes, the checksum is going to be the checksum for the data
>> that was copied).
>>
>> And in many (most?) smarter network cards, the card itself does the
>> checksum, again on the data as it is transferred from memory.
>>
>> So it's not like "networking needs a stable source" is some really
>> _fundamental_ requirement for things like that to work.
> 
> It is also worth remembering that TCP needs to be able
> to retransmit the data and a much later time.
> So the application must not change the data until it has
> been acked by the remote system.

This has been covered, and:

> I don't think io_uring has any way to indicate anything
> other than 'the data has been accepted by the socket'.

This is wrong and has also been covered.

-- 
Jens Axboe


