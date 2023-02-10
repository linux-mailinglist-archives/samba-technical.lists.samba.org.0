Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 749F3692898
	for <lists+samba-technical@lfdr.de>; Fri, 10 Feb 2023 21:45:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=vblkJk5JW9Sn6Kfu8Q+gIzph4v+G06dnGDO+PJJTE5k=; b=x5X9Vif3HGuSBHxaYrQSdaHV2r
	wEVvrZsX3nF+NJAbRXs9Ny3YNJ7QO1FXR9BKlkWbUAfaeoBbjR7sEkxlGDoqJstZ5mBbCyUqiKX5b
	wOB+AGOAvFTc6tGSZwm1UxYg6zIFP2Pt9//Lei1+q39GhpYSJ1VgC50L1umHqM+AtalP552eW20eC
	nGqfd/fD2pIN4cn7O7MGVimkXVPGp/mSM9O0jQA6LIbx7Ty/K0tDbyBJqlpqvWW3r0Ci6tM4E+/iu
	oqr4qCmPd2TeK6VQyW5r6r8n9N9yCpAbKVRBfA94eUKumtdXioSdRm2SH8RoBUwT8lphUPP1fnkvk
	AmNhHBxA==;
Received: from ip6-localhost ([::1]:34066 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pQaH4-00BHc7-0G; Fri, 10 Feb 2023 20:45:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:58240) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pQaGx-00BHbJ-Mv
 for samba-technical@lists.samba.org; Fri, 10 Feb 2023 20:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=vblkJk5JW9Sn6Kfu8Q+gIzph4v+G06dnGDO+PJJTE5k=; b=ZByHmY6I/xqvq7jr5sles6DzFv
 X8E5rrfScXVNgEnb8mhtIqL6cUXo/yrZlB2tS/vtfsgnKSyeyOS8DKofKjNESgQO6NfDAqhSKyd9J
 iXrX510/06aCayJJKONL7emQ6lSqNgDpmtelnAHiNyMfsxx+8cKOPQsDEa6HdET1YERK/PKhMomcl
 GP95KfpeYTWn9gVC74Y1nvFxKvlFcA9u1Ip1+AjbNBo16pYbhNPHxwt1/KZKzhr/jT0k8EioFkcMb
 RCNLcPgj5/6P7WRXC7rw/ZcgFfaCae4QSwE2mny1bkz6Gn4igoywch9QS5pj3+m17Nic2iYwezNK0
 QDTh4TIZKm6TLpn8xkIr56+NpTkdk2R07P+ehd1SbpAiBsKLPiUNVHHFss+cNqIGyxIbtuKRpffWz
 B/MTbtDylzRkBWinHWdDtvw9ibgSIDIMAoPOL2pzUT80zHZ4HJbASTZzFFbOXZaFQ8n4mD2vrUGDh
 O7SDmlrp4tf1SHfYF0PWeJaJ;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pQaGv-00D4BD-Vr; Fri, 10 Feb 2023 20:45:30 +0000
Message-ID: <6858a9bd-a8aa-3eaa-979d-83e1743ce85e@samba.org>
Date: Fri, 10 Feb 2023 21:45:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: copy on write for splice() from file to pipe?
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>,
 David Howells <dhowells@redhat.com>
References: <0cfd9f02-dea7-90e2-e932-c8129b6013c7@samba.org>
 <CAHk-=wj8rthcQ9gQbvkMzeFt0iymq+CuOzmidx3Pm29Lg+W0gg@mail.gmail.com>
 <f6c6d42e-337a-bbab-0d36-cfcc915d26c6@samba.org>
 <CAHk-=widtNT9y-9uGMnAgyR0kzyo0XjTkExSMoGpbZgeU=+vng@mail.gmail.com>
 <CAHk-=whprvcY=KRh15uqtmVqR2rL-H1yN6RaswHiWPsGHDqsSQ@mail.gmail.com>
In-Reply-To: <CAHk-=whprvcY=KRh15uqtmVqR2rL-H1yN6RaswHiWPsGHDqsSQ@mail.gmail.com>
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
 Samba Technical <samba-technical@lists.samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 io-uring <io-uring@vger.kernel.org>, linux-crypto@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 09.02.23 um 20:48 schrieb Linus Torvalds via samba-technical:
> On Thu, Feb 9, 2023 at 11:36 AM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
>>
>> I guarantee that you will only slow things down with some odd async_memcpy.
> 
> Extended note: even if the copies themselves would then be done
> concurrently with other work (so "not faster, but more parallel"), the
> synchronization required at the end would then end up being costly
> enough to eat up any possible win. Plus  you'd still end up with a
> fundamental problem of "what if the data changes in the meantime".
> 
> And that's ignoring all the practical problems of actually starting
> the async copy, which traditionally requires virtual to physical
> translations (where "physical" is whatever the DMA address space is).
> 
> So I don't think there are any actual real cases of async memory copy
> engines being even _remotely_ better than memcpy outside of
> microcontrollers (and historical computers before caches - people may
> still remember things like the Amiga blitter fondly).
> 
> Again, the exception ends up being if you can actually use real DMA to
> not do a memory copy, but to transfer data directly to or from the
> device. That's in some way what 'splice()' is designed to allow you to
> do, but exactly by the pipe part ending up being the "conceptual
> buffer" for the zero-copy pages.
> 
> So this is exactly *why* splicing from a file all the way to the
> network will then show any file changes that have happened in between
> that "splice started" and "network card got the data". You're supposed
> to use splice only when you can guarantee the data stability (or,
> alternatively, when you simply don't care about the data stability,
> and getting the changed data is perfectly fine).

Ok, thanks for the explanation!

Looking at this patch from David Howells :
https://lore.kernel.org/linux-fsdevel/909202.1675959337@warthog.procyon.org.uk/
indicates that we don't have that problem with O_DIRECT as it operates
on dedicated pages (not part of the shared page cache). And these pages
might be filled via DMA (depending on the filesystem and block device).

Is my understanding correct?

Together with this patch:
https://lore.kernel.org/linux-fsdevel/20230209102954.528942-4-dhowells@redhat.com/

I guess it would be easy to pass a flag (maybe SPLICE_F_FORCE_COPY)
down to generic_file_splice_read() and let it create dedicated pages
and use memcpy() from the page cache to the dedicated pages.
This would mean one memcpy(), but it would allow the pipe to be used
for the splice() to the socket, tee(). This might be easier than
using pread() followed by vmsplice(SPLICE_F_GIFT).

The usage of SPLICE_F_GIFT is very confusing to me...
I found this example in libkcapi using the kernel crypto sockets:
https://github.com/smuellerDD/libkcapi/blob/master/lib/kcapi-kernel-if.c#L324
where it just passes SPLICE_F_GIFT together with an iovec passed from the
caller of the library.

To me it's not clear if the caller can still use it's buffers referenced by
the passed iovec...

metze



