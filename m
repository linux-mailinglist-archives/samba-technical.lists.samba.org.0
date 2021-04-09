Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEA335A058
	for <lists+samba-technical@lfdr.de>; Fri,  9 Apr 2021 15:51:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=6SKZXkj1dOupDzTeBS0RGjZ1ldXzD2FEj72RpUV6y7A=; b=lZ2VwUpYT7ibAYmk5gkdD5Oyza
	N36zxfxalHj3Mz22Sjjxh5VDRWl2DwY89d+EjtRLLf8w3y448RgUfG9xvdXLwcwe0YB4DOUmTE8nU
	+WRu3NdjQIHpGF4x4z7VHY9pxeNehQ9CgZd9W7YTZXVqIWiiYcxOb+Oy7FkM125jDNsqXd1QlIjvf
	U9VNq3olVBEE6VuJXiGkV3JxqEpJ+xFjdcFL+V1uB0roTfYrlmW5BWkcb8lCu2brCkajgqWVMizFQ
	FpUBj93rxUIuJvVzCgazJgGOlZI7nAcoJYOlAK7/oRbsVywafpH6gEf/JTs7Cago4JAisfsrtO4ki
	R8KZxPYw==;
Received: from ip6-localhost ([::1]:64708 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lUrWz-00Aei8-IZ; Fri, 09 Apr 2021 13:50:41 +0000
Received: from milliways.cryptomilk.org ([2a01:4f8:201:2294::2]:42408) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lUrWs-00Aegc-Rl
 for samba-technical@lists.samba.org; Fri, 09 Apr 2021 13:50:37 +0000
Received: from milliways.cryptomilk.org (localhost [127.0.0.1])
 by milliways.cryptomilk.org (Postfix) with ESMTPS id BA8A3402DD9B;
 Fri,  9 Apr 2021 15:33:37 +0200 (CEST)
Received: from magrathea.localnet (unknown
 [IPv6:2001:a62:142d:8c01:b46e:1280:9912:bc8])
 by milliways.cryptomilk.org (Postfix) with ESMTPSA id 7CD51402DD9A;
 Fri,  9 Apr 2021 15:33:37 +0200 (CEST)
To: samba-technical@lists.samba.org
Subject: Re: Setting up QtCreator for Samba development
Date: Fri, 09 Apr 2021 15:33:37 +0200
Message-ID: <3897980.lXEOcWmc3A@magrathea>
In-Reply-To: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
References: <502aedfa-7290-7e9b-11fe-06d2cfe59bb5@basealt.ru>
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
Reply-To: Andreas Schneider <asn@cryptomilk.org>
Cc: Igor Chudov <nir@basealt.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 9 April 2021 09:57:53 CEST Igor Chudov via samba-technical wrote:
> Hello colleagues!

Hi,
 
> I've used Vim+grep for quite some time but Samba codebase is large and
> I'm trying to find a way to increase my productivity. Could anyone
> possibly share project file for QtCreator for Samba?

I think most people either use (neo)vim or emacs.

What I use and which helps me a lot is:

https://github.com/ycm-core/YouCompleteMe
https://github.com/yggdroot/leaderf


	Andreas

-- 
Andreas Schneider                 asn@cryptomilk.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



