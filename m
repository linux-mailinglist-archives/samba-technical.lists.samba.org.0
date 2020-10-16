Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A23329094C
	for <lists+samba-technical@lfdr.de>; Fri, 16 Oct 2020 18:06:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NuRq6Ozb7VpJd7RAoCR5EP362roeiSgqhawOdKQ6JUE=; b=2Ygx2ObNRKbzQgQfxFP0USqlTN
	y5ldrShy+gMejrqATRCmQJaOteebleOvdKUOQfME/dtz0G0idflmdJ2Ll48AyLqTDcl22vTuQ250W
	TmSU1CDb1BtFKVMcTDbSexTYI9znp8Uzkxq6s/MbgxZF+4hGMTVzjnAoqPAr2aA61Rxj9xme3pSMu
	RoFbRlB+ufEfO707AzHG+92cgP6Sl1BgAFYIgxWUcCR9cyMWuu/YtXZqfGYDRHeGOu7bGz6IXcvqI
	1B6+/dQL9Sk8WvM3ydrmEA4mwsVISRs+YJdt7j/h7pwgTrqX5IBKOh6xR1wRnrXAUBZclRaRpfiTM
	JGM+BI/A==;
Received: from ip6-localhost ([::1]:48702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kTSFd-00CQ1J-Is; Fri, 16 Oct 2020 16:06:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:36585) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kTSFX-00CQ1C-S3
 for samba-technical@lists.samba.org; Fri, 16 Oct 2020 16:06:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id b26so1767314pff.3
 for <samba-technical@lists.samba.org>; Fri, 16 Oct 2020 09:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=NuRq6Ozb7VpJd7RAoCR5EP362roeiSgqhawOdKQ6JUE=;
 b=OtP7/TXXa7Fmvhze//ZGRpup+mfu+rIRMz6PWqlJ9/tczjk0WmKsrt0oeusbiCNKug
 CD3ZHCwT2bZD/BssRzts0NF/jXu85Yeyq03Rw9RQjX1/47FPsQOwvUhSLxsYLGLMf57D
 Bwp18cEM1lo044wqfRrJz2lSKRBBobx/XC7nvkdLQ1cq0xNB8hsL6vshqLf5Iis4WnxR
 Ffkp6lcsMl2I/vPQUzQhHIyBmklnaMGH0S+NOaTko82uFEaJu4DsHz9w7VSEl2qFxEFd
 HNMYHyg+O09AMejiW/VdRX0xV8bL34v7nlnbvlBzX2NjZQIKPOV6HiWi/VlgD8ldkEyH
 pVyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NuRq6Ozb7VpJd7RAoCR5EP362roeiSgqhawOdKQ6JUE=;
 b=O5dAH2oMPbkA7aSffwehJnAF4wbKGKBpUSU3wrjm/zL1nAu2nt03WHpSyJl0yLpIaF
 Q75UxP++VVhPS9yk7Tw4eALqtJtbOFD3kJEFUvZPvVqj6AvImh+FapIRGGt7SAJ/NwHw
 RWSTAgW3phaUrXyihK1vtwf/Bv2x7pijjKjATUL62m9/cpIfGdPmvlSx8eI5TValMta6
 rv/TphZfk+sh9uksQqoM83jzbDnb+KESJ/VESziOAodjW0FrB6z7TT35+l/VsFO0+NYl
 7k7QLfXSMP419qTwuhQpoPI0E76ZQMg1SAXamtcr8tVU1fEZm3HqAWxM1u3f1NMuKO6T
 eX2A==
X-Gm-Message-State: AOAM532ixYfziEEuRwuWv9kODBlPllyWqz+FT/Gn0GBf7gFWx/qX8D05
 NKCiBk5gf7pfFjsQOLHG78mQfg==
X-Google-Smtp-Source: ABdhPJzVfJJzF+FaqbrjVpgXENhDDoECvIfbEp2ZDWyjvfrq3+F+6eJbAc0Jo4gXmreGuQMPgLWZ7g==
X-Received: by 2002:a65:6712:: with SMTP id u18mr3639698pgf.84.1602864385781; 
 Fri, 16 Oct 2020 09:06:25 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id d128sm3309995pfd.94.2020.10.16.09.06.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Oct 2020 09:06:25 -0700 (PDT)
Subject: Re: Samba with multichannel and io_uring
To: Stefan Metzmacher <metze@samba.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
References: <53d63041-5931-c5f2-2f31-50b5cbe09ec8@samba.org>
 <efb8b619-ca06-5c6b-e052-0c40b64b9904@kernel.dk>
 <6e7ea4e7-8ef7-9ad4-1377-08749f9bae0b@samba.org>
 <18e153db-5ee9-f286-58ae-30065feda737@kernel.dk>
 <892e855a-9c4f-ea5b-6728-f02df271c2c8@samba.org>
Message-ID: <461e4fc4-0e7d-2a6f-f2eb-a962b077ed81@kernel.dk>
Date: Fri, 16 Oct 2020 10:06:24 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <892e855a-9c4f-ea5b-6728-f02df271c2c8@samba.org>
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

On 10/16/20 10:03 AM, Stefan Metzmacher wrote:
>>
>> I don't think that's too important, as it's just a snapshot in time. So
>> it'll fluctuate based on the role of the worker.
>>
>>> I just found that proc_task_name() handles PF_WQ_WORKER special
>>> and cat /proc/$pid/comm can expose something like:
>>>   kworker/u17:2-btrfs-worker-high
>>
>> Yep, that's how they do fancier names. It's been on my agenda for a while
>> to do something about this, I'll try and cook something up for 5.11.
> 
> With a function like wq_worker_comm being called by proc_task_name(),
> you would capture current IO_WORKER_F_BOUND state and alter the name.

Oh yes, it'll be accurate enough, my point is just that by the time you
see it, reality might be different. But that's fine, that's how they
work.

> Please CC me on your patches in that direction.

Will do!

-- 
Jens Axboe


