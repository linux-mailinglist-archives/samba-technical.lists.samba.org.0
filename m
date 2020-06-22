Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B77F203625
	for <lists+samba-technical@lfdr.de>; Mon, 22 Jun 2020 13:50:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ckEBZu/lrUjX1/iwYMWpa67bLMBiBaA+aWI3QDX7IIE=; b=SXf1KyOD0z10LfqEEhlDEwfRcY
	x8akIzT9kFp+e1URZ87HoTmNbu+XWedWbDevLNSQBXVe85m38qU/4Vg57d6faHwAK0kGC8kWA8usc
	4Dj17owIS9mSldJXzSphbsUhwRFEd8tfHtpFNAy/HefOamhRbtjvyiCYsPj0MD8/0FlMeVOp56afq
	sXaewZPZf+h7ZxISfqdCFWFrOXc9WeKjhoGXkiICYMtP2yBwm0MK6NMzMmuYXUg2Xaw3a/WpjHX1m
	U+zYjKk4jKAc1EVnDecKQM/h46bHVLZTJ8i1ydk3NTt2qkJp0TUlDYnpMYnFFa9cpaPdwO1MBPiIn
	E2PpMtow==;
Received: from localhost ([::1]:35728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jnKx9-001mdU-5y; Mon, 22 Jun 2020 11:49:31 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39378) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnKx3-001mdN-Ae
 for samba-technical@lists.samba.org; Mon, 22 Jun 2020 11:49:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=ckEBZu/lrUjX1/iwYMWpa67bLMBiBaA+aWI3QDX7IIE=; b=2DzqE/wwj8pWKwx0cH3fsgFpOX
 rkDDb/3IUlBXlb+WAh4qO4HJxRLuZuBqaMGCejjOElKukLY3ePm+OJ0sQupAV3Mtlo2WwMD2BHKN5
 0AX+WuM91O55HVyE2issMzmVN/Cak2l4CF+PY0VmWfF8HGU7SeKkPMrkxt5ynUfXYAN1g0t/Rh9Iy
 Wj4mHhOclThXYf05LX7UlnGQeE+/Mb+RaLmqfgJHtc45tbd2cHQgc2k8Unh/7i6G+aF95BYgw2FpM
 CG/5TV1cpcSTaVKtOVVTS9fr3vjDF4yKgADsTPSMTDikTR8+BrfIdnqDgEX1pNPa0KmTOqkmfqg0a
 oV0KZ9lC3gt7S6a5OZ9cGbQlMjzNZffk9cyBb+SAmbTHj/diHVJFd3b9GtHmhaslLEOq1AzTzo0ZZ
 U7BWlpN9vtW4w8054ccU5QeN9EVaMFJC3/nrPodY8RDyzQ0aQZePbKCMig1/Xk0567gNa6rkJW51i
 58Oeskv2FbrN+1WqycqUkc+h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jnKx0-0008K8-PV; Mon, 22 Jun 2020 11:49:22 +0000
Date: Mon, 22 Jun 2020 13:49:21 +0200
To: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Subject: Re: GSoC: Week 3 Progress Update
Message-ID: <20200622134921.1e7347ab@samba.org>
In-Reply-To: <20200622100601.GK3036357@onega.vda.li>
References: <CAH72RCU=2HPWJHjgtMFx7wM061n-Jjo7aYRinxLPDtq8fo-OrA@mail.gmail.com>
 <20200622100601.GK3036357@onega.vda.li>
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
Cc: hezekiah maina <hezekiahmaina3@gmail.com>, Alexander Bokovoy <ab@samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 22 Jun 2020 13:06:01 +0300, Alexander Bokovoy via samba-technical wrote:

> > Last Week's changes are in the develop branch of this repo:
> > https://gitlab.com/HezekiahM/samba-ad-dc  
> 
> Thank you, Hezekiah!
> 
> I made a short gallery of screenshots here:
> https://www.samba.org/~ab/samba-ad-dc-cockpit/

This looks like really nice progress - well done Hezekiah and mentors :)

Cheers, David

