Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F9269277A
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 20:55:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=wB8iUoyhTPPw8oIGfgHrdWKWpi/z3O0LRA1cmDT3sZo=; b=m94kviKo1hdR0/x7Hb57qtlREa
	E96fsab+1cpENCnGu7rNnoL32PNHu2sTDaz5glcIHyvrqIrEJbXqu0cA9IqpOgomVZj9rzOOz4yBL
	YfhtburBhjsrMoVxIuWAe5UWIaImDvbXIZ3XwJ8zVG4dZndaxKB10IV0cZmT0drrOjUaeEYVNplTR
	f7l/lFioiezUDEukXfQXtgFrv9M7rrIYDmTG+YEdJ1CP1Vz+OoNkkf4jKpP+ytfu+Wm0c/0j1035V
	goVvDkoiuWwvzseRbwMPcmBTVT9acSiLomSwYWiadq/+1vsYnuswiuJLYd3mAe2i4l+6CmeKWCDl6
	VlLhOUzg==;
Received: from ip6-localhost ([::1]:44092 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQZTw-00BCQJ-VW; Fri, 10 Feb 2023 19:54:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60298) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQZTq-00BCQA-Ui
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 19:54:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=wB8iUoyhTPPw8oIGfgHrdWKWpi/z3O0LRA1cmDT3sZo=; b=kQ7wtexyyluIKMpJXEYni4zogw
 Gl052DWbYm6IHhH7ViW6onVe8MYr6F+LQe3xtv4K6dwve6EQOuKcSTBHCzYsGaDwtOeUK5QBm87Co
 RPyDA6DgflNAyXWUF/B1fIvBufxjdkG5ZGdUvKcOAcn0vMUVK+k+WFVljCfUSPdqkfkrxMGJ0JyJI
 Lg1/GSCbF3gsnK4v9OTqvsWIrfiMBFX1IpuStcFZivHg7KOOlZXs92ydH68VIUIH6vlFbT+P9k+wD
 EZACJFHjP639uSdqZb6BHTXtWiZCQ7iflJ6lmWfzhJGJGyygGrGil7X8P6u4HgtvxeB/3b9nEN8zs
 xABsYnIJQu7OCwXHGz5dTqUQ+A3rcpgHh8rgb5aN8auUeN6/ZS1TItFwQzZPSnItiej6tkPWlctLx
 PgIAEMzVjI0OOZKXINCMFKYM6XAIV/K+QWOsAKyD5XRvvfg7iSJO6ymfXBtXTqQ9Q1sQXmYnT3CWo
 MwFNWVSfcA3xbZCa5ecs880Y;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pQZTo-00D3dc-HN; Fri, 10 Feb 2023 19:54:44 +0000
Message-ID: <e83b7763-daa7-af7f-ae4f-2886598ad9b0@samba.org>
Date: Fri, 10 Feb 2023 20:54:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Jeremy Allison <jra@samba.org>
References: <20230210021603.GA2825702@dread.disaster.area>
 <20230210040626.GB2825702@dread.disaster.area>
 <Y+XLuYh+kC+4wTRi@casper.infradead.org>
 <20230210065747.GD2825702@dread.disaster.area>
 <CALCETrWjJisipSJA7tPu+h6B2gs3m+g0yPhZ4z+Atod+WOMkZg@mail.gmail.com>
 <CAHk-=wj66F6CdJUAAjqigXMBy7gHquFMzPNAwKCgkrb2mF6U7w@mail.gmail.com>
 <CALCETrU-9Wcb_zCsVWr24V=uCA0+c6x359UkJBOBgkbq+UHAMA@mail.gmail.com>
 <CAHk-=wjQZWMeQ9OgXDNepf+TLijqj0Lm0dXWwWzDcbz6o7yy_g@mail.gmail.com>
 <CALCETrWuRHWh5XFn8M8qx5z0FXAGHH=ysb+c6J+cqbYyTAHvhw@mail.gmail.com>
 <CAHk-=wjuXvF1cA=gJod=-6k4ypbEmOczFFDKriUpOVKy9dTJWQ@mail.gmail.com>
 <Y+aat8sggTtgff+A@jeremy-acer>
 <CAHk-=wgztjawo+nPjnJJdOe8rHcTYznD6u34TBzdstuTjpotbg@mail.gmail.com>
In-Reply-To: <CAHk-=wgztjawo+nPjnJJdOe8rHcTYznD6u34TBzdstuTjpotbg@mail.gmail.com>
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
 Andy Lutomirski <luto@kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Samba Technical <samba-technical@lists.samba.org>,
 io-uring <io-uring@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 10.02.23 um 20:42 schrieb Linus Torvalds:
> On Fri, Feb 10, 2023 at 11:27 AM Jeremy Allison <jra@samba.org> wrote:
>>
>> 1). Client opens file with a lease. Hurrah, we think we can use splice() !
>> 2). Client writes into file.
>> 3). Client calls SMB_FLUSH to ensure data is on disk.
>> 4). Client reads the data just wrtten to ensure it's good.
>> 5). Client overwrites the previously written data.
>>
>> Now when client issues (4), the read request, if we
>> zero-copy using splice() - I don't think theres a way
>> we get notified when the data has finally left the
>> system and the mapped splice memory in the buffer cache
>> is safe to overwrite by the write (5).
> 
> Well, but we know that either:
> 
>   (a) the client has already gotten the read reply, and does the write
> afterwards. So (4) has already not just left the network stack, but
> actually made it all the way to the client.
> 
> OR
> 
>   (b) (4) and (5) clearly aren't ordered on the client side (ie your
> "client" is not one single thread, and did an independent read and
> overlapping write), and the client can't rely on one happening before
> the other _anyway_.
>
> So if it's (b), then you might as well do the write first, because
> there's simply no ordering between the two.  If you have a concurrent
> read and a concurrent write to the same file, the read result is going
> to be random anyway.

I guess that's true, most clients won't have a problem.

However in theory it's possible that client uses a feature
called compounding, which means two requests are batched on the
way to the server they are processed sequentially and the responses
are batched on the way back again.

But we already have detection for that and the existing code also avoids
sendfile() in that case.

metze

