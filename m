Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5905EEF0D2
	for <lists+samba-technical@lfdr.de>; Mon,  4 Nov 2019 23:55:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QPT/Pz8QJnSAQfL1sYccLtRyAfUlvvwB4Z+bNqzyKKE=; b=JgIzWFH8a9cI8NtnxDegSPUhEn
	sz/DNOm3g4dlsSevJ20+WX1K9g+RngQHrHDXyMg2lC+vcYLN6qW//kQ1DIhRrOUPjj65OtFg3t/t6
	eMbBvuIWdqJhvVLqBuBD3BJAbtYURHe4aPdJmMrddIl8290bveeps9GSVL6lub1/HpFb4eRVuwrds
	XsLGkJK0MgVig5/+8Sqy6w4x28RDGVDbCplDBi2yuL/Qig2S7h5I6O+NKzE++fVtmf71VGXHGTm4U
	OLp2jSglxjB+OM8iamQNbt7Vecr183SD9h3kH5aYN1NMaOUyxBIMDTP6olZrpk2stIodqEcGQYoy6
	RwbIDWzA==;
Received: from localhost ([::1]:35100 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iRlF2-006XuS-KW; Mon, 04 Nov 2019 22:54:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:10490) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRlEx-006XuL-Qa
 for samba-technical@lists.samba.org; Mon, 04 Nov 2019 22:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=QPT/Pz8QJnSAQfL1sYccLtRyAfUlvvwB4Z+bNqzyKKE=; b=lyyX/XlzEh8xFRVd4+c/BdLYUt
 dGakZgmVnIyMt7Nv4VNNCJMr0B/gde/z4IePxHHPTqQZAxDu8/byQbnOJwQpl+KrddLm5Xh7pSiKo
 NqzQtAESocNC7GPfgUe+Isjz/U64kG4BTXKJ2Rt60XGAogLkG77xgttCqcbyrmpuMk5yWF+kFclSy
 Yz1AqLVE9Cxv904uRmXbwehV91IE4/d1ImLq1EJ5ZDHfjuBKXP0Js53gc8lUhCxMoAyBPRtmwLGUC
 /WAgmqebj3lkuTOqRMRd5kry6G+z/oBPzn5NXmCsszkW2FqS/O1h/d0HVUf2mBY9VirYOkC3Yw5s/
 74srDrmcjNC9MDF5+DyXPZaGamP6Tk5sR9MLdVEAXNs73DX3OkS2AKf58ulTZe5YIk5+DG7Wbl2SV
 Tqp+qaeM6PNCBqHSW+16KZ9KX7GyUsPZGqp0rgeoCyytKfTzIvgBlH21/4nzUnURbYPL3JeDibuUQ
 IAtNfnvqGoSjkSCsjQRZK5QN;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iRlEx-0003Oj-3F; Mon, 04 Nov 2019 22:54:27 +0000
Date: Mon, 4 Nov 2019 14:54:24 -0800
To: Jones Syue <jonessyue@qnap.com>
Subject: Re: [PATCH] s3:libads: Fix mem leak in ads_create_machine_acct
Message-ID: <20191104225424.GD116707@jra4>
References: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEUGjKjmFJFmz+Wts1UMZaHXKEEpeuY7UmB52H_aiQU=HS11sA@mail.gmail.com>
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
Cc: Samba Technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Nov 01, 2019 at 03:59:54PM +0800, Jones Syue via samba-technical wrote:
> Hello list,
> 
> This patch fix memory leak in ads_create_machine_acct,
> samba-4.10.9 included Bug 13884 and introduce this,
> please help review and push, thank you.
> 
> https://bugzilla.samba.org/show_bug.cgi?id=13884

Merged as a58c93318d592d931d232a1a25e37abdd27a825d.

Thanks !

