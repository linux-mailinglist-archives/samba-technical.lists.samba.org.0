Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44474253603
	for <lists+samba-technical@lfdr.de>; Wed, 26 Aug 2020 19:32:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=2GWwBPQJYer1JPI6wOFkyXaOLPe5nfE9k5ru1lFbdJA=; b=wy0bgM8RKhhZyiJsA8u8g4ewog
	UIpEWBcHEASojr3NIc7jz4gH/SGGonioMxmIaIdQaz/h3kP+XuUg3mb0JC0hCv9iwJqJODMpwmvyJ
	uA4OIhhYEYVJWGCzx9kHfYGn5RsuiYULHrsidSdHeJugzC5pU+7pq73z5TliIl6gxEO+Fk2vh1ciW
	WUmG4dWNPUv+efoMm7ZCKXrCUpjYVPDubLAeNcOW866glDVgAn2lHlMZ2bR35gDdQelaHGmrw+xS3
	bLxf73gP5Bwx2jomRrFuRnxz4ogq75vYlptGTvnzk4IZKHlwQskRnVif+5f4td/x/AZ6+GP6Kc05j
	q46F6kRQ==;
Received: from localhost ([::1]:45564 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kAzHg-000mI7-Jr; Wed, 26 Aug 2020 17:32:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAzHb-000mHG-4X
 for samba-technical@lists.samba.org; Wed, 26 Aug 2020 17:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=2GWwBPQJYer1JPI6wOFkyXaOLPe5nfE9k5ru1lFbdJA=; b=P5/uHfitoyDzUvseSGd46JrCJH
 FBdWrQRGuonkc0Z1RxDCZD5avvdi1WVRtTPmjz6egg+qWKfUZQxwX8OZYVC1dApiCE1MYOWrEEW92
 v9DTwaPjigHVVD2YC16aunNNa+oGpZZ4kxNMJ4ArRqBWZdDdusWGyiyzjjc26jDF+9897kMAjRH9m
 uBrp/MvNZYya0tfqB+fCqwzZrZcc1dkBe0Jxean0KD3UyXr2rgZIdWTcvVqCbXy4SSBV/ctmLV6/E
 JbUJDohD0T/rDmw1DrlBjSsd8rVQyjLgukviaJ7gl4jHb/9tNEeAtb4H9yFP+sXG+OYj45L07XKpt
 ZXMkk+A+D3z1V4Ju7SluTS9ruDSZl1HEQhjKm1mMdlu0uO6OQcQuqTGwig1YAlQq/MNqdTka4Lu0n
 P9zs37DOaJOdrOHTmLV90jBYfdvrjOZXL/QsWkgRlkDTsqqqIYyD30DWdr7i+wcWRW7khUlVtk9QI
 VvcQ/GIzabqqDbVlnNt1TCyC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kAzHa-0004uz-3d; Wed, 26 Aug 2020 17:32:22 +0000
Date: Wed, 26 Aug 2020 10:32:16 -0700
To: Krishna Harathi <krishna.harathi@storagecraft.com>
Subject: Re: Directory Leasing feature in Samba smbd
Message-ID: <20200826173216.GC16382@jeremy-acer>
References: <20BEBF93-262E-4877-B659-AFA0BC9C932E@storagecraft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20BEBF93-262E-4877-B659-AFA0BC9C932E@storagecraft.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Aug 24, 2020 at 06:58:45PM +0000, Krishna Harathi via samba-technical wrote:
> A more dominant issue of lack of directory lease support in smbd surfaced while looking into UNC vs mapped drive performance.
> 
> As per Samba Wiki, this directory leasing feature is not planned anytime soon. Let me know otherwise.
> 
> I may be able to spend some time working on this feature, once I get a better idea of what it takes to implement.
> I have read the high-level notes at https://wiki.samba.org/index.php/Samba3/SMB2#Directory_Leases
> 
> I appreciate any comments on this topic at this time, mostly checking to see the forum's interest to chart out the next level of details.

Hi Krishna,

The best way to proceed on this is to add additional
smbtorture tests inside source4/torture/smb2/lease.c
that pass against a Windows server to explore the exact
behavior we'll need to reproduce to correctly implement
directory leases.

You can mark the additional tests as knownfail inside
a file in the selftest/knownfail.d/ directory.

Once we have a comprehensive set of tests we'll be
able to better evaluate what server changes we'll
need to start passing them.

Thanks a *LOT* for looking at this, it's much
appreciated !

Jeremy.

