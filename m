Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B2712825162
	for <lists+samba-technical@lfdr.de>; Fri,  5 Jan 2024 11:00:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RjGmijxcsbrG9Vb7GmVvaQYXaZLzedozYzWz5ySxSb4=; b=J/AUSAgNJD9Tnxfo+lyAx0bPIw
	yC32LjcR7vStKUrrSMo4RvgF2EB1kfxPseE7yVfhttUbQByP1+DTjGjv5/0HENZVwuvUIkH7VHKBU
	FWfyd283HsbiJQQiHjKBrMCo8u1AsFcXrLQ1Xkt3zJ8m4mXs6/8j0UgjXVbDp/V6r/NPunFJHxdzV
	tetAGXaYwL8W1sEip/1qVQuSQELTUrfCYEKJeKc3XV0fyxcVXXc9hhX/0q65tsQ1Qb+WMppUvjYMX
	mrxoVQ04mY6pJCE1YS64ceWH+GvwJAbKaVFWp7sWSoiDuChOWWJeTHKnStlE+MhP/vmz+oDDNNNKk
	Np5VcbGA==;
Received: from ip6-localhost ([::1]:38836 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLh04-002T28-5P; Fri, 05 Jan 2024 10:00:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:29608) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLgzz-002T1y-IK
 for samba-technical@lists.samba.org; Fri, 05 Jan 2024 10:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=RjGmijxcsbrG9Vb7GmVvaQYXaZLzedozYzWz5ySxSb4=; b=dZ0xZuk9BaG0KfylYGsWyjBIDk
 Rf7HjAnY4Hj0zqI80hKSmHaSFbZjCZl0VyYH9kLk7CcX1PdvbKOxtRllsSl+oiBWpyW2zTKu096Mx
 E4fdrP3kbuwQCNo9LJK8ABmlXNOlWWwKABuzZ02RF3VhIbx0LO5DSgf6F/MpBAC1bHLe0oAO8jaVL
 qODu8AR1h+wa+Fa6mKYBr71FczAncK4VXQEpT7yhbVuUBoVN+yaFMPttBzZJFZweB0ilNPieOo+Ww
 MRH/KbWq7YddxXSWT0gi6zR58zDOoX7lHcptNBvdXjLaGLLwAcKjLSjPKf6dt9uqRj/FLQQESQtAu
 PuJfw3k84FNpuFLpqnKqAcVAW9r4mX4P3GK+rJQOm+uO09U0VdIJ02iGJPnUHN5h1mk175AeK9SSN
 uYNcZy5ACWOWJtmw5JmizWn8wE7UIKyt7Z5zOSn2hjpvjIRN/Ib25eNOMKfHJRNxvE0t4LbWcmnzq
 2U8TaRW4TQknHMCTQY5CVGI5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLgzu-006aas-0d; Fri, 05 Jan 2024 10:00:14 +0000
Message-ID: <242e196c-dc38-49d2-a213-e703c3b4e647@samba.org>
Date: Fri, 5 Jan 2024 11:00:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] smb: client: retry compound request without reusing
 lease
Content-Language: en-US, de-DE
To: Shyam Prasad N <nspmangalore@gmail.com>, Tom Talpey <tom@talpey.com>
References: <20231229143521.44880-1-meetakshisetiyaoss@gmail.com>
 <20231229143521.44880-2-meetakshisetiyaoss@gmail.com>
 <7e61ce96ef41bdaf26ac765eda224381@manguebit.com>
 <CAFTVevWC-6S-fbDupfUugEOh_gP-1xrNuZpD15Of9zW5G9BuDQ@mail.gmail.com>
 <c618ab330758fcba46f4a0a6e4158414@manguebit.com>
 <62eb08fb-b27f-4c95-ab29-ac838f24d70f@talpey.com>
 <CANT5p=qqUbqbedW+ccdSQz2q1N-NNA-kqw4y8xSrfdOdbjAyjg@mail.gmail.com>
In-Reply-To: <CANT5p=qqUbqbedW+ccdSQz2q1N-NNA-kqw4y8xSrfdOdbjAyjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Paulo Alcantara <pc@manguebit.com>,
 Meetakshi Setiya <meetakshisetiyaoss@gmail.com>, sprasad@microsoft.com,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, sfrench@samba.org,
 Meetakshi Setiya <msetiya@microsoft.com>, bharathsm.hsk@gmail.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 05.01.24 um 10:39 schrieb Shyam Prasad N via samba-technical:
> On Fri, Jan 5, 2024 at 2:39 AM Tom Talpey <tom@talpey.com> wrote:
>>
>> On 1/3/2024 9:37 AM, Paulo Alcantara wrote:
>>> Meetakshi Setiya <meetakshisetiyaoss@gmail.com> writes:
>>>
>>>> As per the discussion with Tom on the previous version of the changes, I
>>>> conferred with Shyam and Steve about possible workarounds and this seemed like a
>>>> choice which did the job without much perf drawbacks and code changes. One
>>>> highlighted difference between the two could be that in the previous
>>>> version, lease
>>>> would not be reused for any file with hardlinks at all, even though the inode
>>>> may hold the correct lease for that particular file. The current changes
>>>> would take care of this by sending the lease at least once, irrespective of the
>>>> number of hardlinks.
>>>
>>> Thanks for the explanation.  However, the code change size is no excuse
>>> for providing workarounds rather than the actual fix.
>>
>> I have to agree. And it really isn't much of a workaround either.
>>
> 
> The original problem, i.e. compound operations like
> unlink/rename/setsize not sending a lease key is very prevalent on the
> field.
> Unfortunately, fixing that exposed this problem with hard links.
> So Steve suggested getting this fix to a shape where it's fixing the
> original problem, even if it means that it does not fix it for the
> case of where there are open handles to multiple hard links to the
> same file.
> Only thing we need to be careful of is that it does not make things
> worse for other workloads.
> 
>>> A possible way to handle such case would be keeping a list of
>>> pathname:lease_key pairs inside the inode, so in smb2_compound_op() you
>>> could look up the lease key by using @dentry.  I'm not sure if there's a
>>> better way to handle it as I haven't looked into it further.
>>
> 
> This seems like a reasonable change to make. That will make sure that
> we stick to what the protocol recommends.
> I'm not sure that this change will be a simple one. There could be
> several places where we make an assumption that the lease is
> associated with an inode, and not a link.
> 
> And I'm not yet fully convinced that the spec itself is doing the
> right thing by tying the lease with the link, rather than the file.
> Shouldn't the lease protect the data of the file, and not the link
> itself? If opening two links to the same file with two different lease
> keys end up breaking each other's leases, what's the point?

I guess the reason for making the lease key per path on
the client is that the client can't know about possible hardlinks
before opening the file, but that open wants to use a leasekey...
Or a "stat" open that won't any lease needs to be done first,
which doubles the roundtrip for every open.

And hard links are not that common...

Maybe choosing und using a new leasekey would be the
way to start with and when a hardlink is detected
the open on the hardlink is closed again and retried
with the former lease key, which would also upgrade it again.

But sharing the handle lease for two pathnames seems wrong,
as the idea of the handle lease is to cache the patchname on the client.

While sharing the RW lease between two hardlinks would be desired.

metze

