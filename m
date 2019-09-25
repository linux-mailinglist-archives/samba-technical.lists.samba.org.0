Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 805F2BE54E
	for <lists+samba-technical@lfdr.de>; Wed, 25 Sep 2019 21:03:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=UmVzunZaun/6YvCStnd0UPn0y+EyKyMC8uXG8FwwZh8=; b=rA2J7o/Ga0Rdgmmh2DczdtIx/h
	np7rzF4pyn3W7X/W8GfFYqfm1LfnOT67KhoyIpQfbonwoUOgsEU3wUlT6OeGSv0HOcRFqzC4JOb1h
	7D4WMpnLI3QYOam3mQdU8UEQmwdXZk6viuL9w8ozYs2wVDyzBXuoqaobTe3e8eifXyO6mvDLJknXq
	B36GVo385ne3TZmeW/bbfWiZPjrOzDV8CEEfydAro6Q1UaJo0p2vOKPyU/vnC6oB8JY1K9sA27ZO2
	hpFwW6DmkKxIYY0cOc+8o71VgtykZ2YEqglC1T3pZMyyIXqLmq0IJnLi3v5sdt2JyU3fDdwaac9ZR
	WbbmKJ9g==;
Received: from localhost ([::1]:63110 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDCZP-008cbR-Mu; Wed, 25 Sep 2019 19:03:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15848) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDCZL-008cb8-O6
 for samba-technical@lists.samba.org; Wed, 25 Sep 2019 19:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=UmVzunZaun/6YvCStnd0UPn0y+EyKyMC8uXG8FwwZh8=; b=ODOz5PfUGk8GqcgO6qofSUsRbC
 He09dfXfYp5gBcQZyEvTR2CJavGu8CLx/Hzpxi29KQRcdBHvShoyyeyX72JFHZxa1lmTb3ZXOU/lu
 umvx/sPuLWS2JDk13t1nQXEhHeV2TxV1GqE8MrFEYiNV7zBaZKmei/Prk5CKxKPdZJZw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDCZJ-0003qT-5x; Wed, 25 Sep 2019 19:03:17 +0000
Subject: Re: Writing a Windows Explorer plugin that uses a Vendor Specific
 FSCTL to access extra metadata about files from Samba
To: Richard Sharpe <realrichardsharpe@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>
References: <CACyXjPwcp54B_LCJ_2gnXHZ63OvkTkb6MM+CX2GRXteRi7wyCA@mail.gmail.com>
Message-ID: <3da181cd-74ac-09ca-d75d-f23adb159ec5@samba.org>
Date: Wed, 25 Sep 2019 12:03:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CACyXjPwcp54B_LCJ_2gnXHZ63OvkTkb6MM+CX2GRXteRi7wyCA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 9/25/19 11:53 AM, Richard Sharpe via samba-technical wrote:
> Hi folks,
> 
> Over the last few weeks, as a part-time activity, I have been writing
> a Windows Explorer plugin that uses a Vendor Specific FSCTL to
> communicate with a Samba VFS module to retrieve some of the plethora
> of extra metadata we have in our file system.
> 
> It also allows us to set some of that metadata as well.
> 
> Since knowing that something can be done is often the most important
> step in doing that thing, I thought I would mention it.
> 
> I hope to find the time to provide a tutorial on this subject as well,
> probably on the Samba Wiki.

yes, please share as much as you can, ideally the source code, but some
tutorial on the wiki would also be nice. :)


Thanks!
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

