Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 626712648AC
	for <lists+samba-technical@lfdr.de>; Thu, 10 Sep 2020 17:25:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=R0Dwz8+trpjeuT5JdZlPtQm7mi9N7Me1w5VXQutqmVM=; b=0MxzOA/2DnEtg1GqHVsV8uSKe9
	jxu9jP/SpMN7VgGhOGd4HoWv4A+2rXIgyiW1NVJWxt2cRAc0Psj1f6IwEPn/H9kArFIF6iII6S6mc
	GBz06Nflzx/VeE/Lvf5nl2Ron1byuuwQ+Nrk/oK4oMrbxwhchq+6YU2ybou0uyj0ANZwli5MitzjQ
	rZUg2jnXwdljfY7jYLeYFEFqEl6NpNg11lC+BcdwYpwXlw/Am86JI33qaU6B/xNQE4zT+BhGr0n9+
	ie08JjumrLiZblMYiLXO/W/4otfa8wQVYkScffJYxMo3VHOFj0mtSAeNiGue5FcWagbx39L+9LzfB
	52s9yjaA==;
Received: from localhost ([::1]:24430 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kGORL-004uK4-Lu; Thu, 10 Sep 2020 15:24:47 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41876) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGORH-004uJu-9A; Thu, 10 Sep 2020 15:24:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=R0Dwz8+trpjeuT5JdZlPtQm7mi9N7Me1w5VXQutqmVM=; b=3lA7hG/5acBWJkS2TGh3mZ3S34
 qYTYdezki+y4++p+aBYyD2hCGmAxAwgk7j3uvrpKdwZmkaPwxTLaVmuS/LtdnMtcpHOFqF+gTJPPE
 dMVRvh2LkGMfU/sxIbOurKabkCmLP4LyD0qs+NhODCK74aueSC73PjtJwToueCbO/mGeHiHZQeMWR
 3cAPw9fPJwdu4WRO7nwwLki4GXZ8ccww6jlDJrqhvSE9Y/z2OtTa9S/FiuhFrwi9OHWEHsUx0fcpw
 dl5jx3AQWJz0PjKkWsSePs5UwlRN6jh5oNtkc0smeGjvRcBSXvfMptkxlMcEDapfJ9TG2UG3NVgfN
 i3mDzzF4v+ynQQS6tBAp1JIHTGlZsbf1vQpGFiPS4gM8QC3OjkLyAkR00J5yC2nw86JROw9DXuLPQ
 ChpAxgRcDWU4rFhSt2kZeMnJIEa0k9eV1BP1U702O9rR38IkZ3+xKSdByCD0jdPMQ/Nz6Qq2TFrPc
 QPvce0taeSbGmSjLB2dWTRxo;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kGORG-0007pC-Md; Thu, 10 Sep 2020 15:24:43 +0000
Date: Thu, 10 Sep 2020 08:24:37 -0700
To: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Where is Andreas?
Message-ID: <20200910152437.GB896342@jeremy-acer>
References: <3876475.E0Xr0IWvUN@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3876475.E0Xr0IWvUN@magrathea>
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
Cc: samba-team@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 10, 2020 at 01:11:53PM +0200, Andreas Schneider via samba-technical via samba-team wrote:
> Hi,
> 
> tomorrow is my last work day, after that I'm on parental leave till October 
> 19th. We will go to the alps and the baltic sea to relax and take care of our 
> daughter.
> 
> If there is something urgent and burning, let it burn. I will clean the ashes 
> after I got back :-) ;-)

Enjoy your well-earned parental leave ! If you want to clean
up ashes, California has plenty for you to do :-).

Jeremy.

