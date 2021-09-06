Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA0D401AC7
	for <lists+samba-technical@lfdr.de>; Mon,  6 Sep 2021 13:50:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=jysWxg1d172HGoKudfgiBOJ7zyqEswwr/rPHzgniCbI=; b=wIAR63yFFU9Ea2t2ciwtQ1prck
	zH2g2ahmRxB/Sj5kX5f0gCLsSX8BPGwGWO8bw0uetNbZxP8g3I0HVLI9Op6ab/6Sg2u21Fv4AyByw
	WrKCh+hiHz4hBNk1DCZe+kS8hRzJyd1jk4cpkEILFzCSTKOUZXMzqEs8eUKh+D6BZ6ARglULAD0DC
	rCErF8fzGiDvp6gFhO9o3wWRJOAivbH6bgWn9LsqC/WuwRBFVigGIsEQFbqbcY/KE3MmKMxcVpmEK
	O6/Zdt+KD+01komlPp8zviYxoQa+LAhHGzMGBzTfxP0KnT26pl5TJ6eBLXtr5c/XuXIwehjkK0lS7
	MGowqXRQ==;
Received: from ip6-localhost ([::1]:35304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mND8T-00DT6G-1d; Mon, 06 Sep 2021 11:50:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20680) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mND8N-00DT67-Ob
 for samba-technical@lists.samba.org; Mon, 06 Sep 2021 11:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=jysWxg1d172HGoKudfgiBOJ7zyqEswwr/rPHzgniCbI=; b=bzqOtR7UIAcS8ozylQ2x3EvrRA
 zT2eAYOBVQ08P8J+MQ9IwDv2QXrBoz7fzk6cYr34PNiM7njYyZIEdP2ydVTMBgpoI2WvUa5eKN/ER
 i9Tf7ICBQS9JASbr43gHBGcdWHWc4bXPfYN51VmNj072teyIU0OfllR54EpHmUksC+4L+L5AzhZz7
 84axqRBewbUKop9n39sgriIWnieGyx9BQtlA1SyW5G4uK5n7xWsbeNQkANeEw2fLFS8yqvTVEQL6R
 ti4+YD2XYL8jy3AlSXI0KMKerBUsY6UBpWNFxPGCWj4Nt8m/jFo+M43OC54eb6GbF4PfXHy0Uv2KJ
 Y2KQjXdJ9VvumkCAmmNu/zJrKjmB+cevhrRi87x0F50+6wephVs1D1CbQqvfWuyezvRbrdWgpIVyX
 wfGdLNH2yO9fCSM7iNlmpVB21FjUfKpzVUaQoiPbmK1ZCEvd6YrUzu+GN04GrLPTGi9aDrv0Dqhv8
 RclD8EiHjb8liuqKPniskOr5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mND8M-004tWK-Op
 for samba-technical@lists.samba.org; Mon, 06 Sep 2021 11:49:54 +0000
Subject: Re: [Release Planning 4.15] Samba 4.15.0 delayed
To: samba-technical@lists.samba.org
References: <fffaffbf-f8aa-428b-6d48-91c7b53f0f37@samba.org>
Message-ID: <d01e3a71-b22b-bd6b-2e2a-b832077dd606@samba.org>
Date: Mon, 6 Sep 2021 13:49:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <fffaffbf-f8aa-428b-6d48-91c7b53f0f37@samba.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

some more important bug fixes popped up in the last days, so the release 
had to be delayed by one week again.

It's now scheduled for Wednesday, September 15.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
has been updated accordingly.


Best,
Jule


Am 01.09.21 um 11:53 schrieb Karolin Seeger via samba-technical:
> Hi,
>
> unfortunately, two (potential) showstopper popped up this week, so 
> Samba 4.15.0 had to be delayed.
>
> It's now scheduled for Wednesday, September 8, but there is still one 
> regression under discussion (bug #14803).
>
> https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.15
> has been updated accordingly.
>
> Cheers,
> Karolin
>


