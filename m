Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FD340A22C
	for <lists+samba-technical@lfdr.de>; Tue, 14 Sep 2021 02:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=N59nQWo3EUZVLXsrjAdK0HrX5NxlSs+7d7PxqE4KVL4=; b=zwjOLtts+Gzr0hjKfa4oIYb3tC
	LvFx0K8REeUeIgE5o5RqpmOlzfwBzbWmsnnFAygFcbT05DmHtpxEq3DaxuCbeJMqYB8C0xKvGUleu
	V+Xa9UcEQe1T3wxl7nWe6e+8mGkb49qUU1VzMbapjjZM2rOJ9PkXx6WkU7iXP8p+31livmBlkuPPx
	UTYusRiilMwv4QKKL8n1MbUA0wJoP3/4fewT1DzQY2SLDH6kWMH0a6zOToSlVqJO8gsKIXu95QsX1
	oLAYpT5djor6QrucWC2H/YnxA+3+FjhQNoCytaL60wbzAb4ypsJT/DU2bUzDI5I7SiCii9CSsAEv3
	k5k9ByqA==;
Received: from ip6-localhost ([::1]:54718 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mPwb2-00EynB-Ok; Tue, 14 Sep 2021 00:46:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25490) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mPwax-00Eyn2-Nb
 for samba-technical@lists.samba.org; Tue, 14 Sep 2021 00:46:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=N59nQWo3EUZVLXsrjAdK0HrX5NxlSs+7d7PxqE4KVL4=; b=OutIn/HGVLDZqQueUK1+ls2wKE
 MIeoZdI+VUu33s224dTt+jJ/Y2q6U9Dhyfx+CLpWMFKhiMOiDf1E46Rx34kPyPQDkudQ+esaEmPQ0
 Lu9yK6Zv7AYe6zmII557VbzgjPJbzI/MIH38Mv9bFqZKrEF/DLXoCQwTrt+kM/Ra0yx1uQ5eXzFwV
 rtCA/8m7zevZYyR8TEvDGCpzDU+v3Sg2ov1PIncfCVEWdDq5I7OStfyJEen5O5yKnWJ6C7ArS4c9b
 5+IM7B9R98n1H222bCGLE/vyL4ttdAcs6lxD+WBXghMmGpaCm1/iZY1yxbDW3drNcdK6p1UY5ziZo
 /S4WGLEdTqv/tv37KcfHxMabSPHgrld5dRD5qQ2gMm1c2kxy8qrYhyTIt1uR1CA+5ufJRo3U3Q1FM
 clMPH4ykXGH6etTm7AJ+XO5zezhA3BYt5ft8XtPNzLsC5MyFQYJPbgaWhqobvZx7yk+HjmGBiTuoi
 mx6j5XK0wSMJGsflSLxapene;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mPwav-0062DN-Bd; Tue, 14 Sep 2021 00:46:42 +0000
Date: Mon, 13 Sep 2021 17:46:38 -0700
To: Christof Schmitt <cs@samba.org>
Subject: Re: Linux kernel LOCK_MAND deprecation
Message-ID: <YT/w7hv4WIH9gwK5@jeremy-acer>
References: <ac56564760f592b3a6fe477b8ce0e65a0759c988.camel@samba.org>
 <YT+NIpgJUq6GX54f@jeremy-acer> <20210913181145.GA13476@samba.org>
 <246ff815-8964-036a-7911-10d59c4e1ed6@samba.org>
 <20210913195901.GA28442@samba.org>
 <16e822776813310d1635efa74be2455d329308a6.camel@samba.org>
 <20210914000750.GA80819@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210914000750.GA80819@samba.org>
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
Cc: Jeff Layton <jlayton@samba.org>, vl@samba.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Sep 13, 2021 at 05:07:50PM -0700, Christof Schmitt wrote:
>
>https://gitlab.com/samba-team/samba/-/merge_requests/2170
>removes the code and does some minor cleanups in related codepath.
>
>Jeremy, could you take a look? Should we keep the "kernel share modes"
>config option? Or just remove it?

I think we need to keep it, as on "normal" VFS backends
we need a way to turn it off. I'll comment more on the MR:
https://gitlab.com/samba-team/samba/-/merge_requests/2170

