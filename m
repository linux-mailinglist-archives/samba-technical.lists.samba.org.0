Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B1C1F4F8F
	for <lists+samba-technical@lfdr.de>; Wed, 10 Jun 2020 09:48:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=a4ws+azSuF5WhbV6VKLQpJ1VI7EBM+m9JMa9COY84q0=; b=wo1T9LXbEEn8cHVBUcufsFFFLk
	9Q35rl+UmEWGZuGXPn0saOTcdWDIdF3GmwgaQMJ3L0xKQGqvY/nZ9E1Yzh4Sd7t41vs6MmKnVGvce
	UImJZwq77ndBSTaOTOqX+U2qjWAyeq5jqmgY+TA/4bbMECkmXEV+vuyd5nOIgsAoCEXgT3GGEM8U8
	NZ2dCOe7SIWYPfnSk7LCyRw6OdfnGoIPBoo4l2LlD0tj4S3hOIqxgArHW5hELNzqO/WmiQnyDDp9F
	+OC9MPJENousCxBpLneRQLbcIT07rOXuf5WF8LlV1Z4Py3H5+HYv9rxnLFk3SrwT5COZV3tj6QZt1
	wI8ok3og==;
Received: from localhost ([::1]:22744 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jivTc-009iKE-LT; Wed, 10 Jun 2020 07:48:48 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46202) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jivTX-009iK7-HG
 for samba-technical@lists.samba.org; Wed, 10 Jun 2020 07:48:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=a4ws+azSuF5WhbV6VKLQpJ1VI7EBM+m9JMa9COY84q0=; b=iXSKhfZ48NRdWJK1wxDvnaCSpg
 IFMts/gvc+Em+36fS179/ewaWXgG18ReB9WrT6u4qel3xW7DduUyQZRyM+Dz7PpzzhacCcTfhm27f
 ApOckVxRLwcpL7V8XjiLj7NTb7xBkKIHzbLZJLP5MAeQ4zwBfqBBFsWLkzf3iuzT9fvIE1gUuOU15
 4uZbVc4ua3x7m7RZp+AYxDH9OCfHWM3aqyr2Ws97+FNqprNJIkMKWATEktk168vRcmma0AMXFlvZY
 jzEmA4QkS9cYTI4cdQfA5rd1wdlneMR2YhtCdwr/V+AfUscUZSzTDgnEWHQg8X4ghmYVdHCJ0uiVW
 qaOeBGzUVKNw9IKNTgOg8JdKBuQcmnHx7IJIPUooPd/Ge3Db4u6w1UvuY+TtWaUuVrXvsTGfoI2YQ
 hTn3Kk0qgrueO5CX1cDRXKGwpQ9oBr5xKFY+ir+vC/hhANKgKVYM8xp+sGxdKIvh0KbrXTcvpmfrl
 bvOyeU5V5I1n/uMA1LXZdZvX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jivTW-0005ex-6V; Wed, 10 Jun 2020 07:48:42 +0000
To: Jeremy Allison <jra@samba.org>, Stefan Metzmacher <metze@samba.org>
Subject: Re: Accidential push of patch was: [SCM] Samba Shared Repository -
 branch master updated
Date: Wed, 10 Jun 2020 09:48:40 +0200
Message-ID: <2513660.ODyUIGKhDg@magrathea>
In-Reply-To: <13e042a2-4253-e2ee-6118-63c92400298f@samba.org>
References: <20200609172503.C9CF014037C@sn.samba.org>
 <20200610055428.GA24503@jeremy-acer>
 <13e042a2-4253-e2ee-6118-63c92400298f@samba.org>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wednesday, 10 June 2020 09:42:26 CEST Stefan Metzmacher wrote:
> I think we should revert b458f8fbb7febf3584fa648128b4e1dc764059f7,
> there will be better ways to avoid the kinit overhead.

I've pushed a revert to autobuild with your RB+ :-)


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



