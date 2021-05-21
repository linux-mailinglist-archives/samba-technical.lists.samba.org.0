Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B5238CE82
	for <lists+samba-technical@lfdr.de>; Fri, 21 May 2021 22:03:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=YxH3gYWdq0flIGzE2eYNu8VGLI+f92DnrJB18UcmzUU=; b=RO4LILJP1choKAugQhyr40vIbs
	k7Hr2Ssi/HiQUwECmVh77w2X03SrxbhcaOwAHpPMi0VCUus6QxIj8Q31CmNfUxFv/9sxEwTcg7xW2
	1YqmWhRSjTkTlwENRHs1hON5gjatg7RDSMQv0tSz74/He1CE09wVwjYocYJ+diuCuX3SHAbw4tisq
	Mv8tQ/4sv+Kc4xGTRaqAxdPnuLMDrrtGScp44Ui1SWlQbgmU2c8hQdxsmVxLaN0dZIkiLiR1VRL4j
	7WtjUneze36CWFCl4fQflRladmw3yHZDrfB99p1DfL60zvruR4f5oQ84MGviE7UAqLGwyGCdDBvEd
	ah3sFG3w==;
Received: from ip6-localhost ([::1]:40766 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lkBLS-002zv8-Ur; Fri, 21 May 2021 20:02:07 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46446) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkBLN-002zuz-BR
 for samba-technical@lists.samba.org; Fri, 21 May 2021 20:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=YxH3gYWdq0flIGzE2eYNu8VGLI+f92DnrJB18UcmzUU=; b=ylKV9uUDFv3eyiRztZIWYTYt1l
 QlJ6zQfrg2Tt68DMzYt70RpyvyFT6UHAL3e53RWXeEmi7bEpq92RvXn+am7owCheGRbzBYApOJ4MJ
 NGw8HB7HVNr8ZTvuioBtgZMbPg4bzPjvpAj4QS3Cso+kxqq4uBeTC0uofO+RcTw3UoBFfQBcsXhSk
 dxTOOD3nnAdbOyIg3o8TeRc1kOyuT5AxrGsAbub3etUGXWK/XcWOuj1tSR3lgFv935flfOgacgL4Y
 1M/GdVSduBbJKgeEreCAs8nhK76WLKeogfv34K0EK5LIb1gWthHMOLlnXPnSFLJsy9Dg6qUH3u61K
 Mpm8UntR8+eMGjcIQBNek5uDqd73IyLEiw4z+1w4CY3P3KS2/WgCmVUyq8wTKziRnTZyzy9qhI7o+
 z3p9VRADr9FirrD/rA5L9YlhJ9xUlj4mvycveaZWCar33U8YzAL9Cn/3M3BsJy3nMj2I0yT1RTHyw
 dw7fH265qGg8oTlaW1iwXm4j;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lkBLM-0004tN-4h; Fri, 21 May 2021 20:02:00 +0000
Message-ID: <97b1240df9a3ec4b465a3e335037591dd803c029.camel@samba.org>
Subject: Re: Problem with AD membership in an AD with more the 100.000 group
 (possible regression in 4.12?)
To: "Dr." =?ISO-8859-1?Q?Hansj=F6rg?= Maurer <hansjoerg.maurer@itsd.de>, 
 samba-technical@lists.samba.org
Date: Sat, 22 May 2021 08:01:53 +1200
In-Reply-To: <644dd37c-1260-ccd4-f1ff-0bc32c7b3a64@itsd.de>
References: <d7b0ec24-3c59-1d74-9e93-616eebe6eb44@itsd.de>
 <5d5b4c230813b6bd6b3001fe14bfd3a9d8ca2b53.camel@samba.org>
 <9d2ed0c9-9e13-2848-29cb-aaf6354e33aa@itsd.de>
 <c4713dc0b0d746c834ec66c1ec793572c725b2d2.camel@samba.org>
 <2da32b9f-8ba0-c1ab-1748-831eeb727f0f@itsd.de>
 <1911c4eeee7df0fcf1f13d612da214094a9198c0.camel@samba.org>
 <b6fb9ef1-3cbf-e970-eb2e-9e6e395c65ae@itsd.de>
 <b83d52e7a5b846fd429811616f3b3c21d2f55480.camel@samba.org>
 <56d3287c51dc769806d8a4966b54e2a6e672d8b0.camel@samba.org>
 <fd178861288df9613902ecec24e52f6a2786cea9.camel@samba.org>
 <644dd37c-1260-ccd4-f1ff-0bc32c7b3a64@itsd.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2021-05-21 at 15:22 +0200, Dr. Hansjörg Maurer wrote:
> Am 21.05.21 um 11:31 schrieb Andrew Bartlett:
> > On Thu, 2021-05-20 at 23:29 +1200, Andrew Bartlett wrote:
> > 
> > Just be aware that this isn't a working patch (see the failed
> > pipeline).
> > 
> > I'm not sure if I'll be able to get this approach to work, sadly.
> > 
> > Andrew Bartlett
> > 
> Hi Andrew
> 
> strange ... I have been able to apply the patch to 4.14.4 with one 
> manual fix in
> librpc/wscript_build
> 
> and the patched and compiled 4.14.4 fixes our wbinfo -g problem
> 
> [root@c8-test01 ~]# wbinfo -g  | wc -l
> 128167

Awesome!  Sadly it breaks (at least) printing, because it generically
changes the NDR parsing in a way that is wrong. :-(

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


