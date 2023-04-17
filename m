Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAFB6E500B
	for <lists+samba-technical@lfdr.de>; Mon, 17 Apr 2023 20:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=4nMyXpxk8vDpsjHLEFkE01KT4GYN2TCJeovA6KbO9I0=; b=P/EBWeEm7Xyu3xCDC2ifsPMbAJ
	n49SU64BkZXVa5iH/+O5NQ6b3wqm1jdOldC/N1X8ukFoK//f767hFxltPewWyCmcbOHFwynZxi7kD
	jvru6xH5a3un2MgeP8HyGQpu3COiHt2BCPgLyTcJKVxi+p/OdNtofLmYngrRucJRP5pGS5qzORb/M
	2pFfWCFUK5/onse6LkCzCJitjYpYqVydC3a0YqkPnCTxj+uSOdTRDMTh8n6CC4rx1DmJzPYLw/knk
	p5KJUTfgFC3P0ItRz3Pc88FtCCgm8tHmRF7ufXAqJeODj7tCN7/UlVmBsabd1YOvhTTeb+QpcHk/W
	afj/eyww==;
Received: from ip6-localhost ([::1]:38488 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1poTQL-002MIA-HZ; Mon, 17 Apr 2023 18:17:57 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11272) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1poTQH-002MI1-Ad
 for samba-technical@lists.samba.org; Mon, 17 Apr 2023 18:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=4nMyXpxk8vDpsjHLEFkE01KT4GYN2TCJeovA6KbO9I0=; b=VUwpQs27lLHc4COKXXXyzZKM11
 XIsQ/t1VScRc2FI/Xb6mwgHte6MXX5KxdKzXeTZG4OFvjGTo/ugcMGbn5fIwm7QSu5HjKKsmKbJXb
 DMSoZoINZ+dVkbLQPRhg3MvtKTUa1X7hvGJRhTteVOv2iW+ULY93MERgYOS5DSy3i0cecmhUbos/y
 QNj3EmK3JHNEEqi5Vy943CPJlBV1KZl/fV6+htdcJhXT1yiDgpsJXz3A5fXiIMGsqOLv9sQcn9ToF
 3qt/lcnG6EN0e5QnCmZnBBhWp4MlQUvUt5eGYL+AyUSnCJ+ZBPL96ToTaqPtF2zTuTaaPBHI+Cnem
 VPQ7scNGeVfWn9ohueCsMUKoXQ3/ZBBuxz6DzfbeKVhgI/Oa/jQXJHVMAw06B4Gs2O9fNjaUV26sh
 EefhMApj5gKW7a3QFZIyZ346LOoeQh+Gl5o2aQa/Yg/Wn1/FzDceg5peou11KJnFZTOXe2Usmpq2z
 ONDxS9k2WHUDUuxd4/caGZkD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1poTQF-001gdK-T4; Mon, 17 Apr 2023 18:17:51 +0000
To: samba-technical@lists.samba.org
Subject: Re: talloc vs malloc speed
Date: Mon, 17 Apr 2023 20:17:50 +0200
Message-ID: <3165882.5fSG56mABF@magrathea>
In-Reply-To: <be27d4d7-673e-d1b3-6789-a2e41899ca7d@catalyst.net.nz>
References: <3161922.5fSG56mABF@magrathea>
 <be27d4d7-673e-d1b3-6789-a2e41899ca7d@catalyst.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: fweimer@redhat.com, Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sunday, 16 April 2023 04:16:20 CEST Douglas Bagnall via samba-technical 
wrote:
> On 15/04/23 06:11, Andreas Schneider via samba-technical wrote:
> > P.S. The talloc website states it is 4% slower than malloc. This was
> > probably a long long time ago ;-)
> 
> Ha. `man talloc` has almost the same sentence saying "10%".
> 
> I thought serious trouble with talloc performance has to do with the
> linked lists getting huge, making talloc_free or reparenting really slow.
> And I thought that this talloc-doing-talloc cost outweighs the
> talloc-as-malloc cost, which I guess is what is being measured here?

The talloc vs malloc test only does a talloc_strdup() in a loop. There are 
basically no childs involved and this cost doesn't show up here.

I think it would be tricky to use something like a red black tree.

> If that's the case (I have no evidence) then optimising talloc-as-malloc
> might not really help. OTOH, because talloc makes it easier to keep track
> of millions of little allocations, we do that often, so perhaps talloced
> code is *more* sensitive to the primitive alloc cost.

The thing is that that really simple testcase is already that slow. Getting 
rid of talloc_fill might help a tiny bit.

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



