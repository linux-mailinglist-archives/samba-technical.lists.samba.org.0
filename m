Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 660923314F5
	for <lists+samba-technical@lfdr.de>; Mon,  8 Mar 2021 18:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=Jj9LtsibdVq5uFIS8T9ISSMT41Gkh6g7sLgBW6EqcYc=; b=jsSClLUrXTmFDKi+B8EUNaM4Qh
	WdPffeGevK6vuW/BW3SSVHyehXq9W0SnMszMH4792pwZyBcBz8wDI89l9hTA4ewqFLOhuvfDL12JC
	r3V7sK9GCCbRl2WHPGfz7kou8tZNzVyjCC1OKPk5rR6Fn5efYuMG+n007E7ysSpCm/m050Jj1KMtz
	zmnor5pbe8DFGC5+9tLntMRHivbnIe0g+lZYTwePmqxPLTNGVb+3Pn4LDZqVXWchRTHhjTHkNUYW1
	3tP2WG1ztN8BQzkEGCCR1b2dlb4uoX2ghg2yQ9tYJH4AZ0OVEEtDIGrgFF+kbLl5uvqL/QnfhJ1P9
	xvDIUBfg==;
Received: from ip6-localhost ([::1]:45840 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJJms-004WDB-40; Mon, 08 Mar 2021 17:35:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:17844) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJJmg-004WD4-Ky
 for samba-technical@lists.samba.org; Mon, 08 Mar 2021 17:35:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=Jj9LtsibdVq5uFIS8T9ISSMT41Gkh6g7sLgBW6EqcYc=; b=fC/vG838EaaWR99RST/Fyet2PT
 EYvgFqGggCgIb17IMDQRaKBCYnPsIIc1Xt6byKvQzoYO9m6royhlD8d1Pjd1YuUhZ6xAMfTDGxG1a
 D+fPx79cAie65JxDY5MUI1/FSJ6Oeojh1R3JxCjwGeoJSpo6A7pu5ZzY7e5g6ludM5K/EDRY1LyFd
 6b06xhPAa9RmS95dCASyk7lzZDFVpYAsTWd/s/5QP8uWjR7+wD9mDEqLi8vb55OCZ6UD0P6+WOAYH
 HH41JrHwJyVuFs2/Zf/fCj0qLCtppUjQUux/nzFgeA4Bp7EmTpWC5RNEX5Um2V6HoEZxhO8OZ7+4H
 OCNs1oAgzlS3qikN/iYPvcW0kCvxZsvPCJYSUpIXEjj/lpFY81vacZxp8oQoCif0V8Qb7AvOqqKSp
 khFJpjjrt2y3t9fIAXhS0HlxUXobz7yDC+25degWHpVak7QgGxuXt3VCcUhGt+bgzQqFA1ivQn4Nj
 DnwyXoXcO8jVBRoQbDWkh9in;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lJJme-0003Ga-KJ; Mon, 08 Mar 2021 17:35:09 +0000
Message-ID: <64ca5887ab2f5751bd84577b10221f8f664a44f0.camel@samba.org>
Subject: Re: Commit 996560191ac6bd603901dcd6c0de5d239e019ef4 causes strange
 regression
To: Martin Schwenke <martin@meltin.net>
Date: Tue, 09 Mar 2021 06:35:04 +1300
In-Reply-To: <20210308204316.50f1c485@martins.ozlabs.org>
References: <20210308123939.56c5db74@martins.ozlabs.org>
 <b6478095e3ece98b9cdbf1c7579dc1041d1fe4ee.camel@samba.org>
 <20210308204316.50f1c485@martins.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: =?ISO-8859-1?Q?Bj=F6rn?= Jacke <bj@sernet.de>,
 Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2021-03-08 at 20:43 +1100, Martin Schwenke via samba-technical
wrote:
> 
> So the problem is that directories for recursive dependencies aren't
> 
> being processed properly.  Not sure why that commit changed this
> 
> behaviour...

The difference is the LINKFAGS vs EXTRA_LDFLAGS, which get processed at
different points.

Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions


