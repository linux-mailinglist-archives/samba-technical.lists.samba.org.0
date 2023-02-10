Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CC69253B
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 19:20:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=PtdWmRFylJvBmX2IAcm65PdjtLIX5BPy4K+OpONMbJI=; b=3i9CeNgTjWmEr5TibnJ9tmA4m+
	80ofAYqW2igPtcgtw/gnMoWZXd1CZ+OhUGQVFjLtEBE8VTORRz4NjcMQqcjCuqLbi8lnwMmvzKmuv
	Z/FlBde48vkbLaJ7H51zG0m1pIEH7MZT6+BlCLW0aDn/wP1AeS9hFqTMkURiad4cJPVI3SGHZ8KCE
	ZyO6tUMFFoRD1LG+et6wsVkWkC0xk7OtyvpD/uH+wJZR4kXzeC6Nvm++M3aaKKzksQPYjVyL7al9r
	Ll7uyU/Z/AGRiqQ8dVJyRHBDsw/WZ9uBa85kEZTmvuibAwp6CkjqnLUfYrjkMZvRtjYJOB1YOvYV/
	ZeTk1d5A==;
Received: from ip6-localhost ([::1]:39792 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQXzw-00B4jH-3e; Fri, 10 Feb 2023 18:19:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61626) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQXzr-00B4j8-6w
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 18:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=PtdWmRFylJvBmX2IAcm65PdjtLIX5BPy4K+OpONMbJI=; b=2AT85G2ey0JjUTr9HJI84ayqma
 4XZmHUCPZg3Fl2G+wtQB+Icbc6Jt2jaZ3sLoRS2b5w4Zl1sGz9YxmXnMDTyq+dIUq/TjI8H/xTIVE
 Sg6czi6ZZNv5uqjyghLWMGc5kA/3DS1lu8szeIFtPyOZTWFYJdfOH5HZ0aHQf2BSQh1L7Es9UF4rK
 Rhu1HCt8YaBXwGz1UVGjotJicaZXgiPb+9Gv21BQcvX73U7I0xe5RGKzI/rsiPgcnVOeuqpIh3FZE
 1XggXKiOnmf02qVQ41UJSoJqu43WulRNZbPuUt/C0U69EVz+hFDeNaOKEQx6nmjz+DAA6a9s7SE2U
 yK7KaKXf8Ahgv5Rx0r8MR5pxHTFAMFtOE0wyQCcAlwROCAjK/Swx4nGMbJpxyOSjuBKdoQzoR/N1q
 an6gQJbeDcUCp/lBRzvcHBW/iQCN8XxugIC3v79XOEU1OeAnQS3VgZgIVXS+4wyvvdMHGSwgFrmBD
 +zOLdhDh4PI49Jil5d5y08HQ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pQXzo-00D2jz-UF; Fri, 10 Feb 2023 18:19:41 +0000
Date: Fri, 10 Feb 2023 10:19:36 -0800
To: Andy Lutomirski <luto@kernel.org>
Subject: Re: copy on write for splice() from file to pipe?
Message-ID: <Y+aKuC1PuvX4STEI@jeremy-acer>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
 <20230210065747.GD2825702@dread.disaster.area>
 <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
 <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
 <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Jens Axboe <axboe@kernel.dk>,
 Linux API Mailing List <linux-api@vger.kernel.org>,
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

On Fri, Feb 10, 2023 at 09:57:20AM -0800, Andy Lutomirski via samba-technical wrote:
>
>(And if Samba needs to make sure that future writes don't change the
>outgoing data even two seconds later when the data has been sent but
>not acked, then maybe a fancy API could be added to help, or maybe
>Samba shouldn't be using zero copy IO in the first place!)

Samba doesn't need any of this. The simplest thing to do is
to restrict splice-based zero-copy IO to files leased by
a single client, where exclusive access to changes is controled
by the client redirector.

