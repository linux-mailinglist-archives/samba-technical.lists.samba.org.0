Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E90FA692659
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 20:30:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=sdohRzqa5d1KLw/5QlsnlVMZyzj35/qmiKMTCHFuH20=; b=RrIlsb6DPl2dncW7xf2Kveml9a
	n7RwOT1104d8gkkERGEK8GSoIvlXufAOmdaFMOeHz5iIQlmIl/Z7N6m7Jegm4bHIh9PB9wQehSUat
	6imkBhvOm5vlWAJUkthciC7aW/Ks0VQ29wCJDff+pwwq8AGhSRitwWdbGZdCEgDqVnqXbS5vKSABc
	IkmYYUtiR4HEag8VZfucEnVkzRNnYBYSdmohKzukDlNv0vXto7tjAZr9ja6zP4aBFBamEYDDEy8ZN
	poJjK3DppvcK0yuPMrRcinfF0hSBLbKyCc7R6mifT93ZzFUtb6oV7pBPH9/fy0b6zpln+/7oV1Fnv
	HmmOQOAg==;
Received: from ip6-localhost ([::1]:64210 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQZ5z-00B9Y1-Kc; Fri, 10 Feb 2023 19:30:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21178) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQZ5q-00B9Uf-7n
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 19:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=sdohRzqa5d1KLw/5QlsnlVMZyzj35/qmiKMTCHFuH20=; b=HcdiNnpTWGBgIXzMc4dlptDa9r
 gsriTjRTC8qzHAliSS/bYM/Y68q/ZzYPhjn/D9AHo1aSZhb8utKqTxVIIU5AJ9IDHhc8EKO2T1jfP
 gf49dCAvreG5hYSri4VdX35lRB4sba8riVLZYQPdWilPuBcylZkI0yDJmr64C4/o/QngrQe/Ua+RB
 Xmt0hxeyZjH43pu7MxIZHQ8xhmWZKkt7tgvL1bhfpFTmV8joetZC1mwiF+/45UIfZV09u5KmQszeC
 ZXIEPqeDOt302HrExWji+LR3ZyWLifhUfUmKv9JacDrMumMNhVHllXdv1nit3fusB1o8KzmylEldl
 rlVFuVtCtgXRCUnQCr3VSJzsdzWNZSuOWY6SwEdCB/M84mvJS0ZJcq8wSN5f7qPRQq/tOf+4QPsHS
 tL0aUjbK4AVIxLxlUQsx4HTayxk6BOPBk+JJA1Od2MuWrVgR1Ks87cmKlmBBDERlBi3+iroDo0Y4x
 d/D2vW8XU7KpWsF0CdL+yqmW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pQZ5p-00D3LZ-QD; Fri, 10 Feb 2023 19:29:57 +0000
Message-ID: <c3f166d3-35b6-25cf-6ccb-8650e90a5a17@samba.org>
Date: Fri, 10 Feb 2023 20:29:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Jeremy Allison <jra@samba.org>, Andy Lutomirski <luto@kernel.org>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
 <20230210065747.GD2825702@dread.disaster.area>
 <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
 <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
 <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
 <Y+aKuC1PuvX4STEI@jeremy-acer>
In-Reply-To: <Y+aKuC1PuvX4STEI@jeremy-acer>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
 Dave Chinner <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 10.02.23 um 19:19 schrieb Jeremy Allison:
> On Fri, Feb 10, 2023 at 09:57:20AM -0800, Andy Lutomirski via samba-technical wrote:
>>
>> (And if Samba needs to make sure that future writes don't change the
>> outgoing data even two seconds later when the data has been sent but
>> not acked, then maybe a fancy API could be added to help, or maybe
>> Samba shouldn't be using zero copy IO in the first place!)
> 
> Samba doesn't need any of this. The simplest thing to do is
> to restrict splice-based zero-copy IO to files leased by
> a single client, where exclusive access to changes is controled
> by the client redirector.

Yes, I guess we can use it if the file is read-only (from it's acls),
or when the client has a read lease. And of course we can have an I don't care
option, maybe reusing 'use sendfile = yes' as that has the same problem in
the existing code already.

metze

