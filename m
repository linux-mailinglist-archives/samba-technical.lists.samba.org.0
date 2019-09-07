Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA354AC3C3
	for <lists+samba-technical@lfdr.de>; Sat,  7 Sep 2019 02:58:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=1rZDT7aN86EweQ934rVvpishZdvw8GFzMbnTnAYduqQ=; b=BB8td4zyygUDV5embRDTzAsHaA
	mFwMUQmIOcFmpLaZVIdeJ6PNL2mC6I8UShqtPK3U0l86vWcc5gCdVplX9hOZ556TmIfrRqElGbmPO
	Qzlf0wyOUoj4nvTXumtiFds41ey8HrJ+OP+SkUJpxFjwhTltYmbr+ZGa70gyZhs0aeiH5q68iLuLF
	/NUiU7QMssEiG/LhNnZ7hZgXTPGI31kNOTeWfgYGNvw/Ge4NxY2A7imzUi5relbnMddoJ+fNVvJSm
	pjeE3iSxctk/CoaO5WwuqrLZWgVOXthGeTQxOTUrl78XU1WvG/eXJvGxAfKMB3EGgrILe3yRCL/m9
	nhvCT5Zg==;
Received: from localhost ([::1]:41838 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1i6P3I-0048KS-95; Sat, 07 Sep 2019 00:58:08 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:41162) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1i6P38-0048KL-CA
 for samba-technical@lists.samba.org; Sat, 07 Sep 2019 00:58:06 +0000
Received: by mail-ot1-x32b.google.com with SMTP id o101so7462737ota.8
 for <samba-technical@lists.samba.org>; Fri, 06 Sep 2019 17:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=1rZDT7aN86EweQ934rVvpishZdvw8GFzMbnTnAYduqQ=;
 b=TT4/QnMNqCZTk1jxWH2TcWbr4IXoqbR7evth4niQErpQk0yMuAvoEBzjryhoOvWhPP
 7LyxNBLD0+noRaG0ZRyqSl4J/BwPlok+wKvCjs8j4kmp91XIzGENn/EgLsqRaWwGjaum
 gflUFQBzGadd/Jq+f/zr/8QpUN7X/XHgLpnH1Ycna+WYh8f5hEGt32WqVQjave9M9Z9R
 LkXJIFcnWbNrjcanpCYo4c86x84NTkYAq06/pw+xqqC8WExjffFHSDfKaXNeAzd61wTG
 O+LyjpRuNbwHkJW230MVcheQJCEZBaXxgraXIvtNFIAocKfUPC4UvSSVxmAuoFI6QFmj
 nS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=1rZDT7aN86EweQ934rVvpishZdvw8GFzMbnTnAYduqQ=;
 b=h+epCkGrSwWufUGoorZhpuEobV17Sxwp8+FRC2BkDAprRZE+jg92bnVWPhdfBqYnyh
 pvue5OyNjNgM/0N/I5HcmVnUiBZ0DPjCvt0dgFL0N4Swysi9WJK1VsS1wuB12vI1uCsy
 uI7+l2FaOdpfHaDkG/5ANlrrk0NEerHCFOOWa2M7WIGT+uF+siTuaSjwr5lwriJy1kLX
 lwij7JdFxhMEoEdWXhm+wZu0vwD/vFN4R81E8sq+C7lKGlGp4K29h0/K/S6eobP+kf77
 AmDPKrjC57fFb2Ep+BnrwZOAwXTO7qn+znTCe0mdtUm5mW2ibWSPSOA19AyGj+M1Mn6A
 0rtg==
X-Gm-Message-State: APjAAAVvbR496wc2Vw26fu6BAKgPlbqhAoSTcAcHC5oMhiOzuQmbahV6
 p054csBGeCd6IZ+W/YaMXsVd8rskO9FdBlUomp0=
X-Google-Smtp-Source: APXvYqx0mvghDuPEIIzqUM2vkYj5vc0fJT08t5MyCsIrBzilBJZsXgaux1DRDaV/o5irbRYPHn4iums6mRXns2og9Nk=
X-Received: by 2002:a9d:a0d:: with SMTP id 13mr6874824otg.282.1567817872957;
 Fri, 06 Sep 2019 17:57:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:1d4b:0:0:0:0:0 with HTTP;
 Fri, 6 Sep 2019 17:57:52 -0700 (PDT)
In-Reply-To: <67731bdad1bd3dda0d25a9ba1a8aebe8f7d17d92.camel@samba.org>
References: <CGME20190906020151epcas1p487a64747d0a00c84bc683fe0d07207bd@epcas1p4.samsung.com>
 <006701d56457$0c77fc60$2567f520$@samsung.com> <20190906161845.GA192819@jra4>
 <CAKYAXd-uR9RCQeVKsfREAvegP7J06nHDZ4nfeo1M+5KnkZ4VjQ@mail.gmail.com>
 <20190906230552.GA37629@jra4>
 <67731bdad1bd3dda0d25a9ba1a8aebe8f7d17d92.camel@samba.org>
Date: Sat, 7 Sep 2019 09:57:52 +0900
Message-ID: <CAKYAXd_VO+9=aNm2Fii-_AVuFR9uDSHz+3nN2uKPCJ9BcO1Q7g@mail.gmail.com>
Subject: Re: samba performance difference between old and the latest ?
To: Andrew Bartlett <abartlet@samba.org>
Content-Type: text/plain; charset="UTF-8"
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
From: Namjae Jeon via samba-technical <samba-technical@lists.samba.org>
Reply-To: Namjae Jeon <linkinjeon@gmail.com>
Cc: Namjae Jeon <namjae.jeon@samsung.com>, sergey.senozhatsky@gmail.com,
 samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

2019-09-07 9:37 GMT+09:00, Andrew Bartlett <abartlet@samba.org>:
> On Fri, 2019-09-06 at 16:05 -0700, Jeremy Allison via samba-technical
> wrote:
>> On Sat, Sep 07, 2019 at 07:57:24AM +0900, Namjae Jeon wrote:
>> > 2019-09-07 1:18 GMT+09:00, Jeremy Allison via samba-technical
>> > <samba-technical@lists.samba.org>:
>> > > On Fri, Sep 06, 2019 at 11:01:51AM +0900, Namjae Jeon via samba-
>> > > technical
>> > > wrote:
>> > > > Hello,
>> > > >
>> > > > I found something strange during measuring performance with
>> > > > samba these
>> > > > days.
>
>> > > > dd test result is same with iozone result.
>> > > >
>> > > > samba 4.7.6 : 11.6MB/s
>> > > > samba 4.10.6 : 9.5MB/s
>> > > >
>> > > > with samba 4.7.6 :
>> > > > root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero
>> > > > of=1.txt
>> > > > bs=4096
>> > > > count=1024
>> > > > 1024+0 records in
>> > > > 1024+0 records out
>> > > > 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.360991 s, 11.6 MB/s
>> > > >
>> > > > with samba 4.10.6 :
>> > > > root@test1234-Samsung-DeskTop-System:/mnt/read# dd if=/dev/zero
>> > > > of=1.txt
>> > > > bs=4096
>> > > > count=1024
>> > > > 1024+0 records in
>> > > > 1024+0 records out
>> > > > 4194304 bytes (4.2 MB, 4.0 MiB) copied, 0.442567 s, 9.5 MB/s
>> > > >
>> > > > Am I missing something? or real issue ?
>> > >
>> > > Is this on identical kernel versions ?
>> >
>> > Yes, I compared two versions in the same test environment.
>>
>> Just checking :-). In that case doing a cachegrind run
>> on each of the two different versions might show where
>> the issue is.
>
> Perhaps it negotiated different protocol versions or encryption
> settings?
Both are mounted with smb3.11, and no encryption setting.
I checked smb packets using tcpdump...

>
> Andrew Bartlett
>
> --
> Andrew Bartlett                       https://samba.org/~abartlet/
> Authentication Developer, Samba Team  https://samba.org
> Samba Developer, Catalyst IT
> https://catalyst.net.nz/services/samba
>
>
>
>

