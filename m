Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CD93FCF4E
	for <lists+samba-technical@lfdr.de>; Tue, 31 Aug 2021 23:50:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=pXUD4U1J+ORr2aJcawks0gvrd6jUhG/+mbBRpl27d6g=; b=KqSLP77UTm292Om+2KT2Kk9fqe
	wPpX9qHIT6eElWbR9E6oAYDbkNfDySkPk0HKSaWpqJTljH1UdcsFeTZwKpgssTigOWarxPNYDERbb
	wPSC4DSdwi9tcOU/zcaJipGM49Z5Nd73UPNS9FBf0N6MlR6IXgw+PkxzLeJwxDIsjr2NwZjKChCrp
	ry91ROxEi/4J0mgonERSccjQrYqkLZoMj8gzLRkuz4QsazV+FdcOoGho7Bi4P0BO6HnYeVVdyhbu7
	yoyycsWoubc0n5nHANYvi6ZREeJK7G+VKVc+VZ3p/RmNaqBZOG4kZ+w62XOK/mCHYkGiS3ahvQwz3
	51Duayzw==;
Received: from ip6-localhost ([::1]:64006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mLBeL-00AOqr-EG; Tue, 31 Aug 2021 21:50:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63822) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mLBeE-00AOqi-E9
 for samba-technical@lists.samba.org; Tue, 31 Aug 2021 21:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=pXUD4U1J+ORr2aJcawks0gvrd6jUhG/+mbBRpl27d6g=; b=ymHBHFU6kQJTwDj5x/KWI4A1lX
 X0CaIUuE3SjN97+zC769T9EVB/KL+w87ZqWHuQiHAjTURv2bEu8/csaI0qHZwnFgPOzbvfuqDyWFc
 hMW2SvI4Q8Px8wDJwkfHqzUohcEuwse00Y/XaIVM22p4cD9Y9w+pf7A39V02Z/2zNWB8BgL1rcAgz
 IurmiA0qucNFyPwyultZK/DWOw/u7i3ORSU8U5p0dNuM9vEPho/7Nd6TqyVsYBPVl5ihUldlN/vgs
 7saOj/UD6x8u4pNyBr5T4l4HJalkMXKu4IcDowHWKHG8F0GBWbgeXGUKzmfuZkp2K5JONgATvdbpv
 9UiQPgFXmHe0hrvi71tZeWpLhnD+KI6xgoMN3QcDRjPKUf6B9aLSJ71EgFhyGPrrcNSCtgP8owhcM
 I9ptR1eby1D0s2oYLo9s5CP+8QzSSysDec6h/bsa7EEPA+VvW0JzGstUfDiXTsOM/1QtWtrhzxdNJ
 zFV203gV2KyNBVjHZczH4r50;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mLBeC-003vsX-MS
 for samba-technical@lists.samba.org; Tue, 31 Aug 2021 21:50:24 +0000
Date: Tue, 31 Aug 2021 23:50:18 +0200
To: Samba Technical <samba-technical@lists.samba.org>
Subject: Re: [GIT PULL] new smb3 kernel server (ksmbd)
Message-ID: <20210831234757.7467527b@samba.org>
In-Reply-To: <163042809342.7406.683232852261811056.pr-tracker-bot@kernel.org>
References: <CAH2r5msoKV7qAgoKipa+QNDJ+xR83YGuz+he+GH9sPTSzBMLHA@mail.gmail.com>
 <163042809342.7406.683232852261811056.pr-tracker-bot@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 31 Aug 2021 16:41:33 +0000, pr-tracker-bot@kernel.org wrote:

> The pull request you sent on Sun, 29 Aug 2021 19:32:41 -0500:
> 
> > git://git.samba.org/ksmbd.git tags/5.15-rc-first-ksmbd-merge  
> 
> has been merged into torvalds/linux.git:
> https://git.kernel.org/torvalds/c/e24c567b7ecff1c8b6023a10d7f78256cef742c4

In case any one missed it, ksmbd is now queued in Linus' tree for 5.15.
Congratulations to everyone involved in this fantastic effort!

Cheers, David

