Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5356236B1CD
	for <lists+samba-technical@lfdr.de>; Mon, 26 Apr 2021 12:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=I3t/Ym7skUJshTQaQZByF8IOhgj6uVxI/BtZ7/dntCQ=; b=pqIXjPSxVvU0HeQOWYwhZkkl1J
	QLKpTziHPf+538rQI4OgPd8EFsyqFiYXPFEqAjdtu93CtS7H2NlWO9QjHEZnKC6gGqYiyic8V2004
	xrmqnpmbTVBx19lvWTUmNX+HZbEZjqxdgaL7KayhAKLSqWMIfFI/Qz0MG3c2CB4JTenwzIRHdJnEf
	KoRYv76cvwGmB5Mc0vUw7pxTGxjLR5joY7v4426r2V1bDDgwlr/gyDhNEMjaoR69zXXjRY/tDzDuq
	9bdNaqFB6eGUrqMpvCQxUKGZejdpaqasv7v12C6y+tGLLqWgo68t43dDnalIidCXOmNlVlSSJOH8v
	2JE3Dyjg==;
Received: from ip6-localhost ([::1]:50394 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1layjV-00CTDf-9m; Mon, 26 Apr 2021 10:44:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56164) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1layjL-00CTDY-42
 for samba-technical@lists.samba.org; Mon, 26 Apr 2021 10:44:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=I3t/Ym7skUJshTQaQZByF8IOhgj6uVxI/BtZ7/dntCQ=; b=xDRYo/GbkILBiXO0Dx9HRaGqrI
 BiPvLltxDMxZqPtHRYzQyN1WvZiYL6XN0lVWicB5iUocFp5wsvHFZXzBK5SJltFnq65Y1iz4PuU2g
 IBbnles13dk4R0VwYZ3Ua8FCuElv455n4afQrVbmBIJL+hNQxVM79H5q95WdofAF53sU+7RGtALj8
 o4FWx1V315BIFgIjEkbSfzohe2SpaH2cP2uq20w03z4BlH6VfRAO6t2OAe0+rHtsYmH9IwzHQGPdm
 Enu9nSZuBDqSZCR6tZSVnS0ZJoyFXlVlCN2MtKao7gt37aJgUolDcBY/RHTet6Jta1jhng77gBHl3
 cFiML9UImqtcT1/XcyYgrn6M6CodkHL/asDJBiBkWzLiQI9xqZZgrmj0hx3vlSrP10ourND3JzWCU
 OyRPii3qVlIjJGZbDtl9qtydvCacsC2MrSiNSoQOak3tQXshICevaa464J/6LkGg7HOo03W7ls/yb
 z8Drs3IZn6gkkMBFFV6gAi5W;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1layjK-0006Cn-3G; Mon, 26 Apr 2021 10:44:42 +0000
Date: Mon, 26 Apr 2021 13:44:40 +0300
To: Rowland penny <rpenny@samba.org>
Subject: Re: Ubuntu's ADSys
Message-ID: <YIaZmO3WleOfenUn@pinega.vda.li>
References: <cb13856c-400b-7670-03d3-4db23248baca@catalyst.net.nz>
 <a9e82907-faef-ade9-910c-6578987c5d72@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9e82907-faef-ade9-910c-6578987c5d72@samba.org>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ma, 26 huhti 2021, Rowland penny via samba-technical wrote:
> On 26/04/2021 11:27, Douglas Bagnall via samba-technical wrote:
> > I noticed that Ubuntu 21.04 was announced with "native Microsoft Active
> > Directory integration":
> > 
> > https://ubuntu.com/blog/ubuntu-21-04-is-here
> > 
> > It looks like this is based on a project called "ADSys" (GPLv3, written in
> > Go), that works as a GPO client.
> > 
> > https://github.com/ubuntu/adsys
> > 
> > They use Samba in their tests, as far as I can tell.
> > 
> > 
> > Douglas
> > 
> > 
> 
> Well, if they did use Samba, which version of Samba ? I ask because I tried
> 21.04 in a VM against my Samba AD domain and it didn't work. No matter what
> permutation of username I used, I couldn't log in. I found out that 'getent'
> didn't return any AD users.

From my cursory look over the code, there is an assumption that AD users
all named fully-qualified, e.g. user@ad.domain. @ is hard-coded in
multiple places. They seem to test it with SSSD.


-- 
/ Alexander Bokovoy

