Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB0CCA16A
	for <lists+samba-technical@lfdr.de>; Thu,  3 Oct 2019 17:54:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=21SC7M6Qsq29FAfXuqM6tc1Ri/cyz7SJFXlEGCfQhRY=; b=sJWrgdAWem32zvOhb3yMGMPU6N
	wBsYWePe7srmH20BlO8O0k4E0En00KR8OyQ6OLZsvipEncpVeeXzTiZ+NteEunqkhy1lZUoCDVtWU
	vcKkQGz6VJgs0uidvanDe+zo+3Kt4gvt8+g3zlgF26+jsbDFpwUV+O/OWSGo1Ugq7P5RmkqTo0Uzn
	bhl57pxAFAQd/11BIX2FrsDYCTjeomiBrsgZGa1eaGyiqQfGOJNcLSRgOgdb34IJdUYy1SYbVy6s3
	l4qK2YwF0YJZvHX9kAIaictChqqiDCU3L1P9Rtmq2hKdMAue/SSEz0siSU/IZzdiuaWpFcnjutzG6
	q0KJ8XNA==;
Received: from localhost ([::1]:43026 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iG3Pu-000ny9-32; Thu, 03 Oct 2019 15:53:22 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61308) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iG3Pq-000ny2-Af
 for samba-technical@lists.samba.org; Thu, 03 Oct 2019 15:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=21SC7M6Qsq29FAfXuqM6tc1Ri/cyz7SJFXlEGCfQhRY=; b=ZDv2Qf5X7zCNwA+gB2/mmJAYlu
 O5XywKv/ULvLZISFCYsOFPylB/CRfp9w/H26R/37uXvDYgMFMbqD/lmaLvG7e7BBUZiVtk+Tiy45k
 k1q90ljIWzMtIecZdKMI+FInhNG48JIvCcxVNpqUSiljR2jtxPt+5JQ5v7UIW+O78L9Q=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iG3Pp-0007mV-Gs; Thu, 03 Oct 2019 15:53:17 +0000
Date: Thu, 3 Oct 2019 08:53:14 -0700
To: Andreas Schneider <asn@samba.org>
Subject: Re: Samba and GnuTLS
Message-ID: <20191003155314.GA163446@jra4>
References: <2061554.bL4SkraOkk@magrathea>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2061554.bL4SkraOkk@magrathea>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Oct 03, 2019 at 11:04:46AM +0200, Andreas Schneider via samba-technical wrote:
> Hi,
> 
> I wrote a blog post about Samba and GnuTLS:
> 
> https://blog.cryptomilk.org/2019/10/02/samba-and-gnutls/
> 
> 
> There is also a news about it at Phoronix:
> 
> https://www.phoronix.com/scan.php?page=news_item&px=SMB3-Faster-Encryption-Samba

Wow Andreas, great writing ! We should also link
to your blog entry from the news section on samba.org.

Thanks !

Jeremy.

