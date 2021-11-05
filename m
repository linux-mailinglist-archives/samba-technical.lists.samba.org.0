Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id F39F544680E
	for <lists+samba-technical@lfdr.de>; Fri,  5 Nov 2021 18:46:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=y3o0zDhH1O/b9xZAMpLfb03mHQRu+Pe89KFD0yFpchc=; b=1eDULvcNEzuJHY51mRqoSUVHKP
	VXN00M3ftYo3+PxsHC5n41xY8cCNuCbW4SzAubSpiJj7mNQX98E/Z4EMKnAEG2LK/Hd3fque/o8ce
	Yr3cU3EEzN0+zSSUhRGqkJu60fMh1VJn/9M7+HDgOr2MCI00+Uqh2i5822T1lplXFeAc/AR14/TIy
	K3JB9UPBO1MQx2dZ85uGnIVmoL4PqaD5d94+CS0XbjC38OwMirIV+7URdFp36Ia3zv79FjkNbBZgO
	MR2amOqP5sEKwZ63sH3LbueY7YOVPqbv03dgaLPNoFNKfrxRKODxsRRLkPemrAJ+qzLDK5whC6FFL
	XciXLoZg==;
Received: from ip6-localhost ([::1]:26814 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mj3Hs-008O4M-1h; Fri, 05 Nov 2021 17:46:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57594) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mj3Hj-008O3o-7L; Fri, 05 Nov 2021 17:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=y3o0zDhH1O/b9xZAMpLfb03mHQRu+Pe89KFD0yFpchc=; b=HQcVEmsY8dnwZwoGzRYly4xyco
 78PjsWf/65AoFTq8TRz4Sr/c8h6F34jX5gJvrGfx4VcwO733Vx/p1S0krxrMQ2UcIA1Ymd/EatJmd
 JfI8SDyUr29rsn3VDyryBDB5xXBdIxgzmQL+YvTWjobDpjo59RNtER60SWyIwbPsVQgEi4Gcw5oSI
 5h0HLOUvKFUT+dKwNXv/h4kV0oqdpxTqR8GDG++PstEHb3OQ74jWKJzu0VudyzlxXJJa81/1VuI5I
 n5/5M/HJrkET7yRh+ZL4haylK3sBlRDETOdYoZ+5UuyYKghE+VkuSo3D+8YwDRY15TvQdPa8Wuj7X
 KHzNnC9IbkjGdIMNqrVZJjk8G60ytJ2mvlVNb00PUVErZrtcO8uyX6fMS9LbsyApBRJFVC+iTYAg+
 Qtl777mb3C5GNURWHpb3JmNF6YbCmXXA92BTXCJ9IwWIpe7ujWA2JJubrLGMkXNePyaI5u2i0/Vmf
 biHQYr3Sz82hOLkGKEcHflbL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mj3Hi-005Ptj-3M; Fri, 05 Nov 2021 17:45:50 +0000
Date: Fri, 5 Nov 2021 10:45:47 -0700
To: samba@lists.samba.org, samba-technical@lists.samba.org
Subject: Storage Developer Conference 2021 Samba Talks available.
Message-ID: <YYVty5SVXZPXNkVo@jeremy-acer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On youtube !

Ralph on "The New Samba VFS:

https://www.youtube.com/watch?v=D9EZO3gkT9U&list=PLH_ag5Km-YUbveQ0cD-JD8xP0F-1R98UF&index=40

Metze on "Samba Multi-Channel/io_uring Status Update":

https://www.youtube.com/watch?v=fnA4imgBsUo&list=PLH_ag5Km-YUbveQ0cD-JD8xP0F-1R98UF&index=56

Both great talks, enjoy !

If I find more Samba talks I'll post them :-).

Jeremy.

