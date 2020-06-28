Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A920C90C
	for <lists+samba-technical@lfdr.de>; Sun, 28 Jun 2020 18:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3st9TUIvKdT+/cCjYCDS4K4cC6u6A/EP3Bb+ofK9wKY=; b=5PXoUCqoD5MmWzGPkVRrqr3OVH
	ZTIG9n1kij6wAdXjSabmVFVYsMk2VOAN49krUwHzikjqPmdZs4f0O1/7hcG7HW2v2joclf/1MCGWr
	12seftQ6dgGGqnH30HTBtKBZ5X8JeB4Dw501GUgUnuWntsBWLznR7gGqdvkPccFuYm18TgsuRFL7s
	PC83U7Sj7Ac6OjxnyRDhSWK/ptjOQfozTZosoeAljSYggXe4cHOPiGMUddvFjzUMq0pkCFf6R2k0m
	SwVR1nCiZSQL6pyJ4KNuXqQhPPfqP4FkIFA8BwtB6X0xn+lZe/rnnjMYVa4xM7yv96c4ila+Apkt1
	JPTrSDsw==;
Received: from localhost ([::1]:39256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jpaY9-002Ukh-Nk; Sun, 28 Jun 2020 16:53:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33022) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpaY4-002UkZ-1R
 for samba-technical@lists.samba.org; Sun, 28 Jun 2020 16:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=3st9TUIvKdT+/cCjYCDS4K4cC6u6A/EP3Bb+ofK9wKY=; b=0b/YsV5gIXjJQem/ZAO8Q03L2K
 jyRSnfxFhRNX79FtflF7K906Pxhz7voBg/oNtwHmdngi14WMq1jzj0sD8nsvL9sIax5ddwaT3scgz
 cGQdUaJ0RbfTrPrQoKGiwKuLlN2KEYZdGhFMTgZa5WNjGVwpCwTrTck0pWF/xRaj1388EgC/EnZpy
 sRWYWF3XFAL4T91ZavwiI19BVeE7VT3Xi+29UeMWP995m24+5KdmW8R05TJ6V9iQXwkW5G6mcLEWG
 CwXLRT6Si4NMdLfAgMbnXMm3wJFsr+U5FLrmnSM2RFxShIhR2YVVwoL2NzWXvPLuMWhPoqJYhTdWe
 siPR4zFSLwmzm5JHvzao4KSlCCJ2uaNrigsu1t8bv51fdYM7Zdh+tTpGmGx/jRSXRTQfX1bEwnKPo
 0oBDlX4wWxzpdjHLhI0O7g223WhdXOdf10sappu5P973M73uYE06ZXXD34u3TSJY4LJi4OsUbxEZM
 UUuynnBywneNZb86teAygisj;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jpaY3-0005Nr-0N; Sun, 28 Jun 2020 16:52:55 +0000
Date: Sun, 28 Jun 2020 19:52:52 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC Week 4 Progress
Message-ID: <20200628165252.GA25598@pinega.vda.li>
References: <CAH72RCXajQj9ZgOuLphOmY8MseOZuXdUCTtNTKWWKg=XGRXAsA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH72RCXajQj9ZgOuLphOmY8MseOZuXdUCTtNTKWWKg=XGRXAsA@mail.gmail.com>
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
Cc: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On su, 28 kesä 2020, hezekiah maina wrote:
> During the week I worked on the following:
>    Forest Management
>    DNS Management
>    Group Management
> Repo: https://gitlab.com/HezekiahM/samba-ad-dc/-/tree/develop


Thanks, Hezekiah.

Please note an issue filed by Cockpit maintainers:
https://gitlab.com/HezekiahM/samba-ad-dc/-/issues/1

Do you have any problems, questions?

I think we should start to provide automated package builds so that
people could try the package. Let's look at it next week.

-- 
/ Alexander Bokovoy

