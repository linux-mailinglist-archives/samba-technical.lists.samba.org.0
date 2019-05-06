Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529741433A
	for <lists+samba-technical@lfdr.de>; Mon,  6 May 2019 02:35:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=UzLl+PG93IsAzuKk9c/z+gd8kjArR9wy8Zxbpd1pjng=; b=g74ZTSX4u9wCmBldDeb0wk2k7X
	fuE1HXyvHnm43c92d4J6iTofqZOSCQLcpZO6le60fpz7hM4gLBdGgm5Pnq55Gpi7+0aA3mWVp1UZt
	ezcIfLnqJGY5JPnNPlby0QMkVexZ8gftn/z89tZwv7TI7/a65Aoa1uIyae1syZMxUANA+Z56mNBbM
	yvTy+Qdlg16qW6EzYKTORhhEm/pzgoA3d91QVNvxQH94G48kHnp5M7N9U4xDnd0C/aiM7t97a1+rM
	N6jM9v0dEKSPZRw3FeUOu2sILi7f3KBasVeadyQTAgGufzcEpGPp3hB5fKLgNm5VXN2BO8cYj41Id
	gpMmr8tQ==;
Received: from localhost ([::1]:51728 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hNRbB-002VEe-Mr; Mon, 06 May 2019 00:35:17 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:50876) 
 by hr1.samba.org with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim) id 1hNRb0-002VEX-PH
 for samba-technical@lists.samba.org; Mon, 06 May 2019 00:35:09 +0000
Received: from [IPv6:2404:130:0:1000:c474:9b54:b7c9:4153] (unknown
 [IPv6:2404:130:0:1000:c474:9b54:b7c9:4153])
 (Authenticated sender: garming@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 6854D81033; 
 Mon,  6 May 2019 12:35:00 +1200 (NZST)
Subject: Re: [coverage] enable coverage in autobuild.py and publish html
 report to gitlab pages with ci
To: "joeg@catalyst.net.nz" <joeg@catalyst.net.nz>,
 samba-technical <samba-technical@lists.samba.org>
References: <13fdf77e-b5a7-d6d9-7f24-bca982c19812@catalyst.net.nz>
Openpgp: preference=signencrypt
Message-ID: <a399ef75-1487-4fc7-d051-11d77182c65c@catalyst.net.nz>
Date: Mon, 6 May 2019 12:34:56 +1200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <13fdf77e-b5a7-d6d9-7f24-bca982c19812@catalyst.net.nz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Garming Sam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Garming Sam <garming@catalyst.net.nz>
Cc: Andrew Bartlett <abartlet@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

The coverage is currently using LCOV/GCOV for C code, but it would be
interesting to also see Python coverage which would also pick up tests
that aren't run. I don't know if anyone has any experience with code
coverage in Python, if anyone has any suggestions in this area it would
be well appreciated.

Cheers,

Garming

On 6/05/19 11:16 AM, joeg--- via samba-technical wrote:
> Hi team,
>
> I am currently trying to add a new option `--enable-coverage` to
> `autobuild.py`,
>
> so we can enable this option and publish the html report to gitlab pages
> automatically with gitlab ci.
>
> (Actually we did have coverage report 7 years ago, according to Andrew
> Bartlett.)
>
>
> I already got a decent report here:
> https://samba-team.gitlab.io/devel/samba/
>
> The pipeline/branch which generated this report is here:
> https://gitlab.com/samba-team/devel/samba/pipelines/59682470
>
>
> I am still polishing things so the report may not be accurate, but happy
> to share this report in advance.
>
> If any one discovers problems from the above report or has fancy ideas,
> please let me know.
>
> New tests are welcome to increase the coverage percentage from now on:)
>
>

